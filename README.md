# twitterclone



## Install

### Clone the repository

```shell
git clone https://github.com/kenneth1870/twitterclone.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `2.6.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

Run:

```shell
gem install rails
bundle install
```
### Set environment variables

Using [Figaro](https://github.com/laserlemon/figaro):


### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```
