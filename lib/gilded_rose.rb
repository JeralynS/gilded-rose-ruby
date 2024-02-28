module GildedRose

  def self.new(name, quality, days_remaining)
    klass_for(name).new(quality, days_remaining)
  end

  def self.klass_for(name)
    case name
    when "Normal Item"
      Normal
    when "Aged Brie"
      Brie
    when "Sulfuras, Hand of Ragnaros"
      Sulfuras
    when "Backstage passes to a TAFKAL80ETC concert"
      Backstage
    end
  end
end

  class Item
    attr_reader :days_remaining, :quality

    def initialize(days_remaining:, quality:)
      @days_remaining = days_remaining
      @quality = quality
    end
  end


  class Normal < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Sulfuras < Item
    def tick
    end
  end

  class Backstage < Item
    def tick
      @days_remaining -= 1
      return              if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end
