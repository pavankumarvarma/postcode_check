# frozen_string_literal: true

class PostcodeController < ApplicationController
  def index; end

  def search
    @message = PostcodeService.new(params[:search]).validate_post_code unless params[:search].blank?
    render :index
  end
end
