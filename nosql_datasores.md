NOSQL - what?

SQL? Dominated databases for last 50 years

datomic - Rich Hickeys nosql - NuBank success

deno KV pair datastore
what i want to use
to store timebased facts associated witg an entity


# History of SQL

The history of SQL and relational databases is a fascinating journey through the evolution of data management. It all began in the late 1960s and early 1970s when the need for structured, efficient ways to store and retrieve data became increasingly apparent.

The foundation was laid by Edgar F. Codd, a British computer scientist working at IBM. In 1970, he published a groundbreaking paper titled "A Relational Model of Data for Large Shared Data Banks." Codd introduced the concept of the relational model, which proposed organizing data into tables (relations) with rows (tuples) and columns (attributes). This was a radical departure from the hierarchical and network database models of the time, which were more rigid and complex to navigate. Codd’s model emphasized simplicity, data independence, and the use of mathematical principles like set theory for querying data.

Codd’s work didn’t just stop at theory—he outlined a set of rules (later known as Codd’s 12 Rules) to define what makes a database truly relational. He also envisioned a language to manipulate this data, which set the stage for SQL. However, IBM was initially slow to act on his ideas, partly because they were invested in their existing database system, IMS.

Meanwhile, in the mid-1970s, a team at IBM’s San Jose Research Laboratory—Donald Chamberlin and Raymond Boyce—took up the challenge of creating a practical query language based on Codd’s relational model. They developed SEQUEL (Structured English Query Language), which was later renamed SQL (Structured Query Language) due to trademark issues. Their goal was to make data retrieval intuitive, using English-like syntax such as "SELECT" and "FROM." The first version of SQL was implemented in 1974 as part of IBM’s System R, one of the earliest relational database management systems (RDBMS). System R proved the relational model could work in practice, handling real-world data efficiently.

Around the same time, others were catching on. In 1973, a group at UC Berkeley began working on INGRES, another early relational database system. Led by Michael Stonebraker, INGRES used its own query language, QUEL, but it still built on Codd’s ideas. INGRES was notable for being open-source and widely used in academia, which helped spread the relational database gospel.

By the late 1970s and early 1980s, the commercial potential of relational databases became clear. In 1979, Relational Software, Inc. (later renamed Oracle Corporation) released Oracle, the first commercially available RDBMS, beating IBM to market. Oracle adopted SQL as its query language, capitalizing on its simplicity and power. IBM followed suit in 1981 with SQL/DS and later DB2 in 1983, fully embracing the relational model and SQL.

SQL itself evolved over the years. In 1986, it became an official standard when the American National Standards Institute (ANSI) adopted it, followed by the International Organization for Standardization (ISO) in 1987. The first standard, SQL-86, defined core features like SELECT, INSERT, UPDATE, and DELETE. Subsequent revisions—like SQL-92, SQL:1999, and beyond—added advanced features such as triggers, stored procedures, and support for object-relational concepts.

The 1980s and 1990s saw an explosion of RDBMS options: Microsoft SQL Server, PostgreSQL, MySQL, SQLite, and more. Each brought its own flavor to the table, but SQL remained the common thread, cementing its status as the lingua franca of databases. The relational model’s flexibility and SQL’s ease of use made them ideal for everything from business applications to scientific research.

Today, SQL and relational databases underpin much of the digital world, from e-commerce platforms to data analytics. Even with the rise of NoSQL databases for handling unstructured data, the principles Codd introduced—and the language Chamberlin and Boyce crafted—remain enduringly relevant, adapting to new challenges while keeping data organized and accessible.





# Codd's 12 ruled

Codd’s 12 Rules, proposed by Edgar F. Codd in 1985, are a set of criteria designed to define what makes a database management system (DBMS) truly relational. These rules build on his 1970 relational model and aim to ensure that a system isn’t just superficially relational but adheres to the principles of data integrity, independence, and usability. While often called "12 Rules," there are actually 13, starting with Rule 0. They’re more of a gold standard than a strict checklist—few systems fully comply with all of them—but they’ve shaped the design and evaluation of relational databases. Here’s a breakdown:

### Rule 0: The Foundation Rule  
A system must qualify as relational, as a database, and as a management system. For a DBMS to be considered relational, it must use its relational facilities exclusively to manage the database—no backdoors or non-relational tricks. This sets the stage: everything must align with the relational model’s principles, like tables, rows, and columns, managed through a unified system.

### Rule 1: The Information Rule  
All data must be stored in tables, and only in tables. Every piece of information—values, relationships, metadata—must be represented as data in rows and columns, with no hidden structures. For example, a customer’s name or an order ID isn’t tucked away in pointers or files; it’s an explicit value in a table. This ensures transparency and consistency.

