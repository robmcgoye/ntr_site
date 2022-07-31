class PagesController < ApplicationController

  def index
    @page = load_page(:index)
  end

  def about
    @page = load_page(:about)
  end

  # def terms
  #   @page = load_page(:terms)
  # end
  
  private
  
    def load_page(page_name)
      Page.find_by_name(page_name) || Page.create!(name: page_name)
    end

end
