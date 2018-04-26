require 'pry'

require_relative 'bank_account.rb'
require_relative 'transfer.rb'


steve = BankAccount.new("Steve")
jamie = BankAccount.new("Jamie")
bob = BankAccount.new("Bob")
guy = BankAccount.new("Guy")
transfer = Transfer.new(steve, jamie, 50)
same_transfer = Transfer.new(steve, jamie, 50)

binding.pry

true
