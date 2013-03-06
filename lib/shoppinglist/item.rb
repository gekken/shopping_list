module ShoppingList

  class Item

    attr_accessor :name, :store, :amount, :category

    def initialize(name, amount=1, category='none', location='none')
      @amount = amount
      @name = name
      @store = location
      @category = category
    end

    def to_hash
      {name: self.name, amount: self.amount, store: self.store, category: self.category}
    end

    def add_to_list
      $holding_list << self
    end

  end

end
