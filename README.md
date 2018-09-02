# Raye7 task

Project to make trips and pickups for passengers and drivers to meet each other

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. .

### Prerequisites

You need to have ruby version 2.5.0 installed on your machine


### Installing

A step by step series for how to get a development env running

First you rename the .env.example file to .env and put your database username and password

```
mv .env.example .env
```

Second create the database and migrate the schema

```
bundle exec rake db:create && bundle exec rake db:migrate
```

Then you run the server and practice the application

## Running the tests

To run the tests we use rspec

```
bundle exec rspec
```

## Built With

* [rails](https://rubyonrails.org/) - The web framework used
* [rspec](http://rspec.info/) - Dependency Management
* [Devise](https://github.com/plataformatec/devise) - Used to make the authentication
* [cancancan](https://github.com/CanCanCommunity/cancancan) - Used to make the authorization

## Future work

* link the trips to pickups
* notify the user when there is a trip in his pickup location 
* make the passenger subscribe to the trip and number of seats is the maximum


## Authors

* **Mohamed Hegab** - *Initial work* - [MohamedHegab](https://github.com/MohamedHegab)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc