#
# Cookbook:: filepracticebk
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package_name = node["webserver_vi"]["installed"]
package_java = node["java"]["installation"]
set_username = node["username"]["set"]
set_password = node["password"]["set"]
set_roles = node["roles_path"]["set"]
path_template = node["templatefile"]["path"]
file_pathre = node["filepath"]["hear"]
set_remotepath = node["remotefile"]["path"]

apt_update 'all platforms' do
  frequency 86400
  action :periodic
end

package package_name do
         action :install
end
remote_file set_remotepath do
        source 'http://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/10g/r3/appdeploy/deploy/deploy_apps/files/version2/benefits.zip'
        owner 'root'
        group 'root'
        mode '0755'
        action :create
end
#file file_pathre  do
#  content 'JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC'
#  mode '0755'
#  owner 'root'
#  group 'root'
#end
template path_template do
    source "tomcat-users.xml.erb"
    mode "0644"
    variables(
      :username => set_username,
      :password => set_password,
      :roles => set_roles,
    )
end
service package_name do
  action :start
end
package node['installation']['additionalpackages'] do
  action :install
  notifies :restart, "service[#{package_name}]"
end
log 'installed additionalpackages'
