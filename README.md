# Address Book v0.3.0

### [Live demo](https://addressbookdemo.herokuapp.com) 


##### Get
```sh 
$ git clone git@github.com:mtunjic/addressbook.git
```

##### Set
```sh 
# install deps
$ cd addressbook 
$ ./bin/rails webpacker:install # yarn install
$ bin/bundle install --without production

# create db and populate with test data 
$ bin/rails db:setup

# Run tests and run app 
$ bin/rails test  
$ bin/rails test:system # sudo apt install chromium-chromedriver 
$ bin/rails s 
open http://localhost:3000/

user: demo@site.com
pass: demo123
```

##### Deploy (Optional)
```sh 
$ heroku login
$ heroku create
$ git push heroku main
$ heroku run rake db:schema:load
$ heroku run rake db:seed
$ heroku open
```

#### Docker (Optional)
```sh 
$ docker build .
$ docker tag [IMAGE_ID] addressbook
$ docker run -p 3000:3000 addressbook
```

##### Genarate Domain Model and ER PDF (Optional)
```sh 
$ bundle exec erd
$ open erd.pdf
```

### TODO
- [x] Basic layout and Bootsrap 5 css
- [x] Domain model and db
- [x] Devise for authentication
- [x] Bootstrap support for devise views
- [x] UI for contact
- [x] Add StimulsJS for nested input fields 
- [x] Upload user picture
- [x] Format the phone number for display
- [x] Import/Export CSV 
- [x] Add index navigation pane 
- [x] Contact search
- [x] Pagination
- [ ] More input validations and better error messages 
- [ ] Improve security, auth per actions
- [x] Clean and refactor html
- [x] Deploy scripts & docker
