#This is RLadies_R_for_Beginners_Intro.R 

# In this section you will:
# 2.1 Learn basic commands an functions in R
# 2.2 Learn to assign values to variables
# 2.3 Discover types of data

getwd() #Tells you where you are on your computer

setwd("~/RLadies/") #Tells your computer where you want to be

#Let's do some math
4+4
10*2
1000000^2/50

#Let's assign a value to a variables
myVar1=10
myVar2=15
myVar3=2
myVar4=c(10,15,2)

#Print your new variable
myVar1
myVar2
myVar3
myVar4

#Do some math with myVar
myVar1 + myVar2
myVar1 / myVar2 + myVar3
myVar4*myVar2

#Let's assign a new value to myVar (yes! you can replace variables so be CAREFULL)
myVar1="Panda"

#Print the updated myVar
myVar1
myVar2
myVar3

#Lets combine the two variables into a vector
c(myVar1, myVar2, myVar3)

#Let's save the combined varibales into a vector variable
newVar=c(myVar1, myVar2, myVar3)

#Print the new variable
newVar

#What type of data structure is newVar?
is.vector(newVar)
is.matrix(newVar)
is.data.frame(newVar)

#R has 100s of builtin functions you can find out information about how to use them by using 
#the help() function
help(plot)
help(boxplot)
help(barplot)


# If you ever do want to add new packages to R you can do two simple steps
# 1. Call function install.packages("package_to_install")
# 2. Store the installed package in your R library by calling the function library(package_to_install)
# However, today this is beyond the scope of the workshop
