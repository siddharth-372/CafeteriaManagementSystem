class Order < ApplicationRecord
  def date_ordered
    data_ordered
  end

  def first_name
    customerdata = who.eql?("user") ? User.find(buyer_id) : Clerk.find(buyer_id)
    customerdata.first_name
  end

  def get_total_price
    total_price
  end
end
