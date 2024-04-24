; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36242 () Bool)

(assert start!36242)

(declare-fun b!363111 () Bool)

(declare-fun res!202391 () Bool)

(declare-fun e!222350 () Bool)

(assert (=> b!363111 (=> (not res!202391) (not e!222350))))

(declare-datatypes ((array!20538 0))(
  ( (array!20539 (arr!9749 (Array (_ BitVec 32) (_ BitVec 64))) (size!10101 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20538)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363111 (= res!202391 (not (validKeyInArray!0 (select (arr!9749 a!4337) i!1478))))))

(declare-fun b!363113 () Bool)

(declare-fun res!202390 () Bool)

(assert (=> b!363113 (=> (not res!202390) (not e!222350))))

(assert (=> b!363113 (= res!202390 (bvslt (size!10101 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202393 () Bool)

(assert (=> start!36242 (=> (not res!202393) (not e!222350))))

(assert (=> start!36242 (= res!202393 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10101 a!4337))))))

(assert (=> start!36242 e!222350))

(assert (=> start!36242 true))

(declare-fun array_inv!7221 (array!20538) Bool)

(assert (=> start!36242 (array_inv!7221 a!4337)))

(declare-fun b!363112 () Bool)

(declare-fun res!202392 () Bool)

(assert (=> b!363112 (=> (not res!202392) (not e!222350))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!363112 (= res!202392 (validKeyInArray!0 k!2980))))

(declare-fun b!363114 () Bool)

(assert (=> b!363114 (= e!222350 (not true))))

(declare-fun arrayCountValidKeys!0 (array!20538 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363114 (= (arrayCountValidKeys!0 (array!20539 (store (arr!9749 a!4337) i!1478 k!2980) (size!10101 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11195 0))(
  ( (Unit!11196) )
))
(declare-fun lt!167393 () Unit!11195)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20538 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11195)

(assert (=> b!363114 (= lt!167393 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36242 res!202393) b!363111))

(assert (= (and b!363111 res!202391) b!363112))

(assert (= (and b!363112 res!202392) b!363113))

(assert (= (and b!363113 res!202390) b!363114))

(declare-fun m!360273 () Bool)

(assert (=> b!363111 m!360273))

(assert (=> b!363111 m!360273))

(declare-fun m!360275 () Bool)

(assert (=> b!363111 m!360275))

(declare-fun m!360277 () Bool)

(assert (=> start!36242 m!360277))

(declare-fun m!360279 () Bool)

(assert (=> b!363112 m!360279))

(declare-fun m!360281 () Bool)

(assert (=> b!363114 m!360281))

(declare-fun m!360283 () Bool)

(assert (=> b!363114 m!360283))

(declare-fun m!360285 () Bool)

(assert (=> b!363114 m!360285))

(declare-fun m!360287 () Bool)

(assert (=> b!363114 m!360287))

(push 1)

(assert (not b!363114))

(assert (not b!363111))

(assert (not b!363112))

(assert (not start!36242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

