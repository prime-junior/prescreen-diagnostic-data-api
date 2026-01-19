# Prescreen Diagnostic Data API

![Node.js](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)
![Express.js](https://img.shields.io/badge/Express.js-404D59?style=for-the-badge)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

## Table of Contents

- [Description](#description)
- [Prerequisites](#prerequisites)
- [PostgreSQL Setup](#postgresql-setup)
- [Express Server Setup](#express-server-setup)
- [Installation and Execution](#installation-and-execution)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [Author](#author)
- [License](#license)

## Description

A RESTful API built with Node.js, Express.js, and PostgreSQL for managing and accessing automotive diagnostic data. This API provides endpoints to retrieve prescreen diagnostic information including vehicle details, problems, DTCs (Diagnostic Trouble Codes), and resolutions.

This API was developed to serve the cleaned automotive diagnostic data processed in the [automotive_diagnostic_data_cleaning](https://github.com/hydra-code-repository/automotive_diagnostic_data_cleaning) project. After the data cleaning and preparation phase, this API enables practical utilization of the cleaned datasets through RESTful endpoints for integration with other applications and analysis tools.

## Prerequisites

- Node.js (v14 or higher)
- PostgreSQL (v12 or higher)
- npm or yarn package manager

## PostgreSQL Setup

### PostgreSQL Command Prompt
`psql` is the PostgreSQL interactive terminal. Running `psql` connects to a PostgreSQL host.
Connect to the default postgres database with the default login information and no option flags:

```cmd
psql postgres
```

The connection enters into a new session inside psql in the postgres database. The prompt ends with a `#` to denote superuser or root access:

```
postgres=#
```

Commands within psql start with a backslash `\`. To test the first command, check what database, user, and port the connection uses with the `\conninfo` command:

```
postgres=# \conninfo
You are connected to database "postgres" as user "your_username" via socket in "/tmp" at port "your_database_port".
```

Return to the computer's default terminal connection. Connect postgres with a specific user:

```cmd
psql -d postgres -U me
```

Instead of `postgres=#`, the prompt shows `postgres=>`, indicating standard user access rather than superuser.

## Express Server Setup

To set up a Node.js app and Express server, create a directory for the project:

```cmd
mkdir node-api-postgres
cd node-api-postgres
```

Either run `npm init -y` to create a package.json file, or copy the code into a package.json file:

*See the contents of the respective `package.json` file in this project.*

Install Express for the server and node-postgres to connect to PostgreSQL:

```cmd
npm i express pg
```

The dependencies are now loaded into node_modules and package.json.

### Creating the Server File
Create a `server.js` file as the entry point for the server. Configure the express module, body-parser middleware, app variables, routes for GET requests, and set the app to listen on the specified port. *See the contents of the respective `src/server.js` file in this project for complete configuration details.*

### Creating the Database Queries File
After creating the server entry point, create a `queries.js` file to handle database endpoints that display all database. The first endpoint uses a GET request with raw SQL inside the pool.query() to SELECT all database ordered by ID. *See the contents of the respective `src/queries.js` file in this project for complete database query implementations.*

### Running the Server
From the command line, start the server:

```cmd
node src/server.js
```

Navigate to `http://localhost:3000` in the browser to see the JSON response:

```json
{
  "info": "Node.js, Express, and Postgres API"
}
```

## Installation and Execution

### 1. Clone the repository
```cmd
git clone <repository-url>
cd prescreen-diag-data-node-api-psql
```

### 2. Install dependencies
```cmd
npm install
```

### 3. Set up environment variables
Create a `.env` file in the root directory with your database configuration:
```env
DB_USER=your_database_user
DB_HOST=your_database_host
DB_DATABASE=your_database_name
DB_PASSWORD=your_database_password
DB_PORT=your_database_port
```

**Note:** Replace the placeholder values with your actual database credentials. The `.env` file is already included in `.gitignore` to prevent sensitive information from being committed to version control.

### 4. Set up the database
Execute the SQL script located in the `sql/` folder to create the database, tables, and import data:
```cmd
psql -U postgres -f sql/.sql
```

### 5. Run the API
```cmd
node src/server.js
```

The server will start on port 3000. You should see the message:
```
App running on port 3000.
```

## Usage

### API Endpoints

#### Get API Information
```
GET http://localhost:3000/
```
Returns basic API information.

#### Get All Diagnostic Data
```
GET http://localhost:3000/getfulldb
```
Returns all prescreen diagnostic data from the database.

### Testing the API
Open your browser and navigate to:
```
http://localhost:3000/getfulldb
```

## Project Structure

```
prescreen-diag-data-node-api-psql/
├── .env                    # Environment variables
├── .gitignore             # Git ignore file
├── node_modules/          # Project dependencies (auto-generated)
├── package.json           # Project dependencies and scripts
├── README.md              # Project documentation
├── sql/                   # Database scripts
│   └── .sql              # Database setup and data import
└── src/                   # Source code
    ├── configs/           # Configuration files
    │   └── db.js         # Database configuration
    ├── queries.js        # Database queries and connection
    └── server.js         # Main server file
```



## Technologies Used

- **Node.js** - JavaScript runtime environment
- **Express.js** - Web framework for Node.js
- **PostgreSQL** - Relational database management system
- **pg** - PostgreSQL client for Node.js
- **dotenv** - Environment variable management
- **cors** - Cross-Origin Resource Sharing middleware
- **body-parser** - Body parsing middleware

## Useful Commands

Frequently used commands for development and maintenance:

```sh
# Install dependencies
npm install

# Run the server
node src/server.js

# Update all dependencies to the latest versions allowed by package.json
npm update

# Update all dependencies to the latest available versions
npx npm-check-updates -u
npm install

# Update a specific dependency to the latest version
npm install <package-name>@latest

# Check globally installed dependencies
npm list -g --depth=0
```

## Author

Developed by [Weverson Barbieri de Oliveira](https://github.com/weversonbarbieri)

## License

MIT