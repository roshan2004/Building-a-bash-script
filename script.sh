#!/bin/bash
echo "*****Beginning build!!*****"

firstline=$(head -n 1 source/changelog.md)

read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}

echo "You are building version $version"

echo "Do you want to continue? (Enter "1" for Yes, "0" for No)"

read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "Ok"
  for filename in source/*
  do
    echo $filename
    if [ $filename == "source/secretinfo.md" ]
    then
      echo "Not copying $filename"
    else
      echo "Copying $filename"
      cp $filename build/
    fi
  done
else
  echo "Please come back when you are ready"
fi

cd build
echo "Build version $version contains:"
ls 
cd ../
