require 'json'
def setup_files
    path = File.join(File.dirname(__FILE__), '../data/products.json')
    file = File.read(path)
    $products_hash = JSON.parse(file)
    $report_file = File.new("report.txt", "w+")
end

# Print "Sales Report" in ascii art
puts "                                                             "
puts "   _____       _             _____                       _   "
puts "  / ____|     | |           |  __ \\                     | | "
puts " | (___   __ _| | ___  ___  | |__) |___ _ __   ___  _ __| |_ "
puts "  \\___ \\ / _` | |/ _ \\/ __| |  _  // _ \\ '_ \\ / _ \\| '__| __|"
puts "  ____) | (_| | |  __/\\__ \\ | | \\ \\  __/ |_) | (_) | |  | |_ "
puts " |_____/ \\__,_|_|\\___||___/ |_|  \\_\\___| .__/ \\___/|_|   \\__|"
puts "                                       | |                   "
puts "                                       |_|                   "
puts "                                                             "


# Print today's date
puts "Today's date is April 14, 2016"

# Print "Products" in ascii art
puts "  _____               _            _        "
puts " |  __ \\             | |          | |      "
puts " | |__) | __ ___   __| |_   _  ___| |_ ___  "
puts " |  ___/ '__/ _ \\ / _` | | | |/ __| __/ __|"
puts " | |   | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts " |_|   |_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "                                            "

# For each product in the data set:
	# Print the name of the toy
	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price

# Print "Brands" in ascii art
puts "  ____                      _      "
puts " |  _ \\                    | |    "
puts " | |_) |_ __ __ _ _ __   __| |___  "
puts " |  _ <| '__/ _` | '_ \\ / _` / __| "
puts " | |_) | | | (_| | | | | (_| \\__ \\"
puts " |____/|_|  \\__,_|_| |_|\\__,_|___/"
puts "                                   "
                                  
                                  
# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined
