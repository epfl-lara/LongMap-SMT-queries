; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36208 () Bool)

(assert start!36208)

(declare-fun b!362932 () Bool)

(declare-fun e!222262 () Bool)

(assert (=> b!362932 (= e!222262 true)))

(declare-datatypes ((array!20524 0))(
  ( (array!20525 (arr!9744 (Array (_ BitVec 32) (_ BitVec 64))) (size!10096 (_ BitVec 32))) )
))
(declare-fun lt!167326 () array!20524)

(declare-fun lt!167327 () (_ BitVec 32))

(declare-fun lt!167325 () (_ BitVec 32))

(declare-fun a!4337 () array!20524)

(declare-fun arrayCountValidKeys!0 (array!20524 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362932 (= (bvadd lt!167325 lt!167327) (arrayCountValidKeys!0 lt!167326 #b00000000000000000000000000000000 (size!10096 a!4337)))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((Unit!11188 0))(
  ( (Unit!11189) )
))
(declare-fun lt!167328 () Unit!11188)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11188)

(assert (=> b!362932 (= lt!167328 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167326 #b00000000000000000000000000000000 (size!10096 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362933 () Bool)

(declare-fun res!202221 () Bool)

(declare-fun e!222263 () Bool)

(assert (=> b!362933 (=> (not res!202221) (not e!222263))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362933 (= res!202221 (validKeyInArray!0 k!2980))))

(declare-fun res!202225 () Bool)

(assert (=> start!36208 (=> (not res!202225) (not e!222263))))

(assert (=> start!36208 (= res!202225 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10096 a!4337))))))

(assert (=> start!36208 e!222263))

(assert (=> start!36208 true))

(declare-fun array_inv!7186 (array!20524) Bool)

(assert (=> start!36208 (array_inv!7186 a!4337)))

(declare-fun b!362934 () Bool)

(declare-fun res!202224 () Bool)

(assert (=> b!362934 (=> (not res!202224) (not e!222263))))

(assert (=> b!362934 (= res!202224 (bvslt (size!10096 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362935 () Bool)

(assert (=> b!362935 (= e!222263 (not e!222262))))

(declare-fun res!202223 () Bool)

(assert (=> b!362935 (=> res!202223 e!222262)))

(assert (=> b!362935 (= res!202223 (or (bvslt (size!10096 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167333 () (_ BitVec 32))

(declare-fun lt!167329 () (_ BitVec 32))

(assert (=> b!362935 (= (bvadd lt!167333 lt!167329) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10096 a!4337)))))

(declare-fun lt!167331 () Unit!11188)

(assert (=> b!362935 (= lt!167331 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10096 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362935 (= lt!167327 lt!167329)))

(assert (=> b!362935 (= lt!167329 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10096 a!4337)))))

(assert (=> b!362935 (= lt!167327 (arrayCountValidKeys!0 lt!167326 (bvadd #b00000000000000000000000000000001 i!1478) (size!10096 a!4337)))))

(declare-fun lt!167332 () Unit!11188)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20524 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11188)

(assert (=> b!362935 (= lt!167332 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362935 (= lt!167325 (bvadd #b00000000000000000000000000000001 lt!167333))))

(assert (=> b!362935 (= lt!167325 (arrayCountValidKeys!0 lt!167326 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362935 (= lt!167333 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362935 (= lt!167326 (array!20525 (store (arr!9744 a!4337) i!1478 k!2980) (size!10096 a!4337)))))

(declare-fun lt!167330 () Unit!11188)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20524 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11188)

(assert (=> b!362935 (= lt!167330 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362936 () Bool)

(declare-fun res!202222 () Bool)

(assert (=> b!362936 (=> (not res!202222) (not e!222263))))

(assert (=> b!362936 (= res!202222 (not (validKeyInArray!0 (select (arr!9744 a!4337) i!1478))))))

(assert (= (and start!36208 res!202225) b!362936))

(assert (= (and b!362936 res!202222) b!362933))

(assert (= (and b!362933 res!202221) b!362934))

(assert (= (and b!362934 res!202224) b!362935))

(assert (= (and b!362935 (not res!202223)) b!362932))

(declare-fun m!359783 () Bool)

(assert (=> b!362932 m!359783))

(declare-fun m!359785 () Bool)

(assert (=> b!362932 m!359785))

(declare-fun m!359787 () Bool)

(assert (=> start!36208 m!359787))

(declare-fun m!359789 () Bool)

(assert (=> b!362936 m!359789))

(assert (=> b!362936 m!359789))

(declare-fun m!359791 () Bool)

(assert (=> b!362936 m!359791))

(declare-fun m!359793 () Bool)

(assert (=> b!362933 m!359793))

(declare-fun m!359795 () Bool)

(assert (=> b!362935 m!359795))

(declare-fun m!359797 () Bool)

(assert (=> b!362935 m!359797))

(declare-fun m!359799 () Bool)

(assert (=> b!362935 m!359799))

(declare-fun m!359801 () Bool)

(assert (=> b!362935 m!359801))

(declare-fun m!359803 () Bool)

(assert (=> b!362935 m!359803))

(declare-fun m!359805 () Bool)

(assert (=> b!362935 m!359805))

(declare-fun m!359807 () Bool)

(assert (=> b!362935 m!359807))

(declare-fun m!359809 () Bool)

(assert (=> b!362935 m!359809))

(declare-fun m!359811 () Bool)

(assert (=> b!362935 m!359811))

(push 1)

(assert (not b!362932))

(assert (not b!362935))

(assert (not start!36208))

(assert (not b!362933))

(assert (not b!362936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

