; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36294 () Bool)

(assert start!36294)

(declare-fun res!202497 () Bool)

(declare-fun e!222478 () Bool)

(assert (=> start!36294 (=> (not res!202497) (not e!222478))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20574 0))(
  ( (array!20575 (arr!9766 (Array (_ BitVec 32) (_ BitVec 64))) (size!10118 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20574)

(assert (=> start!36294 (= res!202497 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10118 a!4337))))))

(assert (=> start!36294 e!222478))

(assert (=> start!36294 true))

(declare-fun array_inv!7208 (array!20574) Bool)

(assert (=> start!36294 (array_inv!7208 a!4337)))

(declare-fun b!363335 () Bool)

(declare-fun res!202496 () Bool)

(assert (=> b!363335 (=> (not res!202496) (not e!222478))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363335 (= res!202496 (validKeyInArray!0 k!2980))))

(declare-fun b!363336 () Bool)

(declare-fun res!202498 () Bool)

(assert (=> b!363336 (=> (not res!202498) (not e!222478))))

(assert (=> b!363336 (= res!202498 (bvslt (size!10118 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363334 () Bool)

(declare-fun res!202495 () Bool)

(assert (=> b!363334 (=> (not res!202495) (not e!222478))))

(assert (=> b!363334 (= res!202495 (not (validKeyInArray!0 (select (arr!9766 a!4337) i!1478))))))

(declare-fun b!363337 () Bool)

(assert (=> b!363337 (= e!222478 (not (and (bvsge (size!10118 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167435 () array!20574)

(declare-fun arrayCountValidKeys!0 (array!20574 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363337 (= (arrayCountValidKeys!0 lt!167435 (bvadd #b00000000000000000000000000000001 i!1478) (size!10118 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10118 a!4337)))))

(declare-datatypes ((Unit!11220 0))(
  ( (Unit!11221) )
))
(declare-fun lt!167436 () Unit!11220)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20574 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11220)

(assert (=> b!363337 (= lt!167436 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363337 (= (arrayCountValidKeys!0 lt!167435 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!363337 (= lt!167435 (array!20575 (store (arr!9766 a!4337) i!1478 k!2980) (size!10118 a!4337)))))

(declare-fun lt!167437 () Unit!11220)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20574 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11220)

(assert (=> b!363337 (= lt!167437 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36294 res!202497) b!363334))

(assert (= (and b!363334 res!202495) b!363335))

(assert (= (and b!363335 res!202496) b!363336))

(assert (= (and b!363336 res!202498) b!363337))

(declare-fun m!360257 () Bool)

(assert (=> start!36294 m!360257))

(declare-fun m!360259 () Bool)

(assert (=> b!363335 m!360259))

(declare-fun m!360261 () Bool)

(assert (=> b!363334 m!360261))

(assert (=> b!363334 m!360261))

(declare-fun m!360263 () Bool)

(assert (=> b!363334 m!360263))

(declare-fun m!360265 () Bool)

(assert (=> b!363337 m!360265))

(declare-fun m!360267 () Bool)

(assert (=> b!363337 m!360267))

(declare-fun m!360269 () Bool)

(assert (=> b!363337 m!360269))

(declare-fun m!360271 () Bool)

(assert (=> b!363337 m!360271))

(declare-fun m!360273 () Bool)

(assert (=> b!363337 m!360273))

(declare-fun m!360275 () Bool)

(assert (=> b!363337 m!360275))

(declare-fun m!360277 () Bool)

(assert (=> b!363337 m!360277))

(push 1)

(assert (not b!363335))

(assert (not b!363334))

(assert (not b!363337))

(assert (not start!36294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

