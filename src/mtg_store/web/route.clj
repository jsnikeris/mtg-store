(ns mtg-store.web.route
  (:use [compojure.core :only [defroutes GET]])
  (:require [compojure.route :as route]
            [compojure.handler :as handler]
            [mtg-store.web.template :as template]
            [mtg-store.model :as model]))

(defroutes routes
  (GET "/" [] "<a href=\"cards\">cards</a")
  (GET "/cards" [] (template/cards (take 4 (model/cards))))
  (route/resources "/")
  (route/not-found "Page not found"))

(def handler
  (handler/api routes))
