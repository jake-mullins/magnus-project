INSERT INTO "User" (username)
VALUES 
('test1'),
('test2'),
('test3');

INSERT INTO "IncidentLocal" (name, description)
VALUES 
('Moscow Shooting', 'April 22nd 2024, a shooter opened fire on a crowded theater in Moscow'),
('Hawaii fires', 'October 26th 2023, wildfires raged in Lahaina, Hawaii destroying an entire neighborhood');

INSERT INTO "Signal" (signalurl, metadata, latlon, notes, idincidentlocal) VALUES
('https://x.com/p/0123456789abcdef', '', '-49.30003,50.33334', '@ananya_kumar filmed shooter from row 26b facing southeast. Footage is blurry, but gunshots can be heard. Footage taken on iPhone 12', 1),
('https://facebook.com/p/123412341234', '', '-49.30023,50.32212', '@katerina filmed shooter from behind stage. Footage is able to identify shooter as a known Chechyan separatist', 1);
