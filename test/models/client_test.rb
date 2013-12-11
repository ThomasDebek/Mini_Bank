require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "valid" do                        # spr. czy wystepuje walidacjia
    c = Client.new                       # tworzymy klienta
    assert_equal false, c.valid?         # assercja oczekuj false
    assert c.invalid?                    # drugi sposób zapisu
  end

  test "name, surname presence" do       # spr. czy imie i naz.. nie jest puste
    c = Client.new
    c.valid?
    assert c.errors[:name].any?          # spr czy sa bledy na imieniu
    assert c.errors[:surname].any?       # i nazwisku
    c.name = 'Jan'
    c.surname = 'Kowalski'
    c.valid?
    assert c.errors[:name].empty?        # spr. czy nie są puste
    assert c.errors[:surname].empty?
  end

  test "to_s" do                              # przetestujmy metode to_s
    c = Client.create(name:'Jan',             # upewnijmy sie ze w nawiasach
                      surname:'Nowak',        # bedzie wstawiona jaks liczba
                      email: 'jan@wp.pl',
                      phone: '234-234-234')
     assert_match /Jan Nowak \(\d+\)/, c.to_s # assrcja korzystająca z wyrazenia reguralnego
  end

end
