library(shiny)
library(shinydashboard)
library(shinyjs)
library(RMySQL)
library(ggplot2)

#----------functions-----------------
killDbConnections <- function () {
  
  all_cons <- dbListConnections(MySQL())
  
  for(con in all_cons)
    +  dbDisconnect(con)
  
  print(paste(length(all_cons), " connections killed."))
  
}

#given a question ID and type get the table containing
#ID | date | response 
#getTable <- function(id, type){
  #if 1(text): 
#  if(type == 1){
#    cName <- "response_text"
#  }
#  else if(type == 2){
#    cName <- "response_int"
#  }
#  else{ #type == 3 (bool)
#    cName <- "response_bool"
#  }
  
  #get the data at the id. 
#  query = paste("SELECT question_id, time, ", cName, 
#                "from response where question_id =", id, ";", collapse = "") 
  
#  result <- dbGetQuery(mydb, query)
#  result[,2] = as.Date(result[,2])
#  return(result)
  #| ID | date | value for question
#}

#given the table outputed by getTable and the question responce type
#select type of analysis to do and output graphs. 
#totalPop <- function(t , type){
  #if int average result column for every month.
  #future implementations may want to select either month, year, etc.
#  if(type == 2){
#    t$month <- format(as.Date(t$time), "%m")
#    t$year <- format(as.Date(t$time), "%Y")
#    
#    #subset of table for every month: 
#    #get the mean for the data.
#    #if time implement selection for monthly vs. yearly. 
#    #sYear <- aggregate(value ~ t$year, t, mean)
#    #colnames(sYear) <- c("year", "mean")
#    #sMonth <- aggregate(value ~t$month, t, mean)
#    #colnames(sMonth) <- c("month", "mean")
#    
#    sTable <- aggregate(value ~t$month, t, mean)
#    colnames(sTable) <- c("month", "mean")
#    
#    #given average metric for months output line plot. 
#    ####TODO weird bug with smoth plotting and linear regression. 
#    output$chart1 <- renderPlot({
#      ggplot(sTable, aes(x = month, y = mean)) + geom_point() + 
#        geom_smooth(method = "lm", se = FALSE)
#    })
#    
#  }
#  #IF TIME: 
#  #else int or bool: 
#  #get frequency of responce
#
#  #get frequency of responce type without the average for the year. 
#  t$value <- factor(t$value, ordered = TRUE)
#  output$chart2 <- renderPlot({
#    ggplot(t, aes(t$value)) + geom_histogram(stat = "count")
#  })
#  
#  #output histogram. 
#}


#-----------------------------------

# initialize the connection to the database
mydb = dbConnect(MySQL(), user='u425692621_root', 
                 password='YellowFinch', 
                 dbname = 'u425692621_table', 
                 host='sql167.main-hosting.eu',
                 port=3306)


#select all the surver ids from questions table. 
query = "SELECT distinct survey_id FROM questions;"
sIDs <- dbGetQuery(mydb, query)

# build the shiny app
ui <- fluidPage(
  useShinyjs(),
  dashboardPage(
    dashboardHeader(
      title = "This is a sample Title"
    ),
    dashboardSidebar(
      #create a drop down menu for different surveys in the database. 
      selectInput("survey", label = "Select survey to analyze", sIDs),
      #second selection option changes based upon first. 
      #select table question to analyze. 
      selectInput("question", label = "Select Question to analyze", choices = NULL)#,
      #actionButton(inputId = "update", label = "start analysis")
    ), 
    dashboardBody(
      fluidRow(
        box( verbatimTextOutput("testing"))
      ), #Some basic instructions on how to run and interpret the tables. 
      fluidRow(
        #section to display outputed chart(s) 
        box( plotOutput("chart1")), #numerical data chart
        box( plotOutput("chart2"))#, #basic histogram 
        #section to display table that is on the chart. 
        
      )
    )
  )
)

server <- function(session, input, output) {
  #code block to update selectInput with id "survey" 
  observe({
    id = reactive({input$survey })
    query = paste("SELECT question_id, type from questions where survey_id = ", as.character(id),";", collapse = "") 
    result <- dbGetQuery(mydb, query) 
  
    updateSelectInput(session, "question", "Select Question to analyze", choices = result[,1])
    
    dataT <- getTable(id, result[,2])
    output$testing <-renderPrint(print(dataT))
    
    
    
  })
  #output$testing <- renderPrint(print(head(result)))
  #
  
  
  #now having the survey id and question id. 
  #get data to plot. 
  #id <- reactive({input$question})
  
  
  #dataT <- getTable(id, result[,2])
  
  
  
  #get data to plot. 
  #reactive({
  #  id = input$survey 
  #  query = paste("SELECT question_id, type from questions where survey_id = ", as.character(id),";", collapse = "") 
  #  result <- dbGetQuery(mydb, query) 
    
  #  dataT <- getTable(input$question,result[,2])
  #  output$testing <- renderPrint(print(result[,2]))
  #})
  
  #colnames(dataT) <- c("question_id", "time", "value")
  #totalPop(dataT, result[,2])
  
  
  
  
  
}


shinyApp(ui = ui, server = server)