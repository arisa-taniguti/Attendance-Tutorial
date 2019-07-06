class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # sessionsペルパーの読み込みは以下記述。
  include SessionsHelper
end
