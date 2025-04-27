DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

IF NOT EXISTS (
    SELECT *
FROM sysobjects
WHERE name = 'houses' AND xtype = 'U'
)
EXEC('
    CREATE TABLE houses (
        id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
        name NVARCHAR(50) NOT NULL,
        image_name NVARCHAR(255) NOT NULL,
        description NVARCHAR(255) NOT NULL,
        price INT NOT NULL,
        capacity INT NOT NULL,
        postal_code NVARCHAR(50) NOT NULL,
        address NVARCHAR(255) NOT NULL,
        phone_number NVARCHAR(50) NOT NULL,
        created_at DATETIME NOT NULL DEFAULT GETDATE(),
        updated_at DATETIME NOT NULL DEFAULT GETDATE()
    )
');


IF NOT EXISTS (SELECT *
FROM sysobjects
WHERE name = 'roles' AND xtype = 'U')
    EXEC('
        CREATE TABLE roles (
            id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
            name NVARCHAR(50) NOT NULL
        )
    ')


IF NOT EXISTS (SELECT *
FROM sysobjects
WHERE name = 'users' AND xtype = 'U')
    EXEC('
        CREATE TABLE users (
            id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
            name NVARCHAR(50) NOT NULL,
            furigana NVARCHAR(50) NOT NULL,
            postal_code NVARCHAR(50) NOT NULL,
            address NVARCHAR(255) NOT NULL,
            phone_number NVARCHAR(50) NOT NULL,
            email NVARCHAR(255) NOT NULL UNIQUE,
            password NVARCHAR(255) NOT NULL,
            role_id INT NOT NULL,
            enabled BIT NOT NULL,
            created_at DATETIME NOT NULL DEFAULT GETDATE(),
            updated_at DATETIME NOT NULL DEFAULT GETDATE(),
            FOREIGN KEY (role_id) REFERENCES roles(id)
        )
    ')
