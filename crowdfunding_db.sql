-- Drop the tables if they exist
DROP TABLE IF EXISTS campaign_merged, subcategory, contacts, category;

-- Create the 'category' table
CREATE TABLE category (
    category_id VARCHAR(255) PRIMARY KEY,
    category VARCHAR(255) NOT NULL 
);

-- Create the 'subcategory' table
CREATE TABLE subcategory (
    subcategory_id VARCHAR(255) PRIMARY KEY,
    subcategory VARCHAR(255) NOT NULL
);

-- Create the 'contacts' table
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

-- Create the 'campaign_merged' table
CREATE TABLE campaign_merged (
    cf_id INT NOT NULL PRIMARY KEY,
    contact_id INT NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    goal FLOAT NOT NULL,
    pledged FLOAT NOT NULL,
    outcome VARCHAR(255) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(255) NOT NULL,
    currency VARCHAR(255) NOT NULL,
    launched_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    category_id VARCHAR(255) NOT NULL,
    subcategory_id VARCHAR(255) NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),    
	FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

-- To import files into tables made in the schemas above follow the steps below: 
-- 1. Right click on table schema in PostGres, Select Import/Export Data, Import category.csv from file, 
-- check Columns match columns from schema and Select OK. Confirm successful import. 

-- 2. Repeat the process above for the rest of the tables and ensure to follow the order below: 
--- : 1)'category', 2)'subcategory', 3)'contacts' then 4)'campaign_merged'. 

-- Viewing the tables and verifying the data imported in each table. 
SELECT * FROM campaign_merged;
SELECT * FROM category;	
SELECT * FROM subcategory;
SELECT * FROM contacts;
