# 勢いで書いたので読みづらくて大変申し訳無い
# AAをtopとbottomで別けてることに意味はありません、、、
require './picture'

tops = $tops
bottoms = $bottoms

cols = `tput cols`.to_i

[tops, bottoms].each do |list|
  list.each do |arr|
    arr.map! do |str|
      (' ' * cols) + str
    end
  end
end

height = tops[0].size + bottoms[0].size

count = bottoms[0][0].size
(count * 10).times do |i|
  num = (i / 10) % 4
  tops[num].each do |str|
    puts str[0..(cols - 1)]
  end
  bottoms[num].each do |str|
    puts str[0..(cols - 1)]
  end

  printf "\e[#{height}A"
  $stdout.flush

  [tops, bottoms].each do |list|
    list.each do |arr|
      arr.map! do |str|
        str += str[0]
        str.slice!(0)
        str
      end
    end
  end

  sleep 0.02
end
