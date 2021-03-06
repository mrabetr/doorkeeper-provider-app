# frozen_string_literal: true

class OauthApplicationsController < ApplicationController
  # This is a custom controller that can be used instead of Doorkeeper's default
  before_action :authenticate_user!
  before_action :set_application, only: %i[show edit update destroy]

  def index
    @applications = current_user.oauth_applications.ordered_by(:created_at)
  end

  def show
    pkce_challenge = PkceChallenge.challenge(char_length: 128)
    @code_verifier = pkce_challenge.code_verifier
    @code_challenge = pkce_challenge.code_challenge
  end

  def new
    @application = current_user.oauth_applications.new
  end

  def create
    @application = current_user.oauth_applications.new(application_params)

    if @application.save
      flash[:notice] = I18n.t(:notice, scope: %i[doorkeeper flash applications create])
      redirect_to oauth_application_url(@application)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @application.update(application_params)
      flash[:notice] = I18n.t(:notice, scope: %i[doorkeeper flash applications update])
      redirect_to oauth_application_url(@application)
    else
      render :edit
    end
  end

  def destroy
    if @application.destroy
      flash[:notice] = I18n.t(:notice, scope: %i[doorkeeper flash applications destroy])
    end

    redirect_to oauth_applications_url
  end

  private

    def set_application
      @application = current_user.oauth_applications.find(params[:id])
    end

    def application_params
      params.require(:oauth_application).permit(:name, :redirect_uri, :scopes, :confidential)
    end
end
