class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!, :only => [:login]


  def initialize
    
  end


  def login

    header = request.headers['HTTP_AUTHORIZATION']
    
    key = "69e41c2b301b01a200c3d3d2e2d7b41e"

    retorno = {}
    if header ==  key

        us = User.find_by(email: params[:email])
        if(us)
            if(us.valid_password?(params[:password]))
              business = Business.where("user_id = ?",us.id)
        
                user = {
                    "id" => us.id,
                    "email" => us.email,
                    "first_name" => us.first_name,
                    "last_name" => us.last_name,
                    "business" => business
                }
                rt = {
                    "result" => 1,
                    "message" => "Success",
                    "usuario" => user
                }
                
            else
                rt = {
                    "result" => 0,
                    "message" => "Invalid password"
                }
            end
        else
            rt = {
                "result" => 0,
                "message" => "User not found"
            }
        end

        retorno = rt

    else
        rt = {
            "result" => 0,
            "message" => "Invalid Key"
        }
        retorno = rt
    end

    respond_to do |format|
        format.json {
            render json: retorno.to_json
        }
    end


end


end
