class EmailController < ApplicationController

  def email
    render json: {
      status: 200,
      message: "ok"
    }
  end

end