; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36370 () Bool)

(assert start!36370)

(declare-fun b!363901 () Bool)

(declare-fun e!222801 () Bool)

(declare-fun e!222803 () Bool)

(assert (=> b!363901 (= e!222801 e!222803)))

(declare-fun res!203108 () Bool)

(assert (=> b!363901 (=> (not res!203108) (not e!222803))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168115 () (_ BitVec 32))

(declare-fun lt!168111 () (_ BitVec 32))

(assert (=> b!363901 (= res!203108 (and (= lt!168115 (bvadd #b00000000000000000000000000000001 lt!168111)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20645 0))(
  ( (array!20646 (arr!9801 (Array (_ BitVec 32) (_ BitVec 64))) (size!10153 (_ BitVec 32))) )
))
(declare-fun lt!168107 () array!20645)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20645 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363901 (= lt!168115 (arrayCountValidKeys!0 lt!168107 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20645)

(assert (=> b!363901 (= lt!168111 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363901 (= lt!168107 (array!20646 (store (arr!9801 a!4289) i!1472 k0!2974) (size!10153 a!4289)))))

(declare-fun b!363902 () Bool)

(declare-fun e!222800 () Bool)

(assert (=> b!363902 (= e!222800 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363902 (= (arrayCountValidKeys!0 lt!168107 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11281 0))(
  ( (Unit!11282) )
))
(declare-fun lt!168113 () Unit!11281)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20645 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11281)

(assert (=> b!363902 (= lt!168113 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203110 () Bool)

(assert (=> start!36370 (=> (not res!203110) (not e!222801))))

(assert (=> start!36370 (= res!203110 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10153 a!4289))))))

(assert (=> start!36370 e!222801))

(assert (=> start!36370 true))

(declare-fun array_inv!7273 (array!20645) Bool)

(assert (=> start!36370 (array_inv!7273 a!4289)))

(declare-fun b!363903 () Bool)

(declare-fun res!203111 () Bool)

(assert (=> b!363903 (=> (not res!203111) (not e!222801))))

(assert (=> b!363903 (= res!203111 (and (bvslt (size!10153 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10153 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363904 () Bool)

(assert (=> b!363904 (= e!222803 (not e!222800))))

(declare-fun res!203113 () Bool)

(assert (=> b!363904 (=> res!203113 e!222800)))

(declare-fun lt!168109 () (_ BitVec 32))

(declare-fun lt!168116 () (_ BitVec 32))

(assert (=> b!363904 (= res!203113 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10153 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168116 (bvadd #b00000000000000000000000000000001 lt!168109)))))))

(declare-fun lt!168112 () (_ BitVec 32))

(assert (=> b!363904 (= (bvadd lt!168112 lt!168115) lt!168116)))

(assert (=> b!363904 (= lt!168116 (arrayCountValidKeys!0 lt!168107 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363904 (= lt!168112 (arrayCountValidKeys!0 lt!168107 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168114 () Unit!11281)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11281)

(assert (=> b!363904 (= lt!168114 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168107 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168108 () (_ BitVec 32))

(assert (=> b!363904 (= (bvadd lt!168108 lt!168111) lt!168109)))

(assert (=> b!363904 (= lt!168109 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363904 (= lt!168108 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168110 () Unit!11281)

(assert (=> b!363904 (= lt!168110 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363905 () Bool)

(declare-fun res!203109 () Bool)

(assert (=> b!363905 (=> (not res!203109) (not e!222801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363905 (= res!203109 (not (validKeyInArray!0 (select (arr!9801 a!4289) i!1472))))))

(declare-fun b!363906 () Bool)

(declare-fun res!203112 () Bool)

(assert (=> b!363906 (=> (not res!203112) (not e!222801))))

(assert (=> b!363906 (= res!203112 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36370 res!203110) b!363905))

(assert (= (and b!363905 res!203109) b!363906))

(assert (= (and b!363906 res!203112) b!363903))

(assert (= (and b!363903 res!203111) b!363901))

(assert (= (and b!363901 res!203108) b!363904))

(assert (= (and b!363904 (not res!203113)) b!363902))

(declare-fun m!361507 () Bool)

(assert (=> b!363906 m!361507))

(declare-fun m!361509 () Bool)

(assert (=> start!36370 m!361509))

(declare-fun m!361511 () Bool)

(assert (=> b!363904 m!361511))

(declare-fun m!361513 () Bool)

(assert (=> b!363904 m!361513))

(declare-fun m!361515 () Bool)

(assert (=> b!363904 m!361515))

(declare-fun m!361517 () Bool)

(assert (=> b!363904 m!361517))

(declare-fun m!361519 () Bool)

(assert (=> b!363904 m!361519))

(declare-fun m!361521 () Bool)

(assert (=> b!363904 m!361521))

(declare-fun m!361523 () Bool)

(assert (=> b!363902 m!361523))

(declare-fun m!361525 () Bool)

(assert (=> b!363902 m!361525))

(declare-fun m!361527 () Bool)

(assert (=> b!363902 m!361527))

(declare-fun m!361529 () Bool)

(assert (=> b!363901 m!361529))

(declare-fun m!361531 () Bool)

(assert (=> b!363901 m!361531))

(declare-fun m!361533 () Bool)

(assert (=> b!363901 m!361533))

(declare-fun m!361535 () Bool)

(assert (=> b!363905 m!361535))

(assert (=> b!363905 m!361535))

(declare-fun m!361537 () Bool)

(assert (=> b!363905 m!361537))

(check-sat (not b!363902) (not b!363906) (not b!363901) (not b!363905) (not start!36370) (not b!363904))
(check-sat)
