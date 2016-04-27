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


# Print "Sales Report" in ascii art
def print_ascii_report
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
end

# Print today's date
def print_date
	return Time.now.strftime("%m/%d/%y")
end

# Print "Products" in ascii art
def print_ascii_products
	puts "  _____               _            _        "
	puts " |  __ \\             | |          | |      "
	puts " | |__) | __ ___   __| |_   _  ___| |_ ___  "
	puts " |  ___/ '__/ _ \\ / _` | | | |/ __| __/ __|"
	puts " | |   | | | (_) | (_| | |_| | (__| |_\\__ \\"
	puts " |_|   |_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
	puts "                                            "
end

def create_report	
	print_ascii_report
	puts "Today's date is #{print_date}"
	puts ""
	print_ascii_products
	$products_hash["items"].each do |toy|
		puts "#{get_title(toy)}"
		puts "***********************************"
		puts "Retail Price: $#{get_retail_price(toy)}"
		puts "Total Purchases: #{get_total_purchases(toy)}"
		puts "Total Sales: $#{get_total_sales(toy)}"
		puts "Average Price: $#{get_average_price(toy)}"
		puts "Average Discount: $#{get_average_discount(toy)}"
		puts ""
	end
	print_ascii_brand
	get_uniq_brand()
	$unique_brand.each do |brand|
		puts brand
		puts "***********************************"
		brands_hash = $products_hash['items'].select{ |toy| toy['brand'] == brand}
		puts "Total Stock of #{brand}: #{get_brand_stock(brands_hash)}"
		puts "Average Price of #{brand}: $#{get_average_price_brand(brands_hash)}"
		puts "Total Revenue of #{brand}: $#{get_revenue_brand(brands_hash)}"
		puts ""	
	end
end



# For each product in the data set:
	# Print the name of the toy
def get_title(x)
	return x['title']
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
	total_sales = 0
	toy['purchases'].each do |purchase|
		total_sales += purchase['price']
	end
	return total_sales
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
def print_ascii_brand
	puts "  ____                      _      "
	puts " |  _ \\                    | |    "
	puts " | |_) |_ __ __ _ _ __   __| |___  "
	puts " |  _ <| '__/ _` | '_ \\ / _` / __| "
	puts " | |_) | | | (_| | | | | (_| \\__ \\"
	puts " |____/|_|  \\__,_|_| |_|\\__,_|___/"
	puts "                                   "
end
                                  
                                  
# For each brand in the data set:
	# Print the name of the brand
def get_uniq_brand()
	$unique_brand = $products_hash['items'].map{ |item| item['brand'] }.uniq
end

	# Count and print the number of the brand's toys we stock
def get_brand_stock(brands_hash)
	total_stock_brand = 0
	brands_hash.each do |item|
		total_stock_brand += item['stock']
	end
	return total_stock_brand
end

	# Calculate and print the average price of the brand's toys
def get_average_price_brand(brands_hash)
	total_price_brand = 0
    average_price_brand = 0
    brands_hash.each do |item|
    	total_price_brand += item['full-price'].to_f
    	average_price_brand = (total_price_brand / brands_hash.length).round(2)
    end
    return average_price_brand
end

	# Calculate and print the total sales volume of all the brand's toys combined
def get_revenue_brand(brands_hash)
	total_revenue_brand = 0
	brands_hash.each do |item|
		item['purchases'].each do |purchase|
			total_revenue_brand += purchase['price']
		end
	end
	return total_revenue_brand.round(2)
end

start