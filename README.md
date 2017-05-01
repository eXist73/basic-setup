1) Download install vagrant (vagrantup.com)
2) Download VirtualBox (https://www.virtualbox.org/wiki/Downloads)
3) Use windows cmd (or git bash) to create a vagrant file (or use an existing vagrant file)
4) To create your own use 'vagrant init'
5) Make sure you have laravel vagrant box 'vagrant box add laravel/homestead' in the command line
6) Edit the hosts file to be the new project ip (C:\Windows\System32\drivers\etc)
7) What the new entry should look like: '192.168.50.13 local.basic-setup.com'
8) Change config.cfg file to your needs for the new site
9) Go to project directory and type 'vagrant up' to start the server
10) Can always access the server by type 'vagrant ssh'
11) Destroy server by 'vagrant destroy -f'