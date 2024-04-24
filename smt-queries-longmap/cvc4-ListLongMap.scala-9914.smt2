; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117486 () Bool)

(assert start!117486)

(declare-fun b!1380825 () Bool)

(declare-fun res!922478 () Bool)

(declare-fun e!782329 () Bool)

(assert (=> b!1380825 (=> (not res!922478) (not e!782329))))

(declare-datatypes ((array!93966 0))(
  ( (array!93967 (arr!45377 (Array (_ BitVec 32) (_ BitVec 64))) (size!45928 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93966)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1380825 (= res!922478 (and (bvslt (size!45928 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45928 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1380826 () Bool)

(declare-fun res!922474 () Bool)

(assert (=> b!1380826 (=> (not res!922474) (not e!782329))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380826 (= res!922474 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380827 () Bool)

(declare-fun e!782328 () Bool)

(declare-fun e!782330 () Bool)

(assert (=> b!1380827 (= e!782328 (not e!782330))))

(declare-fun res!922479 () Bool)

(assert (=> b!1380827 (=> res!922479 e!782330)))

(declare-fun lt!608103 () (_ BitVec 32))

(declare-fun lt!608095 () (_ BitVec 32))

(assert (=> b!1380827 (= res!922479 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45928 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!608095 (bvsub lt!608103 #b00000000000000000000000000000001)))))))

(declare-fun lt!608096 () (_ BitVec 32))

(declare-fun lt!608101 () (_ BitVec 32))

(assert (=> b!1380827 (= (bvadd lt!608096 lt!608101) lt!608095)))

(declare-fun lt!608100 () array!93966)

(declare-fun arrayCountValidKeys!0 (array!93966 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380827 (= lt!608095 (arrayCountValidKeys!0 lt!608100 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380827 (= lt!608096 (arrayCountValidKeys!0 lt!608100 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45814 0))(
  ( (Unit!45815) )
))
(declare-fun lt!608098 () Unit!45814)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45814)

(assert (=> b!1380827 (= lt!608098 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!608100 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!608099 () (_ BitVec 32))

(declare-fun lt!608102 () (_ BitVec 32))

(assert (=> b!1380827 (= (bvadd lt!608099 lt!608102) lt!608103)))

(assert (=> b!1380827 (= lt!608103 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380827 (= lt!608099 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!608097 () Unit!45814)

(assert (=> b!1380827 (= lt!608097 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1380828 () Bool)

(declare-fun res!922476 () Bool)

(assert (=> b!1380828 (=> (not res!922476) (not e!782329))))

(assert (=> b!1380828 (= res!922476 (validKeyInArray!0 (select (arr!45377 a!4094) i!1451)))))

(declare-fun b!1380829 () Bool)

(assert (=> b!1380829 (= e!782329 e!782328)))

(declare-fun res!922477 () Bool)

(assert (=> b!1380829 (=> (not res!922477) (not e!782328))))

(assert (=> b!1380829 (= res!922477 (and (= lt!608101 (bvsub lt!608102 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1380829 (= lt!608101 (arrayCountValidKeys!0 lt!608100 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380829 (= lt!608102 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380829 (= lt!608100 (array!93967 (store (arr!45377 a!4094) i!1451 k!2953) (size!45928 a!4094)))))

(declare-fun b!1380830 () Bool)

(assert (=> b!1380830 (= e!782330 true)))

(assert (=> b!1380830 (= (arrayCountValidKeys!0 lt!608100 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!608104 () Unit!45814)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93966 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45814)

(assert (=> b!1380830 (= lt!608104 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun res!922475 () Bool)

(assert (=> start!117486 (=> (not res!922475) (not e!782329))))

(assert (=> start!117486 (= res!922475 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45928 a!4094))))))

(assert (=> start!117486 e!782329))

(assert (=> start!117486 true))

(declare-fun array_inv!34658 (array!93966) Bool)

(assert (=> start!117486 (array_inv!34658 a!4094)))

(assert (= (and start!117486 res!922475) b!1380828))

(assert (= (and b!1380828 res!922476) b!1380826))

(assert (= (and b!1380826 res!922474) b!1380825))

(assert (= (and b!1380825 res!922478) b!1380829))

(assert (= (and b!1380829 res!922477) b!1380827))

(assert (= (and b!1380827 (not res!922479)) b!1380830))

(declare-fun m!1266273 () Bool)

(assert (=> b!1380826 m!1266273))

(declare-fun m!1266275 () Bool)

(assert (=> b!1380830 m!1266275))

(declare-fun m!1266277 () Bool)

(assert (=> b!1380830 m!1266277))

(declare-fun m!1266279 () Bool)

(assert (=> b!1380830 m!1266279))

(declare-fun m!1266281 () Bool)

(assert (=> b!1380828 m!1266281))

(assert (=> b!1380828 m!1266281))

(declare-fun m!1266283 () Bool)

(assert (=> b!1380828 m!1266283))

(declare-fun m!1266285 () Bool)

(assert (=> b!1380829 m!1266285))

(declare-fun m!1266287 () Bool)

(assert (=> b!1380829 m!1266287))

(declare-fun m!1266289 () Bool)

(assert (=> b!1380829 m!1266289))

(declare-fun m!1266291 () Bool)

(assert (=> b!1380827 m!1266291))

(declare-fun m!1266293 () Bool)

(assert (=> b!1380827 m!1266293))

(declare-fun m!1266295 () Bool)

(assert (=> b!1380827 m!1266295))

(declare-fun m!1266297 () Bool)

(assert (=> b!1380827 m!1266297))

(declare-fun m!1266299 () Bool)

(assert (=> b!1380827 m!1266299))

(declare-fun m!1266301 () Bool)

(assert (=> b!1380827 m!1266301))

(declare-fun m!1266303 () Bool)

(assert (=> start!117486 m!1266303))

(push 1)

(assert (not start!117486))

(assert (not b!1380829))

(assert (not b!1380830))

(assert (not b!1380828))

(assert (not b!1380826))

(assert (not b!1380827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

