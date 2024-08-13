# README

## Prerequisites

* [Docker Desktop](https://www.docker.com/products/docker-desktop)
* Ensure `docker` is installed with `docker -v`
* Ensure `docker-compose` is installed with `docker-compose -v`

## Setup

* Checkout the repository
* Navigate to the repository directory in your relevant console
* Create a `.env` file for local specific environment variables, you can copy from `env-local`   
* Run `docker-compose build` to build the docker containers
* Start everything (postgresql, redis, rails server, sidekiq) using `docker-compose up`
* Create the databases using `docker-compose run app rake db:create`
* Migrate database to the latest version using `docker-compose run app rake db:migrate`
* Run the seeds to setup basic data `docker-compose run app rake db:seed`
* Navigate to `localhost:3000` in your browser

## Connecting to the docker container via bash

Connect to the docker container to run different rails commands etc.

* Run `docker-compose run app bash`

## Running Tests

Tests are built using minitest and can be run using:

`rake test:db` or `rake test:db` when connected to the container bash

## Testing Endpoint

For testing the REST endpoint, you can use the rest-atask-api-client.http file. Please note that this file is designed to be used with the Rest Client extension in VS Code. Make sure to install the Rest Client extension before proceeding.

## Designs Systems

**Implementation Considerations:**

1. **Rails Version and Environment:**
The project uses Rails API-Only version 7.1.3.4 with a PostgreSQL database. The containerized environment is managed using Docker with Docker Compose for orchestration.

2. **Environment Configuration:**
System environment variables are managed through a .env file, eliminating the need for additional tools or gems like dotenv.

3. **Data Modeling Approach:**
I chose Polymorphic Associations over Single Table Inheritance (STI) to allow for future expansion with new entity types. Given the requirements, I wasn't confident that all entities would share the same behavior. This approach is also supported by considerations outlined in this GitLab documentation https://docs.gitlab.com/ee/development/database/single_table_inheritance.html

4. **Authorization:**
Due to restrictions on using additional gems, including bcrypt for has_secure_password, I was compelled to implement session-based authorization for the API instead of token-based. While session-based authorization is not ideal for APIs, it was necessary given the project constraints.

5. **ACID Compliance:**
To ensure ACID properties, I implemented database transactions and used a Service Object pattern to handle transaction logic.

6. **Library Development:**
While developing the library, I only found the price_all endpoint in version 1 (V1). The documentation appears to be lacking. To facilitate future enhancements, I added the library using a module/mixin approach.

I believe this serves as a boilerplate based on the current requirements, though there may be aspects I've overlooked.

Please feel free to reach out if you encounter any issues.

**Thank you!**