shinyUI(fluidPage(
  titlePanel("Tropical Storms"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput("maxResults", "Maximum results", min = SLIDER_MIN_VALUE, max = SLIDER_MAX_VALUE, value = SLIDER_INIT_VALUE)
      
      , width = 2),
    
    mainPanel(
      
      tabsetPanel(id='main',
                  tabPanel('Storm count', p(),
                           fluidRow(plotlyOutput("stormCountPlot",width='100%', height = '800px'))
                  ),
                  tabPanel('Storm names', p(),
                           fluidRow(plotlyOutput("stormNamesPlot",width='100%', height = '800px'))
                  )
      )
    )
  )
))