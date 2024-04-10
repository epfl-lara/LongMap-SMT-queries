; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116530 () Bool)

(assert start!116530)

(declare-fun b!1374418 () Bool)

(declare-fun e!778615 () Bool)

(assert (=> b!1374418 (= e!778615 (not true))))

(declare-fun lt!603512 () (_ BitVec 32))

(declare-fun lt!603513 () (_ BitVec 32))

(declare-datatypes ((array!93230 0))(
  ( (array!93231 (arr!45021 (Array (_ BitVec 32) (_ BitVec 64))) (size!45571 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93230)

(declare-fun arrayCountValidKeys!0 (array!93230 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374418 (= (bvadd lt!603512 lt!603513) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45571 a!4142)))))

(declare-datatypes ((Unit!45443 0))(
  ( (Unit!45444) )
))
(declare-fun lt!603514 () Unit!45443)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45443)

(assert (=> b!1374418 (= lt!603514 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45571 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603515 () (_ BitVec 32))

(assert (=> b!1374418 (= lt!603515 lt!603513)))

(assert (=> b!1374418 (= lt!603513 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45571 a!4142)))))

(declare-fun lt!603511 () array!93230)

(assert (=> b!1374418 (= lt!603515 (arrayCountValidKeys!0 lt!603511 (bvadd #b00000000000000000000000000000001 i!1457) (size!45571 a!4142)))))

(declare-fun lt!603516 () Unit!45443)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93230 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45443)

(assert (=> b!1374418 (= lt!603516 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374418 (= (arrayCountValidKeys!0 lt!603511 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!603512 #b00000000000000000000000000000001))))

(assert (=> b!1374418 (= lt!603512 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374418 (= lt!603511 (array!93231 (store (arr!45021 a!4142) i!1457 k0!2959) (size!45571 a!4142)))))

(declare-fun lt!603517 () Unit!45443)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93230 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45443)

(assert (=> b!1374418 (= lt!603517 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun res!917600 () Bool)

(assert (=> start!116530 (=> (not res!917600) (not e!778615))))

(assert (=> start!116530 (= res!917600 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45571 a!4142))))))

(assert (=> start!116530 e!778615))

(assert (=> start!116530 true))

(declare-fun array_inv!34049 (array!93230) Bool)

(assert (=> start!116530 (array_inv!34049 a!4142)))

(declare-fun b!1374416 () Bool)

(declare-fun res!917601 () Bool)

(assert (=> b!1374416 (=> (not res!917601) (not e!778615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374416 (= res!917601 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374415 () Bool)

(declare-fun res!917602 () Bool)

(assert (=> b!1374415 (=> (not res!917602) (not e!778615))))

(assert (=> b!1374415 (= res!917602 (validKeyInArray!0 (select (arr!45021 a!4142) i!1457)))))

(declare-fun b!1374417 () Bool)

(declare-fun res!917599 () Bool)

(assert (=> b!1374417 (=> (not res!917599) (not e!778615))))

(assert (=> b!1374417 (= res!917599 (bvslt (size!45571 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116530 res!917600) b!1374415))

(assert (= (and b!1374415 res!917602) b!1374416))

(assert (= (and b!1374416 res!917601) b!1374417))

(assert (= (and b!1374417 res!917599) b!1374418))

(declare-fun m!1257765 () Bool)

(assert (=> b!1374418 m!1257765))

(declare-fun m!1257767 () Bool)

(assert (=> b!1374418 m!1257767))

(declare-fun m!1257769 () Bool)

(assert (=> b!1374418 m!1257769))

(declare-fun m!1257771 () Bool)

(assert (=> b!1374418 m!1257771))

(declare-fun m!1257773 () Bool)

(assert (=> b!1374418 m!1257773))

(declare-fun m!1257775 () Bool)

(assert (=> b!1374418 m!1257775))

(declare-fun m!1257777 () Bool)

(assert (=> b!1374418 m!1257777))

(declare-fun m!1257779 () Bool)

(assert (=> b!1374418 m!1257779))

(declare-fun m!1257781 () Bool)

(assert (=> b!1374418 m!1257781))

(declare-fun m!1257783 () Bool)

(assert (=> start!116530 m!1257783))

(declare-fun m!1257785 () Bool)

(assert (=> b!1374416 m!1257785))

(declare-fun m!1257787 () Bool)

(assert (=> b!1374415 m!1257787))

(assert (=> b!1374415 m!1257787))

(declare-fun m!1257789 () Bool)

(assert (=> b!1374415 m!1257789))

(check-sat (not start!116530) (not b!1374415) (not b!1374416) (not b!1374418))
