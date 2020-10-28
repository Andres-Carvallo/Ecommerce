require "application_system_test_case"

class UserCouponsTest < ApplicationSystemTestCase
  setup do
    @user_coupon = user_coupons(:one)
  end

  test "visiting the index" do
    visit user_coupons_url
    assert_selector "h1", text: "User Coupons"
  end

  test "creating a User coupon" do
    visit user_coupons_url
    click_on "New User Coupon"

    fill_in "Discount", with: @user_coupon.discount
    fill_in "Mount discount", with: @user_coupon.mount_discount
    fill_in "Name", with: @user_coupon.name
    check "Unique" if @user_coupon.unique
    click_on "Create User coupon"

    assert_text "User coupon was successfully created"
    click_on "Back"
  end

  test "updating a User coupon" do
    visit user_coupons_url
    click_on "Edit", match: :first

    fill_in "Discount", with: @user_coupon.discount
    fill_in "Mount discount", with: @user_coupon.mount_discount
    fill_in "Name", with: @user_coupon.name
    check "Unique" if @user_coupon.unique
    click_on "Update User coupon"

    assert_text "User coupon was successfully updated"
    click_on "Back"
  end

  test "destroying a User coupon" do
    visit user_coupons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User coupon was successfully destroyed"
  end
end
