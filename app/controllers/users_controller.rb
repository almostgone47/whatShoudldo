class UsersController < Clearance::UsersController
    before_action :find_user, only: [:edit, :show, :edit_photo, :update, :destroy]
  
    def index
    #   @events = Event.all
    #   @myevents = Event.where(user_id: current_user.id)
    end
  
    def show
    #   @events = Event.all
    end

    def create
      @user = user_from_params
  
      if @user.save
        sign_in @user
        redirect_to home_interest_path
      else
        render template: "users/new"
      end
    end
  
    def new
      @user = user_from_params
    end

    def edit
    end
  
    def edit_photo
    end
  
    def update
    #   if @user.update(user_params)
    #     redirect_to user_path
    #   else
    #     render '/users/edit'
    #   end
    end
  
    def destroy
    #   @user.remove_avatar!
    #   @user.save
    #   redirect_to user_path
    end
  
    def user_from_params
      first_name = user_params.delete(:first_name)
      last_name = user_params.delete(:last_name)
      gender = user_params.delete(:gender)
      country = user_params.delete(:country)
      email = user_params.delete(:email)
      password = user_params.delete(:password)
  
      Clearance.configuration.user_model.new(user_params).tap do |user|
        user.first_name = first_name
        user.last_name = last_name
        user.gender = gender
        user.country = country
        user.email = email
        user.password = password
      end
    end
  
    private
      def url_after_create
        redirect_to home_interest_path
      end
      
      def user_from_params
        email = user_params.delete(:email)
        password = user_params.delete(:password)
    
        Clearance.configuration.user_model.new(user_params).tap do |user|
          user.email = email
          user.password = password
        end
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :gender, :interest, :country, :email, :password, :role, :avatar )
      end
  
      def find_user
        @user = User.find(params[:id])
      end
  end    



