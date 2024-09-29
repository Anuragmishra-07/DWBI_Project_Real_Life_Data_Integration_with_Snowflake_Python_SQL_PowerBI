--load data files into snowflake stage

put 'file://C:/Users/LENOVO SSD/PycharmProjects/DWBI_Project_Real_Life_Data_Integration_with_Snowflake_Python_SQL_PowerBI/data_files/Product_data.csv' @test_db.test_db_scema.test_stage/Product_data/ auto_compress=FALSE;

put 'file://C:/Users/LENOVO SSD/PycharmProjects/DWBI_Project_Real_Life_Data_Integration_with_Snowflake_Python_SQL_PowerBI/data_files/Product_data.csv' @test_db.test_db_scema.test_stage/Product_data/ auto_compress=FALSE;

put 'file://C:/Users/LENOVO SSD/PycharmProjects/DWBI_Project_Real_Life_Data_Integration_with_Snowflake_Python_SQL_PowerBI/data_files/Product_data.csv' @test_db.test_db_scema.test_stage/Product_data/ auto_compress=FALSE;
										   
put 'file://C:/Users/LENOVO SSD/PycharmProjects/DWBI_Project_Real_Life_Data_Integration_with_Snowflake_Python_SQL_PowerBI/data_files/Product_data.csv' @test_db.test_db_scema.test_stage/Product_data/ auto_compress=FALSE;
										   
put 'file://C:/Users/LENOVO SSD/PycharmProjects/DWBI_Project_Real_Life_Data_Integration_with_Snowflake_Python_SQL_PowerBI/data_files/factorders.csv' @test_db.test_db_scema.test_stage/factorders/ auto_compress=FALSE;

put 'file://C:/Users/LENOVO SSD/PycharmProjects/DWBI_Project_Real_Life_Data_Integration_with_Snowflake_Python_SQL_PowerBI/Landing_Directory/*' @test_db.test_db_scema.test_stage/Landing_Directory/ auto_compress=FALSE;

--load data into table

copy into TEST_DB.TEST_DB_SCEMA.dimloyaltyprogram
from @test_db.test_db_scema.test_stage/DimLoyaltyInfo/
file_format=(format_name='csv_source_file_format');

copy into TEST_DB.TEST_DB_SCEMA.DIMDATE
from @test_db.test_db_scema.test_stage/DimDate/
file_format=(format_name='csv_source_file_format');

copy into TEST_DB.TEST_DB_SCEMA.DIMPRODUCT(ProductName,Category,Brand,UnitPrice)
from @test_db.test_db_scema.test_stage/Product_data/
file_format=(format_name='csv_source_file_format');

copy into TEST_DB.TEST_DB_SCEMA.DIMSTORE(StoreName,StoreType,StoreOpeningDate,Address,City,State,Country,Region,ManagerName)
from @test_db.test_db_scema.test_stage/store_data/
file_format=(format_name='csv_source_file_format');

copy into
TEST_DB.TEST_DB_SCEMA.DIMCUSTOMER(FirstName,LastName,Gender,DateOfBirth,Email,PhoneNumber,Address,City,State,PostalCode,Country,LoyaltyProgramID)
from @test_db.test_db_scema.test_stage/cust_data/
file_format=(format_name='csv_source_file_format');

copy into
TEST_DB.TEST_DB_SCEMA.FACTORDERS(DateID,ProductID,StoreID,CustomerID,QuantityOrderded,OrderAmount,DiscountAmount,ShippingCost,TotalAmount)
from @test_db.test_db_scema.test_stage/factorders/
file_format=(format_name='csv_source_file_format');

copy into
TEST_DB.TEST_DB_SCEMA.FACTORDERS(DateID,ProductID,StoreID,CustomerID,QuantityOrderded,OrderAmount,DiscountAmount,ShippingCost,TotalAmount)
from @test_db.test_db_scema.test_stage/Landing_Directory/
file_format=(format_name='csv_source_file_format');