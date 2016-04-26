require 'json'
def start
	setup_files
	create_report
end


def setup_files
    path = File.join(File.dirname(__FILE__), '../data/products.json')
    file = File.read(path)
    $products_hash = JSON.parse(file)
    $report_file = File.new("report.txt", "w+")
end

def print_heading(heading)
	#blablabla
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


# Print "Products" in ascii art
puts "  _____               _            _        "
puts " |  __ \\             | |          | |      "
puts " | |__) | __ ___   __| |_   _  ___| |_ ___  "
puts " |  ___/ '__/ _ \\ / _` | | | |/ __| __/ __|"
puts " | |   | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts " |_|   |_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "                                            "

def create_report	
	#print_heading("Sales Report")
	puts "Today's date is #{Time.now.strftime("%m/%d/%y")}"
	#print_heading("Products")
	$products_hash["items"].each do |toy|
		puts "#{get_title(toy)}"
		puts "Retail Price: $#{get_retail_price(toy)}"
		puts "Total Purchases: #{get_total_purchases(toy)}"
		puts "Total Sales: $#{get_total_sales(toy)}"
		puts "Average Price: $#{get_average_price(toy)}"
		puts "Average Discount: $#{get_average_discount(toy)}"
		puts "***********************************"
		puts ""
	end
	#print_heading("Brands")

end



# For each product in the data set:
	# Print the name of the toy
def get_title(toy)
	return toy['title']
end

	# Print the retail price of the toy
def get_retail_price(toy)
	return toy['full-price'].to_f
end

	# Calculate and print the total number of purchases
def get_total_purchases(toy)
	return toy['purchases'].length
end

	# Calculate and print the total amount of sales
def get_total_sales(toy)
	total = 0
	toy['purchases'].each do |purchase|
		total += purchase['price']
	end
	return total
end

	# Calculate and print the average price the toy sold for
def get_average_price(toy)
	return get_total_sales(toy) / get_total_purchases(toy)
end

	# Calculate and print the average discount (% or $) based off the average sales price
def get_average_discount(toy)
	return get_retail_price(toy) - get_average_price(toy)
end

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



start