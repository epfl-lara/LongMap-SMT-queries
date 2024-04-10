; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36246 () Bool)

(assert start!36246)

(declare-fun b!363101 () Bool)

(declare-fun res!202336 () Bool)

(declare-fun e!222352 () Bool)

(assert (=> b!363101 (=> (not res!202336) (not e!222352))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363101 (= res!202336 (validKeyInArray!0 k!2980))))

(declare-fun b!363102 () Bool)

(declare-fun res!202333 () Bool)

(assert (=> b!363102 (=> (not res!202333) (not e!222352))))

(declare-datatypes ((array!20547 0))(
  ( (array!20548 (arr!9754 (Array (_ BitVec 32) (_ BitVec 64))) (size!10106 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20547)

(assert (=> b!363102 (= res!202333 (bvslt (size!10106 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363103 () Bool)

(assert (=> b!363103 (= e!222352 (not true))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20547 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363103 (= (arrayCountValidKeys!0 (array!20548 (store (arr!9754 a!4337) i!1478 k!2980) (size!10106 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11196 0))(
  ( (Unit!11197) )
))
(declare-fun lt!167359 () Unit!11196)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11196)

(assert (=> b!363103 (= lt!167359 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363100 () Bool)

(declare-fun res!202334 () Bool)

(assert (=> b!363100 (=> (not res!202334) (not e!222352))))

(assert (=> b!363100 (= res!202334 (not (validKeyInArray!0 (select (arr!9754 a!4337) i!1478))))))

(declare-fun res!202335 () Bool)

(assert (=> start!36246 (=> (not res!202335) (not e!222352))))

(assert (=> start!36246 (= res!202335 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10106 a!4337))))))

(assert (=> start!36246 e!222352))

(assert (=> start!36246 true))

(declare-fun array_inv!7196 (array!20547) Bool)

(assert (=> start!36246 (array_inv!7196 a!4337)))

(assert (= (and start!36246 res!202335) b!363100))

(assert (= (and b!363100 res!202334) b!363101))

(assert (= (and b!363101 res!202336) b!363102))

(assert (= (and b!363102 res!202333) b!363103))

(declare-fun m!359963 () Bool)

(assert (=> b!363101 m!359963))

(declare-fun m!359965 () Bool)

(assert (=> b!363103 m!359965))

(declare-fun m!359967 () Bool)

(assert (=> b!363103 m!359967))

(declare-fun m!359969 () Bool)

(assert (=> b!363103 m!359969))

(declare-fun m!359971 () Bool)

(assert (=> b!363103 m!359971))

(declare-fun m!359973 () Bool)

(assert (=> b!363100 m!359973))

(assert (=> b!363100 m!359973))

(declare-fun m!359975 () Bool)

(assert (=> b!363100 m!359975))

(declare-fun m!359977 () Bool)

(assert (=> start!36246 m!359977))

(push 1)

(assert (not b!363100))

(assert (not b!363101))

(assert (not start!36246))

(assert (not b!363103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

