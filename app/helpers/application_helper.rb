module ApplicationHelper
  def to_currency(amount_cents, currency = "$")
    currency + (amount_cents / 100.to_f).round(2).to_s
  end
end
