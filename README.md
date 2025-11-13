# 📊 Netflix Data Analytics Using SQL

A complete end-to-end SQL project analyzing Netflix content trends, ratings, actors, countries, and genre insights using advanced SQL techniques.

---

## 📝 Project Overview

This project focuses on analyzing Netflix’s global content library using PostgreSQL.

The dataset includes movies and TV shows, along with information like cast, country, duration, rating, and description.

The goal was to extract meaningful insights using SQL queries, covering exploratory analysis, text processing, date manipulation, and content classification.

---

## 🛠️ Tools & Technologies

* SQL (PostgreSQL)
* Window Functions
* CTEs (WITH clause)
* Date & String Functions
* Aggregations & Ranking
* Data Cleaning & Parsing

---

## 📂 Dataset Structure

The dataset consists of the following columns:

`show_id`, `type`, `title`, `director`, `casts`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, `description`

---

## 🎯 Key Objectives

* Analyze Netflix's content distribution (Movies vs TV Shows)
* Identify top countries producing Netflix content
* Extract high-performing actors from India
* Find the longest movies and multi-season TV shows
* Analyze movie ratings and most common rating categories
* Process semi-structured text fields (casts, description, country)
* Classify content into Good and Bad using keyword detection
* Perform time-based analysis (content added in last 5 years)

---

## 📌 Core SQL Tasks & Insights

1.  **Total Netflix Content**
    * Counted all entries present in the dataset.

2.  **Movies vs TV Shows**
    * Identified 2 major content types and their respective counts.

3.  **Most Common Rating**
    * Used window functions to find the most frequent rating for both Movies and TV Shows.

4.  **Movies Released in 2021**
    * Extracted all movies that were released in a given year.

5.  **Top 5 Countries with Most Content**
    * Used `STRING_TO_ARRAY` + `UNNEST` to split multiple countries and rank them.

6.  **Longest Movie**
    * Retrieved the movie with the maximum duration.

7.  **Content Added in Last 5 Years**
    * Converted `date_added` from text to date and filtered by time range.

8.  **Movies Directed by Rajiv Chilaka**
    * Used `ILIKE` for case-insensitive partial matching.

9.  **TV Shows with Over 5 Seasons**
    * Extracted numeric seasons using `SPLIT_PART` and filtered content.

10. **Top 10 Indian Actors by Appearances**
    * Ranked actors appearing most in India-based content.

11. **Keyword-Based Content Classification**
    * Labeled content as:
        * **Bad_content** → Contains “kill” or “violence”
        * **Good_content** → Everything else
    * Performed category-wise counts using a CTE.

---

## 📉 Key Results & Findings

* 2 major content types: Movies & TV Shows
* Top 5 countries identified as highest content contributors
* 10 most frequent Indian actors appearing across titles
* Classified content into Good vs Bad categories using keyword matching
* Extracted multi-season shows, longest movie, and 2021 releases

---

## 🧩 Skills Demonstrated

* Data Exploration using SQL
* Text Parsing & Cleaning
* Window Function Analysis
* Time-Series Filtering
* Data Categorization
* Query Optimization
* Analytical Problem-Solving

---

## 🚀 How to Run the Project

1.  Import the dataset into PostgreSQL.
2.  Run the provided SQL script.
3.  Execute each problem query individually for insights.
4.  Modify filters (like year, keywords, country) as needed.

---

## 📁 Project Files

* `netflix.sql` → Full SQL script used for analysis
* `README.md` → Project documentation
* Dataset (if available, add link or upload)

---

## 🙌 Author

Aditya Ingale
