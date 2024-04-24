; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62396 () Bool)

(assert start!62396)

(declare-fun b!698474 () Bool)

(declare-fun res!462187 () Bool)

(declare-fun e!397113 () Bool)

(assert (=> b!698474 (=> (not res!462187) (not e!397113))))

(declare-datatypes ((List!13109 0))(
  ( (Nil!13106) (Cons!13105 (h!14153 (_ BitVec 64)) (t!19383 List!13109)) )
))
(declare-fun newAcc!49 () List!13109)

(declare-fun noDuplicate!1035 (List!13109) Bool)

(assert (=> b!698474 (= res!462187 (noDuplicate!1035 newAcc!49))))

(declare-fun b!698476 () Bool)

(assert (=> b!698476 (= e!397113 false)))

(declare-fun lt!317346 () Bool)

(declare-fun acc!652 () List!13109)

(declare-fun contains!3761 (List!13109 (_ BitVec 64)) Bool)

(assert (=> b!698476 (= lt!317346 (contains!3761 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!462185 () Bool)

(assert (=> start!62396 (=> (not res!462185) (not e!397113))))

(declare-datatypes ((array!40015 0))(
  ( (array!40016 (arr!19161 (Array (_ BitVec 32) (_ BitVec 64))) (size!19544 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40015)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62396 (= res!462185 (and (bvslt (size!19544 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19544 a!3591))))))

(assert (=> start!62396 e!397113))

(declare-fun array_inv!15020 (array!40015) Bool)

(assert (=> start!62396 (array_inv!15020 a!3591)))

(assert (=> start!62396 true))

(declare-fun b!698475 () Bool)

(declare-fun res!462186 () Bool)

(assert (=> b!698475 (=> (not res!462186) (not e!397113))))

(assert (=> b!698475 (= res!462186 (not (contains!3761 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698473 () Bool)

(declare-fun res!462184 () Bool)

(assert (=> b!698473 (=> (not res!462184) (not e!397113))))

(assert (=> b!698473 (= res!462184 (noDuplicate!1035 acc!652))))

(assert (= (and start!62396 res!462185) b!698473))

(assert (= (and b!698473 res!462184) b!698474))

(assert (= (and b!698474 res!462187) b!698475))

(assert (= (and b!698475 res!462186) b!698476))

(declare-fun m!659237 () Bool)

(assert (=> b!698473 m!659237))

(declare-fun m!659239 () Bool)

(assert (=> start!62396 m!659239))

(declare-fun m!659241 () Bool)

(assert (=> b!698476 m!659241))

(declare-fun m!659243 () Bool)

(assert (=> b!698475 m!659243))

(declare-fun m!659245 () Bool)

(assert (=> b!698474 m!659245))

(push 1)

(assert (not b!698475))

(assert (not start!62396))

(assert (not b!698474))

(assert (not b!698476))

(assert (not b!698473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

