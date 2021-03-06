require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = FactoryGirl.create(:event)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:completed_events)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:event)
  end

  test "should create event" do
    new_event = FactoryGirl.build(:event, end: nil, comment: 'New Event')
    assert_difference('Event.count') do
      post :create, event: @event.attributes
    end

    assert_redirected_to events_url
  end

  test "should show event" do
    get :show, id: @event.to_param
    assert_response :success
    assert_not_nil assigns(:event)
  end

  test "should get edit" do
    get :edit, id: @event.to_param
    assert_response :success
    assert_not_nil assigns(:event)
  end

  test "should update event" do
    put :update, id: @event.to_param, event: @event.attributes
    assert_redirected_to event_url(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event.to_param
    end

    assert_redirected_to events_url
  end

  test 'should get current' do
    get :current
    assert_response :success
    assert_not_nil :current_events
  end

  test 'should resume' do
    post :resume, id: @event.to_param
    assert_redirected_to events_url
  end

  test 'should stop' do
    current_event = FactoryGirl.create(:event, end: nil, comment: 'Current event')
    put :stop, id: current_event.to_param
    assert_redirected_to events_url
  end
end
