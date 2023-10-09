﻿using API.Controllers;
using CAPA_DATOS;
using CAPA_DATOS.Services;
using MailKit;
using Org.BouncyCastle.Security;
using System;
using System.Collections.Generic;
using System.Text;


namespace CAPA_DATOS.Security
{
    public class Security_Roles : EntityClass
    {
        [PrimaryKey(Identity = true)]
        public int? Id_Role { get; set; }
        public string? Descripcion { get; set; }
        public string? Estado { get; set; }
        [OneToMany(TableName = "Security_Permissions_Roles", KeyColumn = "Id_Role", ForeignKeyColumn = "Id_Role")]
        public List<Security_Permissions_Roles>? Security_Permissions_Roles { get; set; }
        #region  metodos
        public object SaveRole()
        {
            if (this.Id_Role == null)
            {
                this.Save();
            }
            else
            {
                this.Update("Id_Role");
            }
            if (this.Security_Permissions_Roles != null)
            {
                Security_Permissions_Roles IdI = new Security_Permissions_Roles();
                IdI.Id_Role = this.Id_Role;
                IdI.Delete();
                foreach (Security_Permissions_Roles obj in this.Security_Permissions_Roles)
                {
                    obj.Id_Role = this.Id_Role;
                    obj.Save();
                }
            }
            return this;
        }
        public object GetRolData()
        {
            this.Security_Permissions_Roles = new Security_Permissions_Roles()
            {
                Id_Role = this.Id_Role
            }.Get<Security_Permissions_Roles>();
            return this.Security_Permissions_Roles;

        }
        public List<Security_Roles>? GetRoles()
        {
            var roles = this.Get<Security_Roles>();
            foreach (Security_Roles role in roles)
            {
                role.GetRolData();
            }
            return roles;
        }
        #endregion
    }
    public class Security_Users : EntityClass
    {
        [PrimaryKey(Identity = true)]
        public int? Id_User { get; set; }
        public string? Nombres { get; set; }
        public string? Estado { get; set; }
        public string? Descripcion { get; set; }
        public string? Password { get; set; }
        public string? Mail { get; set; }
        public string? Token { get; set; }
        public DateTime? Token_Date { get; set; }
        public DateTime? Token_Expiration_Date { get; set; }
        [OneToMany(TableName = "Security_Users_Roles", KeyColumn = "Id_User", ForeignKeyColumn = "Id_User")]
        public List<Security_Users_Roles>? Security_Users_Roles { get; set; }
        #region  metodos
        public Security_Users? GetUserData()
        {
            Security_Users? user = this.Find<Security_Users>();
            if (user != null && user.Estado == "ACTIVO")
            {
                user.Security_Users_Roles = new Security_Users_Roles()
                {
                    Id_User = user.Id_User
                }.Get<Security_Users_Roles>();
                foreach (Security_Users_Roles role in user.Security_Users_Roles ?? new List<Security_Users_Roles>())
                {
                    role.Security_Role?.GetRolData();
                }
                return user;
            }
            if (user?.Estado == "INACTIVO")
            {
                throw new Exception("usuario inactivo");
            }
            return null;
        }
        public object SaveUser(string identity)
        {
            if (!AuthNetCore.HavePermission(PermissionsEnum.ADMINISTRAR_USUARIOS.ToString(), identity))
            {
                throw new Exception("no tiene permisos");
            }
            try
            {

                this.BeginGlobalTransaction();
                if (this.Password != null)
                {
                    this.Password = EncrypterServices.Encrypt(this.Password);
                }
                if (this.Id_User == null)
                {
                    if (new Security_Users() { Mail = this.Mail }.Exists<Security_Users>())
                    {
                        throw new Exception("Correo en uso");
                    }
                    this.Save();
                    new Tbl_Profile()
                    {
                        Nombres = this.Nombres,
                        Estado = this.Estado,
                        Correo_institucional = this.Mail,
                        Foto = "\\Media\\profiles\\avatar.png",
                        IdUser = Id_User

                    }.Save();
                }
                else
                {
                    if (this.Estado == null)
                    {
                        this.Estado = "ACTIVO";
                    }
                    this.Update("Id_User");
                }
                if (this.Security_Users_Roles != null)
                {
                    Security_Users_Roles IdI = new Security_Users_Roles();
                    IdI.Id_User = this.Id_User;
                    IdI.Delete();
                    foreach (Security_Users_Roles obj in this.Security_Users_Roles)
                    {
                        obj.Id_User = this.Id_User;
                        obj.Save();
                    }
                }
                this.CommitGlobalTransaction();
                return this;
            }
            catch (System.Exception)
            {
                this.RollBackGlobalTransaction();
                throw;
            }

        }
        public object GetUsers()
        {
            var Security_Users_List = this.Get<Security_Users>();
            foreach (Security_Users User in Security_Users_List)
            {
                User.Security_Users_Roles =
                    (new Security_Users_Roles()).Get_WhereIN<Security_Users_Roles>(
                         "Id_User", new string?[] { User.Id_User.ToString() });
            }
            return Security_Users_List;
        }
        internal bool IsAdmin()
        {
            return Security_Users_Roles?.Find(r => r.Security_Role?.Security_Permissions_Roles?.Find(p =>
             p.Security_Permissions.Descripcion.Equals(PermissionsEnum.ADMIN_ACCESS.ToString())
            ) != null) != null;
        }

