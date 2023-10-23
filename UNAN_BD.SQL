
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

