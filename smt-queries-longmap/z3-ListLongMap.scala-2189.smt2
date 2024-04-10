; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36470 () Bool)

(assert start!36470)

(declare-fun b!364620 () Bool)

(declare-fun res!203784 () Bool)

(declare-fun e!223200 () Bool)

(assert (=> b!364620 (=> (not res!203784) (not e!223200))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20750 0))(
  ( (array!20751 (arr!9854 (Array (_ BitVec 32) (_ BitVec 64))) (size!10206 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20750)

(assert (=> b!364620 (= res!203784 (and (bvslt (size!10206 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10206 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364621 () Bool)

(declare-fun res!203783 () Bool)

(assert (=> b!364621 (=> (not res!203783) (not e!223200))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364621 (= res!203783 (validKeyInArray!0 k0!2974))))

(declare-fun b!364622 () Bool)

(declare-fun e!223201 () Bool)

(assert (=> b!364622 (= e!223200 e!223201)))

(declare-fun res!203782 () Bool)

(assert (=> b!364622 (=> (not res!203782) (not e!223201))))

(declare-fun lt!168636 () (_ BitVec 32))

(declare-fun lt!168635 () (_ BitVec 32))

(assert (=> b!364622 (= res!203782 (and (= lt!168636 (bvadd #b00000000000000000000000000000001 lt!168635)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168634 () array!20750)

(declare-fun arrayCountValidKeys!0 (array!20750 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364622 (= lt!168636 (arrayCountValidKeys!0 lt!168634 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364622 (= lt!168635 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364622 (= lt!168634 (array!20751 (store (arr!9854 a!4289) i!1472 k0!2974) (size!10206 a!4289)))))

(declare-fun b!364623 () Bool)

(declare-fun res!203781 () Bool)

(assert (=> b!364623 (=> (not res!203781) (not e!223200))))

(assert (=> b!364623 (= res!203781 (not (validKeyInArray!0 (select (arr!9854 a!4289) i!1472))))))

(declare-fun res!203785 () Bool)

(assert (=> start!36470 (=> (not res!203785) (not e!223200))))

(assert (=> start!36470 (= res!203785 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10206 a!4289))))))

(assert (=> start!36470 e!223200))

(assert (=> start!36470 true))

(declare-fun array_inv!7296 (array!20750) Bool)

(assert (=> start!36470 (array_inv!7296 a!4289)))

(declare-fun b!364624 () Bool)

(assert (=> b!364624 (= e!223201 (not true))))

(assert (=> b!364624 (= (bvadd (arrayCountValidKeys!0 lt!168634 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168636) (arrayCountValidKeys!0 lt!168634 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11342 0))(
  ( (Unit!11343) )
))
(declare-fun lt!168633 () Unit!11342)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11342)

(assert (=> b!364624 (= lt!168633 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168634 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364624 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168635) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168637 () Unit!11342)

(assert (=> b!364624 (= lt!168637 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36470 res!203785) b!364623))

(assert (= (and b!364623 res!203781) b!364621))

(assert (= (and b!364621 res!203783) b!364620))

(assert (= (and b!364620 res!203784) b!364622))

(assert (= (and b!364622 res!203782) b!364624))

(declare-fun m!362215 () Bool)

(assert (=> b!364621 m!362215))

(declare-fun m!362217 () Bool)

(assert (=> start!36470 m!362217))

(declare-fun m!362219 () Bool)

(assert (=> b!364622 m!362219))

(declare-fun m!362221 () Bool)

(assert (=> b!364622 m!362221))

(declare-fun m!362223 () Bool)

(assert (=> b!364622 m!362223))

(declare-fun m!362225 () Bool)

(assert (=> b!364624 m!362225))

(declare-fun m!362227 () Bool)

(assert (=> b!364624 m!362227))

(declare-fun m!362229 () Bool)

(assert (=> b!364624 m!362229))

(declare-fun m!362231 () Bool)

(assert (=> b!364624 m!362231))

(declare-fun m!362233 () Bool)

(assert (=> b!364624 m!362233))

(declare-fun m!362235 () Bool)

(assert (=> b!364624 m!362235))

(declare-fun m!362237 () Bool)

(assert (=> b!364623 m!362237))

(assert (=> b!364623 m!362237))

(declare-fun m!362239 () Bool)

(assert (=> b!364623 m!362239))

(check-sat (not start!36470) (not b!364621) (not b!364623) (not b!364622) (not b!364624))
(check-sat)
