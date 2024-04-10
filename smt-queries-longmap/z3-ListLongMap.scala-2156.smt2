; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36248 () Bool)

(assert start!36248)

(declare-fun b!363113 () Bool)

(declare-fun res!202346 () Bool)

(declare-fun e!222358 () Bool)

(assert (=> b!363113 (=> (not res!202346) (not e!222358))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363113 (= res!202346 (validKeyInArray!0 k0!2980))))

(declare-fun res!202345 () Bool)

(assert (=> start!36248 (=> (not res!202345) (not e!222358))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20549 0))(
  ( (array!20550 (arr!9755 (Array (_ BitVec 32) (_ BitVec 64))) (size!10107 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20549)

(assert (=> start!36248 (= res!202345 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10107 a!4337))))))

(assert (=> start!36248 e!222358))

(assert (=> start!36248 true))

(declare-fun array_inv!7197 (array!20549) Bool)

(assert (=> start!36248 (array_inv!7197 a!4337)))

(declare-fun b!363114 () Bool)

(declare-fun res!202347 () Bool)

(assert (=> b!363114 (=> (not res!202347) (not e!222358))))

(assert (=> b!363114 (= res!202347 (bvslt (size!10107 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363112 () Bool)

(declare-fun res!202348 () Bool)

(assert (=> b!363112 (=> (not res!202348) (not e!222358))))

(assert (=> b!363112 (= res!202348 (not (validKeyInArray!0 (select (arr!9755 a!4337) i!1478))))))

(declare-fun b!363115 () Bool)

(assert (=> b!363115 (= e!222358 (not true))))

(declare-fun arrayCountValidKeys!0 (array!20549 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363115 (= (arrayCountValidKeys!0 (array!20550 (store (arr!9755 a!4337) i!1478 k0!2980) (size!10107 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11198 0))(
  ( (Unit!11199) )
))
(declare-fun lt!167362 () Unit!11198)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20549 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11198)

(assert (=> b!363115 (= lt!167362 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(assert (= (and start!36248 res!202345) b!363112))

(assert (= (and b!363112 res!202348) b!363113))

(assert (= (and b!363113 res!202346) b!363114))

(assert (= (and b!363114 res!202347) b!363115))

(declare-fun m!359979 () Bool)

(assert (=> b!363113 m!359979))

(declare-fun m!359981 () Bool)

(assert (=> start!36248 m!359981))

(declare-fun m!359983 () Bool)

(assert (=> b!363112 m!359983))

(assert (=> b!363112 m!359983))

(declare-fun m!359985 () Bool)

(assert (=> b!363112 m!359985))

(declare-fun m!359987 () Bool)

(assert (=> b!363115 m!359987))

(declare-fun m!359989 () Bool)

(assert (=> b!363115 m!359989))

(declare-fun m!359991 () Bool)

(assert (=> b!363115 m!359991))

(declare-fun m!359993 () Bool)

(assert (=> b!363115 m!359993))

(check-sat (not b!363113) (not start!36248) (not b!363115) (not b!363112))
