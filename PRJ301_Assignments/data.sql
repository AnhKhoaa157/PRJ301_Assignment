/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  LENOVO
 * Created: Feb 25, 2025
 */
Create database Muabangame_com;
Use Muabangame_com

CREATE TABLE tblGames (
    game_id      INT PRIMARY KEY IDENTITY(1,1),
    game_name    NVARCHAR(255) NOT NULL,
    price        DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    release_date DATE,
    genre        NVARCHAR(100),
    platform     NVARCHAR(100),
    description  NVARCHAR(MAX),
    stock        INT DEFAULT 0 CHECK (stock >= 0),
    image_url    NVARCHAR(255),
    created_at   DATETIME DEFAULT GETDATE(),
    updated_at   DATETIME DEFAULT GETDATE()
);

CREATE TABLE tblUsers (
    user_id    INT PRIMARY KEY IDENTITY(1,1),
    username   NVARCHAR(255) NOT NULL UNIQUE,
    password   NVARCHAR(255) NOT NULL,
    email      NVARCHAR(255) NOT NULL UNIQUE,
    phone      NVARCHAR(20),
    address    NVARCHAR(255),
    role       NVARCHAR(20) DEFAULT 'Customer' CHECK(role IN ('Customer', 'Admin')),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE tblOrders (
    order_id    INT PRIMARY KEY IDENTITY(1,1),
    user_id     INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
    status      NVARCHAR(50) DEFAULT 'pending' CHECK (status IN ('pending', 'processing', 'completed', 'canceled')),
    created_at  DATETIME DEFAULT GETDATE(),
    updated_at  DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES tblUsers(user_id) ON DELETE CASCADE
);

CREATE TABLE tblOrderDetails (
    order_detail_id INT PRIMARY KEY IDENTITY(1,1),
    order_id        INT NOT NULL,
    game_id         INT NOT NULL,
    quantity        INT NOT NULL CHECK (quantity > 0),
    price          DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    total_price    AS (quantity * price) PERSISTED,
    FOREIGN KEY (order_id) REFERENCES tblOrders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES tblGames(game_id) ON DELETE CASCADE
);

CREATE TABLE tblPayments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    order_id   INT NOT NULL,
    user_id    INT NOT NULL,
    amount     DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    method     NVARCHAR(50) NOT NULL CHECK (method IN ('credit_card', 'paypal', 'bank_transfer')),
    status     NVARCHAR(50) DEFAULT 'pending' CHECK (status IN ('pending', 'completed', 'failed')),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES tblOrders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES tblUsers(user_id) ON DELETE CASCADE
);

CREATE TABLE tblReviews (
    review_id  INT PRIMARY KEY IDENTITY(1,1),
    game_id    INT NOT NULL,
    user_id    INT NOT NULL,
    rating     INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment    NVARCHAR(1000),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (game_id) REFERENCES tblGames(game_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES tblUsers(user_id) ON DELETE CASCADE
);

CREATE TABLE tblCart (
    cart_id  INT PRIMARY KEY IDENTITY(1,1),
    user_id  INT NOT NULL,
    game_id  INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    added_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES tblUsers(user_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES tblGames(game_id) ON DELETE CASCADE
);

CREATE TABLE tblDiscounts (
    discount_id      INT PRIMARY KEY IDENTITY(1,1),
    game_id          INT NOT NULL,
    discount_percent DECIMAL(5,2) NOT NULL CHECK (discount_percent BETWEEN 0 AND 100),
    start_date       DATE NOT NULL,
    end_date         DATE NOT NULL,
    FOREIGN KEY (game_id) REFERENCES tblGames(game_id) ON DELETE CASCADE
);

CREATE TABLE tblWishlists (
    wishlist_id INT PRIMARY KEY IDENTITY(1,1),
    user_id     INT NOT NULL,
    game_id     INT NOT NULL,
    added_at    DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES tblUsers(user_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES tblGames(game_id) ON DELETE CASCADE
);
