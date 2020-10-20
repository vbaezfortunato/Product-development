#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram


shinyServer(function(input, output) {
    
    archivo_carga_1 <- reactive({
        if(is.null(input$upload_file_1)){
            return(NULL)
        }
        
        #browser()
        
        ext <- strsplit(input$upload_file_1$name, split = "[.]")[[1]][2]
        
        if(ext == 'csv'){
            file_data <- readr::read_csv(input$upload_file_1$datapath)
            return(file_data)
        }
        if(ext == 'tsv'){
            file_data <- readr::read_tsv(input$upload_file_1$datapath)
            return(file_data)
        }
        return(NULL)
        
    })
    
    output$archivo_1 <- renderTable({
        archivo_carga_1()
    })
    
    
    
    archivo_carga_2 <- reactive({
        if(is.null(input$upload_file_2)){
            return(NULL)
        }
        
        #browser()
        
        ext <- strsplit(input$upload_file_2$name, split = "[.]")[[1]][2]
        
        if(ext == 'csv'){
            file_data <- readr::read_csv(input$upload_file_2$datapath)
            return(file_data)
        }
        if(ext == 'tsv'){
            file_data <- readr::read_tsv(input$upload_file_2$datapath)
            return(file_data)
        }
        return(NULL)
        
    })
    
    output$archivo_2 <- DT::renderDataTable({
        
        upload_file_2() %>% DT::datatable(filter = "bottom")
        
    })
    
    
    output$table1 <- DT::renderDataTable({
        diamonds %>% 
            datatable() %>%
            formatCurrency("price") %>%
            formatString(c("x","y","z"), suffix = " mm")
    })
    
    output$table2 <- DT::renderDataTable({
        mtcars %>% DT::datatable(options = list(pageLength = 5,
                                                lengthMenu = c(5,10,15)
        ),
        filter = "top") 
        
        
    })
    
    output$table3 <- DT::renderDataTable({
        iris %>% 
            datatable( extensions = 'Buttons',
                       options = list(dom = 'Bfrtip',
                                      buttons = c('csv')), rownames = FALSE
            )
    })
    
    
    
    output$table4_single_click <- renderText({
        input$tabla4_rows_selected
    })
    
    
    output$table4 <- DT::renderDataTable({
        mtcars %>% 
            datatable( selection = 'single'
            )
    })
    
    
    output$table5 <- DT::renderDataTable({
        mtcars %>% 
            datatable()
    })
    
    
    output$table5_multi_click <- renderText({
        input$tabla5_rows_selected
    })
    
    
    
    output$table6_single_click <- renderText({
        input$tabla6_columns_selected
    })
    
    
    output$table6 <- DT::renderDataTable({
        mtcars %>% 
            datatable( selection = list(mode = 'single',
                                        target = 'column')
            )
    })
    
    
    output$table7 <- DT::renderDataTable({
        mtcars %>% 
            datatable( selection = list(mode = 'multiple',
                                        target = 'column'))
    })
    
    
    output$table7_multi_click <- renderText({
        input$tabla7_columns_selected
    })
    
    output$table8_single_click <- renderPrint({
        input$tabla8_cells_selected
    })
    
    
    output$table8 <- DT::renderDataTable({
        mtcars %>% 
            datatable( selection = list(mode = 'single',
                                        target = 'cell')
            )
    })
    
    
    output$table9 <- DT::renderDataTable({
        mtcars %>% 
            datatable( selection = list(mode = 'multiple',
                                        target = 'cell'))
    })
    
    
    output$table9_multi_click <- renderPrint({
        input$tabla9_cells_selected
    })
    
    
})