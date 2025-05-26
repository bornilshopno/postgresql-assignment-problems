# B5A2

# 🐆 Wildlife Conservation Monitoring Assignment

---

### **🌿 The Ranger and the Rare Animal**

Meera is a forest ranger who protects wildlife in a nature reserve. She’s searching for the rare **Shadow Leopard** , which hasn’t been seen in months. To help track sightings and share data with scientists, she uses a simple database with three tables: **`rangers`**, **`species`**, and **`sightings`**. These help her log observations, learn about endangered animals, and find clues about rare animals like the Shadow Leopard might be hiding.

---

## **📜 Assignment Objective**

This assignment focuses on **PostgreSQL database operations** using a real-world scenario in **wildlife conservation monitoring**. You will create and manage three tables (`rangers`, `species`, `sightings`), insert sample data, and perform essential SQL queries including:

- **CRUD operations**
- **Constraints (PK, FK, CHECK, DEFAULT)**
- **JOINs**
- **Aggregations (`COUNT`, `MAX`, etc.)**
- **Filtering (`WHERE`, `HAVING`)**
- **Data manipulation (`UPDATE`, `DELETE`) etc**

This assignment reinforces your understanding of relational databases while engaging with an environmental use case.

---

## **📂 Database Setup**

1️⃣ **Install PostgreSQL** on your system if not already installed.

2️⃣ Open **pgAdmin** or your preferred PostgreSQL terminal.

3️⃣ **Create a new database** named `"conservation_db"` or any appropriate name.

4️⃣ **Connect** to the newly created database.

5️⃣ Write PostgreSQL queries to solve given problems.

## **📂 Table Details**

---

## 🧱 The 3 Main Tables `Meera` Uses:
```markdown
| Table Name  | What It Stores                                                                |
| ----------- | ----------------------------------------------------------------------------- |
| `rangers`   | Information about rangers like Meera (name, contact, zone)                    |
| `species`   | Info about different animals (name, scientific name, how endangered they are) |
| `sightings` | Records of when and where each animal was seen                                |
```

### 1️⃣ `rangers`

```markdown
| Field Name  | Description               |
| ----------- | ------------------------- |
| `ranger_id` | Unique ID for each ranger |
| `name`      | Full name of the ranger   |
| `region`    | Area they patrol          |
```
---

### 2️⃣ `species`

```markdown
| Field Name            | Description                            |
| --------------------- | -------------------------------------- |
| `species_id`          | Unique ID for each species             |
| `common_name`         | Common name (e.g., "Shadow Leopard")   |
| `scientific_name`     | Scientific name                        |
| `discovery_date`      | When the species was first recorded    |
| `conservation_status` | Status like "Endangered", "Vulnerable" |
```
> ✅ discovery_date helps track when a species was officially identified.
> 

---

### 3️⃣ `sightings`

```markdown
| Field Name      | Description                                |
| --------------- | ------------------------------------------ |
| `sighting_id`   | Unique ID for each sighting                |
| `ranger_id`     | Who made the sighting (links to `rangers`) |
| `species_id`    | Which animal was seen (links to `species`) |
| `sighting_time` | Date and time of the sighting              |
| `location`      | Where it was seen                          |
| `notes`         | Additional observations (optional)         |
```

> ✅ sighting_time tracks when an animal was seen — very useful for monitoring wildlife activity.
> 

---

## 🔗 Relationships Between Tables

```markdown
| Relationship           | Description                                       |
| ---------------------- | ------------------------------------------------- |
| `sightings`→ `rangers` | Each sighting is linked to the ranger who made it |
| `sightings`→ `species` | Each sighting is linked to a specific species     |
```
---

## **📂 Sample Data**

### **1️⃣ `rangers` Table**

```markdown
| ranger_id | name             | region         |
|-----------|------------------|--------------- |
| 1         | Alice Green      | Northern Hills |
| 2         | Bob White        | River Delta    |
| 3         | Carol King       | Mountain Range |

```

### **2️⃣ `species` Table**

```markdown
| species_id | common_name       | scientific_name         | discovery_date | conservation_status |
|------------|-------------------|-------------------------|----------------|---------------------|
| 1          | Snow Leopard      | Panthera uncia          | 1775-01-01     | Endangered          |
| 2          | Bengal Tiger      | Panthera tigris tigris  | 1758-01-01     | Endangered          |
| 3          | Red Panda         | Ailurus fulgens         | 1825-01-01     | Vulnerable          |
| 4          | Asiatic Elephant  | Elephas maximus indicus | 1758-01-01     | Endangered          |

```

### **3️⃣ `sightings` Table**

