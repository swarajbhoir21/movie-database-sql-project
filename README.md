# Movie Database Insights – SQL Project

## Why I built this
I wanted to practice SQL in a way that felt more real than just solving textbook queries. Movies felt like the right dataset since they combine business (revenue, budget) with creativity (ratings, directors, industries).  
So I designed my own database, added both Hollywood and Bollywood films, and explored the data through different queries.  

## How the project is structured
- **Schema 1**: Creating the `movies` table and inserting records  
- **Schema 2**: Running analysis queries to explore trends and insights  

## What I explored
- Which movies generated the most profit (revenue vs budget)  
- How Bollywood compares with Hollywood in terms of ratings and revenue  
- Differences between critic scores and audience scores  
- Which directors consistently produced high-rated movies  

## Key learning outcomes
- Practiced designing tables and altering schema as the project grew  
- Used queries to answer real-world style business questions  
- Learned to structure SQL scripts in a way that’s reusable (creation vs queries separated)  

## How to run
1. Open SQL*Plus (Oracle)  
2. Run schema 1 to set up the database:  
   ```sql
   @1_schema_creation_insertion.sql
