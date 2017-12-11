# Omniauth class create new user session via facebook
class OmniauthController < ApplicationController
  def create
    session[:user_id] = user.id

    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  private

  def user
    if account.present?
      account.user
    else
      User.find_or_create_by(user_params.slice(:email)) do |user|
        user.name = user_params[:name]
        user.remote_image_url = user_params[:remote_image_url]
        user.accounts_attributes = [account_params]
      end
    end
  end

  def account
    Account.find_by(account_params)
  end

  def account_params
    {
      provider: auth_hash[:provider],
      uid: auth_hash[:uid]
    }
  end

  def user_params
    {
      email: auth_hash[:info][:email],
      name: auth_hash[:info][:name],
      remote_image_url: auth_hash[:info][:image]
    }
  end
end
