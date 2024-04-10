; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36298 () Bool)

(assert start!36298)

(declare-fun b!363360 () Bool)

(declare-fun res!202520 () Bool)

(declare-fun e!222489 () Bool)

(assert (=> b!363360 (=> (not res!202520) (not e!222489))))

(declare-datatypes ((array!20578 0))(
  ( (array!20579 (arr!9768 (Array (_ BitVec 32) (_ BitVec 64))) (size!10120 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20578)

(assert (=> b!363360 (= res!202520 (bvslt (size!10120 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202519 () Bool)

(assert (=> start!36298 (=> (not res!202519) (not e!222489))))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> start!36298 (= res!202519 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10120 a!4337))))))

(assert (=> start!36298 e!222489))

(assert (=> start!36298 true))

(declare-fun array_inv!7210 (array!20578) Bool)

(assert (=> start!36298 (array_inv!7210 a!4337)))

(declare-fun b!363358 () Bool)

(declare-fun res!202522 () Bool)

(assert (=> b!363358 (=> (not res!202522) (not e!222489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363358 (= res!202522 (not (validKeyInArray!0 (select (arr!9768 a!4337) i!1478))))))

(declare-fun b!363359 () Bool)

(declare-fun res!202521 () Bool)

(assert (=> b!363359 (=> (not res!202521) (not e!222489))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!363359 (= res!202521 (validKeyInArray!0 k!2980))))

(declare-fun b!363361 () Bool)

(assert (=> b!363361 (= e!222489 (not (and (bvsge (size!10120 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167454 () array!20578)

(declare-fun arrayCountValidKeys!0 (array!20578 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363361 (= (arrayCountValidKeys!0 lt!167454 (bvadd #b00000000000000000000000000000001 i!1478) (size!10120 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10120 a!4337)))))

(declare-datatypes ((Unit!11224 0))(
  ( (Unit!11225) )
))
(declare-fun lt!167455 () Unit!11224)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20578 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11224)

(assert (=> b!363361 (= lt!167455 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363361 (= (arrayCountValidKeys!0 lt!167454 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!363361 (= lt!167454 (array!20579 (store (arr!9768 a!4337) i!1478 k!2980) (size!10120 a!4337)))))

(declare-fun lt!167453 () Unit!11224)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20578 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11224)

(assert (=> b!363361 (= lt!167453 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36298 res!202519) b!363358))

(assert (= (and b!363358 res!202522) b!363359))

(assert (= (and b!363359 res!202521) b!363360))

(assert (= (and b!363360 res!202520) b!363361))

(declare-fun m!360301 () Bool)

(assert (=> start!36298 m!360301))

(declare-fun m!360303 () Bool)

(assert (=> b!363358 m!360303))

(assert (=> b!363358 m!360303))

(declare-fun m!360305 () Bool)

(assert (=> b!363358 m!360305))

(declare-fun m!360307 () Bool)

(assert (=> b!363359 m!360307))

(declare-fun m!360309 () Bool)

(assert (=> b!363361 m!360309))

(declare-fun m!360311 () Bool)

(assert (=> b!363361 m!360311))

(declare-fun m!360313 () Bool)

(assert (=> b!363361 m!360313))

(declare-fun m!360315 () Bool)

(assert (=> b!363361 m!360315))

(declare-fun m!360317 () Bool)

(assert (=> b!363361 m!360317))

(declare-fun m!360319 () Bool)

(assert (=> b!363361 m!360319))

(declare-fun m!360321 () Bool)

(assert (=> b!363361 m!360321))

(push 1)

(assert (not b!363361))

(assert (not start!36298))

(assert (not b!363359))

(assert (not b!363358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

