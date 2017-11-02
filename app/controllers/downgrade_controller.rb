class DowngradeController < ApplicationController
  def new
  end

  def create
    current_user.standard!
    current_user.wikis.each do |pub|
      pub.update_attribute(:private, false)
    end

    flash[:notice] = "Your account has been downgraded to a standard account. Your private wikis are now public. You will recieve a $15.00 refund."
    redirect_to root_path
  end
end
