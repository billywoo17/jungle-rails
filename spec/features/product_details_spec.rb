require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
 # SETUP
 before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 1,
      price: 64.99
    )
    
  end
end

scenario "They see all products" do
  visit root_path
  within first('article.product') do
    click_link 'Detail'
  end
  expect(page).to have_css "article.product-detail"
  end
end
