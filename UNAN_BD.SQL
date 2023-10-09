-- DROP SCHEMA [security];
CREATE DATABASE UNAN_BD;
GO
USE UNAN_BD;
GO

CREATE SCHEMA [security];
-- UNAN_BD.[security].Security_Permissions definition

-- Drop table

-- DROP TABLE UNAN_BD.[security].Security_Permissions;

CREATE TABLE UNAN_BD.[security].Security_Permissions (
	Id_Permission int IDENTITY(1,1) NOT NULL,
	Descripcion nvarchar(100) COLLATE Modern_Spanish_CI_AS NULL,
	Estado nvarchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK_Security_Permissions PRIMARY KEY (Id_Permission)
);


-- UNAN_BD.[security].Security_Roles definition

-- Drop table

-- DROP TABLE UNAN_BD.[security].Security_Roles;

CREATE TABLE UNAN_BD.[security].Security_Roles (
	Id_Role int IDENTITY(1,1) NOT NULL,
	Descripcion nvarchar(150) COLLATE Modern_Spanish_CI_AS NULL,
	Estado nvarchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK_Security_Roles PRIMARY KEY (Id_Role)
);


-- UNAN_BD.[security].Security_Permissions_Roles definition

-- Drop table

-- DROP TABLE UNAN_BD.[security].Security_Permissions_Roles;

CREATE TABLE UNAN_BD.[security].Security_Permissions_Roles (
	Id_Role int NOT NULL,
	Id_Permission int NOT NULL,
	Estado nvarchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK_Security_Permissions_Roles PRIMARY KEY (Id_Role,Id_Permission),
	CONSTRAINT FK_Security_Permissions_Roles_Security_Permissions FOREIGN KEY (Id_Permission) REFERENCES UNAN_BD.[security].Security_Permissions(Id_Permission),
	CONSTRAINT FK_Security_Permissions_Roles_Security_Roles FOREIGN KEY (Id_Role) REFERENCES UNAN_BD.[security].Security_Roles(Id_Role)
);


-- UNAN_BD.[security].Security_Users definition

-- Drop table

-- DROP TABLE UNAN_BD.[security].Security_Users;

CREATE TABLE UNAN_BD.[security].Security_Users (
	Id_User int IDENTITY(1,1) NOT NULL,
	Nombres nvarchar(150) COLLATE Modern_Spanish_CI_AS NULL,
	Estado nvarchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	Descripcion nvarchar(500) COLLATE Modern_Spanish_CI_AS NULL,
	Password nvarchar(500) COLLATE Modern_Spanish_CI_AS NULL,
	Mail nvarchar(150) COLLATE Modern_Spanish_CI_AS NULL,
	Token nvarchar(500) COLLATE Modern_Spanish_CI_AS NULL,
	Token_Date datetime NULL,
	Token_Expiration_Date datetime NULL,
	id_agente int NULL,
	CONSTRAINT PK_Security_Users PRIMARY KEY (Id_User)
);


-- UNAN_BD.[security].Security_Users_Roles definition

-- Drop table

-- DROP TABLE UNAN_BD.[security].Security_Users_Roles;

CREATE TABLE UNAN_BD.[security].Security_Users_Roles (
	Id_Role int NOT NULL,
	Id_User int NOT NULL,
	Estado nvarchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK_Security_Users_Roles PRIMARY KEY (Id_Role,Id_User)
);


-- UNAN_BD.[security].Security_Users foreign keys

ALTER TABLE UNAN_BD.[security].Security_Users ADD CONSTRAINT Security_Users_FK FOREIGN KEY (id_agente) REFERENCES UNAN_BD.dbo.Catalogo_Agentes(id_agente);


-- UNAN_BD.[security].Security_Users_Roles foreign keys

ALTER TABLE UNAN_BD.[security].Security_Users_Roles ADD CONSTRAINT FK_Security_Users_Roles_Security_Roles FOREIGN KEY (Id_Role) REFERENCES UNAN_BD.[security].Security_Roles(Id_Role);
ALTER TABLE UNAN_BD.[security].Security_Users_Roles ADD CONSTRAINT FK_Security_Users_Roles_Security_Users FOREIGN KEY (Id_User) REFERENCES UNAN_BD.[security].Security_Users(Id_User);

GO
INSERT INTO UNAN_BD.[security].Security_Permissions
(Descripcion, Estado)
VALUES(N'ADMIN_ACCESS', N'ACTIVO');

INSERT INTO UNAN_BD.[security].Security_Roles
(Descripcion, Estado)
VALUES(N'ADMIN', N'Activo');

    INSERT INTO UNAN_BD.[security].Security_Permissions_Roles
(Id_Role, Id_Permission, Estado)
VALUES(1, 1, NULL);

INSERT INTO UNAN_BD.[security].Security_Users
(Nombres, Estado, Descripcion, Password, Mail, Token, Token_Date, Token_Expiration_Date, Id_Sucursal, id_agente)
VALUES(N'Admin', N'ACTIVO', N'', N'PxI/Pz8/Pz8/PwdSP2E/Pw==', N'admin@admin.net', NULL, NULL, NULL, NULL, NULL);

INSERT INTO UNAN_BD.[security].Security_Users_Roles
(Id_Role, Id_User, Estado)
VALUES(1, 1, N'Activo');

