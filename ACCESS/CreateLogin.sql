--Create Login with Pass 123
--Pass has Never EXPIRATION

CREATE LOGIN [User] WITH PASSWORD=N'123', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO