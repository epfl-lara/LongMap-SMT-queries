; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101836 () Bool)

(assert start!101836)

(declare-fun b!1226539 () Bool)

(declare-fun res!815192 () Bool)

(declare-fun e!696577 () Bool)

(assert (=> b!1226539 (=> (not res!815192) (not e!696577))))

(declare-datatypes ((List!26986 0))(
  ( (Nil!26983) (Cons!26982 (h!28191 (_ BitVec 64)) (t!40449 List!26986)) )
))
(declare-fun acc!823 () List!26986)

(declare-fun noDuplicate!1645 (List!26986) Bool)

(assert (=> b!1226539 (= res!815192 (noDuplicate!1645 acc!823))))

(declare-fun b!1226540 () Bool)

(declare-fun res!815189 () Bool)

(assert (=> b!1226540 (=> (not res!815189) (not e!696577))))

(declare-fun contains!7048 (List!26986 (_ BitVec 64)) Bool)

(assert (=> b!1226540 (= res!815189 (not (contains!7048 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226541 () Bool)

(declare-fun res!815187 () Bool)

(assert (=> b!1226541 (=> (not res!815187) (not e!696577))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226541 (= res!815187 (validKeyInArray!0 k!2913))))

(declare-fun b!1226542 () Bool)

(declare-fun res!815191 () Bool)

(assert (=> b!1226542 (=> (not res!815191) (not e!696577))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79175 0))(
  ( (array!79176 (arr!38213 (Array (_ BitVec 32) (_ BitVec 64))) (size!38749 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79175)

(declare-fun arrayContainsKey!0 (array!79175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226542 (= res!815191 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!815193 () Bool)

(assert (=> start!101836 (=> (not res!815193) (not e!696577))))

(assert (=> start!101836 (= res!815193 (bvslt (size!38749 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101836 e!696577))

(declare-fun array_inv!29061 (array!79175) Bool)

(assert (=> start!101836 (array_inv!29061 a!3806)))

(assert (=> start!101836 true))

(declare-fun b!1226543 () Bool)

(declare-fun res!815188 () Bool)

(assert (=> b!1226543 (=> (not res!815188) (not e!696577))))

(assert (=> b!1226543 (= res!815188 (not (contains!7048 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226544 () Bool)

(declare-fun res!815190 () Bool)

(assert (=> b!1226544 (=> (not res!815190) (not e!696577))))

(assert (=> b!1226544 (= res!815190 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38749 a!3806)) (bvslt from!3184 (size!38749 a!3806))))))

(declare-fun b!1226545 () Bool)

(assert (=> b!1226545 (= e!696577 (bvsgt from!3184 (size!38749 a!3806)))))

(assert (= (and start!101836 res!815193) b!1226541))

(assert (= (and b!1226541 res!815187) b!1226544))

(assert (= (and b!1226544 res!815190) b!1226539))

(assert (= (and b!1226539 res!815192) b!1226543))

(assert (= (and b!1226543 res!815188) b!1226540))

(assert (= (and b!1226540 res!815189) b!1226542))

(assert (= (and b!1226542 res!815191) b!1226545))

(declare-fun m!1131603 () Bool)

(assert (=> b!1226539 m!1131603))

(declare-fun m!1131605 () Bool)

(assert (=> b!1226541 m!1131605))

(declare-fun m!1131607 () Bool)

(assert (=> start!101836 m!1131607))

(declare-fun m!1131609 () Bool)

(assert (=> b!1226540 m!1131609))

(declare-fun m!1131611 () Bool)

(assert (=> b!1226542 m!1131611))

(declare-fun m!1131613 () Bool)

(assert (=> b!1226543 m!1131613))

(push 1)

(assert (not b!1226540))

(assert (not b!1226539))

(assert (not b!1226543))

(assert (not b!1226542))

(assert (not b!1226541))

(assert (not start!101836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

