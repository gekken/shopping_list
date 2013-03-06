require 'rspec'
require 'spec_helper'
require 'shopping_list'

describe ShoppingList::Item do

  subject = ShoppingList::Item.new('notebook, three-ringed', 1, 'work supplies', 'Staples')
  subject2 = ShoppingList::Item.new('pants', 2, 'clothes', nil)


  context '#new' do
    it 'has a name' do
      subject.name.should == 'notebook, three-ringed'
    end

    it 'has a store' do
      subject.store.should == 'Staples'
    end

    it 'has an amount' do
      subject.amount.should == 1
    end

    it 'has a category' do
      subject.category.should == 'work supplies'
    end

  end

  context '#to_hash' do

    it 'converts the object to a hash' do

      expected = {name: 'notebook, three-ringed',
                  amount: 1,
                  category: 'work supplies',
                  store: 'Staples'}
      subject.to_hash.should == expected
    end

  end

  context '#add_to_list' do
    it 'saves the item to $holding_list' do
      subject.add_to_list
      subject2.add_to_list
      expected = [  {:name=> 'notebook, three-ringed', :amount=>1, :store=> 'Staples', :category=> 'work supplies'},
                    {:name=> 'pants', :amount=>2, :store=>nil, :category=> 'clothes'}]
      $holding_list.collect { |i| i.to_hash }.should == expected


    end
  end

end