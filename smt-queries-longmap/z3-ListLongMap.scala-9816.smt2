; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116548 () Bool)

(assert start!116548)

(declare-fun b!1374546 () Bool)

(declare-fun res!917733 () Bool)

(declare-fun e!778693 () Bool)

(assert (=> b!1374546 (=> (not res!917733) (not e!778693))))

(declare-datatypes ((array!93248 0))(
  ( (array!93249 (arr!45030 (Array (_ BitVec 32) (_ BitVec 64))) (size!45580 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93248)

(assert (=> b!1374546 (= res!917733 (bvslt (size!45580 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374547 () Bool)

(declare-fun e!778692 () Bool)

(assert (=> b!1374547 (= e!778692 true)))

(declare-fun lt!603751 () (_ BitVec 32))

(declare-fun lt!603752 () (_ BitVec 32))

(declare-fun lt!603746 () array!93248)

(declare-fun arrayCountValidKeys!0 (array!93248 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374547 (= (bvadd lt!603752 lt!603751) (arrayCountValidKeys!0 lt!603746 #b00000000000000000000000000000000 (size!45580 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45461 0))(
  ( (Unit!45462) )
))
(declare-fun lt!603748 () Unit!45461)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45461)

(assert (=> b!1374547 (= lt!603748 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603746 #b00000000000000000000000000000000 (size!45580 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917731 () Bool)

(assert (=> start!116548 (=> (not res!917731) (not e!778693))))

(assert (=> start!116548 (= res!917731 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45580 a!4142))))))

(assert (=> start!116548 e!778693))

(assert (=> start!116548 true))

(declare-fun array_inv!34058 (array!93248) Bool)

(assert (=> start!116548 (array_inv!34058 a!4142)))

(declare-fun b!1374548 () Bool)

(assert (=> b!1374548 (= e!778693 (not e!778692))))

(declare-fun res!917734 () Bool)

(assert (=> b!1374548 (=> res!917734 e!778692)))

(assert (=> b!1374548 (= res!917734 (or (bvslt (size!45580 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603753 () (_ BitVec 32))

(declare-fun lt!603747 () (_ BitVec 32))

(assert (=> b!1374548 (= (bvadd lt!603753 lt!603747) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45580 a!4142)))))

(declare-fun lt!603754 () Unit!45461)

(assert (=> b!1374548 (= lt!603754 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45580 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374548 (= lt!603751 lt!603747)))

(assert (=> b!1374548 (= lt!603747 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45580 a!4142)))))

(assert (=> b!1374548 (= lt!603751 (arrayCountValidKeys!0 lt!603746 (bvadd #b00000000000000000000000000000001 i!1457) (size!45580 a!4142)))))

(declare-fun lt!603750 () Unit!45461)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45461)

(assert (=> b!1374548 (= lt!603750 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374548 (= lt!603752 (bvsub lt!603753 #b00000000000000000000000000000001))))

(assert (=> b!1374548 (= lt!603752 (arrayCountValidKeys!0 lt!603746 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374548 (= lt!603753 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374548 (= lt!603746 (array!93249 (store (arr!45030 a!4142) i!1457 k0!2959) (size!45580 a!4142)))))

(declare-fun lt!603749 () Unit!45461)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45461)

(assert (=> b!1374548 (= lt!603749 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374549 () Bool)

(declare-fun res!917730 () Bool)

(assert (=> b!1374549 (=> (not res!917730) (not e!778693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374549 (= res!917730 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374550 () Bool)

(declare-fun res!917732 () Bool)

(assert (=> b!1374550 (=> (not res!917732) (not e!778693))))

(assert (=> b!1374550 (= res!917732 (validKeyInArray!0 (select (arr!45030 a!4142) i!1457)))))

(assert (= (and start!116548 res!917731) b!1374550))

(assert (= (and b!1374550 res!917732) b!1374549))

(assert (= (and b!1374549 res!917730) b!1374546))

(assert (= (and b!1374546 res!917733) b!1374548))

(assert (= (and b!1374548 (not res!917734)) b!1374547))

(declare-fun m!1258027 () Bool)

(assert (=> b!1374548 m!1258027))

(declare-fun m!1258029 () Bool)

(assert (=> b!1374548 m!1258029))

(declare-fun m!1258031 () Bool)

(assert (=> b!1374548 m!1258031))

(declare-fun m!1258033 () Bool)

(assert (=> b!1374548 m!1258033))

(declare-fun m!1258035 () Bool)

(assert (=> b!1374548 m!1258035))

(declare-fun m!1258037 () Bool)

(assert (=> b!1374548 m!1258037))

(declare-fun m!1258039 () Bool)

(assert (=> b!1374548 m!1258039))

(declare-fun m!1258041 () Bool)

(assert (=> b!1374548 m!1258041))

(declare-fun m!1258043 () Bool)

(assert (=> b!1374548 m!1258043))

(declare-fun m!1258045 () Bool)

(assert (=> b!1374549 m!1258045))

(declare-fun m!1258047 () Bool)

(assert (=> b!1374550 m!1258047))

(assert (=> b!1374550 m!1258047))

(declare-fun m!1258049 () Bool)

(assert (=> b!1374550 m!1258049))

(declare-fun m!1258051 () Bool)

(assert (=> b!1374547 m!1258051))

(declare-fun m!1258053 () Bool)

(assert (=> b!1374547 m!1258053))

(declare-fun m!1258055 () Bool)

(assert (=> start!116548 m!1258055))

(check-sat (not start!116548) (not b!1374548) (not b!1374547) (not b!1374550) (not b!1374549))
