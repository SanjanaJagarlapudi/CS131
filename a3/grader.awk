#Begin block
BEGIN{
	#Since all the fields in the file seem to be separeted by commas, change the field sep 
	FS=","
	#variables to store the highest and lowest total scores
	lowest_score;
	highest_score;
	lowest_student;
	highest_student;
}

#Action block (the action thats executed on every line)
{
	#Calculating the total sums of the students' scores
	if(NR != 1) {#Since we don't care about the header line
		student_sums[NR] = $3 + $4 + $5

		if(NR == 2){ #Set the initial values of the highest and lowest scores
			lowest_score = student_sums[NR]
			highest_score = student_sums[NR]
		}
		#Set the highest and lowest score variables
        	if(student_sums[NR] < lowest_score){
                	lowest_score = student_sums[NR]
			lowest_student = $2
        	}
        	else if (student_sums[NR] > highest_score) {
               		highest_score = student_sums[NR]
			highest_student = $2
        	}

		#Store current Student's name in array
		student_names[NR] = $2
	}
}

#finds the average grade of each student and classifies them as Pass or Fail
#This function takes in the current line (aka student) being processed and sets values 
#in certain associated arrays accordingly 
function find_average(current_line){
	averages[current_line] = student_sums[current_line] / 3
        if (averages[current_line] >= 70){ #If the average is greater than 70, student passes
		statuses[current_line] = "Pass"
       	}	
       	else{ #If not, the student fails
               	statuses[current_line] = "Fail"
       	}
}

#End Block (takes place after all lines have been processed)
END{
	#Printing out all student info
	for(i=2; i <= NR; i++){
		print("Student Name: ", student_names[i])
		print("Total Score: ", student_sums[i])
                find_average(i)
                print("Average Score: ", averages[i])
                print("Status: ", statuses[i])
                print("~")	
	}
	
	#Printing the highest and Lowest Scores
	print("The student with the top score is", highest_student, "with score", highest_score)
        print("The student with the lowest Score is", lowest_student, "with score", lowest_score)
}

