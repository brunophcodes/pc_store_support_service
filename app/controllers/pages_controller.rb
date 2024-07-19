class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home farewell sorry]

  def home
  end

  def farewell
  end

  def sorry
  end
end
