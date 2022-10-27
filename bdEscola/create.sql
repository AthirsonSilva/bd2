USE [dbEscola]
GO

/****** Object:  Table [dbo].[tbAluno]    Script Date: 27/10/2022 14:08:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbAluno](
	[idAluno] [int] IDENTITY(1,10) NOT NULL,
	[nomeAluno] [varchar](255) NOT NULL,
	[cpfAluno] [char](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [dbEscola]
GO

/****** Object:  Table [dbo].[tbAluno]    Script Date: 27/10/2022 14:01:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbOcorrenciaAluno](
	[idOcorrencia] [int] IDENTITY(1,10) NOT NULL,
	[dataOcorrencia] [smalldatetime] NOT NULL,
	[descricaoOcorrencia] [varchar](255) NOT NULL,
	[idAluno] [int] foreign key references dbo.tbAluno (idAluno)
PRIMARY KEY CLUSTERED 
(
	[idOcorrencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

