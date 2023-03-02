CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
if [[ -f student-submission/ListExamples.java ]]
then 
    echo 'List Examples found'
else 
    echo 'List Examples not found'
fi
cp student-submission/ListExamples.java ./
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > exampleOutput.txt 
testFails=`grep "Tests run:" exampleOutput.txt`
totalTests=${testFails:11:1};
failures=${testFails:25:1};
if [[ $failures -eq 0 ]]
then
echo 'tests passed'
else
echo 'failed tests/total tests:' $failures/$totalTests
fi
