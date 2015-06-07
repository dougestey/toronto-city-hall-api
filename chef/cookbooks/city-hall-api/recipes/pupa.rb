include_recipe "python"

install_path = "/home/vagrant/pupa"

git install_path do
  repository "git://github.com/opencivicdata/scrapers-ca.git"
  action :sync
end

# Required for lxml pip package
package "libxml2-dev"
package "libxslt-dev"

execute "install-scraper-deps" do
  cwd install_path
  command "pip install -r requirements.txt"
end
