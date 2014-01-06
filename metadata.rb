name             'heroku'
maintainer       'Chris Horton'
maintainer_email 'hortoncd@gmail.com'
license          'Apache 2.0'
description      'Install Heroku Toolbelt'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# Until chef truly supports per-platform dependencies, dependency
# information will just be documented.
# depends 'apt', '>= 2.0.0'

supports 'ubuntu', '>= 10.04'
supports 'debian', '>= 7.0.1'
