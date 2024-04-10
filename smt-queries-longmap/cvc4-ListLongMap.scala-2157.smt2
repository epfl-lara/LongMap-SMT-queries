; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36256 () Bool)

(assert start!36256)

(declare-fun b!363161 () Bool)

(declare-fun res!202395 () Bool)

(declare-fun e!222381 () Bool)

(assert (=> b!363161 (=> (not res!202395) (not e!222381))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363161 (= res!202395 (validKeyInArray!0 k!2980))))

(declare-fun b!363160 () Bool)

(declare-fun res!202396 () Bool)

(assert (=> b!363160 (=> (not res!202396) (not e!222381))))

(declare-datatypes ((array!20557 0))(
  ( (array!20558 (arr!9759 (Array (_ BitVec 32) (_ BitVec 64))) (size!10111 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20557)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363160 (= res!202396 (not (validKeyInArray!0 (select (arr!9759 a!4337) i!1478))))))

(declare-fun b!363162 () Bool)

(declare-fun res!202394 () Bool)

(assert (=> b!363162 (=> (not res!202394) (not e!222381))))

(assert (=> b!363162 (= res!202394 (bvslt (size!10111 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363163 () Bool)

(assert (=> b!363163 (= e!222381 (not true))))

(declare-fun arrayCountValidKeys!0 (array!20557 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363163 (= (arrayCountValidKeys!0 (array!20558 (store (arr!9759 a!4337) i!1478 k!2980) (size!10111 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11206 0))(
  ( (Unit!11207) )
))
(declare-fun lt!167374 () Unit!11206)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20557 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11206)

(assert (=> b!363163 (= lt!167374 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!202393 () Bool)

(assert (=> start!36256 (=> (not res!202393) (not e!222381))))

(assert (=> start!36256 (= res!202393 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10111 a!4337))))))

(assert (=> start!36256 e!222381))

(assert (=> start!36256 true))

(declare-fun array_inv!7201 (array!20557) Bool)

(assert (=> start!36256 (array_inv!7201 a!4337)))

(assert (= (and start!36256 res!202393) b!363160))

(assert (= (and b!363160 res!202396) b!363161))

(assert (= (and b!363161 res!202395) b!363162))

(assert (= (and b!363162 res!202394) b!363163))

(declare-fun m!360043 () Bool)

(assert (=> b!363161 m!360043))

(declare-fun m!360045 () Bool)

(assert (=> b!363160 m!360045))

(assert (=> b!363160 m!360045))

(declare-fun m!360047 () Bool)

(assert (=> b!363160 m!360047))

(declare-fun m!360049 () Bool)

(assert (=> b!363163 m!360049))

(declare-fun m!360051 () Bool)

(assert (=> b!363163 m!360051))

(declare-fun m!360053 () Bool)

(assert (=> b!363163 m!360053))

(declare-fun m!360055 () Bool)

(assert (=> b!363163 m!360055))

(declare-fun m!360057 () Bool)

(assert (=> start!36256 m!360057))

(push 1)

(assert (not b!363163))

(assert (not b!363160))

(assert (not b!363161))

(assert (not start!36256))

(check-sat)

(pop 1)

