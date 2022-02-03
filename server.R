library(shiny)
library(fpp3)

sales_df <- read.csv("data/clean_sales.csv")
sales_df$date <- as.Date(sales_df$date)
sales_df <- as_tsibble(sales_df, key = c("scode", "pcode"), index = "date")


server <- function(input, output) {
  output$debug <- renderPrint({
input$selected_date_range
    })
  output$ts_plot <- renderPlot({
    min_date <- input$selected_date_range[1]
    max_date <- input$selected_date_range[2]
    plot_df <- sales_df[
      sales_df$scode == input$selected_store & sales_df$pcode == input$selected_sku, ]
    plot_df <- plot_df[plot_df$date >= min_date, ]
    plot_df <- plot_df[plot_df$date <= max_date, ]
    autoplot(plot_df)
  })
}
