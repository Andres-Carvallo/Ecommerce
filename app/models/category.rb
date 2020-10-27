class Category < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :parent_category, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_category_id'

  def all_parents
    all_parents = []
    current_category = self
    while current_category.parent_category.present?
      all_parents << current_category.parent_category
      current_category = current_category.parent_category 
    end
    all_parents
  end

  def all_children
    all_children = []
    children_to_iterate = self.children.to_a
    while children_to_iterate.present?
      current_child = children_to_iterate.shift 
      all_children << current_child
      children_to_iterate.concat(current_child.children) 
    end
    all_children
  end

end
