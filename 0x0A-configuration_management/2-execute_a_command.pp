# Puppet Manifest to kill a process named "killmenow"

exec { 'kill_killmenow_process':
  command     => 'pkill -f killmenow',
  path        => '/root/alx-system_engineering-devops/0x0A-configuration_management/killmenow',
  refreshonly => true,
}
