class BooksController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  actions :all

  protected

  def permitted_params
    params.permit(:book => :title)
  end
end
