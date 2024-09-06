# Kindle Books Analysis
*This repository contains a detailed analysis of Kindle book data. The project involves extracting data from Kaggle, transforming and loading it into Snowflake, and performing various analyses to answer key questions about Kindle books.*

### Project Overview
In this project, we analyze a dataset of Kindle books to understand different aspects such as why some books become bestsellers, how book ratings affect the number of reviews, and how book prices influence their popularity. We also explore the impact of Kindle Unlimited and Goodreads Choice on book performance.

#### Data
The dataset used in this project is the Amazon Kindle Books Dataset (2023). The dataset includes information about Kindle books, such as ratings, reviews, prices, and more.

#### Tools and Technologies
- **Jupyter Notebook:** Used to execute Python code for data cleaning and transformation.
- **Python:** Used for data cleaning and preparation, primarily using the Pandas library.
- **Snowflake:** Used for storing the dataset and running SQL queries for analysis.
- **Excel:** Used to create data visualizations, including charts and graphs to show key trends.

### Repository Structure
- **query-results-csv/:** Folder containing CSV files resulting from SQL queries.
- **visualization-graphs/:**  Folder with all sql queries data visualization graphs.
- **Analysis of Amazon Kindle Books Sales and Customer Insights (2023).ipynb/:** Jupyter Notebook file with analysis and insights.
- **README.md:** Markdown file with a description of the project, setup instructions, and other relevant information.

### Setup
1. **Clone the repository**
   ``` bash
   git clone https://github.com/yourusername/kindle-books-analysis.git
   cd kindle-books-analysis
   ```
2. **Set Up Environment Variables**
   Before running the analysis, make sure to configure your environment variables to securely manage sensitive information such as Snowflake credentials.
   1. Create a ```.env``` file in the root of your project or export the following variables in your environment:
   - ```SNOWFLAKE_USER```: Your Snowflake username
   - ```SNOWFLAKE_PASSWORD```: Your Snowflake password
   - ```SNOWFLAKE_ACCOUNT```: Your Snowflake account URL
   - ```SNOWFLAKE_WAREHOUSE```: Snowflake warehouse to use
   - ```SNOWFLAKE_DATABASE```: Snowflake database where your dataset is stored
   - ```SNOWFLAKE_SCHEMA```: The schema where your data is located

  2. Example ```.env``` file format:
     ```
     SNOWFLAKE_USER=your_username
     SNOWFLAKE_PASSWORD=your_password
     SNOWFLAKE_ACCOUNT=your_account_url
     SNOWFLAKE_WAREHOUSE=your_warehouse
     SNOWFLAKE_DATABASE=your_database
     SNOWFLAKE_SCHEMA=your_schema
     ```
  3. Install Dependencies:
      ```
      pip install -r requirements.txt
      ```
      ```
      # Install Kaggle for dataset download
      pip install kaggle
      
      # Install Pandas for data manipulation
      pip install pandas
      
      # Install Snowflake connector for data loading and queries
      pip install snowflake-connector-python
      
      # Install dotenv to handle environment variables
      pip install python-dotenv
      ```


### How to Run Analysis
  To perform the analysis, open the ```Analysis_of_Amazon_Kindle_Books.ipynb``` Jupyter notebook. Ensure you have the necessary Snowflake access configured in the notebook to run the SQL queries and perform the analysis.

### Key Insights
1. **Best Sellers:** Have higher average ratings, more reviews, and lower prices compared to non-Best Sellers.
2. **Ratings and Reviews:** Higher-rated books tend to receive more reviews.
3. **Price Impact:** Lower-priced books are more likely to be Best Sellers.
4. **Editor’s Picks:** Slightly higher-rated but not significantly different from other books.
5. **Kindle Unlimited:** Associated with more reviews but slightly lower ratings.
6. **Category Performance:** Ratings and reviews vary across categories, with some categories performing better in either aspect.
7. **Rating Trends:** Average ratings have been high over time with some recent fluctuations.
8. **Best Seller Trends:** Best Sellers maintain high ratings and see an increase in reviews over time.
9. **Top-Rated Books Pricing:** Many top-rated books are available for free.
10. **Goodreads Choice:** Books recognized as Goodreads Choice selections tend to have higher ratings.

### Acknowledgments
- **Pandas in Python** for data manipulation and cleaning tools used in the project.
- **Kaggle** for providing the Kindle book dataset.
- **Snowflake** for the data warehousing and analysis platform.
- **Excel** for enabling visualization of the data.
- **SQL** for the data queries and analysis in Snowflake.


