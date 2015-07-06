class SearchesController < ApplicationController
  before_action :set_page, only: :show

  def show
    if params[:query] && params[:query].is_a?(String)
      @gems = Rubygem.search("*#{params[:query]}* AND indexed:true").page(@page).records
      @exact_match = Rubygem.name_is(params[:query]).with_versions.first

      redirect_to rubygem_path(@exact_match) if @gems == [@exact_match]
    end
  end
end
