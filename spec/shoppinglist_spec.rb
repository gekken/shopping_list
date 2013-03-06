require 'rspec'
require 'spec_helper'
require 'shopping_list'

describe ShoppingList do
  it 'has a version' do
    ShoppingList::VERSION.should_not == nil
  end


end