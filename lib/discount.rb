class Discount
  attr_reader :type
	
	def initialize(rule_type)
        @type = rule_type
  end

  def calculate_discount(product_items,total)
  	if (@type == PromotionRule::MULTIBUY_LAVENDER)
	      calculate_multibuy(product_items)
  	elsif (@type == PromotionRule::TEN_OVER_SIXTY_POUNDS)
        calculate_rate_discount(total).round(2)
  	else
  		  0.00
    end
  end
 
 #Multibuy product gives reduced price on all same product.  
  def calculate_multibuy(product_items)
      rule = PromotionRule.new(PromotionRule::MULTIBUY_LAVENDER)
       
      multibuy_discount=0.00
      number=0
      product_items.each do |product|
         if product.code == rule.product_code
          multibuy_discount += (product.price- rule.discounted_product_price)
          number+=1
         end
       end
      multibuy_discount = 0.00 if (number<rule.minimum_product)
      multibuy_discount
  end

  #minimum spend give discount in percentage over total value.
   def calculate_rate_discount(total)
       rule = PromotionRule.new(PromotionRule::TEN_OVER_SIXTY_POUNDS)
      
       rate_discount = 0.00
       rate_discount = (total * rule.discount_rate / 100 ) if (total >= rule.minimum_spend)
       
       rate_discount
   end

  end

  			

