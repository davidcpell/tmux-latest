describe command('/usr/local/bin/tmux -V') do 
  its('exit_status') { should eq 0 }
end
