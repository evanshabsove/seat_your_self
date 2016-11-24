require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "reservatoin_confirm" do
    mail = UserMailer.reservatoin_confirm
    assert_equal "Reservatoin confirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
