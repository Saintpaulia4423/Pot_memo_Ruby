require "csv"
require "readline"


#新規作成関数
def textwriter(f_name)

    puts "メモしたい内容を記入してください\n完了したらCtrl + Dを押します"
    CSV.open(f_name, "w") do |text|
        
        while buf = Readline.readline("> ", true)
            text << buf.parse_csv
        end
    end

end

#編集関数
def texteditor(f_name)
    puts "---現在、入力されている内容---"    

    num = 1
    CSV.foreach(f_name) do |text|
        puts num.to_s +  ": " + text.to_s
        num += 1
    end

    puts "------------------------------"
    puts "これに追記を行います。\n完了したらCtrl + Dを押します"

    CSV.open(f_name, "a") do |text|
        while buf = Readline.readline("> ", true)
            text << buf.parse_csv
        end
    end
end
    
#基本処理部
loop_set = 0

while(loop_set == 0)
    puts "1 ⇨ 新規でメモを作成する / 2 ⇨ 既存のメモを編集する"
    memo_type = gets.to_i

    if memo_type == 1
        loop_set = 1
        puts "拡張子を除いたファイル名を入力してください"

        work = gets.chomp.to_s + ".csv"

        textwriter(work)

    elsif memo_type == 2
        loop_set = 1
        puts "編集するファイル名を入力してください（拡張子を含む）"

        work = gets.chomp.to_s

        texteditor(work)

    else 
        puts "不正な値です"
    end
end
