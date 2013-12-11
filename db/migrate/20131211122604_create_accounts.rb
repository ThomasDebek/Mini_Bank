class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|                                 # client_id nie moze byc pusty bo nie bedzie
      t.references :client, index: true, null: false              # wiedzial do kogo nalrzy konto
      t.integer :number,                 null: false              # nr. takze nie moze byc pusty
      t.integer :balance,                null: false, default: 0  # saldo także i wartosc domyslna ustawiamy na 0

      t.timestamps
    end
  end
end
