require 'spec_helper'

describe 'Parts', js: true do
  stub_authorization!

  it 'update, add, and remove parts' do
    tshirt = FactoryGirl.create(:product, name: 'T-Shirt')
    mug = FactoryGirl.create(:product, name: 'Mug')

    visit spree.admin_product_path(mug)
    check 'product_can_be_part'
    click_on 'Update'

    visit spree.admin_product_path(tshirt)
    click_on 'Parts'
    fill_in 'searchtext', with: 'Mug'

    within('#search_hits') { click_on 'Select' }
    page.should have_content(mug.sku)

    within('#product_parts') { click_on 'Remove' }
  end
end
