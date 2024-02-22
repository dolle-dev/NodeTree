# Node Tree API

## Project Description

This API serves as a backend service to interact with a dynamically expanding tree of nodes, represented as an adjacency list where a child's `parent_id` equals a parent's `id`. It includes two primary endpoints: one for determining the lowest common ancestor of two nodes and another for retrieving bird IDs associated with a set of nodes.

## Prerequisites

- Ruby version 3.2.0
- Rails version 7.1.3

Please ensure you have the specified versions of Ruby and Rails installed before proceeding.

## Setup Instructions

### Backend

1. Clone the repository and navigate to the backend directory:
    ```bash
    cd backend
    ```

2. Install the required Ruby gems:
    ```bash
    bundle install
    ```

3. Create and set up the database:
    ```bash
    rails db:create
    rails db:migrate
    ```

4. Load the data from `nodes.csv`:
    ```bash
    rake load:nodes
    ```

5. Start the Rails server:
    ```bash
    rails s
    ```
    The backend server will be available at [http://localhost:3000/](http://localhost:3000/).

6. To run the backend test cases, navigate to the backend directory and run:
    ```bash
    rspec
    ```
    This will execute all the RSpec tests defined for the backend application.

### Frontend (Optional)

Before running the frontend application, you need to add an environment variable for connecting to the backend server. Create a `.env` file in the frontend directory and add the following line:

```env
VITE_REACT_APP_BACKEND_BASE_URL=http://localhost:3000

1. Navigate to the frontend directory:
    ```bash
    cd frontend
    ```

2. Install the necessary packages:
    ```bash
    npm install
    ```

3. Start the frontend server:
    ```bash
    npm start
    ```
    The frontend server will be available at [http://localhost:5173/](http://localhost:5173/).

## API Endpoints

### Common Ancestor

- Endpoint: `/nodes/common_ancestor?a=${nodeA}&b=${nodeB}`
- Method: `GET`
- Description: Returns the root_id, lowest_common_ancestor_id, and depth of the tree of the lowest common ancestor that the two node IDs share.

### Birds

- Endpoint: `/nodes/birds?ids=${nodeIds}`
- Method: `GET`
- Description: Takes an array of node IDs and returns the IDs of the birds that belong to one of those nodes or any descendant nodes.

## Assessment Instructions

This API is an implementation based on provided assessment instructions. It includes the functionality to load data into a PostgreSQL database, catering to data that is dynamic and expanding.

### Features

1. **Common Ancestor Endpoint**: Find the lowest common ancestor of two nodes, handling edge cases such as no common ancestor and when the provided node IDs are the same.

2. **Birds Endpoint**: Retrieve bird IDs associated with a set of nodes, including descendant nodes.

Please ensure that PostgreSQL is installed and running before attempting to set up the backend. Enjoy exploring the API!
