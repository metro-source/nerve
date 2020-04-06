class SigninController < ApplicationController
    def signin
        user = User.find_by_email params[:email]

        if user.nil?
            flash[:error] = "Invalid email/password"
            return redirect_to "/signin"
        end

        if user.authenticate(params[:password])
            session[:current_user_id] = user.id
        else
            flash[:error] = "Invalid email/password"
        end
        
        render "signin"
    end

    def show
        # Simply renders the 'show' template
    end
end
