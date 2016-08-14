
default['platform_specific_pkgs'] = 
  if node['platform_family'] == 'rhel'
    ['libevent-devel', 'ncurses-devel']
  elsif node['platform_family'] == 'debian'
    ['libevent-dev', 'ncurses-dev', 'pkg-config']
  end

default['tmux'].tap do |tmux|
  tmux['destination'] = File.join('/', 'usr', 'local', 'tmux')
  tmux['repo']        = 'https://github.com/tmux/tmux.git'
end
