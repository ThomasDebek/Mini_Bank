class Transaction < ActiveRecord::Base
  belongs_to :account
                                      # b.wany manewr
  validates :descr, presence: true    # w opisie musi byc cos wpisane, nie moze byc puste
  validates :amount, numericality: { only_integer: true }  # kwota musi byc liczbą calkowitą

end
