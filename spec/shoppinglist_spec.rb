require 'rspec'
require 'spec_helper'
#require 'shopping_list'

describe ShoppingList do

  list_subject = YAML.load_file(File.open(File.expand_path "~/Dropbox/ShoppingList/test_list"))
  list_subject2 = YAML.load_file(File.open(File.expand_path "~/Dropbox/ShoppingList/list"))

  it 'has a version' do
    ShoppingList::VERSION.should_not == nil
  end

  context '#load!' do
    it 'loads the list, wiping out any buffered additions' do
      $holding_list = list_subject2
      ShoppingList.load!('test_list')
      expected = $holding_list.collect {|i| i.to_hash}
      tested = list_subject.collect {|i| i.to_hash}
      tested.should == expected
    end
  end

  context '#search' do
    it 'returns the file(s) that has/have the specified item'
  end



end