class CharactersController < ApplicationController
  require "romaji/core_ext/string"

  def index
    # 表示いい感じに
    # 他のサイトを見てみる
    # 辞書を登録しまくる
    # 同じ韻の単語を出す
    # https://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q1213120447
    # 単語の品詞ごとに使い方をみる10種類ある
    # 韻の説明ページを作成
    # 765メンバーの重複

    search = { }
    if params.present? && params[:q].present?
      #next unless params[:q][:search_word_start].present?
      @search_word = params[:q][:search_word_start]
      # バリデーション
      if @search_word.match(/[^ぁ-ん]/)
        @alert = 'ひらがなで入力して下さい。'
      end
      # 変換
      @search_word_start = to_boin(@search_word.romaji)
      search[:search_word_start] = @search_word_start
      search[:search_word_start].reverse!
      # 文字数制限
      search[:search_word_start] = @search_word_start[0, params[:word_limit].to_i] if params[:word_limit].present?
    end

    @q = Character.search(search)
    @characters = @q.result(distinct: true) #.page(params[:page])
  end
end
