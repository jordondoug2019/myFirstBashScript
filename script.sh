#./bin/bash

echo "Welcome 🧐"
firstline=$(head -n 1 source/changelog.md)
echo  $firstline
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are using version" $version "🔥"
echo "🗣 Enter 1 to continue, Enter 0  to exit"
read versioncontinue 
echo $versioncontinue

if [ $versioncontinue -eq 1 ]
then 
    echo "Ok"
    for file in source/*
    do
      echo $file
      if [ $file == "source/secretinfo.md" ]
      then 
          echo "Not copying" $file "❌"
       else
           echo "Copying" $file " ✅"
           cp $file build/.
        fi
      done
 else
     echo "Please come back when you are ready ✌🏾"
fi

cd build 
echo "Build version $version contains:"
ls
cd ../
