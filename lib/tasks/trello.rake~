task import_list: :environment do
  unless ENV['list_id']
    puts "the list_id argument is require; nothis was imported"
    exit 1
  end
  Importers::CompletedCards.import(ENV['list_id']) do |update|
    puts update
  end
end