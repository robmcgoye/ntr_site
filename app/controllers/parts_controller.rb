class PartsController < ApplicationController
  before_action :require_admin_user, only: [:edit, :update]
  before_action :get_part, only: [:edit, :update]

  def edit
  end

  def update
    if @part.update(part_params)
      flash[:notice] = "The part was successfully updated"
      redirect_to get_page_for(@part.page.name)
    else
      render :edit
    end
  end

  private

    def get_page_for(page_name)
      if page_name == "about"
        about_path
      elsif page_name == "contact"
        new_contact_form_path
      else
        root_path
      end
    end

    def get_part
      @part = Part.find_by id: params[:id]
    end

    # Only allow a list of trusted parameters through.
    def part_params
      params.require(:part).permit(:content)
    end

end
