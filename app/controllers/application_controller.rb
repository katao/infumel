class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def to_boin(text)
    text = text.gsub(/na/,'a')
    text = text.gsub(/ni/,'i')
    text = text.gsub(/nu/,'u')
    text = text.gsub(/ne/,'e')
    text = text.gsub(/no/,'o')
    text = text.gsub(/[^aiueon]/,'')
    text
  end
end
