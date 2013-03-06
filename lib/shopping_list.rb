$: << File.dirname(__FILE__)


require 'yaml'
require 'shoppinglist/version'
require 'shoppinglist/list'
require 'shoppinglist/item'


module ShoppingList
  $holding_list = []
end
