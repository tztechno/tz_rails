---


---

Sinatraを使用して、簡単なWebアプリケーション（`myapp`という名前のもの）を作成し、HTMLファイルをホストする方法について説明します。

まず、Sinatraをインストールするには、Rubyがインストールされている必要があります。Rubyがインストールされていない場合は、まずRubyのインストールを行ってください。

次に、Sinatraをインストールします。ターミナル（コマンドプロンプト）を開いて、以下のコマンドを実行します:

```bash
gem install sinatra
```

Sinatraがインストールされたら、次に`myapp.rb`という名前のSinatraアプリケーションファイルを作成します。このファイルには、Sinatraの基本的な設定とルーティングを記述します。

例えば、以下のような`myapp.rb`を作成します:

```ruby
require 'sinatra'

# ルートURLに対するレスポンスを定義
get '/' do
  # publicディレクトリ内のindex.htmlを返す
  send_file File.join(settings.public_folder, 'index.html')
end
```

次に、`myapp.rb`と同じディレクトリに`public`という名前のディレクトリを作成し、その中にホストしたいHTMLファイル（例えば`index.html`）を配置します。

例えば、`public`ディレクトリ内に`index.html`を作成し、以下のような内容を持たせます:

```html
<!DOCTYPE html>
<html>
<head>
  <title>My Sinatra App</title>
</head>
<body>
  <h1>Hello, Sinatra!</h1>
  <p>This is my Sinatra app hosting an HTML file.</p>
</body>
</html>
```

これで準備が整いました。ターミナルでSinatraアプリケーションを起動します。`myapp.rb`があるディレクトリに移動し、以下のコマンドを実行します:

```bash
ruby myapp.rb
```

Sinatraが起動し、デフォルトで `http://localhost:4567` にアプリケーションがホスティングされます。ブラウザでこのURLにアクセスすると、`index.html`の内容が表示されるはずです。

これで、Sinatraを使用してHTMLファイルをホストする簡単なWebアプリケーションが作成されました。

---
