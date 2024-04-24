; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36236 () Bool)

(assert start!36236)

(declare-fun b!363078 () Bool)

(declare-fun e!222332 () Bool)

(assert (=> b!363078 (= e!222332 (not true))))

(declare-datatypes ((array!20532 0))(
  ( (array!20533 (arr!9746 (Array (_ BitVec 32) (_ BitVec 64))) (size!10098 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20532)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20532 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363078 (= (arrayCountValidKeys!0 (array!20533 (store (arr!9746 a!4337) i!1478 k!2980) (size!10098 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11189 0))(
  ( (Unit!11190) )
))
(declare-fun lt!167384 () Unit!11189)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20532 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11189)

(assert (=> b!363078 (= lt!167384 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363075 () Bool)

(declare-fun res!202355 () Bool)

(assert (=> b!363075 (=> (not res!202355) (not e!222332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363075 (= res!202355 (not (validKeyInArray!0 (select (arr!9746 a!4337) i!1478))))))

(declare-fun b!363076 () Bool)

(declare-fun res!202356 () Bool)

(assert (=> b!363076 (=> (not res!202356) (not e!222332))))

(assert (=> b!363076 (= res!202356 (validKeyInArray!0 k!2980))))

(declare-fun res!202354 () Bool)

(assert (=> start!36236 (=> (not res!202354) (not e!222332))))

(assert (=> start!36236 (= res!202354 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10098 a!4337))))))

(assert (=> start!36236 e!222332))

(assert (=> start!36236 true))

(declare-fun array_inv!7218 (array!20532) Bool)

(assert (=> start!36236 (array_inv!7218 a!4337)))

(declare-fun b!363077 () Bool)

(declare-fun res!202357 () Bool)

(assert (=> b!363077 (=> (not res!202357) (not e!222332))))

(assert (=> b!363077 (= res!202357 (bvslt (size!10098 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36236 res!202354) b!363075))

(assert (= (and b!363075 res!202355) b!363076))

(assert (= (and b!363076 res!202356) b!363077))

(assert (= (and b!363077 res!202357) b!363078))

(declare-fun m!360225 () Bool)

(assert (=> b!363078 m!360225))

(declare-fun m!360227 () Bool)

(assert (=> b!363078 m!360227))

(declare-fun m!360229 () Bool)

(assert (=> b!363078 m!360229))

(declare-fun m!360231 () Bool)

(assert (=> b!363078 m!360231))

(declare-fun m!360233 () Bool)

(assert (=> b!363075 m!360233))

(assert (=> b!363075 m!360233))

(declare-fun m!360235 () Bool)

(assert (=> b!363075 m!360235))

(declare-fun m!360237 () Bool)

(assert (=> b!363076 m!360237))

(declare-fun m!360239 () Bool)

(assert (=> start!36236 m!360239))

(push 1)

(assert (not b!363076))

(assert (not start!36236))

(assert (not b!363078))

(assert (not b!363075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

