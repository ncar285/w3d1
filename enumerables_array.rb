
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

    def my_flatten
        return self[] if self.empty?
            return self.pop + self.my_flatten
            
    end


   

    
end