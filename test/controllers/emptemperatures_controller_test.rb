require 'test_helper'

class EmptemperaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emptemperature = emptemperatures(:one)
  end

  test "should get index" do
    get emptemperatures_url
    assert_response :success
  end

  test "should get new" do
    get new_emptemperature_url
    assert_response :success
  end

  test "should create emptemperature" do
    assert_difference('Emptemperature.count') do
      post emptemperatures_url, params: { emptemperature: { adress: @emptemperature.adress, day_and_time: @emptemperature.day_and_time, done_by: @emptemperature.done_by, full_name: @emptemperature.full_name, phone: @emptemperature.phone, symptoms: @emptemperature.symptoms, temperature: @emptemperature.temperature } }
    end

    assert_redirected_to emptemperature_url(Emptemperature.last)
  end

  test "should show emptemperature" do
    get emptemperature_url(@emptemperature)
    assert_response :success
  end

  test "should get edit" do
    get edit_emptemperature_url(@emptemperature)
    assert_response :success
  end

  test "should update emptemperature" do
    patch emptemperature_url(@emptemperature), params: { emptemperature: { adress: @emptemperature.adress, day_and_time: @emptemperature.day_and_time, done_by: @emptemperature.done_by, full_name: @emptemperature.full_name, phone: @emptemperature.phone, symptoms: @emptemperature.symptoms, temperature: @emptemperature.temperature } }
    assert_redirected_to emptemperature_url(@emptemperature)
  end

  test "should destroy emptemperature" do
    assert_difference('Emptemperature.count', -1) do
      delete emptemperature_url(@emptemperature)
    end

    assert_redirected_to emptemperatures_url
  end
end
