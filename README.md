# Crowdfunding (Extract, Transform, Load) 
## UWA Project 2 - Data Analytics Data Cleaning Challenge 

## Collaborators 
[`Damian Kifuso`](https://github.com/DamianKifuso)
[`Nestor Pardo`](https://github.com/kfetero)
[`Jesslyn Lengkong`](https://github.com/jflengkong) 


## Background & Instructions 
For the ETL mini project, we worked within a group to practice building an ETL pipeline using Python, Pandas, and either Python dictionary methods or regular expressions to extract and transform the data. After transforming the data, we will create four CSV files and use the CSV file data to create an ERD and a table schema. Finally, we are required to upload the CSV file data into a Postgres database.

### The instructions for this mini project are divided into the following subsections:
- [Part 1:](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/tree/main#Part-1-Create-the-Category-and-Subcategory-DataFrames) Create the Category and Subcategory DataFrames 
- [Part 2: ](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/tree/main#Part-2-Create-the-Campaign-DataFrame)Create the Campaign DataFrame
- [Part 3: ](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/tree/mainPart-3-Create-the-Crowdfunding-Database)Create-the-Contacts DataFrame
- [Part 4: ](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/tree/main#Part-4-Create-the-Crowdfunding-Database)Create the Crowdfunding Database

## Contents: 
1. `Images`  - Folder for screenshots of results
2. `Resources` - Folder for the two Excel Workbooks used [`crowdfunding.xlsx`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Resources/crowdfunding.xlsx) and [`~$crowdfunding.xlsx`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Resources/~%24crowdfunding.xlsx) and the resulting 4 CSV: [`campaign_csv`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Resources/campaign.csv), [`category_csv`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Resources/category.csv), [`contacts.csv`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Resources/contacts.csv), [`subcategory_csv`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Resources/subcategory.csv)
3. [`Jupyter Notebook for ETL`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/ETL_Mini_Project_Grp_1.ipynb)
4. [`crowdfunding_db_schema`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/crowdfunding_db_schema.sql) and [`crowdfunding_db`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/crowdfunding_db.sql)
  
## Part 1 Create the Category and Subcategory DataFrames
Instructions: Extract and transform the crowdfunding.xlsx Excel data to create a category DataFrame that has the following columns:
- A "category_id" column that has entries going sequentially from "cat1" to "catn", where n is the number of unique categories
- A "category" column that contains only the category titles
- A "subcategory_id" column that has entries going sequentially from "subcat1" to "subcatn", where n is the number of unique subcategories
- A "subcategory" column that contains only the subcategory titles
  
<b> Method: </b> Through assignment of category and subcategory columns and splitting the original 'name' column, we were able to obtain the column names. From here, with the use of numpy arrays and list comprehension, we were able to add the word 'cat to create category ids suitable for each said value. This was then converted into a Pandas DataFrame and exported into a csv:[`category_csv`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Resources/category.csv).

<b> Resulting Category & Subcategory DataFrames: </b>

![category](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Images/1.categories.png)                  ![subcategory](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Images/2.subcategories.png)


## Part 2: Create the Campaign DataFrame 
Instructions: Extract and transform the crowdfunding.xlsx Excel data to create a campaign DataFrame has the following columns: 
- The "cf_id" column
- The "contact_id" column
- The "company_name" column
- The "blurb" column, renamed to "description"
- The "goal" column, converted to the float data type
- The "pledged" column, converted to the float data type
- The "outcome" column
- The "backers_count" column
- The "country" column
- The "currency" column
- The "launched_at" column, renamed to "launch_date" and with the UTC times converted to the datetime format
- The "deadline" column, renamed to "end_date" and with the UTC times converted to the datetime format
- The "category_id" column, with unique identification numbers matching those in the "category_id" column of the category DataFrame
- The "subcategory_id" column, with the unique identification numbers matching those in the "subcategory_id" column of the subcategory DataFrame
Export the campaign DataFrame as campaign.csv and save it to your GitHub repository.

<b> Method: </b> After reading the .xlsx file through pandas, we started on renaming the following columns: 'blurb' to 'description', 'launched_at' to 'launched_date' and 'deadline' to 'end_date'. 

We then proceeded to convert the data types: 
- 'goal' and 'pledged' columns to floats
- 'launched_date' and 'end_date' to datetime

The new dataframe was then merged with category and subcategory tables created in Part 1 and irrelevant columns dropped. The resultant dataframe was then exported to: [`campaign_csv`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Resources/campaign.csv) and is displayed below with the data types confirmed. 

<b> Campaign DataFrame </b> 
![campaign_df](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Images/3.campaign_cleaned.png)

<b> Campaign DataFrame Converted Data Types </b> 

![campaign+dtype](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Images/3.5.campaign_info.png)

## Part 3: Create the Crowdfunding Database 
Instructions: Choose one of the following two options for extracting and transforming the data from the contacts.xlsx Excel data:
- Option 1: Use Python dictionary methods.
- Option 2: Use regular expressions.

As there were 3 collaborators, we had the opportunity to explore both options of extracting and transformating the data through the Python dictionary method and regular expression.  
### Use Python Dictionary method 
We were able to follow the steps: 
- Iterate through the DataFrame, converting each row to a dictionary.
- Iterate through each dictionary, doing the following:
- Extract the dictionary values from the keys by using a Python list comprehension.
- Add the values for each row to a new list.
- Create a new DataFrame that contains the extracted data.
- Split each "name" column value into a first and last name, and place each in a new column.
- Clean and export the DataFrame as contacts.csv and save it to your GitHub repository. 

### Use Regular Expression 
- Extract the "contact_id", "name", and "email" columns by using regular expressions.
- Create a new DataFrame with the extracted data.
- Convert the "contact_id" column to the integer type.
- Split each "name" column value into a first and a last name, and place each in a new column.
- Clean and then export the DataFrame as contacts.csv and save it to your GitHub repository.

<b> Contact DataFrame and Converted Data Types </b> 
![contacts](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/Images/4.contacts.png)


## Part 4: Create the Crowdfunding Database 
We were required to inspect the four CSV to create the following: 
- Sketch of an ERD of tables
- Create a schema with the file name crowdfunding_db_schema.sql
- Create a Postgres databased 'crowdfunding_db' and create tables to handle the Foreign Keys.
- Create tables and verify by running a SELECT statement for each table.
- Import each CSV file into its corresponding SQL table and verify correct data by running SELECT statement for each. 

A crowdfunding database ERD was created using [QuickDBD](https://www.quickdatabasediagrams.com/) which shows foreign and primary keys as required. The sql files:  [`crowdfunding_db_schema`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/crowdfunding_db_schema.sql) and [`crowdfunding_db`](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/crowdfunding_db.sql) where all tables were imported successfully in order as required to handle the foreign keys. 

<b> Crowdfunding Database ERD </b> 
![erd](https://github.com/jflengkong/Crowdfunding_ETL_Grp_1/blob/main/crowdfunding_ERD.png) 

## Conclusion
Through this challenge we were able to complete the pathway of ETL - Extracting, Transforming and Loading data from a source of information. This allows us to be able to work with large foiles and simplify the querying of information where required instead of trolling through a large and extensive database. 

## References
[1] QUICKDBD - [Quick DBD](https://www.quickdatabasediagrams.com/) 

[2] UWA - Data for this dataset was generated by edX Boot Camps LLC, and is intended for educational purposes only. 

