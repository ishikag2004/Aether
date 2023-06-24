# Tests for EUVAC & HFG models (Solomon)
#!/bin/sh

rm -rf ./runtest_solomon
cp -R ../../share/run ./runtest_solomon

cd ./runtest_solomon

# create & copy aether files 
cp ../aether.json.solomon_test ./aether.json

./aether

#post-processing
cd UA/output
python3 ../../../../../srcPython/postAether.py -rm



rm -rf Aether Aether.test_from_scrath
git clone https://github.com/AetherModel/Aether
mv Aether Aether.test_from_scrath
cd Aether.test_from_scrath

# 1. Change the line below to set the BRANCH to test:
git checkout euv

# 2. Change the line before to set the OS to test:
cd src ; rm -f Makefile.OS ; cp Makefile.ubuntu Makefile.OS ; cd ..

make
make rundir ; mv run run.test_from_scratch
cd run.test_from_scratch
./aether.exe

../python/plot_model_results.py -var=Temperature -alt=30 3DALL_20110320_010000.nc
../python/plot_model_results.py -var=O -alt=30 3DALL_20110320_010000.nc

