# 1. User limit
exec {'replace-hard':
  provider => shell,
  command  => 'sudo sed -i "s/holberton hard nofile 5/holberton hard nofile 4096/" /etc/security/limits.conf',
  before   => Exec['replace-soft'],
}

exec {'replace-soft':
  provider => shell,
  command  => 'sudo sed -i "s/holberton soft nofile 4/holberton soft nofile 1024/" /etc/security/limits.conf',
}
