; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36258 () Bool)

(assert start!36258)

(declare-fun b!363173 () Bool)

(declare-fun res!202405 () Bool)

(declare-fun e!222388 () Bool)

(assert (=> b!363173 (=> (not res!202405) (not e!222388))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363173 (= res!202405 (validKeyInArray!0 k!2980))))

(declare-fun res!202406 () Bool)

(assert (=> start!36258 (=> (not res!202406) (not e!222388))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20559 0))(
  ( (array!20560 (arr!9760 (Array (_ BitVec 32) (_ BitVec 64))) (size!10112 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20559)

(assert (=> start!36258 (= res!202406 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10112 a!4337))))))

(assert (=> start!36258 e!222388))

(assert (=> start!36258 true))

(declare-fun array_inv!7202 (array!20559) Bool)

(assert (=> start!36258 (array_inv!7202 a!4337)))

(declare-fun b!363175 () Bool)

(assert (=> b!363175 (= e!222388 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1478) i!1478))))))

(declare-fun arrayCountValidKeys!0 (array!20559 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363175 (= (arrayCountValidKeys!0 (array!20560 (store (arr!9760 a!4337) i!1478 k!2980) (size!10112 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11208 0))(
  ( (Unit!11209) )
))
(declare-fun lt!167377 () Unit!11208)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20559 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11208)

(assert (=> b!363175 (= lt!167377 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363172 () Bool)

(declare-fun res!202407 () Bool)

(assert (=> b!363172 (=> (not res!202407) (not e!222388))))

(assert (=> b!363172 (= res!202407 (not (validKeyInArray!0 (select (arr!9760 a!4337) i!1478))))))

(declare-fun b!363174 () Bool)

(declare-fun res!202408 () Bool)

(assert (=> b!363174 (=> (not res!202408) (not e!222388))))

(assert (=> b!363174 (= res!202408 (bvslt (size!10112 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36258 res!202406) b!363172))

(assert (= (and b!363172 res!202407) b!363173))

(assert (= (and b!363173 res!202405) b!363174))

(assert (= (and b!363174 res!202408) b!363175))

(declare-fun m!360059 () Bool)

(assert (=> b!363173 m!360059))

(declare-fun m!360061 () Bool)

(assert (=> start!36258 m!360061))

(declare-fun m!360063 () Bool)

(assert (=> b!363175 m!360063))

(declare-fun m!360065 () Bool)

(assert (=> b!363175 m!360065))

(declare-fun m!360067 () Bool)

(assert (=> b!363175 m!360067))

(declare-fun m!360069 () Bool)

(assert (=> b!363175 m!360069))

(declare-fun m!360071 () Bool)

(assert (=> b!363172 m!360071))

(assert (=> b!363172 m!360071))

(declare-fun m!360073 () Bool)

(assert (=> b!363172 m!360073))

(push 1)

(assert (not b!363172))

(assert (not b!363173))

(assert (not start!36258))

(assert (not b!363175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

