library(RMySQL)
library(ggplot2)
#---------Functions -----------
#given a question ID and type get the table containing
#ID | date | response 
getTable <- function(id, type){
  #if 1(text): 
  if(type == 1){
    cName <- "response_text"
  }
  else if(type == 2){
    cName <- "response_int"
  }
  else{ #type == 3 (bool)
    cName <- "response_bool"
  }
  
  #get the data at the id. 
  query = paste("SELECT question_id, time, ", cName, 
                "from response where question_id =", id, ";", collapse = "") 
  
  result <- dbGetQuery(mydb, query)
  result[,2] = as.Date(result[,2])
  return(result)
}

#given the table outputed by getTable and the question responce type
#select type of analysis to do and output graphs. 
totalPop <- function(t , type){
  print(t)
  #if int average result column for every month.
  #future implementations may want to select either month, year, etc.
  if(type == 2){
    t$month <- format(as.Date(t$time), "%m")
    t$year <- format(as.Date(t$time), "%Y")
    
    #subset of table for every year: 
    #get the mean for the data. 
    sYear <- aggregate(value ~ t$year, t, mean)
    colnames(sYear) <- c("year", "mean")
    sMonth <- aggregate(value ~t$month, t, mean)
    colnames(sMonth) <- c("month", "mean")
    
    
    #given average metric for months output line plot. 
    ####TODO weird bug with smoth plotting and linear regression. 
    p1 <- ggplot(sYear, aes(x = year, y = mean)) + geom_point() + 
      geom_smooth(method = "lm", se = FALSE)
    plot(p1)
    p2 <- ggplot(sMonth, aes(x = month, y = mean)) + geom_point() + geom_smooth() + 
      geom_smooth(method = "lm", se = FALSE)
    plot(p2)
  
  }
     
  
  
  #get frequency of responce type without the average for the year. 
  t$value <- factor(t$value, ordered = TRUE)
  p3 <- ggplot(t, aes(t$value)) + geom_histogram(stat = "count")
  plot(p3)
    
  
  #IF TIME: 
  #else int or bool: 
    #get frequency of responce
     
  #output histogram. 
}

#-----------------------------

# initialize the connection to the database
mydb = dbConnect(MySQL(), user='u425692621_root', 
                 password='YellowFinch', 
                 dbname = 'u425692621_table', 
                 host='sql167.main-hosting.eu',
                 port=3306)


#select all the SI from questions table. 
query = "SELECT distinct survey_id FROM questions;"
sIDs <- dbGetQuery(mydb, query)

#get list of questions and question types in that survey. 
id = 1 #example 
query = paste("SELECT question_id, type from questions where survey_id = ", as.character(id),";", collapse = "") 

result <- dbGetQuery(mydb, query)
print("result")
print(result)


#Analyze all people in database. 
id2 = 1
query = ("SELECT question_id, ")


#when type is int (2)

result <- getTable(1,2)
colnames(result) <- c("question_id", "time", "value")
totalPop(result, 2)


dbDisconnect(mydb)


#questions: 
#-question_id
#-survey_id
#-question
#-type

#response: 
#-response_id
#-user_email
#-question_id
#-response_text
#-response_int
#-response_bool
#-time 

