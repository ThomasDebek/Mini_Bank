require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup                                        # przed kazdym testem jest wywoływana  metoda setup
     @client = Client.create!(                     # wykrzynik po to ze odrazu wywali wyjątek ze cos poszlo nie tak
         name: 'Jan', surname:'Nowak',
         email: 'jan@wp.pl', phone: '234-234-234')
  end

  test "init" do                                  # warto stworzyc test init, bo w nim tworzymy obiekt
    a = @client.accounts.new                      # i widzimy czy nie sypie jakimis wyjątakmi
  end

  test "number" do                                # spr. czy w momencie tworzenia konta ustawia sie numer
   a = @client.accounts.create!
    assert a.number.present?                      # spr. czy jest ustawiony jaki kolwiek nr
    assert a.number > 1                           # spr. cyz jest wiekszy od jeden
  end

  test "balance is zero" do                       # test w którym saldo na początku powinno miec zero
    a = @client.accounts.create!
    assert_equal 0, a.balance
  end

  test "balance validator" do                    # spr. czy moge ustawic saldo które nie jest liczbą
    a = @client.accounts.create!
    a.balance = 'ala'                            # ustawym saldo na ala
    assert a.invalid?                            # sprwdzmy walidacje
    assert a.errors[:balance].any?               # ustawine mamy bledy na saldzie
    a.balance = 1000                             # ustawiamy saldo na 1000
    assert a.valid?                              # spr. walidacie
    assert a.errors[:balance].empty?             # spr. czy nie ma bledów i powinno grac
  end

end
