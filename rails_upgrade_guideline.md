## Steps to upgrade.
* Update rails version in Gemfile to 5.2.2, other gem from `~>` to `>=`
* Add gem 'bootsnap' to Gemfile
* Update bundler. https://github.com/jekyll/jekyll/issues/7463#issuecomment-451686361
* Run `bundle update rails`, `rails app:update`
* Update migration file ..create_user.rb with `< ActiveRecord::Migration` to `<ActiveRecord::Migration[5.0]` then run `rails db:migrate` 
* Create ApplicationRecord class to adapt with new class
```
# app/models/application_record.rb
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
```

** References.
- https://hashrocket.com/blog/posts/how-to-upgrade-to-rails-5#3-update-rails-binaries-and-configurations
