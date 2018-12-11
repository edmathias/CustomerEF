
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/10/2018 18:20:57
-- Generated from EDMX file: C:\Users\edwar\Source\Repos\edmathias\CustomerEF\CustomerEF\CustomerEF\CustomerModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CustomerDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PersonEmailAssociation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Emails] DROP CONSTRAINT [FK_PersonEmailAssociation];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonsPhones]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Phones] DROP CONSTRAINT [FK_PersonsPhones];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Emails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Emails];
GO
IF OBJECT_ID(N'[dbo].[Persons]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Persons];
GO
IF OBJECT_ID(N'[dbo].[Phones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Phones];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PersonEmails'
CREATE TABLE [dbo].[PersonEmails] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmailTypeId] int  NOT NULL,
    [EmailAddress] nvarchar(255)  NOT NULL,
    [LastUpdatedById] int  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL,
    [Notes] nvarchar(max)  NOT NULL,
    [PersonsId] int  NOT NULL
);
GO

-- Creating table 'Persons'
CREATE TABLE [dbo].[Persons] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CategoryId] int  NOT NULL,
    [LastName] nvarchar(35)  NOT NULL,
    [FirstName] nvarchar(35)  NOT NULL,
    [MiddleName] nvarchar(35)  NOT NULL,
    [Address1] nvarchar(100)  NOT NULL,
    [Address2] nvarchar(100)  NOT NULL,
    [City] nvarchar(60)  NOT NULL,
    [State] nvarchar(50)  NOT NULL,
    [PostalCode] nvarchar(9)  NOT NULL,
    [CountryId] nvarchar(max)  NOT NULL,
    [BirthDate] datetime  NOT NULL,
    [DateOfFirstContact] datetime  NOT NULL,
    [LastUpdatedById] int  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL,
    [Notes] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PersonPhones'
CREATE TABLE [dbo].[PersonPhones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PhoneType] int  NOT NULL,
    [DisplayOrder] smallint  NOT NULL,
    [CountryCode] nvarchar(max)  NOT NULL,
    [AreaCode] nchar(3)  NOT NULL,
    [Prefix] nchar(3)  NOT NULL,
    [Number] nchar(4)  NOT NULL,
    [Extension] bigint  NOT NULL,
    [LastUpdatedById] int  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL,
    [Notes] nvarchar(max)  NOT NULL,
    [PersonsId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'PersonEmails'
ALTER TABLE [dbo].[PersonEmails]
ADD CONSTRAINT [PK_PersonEmails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Persons'
ALTER TABLE [dbo].[Persons]
ADD CONSTRAINT [PK_Persons]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PersonPhones'
ALTER TABLE [dbo].[PersonPhones]
ADD CONSTRAINT [PK_PersonPhones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PersonsId] in table 'PersonEmails'
ALTER TABLE [dbo].[PersonEmails]
ADD CONSTRAINT [FK_PersonEmailAssociation]
    FOREIGN KEY ([PersonsId])
    REFERENCES [dbo].[Persons]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonEmailAssociation'
CREATE INDEX [IX_FK_PersonEmailAssociation]
ON [dbo].[PersonEmails]
    ([PersonsId]);
GO

-- Creating foreign key on [PersonsId] in table 'PersonPhones'
ALTER TABLE [dbo].[PersonPhones]
ADD CONSTRAINT [FK_PersonsPhones]
    FOREIGN KEY ([PersonsId])
    REFERENCES [dbo].[Persons]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonsPhones'
CREATE INDEX [IX_FK_PersonsPhones]
ON [dbo].[PersonPhones]
    ([PersonsId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------