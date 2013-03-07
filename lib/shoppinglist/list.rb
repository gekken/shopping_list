module ShoppingList

  class List

    attr_accessor :items, :name, :location, :directory

    def initialize name=mylist
      @directory = FileUtils.mkdir_p(ShoppingList.directory).join
      File.new "#{@directory}/#{@name}"
      @name = name
      @location = "#{@directory}/#{@name}"
      @items = $holding_list

    end


    def list_to_hash
      {name: self.name, location: self.location, items: self.items}
    end



    def save
      File.open(@location, 'w') do |f|
        f.write YAML.dump(@items)
      end
    end

    def delete! name, list=@name
      things = YAML.load_file(File.open("#{@directory}/#{list}"))
      things.reject! { |i| i.name == name }
      File.open(File.expand_path("#{@directory}/#{list}"), 'w') do |f|
      File.open(File.expand_path("#{@directory}/#{list}"), 'w') do |f|
        f.write YAML.dump(things)
      end
    end




    end
  end
end






