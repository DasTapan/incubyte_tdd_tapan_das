require './lib/script'

describe StringCalculator do
    describe "#add" do
        string_calculator = StringCalculator.new
        # one
        it "returns 0 in case of empty string" do
            expect(string_calculator.add("")).to eql(0)
        end
        # two
        it "returns the number in case of single number" do
            expect(string_calculator.add("22")).to eql(22)
        end
        # three
        it "returns the sum of two numbers separated by comma" do
            expect(string_calculator.add("100,1")).to eql(101)
        end
        # four
        it "returns the sum of two numbers separated by new line" do 
            expect(string_calculator.add("12\n2")).to eql(14)
        end
        # five
        it "returns the sum of unknown amount of numbers" do
            expect(string_calculator.add("10,2,0,4")).to eql(16)
        end
        # six
        it "returns the sum of numbers separated by comma or new line" do
            expect(string_calculator.add("1\n2,3,4")).to eql(10)
        end
        # seven
        it "returns the sum with a custom delimiter" do
            expect(string_calculator.add("//;\n1;2")).to eql(3)
        end
        # eight
        it "returns the sum with custom delimiter and new line" do
            expect(string_calculator.add("//;\n10;20\n10;0\n5;5")).to eql(50)
        end
        # nine
        it "throws exception if a negative number is passed" do 
            expect {string_calculator.add("12,-5,3")}.
            to raise_error(ArgumentError, "negative number not allowed, -5")
        end
        # ten
        it "show multiple negative numbers in exception" do 
            expect {string_calculator.add("12,-3,20,-5,3,-2,-3")}.
            to raise_error(ArgumentError, "negative numbers found, -3,-5,-2,-3")
        end

        it "returns how many time #add is invoked" do
            expect(string_calculator.times_add_invoked).to eql(10)
        end
    end
end