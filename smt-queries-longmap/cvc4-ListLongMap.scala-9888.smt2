; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117306 () Bool)

(assert start!117306)

(declare-fun b!1379518 () Bool)

(declare-fun e!781583 () Bool)

(declare-fun e!781584 () Bool)

(assert (=> b!1379518 (= e!781583 e!781584)))

(declare-fun res!921266 () Bool)

(assert (=> b!1379518 (=> (not res!921266) (not e!781584))))

(declare-fun lt!606837 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606840 () (_ BitVec 32))

(assert (=> b!1379518 (= res!921266 (and (= lt!606840 (bvsub lt!606837 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93807 0))(
  ( (array!93808 (arr!45299 (Array (_ BitVec 32) (_ BitVec 64))) (size!45850 (_ BitVec 32))) )
))
(declare-fun lt!606841 () array!93807)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93807 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379518 (= lt!606840 (arrayCountValidKeys!0 lt!606841 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93807)

(assert (=> b!1379518 (= lt!606837 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379518 (= lt!606841 (array!93808 (store (arr!45299 a!4094) i!1451 k!2953) (size!45850 a!4094)))))

(declare-fun b!1379519 () Bool)

(declare-fun res!921264 () Bool)

(assert (=> b!1379519 (=> (not res!921264) (not e!781583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379519 (= res!921264 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379520 () Bool)

(assert (=> b!1379520 (= e!781584 (not true))))

(assert (=> b!1379520 (= (bvadd (arrayCountValidKeys!0 lt!606841 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606840) (arrayCountValidKeys!0 lt!606841 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45694 0))(
  ( (Unit!45695) )
))
(declare-fun lt!606839 () Unit!45694)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45694)

(assert (=> b!1379520 (= lt!606839 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606841 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379520 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606837) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606838 () Unit!45694)

(assert (=> b!1379520 (= lt!606838 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921267 () Bool)

(assert (=> start!117306 (=> (not res!921267) (not e!781583))))

(assert (=> start!117306 (= res!921267 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45850 a!4094))))))

(assert (=> start!117306 e!781583))

(assert (=> start!117306 true))

(declare-fun array_inv!34580 (array!93807) Bool)

(assert (=> start!117306 (array_inv!34580 a!4094)))

(declare-fun b!1379521 () Bool)

(declare-fun res!921265 () Bool)

(assert (=> b!1379521 (=> (not res!921265) (not e!781583))))

(assert (=> b!1379521 (= res!921265 (validKeyInArray!0 (select (arr!45299 a!4094) i!1451)))))

(declare-fun b!1379522 () Bool)

(declare-fun res!921263 () Bool)

(assert (=> b!1379522 (=> (not res!921263) (not e!781583))))

(assert (=> b!1379522 (= res!921263 (and (bvslt (size!45850 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45850 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117306 res!921267) b!1379521))

(assert (= (and b!1379521 res!921265) b!1379519))

(assert (= (and b!1379519 res!921264) b!1379522))

(assert (= (and b!1379522 res!921263) b!1379518))

(assert (= (and b!1379518 res!921266) b!1379520))

(declare-fun m!1264305 () Bool)

(assert (=> b!1379520 m!1264305))

(declare-fun m!1264307 () Bool)

(assert (=> b!1379520 m!1264307))

(declare-fun m!1264309 () Bool)

(assert (=> b!1379520 m!1264309))

(declare-fun m!1264311 () Bool)

(assert (=> b!1379520 m!1264311))

(declare-fun m!1264313 () Bool)

(assert (=> b!1379520 m!1264313))

(declare-fun m!1264315 () Bool)

(assert (=> b!1379520 m!1264315))

(declare-fun m!1264317 () Bool)

(assert (=> b!1379519 m!1264317))

(declare-fun m!1264319 () Bool)

(assert (=> b!1379518 m!1264319))

(declare-fun m!1264321 () Bool)

(assert (=> b!1379518 m!1264321))

(declare-fun m!1264323 () Bool)

(assert (=> b!1379518 m!1264323))

(declare-fun m!1264325 () Bool)

(assert (=> start!117306 m!1264325))

(declare-fun m!1264327 () Bool)

(assert (=> b!1379521 m!1264327))

(assert (=> b!1379521 m!1264327))

(declare-fun m!1264329 () Bool)

(assert (=> b!1379521 m!1264329))

(push 1)

(assert (not b!1379521))

(assert (not b!1379518))

(assert (not b!1379519))

(assert (not start!117306))

(assert (not b!1379520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

