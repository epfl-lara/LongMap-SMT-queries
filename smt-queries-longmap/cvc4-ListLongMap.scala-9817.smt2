; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116556 () Bool)

(assert start!116556)

(declare-fun b!1374606 () Bool)

(declare-fun e!778728 () Bool)

(assert (=> b!1374606 (= e!778728 true)))

(declare-fun lt!603858 () (_ BitVec 32))

(declare-datatypes ((array!93256 0))(
  ( (array!93257 (arr!45034 (Array (_ BitVec 32) (_ BitVec 64))) (size!45584 (_ BitVec 32))) )
))
(declare-fun lt!603854 () array!93256)

(declare-fun a!4142 () array!93256)

(declare-fun lt!603859 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93256 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374606 (= (bvadd lt!603859 lt!603858) (arrayCountValidKeys!0 lt!603854 #b00000000000000000000000000000000 (size!45584 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45469 0))(
  ( (Unit!45470) )
))
(declare-fun lt!603855 () Unit!45469)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45469)

(assert (=> b!1374606 (= lt!603855 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603854 #b00000000000000000000000000000000 (size!45584 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374607 () Bool)

(declare-fun e!778729 () Bool)

(assert (=> b!1374607 (= e!778729 (not e!778728))))

(declare-fun res!917790 () Bool)

(assert (=> b!1374607 (=> res!917790 e!778728)))

(assert (=> b!1374607 (= res!917790 (or (bvslt (size!45584 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603860 () (_ BitVec 32))

(declare-fun lt!603861 () (_ BitVec 32))

(assert (=> b!1374607 (= (bvadd lt!603860 lt!603861) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45584 a!4142)))))

(declare-fun lt!603857 () Unit!45469)

(assert (=> b!1374607 (= lt!603857 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45584 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374607 (= lt!603858 lt!603861)))

(assert (=> b!1374607 (= lt!603861 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45584 a!4142)))))

(assert (=> b!1374607 (= lt!603858 (arrayCountValidKeys!0 lt!603854 (bvadd #b00000000000000000000000000000001 i!1457) (size!45584 a!4142)))))

(declare-fun lt!603856 () Unit!45469)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93256 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45469)

(assert (=> b!1374607 (= lt!603856 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374607 (= lt!603859 (bvsub lt!603860 #b00000000000000000000000000000001))))

(assert (=> b!1374607 (= lt!603859 (arrayCountValidKeys!0 lt!603854 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374607 (= lt!603860 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374607 (= lt!603854 (array!93257 (store (arr!45034 a!4142) i!1457 k!2959) (size!45584 a!4142)))))

(declare-fun lt!603862 () Unit!45469)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93256 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45469)

(assert (=> b!1374607 (= lt!603862 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917793 () Bool)

(assert (=> start!116556 (=> (not res!917793) (not e!778729))))

(assert (=> start!116556 (= res!917793 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45584 a!4142))))))

(assert (=> start!116556 e!778729))

(assert (=> start!116556 true))

(declare-fun array_inv!34062 (array!93256) Bool)

(assert (=> start!116556 (array_inv!34062 a!4142)))

(declare-fun b!1374608 () Bool)

(declare-fun res!917791 () Bool)

(assert (=> b!1374608 (=> (not res!917791) (not e!778729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374608 (= res!917791 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374609 () Bool)

(declare-fun res!917792 () Bool)

(assert (=> b!1374609 (=> (not res!917792) (not e!778729))))

(assert (=> b!1374609 (= res!917792 (bvslt (size!45584 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374610 () Bool)

(declare-fun res!917794 () Bool)

(assert (=> b!1374610 (=> (not res!917794) (not e!778729))))

(assert (=> b!1374610 (= res!917794 (validKeyInArray!0 (select (arr!45034 a!4142) i!1457)))))

(assert (= (and start!116556 res!917793) b!1374610))

(assert (= (and b!1374610 res!917794) b!1374608))

(assert (= (and b!1374608 res!917791) b!1374609))

(assert (= (and b!1374609 res!917792) b!1374607))

(assert (= (and b!1374607 (not res!917790)) b!1374606))

(declare-fun m!1258147 () Bool)

(assert (=> b!1374610 m!1258147))

(assert (=> b!1374610 m!1258147))

(declare-fun m!1258149 () Bool)

(assert (=> b!1374610 m!1258149))

(declare-fun m!1258151 () Bool)

(assert (=> b!1374607 m!1258151))

(declare-fun m!1258153 () Bool)

(assert (=> b!1374607 m!1258153))

(declare-fun m!1258155 () Bool)

(assert (=> b!1374607 m!1258155))

(declare-fun m!1258157 () Bool)

(assert (=> b!1374607 m!1258157))

(declare-fun m!1258159 () Bool)

(assert (=> b!1374607 m!1258159))

(declare-fun m!1258161 () Bool)

(assert (=> b!1374607 m!1258161))

(declare-fun m!1258163 () Bool)

(assert (=> b!1374607 m!1258163))

(declare-fun m!1258165 () Bool)

(assert (=> b!1374607 m!1258165))

(declare-fun m!1258167 () Bool)

(assert (=> b!1374607 m!1258167))

(declare-fun m!1258169 () Bool)

(assert (=> b!1374608 m!1258169))

(declare-fun m!1258171 () Bool)

(assert (=> b!1374606 m!1258171))

(declare-fun m!1258173 () Bool)

(assert (=> b!1374606 m!1258173))

(declare-fun m!1258175 () Bool)

(assert (=> start!116556 m!1258175))

(push 1)

(assert (not start!116556))

(assert (not b!1374608))

(assert (not b!1374607))

(assert (not b!1374606))

(assert (not b!1374610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

