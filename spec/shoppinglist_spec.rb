require 'spec_helper'

describe ShoppingList do

  list_subject = YAML.load_file (ShoppingList.full_path 'test_list')
  list_subject2 = YAML.load_file (ShoppingList.full_path 'list')

  it 'has a version' do
    ShoppingList::VERSION.should_not == nil
  end

  context '#directory' do
    it 'returns the default directory' do
      ShoppingList.directory.should == File.expand_path("~/Dropbox/ShoppingList")
    end
  end

  context '#full_path' do
    it 'calls #directory and appends the supplied file name' do
      ShoppingList.full_path('list').should == "#{ShoppingList.directory}/list"
    end
  end

  context '#file_list' do
    it 'returns an array of all the shopping lists in the default directory' do
      ShoppingList.file_list.should == [ShoppingList.full_path('list'),ShoppingList.full_path('test_list')]
    end
  end

  context '#load!' do
    it 'loads the supplied list, wiping out any buffered additions' do
      $holding_list = list_subject2

      ShoppingList.load!('test_list')

      expected = $holding_list.collect { |i| i.to_hash }
      tested = list_subject.collect { |i| i.to_hash }
      tested.should == expected
    end
  end

  context '#search' do
    it 'returns an array of the file name(s) that has/have the specified item' do
      ShoppingList.search('pants').should == [ShoppingList.full_path('list')]
      puts ShoppingList.search('notebook')
    end
  end


end