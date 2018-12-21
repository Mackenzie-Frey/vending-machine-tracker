require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons_machine  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons_machine)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'has item name and price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons_machine  = owner.machines.create(location: "Don's Mixed Drinks")

    item_1 = dons_machine.items.create(name: "Snack-Name 1", price: 1)
    item_2 = dons_machine.items.create(name: "Snack-Name 2", price: 2)

    visit machine_path(dons_machine)

    expect(page).to have_content("Name: #{item_1.name}")
    expect(page).to have_content("Price: $#{item_1.price}")

    expect(page).to have_content("Name: #{item_2.name}")
    expect(page).to have_content("Price: $#{item_2.price}")
  end

  it 'has an average price for all snacks in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons_machine  = owner.machines.create(location: "Don's Mixed Drinks")

    item_1 = dons_machine.items.create(name: "Snack-Name 1", price: 1)
    item_2 = dons_machine.items.create(name: "Snack-Name 2", price: 2)

    visit machine_path(dons_machine)

    expect(page).to have_content("Average Price: $#{1.50}")
  end
end

# User Story 2 of 3
#
# As a visitor
# When I visit a vending machine show page
# >>>>>>>>>>>>>>>>>>>>

# I also see an average price for all of the snacks in that machine
