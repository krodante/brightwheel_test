# BrightWheel Code Test

Hi there! Thank you for taking a look at my code challenge!

The code is written in Ruby 2.3 and Rails 5.0.1.

Clone the repository through github by typing `git clone git@github.com:krodante/brightwheel_test.git`

You will need the appropriate environment variables to run this program. I have sent them in the email with this submission. Add them to the `/.env.sample` file and rename it `.env`

Then run:

```
cd brightwheel_test
bundle install
rspec spec 
```
and watch the tests pass!

## Documentation

The purpose of this application is to provide the service with a payload that will send an email through either Mailgun or Mandrill.

Example payload:

```
POST /email

"email": {
  "body": "this is great!",
  "from": "noreply@kathyrodante.com",
  "from_name": "Kathy Rodante",
  "subject": "Email Test",
  "to": "kathykeppel@gmail.com",
  "to_name": "Kathy Keppel"
}

```

Example Success Response:

```
{ 
  "status": 200,
  "message": "ok"
}
```

Example Failure Response:

```
{ 
  "status": 400,
  "message": "Missing param(s): <missing params>"
}
```

## Changing Mail Servers
The mail server is Mailgun by default. In order to change the mail server, set the `MAILER` variable in `.env` to `"mandrill"`.

In a production environment using AWS, you would change the Environment Variable on the Instance and redeploy.

If you're deploying from the console, add ENV["MAILER"] = "mandrill" to your command.