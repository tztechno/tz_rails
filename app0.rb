require 'sinatra'

# ルートURLに対するレスポンスを定義
get '/' do
  # publicディレクトリ内のindex.htmlを返す
  send_file File.join(settings.public_folder, 'index.html')
end
