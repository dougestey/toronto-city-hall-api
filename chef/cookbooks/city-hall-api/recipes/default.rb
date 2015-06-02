install_path = "/opt/nodejs/city-hall-api"

node_app_path = Pathname.new(install_path).dirname.to_s
directory node_app_path do
  owner "root"
  group "root"
  mode "0777"
end

git "city-hall-api" do
  repository "https://github.com/designcofounders/toronto-city-hall-api.git"
  revision "master"
  destination install_path
  action :sync
  user "vagrant"
end

execute "git checkout HEAD --force" do
  cwd install_path
  user "vagrant"
end

include_recipe 'database::postgresql'

db_cnnx_info = {
  host: '127.0.0.1',
  username: 'postgres',
  password: node['postgresql']['password']['postgres'],
}

postgresql_database_user "toronto_api_user" do
  connection db_cnnx_info
  password "sekret"
end

databases = ["toronto"]

databases.each do |db_name|
  postgresql_database db_name do
    connection db_cnnx_info
    action :create
  end

  bash "import-database-#{db_name}" do
    user "postgres"
    code "psql #{db_name} < #{install_path}/db/init/#{db_name}_*.sql"
  end
end

package "postgresql-9.3-postgis-2.1"

postgresql_database "create-db-and-enable-postgis-extension" do
  connection db_cnnx_info
  database_name "pupa"
  sql "CREATE EXTENSION postgis"
  action [:create, :query]
end


execute "npm install" do
  user "root"
  cwd install_path
end
