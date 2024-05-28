# 0. Sky is the limit, let's bring that limit higher
exec {'replace':
  provider => shell,
  command  => 'sudo sed -i "s/15/4096/g" /etc/default/nginx',
  before   => Exec['restart'],
}

exec {'restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
