#encoding: utf-8
class RequestType
  attr_accessor :name
  attr_accessor :code
  attr_accessor :parent

  def self.collection
    list = [
        RequestType.new(:name => 'Благоустройство', :code => 1, :parent => nil),
          RequestType.new(:name => 'Окос травы', :code => 2, :parent => 1),
          RequestType.new(:name => 'Организация вывоза КГМ', :code => 3, :parent => 1),
          RequestType.new(:name => 'Нарушение порядка вывоза мусора', :code => 4, :parent => 1),
        RequestType.new(:name => 'Сантехника', :code => 5, :parent => nil),
          RequestType.new(:name => 'Водопровод', :code => 6, :parent => 5),
          RequestType.new(:name => 'Канализация', :code => 7, :parent => 5),
          RequestType.new(:name => 'Система отопления', :code => 8, :parent => 5),
          RequestType.new(:name => 'Замена/установка счетчика', :code => 9, :parent => 5),
        RequestType.new(:name => 'Ремонт', :code => 10, :parent => nil),
          RequestType.new(:name => 'Фасад', :code => 11, :parent => 10),
          RequestType.new(:name => 'Пол', :code => 12, :parent => 10),
          RequestType.new(:name => 'Косметика', :code => 13, :parent => 10),
          RequestType.new(:name => 'Капитальный', :code => 14, :parent => 10),
        RequestType.new(:name => 'Электрика', :code => 15, :parent => nil),
          RequestType.new(:name => 'Замыкание', :code => 16, :parent => 15),
          RequestType.new(:name => 'Замена/установка счетчика', :code => 17, :parent => 15),
          RequestType.new(:name => 'Несанкционированное подключение', :code => 18, :parent => 15),
        RequestType.new(:name => 'Хочу в вашу УК!', :code => 19, :parent => nil)
    ]
    list
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
    false
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
    self.parent = hash[:parent]
  end
end