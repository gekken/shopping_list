$: << File.dirname(__FILE__)


require 'yaml'
require 'shoppinglist/version'
require 'shoppinglist/list'
require 'shoppinglist/item'


module ShoppingList

  $holding_list = []

  def self.load! list
    $holding_list = YAML.load(File.read(File.expand_path "~/Dropbox/ShoppingList/#{list}"))
  end

  def self.search name

  end


end
