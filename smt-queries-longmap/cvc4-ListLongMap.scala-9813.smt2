; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116532 () Bool)

(assert start!116532)

(declare-fun res!917613 () Bool)

(declare-fun e!778621 () Bool)

(assert (=> start!116532 (=> (not res!917613) (not e!778621))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93232 0))(
  ( (array!93233 (arr!45022 (Array (_ BitVec 32) (_ BitVec 64))) (size!45572 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93232)

(assert (=> start!116532 (= res!917613 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45572 a!4142))))))

(assert (=> start!116532 e!778621))

(assert (=> start!116532 true))

(declare-fun array_inv!34050 (array!93232) Bool)

(assert (=> start!116532 (array_inv!34050 a!4142)))

(declare-fun b!1374428 () Bool)

(declare-fun res!917614 () Bool)

(assert (=> b!1374428 (=> (not res!917614) (not e!778621))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374428 (= res!917614 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374430 () Bool)

(assert (=> b!1374430 (= e!778621 (not true))))

(declare-fun lt!603537 () (_ BitVec 32))

(declare-fun lt!603533 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93232 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374430 (= (bvadd lt!603537 lt!603533) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45572 a!4142)))))

(declare-datatypes ((Unit!45445 0))(
  ( (Unit!45446) )
))
(declare-fun lt!603532 () Unit!45445)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45445)

(assert (=> b!1374430 (= lt!603532 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45572 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603535 () (_ BitVec 32))

(assert (=> b!1374430 (= lt!603535 lt!603533)))

(assert (=> b!1374430 (= lt!603533 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45572 a!4142)))))

(declare-fun lt!603538 () array!93232)

(assert (=> b!1374430 (= lt!603535 (arrayCountValidKeys!0 lt!603538 (bvadd #b00000000000000000000000000000001 i!1457) (size!45572 a!4142)))))

(declare-fun lt!603536 () Unit!45445)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45445)

(assert (=> b!1374430 (= lt!603536 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374430 (= (arrayCountValidKeys!0 lt!603538 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!603537 #b00000000000000000000000000000001))))

(assert (=> b!1374430 (= lt!603537 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374430 (= lt!603538 (array!93233 (store (arr!45022 a!4142) i!1457 k!2959) (size!45572 a!4142)))))

(declare-fun lt!603534 () Unit!45445)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45445)

(assert (=> b!1374430 (= lt!603534 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374429 () Bool)

(declare-fun res!917611 () Bool)

(assert (=> b!1374429 (=> (not res!917611) (not e!778621))))

(assert (=> b!1374429 (= res!917611 (bvslt (size!45572 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374427 () Bool)

(declare-fun res!917612 () Bool)

(assert (=> b!1374427 (=> (not res!917612) (not e!778621))))

(assert (=> b!1374427 (= res!917612 (validKeyInArray!0 (select (arr!45022 a!4142) i!1457)))))

(assert (= (and start!116532 res!917613) b!1374427))

(assert (= (and b!1374427 res!917612) b!1374428))

(assert (= (and b!1374428 res!917614) b!1374429))

(assert (= (and b!1374429 res!917611) b!1374430))

(declare-fun m!1257791 () Bool)

(assert (=> start!116532 m!1257791))

(declare-fun m!1257793 () Bool)

(assert (=> b!1374428 m!1257793))

(declare-fun m!1257795 () Bool)

(assert (=> b!1374430 m!1257795))

(declare-fun m!1257797 () Bool)

(assert (=> b!1374430 m!1257797))

(declare-fun m!1257799 () Bool)

(assert (=> b!1374430 m!1257799))

(declare-fun m!1257801 () Bool)

(assert (=> b!1374430 m!1257801))

(declare-fun m!1257803 () Bool)

(assert (=> b!1374430 m!1257803))

(declare-fun m!1257805 () Bool)

(assert (=> b!1374430 m!1257805))

(declare-fun m!1257807 () Bool)

(assert (=> b!1374430 m!1257807))

(declare-fun m!1257809 () Bool)

(assert (=> b!1374430 m!1257809))

(declare-fun m!1257811 () Bool)

(assert (=> b!1374430 m!1257811))

(declare-fun m!1257813 () Bool)

(assert (=> b!1374427 m!1257813))

(assert (=> b!1374427 m!1257813))

(declare-fun m!1257815 () Bool)

(assert (=> b!1374427 m!1257815))

(push 1)

(assert (not start!116532))

(assert (not b!1374427))

(assert (not b!1374428))

(assert (not b!1374430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

