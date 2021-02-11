require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "They can add to cart and see cart count go up one" do
    visit "/"

    # commented out b/c it's for debugging only
    
    expect(find('div.container')).to have_content('My Cart (0)')
    first('article.product').find_button('Add').click
    expect(find('div.container')).to have_content('My Cart (1)')
    save_and_open_screenshot
  end
end