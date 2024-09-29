import pandas as pd
import numpy as np
import os

DATEID = '20240929'
directory = "C:/Users/LENOVO SSD/PycharmProjects/DWBI_Project_Real_Life_Data_Integration_with_Snowflake_Python_SQL_PowerBI/Landing_Directory/"

# Check if directory exists, if not, create it
if not os.path.exists(directory):
    os.makedirs(directory)

for i in range(1, 101):
    num_rows = np.random.randint(100, 1000)
    data = {
        'DateID': [DATEID] * num_rows,
        'ProductID': np.random.randint(1, 101, size=num_rows),
        'StoreID': [i] * num_rows,
        'CustomerID': np.random.randint(1, 1001, size=num_rows),
        'QuantityOrderded': np.random.randint(1, 21, size=num_rows),
        'OrderAmount': np.random.randint(100, 1001, size=num_rows)
    }

    df = pd.DataFrame(data)

    discount_perc = np.random.uniform(0.02, 0.15, size=num_rows)
    shipping_cost = np.random.uniform(0.05, 0.15, size=num_rows)

    # calculate columns
    df['DiscountAmount'] = df['OrderAmount'] * discount_perc
    df['Shipping Cost'] = df['OrderAmount'] * shipping_cost
    df['TotalAmount'] = df['OrderAmount'] - (df['DiscountAmount'] + df['Shipping Cost'])

    file_name = f'Store_{i}_{DATEID}.csv'
    file_path = os.path.join(directory, file_name)

    # if file exists remove and write again
    if os.path.exists(file_path):
        os.remove(file_path)

    df.to_csv(file_path, index=False)

print("Files have been successfully saved.")
