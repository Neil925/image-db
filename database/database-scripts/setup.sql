
CREATE DATABASE IF NOT EXISTS imagedb;

USE imagedb;

CREATE TABLE IF NOT EXISTS users(
	id CHAR(36) UNIQUE PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    displayName VARCHAR(255),
    -- password VARCHAR(255), Need to actually figure out how we're doing auth.
    roleId INT, -- 0 user, 1 mod, 2 admin
    createdDate DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS image (
	id INT AUTO_INCREMENT PRIMARY KEY,
    uploadedBy CHAR(36),
	filename CHAR(36),
    extension VARCHAR(5),
    dateOfUpload DATETIME DEFAULT NOW(),
    CONSTRAINT fk_uploadedBy FOREIGN KEY (uploadedBy) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS tag (
	id INT AUTO_INCREMENT PRIMARY KEY,
    tagName VARCHAR(255),
    tagType INT, -- 0 descriptor, 1 character, 2 creator, 3 meta
    dateCreated DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS imageTag(
	id INT AUTO_INCREMENT PRIMARY KEY,
	imageId INT,
	tagId INT,
    CONSTRAINT fk_imageId FOREIGN KEY (imageId) REFERENCES image(id),
    CONSTRAINT fk_tagId FOREIGN KEY (tagId) REFERENCES tag(id)
);

