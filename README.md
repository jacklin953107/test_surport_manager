1.
        Gemfile是一個方便而强大的 Ruby 程序包管理器（ package manager），它將 Ruby 應用程式或某些 Ruby 程式碼打包到一個 gem 裡，作為一個基本單位（類似模組，但比模組更上層、更便於重複利用的東西），可以之後在其他專案或程式重複利用裏頭的 Ruby 程式碼。

2.
        Migrations（資料庫遷移）可以讓你用 Ruby 程式來修改資料庫結構。相較於直接進資料庫系統使用 SQL 修改結構(例如使用 phpMyAdmin 工具來修改)，使用 Migrations 可以讓我們有記錄地進行資料庫修改，每次變更就是一筆 Migration 記錄。在沒有 Migration 之前，如果你手動修改了資料庫，那麼你就必須通知其他開發者也進行一樣的修改步驟。另外，在正式佈署的伺服器上，你也必須追蹤並執行同樣的變更才行。而這些步驟如果沒有記錄下來，就很容易出錯。
        Migrations 會自動追蹤哪些變更已經執行過了、那些還沒有，你只要新增 Migration 檔案，然後執行 rake db:migrate 就搞定了。它會自己搞清楚該跑哪些 migrations，如此所有的開發者和正式佈署的伺服器上，就可以輕易的同步最新的資料庫結構。另外一個優點是： Migration 是獨立於資料庫系統的，所以你不需要煩惱各種資料庫系統的語法差異，像是不同型態之類的。當然，如果要針對某個特定資料庫系統撰寫專屬功能的話，還是可以透過直接寫 SQL 的方式。

migration 新增了一個資料表時，主鍵欄 id 會被加進去，這是預設就會做的動作，所以我們不用特別寫在 migrations 裡面。除了主鍵之外，還有兩個 timestamp 欄 created_at 以及 updated_at，也會透過 timestamps 方法加進去。這個 migration 的復原動作很簡單，那就是刪掉這個資料表。
Migrations 用途多多，除了改變 schema（資料庫綱要）之外，還可以修復不正確的資料，或者建立新的欄位（fields）。

3.
        RESTful路由設計是Rails的一項獨到的發明，它使用了REST的概念來建立一整組的命名路由(named routes)。什麼是REST呢？表象化狀態轉變Representational State Transfer，簡稱REST，是Roy Fielding博士在2000年他的博士論文中提出來的一種軟體架構風格。相較於SOAP、XML-RPC更為簡潔容易使用，也是眾多網路服務中最為普遍的API格式，像是Amazon、Yahoo!、Google等提供的API服務均有REST介面。REST有主要有兩個核心精神：1. 使用Resource來當做識別的資源，也就是使用一個URL網址來代表一個Resource 2. 同一個Resource則可以有不同的Representations格式變化。
