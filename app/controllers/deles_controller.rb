class DelesController < ApplicationController
  require "romaji/core_ext/string"

  def index
    list = ['a','i','u','e','o','n']
    @characters = []
    list.each_with_index do |var, i|
      @characters[i] = Character.where(contents: 2).search({ search_word_start: var }).result(distinct: true)
    end
#binding.pry
  end
end
