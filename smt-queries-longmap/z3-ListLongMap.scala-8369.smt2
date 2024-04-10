; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101820 () Bool)

(assert start!101820)

(declare-fun b!1226411 () Bool)

(declare-fun res!815062 () Bool)

(declare-fun e!696529 () Bool)

(assert (=> b!1226411 (=> (not res!815062) (not e!696529))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226411 (= res!815062 (validKeyInArray!0 k0!2913))))

(declare-fun b!1226413 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226413 (= e!696529 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun b!1226414 () Bool)

(declare-fun res!815064 () Bool)

(assert (=> b!1226414 (=> (not res!815064) (not e!696529))))

(declare-datatypes ((List!26978 0))(
  ( (Nil!26975) (Cons!26974 (h!28183 (_ BitVec 64)) (t!40441 List!26978)) )
))
(declare-fun acc!823 () List!26978)

(declare-fun noDuplicate!1637 (List!26978) Bool)

(assert (=> b!1226414 (= res!815064 (noDuplicate!1637 acc!823))))

(declare-fun b!1226415 () Bool)

(declare-fun res!815060 () Bool)

(assert (=> b!1226415 (=> (not res!815060) (not e!696529))))

(declare-fun contains!7040 (List!26978 (_ BitVec 64)) Bool)

(assert (=> b!1226415 (= res!815060 (not (contains!7040 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226416 () Bool)

(declare-fun res!815059 () Bool)

(assert (=> b!1226416 (=> (not res!815059) (not e!696529))))

(assert (=> b!1226416 (= res!815059 (not (contains!7040 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!815063 () Bool)

(assert (=> start!101820 (=> (not res!815063) (not e!696529))))

(declare-datatypes ((array!79159 0))(
  ( (array!79160 (arr!38205 (Array (_ BitVec 32) (_ BitVec 64))) (size!38741 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79159)

(assert (=> start!101820 (= res!815063 (bvslt (size!38741 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101820 e!696529))

(declare-fun array_inv!29053 (array!79159) Bool)

(assert (=> start!101820 (array_inv!29053 a!3806)))

(assert (=> start!101820 true))

(declare-fun b!1226412 () Bool)

(declare-fun res!815061 () Bool)

(assert (=> b!1226412 (=> (not res!815061) (not e!696529))))

(assert (=> b!1226412 (= res!815061 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38741 a!3806)) (bvslt from!3184 (size!38741 a!3806))))))

(assert (= (and start!101820 res!815063) b!1226411))

(assert (= (and b!1226411 res!815062) b!1226412))

(assert (= (and b!1226412 res!815061) b!1226414))

(assert (= (and b!1226414 res!815064) b!1226415))

(assert (= (and b!1226415 res!815060) b!1226416))

(assert (= (and b!1226416 res!815059) b!1226413))

(declare-fun m!1131523 () Bool)

(assert (=> b!1226416 m!1131523))

(declare-fun m!1131525 () Bool)

(assert (=> start!101820 m!1131525))

(declare-fun m!1131527 () Bool)

(assert (=> b!1226411 m!1131527))

(declare-fun m!1131529 () Bool)

(assert (=> b!1226415 m!1131529))

(declare-fun m!1131531 () Bool)

(assert (=> b!1226414 m!1131531))

(check-sat (not b!1226415) (not b!1226414) (not b!1226416) (not b!1226411) (not start!101820))
(check-sat)
