
describe Checkout do 

 ProductStub = Struct.new(:code, :name, :price)
 
  subject { Checkout.new }


  describe 'initializing' do
    it 'should start with empty total' do
      expect(subject.total).to eq(0.0)
    end

  end

   context 'without promotion' do

       describe 'scanning products' do
      let(:product) { ProductStub.new('001', 'Lavender heart', 9.25) }
      let(:product2) { ProductStub.new('002', 'Personalised cufflinks', 45.00) }
      let(:product3) { ProductStub.new('003', 'Kids T-shirt', 19.95) }
      
      it 'should calculate total price' do
        subject.scan(product)
        expect(subject.total).to eq(9.25)
      end

      it 'should calculate total of the cumulative product prices' do
        subject.scan(product)
        subject.scan(product2)
         subject.scan(product)
        expect(subject.total).to eq(63.50)
      end

      it 'should round total to two decimal places' do
        product = ProductStub.new('001', 'Lavender heart', 9.252)
        subject.scan(product)
        expect(subject.total).to eq(9.25)
      end
      
     end

    end

    context 'with promotion' do
      
      describe 'scanning products' do
        let(:product) { ProductStub.new('001', 'Lavender heart', 9.25) }
        let(:product2) { ProductStub.new('002', 'Personalised cufflinks', 45.00) }
        let(:product3) { ProductStub.new('003', 'Kids T-shirt', 19.95) }
      
        it 'should calculate total price' do
        	subject.add_rule(1)
          subject.scan(product)
          expect(subject.total).to eq(9.25)
        end

       it 'should calculate total reflecting multibuy' do
       	 subject.add_rule(1)
         subject.scan(product)
         subject.scan(product2)
         subject.scan(product)
         subject.scan(product)
         expect(subject.total).to eq(70.50)
       end

        it 'should calculate total reflecting discount rate' do
       	 subject.add_rule(2)
         subject.scan(product)
         subject.scan(product2)
         subject.scan(product)
         subject.scan(product)
         expect(subject.total).to eq(65.47)
       end

       it 'should calculate total reflecting multibuy and discount rate' do
       	 subject.add_rule(1)
       	 subject.add_rule(2)
         subject.scan(product)
         subject.scan(product2)
         subject.scan(product)
         subject.scan(product)
         expect(subject.total).to eq(63.45)
       end
      end  
	end

 context 'reflecting multibuy and discount rate test example' do
      
      describe 'scanning products' do
        let(:product) { ProductStub.new('001', 'Lavender heart', 9.25) }
        let(:product2) { ProductStub.new('002', 'Personalised cufflinks', 45.00) }
        let(:product3) { ProductStub.new('003', 'Kids T-shirt', 19.95) }
      
       
       it 'should calculate total reflecting multibuy and discount rate for the 1st example' do
       	 subject.add_rule(1)
       	 subject.add_rule(2)
         subject.scan(product)
         subject.scan(product2)
         subject.scan(product3)
         expect(subject.total).to eq(66.78)
       end

       it 'should calculate total reflecting multibuy and discount rate for the 2nd example' do
       	 subject.add_rule(1)
       	 subject.add_rule(2)
         subject.scan(product)
         subject.scan(product3)
         subject.scan(product)
         expect(subject.total).to eq(36.95)
       end

       it 'should calculate total reflecting multibuy and discount rate for the 3rd example' do
       	 subject.add_rule(1)
       	 subject.add_rule(2)
         subject.scan(product)
         subject.scan(product2)
         subject.scan(product)
         subject.scan(product3)
         expect(subject.total).to eq(73.75)
       end
      end  
	end

end