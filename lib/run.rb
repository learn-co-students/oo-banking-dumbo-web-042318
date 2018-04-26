require 'pry'

require_relative 'bank_account.rb'
require_relative 'transfer.rb'


steve = BankAccount.new("Steve")
jamie = BankAccount.new("Jamie")
transfer = Transfer.new(steve, jamie, 51)

binding.pry

true
