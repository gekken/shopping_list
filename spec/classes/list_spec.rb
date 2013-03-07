require 'rspec'
require 'shopping_list'

describe ShoppingList::List do

  list_subject = ShoppingList::List.new('list')
  list_subject2 = ShoppingList::List.new('test_list')

  context '#new' do
    it 'has a name' do
      list_subject.name.should == 'list'
    end

  end

  context '#list_to_hash' do
    it 'returns a hash of the item' do
      expected = {:items => $holding_list,
                  :location => File.expand_path('~/Dropbox/ShoppingList/list'),
                  :name => 'list'}
      list_subject.list_to_hash.should == expected
    end
  end

   context '#save' do
     it 'adds the items in $holding_list to specified file' do
       list_subject.save
       saved = YAML.load_file(File.open File.expand_path('~/Dropbox/ShoppingList/list'))
       expected = [{:name=> 'notebook, three-ringed', :amount=>1, :store=> 'Staples', :category=> 'work supplies'},
                   {:name=> 'pants', :amount=>2, :store=>nil, :category=> 'clothes'}]
       saved.collect { |i| i.to_hash }.should == expected

     end
   end

  context '#delete!' do
    it 'removes the specified item (by name) from the specified list' do
      list_subject2.save
      expect(list_subject2.delete!('pants', 'test_list')).to be_true
    end
  end


end
