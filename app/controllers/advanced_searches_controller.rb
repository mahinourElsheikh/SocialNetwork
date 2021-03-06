class AdvancedSearchesController < ApplicationController
  before_action :logged_in_user

  def results
    params[:advanced_search] = session[:advanced_search]

    @advanced_search = AdvancedSearch.new(advanced_search_params)

  end


  # GET /advanced_searches/new
  def new

  end


  # POST /advanced_searches
  def create
    session.delete(:advanced_search)
    session[:advanced_search] = advanced_search_params
    redirect_to advanced_search_results_path
  end


  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def advanced_search_params
    params.require(:advanced_search).permit(:first_name,:simple,
                                            :last_name, :email,
                                            :city, :caption)
  end

  def logged_in_user
    unless helpers.logged_in?
      #helpers.store_location
      flash[:danger] = "please log in"
      redirect_to login_url
    end
  end

end
