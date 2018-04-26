

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount=0)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if Transfer.all.include?(self)
        "Transfer rejected. Please check your account balance."
    elsif !self.valid?
        "Transfer rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      if @sender.valid?
        @status = "complete"
        @@all << self
      else
        @status = "rejected"
        self.reverse_transfer
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def self.all
    @@all
  end

  def reverse_transfer
    if Transfer.all.include?(self)
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
