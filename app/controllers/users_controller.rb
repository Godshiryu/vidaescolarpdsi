class UsersController < ApplicationController
  before_action :set_user, only: [:show ]

    def show
    end

    def index
        @users = User.all
    end

      private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def  user_params
      params.require(:user).permit(:id, :email)
    end

end
