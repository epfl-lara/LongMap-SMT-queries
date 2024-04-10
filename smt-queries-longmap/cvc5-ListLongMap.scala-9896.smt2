; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117120 () Bool)

(assert start!117120)

(declare-fun b!1378573 () Bool)

(declare-fun e!780959 () Bool)

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378573 (= e!780959 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((array!93737 0))(
  ( (array!93738 (arr!45269 (Array (_ BitVec 32) (_ BitVec 64))) (size!45819 (_ BitVec 32))) )
))
(declare-fun lt!606802 () array!93737)

(declare-fun a!4094 () array!93737)

(declare-fun arrayCountValidKeys!0 (array!93737 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378573 (= (arrayCountValidKeys!0 lt!606802 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-datatypes ((Unit!45801 0))(
  ( (Unit!45802) )
))
(declare-fun lt!606806 () Unit!45801)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45801)

(assert (=> b!1378573 (= lt!606806 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378574 () Bool)

(declare-fun e!780962 () Bool)

(declare-fun e!780961 () Bool)

(assert (=> b!1378574 (= e!780962 e!780961)))

(declare-fun res!921111 () Bool)

(assert (=> b!1378574 (=> (not res!921111) (not e!780961))))

(declare-fun lt!606805 () (_ BitVec 32))

(declare-fun lt!606807 () (_ BitVec 32))

(assert (=> b!1378574 (= res!921111 (and (= lt!606807 (bvsub lt!606805 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378574 (= lt!606807 (arrayCountValidKeys!0 lt!606802 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378574 (= lt!606805 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378574 (= lt!606802 (array!93738 (store (arr!45269 a!4094) i!1451 k!2953) (size!45819 a!4094)))))

(declare-fun b!1378576 () Bool)

(assert (=> b!1378576 (= e!780961 (not e!780959))))

(declare-fun res!921107 () Bool)

(assert (=> b!1378576 (=> res!921107 e!780959)))

(declare-fun lt!606801 () (_ BitVec 32))

(declare-fun lt!606809 () (_ BitVec 32))

(assert (=> b!1378576 (= res!921107 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45819 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606809 (bvsub lt!606801 #b00000000000000000000000000000001)))))))

(declare-fun lt!606804 () (_ BitVec 32))

(assert (=> b!1378576 (= (bvadd lt!606804 lt!606807) lt!606809)))

(assert (=> b!1378576 (= lt!606809 (arrayCountValidKeys!0 lt!606802 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378576 (= lt!606804 (arrayCountValidKeys!0 lt!606802 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606808 () Unit!45801)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45801)

(assert (=> b!1378576 (= lt!606808 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606802 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606803 () (_ BitVec 32))

(assert (=> b!1378576 (= (bvadd lt!606803 lt!606805) lt!606801)))

(assert (=> b!1378576 (= lt!606801 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378576 (= lt!606803 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606810 () Unit!45801)

(assert (=> b!1378576 (= lt!606810 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921112 () Bool)

(assert (=> start!117120 (=> (not res!921112) (not e!780962))))

(assert (=> start!117120 (= res!921112 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45819 a!4094))))))

(assert (=> start!117120 e!780962))

(assert (=> start!117120 true))

(declare-fun array_inv!34297 (array!93737) Bool)

(assert (=> start!117120 (array_inv!34297 a!4094)))

(declare-fun b!1378575 () Bool)

(declare-fun res!921109 () Bool)

(assert (=> b!1378575 (=> (not res!921109) (not e!780962))))

(assert (=> b!1378575 (= res!921109 (and (bvslt (size!45819 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45819 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378577 () Bool)

(declare-fun res!921110 () Bool)

(assert (=> b!1378577 (=> (not res!921110) (not e!780962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378577 (= res!921110 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378578 () Bool)

(declare-fun res!921108 () Bool)

(assert (=> b!1378578 (=> (not res!921108) (not e!780962))))

(assert (=> b!1378578 (= res!921108 (validKeyInArray!0 (select (arr!45269 a!4094) i!1451)))))

(assert (= (and start!117120 res!921112) b!1378578))

(assert (= (and b!1378578 res!921108) b!1378577))

(assert (= (and b!1378577 res!921110) b!1378575))

(assert (= (and b!1378575 res!921109) b!1378574))

(assert (= (and b!1378574 res!921111) b!1378576))

(assert (= (and b!1378576 (not res!921107)) b!1378573))

(declare-fun m!1263303 () Bool)

(assert (=> b!1378577 m!1263303))

(declare-fun m!1263305 () Bool)

(assert (=> b!1378574 m!1263305))

(declare-fun m!1263307 () Bool)

(assert (=> b!1378574 m!1263307))

(declare-fun m!1263309 () Bool)

(assert (=> b!1378574 m!1263309))

(declare-fun m!1263311 () Bool)

(assert (=> b!1378573 m!1263311))

(declare-fun m!1263313 () Bool)

(assert (=> b!1378573 m!1263313))

(declare-fun m!1263315 () Bool)

(assert (=> b!1378573 m!1263315))

(declare-fun m!1263317 () Bool)

(assert (=> start!117120 m!1263317))

(declare-fun m!1263319 () Bool)

(assert (=> b!1378578 m!1263319))

(assert (=> b!1378578 m!1263319))

(declare-fun m!1263321 () Bool)

(assert (=> b!1378578 m!1263321))

(declare-fun m!1263323 () Bool)

(assert (=> b!1378576 m!1263323))

(declare-fun m!1263325 () Bool)

(assert (=> b!1378576 m!1263325))

(declare-fun m!1263327 () Bool)

(assert (=> b!1378576 m!1263327))

(declare-fun m!1263329 () Bool)

(assert (=> b!1378576 m!1263329))

(declare-fun m!1263331 () Bool)

(assert (=> b!1378576 m!1263331))

(declare-fun m!1263333 () Bool)

(assert (=> b!1378576 m!1263333))

(push 1)

(assert (not b!1378573))

(assert (not b!1378576))

(assert (not b!1378574))

(assert (not b!1378577))

(assert (not start!117120))

(assert (not b!1378578))

(check-sat)

