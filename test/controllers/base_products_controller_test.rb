require 'test_helper'

class BaseProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_product = base_products(:one)
  end

  test "should get index" do
    get base_products_url
    assert_response :success
  end

  test "should get new" do
    get new_base_product_url
    assert_response :success
  end

  test "should create base_product" do
    assert_difference('BaseProduct.count') do
      post base_products_url, params: { base_product: { name: @base_product.name } }
    end

    assert_redirected_to base_product_url(BaseProduct.last)
  end

  test "should show base_product" do
    get base_product_url(@base_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_base_product_url(@base_product)
    assert_response :success
  end

  test "should update base_product" do
    patch base_product_url(@base_product), params: { base_product: { name: @base_product.name } }
    assert_redirected_to base_product_url(@base_product)
  end

  test "should destroy base_product" do
    assert_difference('BaseProduct.count', -1) do
      delete base_product_url(@base_product)
    end

    assert_redirected_to base_products_url
  end
end
