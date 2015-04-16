name             "php-fpm"
maintainer_email "mathias.latzko@iconicfuture.com"
maintainer       "Mathias Latzko"
license          "Apache 2.0"
description      "Configure php for a application."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends 'php'

%w{ ubuntu debian }.each do |os|
  supports os
end
