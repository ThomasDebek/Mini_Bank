module ApplicationHelper
  def money(amount, currency='zl')  #metoda bedzie przyjmowala dwa parametry
    "#{amount} #{currency }"        # zlotowki and kwota

  end
end
