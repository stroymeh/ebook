class AttachmentsController < ApplicationController
  inherit_resources

  belongs_to :book, :optional => true do
    belongs_to :chapter, :optional => true do
      belongs_to :section
    end
  end

  actions :all, :except => [:index, :show, :create]

  def create
    @section = Section.find(params[:section_id])

    @attachment = @section.attachments.create(:file => params[:file])

    respond_to do |format|
      format.json { render :json => @attachment }
    end
  end

  private

  def permitted_params
    params.permit(:attachment => :file)
  end
end
