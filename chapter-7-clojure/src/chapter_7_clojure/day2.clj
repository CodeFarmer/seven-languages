(ns chapter-7-clojure.day2)

(defmacro unless
  ([test body]
   `(unless ~test ~body nil))
  ([test body else]
   `(if (not ~test) ~body ~else)))


(defprotocol Gettable
  (get-me [this]))

(defrecord Thing [x]
  Gettable
  (get-me [this] x))
