library(shiny)

ui <- fluidPage(
  selectInput(inputId = 'selected_store', label = 'Select store:',
              choices = unique(sales_df$scode)),
  selectInput(inputId = 'selected_sku', label = 'Select sku:',
              choices = unique(sales_df$pcode)),
  plotOutput("ts_plot"),
  verbatimTextOutput('debug')
)
