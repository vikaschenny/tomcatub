if node["platform"] == "ubuntu"
	default["webserver_vi"]["installed"] = "tomcat7"
	default["java"]["installation"] = "openjdk-7-jdk"
	default["username"]["set"] = "vikas"
	default["password"]["set"] = "vikas"
	default["roles_path"]["set"] = "vikas-gui"
	default["remotefile"]["path"] = "/var/lib/tomcat7/webapps/benefits.war"
	default["templatefile"]["path"] = "/etc/tomcat7/tomcat-users.xml"
	default["filepath"]["hear"] = "/etc/default/tomcat7"
	default['installation']['additionalpackages'] = ['tomcat7-docs', 'tomcat7-admin', 'tomcat7-examples']

elsif node["platform"] == "redhat"
	default["webserver_vi"]["installed"] = "tomcat"
end

