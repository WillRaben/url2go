Application created as part of selection process for a remote ruby on rails full stack position.

It aims to mimic an url-shortener in functionality.

To install locally under development env.

1 Clone the repository

https://github.com/WillRaben/url2go.git

2 run "bundle"

3 rename database.yml.org to database.yml and edit according to local setup

4 run "rails db:create db:migrate"

5 run "rails s -b 0.0.0.0"

6 access the application through the browser on port 3000


Considerations:

The request was to achieve the shortest url possible and the algorithm that I chose for that end  was that of encoding unique bigint (signed 8byte) ids to a base64 using the standard url charset which consists of the following chars according to my research.

0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_- 

Using this technique, running base64_encode(9999999999) returns an unique representation of only 6 character 9K2_F-
this process goes both ways so we can retrieve this long number by passing 9k2_f- to base64_decode.

The functions are located in app/helpers/long_uris_helper.rb and they use constants declared in config/initializers/constants.rb

