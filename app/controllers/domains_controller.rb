class DomainsController < ApplicationController
  require "romaji/core_ext/string"

  def test
    search = { }
    @q = Domain.search(search)
    if params.present? && params[:q].present?
#binding.pry
      # ローマ字化
      # 検索(3文字でだめなら2文字)

      @search_word = params[:q][:name_end]
      name_end = params[:q][:name_end]
      search[:name_end] = name_end
      if params[:q][:name_end].length > 3
        domain_2 = params[:q][:name_end]
        domain_3 = params[:q][:name_end]
        @q = Domain.ransack({ combinator: 'or', groupings: { 'a': { name_end: domain_2 }, 'b': { name_end: domain_3 } } })
      else
        @q = Domain.search(search)
      end
    end
    @domains = @q.result(distinct: true)
  end

  def index
    search = { }
    if params.present? && params[:q].present?
      #next unless params[:q][:search_word_start].present?
      @search_word = params[:q][:name_end]
      # バリデーション
      #if @search_word.match(/[^ぁ-ん]/)
      #  @alert = 'ひらがなで入力して下さい。'
      #end
      # 変換
      #@search_word_start = to_boin(@search_word.romaji)
      #search[:search_word_start] = @search_word_start
      #search[:search_word_start].reverse!
      # 文字数制限
      #search[:search_word_start] = @search_word_start[0, params[:word_limit].to_i] if params[:word_limit].present?
    end

    @q = Character.where.not(domain: [nil,""]).search(search)
    @characters = @q.result(distinct: true) #.page(params[:page])

    domains = []
    #domains = ['us','be','in','aichijp','akitajp','chibajp','ehimejp','fukuijp','fukuokajp','fukushimajp','gifujp','gunmajp','hiroshimajp','hokkaidojp','hyogojp','ibarakijp','ishikawajp','kagawajp','kagoshimajp','kanagawajp','kochijp','kumamotojp','kyotojp','miejp','miyagijp','miyazakijp','naganojp','nagasakijp','narajp','niigatajp','oitajp','okayamajp','okinawajp','osakajp','sagajp','saitamajp','shigajp','shimanejp','shizuokajp','tochigijp','tokushimajp','tokyojp','tottorijp','toyamajp','wakayamajp','yamagatajp','yamaguchijp','yamanashijp','bz','cc','comco','netco','nomco','ws','acjp','cojp','edjp','gojp','orjp','id','tv','tw','la','vc','mn','cz','mx','ac','hn','am','sc']
    #domains = ['email','company','group','ltd','network','support','nagoya','yokohama','okinawa','ryukyu','center','digital','marketing','services','ventures','コム','click','kim','link','onl','social','vip','bet','futbol','pictures','rocks','partners','dance','family','live','ninja','rip','studio','agency','band','beer','bid','blog','business','casa','city','cooking','country','directory','education','equipment','exposed','fashion','fishing','fit','football','fyi','gallery','garden','gift','graphics','gratis','horse','ink','institute','international','lighting','management','party','photography','photos','reisen','report','reviews','rodeo','run','school','schule','science','soccer','solutions','supplies','supply','surf','systems','technology','tips','today','trade','uno','video','vodka','webcam','wedding','wiki','yoga','airforce','army','auction','cam','consulting','date','democrat','engineer','faith','forsale','gives','haus','immobilien','kaufen','market','moda','navy','pub','rehab','republican','review','sale','software','vet','academy','accountant','associates','bargains','bike','boutique','builders','buzz','cab','cafe','camera','camp','cards','care','cash','catering','chat','cheap','church','cleaning','clothing','coffee','community','computer','construction','contractors','cool','deals','direct','discount','dog','domains','download','enterprises','estate','events','exchange','express','fail','farm','fish','fitness','florist','foundation','gifts','glass','gripe','guide','guru','help','house','immo','industries','kitchen','kiwi','land','limited','loan','lol','mba','media','mom','money','ooo','parts','photo','pics','plumbing','plus','productions','properties','racing','rentals','repair','rest','sarl','shoes','show','singles','solar','team','tools','town','toys','training','vision','watch','win','works','wtf','zone','actor','attorney','dentist','lawyer','black','degree','london','mortgage','tattoo','apartments','bingo','capital','careers','claims','clinic','coach','codes','condos','coupons','cruises','dating','delivery','dental','diamonds','engineering','expert','finance','financial','flights','fund','furniture','golf','healthcare','hockey','holdings','holiday','insure','jewelry','lease','legal','limo','maison','memorial','pizza','recipes','restaurant','salon','sexy','surgery','tax','taxi','tennis','theater','tienda','tours','university','vacations','vegas','viajes','villas','vin','voyage','wine','bar','college','cricket','global','kyoto','rent','health','adult','best','ceo','christmas','energy','porn','sex','accountants','credit','gold','investments','loans','tires','audio','blackfriday','casino','creditcard','diet','flowers','guitars','hiphop','property','hiv','movie','game','hosting','juegos','theatre','storage','rich','auto','car','cars','protection','security']
    #domains = ['com','net','press','space','work','pw','site','xyz','club','info','online','tokyo','top','website','biz','life','me','mobi','shop','fun','tech','org','pro','cloud','asia','bio','green','host','organic','world','blue','pink','red','co','style','art','design','games','love','news','日本語jp','promo','men','ski','jp','poker','ai']
    @characters.where(domain: [nil,""]).each do |character|
      domains.each do |domain|
        if character.roma.end_with?(domain)
          url = 'http://' + character.roma.sub(/#{domain}$/,'') + '.' + domain
          character.domain = url
          character.save
          #return link_to url, url, target: 'blank'
        end
      end
    end
  end
end

