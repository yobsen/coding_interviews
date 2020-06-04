class KoreanNumerals

NUMERALS = [
  ['오백삼십조칠천팔백구십만천오백삼십구', '삼조사천이만삼천구'],
  ['육십사억삼천십팔만칠천육백구', '사십삼'],
  ['구백육십조칠천억팔천백삼십이만칠천일', '사십삼조오천이백억육천구백십만일'],
  ['이천구백육십조천오백칠십만삼천구백구십', '삼천사백오십조일억이천만육백사십삼'],
  ['사십오억삼천육십만오백구십', '칠십억천이백삼십오만칠천구십이'],
  ['천백십일', '구천오백구십구'],
  ['오억사천', '백십일'],
  ['일조', '삼'],
  ['일억', '만']
]

UNITS = [1000000000000, 100000000, 10000]

VALUE_OF_UNIT = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

KNS = {
  '조' => 1000000000000,
  '억' => 100000000,
  '만' => 10000, 
  '천' => 1000,
  '백' => 100,
  '십' => 10,
  '영' => 0,
  '일' => 1,
  '이' => 2,
  '삼' => 3,
  '사' => 4, 
  '오' => 5, 
  '육' => 6, 
  '칠' => 7, 
  '팔' => 8, 
  '구' => 9
}

  def initialize
    @numbers = []
  end  

  def symbol_to_number(hieroglyph)
    KNS.map do |symbol, number|
      return @numbers.push(number) if symbol == hieroglyph 
    end
  end

  def word_to_numbers(word)
    word.split('').map do |letter|
      symbol_to_number(letter)
    end
  end

  def split_by_unit
    return @numbers[0] if @numbers.length == 1 

    numbers_by_unit = []
    current_unit = 0
    @numbers.each_with_index do |number, index| 
      if UNITS.include?(number) && index > 1 
        values_of_unit = @numbers[current_unit..index - 1]
        multiplied_numbers = sum_numbers_by_unit(values_of_unit, number)
        numbers_by_unit.push(multiplied_numbers)
        current_unit = index + 1
      elsif UNITS.include?(number) && index == 0
        numbers_by_unit.push(number)
        current_unit = index + 1
      elsif UNITS.include?(number) && index == 1
        numbers_by_unit.push(@numbers[index - 1] * number)
        current_unit = index + 1
      end  
    end

    if current_unit != @numbers.length
      residue = @numbers[current_unit..@numbers.length]
      multiplied_residue = sum_numbers(residue)
      numbers_by_unit.push(multiplied_residue)
    end

    numbers_by_unit.reduce(0, :+)
  end

  def sum_numbers_by_unit(numbers, unit)
    sum_numbers(numbers) * unit
  end

  def sum_numbers(numbers)
    return numbers[0] if numbers.length == 1
    multiplied_numbers = []
    numbers.each_with_index do |number, index| 
      if VALUE_OF_UNIT.include?(number) && !numbers[index + 1].nil? 
        multiplied_numbers.push(number * numbers[index + 1])
      elsif is_unit_in_the_beginning(number, index) || is_unit_in_the_center_without_unit(numbers, number, index) || is_unit_or_unit_in_the_end(numbers, index) 
        multiplied_numbers.push(number)
      end
    end  

    multiplied_numbers.reduce(0, :+)
  end

  def is_unit_in_the_beginning(number, index)
    return index == 0 && !VALUE_OF_UNIT.include?(number)
  end 
   
  def is_unit_in_the_center_without_unit(numbers, number, index)
    return !VALUE_OF_UNIT.include?(number) && !VALUE_OF_UNIT.include?(numbers[index-1]) && !numbers[index-1].nil?
  end

  def is_unit_or_unit_in_the_end(numbers, index)
    return index == numbers.length - 1 && !VALUE_OF_UNIT.include?(numbers[index-1])
  end

  def transform_numeral_into_number(numeral)
    numeral_object = KoreanNumerals.new
    numeral_object.word_to_numbers(numeral)
    numeral_object.split_by_unit
  end

  def transform_numerals
    sums_of_numbers = []
    flatten_numerals = NUMERALS.flatten
    flatten_numerals.each_with_index do |numeral, index|
      if index.even?
        sum = transform_numeral_into_number(numeral) + transform_numeral_into_number(flatten_numerals[index + 1])
        sums_of_numbers.push(sum)
      end
    end
    print sums_of_numbers
  end      
end  

numerals = KoreanNumerals.new
numerals.transform_numerals

# word = KoreanNumerals.new
# word.word_to_numbers('삼천사백오십조일억이천만육백사십삼')
# word.split_by_unit
