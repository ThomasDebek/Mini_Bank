class ClientMailer < ActionMailer::Base
  default from: "info@minibank.com"

  def welcome(client)                            # tu chce przekazac obiekt klienta
    @client = client                             # do tego potrzebna jest zmienna klient
    mail to: client.email, subject: 'Witamy :)'  # meila bede wysylal do meila klienta

                                                 # metoda mail to metoda która renderuje mi i tworzy widok, który zaraz napisze

  end
end
