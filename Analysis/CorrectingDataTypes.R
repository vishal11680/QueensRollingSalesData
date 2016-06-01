###################################################################
# This R script is used to correct the data type of following columns
#  1) SALE.DATE
#  2) SALE.PRICE
##################################################################
#  Created by :Vishal Ahir
#  Date : 5/31/2016
###################################################################

## @knitr CorrectingDataTypes

# Setting current working directory to data directory.
setwd("../Data")

# Reading csv file into a Data Frame. 
# Here stringsAsFactors = False parameter will ensure those fields that are strings are stored 
# as character instead of factor.
raw_df <- read.csv("RawSalesDataQueens.csv", header=T, quote="\"", fill=TRUE, stringsAsFactors = FALSE)

# File loaded to raw_df Data Frame.
# Rowcount :
#nrow(raw_df)

# Columns :
#ncol(raw_df)

#class(raw_df$SALE.PRICE)
#class(raw_df$SALE.DATE)

# Below line is converting SALE.DATE column to date format.
# Since the input data contains date in MM/DD/YYYY format, format parameter is used to indicate the same.
raw_df$SALE.DATE = as.Date(raw_df$SALE.DATE, format="%m/%d/%Y")

########
# Below commands are used to remove "$" sign from SALE.PRICE field and 
# also for those rows that contain "$-" , remove "-" with "0"
raw_df$SALE.PRICE <- chartr("$"," ",raw_df$SALE.PRICE)
raw_df$SALE.PRICE <- chartr("-","0",raw_df$SALE.PRICE)

# gsub function is used to substitute comma (,) with nothing
raw_df$SALE.PRICE <- gsub(",","", raw_df$SALE.PRICE)
# gsub function is used to substitute space " " with nothing
raw_df$SALE.PRICE <- gsub(" ","", raw_df$SALE.PRICE)

# Converting data type of the field from character to integer.
raw_df$SALE.PRICE <- as.integer(raw_df$SALE.PRICE)



# Checking class of all fields using sapply to all fields in DF.
#sapply(raw_df, class)
class(raw_df$SALE.PRICE)
class(raw_df$SALE.DATE)

# Counting total rows in DF.
#nrow(raw_df)


#Get current directory before writing file
#getwd()


#Writing data-frame to final file that will be used for handling missing values and outliers
write.csv(raw_df, file="CorrectedDateandPrice.csv", row.names=F, na="")

