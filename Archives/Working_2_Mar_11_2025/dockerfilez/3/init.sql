USE asterisk;

CREATE TABLE IF NOT EXISTS sip (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    host VARCHAR(40) DEFAULT 'dynamic',
    context VARCHAR(20) DEFAULT 'internal',
    secret VARCHAR(20) NOT NULL,
    type VARCHAR(10) DEFAULT 'friend',
    disallow VARCHAR(50) DEFAULT 'all',
    allow VARCHAR(50) DEFAULT 'ulaw'
);

INSERT INTO sip (name, secret) VALUES ('1001', 'pass1001'), ('1002', 'pass1002');

CREATE TABLE IF NOT EXISTS extensions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    context VARCHAR(20),
    exten VARCHAR(20),
    priority INT,
    app VARCHAR(20),
    appdata VARCHAR(100)
);

INSERT INTO extensions (context, exten, priority, app, appdata) VALUES
('internal', '1001', 1, 'Dial', 'PJSIP/1001'),
('internal', '1002', 1, 'Dial', 'PJSIP/1002');

