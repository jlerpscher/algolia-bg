class Contact < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    add_attribute :extra_attr
  end

  def extra_attr
    p 'Long operations...'
    sleep(10)
  end
end
