; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36398 () Bool)

(assert start!36398)

(declare-fun b!364076 () Bool)

(declare-fun e!222919 () Bool)

(declare-fun e!222918 () Bool)

(assert (=> b!364076 (= e!222919 e!222918)))

(declare-fun res!203240 () Bool)

(assert (=> b!364076 (=> (not res!203240) (not e!222918))))

(declare-fun lt!168300 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168299 () (_ BitVec 32))

(assert (=> b!364076 (= res!203240 (and (= lt!168300 (bvadd #b00000000000000000000000000000001 lt!168299)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20678 0))(
  ( (array!20679 (arr!9818 (Array (_ BitVec 32) (_ BitVec 64))) (size!10170 (_ BitVec 32))) )
))
(declare-fun lt!168307 () array!20678)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20678 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364076 (= lt!168300 (arrayCountValidKeys!0 lt!168307 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20678)

(assert (=> b!364076 (= lt!168299 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364076 (= lt!168307 (array!20679 (store (arr!9818 a!4289) i!1472 k0!2974) (size!10170 a!4289)))))

(declare-fun b!364077 () Bool)

(declare-fun res!203237 () Bool)

(assert (=> b!364077 (=> (not res!203237) (not e!222919))))

(assert (=> b!364077 (= res!203237 (and (bvslt (size!10170 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10170 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203238 () Bool)

(assert (=> start!36398 (=> (not res!203238) (not e!222919))))

(assert (=> start!36398 (= res!203238 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10170 a!4289))))))

(assert (=> start!36398 e!222919))

(assert (=> start!36398 true))

(declare-fun array_inv!7260 (array!20678) Bool)

(assert (=> start!36398 (array_inv!7260 a!4289)))

(declare-fun b!364078 () Bool)

(declare-fun e!222917 () Bool)

(assert (=> b!364078 (= e!222917 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364078 (= (arrayCountValidKeys!0 lt!168307 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11306 0))(
  ( (Unit!11307) )
))
(declare-fun lt!168301 () Unit!11306)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20678 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11306)

(assert (=> b!364078 (= lt!168301 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364079 () Bool)

(declare-fun res!203242 () Bool)

(assert (=> b!364079 (=> (not res!203242) (not e!222919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364079 (= res!203242 (validKeyInArray!0 k0!2974))))

(declare-fun b!364080 () Bool)

(assert (=> b!364080 (= e!222918 (not e!222917))))

(declare-fun res!203241 () Bool)

(assert (=> b!364080 (=> res!203241 e!222917)))

(declare-fun lt!168303 () (_ BitVec 32))

(declare-fun lt!168304 () (_ BitVec 32))

(assert (=> b!364080 (= res!203241 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10170 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168303 (bvadd #b00000000000000000000000000000001 lt!168304)))))))

(declare-fun lt!168305 () (_ BitVec 32))

(assert (=> b!364080 (= (bvadd lt!168305 lt!168300) lt!168303)))

(assert (=> b!364080 (= lt!168303 (arrayCountValidKeys!0 lt!168307 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364080 (= lt!168305 (arrayCountValidKeys!0 lt!168307 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168306 () Unit!11306)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11306)

(assert (=> b!364080 (= lt!168306 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168307 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168302 () (_ BitVec 32))

(assert (=> b!364080 (= (bvadd lt!168302 lt!168299) lt!168304)))

(assert (=> b!364080 (= lt!168304 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364080 (= lt!168302 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168298 () Unit!11306)

(assert (=> b!364080 (= lt!168298 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364081 () Bool)

(declare-fun res!203239 () Bool)

(assert (=> b!364081 (=> (not res!203239) (not e!222919))))

(assert (=> b!364081 (= res!203239 (not (validKeyInArray!0 (select (arr!9818 a!4289) i!1472))))))

(assert (= (and start!36398 res!203238) b!364081))

(assert (= (and b!364081 res!203239) b!364079))

(assert (= (and b!364079 res!203242) b!364077))

(assert (= (and b!364077 res!203237) b!364076))

(assert (= (and b!364076 res!203240) b!364080))

(assert (= (and b!364080 (not res!203241)) b!364078))

(declare-fun m!361501 () Bool)

(assert (=> start!36398 m!361501))

(declare-fun m!361503 () Bool)

(assert (=> b!364080 m!361503))

(declare-fun m!361505 () Bool)

(assert (=> b!364080 m!361505))

(declare-fun m!361507 () Bool)

(assert (=> b!364080 m!361507))

(declare-fun m!361509 () Bool)

(assert (=> b!364080 m!361509))

(declare-fun m!361511 () Bool)

(assert (=> b!364080 m!361511))

(declare-fun m!361513 () Bool)

(assert (=> b!364080 m!361513))

(declare-fun m!361515 () Bool)

(assert (=> b!364079 m!361515))

(declare-fun m!361517 () Bool)

(assert (=> b!364078 m!361517))

(declare-fun m!361519 () Bool)

(assert (=> b!364078 m!361519))

(declare-fun m!361521 () Bool)

(assert (=> b!364078 m!361521))

(declare-fun m!361523 () Bool)

(assert (=> b!364076 m!361523))

(declare-fun m!361525 () Bool)

(assert (=> b!364076 m!361525))

(declare-fun m!361527 () Bool)

(assert (=> b!364076 m!361527))

(declare-fun m!361529 () Bool)

(assert (=> b!364081 m!361529))

(assert (=> b!364081 m!361529))

(declare-fun m!361531 () Bool)

(assert (=> b!364081 m!361531))

(check-sat (not b!364081) (not start!36398) (not b!364078) (not b!364080) (not b!364076) (not b!364079))
(check-sat)
