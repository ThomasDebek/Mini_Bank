class Account < ActiveRecord::Base
  belongs_to :client

                                                          # saldo musi byc wartoscia numeryczną
  validates :balance, numericality: { only_integer: true} # i tylko typ integer


  before_create :set_number

  def to_s                                                # konto zaraz bedzie mialo nr
     "[#{number}] #{balance} zl"                          # i chcemy wysietlic stan konta
  end

  protected                                               # chce zeby model sam wygenerowal sobie nr konta
  def set_number                                          # i wylosowal liczbe z tego zakresu
    self.number = rand 1_000_000_000                      # i podstawil do zmiennej
  end                                                     # ale musze uzyc collbecka przed tym

end
