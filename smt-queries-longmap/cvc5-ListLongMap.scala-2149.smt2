; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36176 () Bool)

(assert start!36176)

(declare-fun b!362748 () Bool)

(declare-fun res!202083 () Bool)

(declare-fun e!222149 () Bool)

(assert (=> b!362748 (=> (not res!202083) (not e!222149))))

(declare-datatypes ((array!20487 0))(
  ( (array!20488 (arr!9725 (Array (_ BitVec 32) (_ BitVec 64))) (size!10077 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20487)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362748 (= res!202083 (not (validKeyInArray!0 (select (arr!9725 a!4337) i!1478))))))

(declare-fun b!362749 () Bool)

(declare-fun res!202087 () Bool)

(assert (=> b!362749 (=> (not res!202087) (not e!222149))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362749 (= res!202087 (validKeyInArray!0 k!2980))))

(declare-fun b!362750 () Bool)

(declare-fun e!222151 () Bool)

(assert (=> b!362750 (= e!222149 (not e!222151))))

(declare-fun res!202084 () Bool)

(assert (=> b!362750 (=> res!202084 e!222151)))

(assert (=> b!362750 (= res!202084 (or (bvslt (size!10077 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167108 () (_ BitVec 32))

(declare-fun lt!167102 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20487 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362750 (= (bvadd lt!167108 lt!167102) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10077 a!4337)))))

(declare-datatypes ((Unit!11159 0))(
  ( (Unit!11160) )
))
(declare-fun lt!167106 () Unit!11159)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11159)

(assert (=> b!362750 (= lt!167106 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10077 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167105 () (_ BitVec 32))

(assert (=> b!362750 (= lt!167105 lt!167102)))

(assert (=> b!362750 (= lt!167102 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10077 a!4337)))))

(declare-fun lt!167107 () array!20487)

(assert (=> b!362750 (= lt!167105 (arrayCountValidKeys!0 lt!167107 (bvadd #b00000000000000000000000000000001 i!1478) (size!10077 a!4337)))))

(declare-fun lt!167101 () Unit!11159)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20487 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11159)

(assert (=> b!362750 (= lt!167101 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167109 () (_ BitVec 32))

(assert (=> b!362750 (= lt!167109 (bvadd #b00000000000000000000000000000001 lt!167108))))

(assert (=> b!362750 (= lt!167109 (arrayCountValidKeys!0 lt!167107 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362750 (= lt!167108 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362750 (= lt!167107 (array!20488 (store (arr!9725 a!4337) i!1478 k!2980) (size!10077 a!4337)))))

(declare-fun lt!167103 () Unit!11159)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20487 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11159)

(assert (=> b!362750 (= lt!167103 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362751 () Bool)

(assert (=> b!362751 (= e!222151 true)))

(assert (=> b!362751 (= (bvadd lt!167109 lt!167105) (arrayCountValidKeys!0 lt!167107 #b00000000000000000000000000000000 (size!10077 a!4337)))))

(declare-fun lt!167104 () Unit!11159)

(assert (=> b!362751 (= lt!167104 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167107 #b00000000000000000000000000000000 (size!10077 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362752 () Bool)

(declare-fun res!202085 () Bool)

(assert (=> b!362752 (=> (not res!202085) (not e!222149))))

(assert (=> b!362752 (= res!202085 (bvslt (size!10077 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202086 () Bool)

(assert (=> start!36176 (=> (not res!202086) (not e!222149))))

(assert (=> start!36176 (= res!202086 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10077 a!4337))))))

(assert (=> start!36176 e!222149))

(assert (=> start!36176 true))

(declare-fun array_inv!7197 (array!20487) Bool)

(assert (=> start!36176 (array_inv!7197 a!4337)))

(assert (= (and start!36176 res!202086) b!362748))

(assert (= (and b!362748 res!202083) b!362749))

(assert (= (and b!362749 res!202087) b!362752))

(assert (= (and b!362752 res!202085) b!362750))

(assert (= (and b!362750 (not res!202084)) b!362751))

(declare-fun m!359743 () Bool)

(assert (=> b!362750 m!359743))

(declare-fun m!359745 () Bool)

(assert (=> b!362750 m!359745))

(declare-fun m!359747 () Bool)

(assert (=> b!362750 m!359747))

(declare-fun m!359749 () Bool)

(assert (=> b!362750 m!359749))

(declare-fun m!359751 () Bool)

(assert (=> b!362750 m!359751))

(declare-fun m!359753 () Bool)

(assert (=> b!362750 m!359753))

(declare-fun m!359755 () Bool)

(assert (=> b!362750 m!359755))

(declare-fun m!359757 () Bool)

(assert (=> b!362750 m!359757))

(declare-fun m!359759 () Bool)

(assert (=> b!362750 m!359759))

(declare-fun m!359761 () Bool)

(assert (=> b!362748 m!359761))

(assert (=> b!362748 m!359761))

(declare-fun m!359763 () Bool)

(assert (=> b!362748 m!359763))

(declare-fun m!359765 () Bool)

(assert (=> start!36176 m!359765))

(declare-fun m!359767 () Bool)

(assert (=> b!362751 m!359767))

(declare-fun m!359769 () Bool)

(assert (=> b!362751 m!359769))

(declare-fun m!359771 () Bool)

(assert (=> b!362749 m!359771))

(push 1)

(assert (not b!362749))

(assert (not b!362751))

(assert (not start!36176))

(assert (not b!362750))

(assert (not b!362748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

