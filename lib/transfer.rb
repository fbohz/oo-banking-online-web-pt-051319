class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    #order here important according to params order above
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
    
  def valid?
    @sender.valid? && @receiver.valid? ? true : false 
  end 
  
  def execute_transaction
    if @status == "pending" && @sender.balance > @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
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
