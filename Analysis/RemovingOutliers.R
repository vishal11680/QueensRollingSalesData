###################################################################
# This R script is used to correct the data type of following columns
#  1) SALE.DATE
#  2) SALE.PRICE
##################################################################
#  Created by :Vishal Ahir
#  Date : 5/31/2016
###################################################################

## @knitr RemovingOutliers

# Setting current working directory to data directory.
setwd("../Data")

# Reading csv file into a Data Frame. 
# Here stringsAsFactors = False parameter will ensure those fields that are strings are stored 
# as character instead of factor.
raw_df <- read.csv("CorrectedDateandPrice.csv", header=T, quote="\"", fill=TRUE, stringsAsFactors = FALSE)

# File loaded to raw_df Data Frame.
# Rowcount :
#nrow(raw_df)

# Columns :
#ncol(raw_df)

# Filter all the rows in data frame where SalePrice is > 2,000,000 and/or 0.
raw_df <- raw_df[raw_df$SALE.PRICE <= 2000000 & raw_df$SALE.PRICE > 0, ]

#Filter only rows where square footage was <= 1000 sq ft and > 0.
raw_df <- raw_df[raw_df$GROSS.SQUARE.FEET <= 1000 & raw_df$GROSS.SQUARE.FEET > 0, ]

#Check remaining number of rows
#nrow(raw_df)

# Get the current wd
getwd()

#Write the Data Frame to file
write.csv(raw_df, file="FinalQueensData.csv", row.names=F, na="")

