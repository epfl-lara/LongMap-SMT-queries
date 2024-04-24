; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36442 () Bool)

(assert start!36442)

(declare-fun res!203673 () Bool)

(declare-fun e!223104 () Bool)

(assert (=> start!36442 (=> (not res!203673) (not e!223104))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20717 0))(
  ( (array!20718 (arr!9837 (Array (_ BitVec 32) (_ BitVec 64))) (size!10189 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20717)

(assert (=> start!36442 (= res!203673 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10189 a!4289))))))

(assert (=> start!36442 e!223104))

(assert (=> start!36442 true))

(declare-fun array_inv!7309 (array!20717) Bool)

(assert (=> start!36442 (array_inv!7309 a!4289)))

(declare-fun b!364466 () Bool)

(declare-fun res!203675 () Bool)

(assert (=> b!364466 (=> (not res!203675) (not e!223104))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364466 (= res!203675 (and (bvslt (size!10189 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10189 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364467 () Bool)

(declare-fun res!203677 () Bool)

(assert (=> b!364467 (=> (not res!203677) (not e!223104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364467 (= res!203677 (not (validKeyInArray!0 (select (arr!9837 a!4289) i!1472))))))

(declare-fun b!364468 () Bool)

(declare-fun res!203676 () Bool)

(assert (=> b!364468 (=> (not res!203676) (not e!223104))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364468 (= res!203676 (validKeyInArray!0 k0!2974))))

(declare-fun b!364469 () Bool)

(declare-fun e!223106 () Bool)

(assert (=> b!364469 (= e!223104 e!223106)))

(declare-fun res!203674 () Bool)

(assert (=> b!364469 (=> (not res!203674) (not e!223106))))

(declare-fun lt!168549 () (_ BitVec 32))

(declare-fun lt!168550 () (_ BitVec 32))

(assert (=> b!364469 (= res!203674 (and (= lt!168549 (bvadd #b00000000000000000000000000000001 lt!168550)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168548 () array!20717)

(declare-fun arrayCountValidKeys!0 (array!20717 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364469 (= lt!168549 (arrayCountValidKeys!0 lt!168548 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364469 (= lt!168550 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364469 (= lt!168548 (array!20718 (store (arr!9837 a!4289) i!1472 k0!2974) (size!10189 a!4289)))))

(declare-fun b!364470 () Bool)

(assert (=> b!364470 (= e!223106 (not true))))

(assert (=> b!364470 (= (bvadd (arrayCountValidKeys!0 lt!168548 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168549) (arrayCountValidKeys!0 lt!168548 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11317 0))(
  ( (Unit!11318) )
))
(declare-fun lt!168547 () Unit!11317)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11317)

(assert (=> b!364470 (= lt!168547 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168548 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364470 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168550) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168551 () Unit!11317)

(assert (=> b!364470 (= lt!168551 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36442 res!203673) b!364467))

(assert (= (and b!364467 res!203677) b!364468))

(assert (= (and b!364468 res!203676) b!364466))

(assert (= (and b!364466 res!203675) b!364469))

(assert (= (and b!364469 res!203674) b!364470))

(declare-fun m!362263 () Bool)

(assert (=> start!36442 m!362263))

(declare-fun m!362265 () Bool)

(assert (=> b!364467 m!362265))

(assert (=> b!364467 m!362265))

(declare-fun m!362267 () Bool)

(assert (=> b!364467 m!362267))

(declare-fun m!362269 () Bool)

(assert (=> b!364469 m!362269))

(declare-fun m!362271 () Bool)

(assert (=> b!364469 m!362271))

(declare-fun m!362273 () Bool)

(assert (=> b!364469 m!362273))

(declare-fun m!362275 () Bool)

(assert (=> b!364470 m!362275))

(declare-fun m!362277 () Bool)

(assert (=> b!364470 m!362277))

(declare-fun m!362279 () Bool)

(assert (=> b!364470 m!362279))

(declare-fun m!362281 () Bool)

(assert (=> b!364470 m!362281))

(declare-fun m!362283 () Bool)

(assert (=> b!364470 m!362283))

(declare-fun m!362285 () Bool)

(assert (=> b!364470 m!362285))

(declare-fun m!362287 () Bool)

(assert (=> b!364468 m!362287))

(check-sat (not b!364468) (not start!36442) (not b!364470) (not b!364469) (not b!364467))
(check-sat)
