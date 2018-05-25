class UserMailer < ApplicationMailer
    def welcome_email(order)
      mail(to: order.email, subject: 'Welcome to My Awesome Site')
    end
end