(ns chapter-7-clojure.day1-test
  (:require [clojure.test :refer :all]
            [chapter-7-clojure.day1 :refer :all]))

(deftest big-test
  (testing "bigness function"
    (is (big? "five" 3))
    (is (not (big? "five" 10)))))


(deftest collection-type-test
  (testing "Correct collections returned"
    (is (= :list   (collection-type (list 1 2 3))))
    (is (= :vector (collection-type [1 2 3])))
    (is (= :map    (collection-type {:a 1 :b 2})))
    (is (nil?      (collection-type #{:a 1 :b 2})))))

