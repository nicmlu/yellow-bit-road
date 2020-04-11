class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :go_home, :difficulty_levels
   
        def current_user
            @current_user ||= User.find_by(id: session[:user_id])
        end

        def logged_in?
            !!session[:user_id]
        end

        def go_home
            if logged_in?
                redirect_to user_path(current_user)
            end
        end

        def difficulty_levels
            [['Easy', 'easy'], ['Moderate', 'moderate'], ['Challenging', 'challenging']]
         end

end
