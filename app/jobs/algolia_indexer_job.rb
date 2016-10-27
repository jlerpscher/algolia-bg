class AlgoliaIndexerJob < ApplicationJob
  queue_as :default

  def perform(id, remove)
    c = Contact.find(id)
    remove ? c.remove_from_index! : c.index!
  end
end
