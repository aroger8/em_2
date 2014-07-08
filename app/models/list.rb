class List < ActiveRecord::Base
 belongs_to :board

 DONE_LIST_ID = '51815d7b826fbe470b0050be'
 PRODUCT_DESIGN_START = '51bf4613523a075608002e03' 
 SIZING_START_ID = '5330ca0f6990a85303497d74'

 def self.find_or_create(list_hash)
   board = Board.find_or_create(list_hash[:board])

   list = find_or_initialize_by_trello_id(
     list_hash[:id]
     name: list_hash[:name],
     board_id: board.id
   )
   list.save
   list
 end
end
