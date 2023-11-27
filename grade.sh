CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# The above code removes the previous testing repository/grade, if any, and then 
# makes a directory called "grading-area" and clones the given 
# repository and stores it in another directory called "student-submission"

# Then, add here code to compile and run, and do any post-processing of the
# tests


student_submission="student-submission/ListExamples.java"
grading_area="grading-area"
test_list_examples="TestListExamples.java"

#Step 1 -- check student code
if [[ -f $student_submission ]]
then 

    #copy over to grading-area
    cp "$student_submission" "$grading_area"
    cp "$test_list_examples" "$grading_area"

    #compile java files

    # should include different exit codes and the reasoning for user?
    javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java

    if [[ $? -eq 0 ]]
    then
        echo "No compilation issues. Exited with code "$?
    else
        echo "There was a compilation issue. Exited with code "$?
    fi

    #run test
    java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples

else 
    echo "ListExamples.java file does not exist."

fi


