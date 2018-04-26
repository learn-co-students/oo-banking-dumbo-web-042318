class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  @@all = []


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
# if result of calling valid? on receiver and sender are both true then this is true
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    id = self.transaction_id
    if self.validate_transaction == false && self.valid? == true && @sender.balance >= @amount
      @@all << id
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def transaction_id
    id = @sender.account_id + @receiver.account_id + @amount.to_s
    id
  end

  def validate_transaction
    @@all.include? self.transaction_id
  end

  def reverse_transfer
    if self.validate_transaction == true
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
