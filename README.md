# README

This application will be helpful in validating the post codes.

### Vesrions used
```
Rails v6.1.3

Ruby v2.6.6
```
#### To run the rails application:
```
$ bundle install

$ yarn add bootstrap jquery popper.js

$ rails webpacker:install

$ rails spec // run the tests

$ rails server(s)
```

If the administrator want to add the lsoa list with starting name use the following file
```
\app\helpers\lsoa_helper.rb

 def self.list
   ["Southwark" , "Lambeth"]
 end
```

If the administrator wants to add unknown available postal codes to the list use the following file
```
\app\helpers\custom_postcode_helper.rb

 def self.list
    %w[SH241AA SH241AB]
  end
```

core logic of this application is resides in the service forlder
```
\app\services\postcode_service.rb
```
