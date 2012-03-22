(ns mtg-store.web.routes
  (:use [compojure.core :only [defroutes GET]])
  (:require [compojure.route :as route]
            [compojure.handler :as handler]))

(defroutes routes
  (GET "/" [] "<html><head><title></title><body><h1>Hello</h1></body></html>")
  (route/resources "/")
  (route/not-found "Page not found"))

(def handler
  (handler/api routes))
