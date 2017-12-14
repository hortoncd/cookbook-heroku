Description
===========

Cookbook that will install heroku toolbelt directly from a repo.  By
default it attempts to install from the heroku repo if it exists.  It
should work from any repo if you would like to maintain specific
versions of the package in your own repo.

Initial support is for apt-based systems only.

Requirements
============

## Platform

* Ubuntu (14.04+)
* Debian (7.1.0+)

## Cookbooks

Until chef can support platform-dependent dependencies, they will be
documented, but not enforced in the metadata.rb.

* apt (>= 2.0.0)

Attributes
==========

Attributes are under the `node[:heroku]` namespace.

Apt related attributes:

* `node[:heroku][:apt_repo]` - apt repo source url
* `node[:heroku][:apt_key]` - apt key source url
* `node[:heroku][:apt_key_id]` - key id for heroku apt key

The default heroku repo does not support the distribution and components
options in the standard way.  The default settings will work with the 
heroku repo, but they are included here to you can set them if you are
using a different apt repo.

* `node[:heroku][:distribution]` - distribution
* `node[:heroku][:components]` - components to setup in sources file (main, etc.)


Other attributes:

* `node[:heroku][:bin_dir]` - bin dir to use in profile script

Recipes
=======

## default

Sets up heroku-toolbelt from the heroku apt repo instead of the
`install.sh` method that is inexplicably recommended by the heroku
webpage even though all it does is setup the apt config.  (Seriously,
how did this crap take over from straightforward package installs in so
many places?)

Usage
=====

Initial support is only for apt-based systems.

Add `heroku` to the run list for a node/role.  If you're using a
package from an apt repo other than the one controlled by heroku, set
`node[:heroku][:distribution]` and `node[:heroku][:components]` as
needed.

License and Author
==================

- Author:: Chris Horton (<hortoncd@gmail.com>)
- Copyright:: 2013 - 2017, Chris Horton

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
