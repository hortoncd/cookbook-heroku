name             'heroku'
maintainer       'Chris Horton'
maintainer_email 'hortoncd@gmail.com'
license          'Apache-2.0'
description      'Install Heroku Toolbelt'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url       'https://github.com/hortoncd/cookbook-heroku'
issues_url       'https://github.com/hortoncd/cookbook-heroku/issues'
chef_version     '>= 12.0'
version          '0.1.1'

depends 'apt', '>= 2.0.0'

supports 'ubuntu', '>= 14.04'
supports 'debian', '>= 7.0.1'
