class CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(params[:customer])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_customer_registration
  end
end
