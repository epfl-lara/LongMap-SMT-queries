; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116544 () Bool)

(assert start!116544)

(declare-fun b!1374516 () Bool)

(declare-fun e!778675 () Bool)

(declare-fun e!778674 () Bool)

(assert (=> b!1374516 (= e!778675 (not e!778674))))

(declare-fun res!917704 () Bool)

(assert (=> b!1374516 (=> res!917704 e!778674)))

(declare-datatypes ((array!93244 0))(
  ( (array!93245 (arr!45028 (Array (_ BitVec 32) (_ BitVec 64))) (size!45578 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93244)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374516 (= res!917704 (or (bvslt (size!45578 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603694 () (_ BitVec 32))

(declare-fun lt!603698 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93244 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374516 (= (bvadd lt!603694 lt!603698) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45578 a!4142)))))

(declare-datatypes ((Unit!45457 0))(
  ( (Unit!45458) )
))
(declare-fun lt!603697 () Unit!45457)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45457)

(assert (=> b!1374516 (= lt!603697 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45578 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603693 () (_ BitVec 32))

(assert (=> b!1374516 (= lt!603693 lt!603698)))

(assert (=> b!1374516 (= lt!603698 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45578 a!4142)))))

(declare-fun lt!603699 () array!93244)

(assert (=> b!1374516 (= lt!603693 (arrayCountValidKeys!0 lt!603699 (bvadd #b00000000000000000000000000000001 i!1457) (size!45578 a!4142)))))

(declare-fun lt!603692 () Unit!45457)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45457)

(assert (=> b!1374516 (= lt!603692 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603696 () (_ BitVec 32))

(assert (=> b!1374516 (= lt!603696 (bvsub lt!603694 #b00000000000000000000000000000001))))

(assert (=> b!1374516 (= lt!603696 (arrayCountValidKeys!0 lt!603699 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374516 (= lt!603694 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374516 (= lt!603699 (array!93245 (store (arr!45028 a!4142) i!1457 k!2959) (size!45578 a!4142)))))

(declare-fun lt!603700 () Unit!45457)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45457)

(assert (=> b!1374516 (= lt!603700 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374517 () Bool)

(declare-fun res!917702 () Bool)

(assert (=> b!1374517 (=> (not res!917702) (not e!778675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374517 (= res!917702 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374518 () Bool)

(declare-fun res!917700 () Bool)

(assert (=> b!1374518 (=> (not res!917700) (not e!778675))))

(assert (=> b!1374518 (= res!917700 (bvslt (size!45578 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374519 () Bool)

(declare-fun res!917701 () Bool)

(assert (=> b!1374519 (=> (not res!917701) (not e!778675))))

(assert (=> b!1374519 (= res!917701 (validKeyInArray!0 (select (arr!45028 a!4142) i!1457)))))

(declare-fun b!1374520 () Bool)

(assert (=> b!1374520 (= e!778674 true)))

(assert (=> b!1374520 (= (bvadd lt!603696 lt!603693) (arrayCountValidKeys!0 lt!603699 #b00000000000000000000000000000000 (size!45578 a!4142)))))

(declare-fun lt!603695 () Unit!45457)

(assert (=> b!1374520 (= lt!603695 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603699 #b00000000000000000000000000000000 (size!45578 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917703 () Bool)

(assert (=> start!116544 (=> (not res!917703) (not e!778675))))

(assert (=> start!116544 (= res!917703 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45578 a!4142))))))

(assert (=> start!116544 e!778675))

(assert (=> start!116544 true))

(declare-fun array_inv!34056 (array!93244) Bool)

(assert (=> start!116544 (array_inv!34056 a!4142)))

(assert (= (and start!116544 res!917703) b!1374519))

(assert (= (and b!1374519 res!917701) b!1374517))

(assert (= (and b!1374517 res!917702) b!1374518))

(assert (= (and b!1374518 res!917700) b!1374516))

(assert (= (and b!1374516 (not res!917704)) b!1374520))

(declare-fun m!1257967 () Bool)

(assert (=> b!1374517 m!1257967))

(declare-fun m!1257969 () Bool)

(assert (=> start!116544 m!1257969))

(declare-fun m!1257971 () Bool)

(assert (=> b!1374520 m!1257971))

(declare-fun m!1257973 () Bool)

(assert (=> b!1374520 m!1257973))

(declare-fun m!1257975 () Bool)

(assert (=> b!1374519 m!1257975))

(assert (=> b!1374519 m!1257975))

(declare-fun m!1257977 () Bool)

(assert (=> b!1374519 m!1257977))

(declare-fun m!1257979 () Bool)

(assert (=> b!1374516 m!1257979))

(declare-fun m!1257981 () Bool)

(assert (=> b!1374516 m!1257981))

(declare-fun m!1257983 () Bool)

(assert (=> b!1374516 m!1257983))

(declare-fun m!1257985 () Bool)

(assert (=> b!1374516 m!1257985))

(declare-fun m!1257987 () Bool)

(assert (=> b!1374516 m!1257987))

(declare-fun m!1257989 () Bool)

(assert (=> b!1374516 m!1257989))

(declare-fun m!1257991 () Bool)

(assert (=> b!1374516 m!1257991))

(declare-fun m!1257993 () Bool)

(assert (=> b!1374516 m!1257993))

(declare-fun m!1257995 () Bool)

(assert (=> b!1374516 m!1257995))

(push 1)

(assert (not b!1374517))

(assert (not b!1374516))

(assert (not start!116544))

(assert (not b!1374519))

(assert (not b!1374520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

