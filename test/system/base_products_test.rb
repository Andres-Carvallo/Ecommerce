require "application_system_test_case"

class BaseProductsTest < ApplicationSystemTestCase
  setup do
    @base_product = base_products(:one)
  end

  test "visiting the index" do
    visit base_products_url
    assert_selector "h1", text: "Base Products"
  end

  test "creating a Base product" do
    visit base_products_url
    click_on "New Base Product"

    fill_in "Name", with: @base_product.name
    click_on "Create Base product"

    assert_text "Base product was successfully created"
    click_on "Back"
  end

  test "updating a Base product" do
    visit base_products_url
    click_on "Edit", match: :first

    fill_in "Name", with: @base_product.name
    click_on "Update Base product"

    assert_text "Base product was successfully updated"
    click_on "Back"
  end

  test "destroying a Base product" do
    visit base_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Base product was successfully destroyed"
  end
end
