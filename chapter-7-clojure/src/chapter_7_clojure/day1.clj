(ns chapter-7-clojure.day1)

(defn big? [st n]
  (> (count st) n))


(defn collection-type [coll]
  (cond
    (list?   coll) :list
    (vector? coll) :vector
    (map?    coll) :map
    :else nil))
