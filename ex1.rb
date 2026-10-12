puts "Малісевич Віталій Варіант 23"
print "Введіть номер завдання (1-4): "
choice = gets.to_i

def example1()
  puts "Завдання 1 - Обчислити середнє геометричне двох додатних чисел"
  print "Введіть число a: "
  a = gets.to_f
  print "Введіть число b: "
  b = gets.to_f

  if a <= 0 || b <= 0
    puts "ПОМИЛКА! числа повинні бути додатніми"
    return nil
  end

  Math.sqrt(a * b)

  result = geometric(a, b)

  puts "Відповідь: " + result.to_s
end

def example2()
  puts "Завдання 2 - Створити масив із 10 випадкових чисел від -10 до 10. Замінити всі числа менше 0 на значення -
1"
  # або numbers = Array.new(10) {rand(-10..10)}

  numbers = []
  for i in 0..9
    # або numbers[i] = rand(-10..10)
    numbers << rand(-10..10)
  end
  puts "Оригінальний масив"
  p numbers

  # або modified = numbers.map { |x| x < 0 ? -1 : x }
  modified = numbers

  for i in 0..9
    if modified[i] < 0
      modified[i] = -1
    end
  end
  puts "Модифікований масив"
  p modified
end
def example3()
  puts "Завдання 3 - Порахувати суму квадратів елементів масиву. Написати двома способами: через sum { |x| x**2
} та через map + reduce"

  numbers = Array.new(10) { rand(10) }
  puts "Оригінальний масив"
  p numbers


  print "Введіть номер способу (1 - 2): "
  choice1 = gets.to_i
  case choice1
  when 1
    puts "Спосіб 1"
    sum = numbers.sum { |x| x ** 2 }
    puts "Модифікований за способом 1"
    p sum

  when 2
    puts "Спосіб 2"
    sum = numbers.map { |x| x ** 2 }.reduce(0) { |acc, x| acc + x }
    puts "Модифікований за способом 2"
    p sum
    else
    puts "ПОМИЛКА! невідомий номер способу"
    nil
  end
end
def example4()
  puts "Завдання 4 - Є масив спортсменів: [{name: ..., age: 22, sport: Tennis}, ...]. Згрупувати спортсменів за видом
спорту та обчислити середній вік для кожного виду спорту."

  people = [
    { name: "Андрій", age: 22, sport: "Теніс" },
    { name: "Олена", age: 28, sport: "Теніс" },
    { name: "Олег", age: 19, sport: "Футбол" },
    { name: "Марія", age: 25, sport: "Футбол" },
    { name: "Ігор", age: 24, sport: "Футбол" },
    { name: "Анна", age: 21, sport: "Плавання" }
  ]
  grouped = people.group_by { |a| a[:sport] }

  puts "Результати по видах спорту:"
  p grouped
  grouped.each do |sport, team|
    total_age = team.sum { |a| a[:age] }
    avg_age = total_age.fdiv(team.size).round(1)

    puts "Вид спорту: " + sport.to_s
    puts "  • Спортсмени: #{team.map { |a| a[:name] }.join(', ')}"
    puts "  • Середній вік: " + avg_age.to_s + " років"
    puts "-" * 40
  end
end

case choice
when 1
  example1()
when 2
  example2()
when 3
  example3()
when 4
  example4()
else
  puts "ПОМИЛКА! Невідомий номер завдання"
  nil
end