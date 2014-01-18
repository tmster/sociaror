require 'spec_helper'

describe "Authentication" do
  let(:base_title) { "SociaRoR" }
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_title("#{base_title} | Sign in") }
  end
end