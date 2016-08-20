module UsersHelper
private
   def set_current_session
     session[:user_id] = params[:user][:id]
   end

  def self.top_contributer
    self.top_contributer
  end
end
