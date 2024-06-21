---

Lucas数計算アプリケーションのファイル階層をまとめます。

### ファイル構造

1. **プロジェクトルート**

   ```
   ├── Gemfile
   ├── Gemfile.lock
   ├── app.rb
   └── public
       └── index.html
   ```

   - **Gemfile**: Sinatraとその他必要なgemを指定するファイル。
   - **Gemfile.lock**: Gemのバージョンなどがロックされたファイル。
   - **app.rb**: Sinatraアプリケーションのメインファイル。Lucas数の計算やAjaxリクエストを処理する。
   - **public/index.html**: フロントエンドのHTMLファイル。ユーザーインターフェースとAjaxリクエストを処理する。

### ファイルの内容

#### Gemfile

```ruby
source 'https://rubygems.org'

gem 'sinatra'
```

#### app.rb

```ruby
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
```

#### public/index.html

```html
<!DOCTYPE html>
<html>
<head>
    <title>Lucas Number Calculator</title>
</head>
<body>
    <p>AJAX Lucas Number</p>
    <input type="number" id="inputN" placeholder="Enter a number">
    <button onclick="sendRequest()">Calculate</button>
    <div id="result"></div>
    <div id="time"></div>
    <script>
        function sendRequest() {
            const n = document.getElementById('inputN').value;
            fetch('/calculate', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ n })
            })
                .then(response => response.json())
                .then(data => {
                    document.getElementById('result').innerText = `Lucas Number L${n} = ${data.result}`;
                    document.getElementById('time').innerText = `Time: ${(data.process_time / 1000).toFixed(3)} sec`;
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }
    </script>
</body>
</html>
```

### 実行手順

1. プロジェクトディレクトリでターミナルを開きます。
2. `Gemfile` と `app.rb` を作成します。
3. Gemをインストールするために `bundle install` を実行します。
4. `app.rb` を実行してSinatraアプリケーションを起動します（`ruby app.rb`）。
5. ブラウザで `http://localhost:4567` にアクセスします。
6. 数値を入力して "Calculate" ボタンをクリックすると、バックエンドでLucas数が計算され、結果と計算時間が表示されます。

このファイル構造と内容により、シンプルで効果的なLucas数計算アプリケーションが実現されます。

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
