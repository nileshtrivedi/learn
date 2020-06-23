# == Schema Information
#
# Table name: recommendations
#
#  id          :uuid             not null, primary key
#  item_id     :uuid             not null
#  person_id   :uuid             not null
#  idea_set_id :uuid             not null
#  metadata    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_recommendations_on_idea_set_id  (idea_set_id)
#  index_recommendations_on_item_id      (item_id)
#  index_recommendations_on_person_id    (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (idea_set_id => idea_sets.id)
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (person_id => people.id)
#

class Recommendation < ApplicationRecord
  belongs_to :idea_set

  # one of the 2 below will be present
  belongs_to :item, optional: true
  belongs_to :person, optional: true

  def display_name
  	self.target.display_name
  end

  def target
  	self.person or self.item
  end
end
