### LIBRARIES
library(shiny)
install.packages('vroom')
library(vroom)
install.packages('tidyverse')
library(tidyverse)


## PAGE DESIGN
ui <- fluidPage(
    
    theme = bslib::bs_theme(bootswatch = "sandstone"),
    
    # Page Title
    navbarPage("B³a¿ej Hinc - Final Project"),
    
    # Button
    actionButton("show", "Show", 
                 class = "btn-sm",
                 class = "btn-outline-info"),
    
    # SIDEBAR LAYOUT
    fluidRow(
        column(4,
               sidebarLayout(
                   sidebarPanel(width = 12, id = "sidebar",
                                h5(p(strong("Project purpose: Use of 'Shiny' library"))),
                                hr(),
                                p(code("Index number: xxxxxx")),
                                p(code("Group: xxx-xx")),
                                p(code("Specialization: Data Analysis"))
                                ,
                   ),
                   
                   mainPanel(width = 0)
                   
               )
        ),
        
        column(8, 
               sidebarLayout(
                   sidebarPanel(width = 12, id = "sidebar2",
                                label = h5("Prepared Graphs"),
                                tabsetPanel(type = "tabs",
                                            tabPanel("Graphics", imageOutput("Graph1")),
                                            tabPanel("GGplot2", imageOutput("Graph2")),
                                            tabPanel("Map", imageOutput("Graph3")))
                   ),
                   
                   mainPanel(width = 0),
                   
               )
        )
    ),
    
)

## LOGIC R    
server <- function(input, output) {
    
    # TABLES
    output$Graph1 <- renderImage({
        list(src = "output_graph 1 - barplot.png",
             height = "380px",
             width = "520px")
    })
    
    output$Graph2 <- renderImage({
        list(src = "output_graph 2 - ggplot2.png",
             height = "380px",
             width = "520px")
    })
    
    output$Graph3 <- renderImage({
        list(src = "output_graph 3 - map.png",
             height = "380px",
             width = "520px")
    })
    
    # BUTTON
    observeEvent(input$show, {
        showModal(
            modalDialog(
                title = "Thank you",
                "for your time!",
                easyClose = TRUE,
                class = "btn-primary"
            ))
    })
    
}
## Run the application 
shinyApp(ui = ui, server = server)
