require 'oauth'
require 'oauth/consumer'
class AuthorizationController < ApplicationController
  def login
    @consumer=OAuth::Consumer.new(
      "3cdd9594656bbc1790d72cfe7e869ed2",
      "d1ef1949778e8cabfabea01eeb83050b7c6b8e315357d2e41a29ceed510f4439"
      {
        site: "https://api.trello.com",
	request_token_path: '/1/OAuthGetRequestToken',
	authorize_path: '/1/OAuthAuthorizeToken',
	access_token_path: '/1/OAuthGetAccessToken',
	query_string: 'name=Booga'
      }
    )
    @request_token=@consumer.get_request_token(oauth_callback: 'http://localhost:3000/authorization/callback')
    session[:request_token] = @request_token
    redirect_to session[:request_token].authorize_url + '&name=Booga'
  end

  def callback
    @access_token = session[:request_token].get_access_token(:oauth_verifier => params[:oauth_verifier])
    user = JSON.load(@access_token.get('/1/members/me').body)
    session[:trello_user_id] = user['id']
    redirect_to '/project'
  end
end
