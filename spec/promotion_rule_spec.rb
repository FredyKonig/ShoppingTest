describe PromotionRule do

subject { PromotionRule.new(PromotionRule::MULTIBUY_LAVENDER) }


  describe 'initializing with multibuy' do
    it 'should start with multibuy type' do
      expect(subject.rule_type).to eq(1)
    end

    it 'should start with multibuy discounted price' do
      expect(subject.discounted_product_price).to eq(8.50)
    end
  end
end

describe PromotionRule do

subject { PromotionRule.new(PromotionRule::TEN_OVER_SIXTY_POUNDS) }


  describe 'initializing with overall discount' do
    it 'should start with overall discount type' do
      expect(subject.rule_type).to eq(2)
    end

    it 'should start with multibuy discounted price of null' do
      expect(subject.discounted_product_price).to eq(nil)
    end
 end
end
