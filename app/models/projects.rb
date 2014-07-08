class Projects < ActiveRecord::Base
  
  def self.find_or_create(project_hash)
    projects = find_or_initialize_by_trello_id(
      project_hash[:id],
      name: project_hash[:name]
    )
    projects.save
    projects
  end

end
