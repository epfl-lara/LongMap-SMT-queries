; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101846 () Bool)

(assert start!101846)

(declare-fun b!1226628 () Bool)

(declare-fun res!815278 () Bool)

(declare-fun e!696607 () Bool)

(assert (=> b!1226628 (=> (not res!815278) (not e!696607))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226628 (= res!815278 (validKeyInArray!0 k!2913))))

(declare-fun res!815279 () Bool)

(assert (=> start!101846 (=> (not res!815279) (not e!696607))))

(declare-datatypes ((array!79185 0))(
  ( (array!79186 (arr!38218 (Array (_ BitVec 32) (_ BitVec 64))) (size!38754 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79185)

(assert (=> start!101846 (= res!815279 (bvslt (size!38754 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101846 e!696607))

(declare-fun array_inv!29066 (array!79185) Bool)

(assert (=> start!101846 (array_inv!29066 a!3806)))

(assert (=> start!101846 true))

(declare-fun b!1226629 () Bool)

(declare-fun res!815276 () Bool)

(assert (=> b!1226629 (=> (not res!815276) (not e!696607))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226629 (= res!815276 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38754 a!3806)) (bvslt from!3184 (size!38754 a!3806))))))

(declare-fun b!1226630 () Bool)

(declare-fun res!815277 () Bool)

(assert (=> b!1226630 (=> (not res!815277) (not e!696607))))

(declare-datatypes ((List!26991 0))(
  ( (Nil!26988) (Cons!26987 (h!28196 (_ BitVec 64)) (t!40454 List!26991)) )
))
(declare-fun acc!823 () List!26991)

(declare-fun contains!7053 (List!26991 (_ BitVec 64)) Bool)

(assert (=> b!1226630 (= res!815277 (not (contains!7053 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226631 () Bool)

(declare-fun res!815280 () Bool)

(assert (=> b!1226631 (=> (not res!815280) (not e!696607))))

(declare-fun noDuplicate!1650 (List!26991) Bool)

(assert (=> b!1226631 (= res!815280 (noDuplicate!1650 acc!823))))

(declare-fun b!1226632 () Bool)

(assert (=> b!1226632 (= e!696607 false)))

(declare-fun lt!558837 () Bool)

(assert (=> b!1226632 (= lt!558837 (contains!7053 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!101846 res!815279) b!1226628))

(assert (= (and b!1226628 res!815278) b!1226629))

(assert (= (and b!1226629 res!815276) b!1226631))

(assert (= (and b!1226631 res!815280) b!1226630))

(assert (= (and b!1226630 res!815277) b!1226632))

(declare-fun m!1131659 () Bool)

(assert (=> b!1226628 m!1131659))

(declare-fun m!1131661 () Bool)

(assert (=> b!1226630 m!1131661))

(declare-fun m!1131663 () Bool)

(assert (=> start!101846 m!1131663))

(declare-fun m!1131665 () Bool)

(assert (=> b!1226632 m!1131665))

(declare-fun m!1131667 () Bool)

(assert (=> b!1226631 m!1131667))

(push 1)

(assert (not b!1226632))

(assert (not b!1226628))

(assert (not b!1226630))

(assert (not start!101846))

(assert (not b!1226631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

