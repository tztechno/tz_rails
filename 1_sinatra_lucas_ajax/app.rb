# app.rb

require 'sinatra'
require 'json'

# ルートURLにindex.htmlを返す
get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

# POSTリクエスト '/calculate' を処理
post '/calculate' do
  request_body = JSON.parse(request.body.read)
  n = request_body['n'].to_i

  # Lucas数を計算する関数
  def lucas_number(n)
    if n == 0
      return 2
    elsif n == 1
      return 1
    else
      a = 2
      b = 1
      (2..n).each do
        a, b = b, a + b
      end
      return b
    end
  end

  # 計算時間を測定
  start_time = Time.now
  result = lucas_number(n)
  end_time = Time.now
  process_time = (end_time - start_time) * 1000  # ミリ秒単位で計算時間を取得

  # 結果をJSON形式で返す
  content_type :json
  { result: result, process_time: process_time }.to_json
end