### Rule 2: The Guaranteed Access Rule  
Every data value must be accessible by specifying the table name, column name, and primary key value. Think of it like a map: if you know the table (e.g., "Customers"), the column (e.g., "Name"), and the unique identifier (e.g., CustomerID = 123), you can pinpoint that exact piece of data. This rule enforces logical precision and eliminates ambiguity.

### Rule 3: Systematic Treatment of Null Values  
Nulls—representing missing or unknown data—must be handled consistently, distinct from empty strings or zeros. A null in one column should mean the same thing as a null in another: "we don’t know." This allows the system to distinguish between "no value" and "a value of nothing," supporting accurate queries and data integrity.

### Rule 4: Dynamic Online Catalog Based on the Relational Model  
The database’s structure (its metadata—like table names, column definitions, and constraints) must itself be stored in relational tables, accessible via the same query tools as regular data. This "data dictionary" or catalog lets users explore the database’s design using SQL, making it self-describing and transparent.

### Rule 5: The Comprehensive Data Sublanguage Rule  
There must be a single, well-defined language (like SQL) that handles all database tasks—defining tables, querying data, setting permissions, and more. It should support both interactive use and integration into programs. This ensures a unified, relational way to interact with the system, avoiding fragmented approaches.

### Rule 6: The View Updating Rule  
Views (virtual tables created by queries) should be updatable, not just read-only, as long as the updates make logical sense. If you create a view showing all customers in New York, you should be able to update their details through that view, and the changes should reflect in the underlying tables. This keeps views as powerful tools, not just snapshots.

### Rule 7: High-Level Insert, Update, and Delete  
The system must support set-based operations—inserting, updating, or deleting multiple rows at once—using high-level relational operators, not just row-by-row tinkering. For example, "UPDATE Orders SET Status = 'Shipped' WHERE Date > '2025-01-01'" should work in one go, leveraging the relational model’s set theory roots.

### Rule 8: Physical Data Independence  
How data is physically stored (e.g., on disk, in indexes) should be invisible to users and applications. You can rearrange the storage—say, from one file system to another—without changing how queries or programs access the data. This abstraction keeps the logical model intact regardless of hardware tweaks.

### Rule 9: Logical Data Independence  
The logical structure (tables, views) can change—like splitting a table into two—without breaking applications or queries, as long as the data remains accessible through views or mappings. This flexibility lets databases evolve (e.g., for performance or new requirements) without disrupting users.

### Rule 10: Integrity Independence  
Integrity constraints (e.g., "every Order must have a valid CustomerID") must be defined within the database itself, using the relational language, and stored in the catalog, not hardcoded into applications. This ensures rules stay enforceable and consistent, even if apps change.

### Rule 11: Distribution Independence  
The system should hide whether data is stored on one machine or spread across many. Queries and updates should work the same, whether the database is local or distributed across a network. This future-proofed the model for the rise of distributed systems, keeping the user experience seamless.

### Rule 12: The Nonsubversion Rule  
You can’t bypass the relational system’s rules or security by using low-level tricks (like direct file access). If SQL enforces "no deleting Orders older than a year," you shouldn’t be able to sneak around it with a backdoor. This protects the database’s integrity and relational purity.

---

Codd’s rules are both a technical blueprint and a philosophical stance, pushing for a rigorous, user-friendly, and adaptable approach to data management. In practice, systems like Oracle, PostgreSQL, or SQL Server meet many of these (especially Rules 1–7), but full compliance is rare due to trade-offs in performance, complexity, or legacy design. Still, they remain a benchmark for evaluating how "relational" a database really is.


# how do these principles relate to nirmal firm

Codd’s 12 Rules and the concept of normal forms in relational databases are closely intertwined, as both stem from Edgar F. Codd’s relational model and aim to ensure data integrity, consistency, and efficiency. However, they operate at different levels: Codd’s Rules define the qualities of a relational database management system (RDBMS) as a whole, while normal forms are specific design principles applied to individual tables to eliminate redundancy and anomalies. Let’s explore how they relate by connecting the dots between the rules and the normalization process, which includes levels like First Normal Form (1NF), Second Normal Form (2NF), Third Normal Form (3NF), and beyond.

### The Big Picture Connection
Normalization is the process of structuring a database’s tables to meet certain criteria, reducing duplication and ensuring logical consistency—goals that align with Codd’s vision of a disciplined, relational approach. The normal forms are practical steps to achieve some of the properties Codd’s Rules demand, particularly around data representation, integrity, and independence. While the rules don’t explicitly mention normal forms (they came slightly later in Codd’s work and were refined by others), normalization supports the relational model’s foundation, which the rules enforce.

### Specific Relationships

