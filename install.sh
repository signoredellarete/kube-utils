#!/bin/bash
download=${download_wget}
download_wget='wget'
download_curl='curl -L -O'

echo_off() {
  exec 3>&1-
  exec 4>&2-
}

echo_on() {
  exec 1>&3-
  exec 2>&4-
}

check_bin() {
  echo_off
  ${1}
  result=$?
  echo_on
  if [ ${result} -ne 127 ];then
    true
  else
    false
  fi
}

if check_bin "git"; then
  git pull
else
  echo "Warning:"
  echo "Please install git if you want to update local repo autmatically."
  echo " "
fi

if check_bin "wget"; then
  download=${download_wget}
elif check_bin "curl"; then
  download=${download_curl}
else
  echo "Error: No download command found!"
  echo "Please install wget or curl."
  exit 1
fi

# Download kubectl-neat
mkdir bin/tmp
cd bin/tmp
echo "Downloading latest release of kubectl-neat from github..."

${download} https://github.com/itaysk/kubectl-neat/releases/latest/download/kubectl-neat_linux_amd64.tar.gz > /dev/null 2>&1
tar xzf kubectl-neat_linux_amd64.tar.gz
mv kubectl-neat ..
cd ..
rm -rf tmp

# Installation
echo "Installing binaries..."
echo " "
for i in `ls -1`
do
  if sudo cp ${i} /usr/local/bin/${i}; then
    sudo chmod +x /usr/local/bin/${i}
    echo "/usr/local/bin/${i}"
  fi
done

echo " "
echo "Installation done!"
