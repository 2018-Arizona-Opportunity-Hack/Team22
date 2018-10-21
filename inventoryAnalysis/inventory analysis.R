library(shiny)
library(shinydashboard)
library(shinyjs)
library(RMySQL)
library(ggplot2)
library(dplyr)

# initialize the connection to the database
mydb = dbConnect(MySQL(), user='u425692621_root', 
                 password='YellowFinch', 
                 dbname = 'u425692621_table', 
                 host='sql167.main-hosting.eu',
                 port=3306)


#get the table fields and field types
table_fields <- dbListFields(mydb, "mock_inventory")
print(table_fields)

#get the full inventory table
rs <- dbSendQuery(mydb, "SELECT * from mock_inventory")
dbTable <- fetch(rs, n=-1)

# get the data types so we can remove the bad ones
type_query = dbSendQuery(mydb, "SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'mock_inventory'")
dat = fetch(type_query, n=-1)

#get the full dataframe of each field and it's type
table_fields <- as.data.frame(list(fields=table_fields, type=dat))
print(table_fields)

#remove the identifying fields
table_fields <- table_fields[table_fields$fields != "id",]

# seperate the categorical and numeric fields
categorical_fields <- table_fields[table_fields$DATA_TYPE == "varchar",]
numeric_fields <- table_fields[table_fields$DATA_TYPE == "int" & table_fields$fields != "Value Each",]

#####################################################
# build the shiny app
ui <- fluidPage(
  useShinyjs(), 
  dashboardPage(
    dashboardHeader(
      title = "Analytics"
    ),
    dashboardSidebar(
      # build the input fields and the action button
      selectInput("categorical_field", label = "Feild 1:", choices = categorical_fields$fields),
      selectInput("numeric_field", label = "Feild 2:", choices = numeric_fields$fields),
      actionButton(inputId = "barGraph", label = "Bar chart")
    ), 
    dashboardBody(
      plotOutput("plotBar")
    )
  )
)

server <- function(input, output, session) {
  finalPlot <- eventReactive(c(input$barGraph, input$categorical_field, input$numeric_field),{
    # get the necessary data from the database table
    pdat <- data.frame(categories=dbTable[[input$categorical_field]], values=dbTable[[input$numeric_field]])
    print(pdat)
    # get the totals
    totals <- pdat %>%
      group_by(categories) %>%
      summarize(values = sum(values))
    print(totals)
      
    # plot the bar chart using ggplot
    ggplot(pdat, aes(x=categories, y=values)) + 
      geom_bar(stat="identity", fill = "steelblue") +
      geom_text(aes(categories, values, label=values, fill=NULL), data=totals, vjust=1.6, color="white", size=3.5)+
      theme_minimal()
  })
  output$plotBar <- renderPlot({
    # render the chart
    finalPlot()
  })
}


dbDisconnect(mydb)

shinyApp(ui,server)
