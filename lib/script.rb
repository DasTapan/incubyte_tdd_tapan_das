class StringCalculator
    def add(input)
        if input.empty?
            0
        elsif input.split(",").length == 1
            input.to_i
        elsif input.split(",").length == 2
            num_one, num_two = input.split(",")
            num_one.to_i + num_two.to_i
        else
            nums = input.split(",")
            nums.reduce(0) {|sum,n| sum + n.to_i}
        end
    end
end