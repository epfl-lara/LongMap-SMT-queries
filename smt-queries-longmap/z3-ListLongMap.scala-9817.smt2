; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116554 () Bool)

(assert start!116554)

(declare-fun res!917777 () Bool)

(declare-fun e!778719 () Bool)

(assert (=> start!116554 (=> (not res!917777) (not e!778719))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93254 0))(
  ( (array!93255 (arr!45033 (Array (_ BitVec 32) (_ BitVec 64))) (size!45583 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93254)

(assert (=> start!116554 (= res!917777 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45583 a!4142))))))

(assert (=> start!116554 e!778719))

(assert (=> start!116554 true))

(declare-fun array_inv!34061 (array!93254) Bool)

(assert (=> start!116554 (array_inv!34061 a!4142)))

(declare-fun b!1374591 () Bool)

(declare-fun res!917776 () Bool)

(assert (=> b!1374591 (=> (not res!917776) (not e!778719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374591 (= res!917776 (validKeyInArray!0 (select (arr!45033 a!4142) i!1457)))))

(declare-fun b!1374592 () Bool)

(declare-fun e!778718 () Bool)

(assert (=> b!1374592 (= e!778719 (not e!778718))))

(declare-fun res!917775 () Bool)

(assert (=> b!1374592 (=> res!917775 e!778718)))

(assert (=> b!1374592 (= res!917775 (or (bvslt (size!45583 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603834 () (_ BitVec 32))

(declare-fun lt!603832 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93254 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374592 (= (bvadd lt!603834 lt!603832) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45583 a!4142)))))

(declare-datatypes ((Unit!45467 0))(
  ( (Unit!45468) )
))
(declare-fun lt!603833 () Unit!45467)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45467)

(assert (=> b!1374592 (= lt!603833 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45583 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603831 () (_ BitVec 32))

(assert (=> b!1374592 (= lt!603831 lt!603832)))

(assert (=> b!1374592 (= lt!603832 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45583 a!4142)))))

(declare-fun lt!603827 () array!93254)

(assert (=> b!1374592 (= lt!603831 (arrayCountValidKeys!0 lt!603827 (bvadd #b00000000000000000000000000000001 i!1457) (size!45583 a!4142)))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lt!603828 () Unit!45467)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93254 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45467)

(assert (=> b!1374592 (= lt!603828 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603830 () (_ BitVec 32))

(assert (=> b!1374592 (= lt!603830 (bvsub lt!603834 #b00000000000000000000000000000001))))

(assert (=> b!1374592 (= lt!603830 (arrayCountValidKeys!0 lt!603827 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374592 (= lt!603834 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374592 (= lt!603827 (array!93255 (store (arr!45033 a!4142) i!1457 k0!2959) (size!45583 a!4142)))))

(declare-fun lt!603829 () Unit!45467)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93254 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45467)

(assert (=> b!1374592 (= lt!603829 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374593 () Bool)

(declare-fun res!917779 () Bool)

(assert (=> b!1374593 (=> (not res!917779) (not e!778719))))

(assert (=> b!1374593 (= res!917779 (bvslt (size!45583 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374594 () Bool)

(assert (=> b!1374594 (= e!778718 true)))

(assert (=> b!1374594 (= (bvadd lt!603830 lt!603831) (arrayCountValidKeys!0 lt!603827 #b00000000000000000000000000000000 (size!45583 a!4142)))))

(declare-fun lt!603835 () Unit!45467)

(assert (=> b!1374594 (= lt!603835 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603827 #b00000000000000000000000000000000 (size!45583 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374595 () Bool)

(declare-fun res!917778 () Bool)

(assert (=> b!1374595 (=> (not res!917778) (not e!778719))))

(assert (=> b!1374595 (= res!917778 (not (validKeyInArray!0 k0!2959)))))

(assert (= (and start!116554 res!917777) b!1374591))

(assert (= (and b!1374591 res!917776) b!1374595))

(assert (= (and b!1374595 res!917778) b!1374593))

(assert (= (and b!1374593 res!917779) b!1374592))

(assert (= (and b!1374592 (not res!917775)) b!1374594))

(declare-fun m!1258117 () Bool)

(assert (=> b!1374595 m!1258117))

(declare-fun m!1258119 () Bool)

(assert (=> start!116554 m!1258119))

(declare-fun m!1258121 () Bool)

(assert (=> b!1374592 m!1258121))

(declare-fun m!1258123 () Bool)

(assert (=> b!1374592 m!1258123))

(declare-fun m!1258125 () Bool)

(assert (=> b!1374592 m!1258125))

(declare-fun m!1258127 () Bool)

(assert (=> b!1374592 m!1258127))

(declare-fun m!1258129 () Bool)

(assert (=> b!1374592 m!1258129))

(declare-fun m!1258131 () Bool)

(assert (=> b!1374592 m!1258131))

(declare-fun m!1258133 () Bool)

(assert (=> b!1374592 m!1258133))

(declare-fun m!1258135 () Bool)

(assert (=> b!1374592 m!1258135))

(declare-fun m!1258137 () Bool)

(assert (=> b!1374592 m!1258137))

(declare-fun m!1258139 () Bool)

(assert (=> b!1374591 m!1258139))

(assert (=> b!1374591 m!1258139))

(declare-fun m!1258141 () Bool)

(assert (=> b!1374591 m!1258141))

(declare-fun m!1258143 () Bool)

(assert (=> b!1374594 m!1258143))

(declare-fun m!1258145 () Bool)

(assert (=> b!1374594 m!1258145))

(check-sat (not b!1374595) (not b!1374591) (not b!1374592) (not start!116554) (not b!1374594))
