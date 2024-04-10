; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101828 () Bool)

(assert start!101828)

(declare-fun b!1226475 () Bool)

(declare-fun res!815125 () Bool)

(declare-fun e!696553 () Bool)

(assert (=> b!1226475 (=> (not res!815125) (not e!696553))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226475 (= res!815125 (validKeyInArray!0 k!2913))))

(declare-fun b!1226476 () Bool)

(declare-fun res!815123 () Bool)

(assert (=> b!1226476 (=> (not res!815123) (not e!696553))))

(declare-datatypes ((List!26982 0))(
  ( (Nil!26979) (Cons!26978 (h!28187 (_ BitVec 64)) (t!40445 List!26982)) )
))
(declare-fun acc!823 () List!26982)

(declare-fun noDuplicate!1641 (List!26982) Bool)

(assert (=> b!1226476 (= res!815123 (noDuplicate!1641 acc!823))))

(declare-fun b!1226477 () Bool)

(assert (=> b!1226477 (= e!696553 false)))

(declare-fun lt!558819 () Bool)

(declare-fun contains!7044 (List!26982 (_ BitVec 64)) Bool)

(assert (=> b!1226477 (= lt!558819 (contains!7044 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226479 () Bool)

(declare-fun res!815124 () Bool)

(assert (=> b!1226479 (=> (not res!815124) (not e!696553))))

(assert (=> b!1226479 (= res!815124 (not (contains!7044 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!815127 () Bool)

(assert (=> start!101828 (=> (not res!815127) (not e!696553))))

(declare-datatypes ((array!79167 0))(
  ( (array!79168 (arr!38209 (Array (_ BitVec 32) (_ BitVec 64))) (size!38745 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79167)

(assert (=> start!101828 (= res!815127 (bvslt (size!38745 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101828 e!696553))

(declare-fun array_inv!29057 (array!79167) Bool)

(assert (=> start!101828 (array_inv!29057 a!3806)))

(assert (=> start!101828 true))

(declare-fun b!1226478 () Bool)

(declare-fun res!815126 () Bool)

(assert (=> b!1226478 (=> (not res!815126) (not e!696553))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226478 (= res!815126 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38745 a!3806)) (bvslt from!3184 (size!38745 a!3806))))))

(assert (= (and start!101828 res!815127) b!1226475))

(assert (= (and b!1226475 res!815125) b!1226478))

(assert (= (and b!1226478 res!815126) b!1226476))

(assert (= (and b!1226476 res!815123) b!1226479))

(assert (= (and b!1226479 res!815124) b!1226477))

(declare-fun m!1131563 () Bool)

(assert (=> b!1226477 m!1131563))

(declare-fun m!1131565 () Bool)

(assert (=> b!1226475 m!1131565))

(declare-fun m!1131567 () Bool)

(assert (=> b!1226476 m!1131567))

(declare-fun m!1131569 () Bool)

(assert (=> b!1226479 m!1131569))

(declare-fun m!1131571 () Bool)

(assert (=> start!101828 m!1131571))

(push 1)

(assert (not b!1226475))

(assert (not b!1226476))

(assert (not start!101828))

(assert (not b!1226477))

(assert (not b!1226479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

