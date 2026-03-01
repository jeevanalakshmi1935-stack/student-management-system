CREATE DATABASE zero_waste_zero_hunger;

USE zero_waste_zero_hunger;
CREATE TABLE donors (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE receivers (
    receiver_id INT AUTO_INCREMENT PRIMARY KEY,
    organization_name VARCHAR(150),
    contact_person VARCHAR(100),
    phone VARCHAR(15),
    location VARCHAR(150)
);
CREATE TABLE food_donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT,
    food_name VARCHAR(100),
    quantity INT,
    food_type VARCHAR(50),
    expiry_time DATETIME,
    pickup_address TEXT,
    status VARCHAR(50) DEFAULT 'Available',
    
    FOREIGN KEY (donor_id)
    REFERENCES donors(donor_id)
    ON DELETE CASCADE
);
CREATE TABLE food_requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    receiver_id INT,
    donation_id INT,
    request_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    request_status VARCHAR(50) DEFAULT 'Pending',

    FOREIGN KEY (receiver_id)
    REFERENCES receivers(receiver_id),

    FOREIGN KEY (donation_id)
    REFERENCES food_donations(donation_id)
);
INSERT INTO donors(name,email,phone,address)
VALUES
('Ravi Kumar','ravi@gmail.com','9876543210','Vijayawada'),
('Anjali','anjali@gmail.com','9123456780','Guntur');
INSERT INTO receivers(organization_name,contact_person,phone,location)
VALUES
('Helping Hands NGO','Suresh','9000000001','Vijayawada');
INSERT INTO food_donations
(donor_id,food_name,quantity,food_type,expiry_time,pickup_address)
VALUES
(1,'Rice Meals',50,'Veg','2026-03-02 18:00:00','Benz Circle');
INSERT INTO food_requests(receiver_id, donation_id)
VALUES (1,1);
UPDATE food_donations
SET status='Collected'
WHERE donation_id=1;
SELECT d.name AS Donor,
       f.food_name,
       r.organization_name,
       fr.request_status
FROM food_requests fr
JOIN food_donations f ON fr.donation_id = f.donation_id
JOIN donors d ON f.donor_id = d.donor_id
JOIN receivers r ON fr.receiver_id = r.receiver_id;
