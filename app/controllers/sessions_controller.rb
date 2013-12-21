class SessionsController < ApplicationController
  def new       # wyswietli formularz do logowania
  end

  def create                                      # przyjmnie parametry z tego formularza
    client = Client.find_by_email(params[:email]) # szukam klienta po emailu
    if client && client.authenticate(params[:password])
      session[:client_id] = client.id
      redirect_to client_accounts_path(client), notice: 'Witamy :) '
    else
      flash.now.alert 'Niestety :('
      render action: 'new'
    end
  end

  def destroy   # pozwoli wylogowac uzytkownika
    session[:client_id] = nil                         # czyszcze sessjie
    redirect_to root_path, notice: 'Do zobaczenia...' # przekierowuje na główną strone serwisu
  end

end
