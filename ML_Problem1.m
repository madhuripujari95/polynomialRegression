load ('problem1.mat' )

 % Performing cross validation on the dataset to find minimum error 
 
Var_Length = length(x);

P = 0.90 ;                             				%Percentage to divide the train and test data upon
 
training_x = x(1:P*Var_Length);        			%Sequential division of train data for x
training_y = y(1:P*Var_Length);         			%Sequential division of train data for y
 
testing_x = x((P*Var_Length)+1:end);    			%Sequential division of test data for x
testing_y = y((P*Var_Length)+1:end);    			%Sequential division of test data for y
    
%Empty array for the empirical risk error values to be stored based on every d in training and testing dataset
training_errors = [];
testing_errors = []; 
 
 
for d=1:60                            		  	%Iterate for d = 1 to 50 to find the Remp of all points at respective d 
    [err, model, errT] = polyreg(training_x, training_y, d, testing_x, testing_y); 
    training_errors(d) = err;    	  			% Store the train errors into an array against d as index
    testing_errors(d) = errT;     	  			% Store the test errors into an array against d as index
end
 
clf; 
 
hold on ;
 
plot(testing_errors, 'g')                    			%Plot the Remp for test dataset wtr to d value
plot(training_errors, 'b')                  			%Plot the Remp for train dataset wtr to d value

%This calculates the minimum value of Remp from the test dataset
[min_val, minimum] = min(testing_errors);     	

%Plot point where you find the least error in Remp of test dataset 
plot(minimum , testing_errors(minimum), 'rx');

%This line indicate the exact place where we found minimum error in test dataset
xline(minimum, '--r');                             		

xlabel('Degree of Polynomial');                 			% X Axis label
ylabel( 'Error ');                                   			% Y Axis label
legend('Test Error', 'Train Error');                           		% Legend to identify the lines belong to which dataset
title("Cross Validation Error vs Degree of Polynomial")      	%Title of the graph