#### Rule 1: The Information Rule (All Data in Tables)
- **Link to Normal Forms**: This rule insists that all data be stored in tables as values in rows and columns. First Normal Form (1NF) is the starting point here—it requires that tables have no repeating groups or arrays, ensuring every piece of data is atomic ( indivisible) and fits the tabular structure. For example, a table with a column listing multiple phone numbers as "123, 456, 789" violates 1NF; normalization breaks it into separate rows or a related table. This aligns with Rule 1’s demand for a pure relational representation.

#### Rule 2: Guaranteed Access Rule (Access via Table, Column, Key)
- **Link to Normal Forms**: 1NF introduces the concept of a primary key to uniquely identify rows, which Rule 2 relies on for guaranteed access. Higher normal forms like 2NF and 3NF refine this by ensuring the key fully and solely determines the data in each row. In 2NF, you eliminate partial dependencies (where non-key attributes depend on only part of a composite key), and in 3NF, you remove transitive dependencies (where non-key attributes depend on other non-key attributes). These steps ensure the table’s structure supports precise, key-based access without ambiguity or redundancy.

#### Rule 3: Systematic Treatment of Null Values
- **Link to Normal Forms**: Normalization reduces the need for nulls by breaking data into logically independent tables. For instance, before 3NF, a table might have a "SupplierCity" column that’s null when no supplier is assigned, leading to inconsistent null handling. Normalizing to 3NF might split this into a separate "Suppliers" table, minimizing nulls and aligning with Rule 3’s call for systematic treatment. Proper normalization ensures nulls only appear where data is genuinely unknown, not as a byproduct of poor design.

#### Rule 10: Integrity Independence
- **Link to Normal Forms**: This rule requires integrity constraints (e.g., primary keys, foreign keys) to be defined within the database. Normal forms directly support this: 1NF establishes primary keys, 2NF and 3NF ensure functional dependencies are tied to those keys, and Boyce-Codd Normal Form (BCNF—a stricter 3NF) eliminates all non-trivial dependencies except those from keys. These constraints, like "every OrderID must link to a valid CustomerID," are stored in the database’s relational structure, fulfilling Rule 10’s mandate for intrinsic integrity enforcement.

#### Rule 8: Physical Data Independence
- **Link to Normal Forms**: While this rule focuses on separating logical data from physical storage, normalization indirectly aids by creating a clean, logical schema. A normalized database (e.g., in 3NF) can be physically reorganized—say, splitting tables across disks—without altering how queries access it, because the data’s logical relationships (keys, dependencies) are well-defined. Denormalization for performance might conflict here, as it ties logical design to physical optimization, potentially undermining this independence.

#### Rule 9: Logical Data Independence
- **Link to Normal Forms**: Normalized tables (up to 3NF or BCNF) make it easier to adjust the logical structure without disrupting applications. For example, splitting a denormalized "Employees" table (with department details mixed in) into separate "Employees" and "Departments" tables (3NF) lets you add new department attributes later. Applications can still query via views joining these tables, preserving Rule 9’s promise of logical flexibility. Unnormalized designs, by contrast, lock you into rigid structures harder to modify.

#### Rule 7: High-Level Insert, Update, and Delete
- **Link to Normal Forms**: Set-based operations work best when tables are free of anomalies, which normalization addresses. In an unnormalized table, updating a customer’s address might require changing multiple rows (violating 1NF) or risk inconsistencies (violating 3NF). Normalized tables ensure updates affect only one place—e.g., changing a supplier’s phone number in a "Suppliers" table rather than every order row—supporting Rule 7’s high-level, anomaly-free operations.

### Broader Implications
- **Data Integrity and Consistency**: Normal forms eliminate insertion, update, and deletion anomalies (a core goal of 2NF, 3NF, and BCNF), which dovetails with Rules 1, 2, 7, and 10. A database adhering to these rules needs normalized tables to avoid the mess of redundant or conflicting data.
- **Simplicity and Usability**: Rules like 4 (dynamic catalog) and 5 (comprehensive language) assume a logical structure that normalization clarifies. A 3NF schema is easier to query and describe in a relational catalog than a tangled, unnormalized one.
- **Trade-offs**: Full normalization (e.g., BCNF or 4NF) might clash with Rule 11 (distribution independence) or performance needs, as joining many tables can slow distributed systems. Practical RDBMS implementations often balance normalization with denormalization, slightly bending Codd’s ideals.

### Conclusion
Codd’s 12 Rules set the systemic framework for an RDBMS, while normal forms provide the table-level discipline to make that framework work. Normalization up to 3NF or BCNF ensures the data structure supports the rules’ demands—uniquely accessible data (Rule 2), enforceable integrity (Rule 10), and anomaly-free operations (Rule 7)—while laying the groundwork for independence (Rules 8 and 9). Think of normal forms as the bricks shaping the tables, and the rules as the blueprint for how the whole system should behave. Together, they bring Codd’s relational vision to life.



