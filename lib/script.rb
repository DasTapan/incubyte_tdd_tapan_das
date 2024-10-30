class StringCalculator
    def add(input)
        if input.empty?
            0
        else
            nums = input.split(/[\n,]/)
            nums.reduce(0) {|sum,n| sum + n.to_i}
        end
    end
end