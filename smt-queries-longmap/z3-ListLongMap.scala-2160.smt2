; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36296 () Bool)

(assert start!36296)

(declare-fun b!363348 () Bool)

(declare-fun res!202510 () Bool)

(declare-fun e!222483 () Bool)

(assert (=> b!363348 (=> (not res!202510) (not e!222483))))

(declare-datatypes ((array!20576 0))(
  ( (array!20577 (arr!9767 (Array (_ BitVec 32) (_ BitVec 64))) (size!10119 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20576)

(assert (=> b!363348 (= res!202510 (bvslt (size!10119 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363346 () Bool)

(declare-fun res!202509 () Bool)

(assert (=> b!363346 (=> (not res!202509) (not e!222483))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363346 (= res!202509 (not (validKeyInArray!0 (select (arr!9767 a!4337) i!1478))))))

(declare-fun b!363349 () Bool)

(assert (=> b!363349 (= e!222483 (not (and (bvsge (size!10119 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167445 () array!20576)

(declare-fun arrayCountValidKeys!0 (array!20576 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363349 (= (arrayCountValidKeys!0 lt!167445 (bvadd #b00000000000000000000000000000001 i!1478) (size!10119 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10119 a!4337)))))

(declare-datatypes ((Unit!11222 0))(
  ( (Unit!11223) )
))
(declare-fun lt!167444 () Unit!11222)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20576 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11222)

(assert (=> b!363349 (= lt!167444 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363349 (= (arrayCountValidKeys!0 lt!167445 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!363349 (= lt!167445 (array!20577 (store (arr!9767 a!4337) i!1478 k0!2980) (size!10119 a!4337)))))

(declare-fun lt!167446 () Unit!11222)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20576 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11222)

(assert (=> b!363349 (= lt!167446 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363347 () Bool)

(declare-fun res!202508 () Bool)

(assert (=> b!363347 (=> (not res!202508) (not e!222483))))

(assert (=> b!363347 (= res!202508 (validKeyInArray!0 k0!2980))))

(declare-fun res!202507 () Bool)

(assert (=> start!36296 (=> (not res!202507) (not e!222483))))

(assert (=> start!36296 (= res!202507 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10119 a!4337))))))

(assert (=> start!36296 e!222483))

(assert (=> start!36296 true))

(declare-fun array_inv!7209 (array!20576) Bool)

(assert (=> start!36296 (array_inv!7209 a!4337)))

(assert (= (and start!36296 res!202507) b!363346))

(assert (= (and b!363346 res!202509) b!363347))

(assert (= (and b!363347 res!202508) b!363348))

(assert (= (and b!363348 res!202510) b!363349))

(declare-fun m!360279 () Bool)

(assert (=> b!363346 m!360279))

(assert (=> b!363346 m!360279))

(declare-fun m!360281 () Bool)

(assert (=> b!363346 m!360281))

(declare-fun m!360283 () Bool)

(assert (=> b!363349 m!360283))

(declare-fun m!360285 () Bool)

(assert (=> b!363349 m!360285))

(declare-fun m!360287 () Bool)

(assert (=> b!363349 m!360287))

(declare-fun m!360289 () Bool)

(assert (=> b!363349 m!360289))

(declare-fun m!360291 () Bool)

(assert (=> b!363349 m!360291))

(declare-fun m!360293 () Bool)

(assert (=> b!363349 m!360293))

(declare-fun m!360295 () Bool)

(assert (=> b!363349 m!360295))

(declare-fun m!360297 () Bool)

(assert (=> b!363347 m!360297))

(declare-fun m!360299 () Bool)

(assert (=> start!36296 m!360299))

(check-sat (not b!363346) (not b!363349) (not start!36296) (not b!363347))
(check-sat)
