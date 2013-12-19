class AccountsController < ApplicationController

  before_filter :find_client
  before_filter :find_account, only: [:show, :destroy]

  def index
    @accounts = @client.accounts.order('id')
  end

  def show                                      # zostaje bo musze miec podgląd na konto
  end

  def create                                    # Wykorzynik po to ze jak cos nie zadziala
    @client.accounts.create!                    # dostaniemy wyjątek i bede wiedzial ze cos nie gra
    redirect_to client_accounts_path(@client)
  end

  def destroy
    @account.destroy                            # po usunieciu kont klienta
    redirect_to client_accounts_path(@client)   # przekierowuje sie do listy klientow
  end

  private
  def find_client
    @client = Client.find(params[:client_id])
  end
  def find_account
    @account = @client.accounts.find(params[:id])
  end
end
