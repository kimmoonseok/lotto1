class LottoController < ApplicationController

require 'open-uri'
require 'json'


    def index
    end
    
    def mouse
        page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber")
        lotto_read = page.read
        lotto_json = JSON.parse(lotto_read)
        my_numbers = Array(1..45).to_a.sample(6).sort
        lucky_numbers = ["#{lotto_json['drwtNo1']}",
                            "#{lotto_json['drwtNo2']}",
                            "#{lotto_json['drwtNo3']}",
                            "#{lotto_json['drwtNo4']}",
                            "#{lotto_json['drwtNo5']}",
                            "#{lotto_json['drwtNo6']}",
                            "#{lotto_json['bnusNo']}"]

        print "이번주 당첨 번호! ",lucky_numbers,:"\n","Bonus 번호는 ""#{lotto_json['bnusNo']}"
        print "\n",my_numbers
        count = 0
        bnuscount = 0
            for i in 0..5
                for j in 0..5
                    if lucky_numbers[i].to_i==my_numbers[j]
                        count+=1
                    end
                end
            end
                print "\n", count, "개 맞았습니다."
                
            for i in 0..5
                if my_numbers[i]==lucky_numbers[6].to_i
                    bnuscount+=1
                end
            end
        print "\n"
        if count == 6
            puts "1등"
            elsif count == 5 && bnuscount==1
            puts "2등"
            elsif count == 5
            puts "3등"
            elsif count == 4
            puts "4등"
            elsif count == 3
            puts "5등"
            elsif count == 2
            puts "꽝"
                elsif count == 1
            puts "꽝"
                elsif count == 0
            puts "꽝"
        @lucky_numbers = lucky_numbers
        @bonusno = lotto_json['bnusNo']
        @my_numbers = my_numbers
        @count = count
        @bnuscount = bnuscount
        end
    end
end
