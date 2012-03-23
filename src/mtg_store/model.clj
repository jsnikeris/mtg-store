(ns mtg-store.model)

(def ^:const image-url-prefix
  "http://gatherer.wizards.com/Handlers/Image.ashx?type=card&multiverseid=")

(defn cards
  []
  [{:image-url (str image-url-prefix 206331)
    :card-url "card?name=Ornithopter"
    :name "Ornithopter"
    :types "Artifact Creature"
    :cmc 0
    :qty 5},
   {:image-url (str image-url-prefix 21398)
    :card-url "card?name=Flowstone+Thopter"
    :name "Flowstone Thopter"
    :types "Artifact Creature"
    :cmc 7
    :qty 0},
   {:image-url (str image-url-prefix 184596)
    :card-url "card?name=Roterothopter"
    :name "Roterothopter"
    :types "Artifact Creature"
    :cmc 1
    :qty 2},
   {:image-url (str image-url-prefix 214039)
    :card-url "card?name=Thopter+Assembly"
    :name "Thopter Assembly"
    :types "Artifact Creature"
    :cmc 6
    :qty 1}])
