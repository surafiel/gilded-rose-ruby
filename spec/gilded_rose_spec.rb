require "spec_helper"
require_relative "../lib/gilded_rose"

RSpec.describe GildedRose do
  subject(:gilded_rose) { described_class.new(name: name, days_remaining: days_remaining, quality: quality) }

  describe "#tick" do
    context "Normal Item" do
      let(:name) { "Normal Item" }

      it "before sell date" do
        gilded_rose.tick
        expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 9)
      end

      it "on sell date" do
        gilded_rose.tick
        expect(gilded_rose).to have_attributes(days_remaining: -1, quality: 8)
      end

      it "after sell date" do
        gilded_rose.tick
        expect(gilded_rose).to have_attributes(days_remaining: -11, quality: 8)
      end

      it "of zero quality" do
        gilded_rose = described_class.new(name: "Normal Item", days_remaining: 5, quality: 0)
        gilded_rose.tick
        expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 0)
      end
    end

    context "Aged Brie" do
      let(:name) { "Aged Brie" }

      it "before sell date" do
        gilded_rose.tick
        expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 11)
      end

      # Other test cases for Aged Brie...
    end

    # Other contexts and test cases...

    context "Conjured Mana" do
      let(:name) { "Conjured Mana Cake" }

      xit "before sell date" do
        gilded_rose.tick
        expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 8)
      end

      # Other test cases for Conjured Mana...
    end
  end
end