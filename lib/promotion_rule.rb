class PromotionRule
	attr_reader :rule_type ,:product_code , :discounted_product_price,:minimum_product,:minimum_spend,:discount_rate

MULTIBUY_LAVENDER = 1
TEN_OVER_SIXTY_POUNDS = 2	

  def initialize(type_value)
  	     @rule_type         = type_value
         @product_code      = nil
         @discounted_product_price = nil
         @minimum_product   = nil
         @minimum_spend     = nil
         @discount_rate     = nil
	    
	if( type_value == MULTIBUY_LAVENDER)
		 @product_code      = "001"
         @discounted_product_price = 8.50
         @minimum_product   = 2
         #puts "MULTIBUY_LAVENDER"
    elsif (type_value==TEN_OVER_SIXTY_POUNDS)
    	 @minimum_spend     = 60
         @discount_rate     = 10
         #puts "TEN_OVER_SIXTY_POUNDS"
    else
    	 puts "no discount"
	end

  end
end

