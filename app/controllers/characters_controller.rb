class CharactersController < ApplicationController
  require "romaji/core_ext/string"

  def index


    search = { }
    if params.present? &&  params[:q].present?
      #next unless params[:q][:search_word_start].present?
      @search_word = params[:q][:search_word_start]
      # バリデーション
      if @search_word.match(/[^ぁ-ん]/)
        @alert = 'ひらがなで入力して下さい。'
      end
      # 変換
      @search_word_start = to_boin(@search_word.romaji)
      search[:search_word_start] = @search_word_start
        #.reverse
      # 文字数制限
      search[:search_word_start] = @search_word_start[0, params[:word_limit].to_i] if params[:word_limit].present?
    end

    @q = Character.search(search)
    @characters = @q.result(distinct: true) #.page(params[:page])
  end
end
