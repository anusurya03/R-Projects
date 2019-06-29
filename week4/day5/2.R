trainFileName = "adult.data"; testFileName = "adult.test"

if (!file.exists (trainFileName))
  download.file (url = "http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data", 
                 destfile = trainFileName)

if (!file.exists (testFileName))
  download.file (url = "http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.test", 
                 destfile = testFileName)

colNames = c ("age", "workclass", "fnlwgt", "education", 
              "educationnum", "maritalstatus", "occupation",
              "relationship", "race", "sex", "capitalgain",
              "capitalloss", "hoursperweek", "nativecountry",
              "incomelevel")

train = read.table (trainFileName, header = FALSE, sep = ",",
                    strip.white = TRUE, col.names = colNames,
                    na.strings = "?")#, stringsAsFactors = TRUE)

View(train)
str (train)

table (complete.cases (train))

summary  (train [!complete.cases(train),])

# Distribution of the income level factor in the entire training data set.
table (train$incomelevel)

myCleanTrain = train [!is.na (train$workclass) & !is.na (train$occupation), ]
myCleanTrain
myCleanTrain = myCleanTrain [!is.na (myCleanTrain$nativecountry), ]

myCleanTrain$fnlwgt = NULL

summary (myCleanTrain$age)

boxplot (age ~ incomelevel, data = myCleanTrain, 
         main = "Age distribution for different income levels",
         xlab = "Income Levels", ylab = "Age", col = "maroon2")


incomeBelow50K = (myCleanTrain$incomelevel == "<=50K")
xlimit = c (min (myCleanTrain$age), max (myCleanTrain$age))
ylimit = c (0, 1600)

hist1 = qplot (age, data = myCleanTrain[incomeBelow50K,], margins = TRUE, 
               binwidth = 2, xlim = xlimit, ylim = ylimit, colour = incomelevel)

hist1
hist2 = qplot (age, data = myCleanTrain[!incomeBelow50K,], margins = TRUE, 
               binwidth = 2, xlim = xlimit, ylim = ylimit, colour = incomelevel)
hist2

grid.arrange (hist1, hist2, nrow = 2)

summary (myCleanTrain$educationnum)

boxplot (educationnum ~ incomelevel, data = myCleanTrain, 
         main = "Years of Education distribution for different income levels",
         xlab = "Income Levels", ylab = "Years of Education", col = "blue")


nearZeroVar (myCleanTrain[, c("capitalgain", "capitalloss")], saveMetrics = TRUE)

summary (myCleanTrain[ myCleanTrain$incomelevel == "<=50K", 
                       c("capitalgain", "capitalloss")])
summary (myCleanTrain[ myCleanTrain$incomelevel == ">50K", 
                       c("capitalgain", "capitalloss")])

boxplot (hoursperweek ~ incomelevel, data = myCleanTrain, 
         main = "Hours Per Week distribution for different income levels",
         xlab = "Income Levels", ylab = "Hours Per Week", col = "salmon")

qplot (incomelevel, data = myCleanTrain, fill = workclass) + facet_grid (. ~ workclass)

