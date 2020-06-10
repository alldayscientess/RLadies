#This is RLadies_R_for_Beginners_Barplots.R 

setwd("~/RLadies/")

#This R Code will walk you through how to read in a csv file, make and save a barplot with legends as well as
#changing the orientation and labels of data tables

# 4.1 Learn useful R functions
# 4.2 Create barplots() with legends in RStudio
# 4.3 Learn how to export a plot in RStudio to a pdf or png
# 4.4 Create first R Script

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   4.1 Learn useful R functions
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# The first thing we will do is read in the dataset we made using 
data_short=read.csv("STEM_Careers_FM_Short.csv", row.names = 1, header = TRUE)

#What's the data again?
data_short

#The barplot() fucntion requires the orientation of the data to be transposed we can use this super fun
#function called t()

t(data_short)
data_short_t=t(data_short)
data_short_t

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   4.2 Create barplots() in RStudio
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#Let's try to make a barplot of the data
barplot(data_short_t)

#Eeek, this looks ok, but I think I want the Female and Male datasets side by side. I'll need to include 
#the beside=TRUE argument.

par(mar = c(5,5,2,2))
barplot(data_short_t, 
        beside=TRUE, # puts bars side-by-side
        las=1, # orients the direction of the x/y lables 
        cex.axis=1, # changes the font size of the y-axis
        cex.names = 1, # changes the font size of the x-axis
        xlab="STEM Career", # where you can include the x-axis label
        ylab="Number of jobs (1x10^5)", # where you can include the y-axis label
        col=c("black", "grey"), # where you can include the colors of your bars
        ylim=c(0,25), # where you can change the from and to of your y-axis
        main="Number of STEM Jobs held by Females/Males in 2017") # where you can include the title of your plot

#Eeeeek the names of the Careers are all messed up. I should just try to shorten them instead.

#To do that we will make a vector of the new names and then relabel the rows of my data
new_names=c("Bio", "CS", "Math", "PS", "Psych", "Social", "ENG")
new_names

#To relable the colnames of the data you can use the rownames() function again
colnames(data_short_t)
colnames(data_short_t)<-new_names
colnames(data_short_t)

#Let's try the barplot again
barplot(data_short_t, 
        beside=TRUE, # puts bars side-by-side
        las=1, # orients the direction of the x/y lables 
        cex.axis=, # changes the font size of the y-axis
        cex.names = 1, # changes the font size of the x-axi
        xlab="STEM Career", # where you can include the x-axis label
        ylab="Number of jobs (1x10^5)", # where you can include the y-axis label
        col=c("#9970ab", "#5aae61"), # where you can include the colors of your bars
        ylim=c(0,25), # where you can change the from and to of your y-axis
        main="Number of STEM Jobs held by Females/Males in 2017") # where you can include the title of your plot


#But how do I know which color is Female or Male? I can add a legend by using the legend() function
legend("topleft", legend=c("Female", "Male"), fill=c("#9970ab", "#5aae61"), cex=0.8)

#And how do I make sure the audience knows what the acronyms stand for? Make another legend!
#First, you'll need to make a vector or the STEM Career names
names2=c("Bio = Biological or Life Sciences", "CS = Computer and Information Science", 
         "Math = Mathematical Scientist", "PS = Physical Scientist", "Psych = Psychologist", 
         "Social = Social Scientsist", "ENG = Engineering Occupations")

legend("topright", legend = names2, col=c(1), cex = 0.8)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   4.3 Learn how to export a plot in RStudio to a pdf or png
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#To export a plot to your desktop you need to first use the functions pdf() or png()

pdf("STEM_Careers_Short.pdf")
barplot(data_short_t, beside=TRUE, las=1, 
        cex.axis=1, cex.names = 1, xlab="STEM Career",
        col=c("#9970ab", "#5aae61"), 
        ylab="Number of jobs (1x10^5)", ylim=c(0,25), 
        main="Number of STEM Jobs held by Females/Males in 2017")
legend("topleft", legend=c("Female", "Male"), fill=c("#9970ab", "#5aae61"), cex=0.8)
legend("topright", legend=names2, col=c(1), cex = 0.8)
dev.off() #And you need to end the plot making with te function dev.off()

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   4.4 Create first R Script
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#First, open a new R Script and copy and past everything in this section. Save the Script to your Desktop

#Next, include a setwd() to where you want your Script to live
setwd("")

#Then, read in the CS_Data_Demographics.csv table to R and create Barplot using what we learned above.
# This dataset shows the number Females and Males who have careers in Computer Science and is stratified 
#by ethnicity and race

CS_dem=read.csv("CS_Demographics.csv", row.names = 1, header = TRUE)

#Starting with the base requirements for the barplot() function, make the plot look pretty!
barplot(t(CS_dem), beside=TRUE)

# Checklist
# A. Scale the numbers to fit in the y-axis of the plot -- save to new variable
# B. Change the rownames to fit on the x-axis of the plot
# C. Label the axis 
# D. Give plot a name
# E. Change the colors of the plot for fun
# F. Export barplot as a pdf file to your desktop

