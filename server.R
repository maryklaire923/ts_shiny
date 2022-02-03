library(shiny)
library(fpp3)

sales_df <- read.csv("data/clean_sales.csv")
sales_df$date <- as.Date(sales_df$date)
sales_df <- as_tsibble(sales_df, key = c("scode", "pcode"), index = "date")


server <- function(input, output) {
  output$debug <- renderPrint({
    input$selected_store
    input$selected_sku
    sales_df[
      sales_df$scode == input$selected_store & sales_df$pcode == input$selected_sku, ]
    })
  output$ts_plot <- renderPlot({
    plot_df <- sales_df[
      sales_df$scode == input$selected_store & sales_df$pcode == input$selected_sku, ]
    autoplot(plot_df)
  })
}
