require "pry"

class Transfer
  attr_accessor :amount
  attr_reader :sender, :status, :receiver

  def initialize(sender,receiver,amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  # binding.pry
  def valid?
    return (@sender.valid? && @receiver.valid?) ? true : false
  end

  def execute_transaction
    if @status == "pending" && @sender.valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif !@sender.valid? || @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
