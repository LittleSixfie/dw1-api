require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_index_url
    assert_response :success
  end

  test "should get leer" do
    get articles_leer_url
    assert_response :success
  end

  test "should get crear" do
    get articles_crear_url
    assert_response :success
  end

  test "should get actualizar" do
    get articles_actualizar_url
    assert_response :success
  end
end
