#! /bin/bash
echo "1212"
cd ../BCRopt
time1=$(octave run12.m)
echo "BCRopt $time1" 
echo "Verein"
cd ../BcrVereinfacht
time2=$(octave run12.m)
echo "vereinf $time2"
echo "1313"
cd ../BCRopt
time1=$(octave run13.m)
echo "BCRopt $time1" 
echo "Verein"
cd ../BcrVereinfacht
time2=$(octave run13.m)
echo "vereinf $time2"
echo "1414"
cd ../BCRopt
time1=$(octave run14.m)
echo "BCRopt $time1" 
echo "Verein"
cd ../BcrVereinfacht
time2=$(octave run14.m)
echo "vereinf $time2"
cd ../
#kill %1
