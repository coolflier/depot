require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
  	product = Product.new(title: "Crazy Testing",
  		description: "Crazy Testing Mechanism", image_url: "crazy.png")
  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"],
  		product.errors[:price]

  	product.price = 0
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"],
  		product.errors[:price]

  	product.price = 1
  	assert product.valid?  	
  end

  # test "should not create products with the duplicate title" do
  #  	product = Product.new(title: products(:three).title,
  #   	description: "Duplicate Title",
  #   	price: 19.4,
  #   	image_url: "razy.gif")
  #   assert product.invalid?
  #   assert_equal ["has already been taken"], product.errors[:title]
    
  # end

  test "should not create products with the duplicate title" do
    product = Product.new(title: products(:three).title,
      description: "Duplicate Title",
      price: 19.4,
      image_url: "razy.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  def new_product(image_url)
  	Product.new(title: "My Book Title",
  		description: "Description",
  		price: 19.95,
  		image_url: image_url)
  end

  test "Image URL" do
  	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.PNG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
  	bad = %w{fred.doc fred.gif/more fred.gif.more}

  	ok.each do |name|
  		assert new_product(name).valid?, "#{name} should be valid"
  	end

  	bad.each do |name|
  		assert new_product(name).invalid?, "#{name} should be invalid"
  	end
  	

  end

end
