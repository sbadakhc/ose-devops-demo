#!/bin/bash
#
# Simple script to increment version in demo

# Uncomment to enable debugging
#set -x 

DATE=$(date)
POM="pom.xml"
SETTINGS="./settings.xml"

# Update the version of the file
UPDATE=$(echo "<h3>Version Update ${DATE}</h3>")
sed -e "/\<h1>/a \ ${UPDATE}" src/main/webapp/index.jsp > update.jsp
cat update.jsp > src/main/webapp/index.jsp
rm update.jsp

# Commit the chnmage to our local git repo
git commit -a -m "Version Update ${DATE}"


# Prompt for release
echo
while true; do
    read -p ">> Do you want release this version? [Y/n]" OPTS
        case $OPTS in
            [Yy]* ) echo -e "\n>> Performing release" && mvn -s ${SETTINGS} release:clean release:prepare release:perform; exit ;;
            [Nn]* ) echo -e "\n>> Pushing changes upstream" && git push origin master ; exit ;;
            * ) echo ">> Invalid Option";;
        esac
done
exit
