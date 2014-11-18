name             'web-apps'
maintainer       'Three Tier Development'
maintainer_email 'hosting@three-tier.com'
license          'All rights reserved'
description      'Installs/Configures web-apps'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'application'
depends 'application_ruby'
depends 'ruby_build'
depends 'github-deploys'
