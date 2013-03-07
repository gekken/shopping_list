$: << File.dirname(__FILE__)


require 'yaml'
require 'find'
require 'shoppinglist/version'
require 'shoppinglist/list'
require 'shoppinglist/item'


module ShoppingList

  $holding_list = []


  def self.directory
    File.expand_path("~/Dropbox/ShoppingList")
  end

  def self.full_path file
    "#{directory}/#{file}"
  end

  def self.file_list
    files = []
    Find.find(directory) { |f| files << f }; files.shift
    files
  end

  def self.load! list
    $holding_list = YAML.load_file full_path(list)
  end

  def self.search item

  end


end
