set :stage, :development
role :app, %w{admin@153.126.188.66}
role :web, %w{admin@153.126.188.66}
role :db, %w{admin@153.126.188.66}

server '153.126.188.66',
user: 'admin',
roles: %w{web app db},
ssh_options: {
  # ローカル環境のユーザーの秘密鍵ファイルを設定する
  keys: %w(/Users/kataokadaichi/Dropbox/key/個人鍵/id_rsa),
  forward_agent: true,
 #auth_methods: %w(password),
 #password: 'daithi0808'
}
