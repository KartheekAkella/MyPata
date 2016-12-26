class NotifierMailer < ApplicationMailer
 default from: 'no-reply@example.com',
          return_path: 'system@example.com'



    def welcome(email)
    @email = email
    mail(to: @email,
         bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
  end
end

