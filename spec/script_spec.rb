require './lib/script'

describe StringCalculator do
    describe "#add" do
        string_calculator = StringCalculator.new
        it "returns 0 in case of empty string" do
            expect(string_calculator.add("")).to eql(0)
        end

        it "returns the number in case of single number" do
            expect(string_calculator.add("22")).to eql(22)
        end

        it "returns the sum of two numbers separated by comma" do
            expect(string_calculator.add("100,1")).to eql(101)
        end

        it "returns the sum of unknown amount of numbers" do
            expect(string_calculator.add("10,2,0,4")).to eql(16)
        end
    end
end