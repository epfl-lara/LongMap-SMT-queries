; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36230 () Bool)

(assert start!36230)

(declare-fun b!362820 () Bool)

(declare-fun e!222172 () Bool)

(assert (=> b!362820 (= e!222172 (not true))))

(declare-datatypes ((array!20527 0))(
  ( (array!20528 (arr!9744 (Array (_ BitVec 32) (_ BitVec 64))) (size!10097 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20527)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362820 (= (arrayCountValidKeys!0 (array!20528 (store (arr!9744 a!4337) i!1478 k!2980) (size!10097 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11172 0))(
  ( (Unit!11173) )
))
(declare-fun lt!167122 () Unit!11172)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20527 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11172)

(assert (=> b!362820 (= lt!167122 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362817 () Bool)

(declare-fun res!202194 () Bool)

(assert (=> b!362817 (=> (not res!202194) (not e!222172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362817 (= res!202194 (not (validKeyInArray!0 (select (arr!9744 a!4337) i!1478))))))

(declare-fun b!362818 () Bool)

(declare-fun res!202192 () Bool)

(assert (=> b!362818 (=> (not res!202192) (not e!222172))))

(assert (=> b!362818 (= res!202192 (validKeyInArray!0 k!2980))))

(declare-fun res!202193 () Bool)

(assert (=> start!36230 (=> (not res!202193) (not e!222172))))

(assert (=> start!36230 (= res!202193 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10097 a!4337))))))

(assert (=> start!36230 e!222172))

(assert (=> start!36230 true))

(declare-fun array_inv!7193 (array!20527) Bool)

(assert (=> start!36230 (array_inv!7193 a!4337)))

(declare-fun b!362819 () Bool)

(declare-fun res!202195 () Bool)

(assert (=> b!362819 (=> (not res!202195) (not e!222172))))

(assert (=> b!362819 (= res!202195 (bvslt (size!10097 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36230 res!202193) b!362817))

(assert (= (and b!362817 res!202194) b!362818))

(assert (= (and b!362818 res!202192) b!362819))

(assert (= (and b!362819 res!202195) b!362820))

(declare-fun m!359223 () Bool)

(assert (=> b!362820 m!359223))

(declare-fun m!359225 () Bool)

(assert (=> b!362820 m!359225))

(declare-fun m!359227 () Bool)

(assert (=> b!362820 m!359227))

(declare-fun m!359229 () Bool)

(assert (=> b!362820 m!359229))

(declare-fun m!359231 () Bool)

(assert (=> b!362817 m!359231))

(assert (=> b!362817 m!359231))

(declare-fun m!359233 () Bool)

(assert (=> b!362817 m!359233))

(declare-fun m!359235 () Bool)

(assert (=> b!362818 m!359235))

(declare-fun m!359237 () Bool)

(assert (=> start!36230 m!359237))

(push 1)

(assert (not b!362820))

(assert (not b!362817))

(assert (not start!36230))

(assert (not b!362818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

