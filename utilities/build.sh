echo Build a demo zip archive

cd ..
rm ./dojo/builds/dojo-multitier.zip
zip -r ./dojo/builds/dojo-multitier.zip ./dojo/README.adoc ./dojo/resources ./dojo/dojo

