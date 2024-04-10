; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117116 () Bool)

(assert start!117116)

(declare-fun b!1378537 () Bool)

(declare-fun e!780936 () Bool)

(assert (=> b!1378537 (= e!780936 true)))

(declare-datatypes ((array!93733 0))(
  ( (array!93734 (arr!45267 (Array (_ BitVec 32) (_ BitVec 64))) (size!45817 (_ BitVec 32))) )
))
(declare-fun lt!606747 () array!93733)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun a!4094 () array!93733)

(declare-fun arrayCountValidKeys!0 (array!93733 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378537 (= (arrayCountValidKeys!0 lt!606747 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45797 0))(
  ( (Unit!45798) )
))
(declare-fun lt!606742 () Unit!45797)

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93733 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45797)

(assert (=> b!1378537 (= lt!606742 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378538 () Bool)

(declare-fun e!780937 () Bool)

(assert (=> b!1378538 (= e!780937 (not e!780936))))

(declare-fun res!921076 () Bool)

(assert (=> b!1378538 (=> res!921076 e!780936)))

(declare-fun lt!606744 () (_ BitVec 32))

(declare-fun lt!606746 () (_ BitVec 32))

(assert (=> b!1378538 (= res!921076 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45817 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606746 (bvsub lt!606744 #b00000000000000000000000000000001)))))))

(declare-fun lt!606750 () (_ BitVec 32))

(declare-fun lt!606745 () (_ BitVec 32))

(assert (=> b!1378538 (= (bvadd lt!606750 lt!606745) lt!606746)))

(assert (=> b!1378538 (= lt!606746 (arrayCountValidKeys!0 lt!606747 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378538 (= lt!606750 (arrayCountValidKeys!0 lt!606747 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606743 () Unit!45797)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45797)

(assert (=> b!1378538 (= lt!606743 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606747 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606748 () (_ BitVec 32))

(declare-fun lt!606741 () (_ BitVec 32))

(assert (=> b!1378538 (= (bvadd lt!606748 lt!606741) lt!606744)))

(assert (=> b!1378538 (= lt!606744 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378538 (= lt!606748 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606749 () Unit!45797)

(assert (=> b!1378538 (= lt!606749 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378539 () Bool)

(declare-fun e!780938 () Bool)

(assert (=> b!1378539 (= e!780938 e!780937)))

(declare-fun res!921075 () Bool)

(assert (=> b!1378539 (=> (not res!921075) (not e!780937))))

(assert (=> b!1378539 (= res!921075 (and (= lt!606745 (bvsub lt!606741 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378539 (= lt!606745 (arrayCountValidKeys!0 lt!606747 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378539 (= lt!606741 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378539 (= lt!606747 (array!93734 (store (arr!45267 a!4094) i!1451 k0!2953) (size!45817 a!4094)))))

(declare-fun b!1378540 () Bool)

(declare-fun res!921071 () Bool)

(assert (=> b!1378540 (=> (not res!921071) (not e!780938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378540 (= res!921071 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!921074 () Bool)

(assert (=> start!117116 (=> (not res!921074) (not e!780938))))

(assert (=> start!117116 (= res!921074 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45817 a!4094))))))

(assert (=> start!117116 e!780938))

(assert (=> start!117116 true))

(declare-fun array_inv!34295 (array!93733) Bool)

(assert (=> start!117116 (array_inv!34295 a!4094)))

(declare-fun b!1378541 () Bool)

(declare-fun res!921073 () Bool)

(assert (=> b!1378541 (=> (not res!921073) (not e!780938))))

(assert (=> b!1378541 (= res!921073 (validKeyInArray!0 (select (arr!45267 a!4094) i!1451)))))

(declare-fun b!1378542 () Bool)

(declare-fun res!921072 () Bool)

(assert (=> b!1378542 (=> (not res!921072) (not e!780938))))

(assert (=> b!1378542 (= res!921072 (and (bvslt (size!45817 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45817 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117116 res!921074) b!1378541))

(assert (= (and b!1378541 res!921073) b!1378540))

(assert (= (and b!1378540 res!921071) b!1378542))

(assert (= (and b!1378542 res!921072) b!1378539))

(assert (= (and b!1378539 res!921075) b!1378538))

(assert (= (and b!1378538 (not res!921076)) b!1378537))

(declare-fun m!1263239 () Bool)

(assert (=> b!1378540 m!1263239))

(declare-fun m!1263241 () Bool)

(assert (=> start!117116 m!1263241))

(declare-fun m!1263243 () Bool)

(assert (=> b!1378539 m!1263243))

(declare-fun m!1263245 () Bool)

(assert (=> b!1378539 m!1263245))

(declare-fun m!1263247 () Bool)

(assert (=> b!1378539 m!1263247))

(declare-fun m!1263249 () Bool)

(assert (=> b!1378537 m!1263249))

(declare-fun m!1263251 () Bool)

(assert (=> b!1378537 m!1263251))

(declare-fun m!1263253 () Bool)

(assert (=> b!1378537 m!1263253))

(declare-fun m!1263255 () Bool)

(assert (=> b!1378541 m!1263255))

(assert (=> b!1378541 m!1263255))

(declare-fun m!1263257 () Bool)

(assert (=> b!1378541 m!1263257))

(declare-fun m!1263259 () Bool)

(assert (=> b!1378538 m!1263259))

(declare-fun m!1263261 () Bool)

(assert (=> b!1378538 m!1263261))

(declare-fun m!1263263 () Bool)

(assert (=> b!1378538 m!1263263))

(declare-fun m!1263265 () Bool)

(assert (=> b!1378538 m!1263265))

(declare-fun m!1263267 () Bool)

(assert (=> b!1378538 m!1263267))

(declare-fun m!1263269 () Bool)

(assert (=> b!1378538 m!1263269))

(check-sat (not b!1378538) (not start!117116) (not b!1378539) (not b!1378537) (not b!1378541) (not b!1378540))
