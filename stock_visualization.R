# BDA400 Assignment 2
# Stock Data Display and Visualization

library(quantmod)
library(TTR)
library(ggplot2)

# Display the latest 10 observations for each stock
display_stock_data <- function(stocks) {
  
  for (symbol in names(stocks)) {
    
    cat("\nStock Symbol:", symbol, "\n")
    
    print(tail(stocks[[symbol]], 10))
  }
}

# Display stock data
display_stock_data(stocks)


# Function to plot historical closing prices
plot_stock_prices <- function(stock_data, symbol) {
  
  prices <- data.frame(
    Date = as.Date(index(stock_data)),
    Closing_Price = as.numeric(Cl(stock_data))
  )
  
  ggplot(prices, aes(x = Date, y = Closing_Price)) +
    geom_line() +
    labs(
      title = paste(symbol, "Historical Closing Prices"),
      x = "Date",
      y = "Closing Price (USD)"
    ) +
    theme_minimal()
}


# Plot stock prices
plot_stock_prices(stocks$AAPL, "AAPL")
plot_stock_prices(stocks$MSFT, "MSFT")
plot_stock_prices(stocks$AMZN, "AMZN")