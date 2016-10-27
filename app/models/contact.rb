class Contact < ApplicationRecord

  include AlgoliaSearch

  algoliasearch enqueue: :trigger_sidekiq_worker do
    add_attribute :extra_attr
  end

  def self.trigger_sidekiq_worker(record, remove)
    AlgoliaIndexerJob.perform_later(record.id, remove)
  end

  def extra_attr
    p 'Long operation...'
    sleep(10)
  end
end
