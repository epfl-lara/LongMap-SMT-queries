; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36242 () Bool)

(assert start!36242)

(declare-fun b!362889 () Bool)

(declare-fun res!202264 () Bool)

(declare-fun e!222208 () Bool)

(assert (=> b!362889 (=> (not res!202264) (not e!222208))))

(declare-datatypes ((array!20539 0))(
  ( (array!20540 (arr!9750 (Array (_ BitVec 32) (_ BitVec 64))) (size!10103 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20539)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362889 (= res!202264 (not (validKeyInArray!0 (select (arr!9750 a!4337) i!1478))))))

(declare-fun b!362890 () Bool)

(declare-fun res!202267 () Bool)

(assert (=> b!362890 (=> (not res!202267) (not e!222208))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362890 (= res!202267 (validKeyInArray!0 k!2980))))

(declare-fun res!202266 () Bool)

(assert (=> start!36242 (=> (not res!202266) (not e!222208))))

(assert (=> start!36242 (= res!202266 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10103 a!4337))))))

(assert (=> start!36242 e!222208))

(assert (=> start!36242 true))

(declare-fun array_inv!7199 (array!20539) Bool)

(assert (=> start!36242 (array_inv!7199 a!4337)))

(declare-fun b!362891 () Bool)

(declare-fun res!202265 () Bool)

(assert (=> b!362891 (=> (not res!202265) (not e!222208))))

(assert (=> b!362891 (= res!202265 (bvslt (size!10103 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362892 () Bool)

(assert (=> b!362892 (= e!222208 (not true))))

(declare-fun arrayCountValidKeys!0 (array!20539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362892 (= (arrayCountValidKeys!0 (array!20540 (store (arr!9750 a!4337) i!1478 k!2980) (size!10103 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11184 0))(
  ( (Unit!11185) )
))
(declare-fun lt!167140 () Unit!11184)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20539 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11184)

(assert (=> b!362892 (= lt!167140 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36242 res!202266) b!362889))

(assert (= (and b!362889 res!202264) b!362890))

(assert (= (and b!362890 res!202267) b!362891))

(assert (= (and b!362891 res!202265) b!362892))

(declare-fun m!359319 () Bool)

(assert (=> b!362889 m!359319))

(assert (=> b!362889 m!359319))

(declare-fun m!359321 () Bool)

(assert (=> b!362889 m!359321))

(declare-fun m!359323 () Bool)

(assert (=> b!362890 m!359323))

(declare-fun m!359325 () Bool)

(assert (=> start!36242 m!359325))

(declare-fun m!359327 () Bool)

(assert (=> b!362892 m!359327))

(declare-fun m!359329 () Bool)

(assert (=> b!362892 m!359329))

(declare-fun m!359331 () Bool)

(assert (=> b!362892 m!359331))

(declare-fun m!359333 () Bool)

(assert (=> b!362892 m!359333))

(push 1)

(assert (not b!362890))

(assert (not start!36242))

(assert (not b!362892))

(assert (not b!362889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

