class StringCalculator
    def add(input)
        if input.empty?
            0
        else
            if input.start_with?("//")
                custom_delimiter = input[2]
                input_copy = input.slice(4,input.length)
                nums = input_copy.split(/[\n#{Regexp.escape(custom_delimiter)}]/)
                get_sum(nums)
            else
                nums = input.split(/[\n,]/)
                get_sum(nums)
            end
        end
    end

    private

    def get_sum(nums)
        nums_copy = nums.dup.map {|n| n.to_i}
        nums_copy.reduce(0) do |sum,n|
            unless n >= 0
                raise ArgumentError.new("negative number not allowed, #{n}")
            else
                sum + n
            end
        end            
    end    
end
