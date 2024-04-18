require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]

  private

  def sign_in(user)
    visit new_session_path
    within "form" do
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Log in"
    end
  end

  def sign_out
    find("#user-menu").click
    click_button "Logout"
  end
end
