<p align="center">
    <a href="https://github.com/yiisoft" target="_blank">
        <img src="docs/logo.png" height="100px">
    </a>
    <h1 align="center">Dockerized Yii 2 Advanced Project Template</h1>
    <br>
</p>

### Slightly modified yii2 template, aimed at deploying in docker environment  

&nbsp;

---
## Installation
```
    ./install.sh
```
---
## Usage
### Start server (defaults to http://127.0.0.1:20001)
```
    docker-compose up -d
```
### Attach shell to php container (for applying migrations, composer update, etc.)
```
    ./ash.sh
```
---

## Differences from default yii2 advanced template

- Default data base provider changed to PostgreSQL and connection details in dev environment set to match those in docker-compose.yml 
- Added user admin:password to user table migration

---
DIRECTORY STRUCTURE
-------------------

```
common
    config/              contains shared configurations
    mail/                contains view files for e-mails
    models/              contains model classes used in both backend and frontend
    tests/               contains tests for common classes    
console
    config/              contains console configurations
    controllers/         contains console controllers (commands)
    migrations/          contains database migrations
    models/              contains console-specific model classes
    runtime/             contains files generated during runtime
backend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains backend configurations
    controllers/         contains Web controller classes
    models/              contains backend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for backend application    
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
frontend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains frontend configurations
    controllers/         contains Web controller classes
    models/              contains frontend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for frontend application
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
    widgets/             contains frontend widgets
vendor/                  contains dependent 3rd-party packages
environments/            contains environment-based overrides
docker/                  contains files that mounted to specific locations in docker images
```