        internal object RecoveryPassword()
        {
            Security_Users? user = this.Find<Security_Users>();
            if (user != null && user.Estado == "ACTIVO")
            {
                string password = Guid.NewGuid().ToString();
                user.Password = EncrypterServices.Encrypt(password);
                user.Update();
                SMTPMailServices.SendMail("heldesk@password.recovery",
                 new List<string> { user.Mail },
                 "Recuperación de contraseña",
                 $"nueva contraseña: {password}", null, null);
                return user;
            }
            if (user?.Estado == "INACTIVO")
            {
                throw new Exception("usuario inactivo");
            }
            return null;
        }

        public object changePassword(string? identfy)
        {
            var security_User = AuthNetCore.User(identfy).UserData;
            Password = EncrypterServices.Encrypt(Password);
            Id_User = security_User.Id_User;
            return Update();
        }

        class Tbl_Profile : EntityClass
        {
            [PrimaryKey(Identity = true)]
            public int? Id_Perfil { get; set; }
            public string? Nombres { get; set; }
            public string? Apellidos { get; set; }
            public DateTime? FechaNac { get; set; }
            public int? IdUser { get; set; }
            public string? Sexo { get; set; }
            public string? Foto { get; set; }
            public string? DNI { get; set; }
            public string? Correo_institucional { get; set; }
            public string? Estado { get; set; }
        }
        #endregion
    }
    public class Security_Permissions : EntityClass
    {
        [PrimaryKey(Identity = true)]
        public int? Id_Permission { get; set; }
        public string? Descripcion { get; set; }
        public string? Estado { get; set; }
    }
    public class Security_Permissions_Roles : EntityClass
    {
        [PrimaryKey(Identity = false)]
        public int? Id_Role { get; set; }
        [PrimaryKey(Identity = false)]
        public int? Id_Permission { get; set; }
        public string? Estado { get; set; }
        [ManyToOne(TableName = "Security_Permissions", KeyColumn = "Id_Permission", ForeignKeyColumn = "Id_Permission")]
        public Security_Permissions? Security_Permissions { get; set; }
    }
    public class Security_Users_Roles : EntityClass
    {
        [PrimaryKey(Identity = false)]
        public int? Id_Role { get; set; }
        [PrimaryKey(Identity = false)]
        public int? Id_User { get; set; }
        public string? Estado { get; set; }
        [ManyToOne(TableName = "Security_Role", KeyColumn = "Id_Role", ForeignKeyColumn = "Id_Role")]
        public Security_Roles? Security_Role { get; set; }

    }


}
