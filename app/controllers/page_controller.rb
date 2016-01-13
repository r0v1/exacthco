class PageController < ApplicationController

before_action :authenticate_user!, only: [:contact]

  def home
  end

  def about
  end

  def faqs
  end

  def contact
  end
end