# what are the different normal forms

Normal forms are a series of guidelines in relational database design that help structure tables to eliminate redundancy, ensure data integrity, and prevent anomalies during insertions, updates, and deletions. They build on Edgar F. Codd’s relational model and progress in levels of strictness, from First Normal Form (1NF) up to higher forms like Sixth Normal Form (6NF). Each level addresses specific issues in table design, with most practical databases aiming for Third Normal Form (3NF) or Boyce-Codd Normal Form (BCNF) as a balance between rigor and usability. Here’s a rundown of the key normal forms:

---

### First Normal Form (1NF)
- **Definition**: A table is in 1NF if all its data is atomic (indivisible), there are no repeating groups or arrays, and each row is uniquely identifiable (typically via a primary key).
- **Requirements**:
  - Every column contains single-valued entries—no lists, sets, or nested tables.
  - All entries in a column are of the same data type.
  - Rows are unique (no duplicates), often enforced by a primary key.
- **Example**:
  - **Not 1NF**: A "Students" table with a "Courses" column listing "Math, Science" for a student.
  - **1NF Fix**: Split "Courses" into separate rows (e.g., one row for "Math," another for "Science") or a separate "StudentCourses" table with StudentID and Course as columns.
- **Purpose**: Ensures the table fits the relational model’s basic structure—rows and columns only—and sets the stage for further normalization.

---

### Second Normal Form (2NF)
- **Definition**: A table is in 2NF if it’s in 1NF and all non-key attributes are fully functionally dependent on the entire primary key (no partial dependencies).
- **Requirements**:
  - Must already be in 1NF.
  - If the primary key is composite (made of multiple columns), every non-key column must depend on the whole key, not just part of it.
- **Example**:
  - **Not 2NF**: A table "OrderDetails" with columns (OrderID, ProductID, ProductName, OrderDate), where ProductName depends only on ProductID (part of the composite key OrderID+ProductID), not the full key.
  - **2NF Fix**: Split into "Orders" (OrderID, OrderDate) and "Products" (ProductID, ProductName), with "OrderDetails" (OrderID, ProductID) linking them.
- **Purpose**: Eliminates redundancy and update anomalies caused by partial dependencies, like having to update ProductName in multiple rows for the same ProductID.

---

### Third Normal Form (3NF)
- **Definition**: A table is in 3NF if it’s in 2NF and all non-key attributes are directly dependent on the primary key, with no transitive dependencies (non-key attributes depending on other non-key attributes).
- **Requirements**:
  - Must be in 2NF.
  - No non-key column determines another non-key column; all non-key columns depend only on the primary key.
- **Example**:
  - **Not 3NF**: A "Employees" table with (EmployeeID, DepartmentID, DepartmentName), where DepartmentName depends on DepartmentID (a non-key), not directly on EmployeeID.
  - **3NF Fix**: Split into "Employees" (EmployeeID, DepartmentID) and "Departments" (DepartmentID, DepartmentName).
- **Purpose**: Removes transitive dependencies to reduce redundancy and prevent anomalies—like updating DepartmentName in multiple rows if it changes.

---

### Boyce-Codd Normal Form (BCNF)
- **Definition**: A stricter version of 3NF, BCNF requires that for every functional dependency (X → Y), X must be a superkey (a set of columns that uniquely identifies a row, including the primary key).
- **Requirements**:
  - Must be in 3NF.
  - No non-trivial dependencies where a non-superkey determines another attribute.
- **Example**:
  - **Not BCNF**: A table "ClassAssignments" with (StudentID, CourseID, InstructorID), where InstructorID → CourseID (InstructorID determines CourseID), but InstructorID isn’t a superkey (the key is StudentID+CourseID).
  - **BCNF Fix**: Split into "Instructors" (InstructorID, CourseID) and "Enrollments" (StudentID, CourseID).
- **Purpose**: Addresses edge cases where 3NF still allows anomalies due to dependencies not tied to the primary key. BCNF is more rigorous but can complicate table design.

---

### Fourth Normal Form (4NF)
- **Definition**: A table is in 4NF if it’s in BCNF and has no non-trivial multivalued dependencies (MVDs), where one attribute determines multiple independent sets of values.
- **Requirements**:
  - Must be in BCNF.
  - If a column has multiple values related to the key, they must be split into separate tables unless they’re trivial (e.g., part of the key itself).
