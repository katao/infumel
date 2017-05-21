class Character < ApplicationRecord
  def name
    self.l_name.to_s + ' ' + self.f_name.to_s
  end

  def kana
    self.l_kana.to_s + self.f_kana.to_s
  end

  def to_boin
    boin = self.roma
    boin = boin.gsub(/na/,'a')
    boin = boin.gsub(/ni/,'i')
    boin = boin.gsub(/nu/,'u')
    boin = boin.gsub(/ne/,'e')
    boin = boin.gsub(/no/,'o')
    boin = boin.gsub(/[^aiueon]/,'')
    boin
  end
end
