; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36204 () Bool)

(assert start!36204)

(declare-fun b!362902 () Bool)

(declare-fun e!222244 () Bool)

(declare-fun e!222245 () Bool)

(assert (=> b!362902 (= e!222244 (not e!222245))))

(declare-fun res!202195 () Bool)

(assert (=> b!362902 (=> res!202195 e!222245)))

(declare-datatypes ((array!20520 0))(
  ( (array!20521 (arr!9742 (Array (_ BitVec 32) (_ BitVec 64))) (size!10094 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20520)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362902 (= res!202195 (or (bvslt (size!10094 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167275 () (_ BitVec 32))

(declare-fun lt!167279 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20520 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362902 (= (bvadd lt!167275 lt!167279) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10094 a!4337)))))

(declare-datatypes ((Unit!11184 0))(
  ( (Unit!11185) )
))
(declare-fun lt!167272 () Unit!11184)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11184)

(assert (=> b!362902 (= lt!167272 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10094 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167273 () (_ BitVec 32))

(assert (=> b!362902 (= lt!167273 lt!167279)))

(assert (=> b!362902 (= lt!167279 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10094 a!4337)))))

(declare-fun lt!167278 () array!20520)

(assert (=> b!362902 (= lt!167273 (arrayCountValidKeys!0 lt!167278 (bvadd #b00000000000000000000000000000001 i!1478) (size!10094 a!4337)))))

(declare-fun lt!167277 () Unit!11184)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20520 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11184)

(assert (=> b!362902 (= lt!167277 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167274 () (_ BitVec 32))

(assert (=> b!362902 (= lt!167274 (bvadd #b00000000000000000000000000000001 lt!167275))))

(assert (=> b!362902 (= lt!167274 (arrayCountValidKeys!0 lt!167278 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362902 (= lt!167275 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362902 (= lt!167278 (array!20521 (store (arr!9742 a!4337) i!1478 k!2980) (size!10094 a!4337)))))

(declare-fun lt!167271 () Unit!11184)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20520 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11184)

(assert (=> b!362902 (= lt!167271 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362903 () Bool)

(declare-fun res!202192 () Bool)

(assert (=> b!362903 (=> (not res!202192) (not e!222244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362903 (= res!202192 (validKeyInArray!0 k!2980))))

(declare-fun b!362904 () Bool)

(assert (=> b!362904 (= e!222245 true)))

(assert (=> b!362904 (= (bvadd lt!167274 lt!167273) (arrayCountValidKeys!0 lt!167278 #b00000000000000000000000000000000 (size!10094 a!4337)))))

(declare-fun lt!167276 () Unit!11184)

(assert (=> b!362904 (= lt!167276 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167278 #b00000000000000000000000000000000 (size!10094 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!202193 () Bool)

(assert (=> start!36204 (=> (not res!202193) (not e!222244))))

(assert (=> start!36204 (= res!202193 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10094 a!4337))))))

(assert (=> start!36204 e!222244))

(assert (=> start!36204 true))

(declare-fun array_inv!7184 (array!20520) Bool)

(assert (=> start!36204 (array_inv!7184 a!4337)))

(declare-fun b!362905 () Bool)

(declare-fun res!202191 () Bool)

(assert (=> b!362905 (=> (not res!202191) (not e!222244))))

(assert (=> b!362905 (= res!202191 (bvslt (size!10094 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362906 () Bool)

(declare-fun res!202194 () Bool)

(assert (=> b!362906 (=> (not res!202194) (not e!222244))))

(assert (=> b!362906 (= res!202194 (not (validKeyInArray!0 (select (arr!9742 a!4337) i!1478))))))

(assert (= (and start!36204 res!202193) b!362906))

(assert (= (and b!362906 res!202194) b!362903))

(assert (= (and b!362903 res!202192) b!362905))

(assert (= (and b!362905 res!202191) b!362902))

(assert (= (and b!362902 (not res!202195)) b!362904))

(declare-fun m!359723 () Bool)

(assert (=> b!362904 m!359723))

(declare-fun m!359725 () Bool)

(assert (=> b!362904 m!359725))

(declare-fun m!359727 () Bool)

(assert (=> b!362903 m!359727))

(declare-fun m!359729 () Bool)

(assert (=> start!36204 m!359729))

(declare-fun m!359731 () Bool)

(assert (=> b!362906 m!359731))

(assert (=> b!362906 m!359731))

(declare-fun m!359733 () Bool)

(assert (=> b!362906 m!359733))

(declare-fun m!359735 () Bool)

(assert (=> b!362902 m!359735))

(declare-fun m!359737 () Bool)

(assert (=> b!362902 m!359737))

(declare-fun m!359739 () Bool)

(assert (=> b!362902 m!359739))

(declare-fun m!359741 () Bool)

(assert (=> b!362902 m!359741))

(declare-fun m!359743 () Bool)

(assert (=> b!362902 m!359743))

(declare-fun m!359745 () Bool)

(assert (=> b!362902 m!359745))

(declare-fun m!359747 () Bool)

(assert (=> b!362902 m!359747))

(declare-fun m!359749 () Bool)

(assert (=> b!362902 m!359749))

(declare-fun m!359751 () Bool)

(assert (=> b!362902 m!359751))

(push 1)

(assert (not b!362906))

(assert (not start!36204))

(assert (not b!362903))

(assert (not b!362904))

(assert (not b!362902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

