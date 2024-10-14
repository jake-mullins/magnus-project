CREATE TABLE "User" (
    id              SERIAL PRIMARY KEY,
    google_id       VARCHAR(255) NOT NULL UNIQUE,
    display_name    VARCHAR(255) NOT NULL UNIQUE,
    email           VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE "IncidentLocal" (
    id_incident_local SERIAL PRIMARY KEY,
    owner_id SERIAL REFERENCES "User"(id),
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE "Signal" (
    signal_id   SERIAL PRIMARY KEY,
    signal_url  TEXT NOT NULL,
    timestamp   TEXT,
    metadata TEXT,
    lat_lon TEXT,
    notes TEXT,
    id_incident_local INT REFERENCES "IncidentLocal"(id_incident_local) ON DELETE CASCADE,
    owner_id SERIAL REFERENCES "User"(id)
);

CREATE TABLE "IncidentLocalUserPermissions" (
    id_incident_local INT REFERENCES "IncidentLocal"(id_incident_local) ON DELETE CASCADE,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    permission TEXT NOT NULL,
    PRIMARY KEY (id_incident_local, user_id)
);
