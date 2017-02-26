


aaa= "ŞASDasd ASD"



  def tittleCaseTR getStr
    def trTittlecase getStrTR
      getStrTR=getStrTR.split(" ")
      def trUpper r

        if ([*('a'..'z'),*('A'..'Z'),*(0..9)].join).include?(r[0])
          str=r[0].upcase
        elsif (['ğ','Ğ','ü','Ü','i','İ','ı','I','ö','Ö','ç','Ç','ş','Ş'].join).include?(r[0])
          case r[0]
            when 'ğ', 'Ğ'
              str='Ğ'
            when 'ü', 'Ü'
              str='Ü'
            when 'i', 'İ'
              str='İ'
            when 'ı', 'I'
              str='I'
            when 'ö', 'Ö'
              str='Ö'
            when 'ç', 'Ç'
              str='Ç'
            when 'ş', 'Ş'
              str='Ş'

          end
        else
          str=r[0]

        end


        return str

      end

      def trLower r
        if ([*('a'..'z'),*('A'..'Z'),*(0..9)].join).include?(r[0])
          str=r[0].downcase
        elsif (['ğ','Ğ','ü','Ü','i','İ','ı','I','ö','Ö','ç','Ç','ş','Ş'].join).include?(r[0])


          case r[0]
            when 'Ğ', 'ğ'
              str='ğ'
            when 'Ü', 'ü'
              str='ü'
            when 'İ', 'i'
              str='i'
            when 'I', 'ı'
              str='ı'
            when 'Ö', 'ö'
              str='ö'
            when 'Ç', 'ç'
              str='ç'
            when 'Ş', 'ş'
              str='ş'

          end
        else
          str=r[0]
        end

        return str

      end
      def stringAloneTittle getStrTR
        tittle=[]
        getStrTR.split("").each { |x| tittle.push  trLower x}
        return tittle
      end
      tittle=stringAloneTittle getStrTR[0]
      firstline=trUpper stringAloneTittle getStrTR[0]
      tittle[0].replace(firstline)
      tittle.shift
      responseTittle = firstline+tittle.join
      return responseTittle
    end
    emulator=getStr.split(" ")
    r=[]
    emulator.each { |x| a=trTittlecase x
    r.push a
    }
    return r.join(" ")
  end








  def titlecase
    small_words = %w(a an and as at but by en for if in of on or the to v v. via vs vs.)

    x = split(" ").map do |word|
      # note: word could contain non-word characters!
      # downcase all small_words, capitalize the rest
      small_words.include?(word.gsub(/\W/, "").downcase) ? word.downcase! : word.smart_capitalize!
      word
    end
    # capitalize first and last words
    x.first.to_s.smart_capitalize!
    x.last.to_s.smart_capitalize!
    # small words after colons are capitalized
    x.join(" ").gsub(/:\s?(\W*#{small_words.join("|")}\W*)\s/) { ": #{$1.smart_capitalize} " }
  end

  def titlecase!
    replace(titlecase)
  end

  def smart_capitalize
    # ignore any leading crazy characters and capitalize the first real character
    if self =~ /^['"\(\[']*([a-z])/
      i = index($1)
      x = self[i,self.length]
      # word with capitals and periods mid-word are left alone
      self[i,1] = self[i,1].upcase unless x =~ /[A-Z]/ or x =~ /\.\w+/
    end
    self
  end

  def smart_capitalize!
    replace(smart_capitalize)
  end

