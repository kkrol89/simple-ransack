class UsersController < ApplicationController
  def index
    @search = User.search(params[:q])

    if @search.groupings.empty? then
      @search.build_grouping
      @search.groupings[0].build_condition
      @search.groupings[0].build_condition
    end

    @users = @search.result(distinct: true)
  end
end