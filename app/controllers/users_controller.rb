class UsersController < ApplicationController
  before_filter :authenticate_user! # для Devise


end
