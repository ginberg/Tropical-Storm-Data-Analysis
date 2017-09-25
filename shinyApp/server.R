# Medicare server part

server <- function(input, output) {

  # names plot
  output$stormNamesPlot = renderPlotly({
   
    top_names <- df %>%
         filter(NAME != 'NOTNAMED' & NAME != 'SUBTROP1') %>%
         group_by(NAME) %>%
         summarise(Years_Used = n_distinct(YEAR)) %>%
         arrange(-Years_Used) %>% top_n(10)
    
    top_names$NAME <- factor(top_names$NAME, levels = unique(top_names$NAME)[order(top_names$Years_Used, decreasing = FALSE)])
    
    m <- list(l = 100, r = 50, b = 50, t = 50, pad = 4 )
    
    plot_ly(top_names, x = ~Years_Used, y = ~NAME,  type = 'bar')  %>%
      layout(title = "Most Used Tropical Storm Names", 
             xaxis = list(title = ""), 
             yaxis = list(title = ""),
             margin = m) %>%
      config(displayModeBar = F) 
  })
  
  # count plot
  output$stormCountPlot = renderPlot({
    
    df = df %>%
      filter(NAME != 'NOTNAMED' & NAME != 'SUBTROP1') %>%
      group_by(YEAR) %>%
      summarise(Distinct_Storms = n_distinct(NAME))
    
    p = ggplot(df, aes(x = YEAR, y = Distinct_Storms)) + theme_economist()
    p + geom_line(size = 1.1) + 
      ggtitle("Number of Storms Per Year") + 
      geom_smooth(method='lm', se = FALSE) + 
      ylab("Storms")
  })
  
}