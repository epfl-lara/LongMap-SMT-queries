; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117098 () Bool)

(assert start!117098)

(declare-fun b!1378388 () Bool)

(declare-fun e!780842 () Bool)

(declare-fun e!780841 () Bool)

(assert (=> b!1378388 (= e!780842 e!780841)))

(declare-fun res!920924 () Bool)

(assert (=> b!1378388 (=> (not res!920924) (not e!780841))))

(declare-fun lt!606539 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606536 () (_ BitVec 32))

(assert (=> b!1378388 (= res!920924 (and (= lt!606536 (bvsub lt!606539 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93715 0))(
  ( (array!93716 (arr!45258 (Array (_ BitVec 32) (_ BitVec 64))) (size!45808 (_ BitVec 32))) )
))
(declare-fun lt!606540 () array!93715)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93715 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378388 (= lt!606536 (arrayCountValidKeys!0 lt!606540 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93715)

(assert (=> b!1378388 (= lt!606539 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378388 (= lt!606540 (array!93716 (store (arr!45258 a!4094) i!1451 k0!2953) (size!45808 a!4094)))))

(declare-fun b!1378389 () Bool)

(declare-fun res!920923 () Bool)

(assert (=> b!1378389 (=> (not res!920923) (not e!780842))))

(assert (=> b!1378389 (= res!920923 (and (bvslt (size!45808 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45808 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378390 () Bool)

(declare-fun res!920926 () Bool)

(assert (=> b!1378390 (=> (not res!920926) (not e!780842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378390 (= res!920926 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!920922 () Bool)

(assert (=> start!117098 (=> (not res!920922) (not e!780842))))

(assert (=> start!117098 (= res!920922 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45808 a!4094))))))

(assert (=> start!117098 e!780842))

(assert (=> start!117098 true))

(declare-fun array_inv!34286 (array!93715) Bool)

(assert (=> start!117098 (array_inv!34286 a!4094)))

(declare-fun b!1378391 () Bool)

(assert (=> b!1378391 (= e!780841 (not true))))

(assert (=> b!1378391 (= (bvadd (arrayCountValidKeys!0 lt!606540 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606536) (arrayCountValidKeys!0 lt!606540 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45779 0))(
  ( (Unit!45780) )
))
(declare-fun lt!606537 () Unit!45779)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45779)

(assert (=> b!1378391 (= lt!606537 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606540 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378391 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606539) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606538 () Unit!45779)

(assert (=> b!1378391 (= lt!606538 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378392 () Bool)

(declare-fun res!920925 () Bool)

(assert (=> b!1378392 (=> (not res!920925) (not e!780842))))

(assert (=> b!1378392 (= res!920925 (validKeyInArray!0 (select (arr!45258 a!4094) i!1451)))))

(assert (= (and start!117098 res!920922) b!1378392))

(assert (= (and b!1378392 res!920925) b!1378390))

(assert (= (and b!1378390 res!920926) b!1378389))

(assert (= (and b!1378389 res!920923) b!1378388))

(assert (= (and b!1378388 res!920924) b!1378391))

(declare-fun m!1262981 () Bool)

(assert (=> b!1378390 m!1262981))

(declare-fun m!1262983 () Bool)

(assert (=> b!1378388 m!1262983))

(declare-fun m!1262985 () Bool)

(assert (=> b!1378388 m!1262985))

(declare-fun m!1262987 () Bool)

(assert (=> b!1378388 m!1262987))

(declare-fun m!1262989 () Bool)

(assert (=> b!1378391 m!1262989))

(declare-fun m!1262991 () Bool)

(assert (=> b!1378391 m!1262991))

(declare-fun m!1262993 () Bool)

(assert (=> b!1378391 m!1262993))

(declare-fun m!1262995 () Bool)

(assert (=> b!1378391 m!1262995))

(declare-fun m!1262997 () Bool)

(assert (=> b!1378391 m!1262997))

(declare-fun m!1262999 () Bool)

(assert (=> b!1378391 m!1262999))

(declare-fun m!1263001 () Bool)

(assert (=> start!117098 m!1263001))

(declare-fun m!1263003 () Bool)

(assert (=> b!1378392 m!1263003))

(assert (=> b!1378392 m!1263003))

(declare-fun m!1263005 () Bool)

(assert (=> b!1378392 m!1263005))

(check-sat (not b!1378391) (not b!1378392) (not start!117098) (not b!1378388) (not b!1378390))
(check-sat)
