; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36250 () Bool)

(assert start!36250)

(declare-fun b!363127 () Bool)

(declare-fun e!222363 () Bool)

(assert (=> b!363127 (= e!222363 (not true))))

(declare-datatypes ((array!20551 0))(
  ( (array!20552 (arr!9756 (Array (_ BitVec 32) (_ BitVec 64))) (size!10108 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20551)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20551 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363127 (= (arrayCountValidKeys!0 (array!20552 (store (arr!9756 a!4337) i!1478 k!2980) (size!10108 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11200 0))(
  ( (Unit!11201) )
))
(declare-fun lt!167365 () Unit!11200)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20551 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11200)

(assert (=> b!363127 (= lt!167365 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363125 () Bool)

(declare-fun res!202358 () Bool)

(assert (=> b!363125 (=> (not res!202358) (not e!222363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363125 (= res!202358 (validKeyInArray!0 k!2980))))

(declare-fun b!363126 () Bool)

(declare-fun res!202357 () Bool)

(assert (=> b!363126 (=> (not res!202357) (not e!222363))))

(assert (=> b!363126 (= res!202357 (bvslt (size!10108 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363124 () Bool)

(declare-fun res!202360 () Bool)

(assert (=> b!363124 (=> (not res!202360) (not e!222363))))

(assert (=> b!363124 (= res!202360 (not (validKeyInArray!0 (select (arr!9756 a!4337) i!1478))))))

(declare-fun res!202359 () Bool)

(assert (=> start!36250 (=> (not res!202359) (not e!222363))))

(assert (=> start!36250 (= res!202359 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10108 a!4337))))))

(assert (=> start!36250 e!222363))

(assert (=> start!36250 true))

(declare-fun array_inv!7198 (array!20551) Bool)

(assert (=> start!36250 (array_inv!7198 a!4337)))

(assert (= (and start!36250 res!202359) b!363124))

(assert (= (and b!363124 res!202360) b!363125))

(assert (= (and b!363125 res!202358) b!363126))

(assert (= (and b!363126 res!202357) b!363127))

(declare-fun m!359995 () Bool)

(assert (=> b!363127 m!359995))

(declare-fun m!359997 () Bool)

(assert (=> b!363127 m!359997))

(declare-fun m!359999 () Bool)

(assert (=> b!363127 m!359999))

(declare-fun m!360001 () Bool)

(assert (=> b!363127 m!360001))

(declare-fun m!360003 () Bool)

(assert (=> b!363125 m!360003))

(declare-fun m!360005 () Bool)

(assert (=> b!363124 m!360005))

(assert (=> b!363124 m!360005))

(declare-fun m!360007 () Bool)

(assert (=> b!363124 m!360007))

(declare-fun m!360009 () Bool)

(assert (=> start!36250 m!360009))

(push 1)

(assert (not start!36250))

(assert (not b!363127))

(assert (not b!363124))

(assert (not b!363125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