- **Example**:
  - **Not 4NF**: A table "Faculty" with (ProfessorID, Course, Textbook), where a professor teaches multiple courses and uses multiple textbooks independently (e.g., Prof1 → {Math, Physics} and {BookA, BookB}).
  - **4NF Fix**: Split into "ProfessorCourses" (ProfessorID, Course) and "ProfessorTextbooks" (ProfessorID, Textbook).
- **Purpose**: Eliminates redundancy from independent multivalued relationships, ensuring each table captures one fact type.

---

### Fifth Normal Form (5NF) / Project-Join Normal Form (PJ/NF)
- **Definition**: A table is in 5NF if it’s in 4NF and cannot be further decomposed into smaller tables without losing information, meaning all dependencies are preserved only by joining the decomposed tables back together.
- **Requirements**:
  - Must be in 4NF.
  - No "join dependencies" exist unless they’re implied by the key (every valid decomposition must reconstruct the original data losslessly).
- **Example**:
  - **Not 5NF**: A table "SuppliersPartsProjects" with (SupplierID, PartID, ProjectID), where SupplierID supplies PartID, PartID is used in ProjectID, and SupplierID serves ProjectID, but splitting into two tables loses the full relationship unless rejoined.
  - **5NF Fix**: Keep it as one table or ensure all projections (e.g., Supplier-Part, Part-Project, Supplier-Project) join back perfectly.
- **Purpose**: Handles complex, multi-way relationships where splitting tables prematurely could lose meaning, ensuring the design captures all constraints.

---

### Sixth Normal Form (6NF)
- **Definition**: A table is in 6NF if it’s in 5NF and contains no non-trivial join dependencies at all—each table has only one non-key attribute (beyond the key), making it fully temporal or irreducible.
- **Requirements**:
  - Must be in 5NF.
  - Every table is essentially a key plus one attribute, often used for temporal databases tracking changes over time.
- **Example**:
  - **Not 6NF**: A table "EmployeeStatus" with (EmployeeID, Status, StartDate, EndDate).
  - **6NF Fix**: Split into "EmployeeStatus" (EmployeeID, Status, StartDate) and "EmployeeEndDate" (EmployeeID, Status, EndDate) to track time intervals separately.
- **Purpose**: Supports advanced scenarios like temporal data, where every attribute change is tracked independently, but it’s rarely used outside niche cases due to complexity.

---

### Practical Notes
- **Common Stopping Points**: Most databases aim for 3NF or BCNF, as they strike a balance between eliminating anomalies and maintaining query performance. Higher forms (4NF, 5NF, 6NF) are less common, often reserved for specialized or theoretical applications.
- **Denormalization**: In practice, designers may intentionally "denormalize" (e.g., back to 2NF or 1NF) for performance—like pre-joining tables for faster reads—accepting some redundancy for speed.
- **Progression**: Each normal form builds on the previous one, so a table in 3NF is also in 2NF and 1NF, but not necessarily BCNF or higher.

These normal forms are like a ladder of refinement—each step reduces a specific type of data inefficiency or risk, aligning with the relational model’s goal of a clean, logical structure. They’re tools, not commandments, so the "right" level depends on your application’s needs!






# Datomic

Let’s dive into a beginner’s guide to key concepts in Datomic, the database designed with Clojure in mind. Datomic is a bit different from traditional relational databases, so I’ll break it down into digestible pieces, focusing on its core ideas and how they fit together. If you’re new to Clojure or databases in general, don’t worry—I’ll keep it approachable and clear.

### 1. **What is Datomic, Anyway?**
Datomic is a distributed database built for immutability, time-based querying, and a flexible data model. It’s designed by the folks behind Clojure (like Rich Hickey) and embraces functional programming principles. Unlike typical databases where data gets overwritten, Datomic keeps a history of everything, letting you ask, “What did the data look like at this moment?” It’s split into components: a storage layer (like a backend), a transactor (for writes), and peers (your app querying the data).

### 2. **Facts and Datoms: The Building Blocks**
At its heart, Datomic stores data as **datoms**, which are tiny, atomic facts. A datom is a five-part tuple: 
- **Entity** (E): The thing you’re talking about, like a person or an order.
- **Attribute** (A): What you’re describing about it, like “name” or “price.”
- **Value** (V): The actual data, like “Alice” or “42.”
- **Transaction** (Tx): When this fact was added.
- **Operation** (Op): Whether it was added or retracted.

For example, if you say “Alice’s age is 30,” that’s a datom: `[entity: Alice, attribute: age, value: 30, tx: some-time, op: added]`. This structure lets Datomic track history naturally.

