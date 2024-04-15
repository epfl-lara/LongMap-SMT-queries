; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117076 () Bool)

(assert start!117076)

(declare-fun res!920763 () Bool)

(declare-fun e!780729 () Bool)

(assert (=> start!117076 (=> (not res!920763) (not e!780729))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93647 0))(
  ( (array!93648 (arr!45224 (Array (_ BitVec 32) (_ BitVec 64))) (size!45776 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93647)

(assert (=> start!117076 (= res!920763 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45776 a!4094))))))

(assert (=> start!117076 e!780729))

(assert (=> start!117076 true))

(declare-fun array_inv!34457 (array!93647) Bool)

(assert (=> start!117076 (array_inv!34457 a!4094)))

(declare-fun b!1378184 () Bool)

(declare-fun res!920764 () Bool)

(assert (=> b!1378184 (=> (not res!920764) (not e!780729))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378184 (= res!920764 (and (bvslt (size!45776 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45776 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378185 () Bool)

(declare-fun res!920761 () Bool)

(assert (=> b!1378185 (=> (not res!920761) (not e!780729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378185 (= res!920761 (validKeyInArray!0 (select (arr!45224 a!4094) i!1451)))))

(declare-fun b!1378186 () Bool)

(declare-fun res!920762 () Bool)

(assert (=> b!1378186 (=> (not res!920762) (not e!780729))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378186 (= res!920762 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378187 () Bool)

(declare-fun e!780730 () Bool)

(assert (=> b!1378187 (= e!780729 e!780730)))

(declare-fun res!920765 () Bool)

(assert (=> b!1378187 (=> (not res!920765) (not e!780730))))

(declare-fun lt!606220 () (_ BitVec 32))

(declare-fun lt!606218 () (_ BitVec 32))

(assert (=> b!1378187 (= res!920765 (and (= lt!606220 (bvsub lt!606218 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606217 () array!93647)

(declare-fun arrayCountValidKeys!0 (array!93647 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378187 (= lt!606220 (arrayCountValidKeys!0 lt!606217 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378187 (= lt!606218 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378187 (= lt!606217 (array!93648 (store (arr!45224 a!4094) i!1451 k!2953) (size!45776 a!4094)))))

(declare-fun b!1378188 () Bool)

(assert (=> b!1378188 (= e!780730 (not true))))

(assert (=> b!1378188 (= (bvadd (arrayCountValidKeys!0 lt!606217 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606220) (arrayCountValidKeys!0 lt!606217 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45602 0))(
  ( (Unit!45603) )
))
(declare-fun lt!606221 () Unit!45602)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45602)

(assert (=> b!1378188 (= lt!606221 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606217 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378188 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606218) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606219 () Unit!45602)

(assert (=> b!1378188 (= lt!606219 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117076 res!920763) b!1378185))

(assert (= (and b!1378185 res!920761) b!1378186))

(assert (= (and b!1378186 res!920762) b!1378184))

(assert (= (and b!1378184 res!920764) b!1378187))

(assert (= (and b!1378187 res!920765) b!1378188))

(declare-fun m!1262243 () Bool)

(assert (=> b!1378185 m!1262243))

(assert (=> b!1378185 m!1262243))

(declare-fun m!1262245 () Bool)

(assert (=> b!1378185 m!1262245))

(declare-fun m!1262247 () Bool)

(assert (=> b!1378188 m!1262247))

(declare-fun m!1262249 () Bool)

(assert (=> b!1378188 m!1262249))

(declare-fun m!1262251 () Bool)

(assert (=> b!1378188 m!1262251))

(declare-fun m!1262253 () Bool)

(assert (=> b!1378188 m!1262253))

(declare-fun m!1262255 () Bool)

(assert (=> b!1378188 m!1262255))

(declare-fun m!1262257 () Bool)

(assert (=> b!1378188 m!1262257))

(declare-fun m!1262259 () Bool)

(assert (=> b!1378187 m!1262259))

(declare-fun m!1262261 () Bool)

(assert (=> b!1378187 m!1262261))

(declare-fun m!1262263 () Bool)

(assert (=> b!1378187 m!1262263))

(declare-fun m!1262265 () Bool)

(assert (=> start!117076 m!1262265))

(declare-fun m!1262267 () Bool)

(assert (=> b!1378186 m!1262267))

(push 1)

(assert (not b!1378188))

(assert (not start!117076))

(assert (not b!1378185))

(assert (not b!1378187))

(assert (not b!1378186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

