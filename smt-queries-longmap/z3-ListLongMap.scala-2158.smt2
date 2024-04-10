; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36260 () Bool)

(assert start!36260)

(declare-fun res!202420 () Bool)

(declare-fun e!222393 () Bool)

(assert (=> start!36260 (=> (not res!202420) (not e!222393))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20561 0))(
  ( (array!20562 (arr!9761 (Array (_ BitVec 32) (_ BitVec 64))) (size!10113 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20561)

(assert (=> start!36260 (= res!202420 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10113 a!4337))))))

(assert (=> start!36260 e!222393))

(assert (=> start!36260 true))

(declare-fun array_inv!7203 (array!20561) Bool)

(assert (=> start!36260 (array_inv!7203 a!4337)))

(declare-fun b!363184 () Bool)

(declare-fun res!202417 () Bool)

(assert (=> b!363184 (=> (not res!202417) (not e!222393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363184 (= res!202417 (not (validKeyInArray!0 (select (arr!9761 a!4337) i!1478))))))

(declare-fun b!363186 () Bool)

(declare-fun res!202418 () Bool)

(assert (=> b!363186 (=> (not res!202418) (not e!222393))))

(assert (=> b!363186 (= res!202418 (bvslt (size!10113 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363185 () Bool)

(declare-fun res!202419 () Bool)

(assert (=> b!363185 (=> (not res!202419) (not e!222393))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!363185 (= res!202419 (validKeyInArray!0 k0!2980))))

(declare-fun b!363187 () Bool)

(assert (=> b!363187 (= e!222393 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1478) i!1478))))))

(declare-fun arrayCountValidKeys!0 (array!20561 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363187 (= (arrayCountValidKeys!0 (array!20562 (store (arr!9761 a!4337) i!1478 k0!2980) (size!10113 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11210 0))(
  ( (Unit!11211) )
))
(declare-fun lt!167380 () Unit!11210)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11210)

(assert (=> b!363187 (= lt!167380 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(assert (= (and start!36260 res!202420) b!363184))

(assert (= (and b!363184 res!202417) b!363185))

(assert (= (and b!363185 res!202419) b!363186))

(assert (= (and b!363186 res!202418) b!363187))

(declare-fun m!360075 () Bool)

(assert (=> start!36260 m!360075))

(declare-fun m!360077 () Bool)

(assert (=> b!363184 m!360077))

(assert (=> b!363184 m!360077))

(declare-fun m!360079 () Bool)

(assert (=> b!363184 m!360079))

(declare-fun m!360081 () Bool)

(assert (=> b!363185 m!360081))

(declare-fun m!360083 () Bool)

(assert (=> b!363187 m!360083))

(declare-fun m!360085 () Bool)

(assert (=> b!363187 m!360085))

(declare-fun m!360087 () Bool)

(assert (=> b!363187 m!360087))

(declare-fun m!360089 () Bool)

(assert (=> b!363187 m!360089))

(check-sat (not b!363184) (not b!363185) (not start!36260) (not b!363187))
(check-sat)