### 3. **Schema: Defining What’s Possible**
Before you store data, you define a **schema**—a set of rules about what attributes exist and how they behave. In Datomic, attributes have properties like:
- `:db/ident`: A unique name for the attribute (e.g., `:person/name`).
- `:db/valueType`: What kind of data it holds (e.g., string, number, reference).
- `:db/cardinality`: Whether it’s one value (`:db.cardinality/one`) or many (`:db.cardinality/many`), like a list of hobbies.

You write this in Clojure data (EDN format), and it’s flexible—you can evolve it over time.

### 4. **Immutability: History Never Dies**
Datomic doesn’t update or delete data in the traditional sense. Instead, it **adds new facts**. If Alice’s age changes from 30 to 31, Datomic keeps the old fact (age 30) and adds a new one (age 31), tagged with a transaction time. This immutability means you can query the database “as of” any point in time, which is a superpower for auditing or debugging.

### 5. **Transactions: Making Changes**
To add or change data, you submit a **transaction**—a list of assertions or retractions written in Clojure. For example:
```clojure
[[:db/add "alice" :person/age 31]]
```
This says, “For the entity Alice, set her age to 31.” Transactions are atomic (all or nothing) and processed by the transactor, ensuring consistency.

### 6. **Queries: Asking Questions**
Datomic uses **Datalog**, a query language that feels declarative and logic-based. You write queries in Clojure, specifying patterns to match datoms. Here’s a simple one:
```clojure
[:find ?name
 :where [?e :person/name ?name]
        [?e :person/age 30]]
```
This finds all names of people aged 30. The `?e` is a variable tying the entity across facts. It’s powerful because it’s composable and can traverse relationships (like “friends of friends”).

### 7. **Entities and References**
Entities in Datomic aren’t rigid rows in a table—they’re collections of facts tied to an entity ID. Attributes can point to other entities via **references**. For example, if Alice has a friend Bob:
```clojure
[:db/add "alice" :person/friend "bob"]
```
This links them, and you can query across these connections.

### 8. **Time Travel: As-Of and Since**
Because Datomic keeps history, you can query the database at different points in time:
- **As-of**: “What was the data like on January 1st?”
- **Since**: “What’s changed since yesterday?”
You pass a timestamp or transaction ID to your query, and Datomic filters the facts accordingly.

### 9. **Clojure Integration**
Since Datomic is built for Clojure, it feels seamless in that ecosystem. You use Clojure data structures (maps, vectors) for transactions and queries, and the API is a natural fit with functional programming—no impedance mismatch like with SQL and OOP.

### Getting Started: A Tiny Example
1. **Define a Schema**:
```clojure
[{:db/ident :person/name
  :db/valueType :db.type/string
  :db/cardinality :db.cardinality/one}]
```
2. **Add Data**:
```clojure
[[:db/add "temp-id" :person/name "Alice"]]
```
3. **Query It**:
```clojure
[:find ?n :where [?e :person/name ?n]]
```
Run this with a Datomic setup, and you’ll get “Alice” back.

### Why It’s Cool
- **Flexibility**: No rigid tables—entities can have any mix of attributes.
- **History**: Built-in time travel for free.
- **Simplicity**: Facts and queries are straightforward once you get the hang of it.

If you’re curious about any part—like setting it up, writing more queries, or how it compares to SQL—just ask! I can walk you through examples or clarify anything that’s fuzzy. What do you think—any part you’d like to explore more?


# datomic example 

Let’s walk through creating a simple schema in Datomic and then adding some data to it. I’ll keep it practical and clear, showing you the Clojure code you’d use and explaining each step. We’ll model a basic scenario: tracking people and their names and ages.

### Step 1: Creating a Simple Schema
The schema defines the attributes we’ll use. In Datomic, you write this as a collection of maps in Clojure’s EDN (Extensible Data Notation) format. Let’s create two attributes: `:person/name` and `:person/age`.

Here’s the schema:

```clojure
(def person-schema
  [{:db/ident :person/name
    :db/valueType :db.type/string
    :db/cardinality :db.cardinality/one
    :db/doc "A person's name"}
   
   {:db/ident :person/age
    :db/valueType :db.type/long
    :db/cardinality :db.cardinality/one
    :db/doc "A person's age in years"}])
```

#### Explanation:
- `:db/ident`: A unique keyword identifying the attribute (e.g., `:person/name`).
- `:db/valueType`: Specifies the data type. Here, `:db.type/string` for names and `:db.type/long` for ages (a long integer).
- `:db/cardinality`: Defines whether an entity can have one value (`:db.cardinality/one`) or multiple values (`:db.cardinality/many`). We’re keeping it simple with “one” for both.
- `:db/doc`: Optional documentation for humans.

To apply this schema, you’d submit it to Datomic via a transaction. Assuming you’ve set up a Datomic connection (let’s call it `conn`), you’d do:

