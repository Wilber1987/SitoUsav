﻿using System;
using System.Collections.Generic;
using System.Text;

namespace CAPA_DATOS
{
    public class SqlADOConexion
    {
        private static string UserSQLConexion = "";
        public static SqlServerGDatos? SQLM;
        public static string DataBaseName = "UNAN_BD";
        public static bool Anonimo = true;

        static public bool IniciarConexion()
        {
            Anonimo = false;
            return IniciarConexionInLocal();
// problema 02 return IniciarConexionInServer();

        }
        static public bool IniciarConexion(string SGBD_USER, string SWGBD_PASSWORD, string SQLServer)
        {
            try
            {
                Anonimo = false;
                return createConexion(SQLServer, SGBD_USER, SWGBD_PASSWORD);
            }
            catch (Exception)
            {
                Anonimo = true;
                return false;
                throw;
            }
        }
        static public bool IniciarConexionAnonima()
        {
            try
            {
                Anonimo = false;
                return IniciarConexion();
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        static public bool IniciarConexionInServer()
        {
            try
            {
                string SGBD_USER = "";
                string SWGBD_PASSWORD = "";
                string SQLServer = "";
                Anonimo = false;
                return createConexion(SQLServer, SGBD_USER, SWGBD_PASSWORD);
            }
            catch (Exception)
            {
                SQLM = null;
                Anonimo = true;
                return false;
                throw;
            }
        }
        static public bool IniciarConexionInLocal()
        {
            try
            {
                Anonimo = false;
                return createConexion(".", "sa", "123");
           // problema 01  createConexion(".\\SQLEXPRESS", "sa", "123");
            }
            catch (Exception)
            {
                SQLM = null;
                Anonimo = true;
                return false;
                throw;
            }
        }

        private static bool createConexion(string SQLServer, string SGBD_USER, string SWGBD_PASSWORD)
        {
            UserSQLConexion = "Data Source=" + SQLServer +
               "; Initial Catalog=" + DataBaseName + "; User ID="
               + SGBD_USER + ";Password=" + SWGBD_PASSWORD + ";MultipleActiveResultSets=true";
            SQLM = new SqlServerGDatos(UserSQLConexion);
            if (SQLM.TestConnection()) return true;
            else
            {
                SQLM = null;
                return false;
            }
        }
    }

}
