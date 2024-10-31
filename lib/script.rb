class StringCalculator
    attr_reader :times_add_invoked
    
    def initialize
        @times_add_invoked = 0
    end

    def add(input)
        @times_add_invoked += 1

        if input.empty?
            0
        else
            if input.start_with?("//[")
                delimiter_start_index = input.split("").find_index("[")
                delimiter_end_index = input.split("").find_index("]")
                custom_delimiter_length = delimiter_end_index - delimiter_start_index - 1
                custom_delimiter = ""
                custom_delimiter_length.times do
                    custom_delimiter += input.split("")[delimiter_start_index + 1]
                end
                input_copy = input.slice(delimiter_end_index + 2, input.length)
                nums = input_copy.split(/[\n#{Regexp.escape(custom_delimiter)}]/)
                get_sum(nums)                    
            elsif input.start_with?("//")
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
        nums_copy = nums.dup.map(&:to_i).filter {|n| n <= 1000 }
        negative_numbers = nums_copy.filter {|ele| ele < 0}
        unless negative_numbers.empty?
            if negative_numbers.length == 1
                raise ArgumentError.new("negative number not allowed, #{negative_numbers.first}")
            else
                raise ArgumentError.new("negative numbers found, #{negative_numbers.join(',')}")
            end
        else
            nums_copy.reduce(0) {|sum,n| sum + n}
        end
    end    
end
