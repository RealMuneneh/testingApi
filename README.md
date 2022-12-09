# README

# A learn Online website 

This project is a simple online app that present tutor to learner on any programing concept.


## Description

It is a tool that learners can use to acquire skills on programing concepts. first when a user visit the website the home page is presented with the general over view. Two more nav links has been used to further present to the viewer the wider concept of the project, the book lesson and package navlinks. After the view is satisfied with the web concept the requirement to access the content requires one to login where using JWT authentication one has to login or signup if not a member.


## Technologies used

HTML, CSS, JavaScript, React JS and Ruby on rails



## Project breakdown

Mainly the project was to use React js for frontend while ruby on rails for the api configuration or the backend.



### Backend

The command for creating a ruby on rails app is as shown below.
    rails new ip-backend --skip-javascript
the --skip-javascript is an argument that must be included to prevent creation of spec file that has that lab test which wont be of relevance to out backend application.
After that one has to navigate to the ip-backend folder in order to rails s or start the server and be able to access the endpoint for the backend.
Then I created the routing for all the endpoint which were for the /user, /package, /tutor, /lesson. This was done on the config/route file where using resource user, resource package, resource tutor, and resource lesson i was able to initiate all the methods. 
Step two was to create the CRUD inside the controller. 
3. using rails g method and controller were created.
rails db:migrate and db:seed were used to generate the schema file and update the database respectively.

### Frontend
Since I was using React js the command for generating the web app was npx create-react-app (client) then using npm start --prefix client i executed our web app.
To fullfill the web purpose I created the component folder to hold the js files.
also a .css file was created that was effective on styling our components.

## Support and contact details
My technical mentor, peer programmer and group member are fully credited for this output as they guide me during the whole process of this project where necessary. Additionaly ww3school.com, stackoverflow and geeks for geeks played a vital role in the further understanding of concepts.
## Authors and acknoledgment
I am greatful as the scratch programmer in making this project a success and i  have learned that success comes from much collaboration and intense google search. Thus i would say googling is the ways for any kind of task
## License: 
Licensed under the MIT licence Copyright (c) [@2022] (Joseph Mwangi)


