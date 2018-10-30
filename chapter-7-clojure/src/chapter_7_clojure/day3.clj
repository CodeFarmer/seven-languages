(ns chapter-7-clojure.day3)


;; Bank accounts

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


;; Sleeping Barber

(def waiting-room (ref 0))
(def barber-awake (ref false))


(defn customer-arrives! []
  (dosync
   (if (< @waiting-room 3)
     (alter waiting-room inc))))


(def barber (agent 0))

(defn haircut! [count]
  (loop [remaining-customers @waiting-room
         c count]

    (println "Barber: " c)
    
    (if (> remaining-customers 0)
      (do
        (dosync
         (ref-set barber-awake true)
         (alter waiting-room dec))
        (Thread/sleep 20)
        (recur @waiting-room (inc c)))
      (dosync
       (ref-set barber-awake false)
       c))))

(defn waiting-room-watcher [_ _ _ count]
  
  ; (println "waiting-room: " count)
  (if (and (> count 0)
           (not @barber-awake))
        (send barber haircut!)))

(defn run-customers! [until]
  
  (dosync
   (ref-set waiting-room 0)
   (ref-set barber-awake false))

  (send barber (fn [_] 0))
  
  (add-watch waiting-room :roomwatch waiting-room-watcher)

  (while (< (System/currentTimeMillis) until)
    (do (Thread/sleep (+ 10 (rand-int 20)))
        (customer-arrives!))))


