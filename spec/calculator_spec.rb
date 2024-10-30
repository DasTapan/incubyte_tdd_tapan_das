require './lib/calculator'

describe Calculator do
    describe "#add" do
        it "returns sum of two numbers" do
            calculator = Calculator.new
            expect(calculator.add(20,30)).to eql(50)
        end
    end
end