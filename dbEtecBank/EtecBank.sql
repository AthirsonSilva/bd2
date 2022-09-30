USE EtecBank
GO

/****** Object:  Table [dbo].[accountHolder]    Script Date: 30/09/2022 11:03:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[accountHolder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[birth] [date] NOT NULL,
	[cpf] [char](11) NOT NULL,
	[rg] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE EtecBank
GO

/****** Object:  Table [dbo].[checkingAccount]    Script Date: 30/09/2022 11:01:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[checkingAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[agencyNumber] [char](4) NULL,
	[number] char(6) NULL,
	[digit] [char](2) NULL,
	[numericPassword] [varchar](8) NULL,
	[alphanumPassword] [varchar](8) NULL,
	[balance] [money] NULL,
	[createdAt] [date] NULL,
	[accountHolderID] [int] NULL,
 CONSTRAINT [PK__checking__3213E83F16B074A5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[checkingAccount]  WITH CHECK ADD  CONSTRAINT [FK__checkingA__accou__147C05D0] FOREIGN KEY([accountHolderID])
REFERENCES [dbo].[accountHolder] ([id])
GO

ALTER TABLE [dbo].[checkingAccount] CHECK CONSTRAINT [FK__checkingA__accou__147C05D0]
GO

USE [EtecBank]
GO

/****** Object:  Table [dbo].[savingAccount]    Script Date: 30/09/2022 11:37:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[savingAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [char](4) NOT NULL,
	[digit] [char](8) NOT NULL,
	[numericPassword] [varchar](16) NOT NULL,
	[balance] [money] NOT NULL,
	[createAt] [date] NOT NULL,
	[accountHolderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[savingAccount]  WITH CHECK ADD FOREIGN KEY([accountHolderID])
REFERENCES [dbo].[accountHolder] ([id])
GO


