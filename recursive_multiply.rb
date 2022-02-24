require 'test/unit'
extend Test::Unit::Assertions

def multiply(x,y)
 
    # 0 multiplied with any number is still 0
    if y == 0
        return 0
    end
 
    # Add x one by one
    if y > 0
        return (x + multiply(x, y - 1))
    end
 
    # The case where y is negative
    if y < 0
        return -multiply(x, -y)
    end
    
end


assert_equal(multiply(6, 9), 54, 'Wrong Product')
assert_equal(multiply(6, -9), -54, 'Product must be Negative.')
assert_equal(multiply(-6, 9), -54, 'Product must be Negative.')
assert_equal(multiply(-69, 0), 0, 'Product must be 0.')
assert_equal(multiply(0, 69), 0, 'Product must be 0.')