```clojure
(d/transact conn {:tx-data person-schema})
```

This tells Datomic, “Hey, here are the attributes I’ll be using.”

### Step 2: Adding Data
Now that the schema exists, let’s add some people. In Datomic, you add data by submitting transactions—lists of operations like `:db/add`. We’ll add two people: Alice, age 30, and Bob, age 25.

Here’s the transaction:

```clojure
(def person-data
  [{:db/id "alice"  ; Temporary ID for Alice
    :person/name "Alice"
    :person/age 30}
   
   {:db/id "bob"    ; Temporary ID for Bob
    :person/name "Bob"
    :person/age 25}])
```

#### Explanation:
- `:db/id`: A temporary ID (like `"alice"`) to identify the entity within this transaction. Datomic will assign a permanent entity ID when it processes this.
- `:person/name` and `:person/age`: The attributes we defined, paired with their values.

Submit it to Datomic:

```clojure
(d/transact conn {:tx-data person-data})
```

This creates two entities: one for Alice and one for Bob. Behind the scenes, Datomic turns this into datoms like:
- `[alice-entity :person/name "Alice" tx-id added]`
- `[alice-entity :person/age 30 tx-id added]`
- `[bob-entity :person/name "Bob" tx-id added]`
- `[bob-entity :person/age 25 tx-id added]`

### Step 3: Verifying It Worked (A Simple Query)
To check our data, let’s query for all people and their ages:

```clojure
(d/q '[:find ?name ?age
       :where
       [?e :person/name ?name]
       [?e :person/age ?age]]
     (d/db conn))
```

#### Explanation:
- `d/q`: The Datomic query function.
- `:find ?name ?age`: Return the name and age for each matching entity.
- `:where`: The conditions—find entities `?e` with a `:person/name` and `:person/age`.
- `(d/db conn)`: The current database value from our connection.

This should return something like:
```
#{["Alice" 30] ["Bob" 25]}
```

### Putting It All Together
Here’s the full sequence in one Clojure snippet, assuming a Datomic setup:

```clojure
(require '[datomic.api :as d])

;; Define schema
(def person-schema
  [{:db/ident :person/name
    :db/valueType :db.type/string
    :db/cardinality :db.cardinality/one
    :db/doc "A person's name"}
   {:db/ident :person/age
    :db/valueType :db.type/long
    :db/cardinality :db.cardinality/one
    :db/doc "A person's age in years"}])

;; Add data
(def person-data
  [{:db/id "alice"
    :person/name "Alice"
    :person/age 30}
   {:db/id "bob"
    :person/name "Bob"
    :person/age 25}])

;; Assuming `conn` is your Datomic connection
(d/transact conn {:tx-data person-schema})
(d/transact conn {:tx-data person-data})

;; Query the data
(d/q '[:find ?name ?age
       :where
       [?e :person/name ?name]
       [?e :person/age ?age]]
     (d/db conn))
```

