CREATE TABLE "User" (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    google_id       VARCHAR(255) NOT NULL UNIQUE,
    display_name    VARCHAR(255) NOT NULL UNIQUE,
    email           VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE "IncidentLocal" (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_id    UUID REFERENCES "User"(id),
    name        VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE "Signal" (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    signal_url          TEXT NOT NULL,
    timestamp           TEXT,
    metadata            TEXT,
    lat_lon             TEXT,
    notes               TEXT,
    incident_local_id   UUID REFERENCES "IncidentLocal"(id) ON DELETE CASCADE,
    owner_id            UUID REFERENCES "User"(id)
);

CREATE TABLE "IncidentLocalUserPermissions" (
    incident_local_id   UUID REFERENCES "IncidentLocal"(id) ON DELETE CASCADE,
    user_id             UUID REFERENCES "User"(id) ON DELETE CASCADE,
    permission          TEXT NOT NULL,
    PRIMARY KEY (id_incident_local, user_id)
);