```markdown
| sighting_id | species_id | ranger_id | location          | sighting_time        | notes                      |
|-------------|------------|-----------|-------------------|----------------------|----------------------------|
| 1           | 1          | 1         | Peak Ridge        | 2024-05-10 07:45:00  | Camera trap image captured |
| 2           | 2          | 2         | Bankwood Area     | 2024-05-12 16:20:00  | Juvenile seen              |
| 3           | 3          | 3         | Bamboo Grove East | 2024-05-15 09:10:00  | Feeding observed           |
| 4           | 1          | 2         | Snowfall Pass     | 2024-05-18 18:30:00  | (NULL)                     |

```

---

## **📂 PostgreSQL Problems & Sample Outputs → 50 Marks**

1️⃣ **Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'**

**Sample Output:**

```markdown
AffectedRows : 1
(No output needed - this is an INSERT operation)
```

2️⃣ **Count unique species ever sighted.**

**Sample Output:**

```markdown
| unique_species_count |
| ---------------------|
| 3                    |
```

3️⃣ **Find all sightings where the location includes "Pass".**

**Sample Output:**

```markdown
| sighting_id | species_id | ranger_id | location      | sighting_time       | notes  |
| ------------|------------|-----------|---------------|---------------------|--------|
| 4           | 1          | 2         | Snowfall Pass | 2024-05-18 18:30:00 | (NULL) |
```

4️⃣ **List each ranger's name and their total number of sightings.**

**Sample Output:**

```markdown
| name        | total_sightings |
|-------------|-----------------|
| Alice Green | 1               |
| Bob White   | 2               |
| Carol King  | 1               |

```

5️⃣ **List species that have never been sighted.**

**Sample Output:**

```markdown
| common_name      |
|------------------|
| Asiatic Elephant |

```

6️⃣ **Show the most recent 2 sightings.**

**Sample Output:**

```markdown
| common_name   | sighting_time        | name        |
|---------------|----------------------|-------------|
| Snow Leopard  | 2024-05-18 18:30:00  | Bob White   |
| Red Panda     | 2024-05-15 09:10:00  | Carol King  |

```

7️⃣ **Update all species discovered before year 1800 to have status 'Historic'.**

**Sample Output:**

```markdown
AffectedRows : 3
(No output needed - this is an UPDATE operation)
```

8️⃣ **Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.**

- Morning: before 12 PM
- Afternoon: 12 PM–5 PM
- Evening: after 5 PM

**Sample Output:**

```markdown
| sighting_id | time_of_day |
|-------------|-------------|
| 1           | Morning     |
| 2           | Afternoon   |
| 3           | Morning     |
| 4           | Evening     |

```

9️⃣ **Delete rangers who have never sighted any species**

**Sample Output:**

```markdown
AffectedRows : 1
(No output needed - this is a DELETE operation)
```


---

## **📂 Submission Instructions**

1️⃣ **Prepare a single SQL file** containing:
- SQL code for table creation, sample data insertion, and all queries.
- SQL queries for all problems, each preceded by a comment (`- Problem X`).
  
2️⃣ **Verify** that all queries run without errors.

3️⃣ Save your file as "PostgreSQL_Assignment.sql" or another appropriate name.

🔹 Submit only the **GitHub repository link** containing your solution file. GitHub repository should be public.

---


## **📂 Bonus Section (Answer Any 5 Questions on readme.md in Bangla) → 10 Marks**


1. What is PostgreSQL?
2. What is the purpose of a database schema in PostgreSQL?
3. Explain the **Primary Key** and **Foreign Key** concepts in PostgreSQL.
4. What is the difference between the `VARCHAR` and `CHAR` data types?
5. Explain the purpose of the `WHERE` clause in a `SELECT` statement.
6. What are the `LIMIT` and `OFFSET` clauses used for?
7. How can you modify data using `UPDATE` statements?
8. What is the significance of the `JOIN` operation, and how does it work in PostgreSQL?
9. Explain the `GROUP BY` clause and its role in aggregation operations.
10. How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in PostgreSQL?

💡 Pro Tip: Don't be short and concise in your answers; explain the idea behind each question and provide in-depth analysis with relevant examples.
---

## **⏳ Deadline & Marks Distribution**

| Date | Marks | Deadline Time |
| --- | --- | --- |
| **26 May, 2025** | **60 Marks** | Until **11:59 PM** |
| **27 May, 2025** | **50 Marks** | Until **11:59 PM** |
| **After 27 May, 2025** | **30 Marks** | Until **11:59 PM** |

---

## **🚀 Important Notice**

Participation in this assignment is **mandatory** for all students. It builds foundational skills in PostgreSQL, which will be critical for future topics like **Prisma ORM** and **full-stack development**.

Approach this task with dedication, precision, and a commitment to excellence.

Plagiarism will not be tolerated. Please make sure that the code you submit is your own. Any instance of plagiarism will result in a score of 0. Additionally, if any AI-generated content or ChatGPT-generated responses are detected, the score will also be 0.

**Best of luck!** 💡🔥🌿
