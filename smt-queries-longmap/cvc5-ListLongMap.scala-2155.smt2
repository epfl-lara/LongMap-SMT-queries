; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36240 () Bool)

(assert start!36240)

(declare-fun b!363064 () Bool)

(declare-fun res!202299 () Bool)

(declare-fun e!222333 () Bool)

(assert (=> b!363064 (=> (not res!202299) (not e!222333))))

(declare-datatypes ((array!20541 0))(
  ( (array!20542 (arr!9751 (Array (_ BitVec 32) (_ BitVec 64))) (size!10103 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20541)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363064 (= res!202299 (not (validKeyInArray!0 (select (arr!9751 a!4337) i!1478))))))

(declare-fun res!202298 () Bool)

(assert (=> start!36240 (=> (not res!202298) (not e!222333))))

(assert (=> start!36240 (= res!202298 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10103 a!4337))))))

(assert (=> start!36240 e!222333))

(assert (=> start!36240 true))

(declare-fun array_inv!7193 (array!20541) Bool)

(assert (=> start!36240 (array_inv!7193 a!4337)))

(declare-fun b!363065 () Bool)

(declare-fun res!202300 () Bool)

(assert (=> b!363065 (=> (not res!202300) (not e!222333))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!363065 (= res!202300 (validKeyInArray!0 k!2980))))

(declare-fun b!363067 () Bool)

(assert (=> b!363067 (= e!222333 (not true))))

(declare-fun arrayCountValidKeys!0 (array!20541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363067 (= (arrayCountValidKeys!0 (array!20542 (store (arr!9751 a!4337) i!1478 k!2980) (size!10103 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11190 0))(
  ( (Unit!11191) )
))
(declare-fun lt!167350 () Unit!11190)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20541 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11190)

(assert (=> b!363067 (= lt!167350 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363066 () Bool)

(declare-fun res!202297 () Bool)

(assert (=> b!363066 (=> (not res!202297) (not e!222333))))

(assert (=> b!363066 (= res!202297 (bvslt (size!10103 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36240 res!202298) b!363064))

(assert (= (and b!363064 res!202299) b!363065))

(assert (= (and b!363065 res!202300) b!363066))

(assert (= (and b!363066 res!202297) b!363067))

(declare-fun m!359915 () Bool)

(assert (=> b!363064 m!359915))

(assert (=> b!363064 m!359915))

(declare-fun m!359917 () Bool)

(assert (=> b!363064 m!359917))

(declare-fun m!359919 () Bool)

(assert (=> start!36240 m!359919))

(declare-fun m!359921 () Bool)

(assert (=> b!363065 m!359921))

(declare-fun m!359923 () Bool)

(assert (=> b!363067 m!359923))

(declare-fun m!359925 () Bool)

(assert (=> b!363067 m!359925))

(declare-fun m!359927 () Bool)

(assert (=> b!363067 m!359927))

(declare-fun m!359929 () Bool)

(assert (=> b!363067 m!359929))

(push 1)

(assert (not b!363064))

(assert (not b!363065))

(assert (not start!36240))

(assert (not b!363067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

