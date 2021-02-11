require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can navigate from the home page to the product detail page" do
    visit "/"
    # puts page.html
    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    # first('article.product').find_button('Add').click()
    # find_link('My Cart (1)').click()
    
    all('a[href="/products/1"]')[0].click

    expect(find('article.product-detail')).to have_content('Description')
    save_and_open_screenshot

  end
end