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

-- Viewing the tables 
SELECT * FROM campaign_merged;
SELECT * FROM category;	
SELECT * FROM subcategory;
SELECT * FROM contacts;
