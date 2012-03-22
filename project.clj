(defproject mtg-store "0.1.0-SNAPSHOT"
  :plugins [[lein-ring "0.6.1"]]
  :dependencies [[org.clojure/clojure "1.3.0"]
                 [compojure "1.0.1"]]
  :ring {:handler mtg-store.web.routes/handler})
