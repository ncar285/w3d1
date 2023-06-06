
class Array

    def my_each(&block)
        count = 0
        
        self.length.times do
           block.call(self[count])
            count += 1
        end
        self
    end

    def my_select(&block)
        result_arr = [] 
        self.my_each {|ele| result_arr << ele if block.call (ele)}
        result_arr
    end

    def my_reject(&block)
        result_arr = [] 
        self.my_each {|ele| result_arr << ele if !block.call (ele)}
        result_arr
    end

    def my_any?(&block)
        self.my_each do |ele|
            return true if block.call(ele)
        end
        return false
    end

    def my_all?(&block)
        self.my_each do |ele|
            return false if !block.call(ele)
        end
        return true
    end

    # def my_flatten    # [1 , 2, [5, [5, 5], 7 ]]
    #     # flattened = []
    #     return [self] if !self.is_a?(Array)   #  [5, 5]
    #     flattened = []          

    #    # [] + []

    #     self.each{|ele| flattened +=  ele.my_flatten }   #[7]  +=   [5, [5, 5], 7 ].my_flatten ele.my_flatten
    #     return flattened

    # end


    # def my_flatten(self)
    #     return [self] if !data.is_a?(Array)
    #     flattened = []          
    #     self.each{|ele| flattened +=  my_flatten(ele)}
    #     flattened
    # end



    def my_flatten
        flattened = []          
        self.my_each do |ele| 
            if ele.is_a?(Array)
                flattened +=  ele.my_flatten
            else
                 flattened << ele
            end
        end
        flattened
    end

    def my_zip(*args)
        result_arr = []
        
        (0...self.length).each do |i|
            result_arr << [self[i]] + args.map { |arr| arr[i] }.flatten
        end
        result_arr
    end

    def my_rotate(num =1)
        temp = self
        if num > 0
           num.times { temp = temp[1..-1] + [temp[0]] }
        else
            -1 * num.times { temp = [temp[-1]] + temp[0..-2]}
        end
        temp

    end









    
end

"""

[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

[1, 2, [3, [4,5]]].my_flatten

load 'enumerables_array.rb'
my_flatten(   [1, 2, [3, [4,5]]]   )

load 'enumerables_array.rb'
"""