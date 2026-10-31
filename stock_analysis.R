# Load required packages
library(quantmod)
library(TTR)

# Function to load stock data
load_stock_data <- function(
    portfolio_file = "portfolio.txt",
    from_date = "2024-01-01"
) {
  
  # Read stock symbols
  symbols <- readLines(portfolio_file)
  
  # Remove blank lines and extra spaces
  symbols <- trimws(symbols)
  symbols <- symbols[symbols != ""]
  
  # Create an empty list
  stock_data <- list()
  
  # Download each stock
  for (symbol in symbols) {
    
    tryCatch({
      
      data <- getSymbols(
        symbol,
        src = "yahoo",
        from = from_date,
        auto.assign = FALSE
      )
      
      stock_data[[symbol]] <- data
      
      message("Successfully loaded: ", symbol)
      
    }, error = function(e) {
      
      message(
        "Could not load ",
        symbol,
        ": ",
        conditionMessage(e)
      )
      
    })
  }
  
  return(stock_data)
}

# Run the function
stocks <- load_stock_data()

# Display available stocks
names(stocks)