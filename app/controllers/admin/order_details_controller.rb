class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)

    if
      order_detail.make_status == "seisaku"
      order_detail.order.update(status: "sakusei")
    else
      sum = 0
      @order_details = order_detail.order.order_details
      @order_details.each do |order_detail|
        if
          order_detail.make_status == "seisakuok"
          sum += 1
        end
      end
      if
        @order_details.count == sum
        order_detail.order.update(status: "hassoumae")
      end
    end

    redirect_to admin_order_path(order_detail.order_id)
  end

end

  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end