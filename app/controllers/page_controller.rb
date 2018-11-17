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

  def now
  end

  def css_file
    respond_to do |format|
      format.html
      format.css
    end
  end
end
