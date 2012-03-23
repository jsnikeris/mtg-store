(ns mtg-store.web.template
  (:use [net.cgrand.enlive-html :only [deftemplate defsnippet first-child]])
  (:require [net.cgrand.enlive-html :as html]))

(defn- class-as-kw
  "return the first class of node as a keword"
  [node]
  (-> node (html/attr-values :class) first keyword))

(defn- class-as-kw-content
  "replaces a node's content by using its first class as a keyword
  into map"
  [map]
  (fn [node]
    (if-let [val (get map (class-as-kw node))]
      ((html/content (str val)) node)
      node)))

(defsnippet card "templates/cards.html" [:#cards :> :tbody :> first-child]
  [{:keys [card-url image-url] :as card}]
  [:.image :> :a] (html/set-attr :href card-url)
  [:.image :img] (html/set-attr :src image-url)
  [:td] (class-as-kw-content card))

(deftemplate cards "templates/cards.html" [cards]
  [:#cards :> :tbody] (html/content (map card cards)))
