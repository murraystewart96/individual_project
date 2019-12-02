require('pry')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/user')


Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()
User.delete_all()



merchant_info_1 = {
  'name' => 'Tesco'
}

merchant_info_2 = {
  'name' => 'Waitrose'
}

merchant_info_3 = {
  'name' => 'Bank of Scotland'
}

tesco = Merchant.new(merchant_info_1)
tesco.save()
waitrose = Merchant.new(merchant_info_2)
waitrose.save()
bank_of_scotland = Merchant.new(merchant_info_3)
bank_of_scotland.save()


tag_info_1 = {
  'name' => 'groceries'
}

tag_info_2 = {
  'name' => 'banking'
}

groceries = Tag.new(tag_info_1)
groceries.save()

banking = Tag.new(tag_info_2)
banking.save()


transaction_info_1 = {
  'description' => 'weekly shop',
  'amount' => 100,
  'merchant_id' => tesco.id,
  'tag_id' => groceries.id
}

transaction_info_2 = {
  'description' => 'weeklend shop',
  'amount' => 30,
  'merchant_id' => waitrose.id,
  'tag_id' => groceries.id
}

transaction_info_3 = {
  'description' => 'paying back loan',
  'amount' => 300,
  'merchant_id' => bank_of_scotland.id,
  'tag_id' => banking.id,
}

transaction1 = Transaction.new(transaction_info_1)
transaction1.save()
transaction1.save()
transaction2 = Transaction.new(transaction_info_2)
transaction2.save()
transaction2.save()
transaction3 = Transaction.new(transaction_info_3)
transaction3.save()
transaction3.save()

transactions = [transaction1, transaction2, transaction3]


for n in 1...50
  rand_num = rand(0..2)
  rand_month = rand(1..12)
  transactions[rand_num].save()

  if (rand_month < 10)
    transactions[rand_num].update_timestamp("2019-0#{rand_month}-01 15:37:08.159519")
  else
    transactions[rand_num].update_timestamp("2019-#{rand_month}-01 15:37:08.159519")
  end
end


transaction3.update_timestamp('2019-07-01 15:37:08.159519')

user_info = {
  'first_name' => 'Scrooge',
  'last_name' => 'McDuck',
  'balance_warning' => 100
}

user = User.new(user_info)
user.save()
user.first_name = "changed"
user.balance = 300
user.update()

binding.pry

nil