### Notes
- **Setup**: In a real app, you’d need Datomic running (e.g., a local dev setup or cloud instance) and a connection URI. The docs at [datomic.com](https://docs.datomic.com) cover this.
- **Temporary IDs**: You can also use `#db/id[:db.part/user]` instead of strings like `"alice"`, but strings keep it readable for this example.

This is a minimal but functional start. You could extend it—add more attributes, relationships (like `:person/friend`), or query fancier patterns. Want to try tweaking this, like adding a new attribute or querying something specific? Let me know!





# Deno KV Datastore

Let’s dive into a beginner-friendly tutorial on using the Deno KV datastore! Deno KV is a built-in, lightweight key-value database that comes with the Deno runtime. It’s simple to use, requires no external setup, and is perfect for storing and retrieving data in your Deno applications. This tutorial will walk you through the basics—setting it up, performing CRUD operations (Create, Read, Update, Delete), and exploring some handy features like atomic transactions. By the end, you’ll have a solid foundation to start using Deno KV in your projects!

### Step 1: Setting Up Deno KV
First things first, you need Deno installed. If you haven’t already, grab it from [deno.com](https://deno.com) and install it. Once that’s done, Deno KV is ready to use out of the box—no extra dependencies or configuration needed.

To start, create a new file called `kv-tutorial.ts`. Open it in your favorite editor, and let’s connect to the Deno KV store. Add this line:

```typescript
const kv = await Deno.openKv();
```

This opens a connection to the default KV database. Locally, Deno uses SQLite under the hood to store your data persistently on disk. If you deploy this to Deno Deploy later, it’ll switch to a globally distributed FoundationDB backend—same API, different engine. For now, we’re keeping it local and simple.

### Step 2: Basic CRUD Operations
Let’s go through the core operations you’ll use with Deno KV: creating, reading, updating, and deleting data.

#### Create (Set)
Deno KV stores data as key-value pairs. Keys are arrays of JavaScript primitives (like strings or numbers), and values can be almost any JavaScript type that’s serializable (objects, arrays, strings, etc.). Let’s store some user data:

```typescript
await kv.set(["users", "alice"], { name: "Alice", age: 30 });
await kv.set(["users", "bob"], { name: "Bob", age: 25 });
```

Here, `["users", "alice"]` is the key—a two-part array where `"users"` acts like a category or prefix, and `"alice"` is a unique identifier. The value is an object with some user info. The `set` method saves this to the database.

#### Read (Get)
To retrieve data, use the `get` method with the same key:

```typescript
const alice = await kv.get(["users", "alice"]);
console.log(alice.value); // { name: "Alice", age: 30 }
```

The result is an object with `key`, `value`, and `versionstamp` properties. The `value` is what we stored, and the `versionstamp` tracks the version of this entry (useful for transactions, which we’ll cover later).

#### Update (Set Again)
Updating is as simple as calling `set` with the same key but a new value:

```typescript
await kv.set(["users", "alice"], { name: "Alice", age: 31 });
const updatedAlice = await kv.get(["users", "alice"]);
console.log(updatedAlice.value); // { name: "Alice", age: 31 }
```

Since `set` overwrites the existing value, this updates Alice’s age.

#### Delete
To remove an entry, use the `delete` method:

```typescript
await kv.delete(["users", "bob"]);
const bob = await kv.get(["users", "bob"]);
console.log(bob.value); // null
```

If the key doesn’t exist or has been deleted, `get` returns `null` for the value.

### Step 3: Listing Data
What if you want to fetch multiple entries at once? Deno KV’s `list` method lets you query by key prefix. Let’s list all users:

```typescript
const users = kv.list({ prefix: ["users"] });
for await (const entry of users) {
  console.log(`${entry.key[1]}: ${entry.value.name}, ${entry.value.age}`);
}
```

This outputs something like:
```
alice: Alice, 31
```

The `prefix: ["users"]` option matches all keys starting with `["users"]`. The result is an async iterator, so we use a `for await...of` loop to process each entry. Keys are returned in lexicographical order, so `"alice"` comes before `"bob"`.

### Step 4: Atomic Transactions
Deno KV supports ACID transactions, which ensure your operations are consistent even when modifying multiple keys. Let’s simulate a bank transfer between two accounts:

```typescript
// Initialize balances
await kv.set(["balances", "alice"], 100);
await kv.set(["balances", "bob"], 50);

// Transfer 20 from Alice to Bob
const transferAmount = 20;
const aliceBalance = await kv.get(["balances", "alice"]);
const bobBalance = await kv.get(["balances", "bob"]);

if (aliceBalance.value < transferAmount) {
  console.log("Insufficient funds!");
} else {
  const success = await kv.atomic()
    .set(["balances", "alice"], aliceBalance.value - transferAmount)
    .set(["balances", "bob"], bobBalance.value + transferAmount)
    .commit();

  if (success) {
    console.log("Transfer successful!");
    console.log("Alice:", (await kv.get(["balances", "alice"])).value); // 80
    console.log("Bob:", (await kv.get(["balances", "bob"])).value); // 70
  } else {
    console.log("Transfer failed!");
  }
}
```

The `atomic()` method groups operations together. If any part fails (e.g., due to a concurrent modification), the whole transaction rolls back. You can also add `.check()` to ensure keys haven’t changed since you last read them, but this example keeps it straightforward.

### Step 5: Running the Code
Save your `kv-tutorial.ts` file. To run it, use this command in your terminal:

```bash
deno run --unstable-kv kv-tutorial.ts
```

The `--unstable-kv` flag is needed because Deno KV is still an unstable feature as of early 2025. Your data will be stored locally in a default SQLite file (check `deno info` to see where).

### Bonus: Tips and Next Steps
- **Keys as Arrays**: Using arrays for keys (e.g., `["users", "alice"]`) lets you organize data hierarchically, like a REST API path.
- **In-Memory Testing**: For testing, use `Deno.openKv(":memory:")` to create a temporary, non-persistent store.
- **Deploying**: If you push this to Deno Deploy, KV becomes globally distributed with zero config—perfect for scalable apps.
- **Learn More**: Check the [Deno KV docs](https://docs.deno.com/runtime/manual/advanced/kv) for advanced features like watchers or consistency options.

And that’s it! You’ve now got the basics of Deno KV down—storing data, fetching it, updating it, and even handling transactions. Play around with it, maybe build a small app like a to-do list or a counter, and see how it fits into your projects. What do you think you’ll build with it?
