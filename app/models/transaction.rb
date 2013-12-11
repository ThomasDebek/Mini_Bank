class Transaction < ActiveRecord::Base
  belongs_to :account

  after_save :update_account_balance                    # zaktualizuje saldo na rachunku

  validates :descr, presence: true                      # b.wany manewr - w opisie musi byc cos wpisane, nie moze byc puste
  validates :amount, numericality: {only_integer: true} # kwota musi byc liczbą calkowitą


  protected
  def update_account_balance                            # to obiekt konta ma sobie zaktualizowac bd
      account.update_balance!                           # dalem wykrzyknik dlatego ze to operacja zmienia bd
  end

end
