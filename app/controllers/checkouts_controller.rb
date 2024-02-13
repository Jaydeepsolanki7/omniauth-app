class CheckoutsController < ApplicationController
  def create
    
    @product = Product.find(params[:id])

    session = Stripe::Checkout::Session.create(
        # customer: current_user.stripe_customer_id,
        payment_method_types: ['card'],
        metadata: {
    
        product_id: @product.id,
        # user_id: current_user.id,
        },

        line_items: [{
          price_data: {
            currency: 'inr',
            product_data: {
              name: @product.name
            },
            unit_amount: @product.price*100,
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: root_url,
        cancel_url: root_url,
  )
  flash[:success] = "Order is completed"
  redirect_to session.url, allow_other_host: true
  end
end