# Simple knowledge base application

This is a simple knowledge base application that has an article section and a FAQ section.
Articles can  be created by going to the "*Articles*" menu in the navigation bar end pressing the
"*Create article*" button. 
Choose a title and add the main article in the body section. Both fields require  values.
Articles in English will be automatically translated into German.
Articles are only listed by their title. Click "*View article*" to get the full view. 
Here you can also edit and delete an article.

The FAQ section contains all added questions. To add a question just go to FAQ in the navigation bar and click 
the "*Create question*" button on the page. The fields *title* and *answer* require values.


# Getting started
To get the Rails server running locally:

To use this application you need to have a **MS Translator secret key!**
Set the enviroment variable `TRANSLATOR_TEXT_SUBSCRIPTION_KEY` with your Microsoft translator key

- Clone this repo
- `bundle install` to install all req'd dependencies
- `rake db:migrate` to make all database migrations
- `rails s` to start the local server
- open localhost:3000 in your browser



## Information

* Ruby version: 2.6.3

* Rails version: 6.0.0
