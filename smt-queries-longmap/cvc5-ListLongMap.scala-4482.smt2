; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62360 () Bool)

(assert start!62360)

(declare-fun b!698458 () Bool)

(declare-fun res!462270 () Bool)

(declare-fun e!397056 () Bool)

(assert (=> b!698458 (=> (not res!462270) (not e!397056))))

(declare-datatypes ((array!40039 0))(
  ( (array!40040 (arr!19176 (Array (_ BitVec 32) (_ BitVec 64))) (size!19561 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40039)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698458 (= res!462270 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698459 () Bool)

(declare-fun res!462268 () Bool)

(assert (=> b!698459 (=> (not res!462268) (not e!397056))))

(declare-datatypes ((List!13217 0))(
  ( (Nil!13214) (Cons!13213 (h!14258 (_ BitVec 64)) (t!19499 List!13217)) )
))
(declare-fun newAcc!49 () List!13217)

(declare-fun noDuplicate!1041 (List!13217) Bool)

(assert (=> b!698459 (= res!462268 (noDuplicate!1041 newAcc!49))))

(declare-fun res!462273 () Bool)

(assert (=> start!62360 (=> (not res!462273) (not e!397056))))

(assert (=> start!62360 (= res!462273 (and (bvslt (size!19561 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19561 a!3591))))))

(assert (=> start!62360 e!397056))

(assert (=> start!62360 true))

(declare-fun array_inv!14972 (array!40039) Bool)

(assert (=> start!62360 (array_inv!14972 a!3591)))

(declare-fun b!698460 () Bool)

(declare-fun res!462269 () Bool)

(assert (=> b!698460 (=> (not res!462269) (not e!397056))))

(declare-fun acc!652 () List!13217)

(assert (=> b!698460 (= res!462269 (noDuplicate!1041 acc!652))))

(declare-fun b!698461 () Bool)

(assert (=> b!698461 (= e!397056 false)))

(declare-fun lt!317268 () Bool)

(declare-fun contains!3794 (List!13217 (_ BitVec 64)) Bool)

(assert (=> b!698461 (= lt!317268 (contains!3794 acc!652 k!2824))))

(declare-fun b!698462 () Bool)

(declare-fun res!462272 () Bool)

(assert (=> b!698462 (=> (not res!462272) (not e!397056))))

(assert (=> b!698462 (= res!462272 (not (contains!3794 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698463 () Bool)

(declare-fun res!462271 () Bool)

(assert (=> b!698463 (=> (not res!462271) (not e!397056))))

(assert (=> b!698463 (= res!462271 (not (contains!3794 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62360 res!462273) b!698460))

(assert (= (and b!698460 res!462269) b!698459))

(assert (= (and b!698459 res!462268) b!698462))

(assert (= (and b!698462 res!462272) b!698463))

(assert (= (and b!698463 res!462271) b!698458))

(assert (= (and b!698458 res!462270) b!698461))

(declare-fun m!658711 () Bool)

(assert (=> b!698460 m!658711))

(declare-fun m!658713 () Bool)

(assert (=> b!698462 m!658713))

(declare-fun m!658715 () Bool)

(assert (=> b!698459 m!658715))

(declare-fun m!658717 () Bool)

(assert (=> start!62360 m!658717))

(declare-fun m!658719 () Bool)

(assert (=> b!698458 m!658719))

(declare-fun m!658721 () Bool)

(assert (=> b!698461 m!658721))

(declare-fun m!658723 () Bool)

(assert (=> b!698463 m!658723))

(push 1)

(assert (not b!698461))

(assert (not b!698459))

(assert (not start!62360))

(assert (not b!698460))

(assert (not b!698462))

(assert (not b!698458))

(assert (not b!698463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

