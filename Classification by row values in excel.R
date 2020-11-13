
# Add a clasification from a variable in a xls file
    # Classification according to population

# Set Work Directory
getwd() # Ask for the current directory
setwd("C:/RStudio/PRUEBAS/13NOV20") # Set the new one

# Load excel file

installed.packages(readxl) # Donwload and install the excel reader package
library(readxl) # Load the excel reader package


choose.files() # shows the selected file directory 
Data <- read_excel("C:\\RStudio\\PRUEBAS\\13NOV20\\Chile's regions population.xlsx")
  # Set Data as a new variable from the excel file 

head(Data) #Shows the frist rows and columns of the table
  # In "Censo_2017" column we can see the population from each region 

# Create the assignment of numerical values and labels for each category

Values <- c(0, 300000, 700000, 1000000, Inf) # Define the limits of each category
Categories <- c("lowest", "low", "medium",  "high") # Define the name of each category
                # 4 categories

# Add the new row with the new clasification to Data

Data$Population_Class <- cut(Data$CENSO_2017, breaks = Values, labels = Categories)
  # Create "Population_Class" row in Data
    # Cut the "CENSO2017" row from Data 
      # breaks it into the values from Values
      # and categorizes it from the Categories values

# If we want R determines the numerical values of each category, now with 6 categories:

# Now labels will be letters :)
Categories1 <- c("A", "B", "C", "D", "E")

Data$Population_Class_R <- cut(Data$CENSO_2017, breaks = 5, labels = Categories1)
  # Again, i take the "CENSO_2017" values and breaks it into 5 diferent values, 
      # that will be categorized by Categories1 values (A,B,C,D or E)
# We can see how centralist Chile is


# Export Data as a csv file
write.csv(Data, "Updated.csv")

