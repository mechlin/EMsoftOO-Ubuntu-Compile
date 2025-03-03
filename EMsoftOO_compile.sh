#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install build-essential git gcc gfortran cmake ocl-icd-opencl-dev libblas-dev liblapack-dev -y

cd /opt/pollock

#EMsoft Superbuild
git clone https://github.com/EMsoft-org/EMsoftSuperbuild.git -b developOO EMsoftSuperbuildOO
cd EMsoftSuperbuildOO
# mkdir Debug
# cd Debug
# cmake -DEMsoftOO_SDK=/opt/pollock/EMsoftSuperbuildOO -DCMAKE_BUILD_TYPE=Debug ../
# make -j
# cd ../
mkdir Release
cd Release
cmake -DEMsoftOO_SDK=/opt/pollock/EMsoftSuperbuildOO/ -DCMAKE_BUILD_TYPE=Release ../
make -j

cd /opt/pollock 
 
#EMsoftOO Build
git clone https://github.com/EMsoft-org/EMsoftOO.git -b develop EMsoftOO
mkdir EMsoftOOBuild
cd EMsoftOOBuild
mkdir Release
cd Release
cmake -DCMAKE_BUILD_TYPE=Release -DEMsoftOO_SDK=/opt/pollock/EMsoftSuperbuildOO/ ../../EMsoftOO
make
#cd ../
#mkdir Debug
#cd Debug
#cmake -DCMAKE_BUILD_TYPE=Debug -DEMsoftOO_SDK=/opt/pollock/EMsoftSuperbuildOO/ ../../EMsoftOO
#make -j
 
