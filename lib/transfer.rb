class Transfer

  attr_accessor :amount, :acc_sender, :acc_receiver
  
  def initialize(sender, receiver ,status = "pending", amount)
    @status = status
    # @acc_receiver = acc_receiver
    # @acc_sender = acc_sender
    @amount = amount
    @acc_sender = BankAccount.new(sender)
    @acc_receiver = BankAccount.new(receiver)
    
  end

  def valid?
    @acc_receiver.valid? && @acc_sender.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      @acc_sender.balance -= @amount
      @acc_receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @acc_sender.balance += @amount
      @acc_receiver.balance -= @amount
    end
  end


  # def account(sender,receiver)
  #   acc_sender = BankAccount.new(sender)
  #   acc_receiver = BankAccount.new(receiver)

  # end

  


end
