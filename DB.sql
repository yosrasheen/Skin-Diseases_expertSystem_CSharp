USE [MedicalExpert]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/16/2010 12:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [nvarchar](100) NOT NULL,
	[UserEmail] [nvarchar](100) NOT NULL,
	[UserPassword] [nvarchar](100) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[RegDate] [datetime] NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [bit] NULL,
	[Nationality] [varchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([UserName], [UserEmail], [UserPassword], [IsAdmin], [RegDate], [DateOfBirth], [Gender], [Nationality]) VALUES (N'a', N'a@a.com', N'a', 0, CAST(0x00009E4D0152FD30 AS DateTime), CAST(0x0000806800000000 AS DateTime), 1, N'')
INSERT [dbo].[Users] ([UserName], [UserEmail], [UserPassword], [IsAdmin], [RegDate], [DateOfBirth], [Gender], [Nationality]) VALUES (N'user', N'user@domain.com', N'user', 1, NULL, CAST(0x0000806800000000 AS DateTime), 0, N'S')
/****** Object:  Table [dbo].[SyptomsAttributes]    Script Date: 12/16/2010 12:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SyptomsAttributes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttributeTitle] [varchar](200) NOT NULL,
	[AttributeType] [int] NOT NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SyptomsAttributes] ON
INSERT [dbo].[SyptomsAttributes] ([ID], [AttributeTitle], [AttributeType]) VALUES (1, N'Is Age >= 14', 3)
INSERT [dbo].[SyptomsAttributes] ([ID], [AttributeTitle], [AttributeType]) VALUES (2, N'If (age<3)', 3)
INSERT [dbo].[SyptomsAttributes] ([ID], [AttributeTitle], [AttributeType]) VALUES (5, N'Are there any animals in the house?', 5)
INSERT [dbo].[SyptomsAttributes] ([ID], [AttributeTitle], [AttributeType]) VALUES (6, N'Does the patient take any medicine?', 5)
INSERT [dbo].[SyptomsAttributes] ([ID], [AttributeTitle], [AttributeType]) VALUES (7, N'If (gender = female)', 4)
INSERT [dbo].[SyptomsAttributes] ([ID], [AttributeTitle], [AttributeType]) VALUES (9, N'IS age >= 15', 3)
INSERT [dbo].[SyptomsAttributes] ([ID], [AttributeTitle], [AttributeType]) VALUES (10, N'Is age < 3', 3)
SET IDENTITY_INSERT [dbo].[SyptomsAttributes] OFF
/****** Object:  Table [dbo].[Syptoms]    Script Date: 12/16/2010 12:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Syptoms](
	[SyptomNo] [bigint] IDENTITY(1,1) NOT NULL,
	[SyptomTitle] [varchar](300) NOT NULL,
	[SyptomDescription] [varchar](500) NULL,
 CONSTRAINT [PK_Syptoms] PRIMARY KEY CLUSTERED 
(
	[SyptomNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Syptoms] ON
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (1, N'Does the patient have a skin or hair problem?', N'Skin/Hair')
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (2, N'Does patient suffer from itching?', N'Itching')
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (3, N'Is Face, neck, Chest, Upper arm, back Is Affected', N'Face, neck, Chest, Upper arm, back')
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (4, N'Is thier comedones  (blackheads), Closed comedones  (whiteheads), Inflammatory papules (pinheads),  Pustules (pimples), nodules (large papules), seborrhea (scaly red skin) On the Skin', N'comedones')
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (5, N'To which degree it reache? IS it < 20 comedones, or < 15 inflammatory lesions, or < 30 total lesions', N'lesions')
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (6, N'Is it   20 to 100 comedones, or 15 to 50 inflammatory lesions, or 30 to 125 total lesions  ', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (7, N'Is it > 5 cysts, or total comedone count > 100, or total inflammatory lesion count > 50, or > 125 total lesions', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (8, N'Does itching become worse at night?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (9, N'When the symptoms start to occur? Is It The 1st -2nd month of the patient life', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (10, N'Do any of the patient''s parents suffer from atopic dermatitis or allergy (nasal/asthma)?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (11, N'Does he/she suffer from dry and thick, scaly skin?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (12, N'From the physical examination, do you saw in the patient''s skin a small pimple-like insect bites?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (13, N'From the physical examination, do you saw in the patient''s skin s-shaped tracks?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (14, N'Is there any cortical stain in a circular or oval shape on the patient head?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (15, N'Does the patient suffer from itching and dandruff?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (16, N'Does patient dye his/her hair or use a chemical treatment?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (17, N'Is the patient on diet?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (18, N'Does the patient suffer form anemia?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (19, N'Does the patient suffer from menstrual disorders?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (20, N'Does the patient suffer from hormonal disorder?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (21, N'Does any member from the patient filmy suffer from hair fall?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (22, N'IS Skin?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (23, N'Does The Patient Suffer From Blisters and pastules on his\her palms and soles on his\her feet?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (24, N'Is the dandrulf in a gray color?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (25, N'Does The parent Cheeks appear red, scaly, oozy and crusty?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (26, N'Does the patient suffer from very persistent itch?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (27, N'Is Thier any black dots on the patient scalp?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (28, N'Is thiere any hair loss in the black dots?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (29, N'Is thier any red block like abscees?', NULL)
INSERT [dbo].[Syptoms] ([SyptomNo], [SyptomTitle], [SyptomDescription]) VALUES (30, N'Is thier pus in the red blocks?', NULL)
SET IDENTITY_INSERT [dbo].[Syptoms] OFF
/****** Object:  Table [dbo].[ExpertNodeType]    Script Date: 12/16/2010 12:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpertNodeType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ExpertNodeType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ExpertNodeType] ON
INSERT [dbo].[ExpertNodeType] ([ID], [Description]) VALUES (1, N'Syptom')
INSERT [dbo].[ExpertNodeType] ([ID], [Description]) VALUES (2, N'Diagnosis')
INSERT [dbo].[ExpertNodeType] ([ID], [Description]) VALUES (3, N'AttributeAge')
INSERT [dbo].[ExpertNodeType] ([ID], [Description]) VALUES (4, N'AttributeGender')
INSERT [dbo].[ExpertNodeType] ([ID], [Description]) VALUES (5, N'Attribute')
SET IDENTITY_INSERT [dbo].[ExpertNodeType] OFF
/****** Object:  Table [dbo].[ExpertNodes]    Script Date: 12/16/2010 12:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpertNodes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NodeId] [bigint] NOT NULL,
	[NodeType] [int] NOT NULL,
 CONSTRAINT [PK_ExpertFlow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ExpertNodes] ON
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (20, 1, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (21, 2, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (22, 3, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (23, 4, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (24, 5, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (25, 6, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (26, 7, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (27, 8, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (28, 9, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (29, 10, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (30, 11, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (31, 12, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (32, 13, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (33, 14, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (34, 15, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (35, 16, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (36, 17, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (37, 18, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (38, 19, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (39, 20, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (40, 21, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (41, 1, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (42, 2, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (43, 3, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (44, 4, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (45, 5, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (46, 6, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (47, 7, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (48, 8, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (49, 1, 3)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (50, 2, 3)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (51, 5, 5)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (52, 6, 5)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (53, 7, 4)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (55, 22, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (56, 23, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (57, 10, 2)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (58, 24, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (59, 25, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (60, 26, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (61, 27, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (62, 28, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (63, 29, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (64, 30, 1)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (65, 9, 3)
INSERT [dbo].[ExpertNodes] ([ID], [NodeId], [NodeType]) VALUES (66, 10, 3)
SET IDENTITY_INSERT [dbo].[ExpertNodes] OFF
/****** Object:  Table [dbo].[ExpertFlow]    Script Date: 12/16/2010 12:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpertFlow](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NodeIdFrom] [bigint] NOT NULL,
	[NodeIdTo] [bigint] NOT NULL,
	[Decision] [bit] NOT NULL,
	[IsRoot] [bit] NOT NULL,
 CONSTRAINT [PK_ExpertFlow_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ExpertFlow] ON
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (12, 20, 55, 1, 1)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (13, 55, 65, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (14, 55, 21, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (15, 21, 27, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (16, 21, 22, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (17, 65, 51, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (18, 27, 66, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (19, 27, 28, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (20, 22, 23, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (21, 51, 33, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (22, 51, 34, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (23, 66, 31, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (24, 28, 29, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (26, 66, 56, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (27, 49, 57, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (28, 49, 24, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (29, 33, 33, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (30, 33, 58, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (31, 34, 38, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (32, 31, 32, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (33, 32, 43, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (34, 29, 50, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (35, 50, 59, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (36, 50, 30, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (37, 59, 42, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (38, 30, 60, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (39, 60, 42, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (40, 24, 46, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (41, 24, 25, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (42, 25, 47, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (43, 25, 48, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (44, 58, 61, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (45, 61, 62, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (46, 62, 63, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (47, 63, 64, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (48, 64, 44, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (49, 34, 35, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (50, 35, 38, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (51, 35, 36, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (52, 36, 38, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (53, 36, 37, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (54, 37, 38, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (55, 37, 52, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (56, 52, 38, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (57, 52, 53, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (58, 53, 38, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (59, 53, 39, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (60, 38, 45, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (61, 38, 39, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (62, 39, 40, 0, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (63, 40, 45, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (65, 23, 49, 1, 0)
INSERT [dbo].[ExpertFlow] ([ID], [NodeIdFrom], [NodeIdTo], [Decision], [IsRoot]) VALUES (67, 56, 31, 1, 0)
SET IDENTITY_INSERT [dbo].[ExpertFlow] OFF
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 12/16/2010 12:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diagnosis](
	[DiagnosisNo] [bigint] IDENTITY(1,1) NOT NULL,
	[DiagnosisTitle] [varchar](200) NOT NULL,
	[DiagnosisDescription] [varchar](500) NULL,
	[DangerRate] [varchar](50) NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[DiagnosisNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Diagnosis] ON
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (1, N'Acne Vulgaris Q', N'', N'L')
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (2, N'Atopic dermatitis Q', N'', N'L')
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (3, N'Scabies', N'', N'L')
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (4, N'Tinea Capitis', N'Tinea Capitis', N'L')
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (5, N'Hair fall', NULL, NULL)
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (6, N'Mild acne vulgaris', NULL, NULL)
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (7, N'Moderated acne vulgaris', N'Moderated acne vulgaris', NULL)
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (8, N'Severe acne vulgaris', NULL, NULL)
INSERT [dbo].[Diagnosis] ([DiagnosisNo], [DiagnosisTitle], [DiagnosisDescription], [DangerRate]) VALUES (10, N'Baby acne', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Diagnosis] OFF
/****** Object:  Table [dbo].[UserCases]    Script Date: 12/16/2010 12:42:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserCases](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[FileName] [varchar](250) NOT NULL,
	[CaseDate] [date] NOT NULL,
 CONSTRAINT [PK_UserCases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  View [dbo].[VwNodesTitles]    Script Date: 12/16/2010 12:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwNodesTitles]
AS
SELECT        ExpertNodes.ID, Syptoms.SyptomTitle AS Title
FROM            ExpertNodes Right OUTER JOIN
                         Syptoms ON ExpertNodes.NodeId = Syptoms.SyptomNo AND ExpertNodes.NodeType = 1
UNION
SELECT        ExpertNodes_2.ID, SyptomsAttributes.AttributeTitle AS Title
FROM            ExpertNodes AS ExpertNodes_2 Right OUTER JOIN
                         SyptomsAttributes ON ExpertNodes_2.NodeId = SyptomsAttributes.ID AND ExpertNodes_2.NodeType > 2
UNION
SELECT        ExpertNodes_1.ID, Diagnosis.DiagnosisTitle AS Title
FROM            ExpertNodes AS ExpertNodes_1 Right OUTER JOIN
                         Diagnosis ON ExpertNodes_1.NodeId = Diagnosis.DiagnosisNo AND ExpertNodes_1.NodeType = 2
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwNodesTitles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwNodesTitles'
GO
/****** Object:  View [dbo].[VwFlow]    Script Date: 12/16/2010 12:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwFlow]
AS
SELECT     dbo.ExpertFlow.ID, dbo.ExpertFlow.NodeIdFrom, dbo.ExpertFlow.NodeIdTo, dbo.ExpertFlow.Decision, dbo.ExpertFlow.IsRoot, 
                      ExpertNodes_1.NodeType AS NodeFromType, dbo.ExpertNodes.NodeType AS NodeToType, dbo.VwNodesTitles.Title AS FromTitle, 
                      VwNodesTitles_1.Title AS ToTitle
FROM         dbo.ExpertFlow LEFT OUTER JOIN
                      dbo.VwNodesTitles AS VwNodesTitles_1 ON dbo.ExpertFlow.NodeIdTo = VwNodesTitles_1.ID LEFT OUTER JOIN
                      dbo.VwNodesTitles ON dbo.ExpertFlow.NodeIdFrom = dbo.VwNodesTitles.ID LEFT OUTER JOIN
                      dbo.ExpertNodes ON dbo.ExpertFlow.NodeIdTo = dbo.ExpertNodes.ID LEFT OUTER JOIN
                      dbo.ExpertNodes AS ExpertNodes_1 ON dbo.ExpertFlow.NodeIdFrom = ExpertNodes_1.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[27] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ExpertFlow"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 147
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ExpertNodes"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 110
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ExpertNodes_1"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 110
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VwNodesTitles"
            Begin Extent = 
               Top = 6
               Left = 632
               Bottom = 95
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VwNodesTitles_1"
            Begin Extent = 
               Top = 6
               Left = 830
               Bottom = 95
               Right = 990
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwFlow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'olumn = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwFlow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwFlow'
GO
