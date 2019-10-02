class ApplicationController < ActionController::API
    # def issue_token(payload)
    #     JWT.encode(payload, 'my_secret_key')
    #end

    def decode_token(token)
       payload = JWT.decode(token, 'my_secret_key')[0]
    end
    
    def get_token
        request.headers['Authorization'] 
    end

    def current_user
        @user = User.find(decode_token(get_token)['user_id'])
    end
    
    # def logged_in?
    #     !!current_user
    # end
end
