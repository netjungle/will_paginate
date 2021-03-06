require 'sequel'
require 'sequel/extensions/pagination'

module WillPaginate
  module SequelMethods
    def total_pages
      page_count
    end

    def per_page
      page_size
    end

    def total_entries
      pagination_record_count
    end

    def out_of_bounds?
      current_page > total_pages
    end

    # Current offset of the paginated collection
    def offset
      (current_page - 1) * per_page
    end
  end

  Sequel::Dataset::Pagination.send(:include, SequelMethods)
end
