; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62340 () Bool)

(assert start!62340)

(declare-fun b!698283 () Bool)

(declare-fun e!396996 () Bool)

(assert (=> b!698283 (= e!396996 false)))

(declare-fun lt!317247 () Bool)

(declare-datatypes ((List!13207 0))(
  ( (Nil!13204) (Cons!13203 (h!14248 (_ BitVec 64)) (t!19489 List!13207)) )
))
(declare-fun acc!652 () List!13207)

(declare-fun contains!3784 (List!13207 (_ BitVec 64)) Bool)

(assert (=> b!698283 (= lt!317247 (contains!3784 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!462092 () Bool)

(assert (=> start!62340 (=> (not res!462092) (not e!396996))))

(declare-datatypes ((array!40019 0))(
  ( (array!40020 (arr!19166 (Array (_ BitVec 32) (_ BitVec 64))) (size!19551 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40019)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62340 (= res!462092 (and (bvslt (size!19551 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19551 a!3591))))))

(assert (=> start!62340 e!396996))

(declare-fun array_inv!14962 (array!40019) Bool)

(assert (=> start!62340 (array_inv!14962 a!3591)))

(assert (=> start!62340 true))

(declare-fun b!698280 () Bool)

(declare-fun res!462091 () Bool)

(assert (=> b!698280 (=> (not res!462091) (not e!396996))))

(declare-fun noDuplicate!1031 (List!13207) Bool)

(assert (=> b!698280 (= res!462091 (noDuplicate!1031 acc!652))))

(declare-fun b!698282 () Bool)

(declare-fun res!462090 () Bool)

(assert (=> b!698282 (=> (not res!462090) (not e!396996))))

(assert (=> b!698282 (= res!462090 (not (contains!3784 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698281 () Bool)

(declare-fun res!462093 () Bool)

(assert (=> b!698281 (=> (not res!462093) (not e!396996))))

(declare-fun newAcc!49 () List!13207)

(assert (=> b!698281 (= res!462093 (noDuplicate!1031 newAcc!49))))

(assert (= (and start!62340 res!462092) b!698280))

(assert (= (and b!698280 res!462091) b!698281))

(assert (= (and b!698281 res!462093) b!698282))

(assert (= (and b!698282 res!462090) b!698283))

(declare-fun m!658581 () Bool)

(assert (=> start!62340 m!658581))

(declare-fun m!658583 () Bool)

(assert (=> b!698282 m!658583))

(declare-fun m!658585 () Bool)

(assert (=> b!698281 m!658585))

(declare-fun m!658587 () Bool)

(assert (=> b!698283 m!658587))

(declare-fun m!658589 () Bool)

(assert (=> b!698280 m!658589))

(push 1)

(assert (not b!698283))

(assert (not start!62340))

(assert (not b!698281))

(assert (not b!698282))

(assert (not b!698280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

