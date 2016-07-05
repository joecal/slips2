Answer.destroy_all
Question.destroy_all
Subject.destroy_all
User.destroy_all

@test_user = User.create(username: "Joe", password: "moma")

subject_list = [
  ["CLI"],
  ["Git"],
  ["Misc"],
  ["Angular"],
  ["Single Page Apps"],
  ["Express"],
  ["Sequelize"],
  ["APIs"],
  ["RWD"],
  ["CSS2"],
  ["Databases"],
  ["Javascript"],
  ["OOJS"],
  ["Ruby MVC"],
  ["Ruby Basics"],
  ["ActiveRecord"],
  ["HTML and CSS"],
  ["HTTP"]
]

subject_list.each do |name|
  Subject.create!( name: name )
end

question_list = [
  ["Why would a developer prefer the command line over a GUI?", 1],
  ["Write a command to list only files beginning with your first name and label the parts of the command", 1],
  ["Where can we find help for shell commands?", 1],
  ["List 4 bash commands for managing folders and files", 1],
  ["Describe 2 unsafe commands", 1],
  ["What's the difference between absolute and relative paths?", 1],
  ["What's the difference between 'git commit' and 'git push'?", 2],
  ["Describe the difference between a fork and a branch.", 2],
  ["Whiteboard the command(s) to create a new branch and swtich to it", 2],
  ["How often should you commit?", 2],
  ["Explain what a branch is in git.", 2],
  ["If you meant to fork before you cloned, but instead cloned from the original repo you might have trouble pushing. How can you fix this?", 2],
  ["Describe what the DOM is and its importance in the web technology stack", 3],
  ["Why would we want to take an object-oriented approach to programming?", 3],
  ["Describe how we use prototypes to set up inheritance in JS", 3],
  ["Write a JavaScript Object literal with at least one property and one method (e.g. a person).", 3],
  ["List common steps to follow when solving a problem.", 3],
  ["'I'm the world's #0 programmer!' Explain the joke.", 3],
  ["Create a CSS selector that selects all <li> elements with a class of 'nav-link'.", 3],
  ["What's the difference between an index and a key?", 3],
  ["What's the difference between an implicit return and a side effect?", 3],
  ["Explain the difference between referencing and invoking a function.", 3],
  ["Explain the concept of events and event driven programming.", 3],
  ["Explain the concept of a 'callback' function.", 3],
  ["What is binding.pry and how do we use it?", 3],
  ["Give an example usage of the 'link_to' method in Rails.", 3],
  ["What does it mean to use nested resources and why would you implement them?", 3],
  ["What is the purpose of `params`? Also list three ways in which Rails puts data in it.", 3],
  ["Explain what active record validations are for, and give an example of one.", 3],
  ["Describe the MVC (or rMVC) paradigm as it relates to Rails.", 3],
  ["Explain what ERB is and why we use it.", 3],
  ["Explain how to represent one-to-many relationships in AR (including DB columns).", 3],
  ["Explain what an ORM is and why they are useful.", 3],
  ["Define routes using Rails", 3],
  ["What is the purpose of Rails's application.html.erb file?", 3],
  ["Write an html <script> tag that links to a js file in public/js/app.js", 3],
  ["List the 5 HTTP request methods. How do they relate to the 4 crud actions?", 3],
  ["Whiteboard a Rails form helper that creates or edits an instance of a Student model.", 3],
  ["What is the difference between 'relative' and 'absolute' positioning?", 3],
  ["Describe the difference between a fork and a branch.", 3],
  ["List two Ruby Enumerators and give their purpose.", 3],
  ["Identify the three places that CSS styles can go", 3],
  ["Define the purpose of the 'action' and 'method' attributes of a form.", 3],
  ["Assuming a ActiveRecord class, name three methods that are added by `has_many :comments`", 3],
  ["What is the difference between Active Record methods find, find_by and where? Provide an example of each.", 3],
  ["Distinguish between a route and a path", 3],
  ["Explain what Handlebars is and why we use it.", 3],
  ["Define routes with URL parameters and access those parameters", 3],
  ["Whiteboard an ERD for an app with `doctors`, `patients` and `appointments` as models with ActiveRecord relationships.", 3],
  ["What is the difference between Active Record methods find, find_by and where? Provide an example of each.", 3],
  ["What is `npm`?", 3],
  ["Write a get request using any path as you would in an express application.", 3],
  ["How does `module.exports` help us with separation of concerns?", 3],
  ["Explain the `req` and `res` variables in `app.get('/authors', function(req, res){...})`", 3],
  ["Write an AJAX call that retrieves all the Artists from a Rails Tunr API, formatted as JSON.", 3],
  ["Write a Rails controller action which supports html and json responses.", 3],
  ["What does the HTML5 history api allow us to do?", 3],
  ["What is one problem that Single Page Applications face that traditional web apps don't?", 3],
  ["What are constructor functions? How do we use them?", 3],
  ["What is a prototype? Why do we care about them?", 3],
  ["List 1 Mongoose method and its ActiveRecord counterpart.", 3],
  ["How do callbacks and asynchronicity factor into Mongoose?", 3],
  ["Where should you declare associations in a Mongoose app?", 3],
  ["There are 3 different ways to set up your database tables in a Mongoose app. What are 2?", 3],
  ["Write a root route that redirects to '/authors'.", 3],
  ["What is an API?", 3],
  ["Give an example of each JSON data structure.", 3],
  ["Create a media query that supports most mobile phones.", 3],
  ["How can box sizing affect the DOM Element?", 3],
  ["Using a 'for' loop, iterate over an array of numbers in JavaScript, printing each to the console.", 3],
  ["List at least 3 methods added to a class when it inherits from ActiveRecord::Base.", 3],
  ["What action do you expect this route to perform: `app.post('/authors', function() {...}`?", 3],
  ["Write the url to request all authors from a Rails app, formatted as JSON.", 3],
  ["Instantiate an Angular module on the whiteboard. What arguments does it receive?", 4],
  ["What is an IIFE? Why do we use them in Angular?", 4],
  ["What is an Angular directive? Provide three examples of one.", 4],
  ["How do we indicate something is an Angular expression in an HTML file?", 4],
  ["Why do we use the term 'ViewModel' in Angular?", 4],
  ["What type of Angular component is `ngResource`? What does it do?", 4],
  ["What is an Angular 'state'? What information do we need to define one?", 4],
  ["Why are custom directives useful in Angular?", 4],
  ["What does the HTML5 history api allow us to do?", 5],
  ["What is one problem that Single Page Applications face that traditional web apps don't?", 5],
  ["What is `npm`?", 6],
  ["Write a get request using any path as you would in an express application.", 6],
  ["How does `module.exports` help us with separation of concerns?", 6],
  ["What action do you expect this route to perform: `app.post('/authors', function() {...}`?", 6],
  ["Explain the `req` and `res` variables in `app.get('/authors', function(req, res){...})`", 6],
  ["Write a root route that redirects to '/authors'.", 6],
  ["List 1 Sequelize method and its ActiveRecord counterpart.", 7],
  ["How do callbacks and asynchronicity factor into Sequelize?", 7],
  ["Where should you declare associations in a Sequelize app? ( Hint: Before or after you require your models? )", 7],
  ["There are 3 different ways to set up your database tables in a Sequelize app. What are 2?", 7],
  ["What is a API?", 8],
  ["Give an example of each JSON data structure.", 8],
  ["Write the url to request all authors from a Rails app, formatted as JSON.", 8],
  ["Write a Rails controller which supports html and json responses.", 8],
  ["Create a media query that supports most mobile phones.", 9],
  ["What is the difference between 'relative' and 'absolute' positioning?", 10],
  ["What is a reliable source for 3rd party fonts?", 10],
  ["Name 2 pseudo-classes that allow css to add content to a page.", 10],
  ["How can box sizing affect the DOM Element?", 10],
  ["What components are displayed on an ERD?", 11],
  ["Draw an ERD for a Doctors, Patients, and Appointments.", 11],
  ["List common steps to follow when solving a problem.", 11],
  ["Draw an ERD for a Members, Magazines, and Subscriptions.", 11],
  ["Write the SQL statement to update the first_name of the 'author' whose ID is 12.", 11],
  ["Write the SQL statement to list the last names of everyone in the 'students' table.", 11],
  ["Describe the difference between what is truthy/falsey in Ruby vs JavaScript?", 12],
  ["Using a 'for' loop, iterate over an array of numbers in JavaScript, printing each to the console.", 12],
  ["Explain the concept of a 'callback' function.", 12],
  ["Write a JavaScript Object literal with at least one property and one method (e.g. a person).", 12],
  ["Describe the difference between variables created with and without `var`.", 12],
  ["Define what a function is in Javascript and how it compares to a Ruby method.", 12],
  ["Differentiate between function declarations and expressions.", 12],
  ["Explain the concept of events and event driven programming.", 12],
  ["Explain the difference between synchronous and asynchronous execution.", 12],
  ["Explain the difference between referencing and invoking a function.", 12],
  ["What are Javascript's 5 primitive data types?", 12],
  ["What are the two types of collections in Javascript, and what are the differences between them?", 12],
  ["What's the difference between true / false and truthy / falsy?", 12],
  ["Use the whiteboard to create a Javascript function that has two arguments.", 12],
  ["What is pseudocode?", 12],
  ["What's the difference between an implicit return and a side effect?", 12],
  ["What is a loop? Give an example.", 12],
  ["'I'm the world's #0 programmer!' Explain the joke.", 12],
  ["What's the difference between an index and a key?", 12],
  ["Use Vanilla JS and jQuery to change a webpage's body background color to 'lemonchiffon'", 12],
  ["Define a function that takes a function as an argument and invokes the argument when the function is called.", 12],
  ["Write a JavaScript constructor function with at least one property and one method (e.g. a person). Create an instance.", 13],
  ["What are constructor functions? How do we use them?", 13],
  ["What is a prototype? Why do we care about them?", 13],
  ["Describe how we use prototypes to set up inheritance in JS", 13],
  ["What are constructor functions and the new keyword? How are they related?", 13],
  ["Write a Ruby class with an initialize method.", 14],
  ["Explain what ERB is and why we use it.", 14],
  ["What is the purpose of `params`? Also list three ways in which Rails puts data in it.", 14],
  ["Explain how to represent one-to-many relationships in AR (including DB columns).", 14],
  ["Explain what active record validations are for, and give an example of one.", 14],
  ["Explain what an ORM is and why they are useful.", 14],
  ["Describe the MVC (or rMVC) paradigm as it relates to Rails.", 14],
  ["Give an example usage of the 'link_to' method in Rails.", 14],
  ["Describe what Rails is and what it is used for", 14],
  ["Distinguish between a route and a path", 14],
  ["Define routes using Rails", 14],
  ["What is the purpose of Rails' application.html.erb file?", 14],
  ["Write an html <script> tag that links to a js file in public/js/app.js", 14],
  ["List at least 3 methods added to a class when it inherits from ActiveRecord::Base.", 14],
  ["Define routes with URL parameters and access those parameters", 14],
  ["What are Ruby's 5 main data types?", 15],
  ["What are the two types of collections in Ruby, and what are the differences between them?", 15],
  ["Describe the homework submission process for WDI.", 15],
  ["What is binding.pry and how do we use it?", 15],
  ["What's the difference between a symbol and a string?", 15],
  ["What's an enumerator?", 15],
  ["What's the difference between true / false and truthy / falsy?", 15],
  ["Use the whiteboard to create a Ruby method that has two arguments.", 15],
  ["What's the difference between explicit and implicit return?", 15],
  ["What is variable scope?", 15],
  ["How would you add a key / value pair to an existing hash?", 15],
  ["What is pseudocode?", 15],
  ["What's the difference between an implicit return and a side effect?", 15],
  ["What is a loop? Give an example.", 15],
  ["What's the difference between a loop and an enumerator?", 15],
  ["What's the difference between a range and an array?", 15],
  ["What's the difference between a variable and a method?", 15],
  ["What's the difference between 'break' and 'return'?", 15],
  ["Write a 'puts' statement on the board, and describe its input, output, and side effects.", 15],
  ["'I'm the world's #0 programmer!' Explain the joke.", 15],
  ["What's the difference between an index and a key?", 15],
  ["List two Ruby Enumerators and give their purpose.", 15],
  ["Describe the difference between what is truthy/falsey in Ruby vs JavaScript?", 15],
  ["How many objects can a method return? Which methods don't return anything?", 15],
  ["List at least 3 methods added to a class when it inherits from ActiveRecord::Base.", 16],
  ["Explain what an ORM is and why they are useful.", 16],
  ["Explain what HTML is and what problem it solves", 17],
  ["Explain the different roles of HTML, CSS & JavaScript in the web technology stack", 17],
  ["Describe what the DOM is and its importance in the web technology stack", 17],
  ["Explain the purpose of HTML attributes", 17],
  ["Describe the differences between the <head> and <body> tags", 17],
  ["Describe how content other than HTML documents are organized and accessed on the web", 17],
  ["Create HTML elements using tags and attributes", 17],
  ["Create a well formed HTML document that nests elements within each other", 17],
  ["Include images on a webpage", 17],
  ["Link from one webpage to another", 17],
  ["Define what CSS is and explain its role in separation of concerns", 17],
  ["Identify the three places that CSS styles can go", 17],
  ["Explain what selectors are, and how they target HTML elements", 17],
  ["Explain the major parts of the box model", 17],
  ["Explain the difference between inline and block elements", 17],
  ["Create an external stylesheet, and link it into an HTML document", 17],
  ["Explain what selector specificity is, and how it is calculated", 17],
  ["Explain the use of multiple fonts using font-family", 17],
  ["Explain the difference between padding and margin", 17],
  ["What's the difference between 'relative' and 'absolute' positioning?", 17],
  ["Explain the purpose of HTML attributes.", 17],
  ["Create a media query that supports most mobile phones.", 17],
  ["How can box sizing affect a DOM Element?", 17],
  ["Define the purpose of the 'action' and 'method' attributes of a form.", 18]
]

question_list.each do |question_text, subject_id|
  Question.create!( question_text: question_text, subject_id: subject_id )
end
