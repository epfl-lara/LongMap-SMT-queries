; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116536 () Bool)

(assert start!116536)

(declare-fun b!1374456 () Bool)

(declare-fun res!917644 () Bool)

(declare-fun e!778637 () Bool)

(assert (=> b!1374456 (=> (not res!917644) (not e!778637))))

(declare-datatypes ((array!93236 0))(
  ( (array!93237 (arr!45024 (Array (_ BitVec 32) (_ BitVec 64))) (size!45574 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93236)

(assert (=> b!1374456 (= res!917644 (bvslt (size!45574 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374457 () Bool)

(declare-fun e!778638 () Bool)

(assert (=> b!1374457 (= e!778637 (not e!778638))))

(declare-fun res!917640 () Bool)

(assert (=> b!1374457 (=> res!917640 e!778638)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374457 (= res!917640 (or (bvslt (size!45574 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603590 () (_ BitVec 32))

(declare-fun lt!603587 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93236 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374457 (= (bvadd lt!603590 lt!603587) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45574 a!4142)))))

(declare-datatypes ((Unit!45449 0))(
  ( (Unit!45450) )
))
(declare-fun lt!603588 () Unit!45449)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45449)

(assert (=> b!1374457 (= lt!603588 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45574 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603592 () (_ BitVec 32))

(assert (=> b!1374457 (= lt!603592 lt!603587)))

(assert (=> b!1374457 (= lt!603587 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45574 a!4142)))))

(declare-fun lt!603584 () array!93236)

(assert (=> b!1374457 (= lt!603592 (arrayCountValidKeys!0 lt!603584 (bvadd #b00000000000000000000000000000001 i!1457) (size!45574 a!4142)))))

(declare-fun lt!603585 () Unit!45449)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45449)

(assert (=> b!1374457 (= lt!603585 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603591 () (_ BitVec 32))

(assert (=> b!1374457 (= lt!603591 (bvsub lt!603590 #b00000000000000000000000000000001))))

(assert (=> b!1374457 (= lt!603591 (arrayCountValidKeys!0 lt!603584 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374457 (= lt!603590 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374457 (= lt!603584 (array!93237 (store (arr!45024 a!4142) i!1457 k0!2959) (size!45574 a!4142)))))

(declare-fun lt!603586 () Unit!45449)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45449)

(assert (=> b!1374457 (= lt!603586 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374458 () Bool)

(assert (=> b!1374458 (= e!778638 true)))

(assert (=> b!1374458 (= (bvadd lt!603591 lt!603592) (arrayCountValidKeys!0 lt!603584 #b00000000000000000000000000000000 (size!45574 a!4142)))))

(declare-fun lt!603589 () Unit!45449)

(assert (=> b!1374458 (= lt!603589 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603584 #b00000000000000000000000000000000 (size!45574 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374459 () Bool)

(declare-fun res!917642 () Bool)

(assert (=> b!1374459 (=> (not res!917642) (not e!778637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374459 (= res!917642 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!917641 () Bool)

(assert (=> start!116536 (=> (not res!917641) (not e!778637))))

(assert (=> start!116536 (= res!917641 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45574 a!4142))))))

(assert (=> start!116536 e!778637))

(assert (=> start!116536 true))

(declare-fun array_inv!34052 (array!93236) Bool)

(assert (=> start!116536 (array_inv!34052 a!4142)))

(declare-fun b!1374460 () Bool)

(declare-fun res!917643 () Bool)

(assert (=> b!1374460 (=> (not res!917643) (not e!778637))))

(assert (=> b!1374460 (= res!917643 (validKeyInArray!0 (select (arr!45024 a!4142) i!1457)))))

(assert (= (and start!116536 res!917641) b!1374460))

(assert (= (and b!1374460 res!917643) b!1374459))

(assert (= (and b!1374459 res!917642) b!1374456))

(assert (= (and b!1374456 res!917644) b!1374457))

(assert (= (and b!1374457 (not res!917640)) b!1374458))

(declare-fun m!1257847 () Bool)

(assert (=> start!116536 m!1257847))

(declare-fun m!1257849 () Bool)

(assert (=> b!1374459 m!1257849))

(declare-fun m!1257851 () Bool)

(assert (=> b!1374458 m!1257851))

(declare-fun m!1257853 () Bool)

(assert (=> b!1374458 m!1257853))

(declare-fun m!1257855 () Bool)

(assert (=> b!1374457 m!1257855))

(declare-fun m!1257857 () Bool)

(assert (=> b!1374457 m!1257857))

(declare-fun m!1257859 () Bool)

(assert (=> b!1374457 m!1257859))

(declare-fun m!1257861 () Bool)

(assert (=> b!1374457 m!1257861))

(declare-fun m!1257863 () Bool)

(assert (=> b!1374457 m!1257863))

(declare-fun m!1257865 () Bool)

(assert (=> b!1374457 m!1257865))

(declare-fun m!1257867 () Bool)

(assert (=> b!1374457 m!1257867))

(declare-fun m!1257869 () Bool)

(assert (=> b!1374457 m!1257869))

(declare-fun m!1257871 () Bool)

(assert (=> b!1374457 m!1257871))

(declare-fun m!1257873 () Bool)

(assert (=> b!1374460 m!1257873))

(assert (=> b!1374460 m!1257873))

(declare-fun m!1257875 () Bool)

(assert (=> b!1374460 m!1257875))

(check-sat (not start!116536) (not b!1374459) (not b!1374460) (not b!1374458) (not b!1374457))
