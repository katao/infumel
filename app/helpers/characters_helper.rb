module CharactersHelper
  def is_domain(roma)
    #domains = ['website','wed','wedding','weibo','wien','wiki','win','wine','work','works','world','wtf','xin','xyz','yoga','yokohama','yun','zip','zone','zuerich']
    domains = ['com','net','press','space','work','pw','site','xyz','club','info','online','tokyo','top','website','biz','life','me','mobi','shop','fun','tech','org','pro','cloud','asia','bio','green','host','organic','world','blue','pink','red','co','style','art','design','games','love','news','日本語jp','promo','men','ski','jp','poker','ai']
    #domains = []
    domains.each do |domain|
      if roma.end_with?(domain)
        url = 'http://' + roma.sub(/#{domain}$/,'') + '.' + domain
        return link_to url, url, target: 'blank'
      end
    end
    return ''
  end
end
