# Ensure the SSH client configuration directory exists
file { '/home/root/.ssh':
  ensure  => 'directory',
  owner   => 'root',
  group   => 'root',
  mode    => '0700',
  require => User['ubuntu'],
}

# Add the private key to the SSH agent
exec { 'ssh-add-private-key':
  command => 'ssh-add ~/.ssh/school',
  user    => 'ubuntu',
  require => File['/home/root/.ssh'],
}

# Configure the SSH client to use the private key and disable password authentication
file_line { 'ssh-config':
  path    => '/home/root/.ssh/config',
  line    => "IdentityFile ~/.ssh/school\nPasswordAuthentication no",
  ensure  => present,
  group   => 'root',
  mode    => '0600',
  require => File['/home/root/.ssh'],
}
