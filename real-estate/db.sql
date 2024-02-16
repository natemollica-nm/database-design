-- Create database
CREATE DATABASE IF NOT EXISTS real_estate;

-- Set context to real_estate DB
USE real_estate;

-- Creation of the Firm table
CREATE TABLE IF NOT EXISTS Firm (
    FirmID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255)
);

-- Creation of the House table
CREATE TABLE IF NOT EXISTS House (
    HouseID INT AUTO_INCREMENT PRIMARY KEY,
    Price DECIMAL(10, 2) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Owner VARCHAR(255) NOT NULL,
    NumberOfBedrooms INT,
    NumberOfBathrooms INT,
    TypeOfHeating VARCHAR(255),
    Appliances VARCHAR(255),
    SizeOfGarage VARCHAR(255),
    FirmID INT,
    FOREIGN KEY (FirmID) REFERENCES Firm(FirmID) ON DELETE SET NULL
);

-- Creation of the Customer table
CREATE TABLE IF NOT EXISTS Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Preferences TEXT,
    PriceRangeLow DECIMAL(10, 2),
    PriceRangeHigh DECIMAL(10, 2)
);

-- Creation of the CustomerInterest table to handle the many-to-many relationship
CREATE TABLE IF NOT EXISTS CustomerInterest (
    CustomerID INT,
    HouseID INT,
    PRIMARY KEY (CustomerID, HouseID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (HouseID) REFERENCES House(HouseID) ON DELETE CASCADE
);
