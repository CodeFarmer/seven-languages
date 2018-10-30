(ns chapter-7-clojure.day3-test
  (:require [clojure.test :refer :all]
            [chapter-7-clojure.day3 :refer :all]))

(deftest new-account-test
  (testing "new account creation returns an account number which is a non-negative integer"
    (let [n (new-account)]
      (is (integer? n))
      (is (not (neg? n)))))

  (testing "new account creation creates a new account number each time"
    (is (not (= (new-account) (new-account)))))
  
  (testing "creating a new account and confirming it has zero balance"
    (is (= 0 (account-balance (new-account))))))


(deftest credit-test
  
  (testing "crediting a new account returns the new balance"
    (let [n (new-account)]
      (credit-account n 50)))

  (testing "crediting an account affects the balance"
    (let [n (new-account)]
      (credit-account n 50)
      (is (= 50 (account-balance n)))))

  (testing "crediting an account repeatedly adds the correct amount of money"
    (let [n (new-account)]
      (credit-account n 50)
      (is (= 70 (credit-account n 20))))))

(deftest debit-test
  (testing "debiting an account removes the correct amount of money"
    (let [n (new-account)]
      (credit-account n 50)
      (is (= 30 (debit-account n 20))))))
