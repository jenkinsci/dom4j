# run it like ". ./deploy.sh"

ant clean all
v=1.6.1-hudson-1

sed -e "s/@VERSION@/$v/g" < pom.xml > build/pom.xml

#cmd=install:install-file
cmd=deploy:deploy-file
mvn $cmd -Dfile=build/dom4j.jar -DrepositoryId=java.net2 -Durl=file:$(cygpath -wa ~m2repo) -DpomFile=build/pom.xml
mvn $cmd -Dfile=build/dom4j-sources.jar -DrepositoryId=java.net2 -Durl=file:$(cygpath -wa ~m2repo) -DpomFile=build/pom.xml -Dclassifier=sources

