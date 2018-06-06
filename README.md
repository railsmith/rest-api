# README

A thin restful API using Grape, MongoDB and RSpec API documentation mounted on Rails 5.

### Prerequisites

* Ruby version

   **Ruby 2.4.1**

* System dependencies
  
   **Rails 5**

   **MongoDB 3.6.2**

   **Mongoid 6**


### Installation

```r
  bundle install
```


### How to run the test suite

```r  
  bundle exec rspec spec/acceptance/api/v1/companies_spec.rb
```

 * For running individual test cases

```r  
  bundle exec rspec spec/acceptance/api/v1/companies_spec.rb -e "create a company"
```

### Documentation

```r
  rails docs:generate
```

This will run the test suite and generate the API documentation which can be viewed at 

http://localhost:3000/api/docs
