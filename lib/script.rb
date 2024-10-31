class StringCalculator
    def add(input)
        if input.empty?
            0
        else
            if input.start_with?("//")
                custom_delimiter = input[2]
                input_copy = input.slice(4,input.length)
                nums = input_copy.split(custom_delimiter)
                nums.reduce(0) {|sum,n| sum + n.to_i}
            else
                nums = input.split(/[\n,]/)
                nums.reduce(0) {|sum,n| sum + n.to_i}
            end
        end
    end
end