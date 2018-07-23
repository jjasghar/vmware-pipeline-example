TESTING doc
========================

Bundler
-------
A ruby environment with Bundler installed is a prerequisite for using
the testing harness shipped with this cookbook. At the time of this
writing, it works with Ruby 2.0 and Bundler 1.5.3. All programs
involved, with the exception of Vagrant, can be installed by cd'ing
into the parent directory of this cookbook and running "bundle install"

Rakefile
--------
The Rakefile ships with a number of tasks, each of which can be ran
individually, or in groups. Typing "rake" by itself will perform style
checks with Rubocop and Foodcritic, ChefSpec with rspec, and
integration with Test Kitchen using the Vagrant driver by
default.Alternatively, integration tests can be ran with Test Kitchen
cloud drivers.

```
$ rake -T
rake integration              # Run all integration tests
rake integration:docker       # Run Test Kitchen with Docker (remote)
rake integration:dokken       # Run Test Kitchen with Dokken (local)
rake integration:vagrant      # Run Test Kitchen with Vagrant (local)
rake integration:vcenter      # Run Test Kitchen with vCenter (remote)
rake spec                     # Run ChefSpec examples
rake style                    # Run all style checks
rake style:chef               # Run Chef style checks
rake style:ruby               # Run Ruby style checks
```

Style Testing
-------------
Ruby style tests can be performed by Rubocop by issuing either
```
bundle exec rubocop
```
or
```
rake style:ruby
```

Chef style tests can be performed with Foodcritic by issuing either
```
bundle exec foodcritic
```
or
```
rake style:chef
```

Spec Testing
-------------
Unit testing is done by running Rspec examples. Rspec will test any
libraries, then test recipes using ChefSpec. This works by compiling a
recipe (but not converging it), and allowing the user to make
assertions about the resource_collection.

Integration Testing
-------------------
Integration testing is performed by Test Kitchen. Test Kitchen will
use either the Vagrant driver or various cloud drivers to instantiate
machines and apply cookbooks. After a successful converge, tests are
uploaded and ran out of band of Chef. Tests should be designed to
ensure that a recipe has accomplished its goal.
