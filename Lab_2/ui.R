library(shiny)
library(DT)

shinyUI(fluidPage(
    
    
    titlePanel(strong("Laboratorio 2 ")),
    h6("Vidal Baez Fortunato"),
    
    tabsetPanel(
        
        
        tabPanel('Tarea',
                 plotOutput('plot_lab2',
                            click = 'click_plot_lab2',
                            dblclick = 'dblclck_plot_lab2',
                            hover = 'hover_plot_lab2',
                            brush = brushOpts(id = 'brush_plot_lab2', resetOnNew = FALSE)
                 ),
                 dataTableOutput('tarea_dt')
        )
    )
    
))