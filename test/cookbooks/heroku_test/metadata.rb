name             'heroku_test'
maintainer       'Chris Horton'
maintainer_email 'hortoncd@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures heroku_test'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "heroku"

%w{ubuntu debian}.each do |os|
  supports os
end
