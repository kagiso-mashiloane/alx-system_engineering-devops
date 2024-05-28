#!/usr/bin/env bash
# shebang line - The first match in the $PATH environment variable.
# Client configuration file (w/ Puppet)
file { '/etc/ssh/ssh_config':
  ensure => present,
}->
file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}->
file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentityFile ~/.ssh/holberton',
  match => '^IdentityFile',
}
