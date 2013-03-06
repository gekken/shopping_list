require 'rspec'
require 'shopping_list'

describe ShoppingList::List do

  subject = ShoppingList::List.new('list')

  context '#new' do
    it 'should have a name' do
      subject.name.should == 'list'
    end

  end

  context '#list_to_hash' do
    it 'returns a hash of the item' do
      expected = {:items => $holding_list,
                  :location => File.expand_path('~/Dropbox/ShoppingList/list'),
                  :name => 'list'}
      subject.list_to_hash.should == expected
    end
  end

   context '#save' do
     it 'adds the items in $holding_list to specified file' do
       subject.save
       saved = YAML.load_file(File.open File.expand_path('~/Dropbox/ShoppingList/list'))
       expected = [{:name=> 'notebook, three-ringed', :amount=>1, :store=> 'Staples', :category=> 'work supplies'},
                   {:name=> 'pants', :amount=>2, :store=>nil, :category=> 'clothes'}]
       saved.collect { |i| i.to_hash }.should == expected

     end
   end


end
