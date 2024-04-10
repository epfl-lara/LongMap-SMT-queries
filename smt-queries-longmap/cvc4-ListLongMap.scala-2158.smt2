; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36262 () Bool)

(assert start!36262)

(declare-fun b!363196 () Bool)

(declare-fun res!202431 () Bool)

(declare-fun e!222399 () Bool)

(assert (=> b!363196 (=> (not res!202431) (not e!222399))))

(declare-datatypes ((array!20563 0))(
  ( (array!20564 (arr!9762 (Array (_ BitVec 32) (_ BitVec 64))) (size!10114 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20563)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363196 (= res!202431 (not (validKeyInArray!0 (select (arr!9762 a!4337) i!1478))))))

(declare-fun b!363199 () Bool)

(assert (=> b!363199 (= e!222399 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1478) i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20563 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363199 (= (arrayCountValidKeys!0 (array!20564 (store (arr!9762 a!4337) i!1478 k!2980) (size!10114 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11212 0))(
  ( (Unit!11213) )
))
(declare-fun lt!167383 () Unit!11212)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11212)

(assert (=> b!363199 (= lt!167383 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363198 () Bool)

(declare-fun res!202430 () Bool)

(assert (=> b!363198 (=> (not res!202430) (not e!222399))))

(assert (=> b!363198 (= res!202430 (bvslt (size!10114 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202432 () Bool)

(assert (=> start!36262 (=> (not res!202432) (not e!222399))))

(assert (=> start!36262 (= res!202432 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10114 a!4337))))))

(assert (=> start!36262 e!222399))

(assert (=> start!36262 true))

(declare-fun array_inv!7204 (array!20563) Bool)

(assert (=> start!36262 (array_inv!7204 a!4337)))

(declare-fun b!363197 () Bool)

(declare-fun res!202429 () Bool)

(assert (=> b!363197 (=> (not res!202429) (not e!222399))))

(assert (=> b!363197 (= res!202429 (validKeyInArray!0 k!2980))))

(assert (= (and start!36262 res!202432) b!363196))

(assert (= (and b!363196 res!202431) b!363197))

(assert (= (and b!363197 res!202429) b!363198))

(assert (= (and b!363198 res!202430) b!363199))

(declare-fun m!360091 () Bool)

(assert (=> b!363196 m!360091))

(assert (=> b!363196 m!360091))

(declare-fun m!360093 () Bool)

(assert (=> b!363196 m!360093))

(declare-fun m!360095 () Bool)

(assert (=> b!363199 m!360095))

(declare-fun m!360097 () Bool)

(assert (=> b!363199 m!360097))

(declare-fun m!360099 () Bool)

(assert (=> b!363199 m!360099))

(declare-fun m!360101 () Bool)

(assert (=> b!363199 m!360101))

(declare-fun m!360103 () Bool)

(assert (=> start!36262 m!360103))

(declare-fun m!360105 () Bool)

(assert (=> b!363197 m!360105))

(push 1)

(assert (not b!363196))

(assert (not b!363197))

(assert (not start!36262))

(assert (not b!363199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

