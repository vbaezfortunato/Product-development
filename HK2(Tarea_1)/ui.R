#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define UI for application that draws a histogram


shinyUI(fluidPage(
    
    
    titlePanel("Upload Files y dataframes"),
    
    tabsetPanel(tabPanel("Upload File",
                         sidebarLayout(
                             sidebarPanel(
                                 h2("Upload File"),
                                 fileInput("upload_file_1",
                                           label = "choose a file", 
                                           buttonLabel = "load",
                                           accept = c(".csv",".tsv"))
                             ), 
                             mainPanel(
                                 tableOutput("archivo_1")
                             )
                         )
    ),
    tabPanel("Upload  DT",
             sidebarLayout(
                 sidebarPanel(
                     h2("Upload"),
                     fileInput("upload_file_2",
                               label = "Choose a File", 
                               buttonLabel = "Load",
                               accept = c(".csv",".tsv"))
                 ), 
                 mainPanel(
                     DT::dataTableOutput("archivo_2")
                 )
             )
    ),
    tabPanel("DT Option",
             h2("Column Format"),
             hr(),
             fluidRow(column(width = 12, DT::dataTableOutput("table1")
             )
             ),
             h2("Options"),
             hr(),
             fluidRow(column(width = 12, DT::dataTableOutput("table2")
             )
             ),
             fluidRow(column(width = 12, DT::dataTableOutput("table3")
             )
             )
    ),
    tabPanel("Clicks on table",
             fluidRow( column(width = 12,
                              h2("Click in any row"),
                              dataTableOutput("table4"),
                              verbatimTextOutput("tabla4_single_click")
             )
             
             ),
             fluidRow( column(width = 12,
                              h2("Click multi-rows"),
                              dataTableOutput("table5"),
                              verbatimTextOutput("table5_multi_click")
             )
             
             ),
             fluidRow( column(width = 12,
                              h2("Click in any rows"),
                              dataTableOutput("table6"),
                              verbatimTextOutput("table6_single_click")
             )
             
             ),
             fluidRow( column(width = 12,
                              h2("Click in multiples rows"),
                              dataTableOutput("table7"),
                              verbatimTextOutput("table7_multi_click")
             )
             
             ),
             fluidRow( column(width = 12,
                              h2("Click in any cell"),
                              dataTableOutput("table8"),
                              verbatimTextOutput("tabla8_single_click")
             )
             
             ),
             fluidRow( column(width = 12,
                              h2("Click en multiples cells"),
                              dataTableOutput("table9"),
                              verbatimTextOutput("table9_multi_click")
             )
             
             )
    )
    )
))