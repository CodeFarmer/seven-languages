(ns chapter-7-clojure.day3)

(def accounts (ref []))

(defn new-account []
  (dosync
   (alter accounts conj 0)
   (dec (count @accounts))))

(defn account-balance [n]
  (@accounts n))

(defn credit-account [n amount]
  (dosync
   (alter accounts update-in [n] + amount)
   (@accounts n)))

(defn debit-account [n amount]
  (credit-account n (- amount)))
