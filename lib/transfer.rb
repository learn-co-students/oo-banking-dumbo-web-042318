require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    #can check that both accounts are valid (FAILED - 14)
    #  calls on the sender and reciever's #valid? methods
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
     # can execute a successful transaction between two accounts (FAILED - 16)
     # each transfer can only happen once (FAILED - 17)
     # rejects a transfer if the sender doesn't have a valid account
     if self.valid? && self.status != "complete" && self.amount < self.sender.balance
       self.sender.balance -= self.amount
       self.receiver.balance += self.amount
       self.status = "complete"
     else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
  end

  def reverse_transfer
   # can reverse a transfer between two accounts (FAILED - 19)
   #   it can only reverse executed transfers
    if self.status == "complete"
     self.sender.balance += self.amount
     self.receiver.balance -= self.amount
     self.status = "reversed"
   end
  end
end
