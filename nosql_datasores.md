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


