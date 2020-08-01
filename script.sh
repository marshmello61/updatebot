# Copyright (C) 2020 github.com/marshmello61
#
#

repo="UserBot"
rm -rf ${repo}

echo "You're running the UserBot Updater script by @marshmello61"
echo " "

# Get username of user
if [[ "${userName}" == "" ]]; then
    echo -n "Enter your GitHub username: "
    read userName
    echo " "
else
    echo "Github Username exists."
    sleep 1
fi

# Check if user has forked or has the same repo name
echo "Have you forked UserBot from marshmello61"
echo -n "or has the same repo name i.e. UserBot? [y/n]: "
read fork
echo " "
sleep 1

if [[ "${fork}" == 'y' ]]; then
	git clone https://github.com/${userName}/${repo}.git
	cd ${repo}
elif [[ "${fork}" == 'n' ]]; then
	echo -n "Enter your repo name: "
	read repo
	git clone https://github.com/${userName}/${repo}.git
	cd ${repo}
else
        echo " "
        echo "You were only supposed to enter y or n"
        sleep 2
        exit 1
fi

echo " "
echo "Updating your UserBot"
sleep 1
git pull https://github.com/marshmello61/UserBot.git
git push
echo " "
echo "Updated"
cd ..
rm -rf ${repo}
