class Checkout
   attr_reader :items
   def initialize(promotional_rules = [])
      @promotions = promotional_rules
      @items      = []
   end  
   
   def add_rule(rule_type)
      @promotions << rule_type
   end 

   def scan(item)
   	 @items << item
   end

   def total
      subtotal = 0.00
      @items.each do |product|
      subtotal += product.price
      end
    
     subtotal = (subtotal - get_total_discounts(subtotal)) if @promotions && @promotions.size>0
     subtotal.round(2)
   end

   def get_total_discounts(subtotal)
   	discount=0.00
      @promotions.each do |promotion|
         if [PromotionRule::MULTIBUY_LAVENDER].include? promotion
      	rebate = Discount.new(promotion)
         discount=discount+rebate.calculate_discount(@items,subtotal) 
         end
      end
      discount.round(2)
      subtotal=subtotal-discount.round(2)
      @promotions.each do |promotion|
         if [PromotionRule::TEN_OVER_SIXTY_POUNDS].include? promotion
         rebate = Discount.new(promotion)
         discount=discount+rebate.calculate_discount(@items,subtotal) 
         end
      end
       discount.round(2)
   end 
end
