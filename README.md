# django-bootstrap
Django bootstrap environment

# Installing the project
Required:
 - installed docker https://docs.docker.com/engine/install/ubuntu/
 - pre-commit
   `pip install pre-commit`

Build image:
`docker-compose build`

Prepare database:
`docker-compose run --rm backend python manage.py migrate`

# Starting the project

`docker-compose up`

In order to rebuild container

`docker-compose build`

# Stopping the project

`docker-compose down --volumes`

# Testing
### Frontend

`docker-compose run --rm frontend yarn run unit`
### Backend
`docker-compose run --rm backend python manage.py test`

# Pycharm configuration
Setting up interpreter

![image](https://user-images.githubusercontent.com/40120335/154844437-f0ecc6eb-40ae-490e-b8c2-d7cee0a9155d.png)

Django settings

![image](https://user-images.githubusercontent.com/40120335/154844482-52bf891c-ffc4-437e-be95-5a42ef42ea68.png)

In Project Structure, set **Content Root** to **app** directory. 

Add debug server

![image](https://user-images.githubusercontent.com/40120335/154844601-69342543-e50c-4a8d-965e-ef81ae9ac376.png)

# Running in debug mode
Stop the backed container before running debug server:
`docker-compose stop backend`

Now you can click on debug icon, happy debugging :)

Demo

![debugging](https://user-images.githubusercontent.com/40120335/154845114-40cb86d9-8f12-41dc-95f4-d236695efd7c.gif)

