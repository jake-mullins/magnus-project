CREATE TABLE "User" (
    UserID SERIAL PRIMARY KEY,
    Username VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE "IncidentLocal" (
    IDIncidentLocal SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

CREATE TABLE "Signal" (
    SignalID SERIAL PRIMARY KEY,
    SignalURL TEXT NOT NULL,
    Timestamp TEXT,
    Metadata TEXT,
    LatLon TEXT,
    Notes TEXT,
    IDIncidentLocal INT REFERENCES "IncidentLocal"(IDIncidentLocal) ON DELETE CASCADE
);

CREATE TABLE "IncidentLocalUserPermissions" (
    IDIncidentLocal INT REFERENCES "IncidentLocal"(IDIncidentLocal) ON DELETE CASCADE,
    UserID INT REFERENCES "User"(UserID) ON DELETE CASCADE,
    Permission TEXT NOT NULL,
    PRIMARY KEY (IDIncidentLocal, UserID)
);
