package %w(automake gcc)
package node['platform_specific_pkgs']

git node['tmux']['destination'] do
  repository  node['tmux']['repo']
  revision    'master'
  action      :sync
end

bash 'build tmux' do
  not_if { File.exist?('/usr/local/tmux/tmux') }

  cwd node['tmux']['destination']
  code <<-EOH
    sh autogen.sh
    ./configure && make
  EOH
end

bash 'copy tmux executable to /usr/local/bin' do
  not_if { File.exist?('/usr/local/bin/tmux') }
  code 'cp /usr/local/tmux/tmux /usr/local/bin'
end
