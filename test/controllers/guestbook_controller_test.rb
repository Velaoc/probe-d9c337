require "test_helper"

class GuestbookControllerTest < ActionDispatch::IntegrationTest
  test "wall shows messages newest first" do
    older = Message.create!(author_name: "Older", body: "old note", created_at: 2.days.ago)
    newer = Message.create!(author_name: "Newer", body: "new note", created_at: 1.hour.ago)

    get root_path
    assert_response :success
    assert_match "Leave a note on the wall", response.body
    assert_includes response.body, "new note"
    assert_includes response.body, "old note"
    assert_operator response.body.index(newer.body), :<, response.body.index(older.body)
  end

  test "anonymous author renders as anonymous" do
    Message.create!(body: "no name here", created_at: 1.hour.ago)

    get root_path
    assert_response :success
    assert_includes response.body, "anonymous"
  end

  test "posting a valid message redirects back to the wall" do
    assert_difference "Message.count", 1 do
      post messages_path, params: { message: { author_name: "Mira", body: "hello from the test" } }
    end

    assert_redirected_to root_path
    assert_equal "Thanks — your note is on the wall.", flash[:notice]
    follow_redirect!
    assert_includes response.body, "hello from the test"
  end

  test "posting a blank message is rejected with errors" do
    assert_no_difference "Message.count" do
      post messages_path, params: { message: { author_name: "", body: "" } }
    end

    assert_response :unprocessable_entity
    assert_includes response.body, "can't be blank"
  end
end
