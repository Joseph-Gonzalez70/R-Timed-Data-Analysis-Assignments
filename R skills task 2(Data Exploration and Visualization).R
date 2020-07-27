#Vectors
#Question a
#Write a code that creates a vector x that contains 100 random observations from the standard normal distribution 
#This is the normal distribution with the mean equal to 0 and the variance equal to 1).
set.seed(100)
x=rnorm(100,0,1)

#Question b
#Write a code that replaces the observations in the vector x that are greater than or equal to 0 with a string of characters "non-negative" and 
#the observations that are smaller than 0 with a string of characters "negative".
x[x>=0]="non-negative"
x[x<0]="negative"

#Question c
#Write a code that calculates how many observations in the vector x are non-negative and how many observations are negative.
((numnonnegative=length(which(x=="non-negative"))))
((numnegative=length(which(x=="negative"))))

#Matrices

#question a
#Write a code that creates a matrix A that has 100 rows and 100 columns and whose entries are randomly selected positive integers from 1 to 100.
A=matrix(sample(1:100,100*100, replace = TRUE),100,100)

#question b
#Write a code that calculates the sum of the numbers on the diagonal of the matrix A.

sum(diag(A))

#question c
#Write a code that finds the largest element of each of the rows of the matrix A.

apply(A,1,max)

#Data exploration and visualization
#You are asked to investigate the mammals sleep data set msleep from the package ggplot2. 
#To access the data set, load the package ggplot2 and simply type msleep in the console.

#part a
#Some values of the variable vore are missing. 
#Write a code that creates a new data frame or a tibble by removing the rows of the original tibble where the value of vore is missing and
#use the new data frame or tibble without the missing values of vore in the subsequent analysis
msleepnew=filter(msleep, !is.na(vore))

#part b
#Write a code that determines which 5 animals sleep the shortest. Write a short answer as a comment in the code naming the 5 animals that sleep the shortest.
arrange(msleepnew, sleep_total)
#The 5 animals that sleep the shortest are Giraffe, Pilot whale, Horse, Roe deer and Donkey.

#part c
#Write a code that calculates how much time on average mammals in each of the 4 different classes of vore spend sleeping. 
#Write a short answer as a comment in the code that includes the average time different classes of mammals sleep.
msleepnew%>%
  group_by(vore)%>%
  summarise(mean(sleep_total))
#Carnivores sleep an average of 10.4 hours, herbivores sleep 9.51 hours 
#Insecti sleep an average of 14.9 hours, omnivores sleep an average of 10.9 hours

#Part d
#Write a code that creates a scatter plot between the body weight of a mammal (bodywt) and the amount of time spent awake (awake).
plot(msleepnew$bodywt,msleepnew$awake)
ggplot(msleepnew, mapping=aes(x=bodywt, y=awake)) + geom_point()

#part e
#Use the code of Part d. and modify it so that the points in the scatter plot are coloured according to the value of the variable vore.
ggplot(msleepnew, mapping=aes(x=bodywt, y=awake,colour=vore)) + geom_point()

#part f
#Use the code of Part d. and modify it so that the scatter plot only contains the data about mammals that are herbivores (herbi) and weigh 10 kilograms or less.
ggplot(msleepnew, mapping=aes(x=bodywt, y=awake,colour=vore)) + geom_point(data=filter(msleepnew,vore=="herbi", bodywt<=10))










