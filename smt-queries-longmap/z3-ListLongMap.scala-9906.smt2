; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117182 () Bool)

(assert start!117182)

(declare-fun b!1379045 () Bool)

(declare-fun res!921579 () Bool)

(declare-fun e!781201 () Bool)

(assert (=> b!1379045 (=> (not res!921579) (not e!781201))))

(declare-datatypes ((array!93799 0))(
  ( (array!93800 (arr!45300 (Array (_ BitVec 32) (_ BitVec 64))) (size!45850 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93799)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379045 (= res!921579 (validKeyInArray!0 (select (arr!45300 a!4094) i!1451)))))

(declare-fun b!1379046 () Bool)

(declare-fun res!921581 () Bool)

(assert (=> b!1379046 (=> (not res!921581) (not e!781201))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379046 (= res!921581 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379047 () Bool)

(declare-fun res!921582 () Bool)

(assert (=> b!1379047 (=> (not res!921582) (not e!781201))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379047 (= res!921582 (and (bvslt (size!45850 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45850 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379048 () Bool)

(declare-fun e!781202 () Bool)

(assert (=> b!1379048 (= e!781201 e!781202)))

(declare-fun res!921580 () Bool)

(assert (=> b!1379048 (=> (not res!921580) (not e!781202))))

(declare-fun lt!607077 () (_ BitVec 32))

(declare-fun lt!607078 () (_ BitVec 32))

(assert (=> b!1379048 (= res!921580 (and (= lt!607078 (bvsub lt!607077 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607076 () array!93799)

(declare-fun arrayCountValidKeys!0 (array!93799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379048 (= lt!607078 (arrayCountValidKeys!0 lt!607076 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379048 (= lt!607077 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379048 (= lt!607076 (array!93800 (store (arr!45300 a!4094) i!1451 k0!2953) (size!45850 a!4094)))))

(declare-fun res!921583 () Bool)

(assert (=> start!117182 (=> (not res!921583) (not e!781201))))

(assert (=> start!117182 (= res!921583 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45850 a!4094))))))

(assert (=> start!117182 e!781201))

(assert (=> start!117182 true))

(declare-fun array_inv!34328 (array!93799) Bool)

(assert (=> start!117182 (array_inv!34328 a!4094)))

(declare-fun b!1379049 () Bool)

(assert (=> b!1379049 (= e!781202 (not true))))

(assert (=> b!1379049 (= (bvadd (arrayCountValidKeys!0 lt!607076 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607078) (arrayCountValidKeys!0 lt!607076 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45827 0))(
  ( (Unit!45828) )
))
(declare-fun lt!607079 () Unit!45827)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45827)

(assert (=> b!1379049 (= lt!607079 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607076 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379049 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607077) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607080 () Unit!45827)

(assert (=> b!1379049 (= lt!607080 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117182 res!921583) b!1379045))

(assert (= (and b!1379045 res!921579) b!1379046))

(assert (= (and b!1379046 res!921581) b!1379047))

(assert (= (and b!1379047 res!921582) b!1379048))

(assert (= (and b!1379048 res!921580) b!1379049))

(declare-fun m!1263893 () Bool)

(assert (=> start!117182 m!1263893))

(declare-fun m!1263895 () Bool)

(assert (=> b!1379049 m!1263895))

(declare-fun m!1263897 () Bool)

(assert (=> b!1379049 m!1263897))

(declare-fun m!1263899 () Bool)

(assert (=> b!1379049 m!1263899))

(declare-fun m!1263901 () Bool)

(assert (=> b!1379049 m!1263901))

(declare-fun m!1263903 () Bool)

(assert (=> b!1379049 m!1263903))

(declare-fun m!1263905 () Bool)

(assert (=> b!1379049 m!1263905))

(declare-fun m!1263907 () Bool)

(assert (=> b!1379045 m!1263907))

(assert (=> b!1379045 m!1263907))

(declare-fun m!1263909 () Bool)

(assert (=> b!1379045 m!1263909))

(declare-fun m!1263911 () Bool)

(assert (=> b!1379048 m!1263911))

(declare-fun m!1263913 () Bool)

(assert (=> b!1379048 m!1263913))

(declare-fun m!1263915 () Bool)

(assert (=> b!1379048 m!1263915))

(declare-fun m!1263917 () Bool)

(assert (=> b!1379046 m!1263917))

(check-sat (not start!117182) (not b!1379048) (not b!1379046) (not b!1379049) (not b!1379045))
