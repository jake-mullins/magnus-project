INSERT INTO "User" (google_id, display_name, email)
VALUES 
    ('105737699977316017807', 'Jake Mullins', 'jakemullins0@outlook.com');

INSERT INTO "IncidentLocal" (owner_id, name, description)
VALUES 
    ((SELECT id FROM "User" WHERE google_id = '105737699977316107807'), 'Moscow Shooting', 'April 22nd 2024, a shooter opened fire on a crowded theater in Moscow'),
    ((SELECT id FROM "User" WHERE google_id = '105737699977316107807'), 'Hawaii fires', 'October 26th 2023, wildfires raged in Lahaina, Hawaii destroying an entire neighborhood');

INSERT INTO "Signal" (signal_url, metadata, lat_lon, notes, incident_local_id, owner_id)
VALUES
    ('https://x.com/p/0123456789abcdef', '', '-49.30003,50.33334', '@ananya_kumar filmed shooter from row 26b facing southeast. Footage is blurry, but gunshots can be heard. Footage taken on iPhone 12', (SELECT id FROM "IncidentLocal" WHERE description = "Moscow Shooting"), (SELECT id FROM "User" WHERE google_id = '105737699977316107807')),
    ('https://facebook.com/p/123412341234', '', '-49.30023,50.32212', '@katerina filmed shooter from behind stage. Footage is able to identify shooter as a known Chechyan separatist', (SELECT id FROM "IncidentLocal" WHERE description = "Moscow Shooting"), (SELECT id FROM "User" WHERE google_id = '105737699977316107807')),
    ('https://x.com/p/0123456789abcdef', 'Does not look super reliable', '-30.222,11.22323', '@jakemullins0_t Filmed multiple houses erupting into flames', (SELECT id FROM "IncidentLocal" WHERE description = "Hawaii fires"), (SELECT id FROM "User" WHERE google_id = '105737699977316107807'));
