; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62364 () Bool)

(assert start!62364)

(declare-fun b!698494 () Bool)

(declare-fun res!462309 () Bool)

(declare-fun e!397069 () Bool)

(assert (=> b!698494 (=> (not res!462309) (not e!397069))))

(declare-datatypes ((List!13219 0))(
  ( (Nil!13216) (Cons!13215 (h!14260 (_ BitVec 64)) (t!19501 List!13219)) )
))
(declare-fun acc!652 () List!13219)

(declare-fun contains!3796 (List!13219 (_ BitVec 64)) Bool)

(assert (=> b!698494 (= res!462309 (not (contains!3796 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698495 () Bool)

(declare-fun res!462305 () Bool)

(assert (=> b!698495 (=> (not res!462305) (not e!397069))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40043 0))(
  ( (array!40044 (arr!19178 (Array (_ BitVec 32) (_ BitVec 64))) (size!19563 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40043)

(declare-fun arrayContainsKey!0 (array!40043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698495 (= res!462305 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698496 () Bool)

(declare-fun res!462304 () Bool)

(assert (=> b!698496 (=> (not res!462304) (not e!397069))))

(declare-fun newAcc!49 () List!13219)

(declare-fun noDuplicate!1043 (List!13219) Bool)

(assert (=> b!698496 (= res!462304 (noDuplicate!1043 newAcc!49))))

(declare-fun b!698497 () Bool)

(declare-fun res!462308 () Bool)

(assert (=> b!698497 (=> (not res!462308) (not e!397069))))

(assert (=> b!698497 (= res!462308 (not (contains!3796 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462306 () Bool)

(assert (=> start!62364 (=> (not res!462306) (not e!397069))))

(assert (=> start!62364 (= res!462306 (and (bvslt (size!19563 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19563 a!3591))))))

(assert (=> start!62364 e!397069))

(assert (=> start!62364 true))

(declare-fun array_inv!14974 (array!40043) Bool)

(assert (=> start!62364 (array_inv!14974 a!3591)))

(declare-fun b!698498 () Bool)

(declare-fun res!462307 () Bool)

(assert (=> b!698498 (=> (not res!462307) (not e!397069))))

(assert (=> b!698498 (= res!462307 (noDuplicate!1043 acc!652))))

(declare-fun b!698499 () Bool)

(assert (=> b!698499 (= e!397069 false)))

(declare-fun lt!317274 () Bool)

(assert (=> b!698499 (= lt!317274 (contains!3796 acc!652 k!2824))))

(assert (= (and start!62364 res!462306) b!698498))

(assert (= (and b!698498 res!462307) b!698496))

(assert (= (and b!698496 res!462304) b!698494))

(assert (= (and b!698494 res!462309) b!698497))

(assert (= (and b!698497 res!462308) b!698495))

(assert (= (and b!698495 res!462305) b!698499))

(declare-fun m!658739 () Bool)

(assert (=> b!698498 m!658739))

(declare-fun m!658741 () Bool)

(assert (=> b!698496 m!658741))

(declare-fun m!658743 () Bool)

(assert (=> b!698495 m!658743))

(declare-fun m!658745 () Bool)

(assert (=> b!698494 m!658745))

(declare-fun m!658747 () Bool)

(assert (=> b!698497 m!658747))

(declare-fun m!658749 () Bool)

(assert (=> b!698499 m!658749))

(declare-fun m!658751 () Bool)

(assert (=> start!62364 m!658751))

(push 1)

(assert (not b!698495))

(assert (not b!698498))

(assert (not b!698496))

(assert (not b!698494))

(assert (not b!698499))

(assert (not start!62364))

(assert (not b!698497))

(check-sat)

(pop 1)

(push 1)

