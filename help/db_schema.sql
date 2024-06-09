
CREATE TABLE users(
    UserId SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    UserTypeId INT REFERENCES user_type(UserTypeId)
);

CREATE TABLE userType(
    UserTypeId SERIAL PRIMARY KEY,
    UserType VARCHAR(15) -- OWNER, RENTER
);

CREATE TABLE properties(
  PropertyId SERIAL PRIMARY KEY,
  OwnerId INT REFERENCES users(UserId),
  Description TEXT,
  NumberOfRooms INT,
  NumberOfBathroom INT,
  NumberOfParking INT,
  Price DECIMAL(10,2),
  AvailableFrom DATE,
  AvailableTo DATE
);

CREATE TABLE rooms(
  RoomId SERIAL PRIMARY KEY,
  PropertyId INT REFERENCES properties(PropertyId),
  RoomNumber INTEGER,
  Furnished BOOLEAN,
  RoomTypeId INT REFERENCES room_type(RoomTypeId),
  Price DECIMAL(10,2),
  AvailableFrom DATE,
  AvailableTo DATE,
  Description TEXT
);

CREATE TABLE  roomType(
  RoomTypeId SERIAL PRIMARY KEY,
  RoomType VARCHAR(15) -- SINGLE, DOUBLE
);

insert into room_type values (1, 'SINGLE');
insert into room_type values (2, 'DOUBLE');

select * from room_type;

insert into user_type values (1, 'OWNER');
insert into user_type values (2, 'RENTER');

select * from user_type;

insert into users values (1, 'Baburam', 'Neupane', 'neupanebabu828@gmail.com', 'abc123', '0452445***',1);
insert into users values (2, 'Subodh', 'Tiwari', 'subodh.tiwari@gmail.com', 'abc123', '0452445***',1);
insert into users values (3, 'Gaurav', 'Neupane', 'gaurav.neupane@gmail.com', 'abc123', '0452445***',2);
insert into users values (4, 'Roman', 'Paudel', 'roman.paudel@gmail.com', 'abc123', '0452445***',2);

select * from users;

insert into properties (ownerid, description, numberofrooms, numberofbathroom, numberofparking, price, availablefrom, availableto) values
                       (1, 'very good 1 room available', 3, 1, 1, 0, '2025-04-29', '2029-04-30');
insert into properties (ownerid, description, numberofrooms, numberofbathroom, numberofparking, price, availablefrom, availableto) values
                       (2, 'very good 1 room available', 3, 1, 1, 0, '2025-04-29', '2029-04-30');
insert into properties (ownerid, description, numberofrooms, numberofbathroom, numberofparking, price, availablefrom, availableto) values
                       (3, 'very good 1 room available', 3, 1, 1, 0, '2025-04-29', '2029-04-30');
select * from properties;


insert into rooms(propertyid, roomnumber, furnished, roomtypeid, price, availablefrom, availableto, description) values
                  (1, 1, true, 1, 320, '2024-05-24', '2029-05-09', 'furnished single room available in marion');
insert into rooms(propertyid, roomnumber, furnished, roomtypeid, price, availablefrom, availableto, description) values
                  (1, 2, true, 1, 230, '2024-05-24', '2029-05-09', 'furnished single room available in marion');
insert into rooms(propertyid, roomnumber, furnished, roomtypeid, price, availablefrom, availableto, description) values
                  (2, 1, true, 1, 320, '2024-05-24', '2029-05-09', 'furnished single room available in marion');
insert into rooms(propertyid, roomnumber, furnished, roomtypeid, price, availablefrom, availableto, description) values
                  (2, 2, true, 1, 320, '2024-05-24', '2029-05-09', 'furnished single room available in marion');

CREATE TABLE address(
  AddressId SERIAL PRIMARY KEY,
  PropertyId INT REFERENCES properties(propertyid),
  Unit_Number VARCHAR(10) NOT NULL ,
  Street_Address VARCHAR(255) NOT NULL ,
  Address_Line_2 VARCHAR(255),
  Suburb VARCHAR(100) NOT NULL ,
  State VARCHAR(3) NOT NULL ,
  Postcode VARCHAR(4) NOT NULL ,
  COUNTRY VARCHAR(50) NOT NULL
);

insert into  address (propertyid, unit_number, street_address, address_line_2, suburb, state, postcode, country) values
                      (1, 12, 'seccafien avenue','', 'marion', 'SA', '5047', 'Australia');

insert into  address (propertyid, unit_number, street_address, address_line_2, suburb, state, postcode, country) values
                      (2, 17, 'glamis avenue','', 'marion', 'SA', '5012', 'Australia');
insert into  address (propertyid, unit_number, street_address, address_line_2, suburb, state, postcode, country) values
                      (3, '1/214', 'seccafien avenue','', 'marion', 'SA', '5047', 'Australia');

select * from address;