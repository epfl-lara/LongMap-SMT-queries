; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36386 () Bool)

(assert start!36386)

(declare-fun b!363968 () Bool)

(declare-fun e!222845 () Bool)

(declare-fun e!222846 () Bool)

(assert (=> b!363968 (= e!222845 (not e!222846))))

(declare-fun res!203129 () Bool)

(assert (=> b!363968 (=> res!203129 e!222846)))

(declare-fun lt!168122 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168124 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20666 0))(
  ( (array!20667 (arr!9812 (Array (_ BitVec 32) (_ BitVec 64))) (size!10164 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20666)

(assert (=> b!363968 (= res!203129 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10164 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168122 (bvadd #b00000000000000000000000000000001 lt!168124)))))))

(declare-fun lt!168120 () (_ BitVec 32))

(declare-fun lt!168127 () (_ BitVec 32))

(assert (=> b!363968 (= (bvadd lt!168120 lt!168127) lt!168122)))

(declare-fun lt!168118 () array!20666)

(declare-fun arrayCountValidKeys!0 (array!20666 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363968 (= lt!168122 (arrayCountValidKeys!0 lt!168118 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363968 (= lt!168120 (arrayCountValidKeys!0 lt!168118 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11294 0))(
  ( (Unit!11295) )
))
(declare-fun lt!168121 () Unit!11294)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11294)

(assert (=> b!363968 (= lt!168121 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168118 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168119 () (_ BitVec 32))

(declare-fun lt!168126 () (_ BitVec 32))

(assert (=> b!363968 (= (bvadd lt!168119 lt!168126) lt!168124)))

(assert (=> b!363968 (= lt!168124 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363968 (= lt!168119 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168123 () Unit!11294)

(assert (=> b!363968 (= lt!168123 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363969 () Bool)

(declare-fun res!203132 () Bool)

(declare-fun e!222844 () Bool)

(assert (=> b!363969 (=> (not res!203132) (not e!222844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363969 (= res!203132 (not (validKeyInArray!0 (select (arr!9812 a!4289) i!1472))))))

(declare-fun b!363970 () Bool)

(assert (=> b!363970 (= e!222844 e!222845)))

(declare-fun res!203133 () Bool)

(assert (=> b!363970 (=> (not res!203133) (not e!222845))))

(assert (=> b!363970 (= res!203133 (and (= lt!168127 (bvadd #b00000000000000000000000000000001 lt!168126)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363970 (= lt!168127 (arrayCountValidKeys!0 lt!168118 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363970 (= lt!168126 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363970 (= lt!168118 (array!20667 (store (arr!9812 a!4289) i!1472 k0!2974) (size!10164 a!4289)))))

(declare-fun b!363971 () Bool)

(declare-fun res!203134 () Bool)

(assert (=> b!363971 (=> (not res!203134) (not e!222844))))

(assert (=> b!363971 (= res!203134 (and (bvslt (size!10164 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10164 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363972 () Bool)

(declare-fun res!203130 () Bool)

(assert (=> b!363972 (=> (not res!203130) (not e!222844))))

(assert (=> b!363972 (= res!203130 (validKeyInArray!0 k0!2974))))

(declare-fun res!203131 () Bool)

(assert (=> start!36386 (=> (not res!203131) (not e!222844))))

(assert (=> start!36386 (= res!203131 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10164 a!4289))))))

(assert (=> start!36386 e!222844))

(assert (=> start!36386 true))

(declare-fun array_inv!7254 (array!20666) Bool)

(assert (=> start!36386 (array_inv!7254 a!4289)))

(declare-fun b!363973 () Bool)

(assert (=> b!363973 (= e!222846 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363973 (= (arrayCountValidKeys!0 lt!168118 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!168125 () Unit!11294)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20666 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11294)

(assert (=> b!363973 (= lt!168125 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(assert (= (and start!36386 res!203131) b!363969))

(assert (= (and b!363969 res!203132) b!363972))

(assert (= (and b!363972 res!203130) b!363971))

(assert (= (and b!363971 res!203134) b!363970))

(assert (= (and b!363970 res!203133) b!363968))

(assert (= (and b!363968 (not res!203129)) b!363973))

(declare-fun m!361309 () Bool)

(assert (=> b!363972 m!361309))

(declare-fun m!361311 () Bool)

(assert (=> start!36386 m!361311))

(declare-fun m!361313 () Bool)

(assert (=> b!363969 m!361313))

(assert (=> b!363969 m!361313))

(declare-fun m!361315 () Bool)

(assert (=> b!363969 m!361315))

(declare-fun m!361317 () Bool)

(assert (=> b!363968 m!361317))

(declare-fun m!361319 () Bool)

(assert (=> b!363968 m!361319))

(declare-fun m!361321 () Bool)

(assert (=> b!363968 m!361321))

(declare-fun m!361323 () Bool)

(assert (=> b!363968 m!361323))

(declare-fun m!361325 () Bool)

(assert (=> b!363968 m!361325))

(declare-fun m!361327 () Bool)

(assert (=> b!363968 m!361327))

(declare-fun m!361329 () Bool)

(assert (=> b!363970 m!361329))

(declare-fun m!361331 () Bool)

(assert (=> b!363970 m!361331))

(declare-fun m!361333 () Bool)

(assert (=> b!363970 m!361333))

(declare-fun m!361335 () Bool)

(assert (=> b!363973 m!361335))

(declare-fun m!361337 () Bool)

(assert (=> b!363973 m!361337))

(declare-fun m!361339 () Bool)

(assert (=> b!363973 m!361339))

(check-sat (not start!36386) (not b!363970) (not b!363968) (not b!363969) (not b!363973) (not b!363972))
(check-sat)
