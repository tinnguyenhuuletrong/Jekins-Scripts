#-----------------------------------------------------
# [Manual]
#	Setting
#		Replace gameloft by admin
#-----------------------------------------------------

# create an applications group
dseditgroup -o create -n . -u gameloft -p -r ‘Applications’ applications
# get the id for that group
sudo dscl . -read /Groups/applications
# find a unique identifier to give the user
sudo dscl . -list /Users UniqueID
# create the jenkins user
sudo dscl . -create /Users/jenkins
sudo dscl . -create /Users/jenkins PrimaryGroupID 505
sudo dscl . -create /Users/jenkins UniqueID 1026
sudo dscl . -create /Users/jenkins UserShell /bin/bash
sudo dscl . -create /Users/jenkins RealName "Jenkins"
sudo dscl . -create /Users/jenkins NFSHomeDirectory /Users/jenkins
sudo dscl . -passwd /Users/jenkins
# create and set the owner of the home directory
sudo mkdir /Users/jenkins
sudo chown -R jenkins /Users/jenkins