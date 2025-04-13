USE moattravelDB;
GO

CREATE TABLE houses (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    image_name VARCHAR(255),
    description VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    capacity INT NOT NULL,
    postal_code VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP
);

GO

CREATE TRIGGER trg_UpdateUpdatedAt
ON houses
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE houses
    SET updated_at = CURRENT_TIMESTAMP
    FROM houses h
    INNER JOIN inserted i ON h.id = i.id;
END;
GO
