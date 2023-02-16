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
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > exampleOuput.txt 
 grep "(TestListExamples)" exampleOuput.txt  > testFails.txt

count=`wc -l < testFails.txt`
if [[ $count -eq 0 ]]
then 
echo 'tests passed'
else  
echo 'some tests failed'
fi
