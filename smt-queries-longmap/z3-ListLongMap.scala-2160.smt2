; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36280 () Bool)

(assert start!36280)

(declare-fun b!363288 () Bool)

(declare-fun e!222445 () Bool)

(declare-datatypes ((array!20555 0))(
  ( (array!20556 (arr!9756 (Array (_ BitVec 32) (_ BitVec 64))) (size!10108 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20555)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363288 (= e!222445 (not (and (bvsge (size!10108 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167455 () array!20555)

(declare-fun arrayCountValidKeys!0 (array!20555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363288 (= (arrayCountValidKeys!0 lt!167455 (bvadd #b00000000000000000000000000000001 i!1478) (size!10108 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10108 a!4337)))))

(declare-datatypes ((Unit!11209 0))(
  ( (Unit!11210) )
))
(declare-fun lt!167456 () Unit!11209)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11209)

(assert (=> b!363288 (= lt!167456 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363288 (= (arrayCountValidKeys!0 lt!167455 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!363288 (= lt!167455 (array!20556 (store (arr!9756 a!4337) i!1478 k0!2980) (size!10108 a!4337)))))

(declare-fun lt!167454 () Unit!11209)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11209)

(assert (=> b!363288 (= lt!167454 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363286 () Bool)

(declare-fun res!202492 () Bool)

(assert (=> b!363286 (=> (not res!202492) (not e!222445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363286 (= res!202492 (validKeyInArray!0 k0!2980))))

(declare-fun b!363285 () Bool)

(declare-fun res!202494 () Bool)

(assert (=> b!363285 (=> (not res!202494) (not e!222445))))

(assert (=> b!363285 (= res!202494 (not (validKeyInArray!0 (select (arr!9756 a!4337) i!1478))))))

(declare-fun b!363287 () Bool)

(declare-fun res!202493 () Bool)

(assert (=> b!363287 (=> (not res!202493) (not e!222445))))

(assert (=> b!363287 (= res!202493 (bvslt (size!10108 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202495 () Bool)

(assert (=> start!36280 (=> (not res!202495) (not e!222445))))

(assert (=> start!36280 (= res!202495 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10108 a!4337))))))

(assert (=> start!36280 e!222445))

(assert (=> start!36280 true))

(declare-fun array_inv!7228 (array!20555) Bool)

(assert (=> start!36280 (array_inv!7228 a!4337)))

(assert (= (and start!36280 res!202495) b!363285))

(assert (= (and b!363285 res!202494) b!363286))

(assert (= (and b!363286 res!202492) b!363287))

(assert (= (and b!363287 res!202493) b!363288))

(declare-fun m!360487 () Bool)

(assert (=> b!363288 m!360487))

(declare-fun m!360489 () Bool)

(assert (=> b!363288 m!360489))

(declare-fun m!360491 () Bool)

(assert (=> b!363288 m!360491))

(declare-fun m!360493 () Bool)

(assert (=> b!363288 m!360493))

(declare-fun m!360495 () Bool)

(assert (=> b!363288 m!360495))

(declare-fun m!360497 () Bool)

(assert (=> b!363288 m!360497))

(declare-fun m!360499 () Bool)

(assert (=> b!363288 m!360499))

(declare-fun m!360501 () Bool)

(assert (=> b!363286 m!360501))

(declare-fun m!360503 () Bool)

(assert (=> b!363285 m!360503))

(assert (=> b!363285 m!360503))

(declare-fun m!360505 () Bool)

(assert (=> b!363285 m!360505))

(declare-fun m!360507 () Bool)

(assert (=> start!36280 m!360507))

(check-sat (not b!363286) (not start!36280) (not b!363288) (not b!363285))
(check-sat)
