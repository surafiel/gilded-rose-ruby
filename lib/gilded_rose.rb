class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    update_quality
    update_days_remaining unless sulfuras?
  end

  private

  def update_quality
    return if sulfuras?

    case @name
    when "Aged Brie"
      increase_quality
    when "Backstage passes to a TAFKAL80ETC concert"
      increase_quality
      increase_quality if @days_remaining < 11
      increase_quality if @days_remaining < 6
    else
      decrease_quality
    end
  end

  def update_days_remaining
    @days_remaining -= 1
  end

  def sulfuras?
    @name == "Sulfuras, Hand of Ragnaros"
  end

  def increase_quality
    @quality = [@quality + 1, 50].min
  end

  def decrease_quality
    @quality -= 1 if @quality.positive?
  end
end