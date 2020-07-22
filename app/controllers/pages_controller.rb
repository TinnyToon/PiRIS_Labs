class PagesController < ApplicationController
  def about
    @text = 'Банковский день успешно закрыт!'
    @deposit = Deposit.all
    # @deposit.percentSum = 0

    @deposit.each do |deposit|
      sum = (deposit.sumOfDeposit + deposit.percentSum) * (deposit.percent.to_f / 100.0)
      sum += deposit.percentSum
      deposit.update(:percentSum => sum)
    end
  end
end
