# README

To run the application,

1. Run `bundle install` to install the gems.
2. Run `rake db:migrate` to create contacts table
3. Run `rake db:seed` to create fake data in contacts table

Now the application can be started using standard `rails s` command.

There are 2 pages in the application.

1. Contact page with searching and addition of contacts.
    This page can be directly accessed as home page.
    For this app we need to populate the db with contacts using `rake db:seed` command in command line as said above.
    
2. Google sports news aggregator page can be directly accessed at `http://localhost:3000/google_sports`
