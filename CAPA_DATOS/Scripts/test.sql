USE [HELPDESK]
GO
/****** Object:  Schema [questionnaires]    Script Date: 21/9/2023 22:06:32 ******/
CREATE SCHEMA [questionnaires]
GO
/****** Object:  Table [questionnaires].[Cat_Categorias_Test]    Script Date: 21/9/2023 22:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [questionnaires].[Cat_Categorias_Test](
	[id_categoria] [bigint] IDENTITY(20,1) NOT NULL,
	[descripcion] [nvarchar](180) NULL,
	[imagen] [nvarchar](250) NULL,
	[estado] [nvarchar](180) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Cat_Categorias_Test_id_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [questionnaires].[Cat_Tipo_Preguntas]    Script Date: 21/9/2023 22:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [questionnaires].[Cat_Tipo_Preguntas](
	[id_tipo_pregunta] [bigint] IDENTITY(29,1) NOT NULL,
	[tipo_pregunta] [nvarchar](180) NULL,
	[descripcion] [nvarchar](180) NULL,
	[estado] [nvarchar](180) NULL,
	[fecha_crea] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[editable] [bit] NULL,
	[descripcion_general] [nvarchar](500) NULL,
 CONSTRAINT [PK_Cat_Tipo_Preguntas_id_tipo_pregunta] PRIMARY KEY CLUSTERED 
(
	[id_tipo_pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [questionnaires].[Cat_Valor_Preguntas]    Script Date: 21/9/2023 22:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [questionnaires].[Cat_Valor_Preguntas](
	[id_valor_pregunta] [bigint] IDENTITY(129,1) NOT NULL,
	[descripcion] [nvarchar](180) NULL,
	[id_tipo_pregunta] [bigint] NULL,
	[estado] [nvarchar](180) NULL,
	[valor] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Cat_Valor_Preguntas_id_valor_pregunta] PRIMARY KEY CLUSTERED 
(
	[id_valor_pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [questionnaires].[Pregunta_Tests]    Script Date: 21/9/2023 22:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [questionnaires].[Pregunta_Tests](
	[id_pregunta_test] [bigint] IDENTITY(1663,1) NOT NULL,
	[estado] [nvarchar](180) NULL,
	[descripcion_pregunta] [nvarchar](180) NULL,
	[id_test] [bigint] NULL,
	[id_tipo_pregunta] [bigint] NULL,
	[fecha] [datetime2](0) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[seccion] [nvarchar](255) NULL,
	[descripcion_general] [nvarchar](500) NULL,
 CONSTRAINT [PK_Pregunta_Tests_id_pregunta_test] PRIMARY KEY CLUSTERED 
(
	[id_pregunta_test] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [questionnaires].[Resultados_Pregunta_Tests]    Script Date: 21/9/2023 22:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [questionnaires].[Resultados_Pregunta_Tests](
	[Id_Perfil] [bigint] NULL,
	[id_pregunta_test] [bigint] NULL,
	[resultado] [int] NULL,
	[respuesta] [nvarchar](180) NULL,
	[estado] [nvarchar](180) NULL,
	[id_valor_pregunta] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_Resultados_Pregunta_Tests_id_usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Perfil] ASC,
	[id_pregunta_test] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [questionnaires].[Resultados_Tests]    Script Date: 21/9/2023 22:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [questionnaires].[Resultados_Tests](
	[Id_Perfil] [bigint] NULL,
	[id_test] [bigint] NULL,
	[fecha] [datetime] NULL,
	[seccion] [nvarchar](180) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[valor] [nvarchar](255) NULL,
	[categoria_valor] [nvarchar](255) NULL,
	[tipo] [nvarchar](255) NULL,
 CONSTRAINT [PK_Resultados_Tests_id_usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Perfil] ASC,
	[id_test] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [questionnaires].[Tests]    Script Date: 21/9/2023 22:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [questionnaires].[Tests](
	[id_test] [bigint] IDENTITY(115,1) NOT NULL,
	[titulo] [nvarchar](180) NULL,
	[descripcion] [nvarchar](max) NULL,
	[grado] [int] NULL,
	[tipo_test] [nvarchar](27) NULL,
	[estado] [nvarchar](180) NULL,
	[id_categoria] [bigint] NULL,
	[fecha_publicacion] [datetime2](0) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[referencias] [nvarchar](max) NULL,
	[tiempo] [int] NULL,
	[caducidad] [int] NULL,
	[color] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
 CONSTRAINT [PK_Tests_id_test] PRIMARY KEY CLUSTERED 
(
	[id_test] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [questionnaires].[Cat_Categorias_Test] ON 

INSERT [questionnaires].[Cat_Categorias_Test] ([id_categoria], [descripcion], [imagen], [estado], [created_at], [updated_at]) VALUES (1, N'Evaluación', N'5f0c4436b4831.jpg', N'ACTIVO', CAST(N'2019-09-24T20:07:50.000' AS DateTime), CAST(N'2020-07-13T11:23:34.000' AS DateTime))
SET IDENTITY_INSERT [questionnaires].[Cat_Categorias_Test] OFF
GO
SET IDENTITY_INSERT [questionnaires].[Cat_Tipo_Preguntas] ON 

INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (1, N'Dicotomica', N'Si, no', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime), 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (2, N'Likert', N'Nunca, casi nunca, de vez en cuando, a menudo, muy a menudo', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime), 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (3, N'Likert', N'1(totalmente en desacuerdo) y 6 (totalmente de acuerdo)', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime), 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (4, N'Likert', N'Siempre, a veces, nunca', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (5, N'Dicotomica', N'De acuerdo / en desacuerdo ', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (6, N'Likert', N'Importante, algo importante, no importante', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (7, N'Likert', N'De acuerdo, algo en desacuerdo, muy en desacuerdo', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (8, N'Likert', N'Siempre, a veces, casi nunca, nunca', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (9, N'Likert', N'Muy importante, importante, algo importante, nada importante.', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (10, N'Likert', N'De acuerdo, algo en desacuerdo, muy en desacuerdo.', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (11, N'Abierta', N'Pregunta libre', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (12, N'Númerica', N'Digitación de un número', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (13, N'Likert', N'Nunca, casi nunca, pocas veces, algunas veces, relativamente frecente, muy frecuente', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (14, N'Likert', N'Antiguedad(-1 año, de 1 a 3 años, de 4 a 6 años, de 7 a 10 años,+ de 10 años)', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (15, N'Likert', N'Posición jerárquica(Directivo, Mando intermedio, Técnicos)', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (16, N'Likert', N'Edad(18-28, 29-39, 40-50, 51-61, +61)', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (17, N'Dicotomica', N'Hombre, Mujer', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (18, N'Likert', N'1=No lo soy nunca, 10= siempre y cuando digo siempre es siempre, lo soy)', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (20, N'Likert', N'1 al 10', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (21, N'Likert', N'0-1 año, 1-3 años, 3-6 años, 7-10 años, 11-13 años, 14-17 años', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (22, N'Likert', N'0-1 año, 1-3 años, 3-6 años, 7-10 años, 11-13 años, 14-17 años, Ninguno', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (23, N'Likert', N'Deporte más gustado', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (24, N'Likert', N'Cambiar algunos hábitos de alimentación', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (25, N'Likert', N'Elementos de alimentación', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (26, N'Likert', N'Preocupación de componentes de los alimentos', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (27, N'Likert', N'1 al 5', N'ACTIVO', CAST(N'2019-09-25T20:07:50.000' AS DateTime), NULL, NULL, 0x00, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley')
INSERT [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta], [tipo_pregunta], [descripcion], [estado], [fecha_crea], [created_at], [updated_at], [editable], [descripcion_general]) VALUES (28, N'Likert', N'Totalmente en desacuerdo, Bastante en desacuerdo, Algo en desacuerdo, Algo de acuerdo, Bastante de acuerdo, Totalmente de acuerdo', N'ACTIVO', CAST(N'2020-01-04T17:08:28.000' AS DateTime), NULL, NULL, 0x00, NULL)
SET IDENTITY_INSERT [questionnaires].[Cat_Tipo_Preguntas] OFF
GO
SET IDENTITY_INSERT [questionnaires].[Cat_Valor_Preguntas] ON 

INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (1, N'Si', 1, N'ACTIVO', 1, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (2, N'No', 1, N'ACTIVO', 0, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (3, N'Nunca', 2, N'ACTIVO', 1, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (4, N'Casi nunca', 2, N'ACTIVO', 2, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (5, N'De vez en cuando', 2, N'ACTIVO', 3, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (6, N'A menudo', 2, N'ACTIVO', 4, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (7, N'Muy a menudo', 2, N'ACTIVO', 5, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (8, N'1(totalmente en desacuerdo)', 3, N'ACTIVO', 1, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (9, N'2', 3, N'ACTIVO', 2, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (10, N'3', 3, N'ACTIVO', 3, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (11, N'4', 3, N'ACTIVO', 4, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (12, N'5', 3, N'ACTIVO', 5, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (13, N'6(totalmente de acuerdo)', 3, N'ACTIVO', 6, CAST(N'2019-09-25T04:07:50.000' AS DateTime), CAST(N'2019-09-25T04:07:50.000' AS DateTime))
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (16, N'Nunca', 4, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (17, N'Aveces', 4, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (18, N'Siempre', 4, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (19, N'De acuerdo', 5, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (20, N'En desacuerdo', 5, N'ACTIVO', 0, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (21, N'No importante', 6, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (22, N'Algo Importante', 6, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (23, N'Importante', 6, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (24, N'Muy en desacuerdo', 7, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (25, N'Algo en acuerdo', 7, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (26, N'De acuerdo', 7, N'act ', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (27, N'Nunca', 8, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (28, N'Casi nunca', 8, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (29, N'A veces', 8, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (30, N'Siempre', 8, N'act ', 4, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (31, N'Nada importante', 9, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (32, N'Algo importante', 9, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (33, N'Importante', 9, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (34, N'Muy importante', 9, N'act ', 4, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (35, N'Muy en desacuerdo', 10, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (36, N'Algo en descauerdo', 10, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (37, N'De acuerdo', 10, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (38, N'Muy de acuerdo', 10, N'act ', 4, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (40, N'Abierta', 11, N'ACTIVO', 0, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (41, N'Númerica', 12, N'ACTIVO', 0, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (42, N'Nunca', 13, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (43, N'Casi nunca', 13, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (44, N'Pocas veces', 13, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (45, N'Algunas veces', 13, N'ACTIVO', 4, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (46, N'Relativamente frecuente', 13, N'ACTIVO', 5, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (47, N'Muy frecuente', 13, N'ACTIVO', 6, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (55, N'Directivo', 15, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (56, N'Mando intermedio', 15, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (57, N'Técnicos', 15, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (58, N'18-28', 16, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (59, N'29-39', 16, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (60, N'40-50', 16, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (61, N'51-61', 16, N'ACTIVO', 4, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (62, N'+61', 16, N'ACTIVO', 5, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (63, N'Hombre', 17, N'ACTIVO', 0, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (64, N'Mujer', 17, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (65, N'1', 18, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (66, N'2', 18, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (67, N'3', 18, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (68, N'4', 18, N'ACTIVO', 4, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (69, N'5', 18, N'ACTIVO', 5, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (70, N'6', 18, N'ACTIVO', 6, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (71, N'7', 18, N'ACTIVO', 7, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (72, N'8', 18, N'ACTIVO', 8, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (73, N'9', 18, N'ACTIVO', 9, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (74, N'10', 18, N'ACTIVO', 10, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (123, N'Totalmente en desacuerdo', 28, N'ACTIVO', 1, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (124, N'Bastante en desacuerdo', 28, N'ACTIVO', 2, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (125, N'Algo en desacuerdo', 28, N'ACTIVO', 3, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (126, N'Algo de acuerdo', 28, N'ACTIVO', 4, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (127, N'Bastante de acuerdo', 28, N'ACTIVO', 5, NULL, NULL)
INSERT [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta], [descripcion], [id_tipo_pregunta], [estado], [valor], [created_at], [updated_at]) VALUES (128, N'Totalmente de acuerdo', 28, N'ACTIVO', 6, NULL, NULL)
SET IDENTITY_INSERT [questionnaires].[Cat_Valor_Preguntas] OFF
GO
ALTER TABLE [questionnaires].[Cat_Categorias_Test] ADD  DEFAULT (NULL) FOR [imagen]
GO
ALTER TABLE [questionnaires].[Cat_Categorias_Test] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [questionnaires].[Cat_Categorias_Test] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [questionnaires].[Cat_Tipo_Preguntas] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [questionnaires].[Cat_Tipo_Preguntas] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [questionnaires].[Cat_Tipo_Preguntas] ADD  DEFAULT (NULL) FOR [editable]
GO
ALTER TABLE [questionnaires].[Cat_Tipo_Preguntas] ADD  DEFAULT (NULL) FOR [descripcion_general]
GO
ALTER TABLE [questionnaires].[Cat_Valor_Preguntas] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [questionnaires].[Cat_Valor_Preguntas] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [questionnaires].[Pregunta_Tests] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [questionnaires].[Pregunta_Tests] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [questionnaires].[Pregunta_Tests] ADD  DEFAULT (NULL) FOR [descripcion_general]
GO
ALTER TABLE [questionnaires].[Resultados_Pregunta_Tests] ADD  DEFAULT (NULL) FOR [resultado]
GO
ALTER TABLE [questionnaires].[Resultados_Pregunta_Tests] ADD  DEFAULT (NULL) FOR [respuesta]
GO
ALTER TABLE [questionnaires].[Resultados_Pregunta_Tests] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [questionnaires].[Resultados_Pregunta_Tests] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [questionnaires].[Resultados_Tests] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [questionnaires].[Resultados_Tests] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [questionnaires].[Resultados_Tests] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [questionnaires].[Resultados_Tests] ADD  DEFAULT (NULL) FOR [tipo]
GO
ALTER TABLE [questionnaires].[Tests] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [questionnaires].[Tests] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [questionnaires].[Tests] ADD  DEFAULT (NULL) FOR [referencias]
GO
ALTER TABLE [questionnaires].[Tests] ADD  DEFAULT (NULL) FOR [tiempo]
GO
ALTER TABLE [questionnaires].[Tests] ADD  DEFAULT (NULL) FOR [caducidad]
GO
ALTER TABLE [questionnaires].[Tests] ADD  DEFAULT (NULL) FOR [color]
GO
ALTER TABLE [questionnaires].[Tests] ADD  DEFAULT (NULL) FOR [image]
GO
ALTER TABLE [questionnaires].[Cat_Valor_Preguntas]  WITH NOCHECK ADD  CONSTRAINT [Cat_Valor_Preguntas$Cat_Valor_Preguntas_id_tipo_pregunta_foreign] FOREIGN KEY([id_tipo_pregunta])
REFERENCES [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta])
GO
ALTER TABLE [questionnaires].[Cat_Valor_Preguntas] CHECK CONSTRAINT [Cat_Valor_Preguntas$Cat_Valor_Preguntas_id_tipo_pregunta_foreign]
GO
ALTER TABLE [questionnaires].[Pregunta_Tests]  WITH NOCHECK ADD  CONSTRAINT [Pregunta_Tests$Pregunta_Tests_id_test_foreign] FOREIGN KEY([id_test])
REFERENCES [questionnaires].[Tests] ([id_test])
GO
ALTER TABLE [questionnaires].[Pregunta_Tests] CHECK CONSTRAINT [Pregunta_Tests$Pregunta_Tests_id_test_foreign]
GO
ALTER TABLE [questionnaires].[Pregunta_Tests]  WITH NOCHECK ADD  CONSTRAINT [Pregunta_Tests$Pregunta_Tests_id_tipo_pregunta_foreign] FOREIGN KEY([id_tipo_pregunta])
REFERENCES [questionnaires].[Cat_Tipo_Preguntas] ([id_tipo_pregunta])
GO
ALTER TABLE [questionnaires].[Pregunta_Tests] CHECK CONSTRAINT [Pregunta_Tests$Pregunta_Tests_id_tipo_pregunta_foreign]
GO
ALTER TABLE [questionnaires].[Resultados_Pregunta_Tests]  WITH NOCHECK ADD  CONSTRAINT [Resultados_Pregunta_Tests$Resultados_Pregunta_Tests_id_pregunta_test_foreign] FOREIGN KEY([id_pregunta_test])
REFERENCES [questionnaires].[Pregunta_Tests] ([id_pregunta_test])
GO
ALTER TABLE [questionnaires].[Resultados_Pregunta_Tests] CHECK CONSTRAINT [Resultados_Pregunta_Tests$Resultados_Pregunta_Tests_id_pregunta_test_foreign]
GO
ALTER TABLE [questionnaires].[Resultados_Pregunta_Tests]  WITH NOCHECK ADD  CONSTRAINT [Resultados_Pregunta_Tests$Resultados_Pregunta_Tests_id_valor_pregunta_foreign] FOREIGN KEY([id_valor_pregunta])
REFERENCES [questionnaires].[Cat_Valor_Preguntas] ([id_valor_pregunta])
GO
ALTER TABLE [questionnaires].[Resultados_Pregunta_Tests] CHECK CONSTRAINT [Resultados_Pregunta_Tests$Resultados_Pregunta_Tests_id_valor_pregunta_foreign]
GO
ALTER TABLE [questionnaires].[Resultados_Tests]  WITH NOCHECK ADD  CONSTRAINT [Resultados_Tests$Resultados_Tests_id_test_foreign] FOREIGN KEY([id_test])
REFERENCES [questionnaires].[Tests] ([id_test])
GO
ALTER TABLE [questionnaires].[Resultados_Tests] CHECK CONSTRAINT [Resultados_Tests$Resultados_Tests_id_test_foreign]
GO
ALTER TABLE [questionnaires].[Tests]  WITH NOCHECK ADD  CONSTRAINT [Tests$Tests_id_categoria_foreign] FOREIGN KEY([id_categoria])
REFERENCES [questionnaires].[Cat_Categorias_Test] ([id_categoria])
GO
ALTER TABLE [questionnaires].[Tests] CHECK CONSTRAINT [Tests$Tests_id_categoria_foreign]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'questionnaires.Cat_Categorias_Test' , @level0type=N'SCHEMA',@level0name=N'questionnaires', @level1type=N'TABLE',@level1name=N'Cat_Categorias_Test'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'questionnaires.Cat_Tipo_Preguntas' , @level0type=N'SCHEMA',@level0name=N'questionnaires', @level1type=N'TABLE',@level1name=N'Cat_Tipo_Preguntas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'questionnaires.Cat_Valor_Preguntas' , @level0type=N'SCHEMA',@level0name=N'questionnaires', @level1type=N'TABLE',@level1name=N'Cat_Valor_Preguntas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'questionnaires.Pregunta_Tests' , @level0type=N'SCHEMA',@level0name=N'questionnaires', @level1type=N'TABLE',@level1name=N'Pregunta_Tests'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'questionnaires.Resultados_Pregunta_Tests' , @level0type=N'SCHEMA',@level0name=N'questionnaires', @level1type=N'TABLE',@level1name=N'Resultados_Pregunta_Tests'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'questionnaires.Resultados_Tests' , @level0type=N'SCHEMA',@level0name=N'questionnaires', @level1type=N'TABLE',@level1name=N'Resultados_Tests'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'questionnaires.Tests' , @level0type=N'SCHEMA',@level0name=N'questionnaires', @level1type=N'TABLE',@level1name=N'Tests'
GO
