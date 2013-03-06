module ShoppingList

  class List

    attr_accessor :items, :name, :location, :directory

    def initialize(name)
      $directory  = FileUtils.mkdir_p((File.expand_path '~/Dropbox/ShoppingList')).join
      File.new "#{$directory}/#{@name}"

      @name       = name
      @location   = "#{$directory}/#{@name}"
      @items      = $holding_list
    end

    def list_to_hash
      {name: self.name, location: self.location, items: self.items}
    end

    def save
      File.open(@location, 'w') do |f|
        f.write YAML.dump(@items)
      end
    end


  end

end


