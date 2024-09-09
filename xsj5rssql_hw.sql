SELECT Name FROM country WHERE Continent = "South America";
SELECT population FROM country WHERE name = "Germany";
SELECT name FROM city WHERE countrycode = (SELECT code from country WHERE name = "Japan");
SELECT name, population FROM country WHERE continent = "Africa" ORDER BY population DESC LIMIT 3;
SELECT name, lifeexpectancy FROM country WHERE population BETWEEN 1000000 AND 5000000;
SELECT country.name FROM country JOIN countrylanguage ON country.code = countrylanguage.CountryCode WHERE countrylanguage.Language = "French" AND countrylanguage.IsOfficial = "T";

SELECT Album.Title FROM Album JOIN Artist on Album.ArtistId = Artist.ArtistId WHERE Artist.Name = "AC/DC";
SELECT firstname, lastname, email FROM Customer WHERE country = "Brazil";
SELECT name, PlaylistId	FROM Playlist;
SELECT COUNT(*) AS TotalNumberOfTracks FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = "Rock";
SELECT FirstName, LastName, EmployeeId FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE LastName = "Edwards" AND FirstName = "Nancy");
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales FROM Invoice JOIN Customer ON Invoice.CustomerId = Customer.CustomerId GROUP BY Customer.CustomerId;

CREATE TABLE Authors (AuthorID INT PRIMARY KEY, Name VARCHAR(100) NOT NULL);
CREATE TABLE Books (BookID INT PRIMARY KEY, Title VARCHAR(100) NOT NULL, AuthorID INT, Genre VARCHAR(100), FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID));
CREATE TABLE Orders (OrderID INT PRIMARY KEY, BookID INT, OrderDate DATE, FOREIGN KEY (BookID) REFERENCES Books(BookID));

INSERT INTO Authors (AuthorID, Name) VALUES (1, "Bobby Fischer"), (2, "J.K. Rowling"), (3, "Peter Richardson"), (4, "Rick Riordan"), (5, "Stephen King");
INSERT INTO Books (Title, AuthorID, Genre, BookID) VALUES ("Bobby Fischer Teaches Chess", 1, "Nonfiction", 1), ("Harry Potter and the Philosopher's Stone", 2, "Fantasy", 2), ("No Simple Highway", 3, "Historical", 3), ("The Lightning Thief", 4, "Mythology", 4), ("If It Bleeds", 5, "Horror", 5);
INSERT INTO Orders (BookID, OrderDate, OrderID) VALUES (1,"2024-08-15",1), (2,"2024-08-16",2), (3,"2024-08-19",3), (4,"2024-08-26",4), (5,"2024-08-30",5);

SELECT Title FROM Books WHERE Genre = "Historical" OR Genre = "Horror";
SELECT Title FROM Books JOIN Authors ON Authors.AuthorID = Books.AuthorID WHERE Authors.Name = "J.K. Rowling";
SELECT BookID, OrderDate FROM Orders;
