class StaticPagesController < ApplicationController
  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

  def contact
    @title = "Contact"
  end

  def signup
    @title = "Sign Up"
  end

  def signin
    @title = "Sign In"
  end
end
