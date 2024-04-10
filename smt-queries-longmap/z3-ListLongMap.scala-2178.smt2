; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36404 () Bool)

(assert start!36404)

(declare-fun b!364130 () Bool)

(declare-fun res!203296 () Bool)

(declare-fun e!222953 () Bool)

(assert (=> b!364130 (=> (not res!203296) (not e!222953))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364130 (= res!203296 (validKeyInArray!0 k0!2974))))

(declare-fun b!364131 () Bool)

(declare-fun res!203291 () Bool)

(assert (=> b!364131 (=> (not res!203291) (not e!222953))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20684 0))(
  ( (array!20685 (arr!9821 (Array (_ BitVec 32) (_ BitVec 64))) (size!10173 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20684)

(assert (=> b!364131 (= res!203291 (and (bvslt (size!10173 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10173 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203294 () Bool)

(assert (=> start!36404 (=> (not res!203294) (not e!222953))))

(assert (=> start!36404 (= res!203294 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10173 a!4289))))))

(assert (=> start!36404 e!222953))

(assert (=> start!36404 true))

(declare-fun array_inv!7263 (array!20684) Bool)

(assert (=> start!36404 (array_inv!7263 a!4289)))

(declare-fun b!364132 () Bool)

(declare-fun e!222952 () Bool)

(assert (=> b!364132 (= e!222953 e!222952)))

(declare-fun res!203295 () Bool)

(assert (=> b!364132 (=> (not res!203295) (not e!222952))))

(declare-fun lt!168396 () (_ BitVec 32))

(declare-fun lt!168395 () (_ BitVec 32))

(assert (=> b!364132 (= res!203295 (and (= lt!168395 (bvadd #b00000000000000000000000000000001 lt!168396)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168394 () array!20684)

(declare-fun arrayCountValidKeys!0 (array!20684 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364132 (= lt!168395 (arrayCountValidKeys!0 lt!168394 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364132 (= lt!168396 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364132 (= lt!168394 (array!20685 (store (arr!9821 a!4289) i!1472 k0!2974) (size!10173 a!4289)))))

(declare-fun b!364133 () Bool)

(declare-fun e!222955 () Bool)

(assert (=> b!364133 (= e!222952 (not e!222955))))

(declare-fun res!203293 () Bool)

(assert (=> b!364133 (=> res!203293 e!222955)))

(declare-fun lt!168391 () (_ BitVec 32))

(declare-fun lt!168392 () (_ BitVec 32))

(assert (=> b!364133 (= res!203293 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10173 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168391 (bvadd #b00000000000000000000000000000001 lt!168392)))))))

(declare-fun lt!168390 () (_ BitVec 32))

(assert (=> b!364133 (= (bvadd lt!168390 lt!168395) lt!168391)))

(assert (=> b!364133 (= lt!168391 (arrayCountValidKeys!0 lt!168394 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364133 (= lt!168390 (arrayCountValidKeys!0 lt!168394 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11312 0))(
  ( (Unit!11313) )
))
(declare-fun lt!168397 () Unit!11312)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11312)

(assert (=> b!364133 (= lt!168397 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168394 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168393 () (_ BitVec 32))

(assert (=> b!364133 (= (bvadd lt!168393 lt!168396) lt!168392)))

(assert (=> b!364133 (= lt!168392 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364133 (= lt!168393 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168389 () Unit!11312)

(assert (=> b!364133 (= lt!168389 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364134 () Bool)

(declare-fun res!203292 () Bool)

(assert (=> b!364134 (=> (not res!203292) (not e!222953))))

(assert (=> b!364134 (= res!203292 (not (validKeyInArray!0 (select (arr!9821 a!4289) i!1472))))))

(declare-fun b!364135 () Bool)

(assert (=> b!364135 (= e!222955 true)))

(assert (=> b!364135 (= (arrayCountValidKeys!0 lt!168394 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!168388 () Unit!11312)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20684 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11312)

(assert (=> b!364135 (= lt!168388 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(assert (= (and start!36404 res!203294) b!364134))

(assert (= (and b!364134 res!203292) b!364130))

(assert (= (and b!364130 res!203296) b!364131))

(assert (= (and b!364131 res!203291) b!364132))

(assert (= (and b!364132 res!203295) b!364133))

(assert (= (and b!364133 (not res!203293)) b!364135))

(declare-fun m!361597 () Bool)

(assert (=> b!364133 m!361597))

(declare-fun m!361599 () Bool)

(assert (=> b!364133 m!361599))

(declare-fun m!361601 () Bool)

(assert (=> b!364133 m!361601))

(declare-fun m!361603 () Bool)

(assert (=> b!364133 m!361603))

(declare-fun m!361605 () Bool)

(assert (=> b!364133 m!361605))

(declare-fun m!361607 () Bool)

(assert (=> b!364133 m!361607))

(declare-fun m!361609 () Bool)

(assert (=> b!364135 m!361609))

(declare-fun m!361611 () Bool)

(assert (=> b!364135 m!361611))

(declare-fun m!361613 () Bool)

(assert (=> b!364135 m!361613))

(declare-fun m!361615 () Bool)

(assert (=> b!364130 m!361615))

(declare-fun m!361617 () Bool)

(assert (=> b!364134 m!361617))

(assert (=> b!364134 m!361617))

(declare-fun m!361619 () Bool)

(assert (=> b!364134 m!361619))

(declare-fun m!361621 () Bool)

(assert (=> b!364132 m!361621))

(declare-fun m!361623 () Bool)

(assert (=> b!364132 m!361623))

(declare-fun m!361625 () Bool)

(assert (=> b!364132 m!361625))

(declare-fun m!361627 () Bool)

(assert (=> start!36404 m!361627))

(check-sat (not b!364135) (not start!36404) (not b!364132) (not b!364133) (not b!364130) (not b!364134))
(check-sat)
