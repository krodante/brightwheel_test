# Controller for passing email params
class EmailController < ApplicationController
  before_action :email_params

  def email
    if email_params.keys == stringified_params
      Email.new.send_email(email_payload(email_params))
      render json: {
        status: 200,
        message: "ok"
      }
    else
      missing_params
    end
  end

  private

  def missing_params
    missing_params = stringified_params - email_params.keys

    render json: {
      status: 400,
      message: "Missing param(s): " + missing_params.to_s
    }
  end

  def email_params
    params.require(:email)
          .permit(:body, :from, :from_name, :subject, :to, :to_name)
  end

  def email_payload(params)
    {
      text: Email.convert_body(params[:body]),
      from: params[:from],
      from_name: params[:from_name],
      subject: params[:subject],
      to: params[:to],
      to_name: params[:to_name]
    }
  end

  def stringified_params
    ["body", "from", "from_name", "subject", "to", "to_name"]
  end
end
