set :stage, :development
role :app, %w{root@153.126.188.66}
role :web, %w{root@153.126.188.66}
role :db, %w{root@153.126.188.66}

server '153.126.188.66',
user: 'root',
roles: %w{web app db},
ssh_options: {
 auth_methods: %w(password),
 password: '*****'
}
