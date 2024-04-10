; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36244 () Bool)

(assert start!36244)

(declare-fun b!363090 () Bool)

(declare-fun res!202324 () Bool)

(declare-fun e!222345 () Bool)

(assert (=> b!363090 (=> (not res!202324) (not e!222345))))

(declare-datatypes ((array!20545 0))(
  ( (array!20546 (arr!9753 (Array (_ BitVec 32) (_ BitVec 64))) (size!10105 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20545)

(assert (=> b!363090 (= res!202324 (bvslt (size!10105 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202321 () Bool)

(assert (=> start!36244 (=> (not res!202321) (not e!222345))))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> start!36244 (= res!202321 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10105 a!4337))))))

(assert (=> start!36244 e!222345))

(assert (=> start!36244 true))

(declare-fun array_inv!7195 (array!20545) Bool)

(assert (=> start!36244 (array_inv!7195 a!4337)))

(declare-fun b!363088 () Bool)

(declare-fun res!202322 () Bool)

(assert (=> b!363088 (=> (not res!202322) (not e!222345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363088 (= res!202322 (not (validKeyInArray!0 (select (arr!9753 a!4337) i!1478))))))

(declare-fun b!363091 () Bool)

(assert (=> b!363091 (= e!222345 (not true))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363091 (= (arrayCountValidKeys!0 (array!20546 (store (arr!9753 a!4337) i!1478 k!2980) (size!10105 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11194 0))(
  ( (Unit!11195) )
))
(declare-fun lt!167356 () Unit!11194)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11194)

(assert (=> b!363091 (= lt!167356 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363089 () Bool)

(declare-fun res!202323 () Bool)

(assert (=> b!363089 (=> (not res!202323) (not e!222345))))

(assert (=> b!363089 (= res!202323 (validKeyInArray!0 k!2980))))

(assert (= (and start!36244 res!202321) b!363088))

(assert (= (and b!363088 res!202322) b!363089))

(assert (= (and b!363089 res!202323) b!363090))

(assert (= (and b!363090 res!202324) b!363091))

(declare-fun m!359947 () Bool)

(assert (=> start!36244 m!359947))

(declare-fun m!359949 () Bool)

(assert (=> b!363088 m!359949))

(assert (=> b!363088 m!359949))

(declare-fun m!359951 () Bool)

(assert (=> b!363088 m!359951))

(declare-fun m!359953 () Bool)

(assert (=> b!363091 m!359953))

(declare-fun m!359955 () Bool)

(assert (=> b!363091 m!359955))

(declare-fun m!359957 () Bool)

(assert (=> b!363091 m!359957))

(declare-fun m!359959 () Bool)

(assert (=> b!363091 m!359959))

(declare-fun m!359961 () Bool)

(assert (=> b!363089 m!359961))

(push 1)

(assert (not b!363088))

(assert (not b!363089))

(assert (not start!36244))

(assert (not b!363091))

(check-sat)

