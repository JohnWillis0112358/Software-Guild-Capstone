USE [SarahsBlog]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darren
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCategory] 
	-- Add the parameters for the stored procedure here
	@CategoryName varchar(max) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Categories (CategoryName) values(@CategoryName)
END

GO
/****** Object:  StoredProcedure [dbo].[CreateBlogEntry]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateBlogEntry]

		@PostContents nvarchar(max),
		@UserID int,
		@DateOfPost date,
		@StartDate date,
		@EndDate date,
		@StatusID int,
		@Title nvarchar(max)

AS

INSERT INTO BlogPosts (PostContents, UserID, DateOfPost, StartDate, EndDate, StatusID, Title)
VALUES (@PostContents, @UserID, @DateOfPost, @StartDate, @EndDate, @StatusID, @Title)


GO
/****** Object:  StoredProcedure [dbo].[CreateStaticEntry]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateStaticEntry]

	@Content nvarchar(max),
	@url nvarchar(50),
	@Title nchar(10)

AS

INSERT INTO StaticPages (Content, url, Title)
VALUES (@Content, @url, @Title)


GO
/****** Object:  StoredProcedure [dbo].[DeleteBlogEntry]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBlogEntry]

	@BlogPostID int

AS

UPDATE BlogPosts
SET StatusID = 2
WHERE BlogPostID = @BlogPostID


GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteCategory] as
DELETE FROM [dbo].[Categories]
      WHERE [CategoryID] = '@CategoryId'
GO
/****** Object:  StoredProcedure [dbo].[EditBlogEntry]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditBlogEntry]

		@BlogPostID int,
		@PostContents nvarchar(max),
		@UserID int,
		@DateOfPost date,
		@StartDate date,
		@EndDate date,
		@Title nvarchar(max)

AS

UPDATE BlogPosts
SET PostContents = @PostContents, UserID = @UserID, DateOfPost = @DateOfPost, StartDate = @StartDate, EndDate = @EndDate, Title = @Title
WHERE BlogPostID = @BlogPostID


GO
/****** Object:  StoredProcedure [dbo].[EditCategory]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[EditCategory] as
UPDATE [dbo].[Categories]
   SET [CategoryName] = '@CategoryName'
 WHERE [CategoryID] = '@CategoryID'
GO
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCategories] as
SELECT * FROM Categories
GO
/****** Object:  StoredProcedure [dbo].[GetBlogEntries]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBlogEntries]

AS

	SELECT *
	FROM BlogPosts
	





GO
/****** Object:  StoredProcedure [dbo].[GetBlogEntry]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetBlogEntry]
(
@BlogPostID int
)

AS 

SELECT [BlogPostID]
      ,[PostContents]
      ,[UserID]
      ,[DateOfPost]
      ,[StartDate]
      ,[EndDate]
      ,[StatusID]
      ,[Title]
FROM BlogPosts
WHERE BlogPostID = @BlogPostID




GO
/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 8/15/2015 12:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetCategoryById] as
Select * From [dbo].[Categories]
      WHERE [CategoryID] = '@CategoryId'
GO
