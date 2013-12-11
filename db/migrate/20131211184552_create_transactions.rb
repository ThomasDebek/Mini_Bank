class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :account, index: true, null: false # klucz nie moze byc pusty
      t.integer :amount,                  null: false # kwota nie moze byc pusta
      t.string :descr,                    null: false # opis nie moze byc pusty

      t.timestamps
    end
  end
end
