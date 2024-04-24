; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36448 () Bool)

(assert start!36448)

(declare-fun b!364511 () Bool)

(declare-fun res!203718 () Bool)

(declare-fun e!223133 () Bool)

(assert (=> b!364511 (=> (not res!203718) (not e!223133))))

(declare-datatypes ((array!20723 0))(
  ( (array!20724 (arr!9840 (Array (_ BitVec 32) (_ BitVec 64))) (size!10192 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20723)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364511 (= res!203718 (not (validKeyInArray!0 (select (arr!9840 a!4289) i!1472))))))

(declare-fun res!203721 () Bool)

(assert (=> start!36448 (=> (not res!203721) (not e!223133))))

(assert (=> start!36448 (= res!203721 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10192 a!4289))))))

(assert (=> start!36448 e!223133))

(assert (=> start!36448 true))

(declare-fun array_inv!7312 (array!20723) Bool)

(assert (=> start!36448 (array_inv!7312 a!4289)))

(declare-fun b!364512 () Bool)

(declare-fun e!223132 () Bool)

(assert (=> b!364512 (= e!223133 e!223132)))

(declare-fun res!203719 () Bool)

(assert (=> b!364512 (=> (not res!203719) (not e!223132))))

(declare-fun lt!168596 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168595 () (_ BitVec 32))

(assert (=> b!364512 (= res!203719 (and (= lt!168595 (bvadd #b00000000000000000000000000000001 lt!168596)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168593 () array!20723)

(declare-fun arrayCountValidKeys!0 (array!20723 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364512 (= lt!168595 (arrayCountValidKeys!0 lt!168593 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364512 (= lt!168596 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364512 (= lt!168593 (array!20724 (store (arr!9840 a!4289) i!1472 k0!2974) (size!10192 a!4289)))))

(declare-fun b!364513 () Bool)

(declare-fun res!203722 () Bool)

(assert (=> b!364513 (=> (not res!203722) (not e!223133))))

(assert (=> b!364513 (= res!203722 (validKeyInArray!0 k0!2974))))

(declare-fun b!364514 () Bool)

(assert (=> b!364514 (= e!223132 (not true))))

(assert (=> b!364514 (= (bvadd (arrayCountValidKeys!0 lt!168593 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168595) (arrayCountValidKeys!0 lt!168593 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11323 0))(
  ( (Unit!11324) )
))
(declare-fun lt!168592 () Unit!11323)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11323)

(assert (=> b!364514 (= lt!168592 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168593 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364514 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168596) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168594 () Unit!11323)

(assert (=> b!364514 (= lt!168594 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364515 () Bool)

(declare-fun res!203720 () Bool)

(assert (=> b!364515 (=> (not res!203720) (not e!223133))))

(assert (=> b!364515 (= res!203720 (and (bvslt (size!10192 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10192 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36448 res!203721) b!364511))

(assert (= (and b!364511 res!203718) b!364513))

(assert (= (and b!364513 res!203722) b!364515))

(assert (= (and b!364515 res!203720) b!364512))

(assert (= (and b!364512 res!203719) b!364514))

(declare-fun m!362341 () Bool)

(assert (=> b!364513 m!362341))

(declare-fun m!362343 () Bool)

(assert (=> b!364511 m!362343))

(assert (=> b!364511 m!362343))

(declare-fun m!362345 () Bool)

(assert (=> b!364511 m!362345))

(declare-fun m!362347 () Bool)

(assert (=> b!364512 m!362347))

(declare-fun m!362349 () Bool)

(assert (=> b!364512 m!362349))

(declare-fun m!362351 () Bool)

(assert (=> b!364512 m!362351))

(declare-fun m!362353 () Bool)

(assert (=> b!364514 m!362353))

(declare-fun m!362355 () Bool)

(assert (=> b!364514 m!362355))

(declare-fun m!362357 () Bool)

(assert (=> b!364514 m!362357))

(declare-fun m!362359 () Bool)

(assert (=> b!364514 m!362359))

(declare-fun m!362361 () Bool)

(assert (=> b!364514 m!362361))

(declare-fun m!362363 () Bool)

(assert (=> b!364514 m!362363))

(declare-fun m!362365 () Bool)

(assert (=> start!36448 m!362365))

(check-sat (not b!364514) (not b!364512) (not b!364513) (not b!364511) (not start!36448))
(check-sat)
