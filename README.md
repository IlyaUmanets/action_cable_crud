# README

This app shows how manage actioncable easily and predictable.

## Setup

* `git clone https://github.com/IlyaUmanets/action_cable_crud`
* `cd action_cable_crud`
* `mv config/database.example.yml config/database.yml`
* `bundle install`
* `rake db:setup`
* `rails s`

Go to http://localhost:3000/rooms/1 and duplicate this tab to see changes dynamically.
Now you can create, remove (click X) and update message. Enjoy!
