USE asterisk_db;

CREATE TABLE ps_endpoints (
  id VARCHAR(40) NOT NULL PRIMARY KEY,
  transport VARCHAR(40) NULL,
  aors VARCHAR(200) NULL UNIQUE,
  auth VARCHAR(40) NULL UNIQUE,
  context VARCHAR(40) NULL,
  disallow VARCHAR(200) NULL,
  allow VARCHAR(200) NULL,
  direct_media VARCHAR(40) NULL,
  connected_line_method VARCHAR(40) NULL,
  callerid VARCHAR(40) NULL,
  dtmf_mode VARCHAR(40) NULL
);

CREATE TABLE ps_auths (
  id VARCHAR(40) NOT NULL PRIMARY KEY,
  auth_type VARCHAR(40) NOT NULL,
  username VARCHAR(40) NULL UNIQUE,
  password VARCHAR(40) NULL,
  md5_cred VARCHAR(40) NULL,
  realm VARCHAR(40) NULL
);

CREATE TABLE ps_aors (
  id VARCHAR(40) NOT NULL PRIMARY KEY,
  max_contacts INTEGER NULL
);


CREATE TABLE extensions_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    context VARCHAR(50) NOT NULL,
    exten VARCHAR(50) NOT NULL UNIQUE,
    priority INT NOT NULL,
    app VARCHAR(50) NOT NULL,
    appdata VARCHAR(100)
);



INSERT INTO ps_endpoints (id, transport, aors, auth, context, disallow, allow) 
VALUES ('1001', 'transport-udp', '1001', '1001', 'default', 'all', 'ulaw,alaw');

INSERT INTO ps_auths (id, auth_type, username, password) 
VALUES ('1001', 'userpass', '1001', 'mypassword');

INSERT INTO ps_aors (id, max_contacts) 
VALUES ('1001', 1);



-- Add Authentication for 1002
INSERT INTO ps_auths (id, auth_type, username, password) 
VALUES ('1002', 'userpass', '1002', 'securepass');

-- Add Endpoint for 1002
INSERT INTO ps_endpoints (id, transport, aors, auth, context, disallow, allow, direct_media) 
VALUES ('1002', 'transport-udp', '1002', '1002', 'default', 'all', 'ulaw,alaw', 'no');

-- Add AOR (Address of Record) for 1002
INSERT INTO ps_aors (id, max_contacts) 
VALUES ('1002', 2);


INSERT INTO extensions_table (context, exten, priority, app, appdata) 
VALUES 
('default', '1001', 1, 'Dial', 'PJSIP/1001,20'),
('default', '1002', 1, 'Dial', 'PJSIP/1002,20');

SELECT * FROM extensions_table;

-- DROP TABLE `extensions_table`;

SELECT * FROM extensions_table WHERE context='default';


SHOW TABLES;

