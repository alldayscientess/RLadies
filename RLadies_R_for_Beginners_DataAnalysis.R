#This is RLadies_R_for_Beginners_DataAnalysis.R 

setwd("~/RLadies/")

# In this section you will:
# 3.1 Learn to read in csv files to RStudio environment and assign to variable
# 3.2 Analyze data in RStudio
# 3.3 Calculate statistics on data in RStudio
# 3.4 Write files from RStudio to Desktop

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.1 Learn to read in csv files to RStudio environment and assign to variable
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# The first thing we will do is read in the dataset using 
read.csv("STEM_Careers_FM.csv", row.names = 1, header = TRUE)

#But while it's good we can read in the data, we need to store it do do actual things with the data
#We store data in variables
data=read.csv("STEM_Careers_FM.csv", row.names = 1, header = TRUE)

#Now lets call the variable and see what it shows us
data

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.2 Analyze data in RStudio
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#If we want to know how many rows and columns are in our dataset we can use a function called dim() 
dim(data)

#Sometimes it's important to know what the rownames or column names of the dataset you are looking at are. There's a handy
#function called rownames() or colnames() that can tell you!
rownames(data)

colnames(data)

#Let's inspect what type of data this is and what is in each column
is.data.frame(data)
data$Female #The dollar sign tells us what column we are intersted in
data$Male 

# Now we might be interseted in looking at sorted data
data[order(data$Female),] #This data is sorted in increasing order on the Female column
data[order(data$Male),] ##This data is sorted in increasing order on the Male column

data[order(-data$Female),] #This data is sorted in decreasing order on the Female column
data[order(-data$Male),] #This data is sorted in decreasing order on the Male column

data_sorted=data[order(-data$Female, -data$Male),] #This data is sorted in decreasing order by Females then by males

#Maybe we want to see how the data we are looking at is distrubuted, to do that we can use another function
#called summary()
summary(data)

#

#Now the stats are all well and good, but sometimes it's nice to actually SEE what the data is. To look at
#in the simplest way, you can use the function boxplot()
boxplot(data)

#The y-label is overlapping the y-axis values. The numbers are acutally really big, 
#we could clean them up
data
data/100000
data_short=data/100000
data_short

#So now when we plot the data we can see a cleaner visualization 
boxplot(data_short, las=1, 
        xlab="Sex", #label the x-axis
        ylab="Number of STEM Jobs (1x10^5)", #label the y-axis 
        main="Number of STEM Jobs Held by Females & Males in 2017") #write in a title


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.3 Calculate statistics on data in RStudio
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#As you can see there are more males in STEM careers than females. Is this statistically significant?
#To run a t-test on this data, we can use the function t.test()
#Because we are comparing the numer of females in the data to the number of males we need to include those
#fields when we can do this two different ways (either as a dataframe or a matrix)
t.test(data$Female, data$Male)

#We can store the output of the t-test into variables
data_tt=t.test(data$Female, data$Male)

#We can call up specific elements of the t-test by using the $ 
data_tt$p.value

#A fun little function for rounding numbers is to use the round() function
round(data_tt$p.value, digits=2)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.3 Calculate statistics on data in RStudio
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#Oh, I want to save this new dataset to my desktop as a csv file
write.csv(data_sorted, "STEM_Careers_FM_Sorted.csv")
write.csv(data_short, "STEM_Careers_FM_Short.csv")


