; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116648 () Bool)

(assert start!116648)

(declare-fun b!1375033 () Bool)

(declare-fun res!918131 () Bool)

(declare-fun e!778956 () Bool)

(assert (=> b!1375033 (=> (not res!918131) (not e!778956))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375033 (= res!918131 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375032 () Bool)

(declare-fun res!918132 () Bool)

(assert (=> b!1375032 (=> (not res!918132) (not e!778956))))

(declare-datatypes ((array!93271 0))(
  ( (array!93272 (arr!45039 (Array (_ BitVec 32) (_ BitVec 64))) (size!45591 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93271)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375032 (= res!918132 (validKeyInArray!0 (select (arr!45039 a!4142) i!1457)))))

(declare-fun b!1375035 () Bool)

(assert (=> b!1375035 (= e!778956 (not true))))

(declare-fun lt!603865 () (_ BitVec 32))

(declare-fun lt!603868 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93271 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375035 (= (bvadd lt!603865 lt!603868) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45591 a!4142)))))

(declare-datatypes ((Unit!45358 0))(
  ( (Unit!45359) )
))
(declare-fun lt!603863 () Unit!45358)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45358)

(assert (=> b!1375035 (= lt!603863 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45591 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603866 () (_ BitVec 32))

(assert (=> b!1375035 (= lt!603866 lt!603868)))

(assert (=> b!1375035 (= lt!603868 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45591 a!4142)))))

(declare-fun lt!603869 () array!93271)

(assert (=> b!1375035 (= lt!603866 (arrayCountValidKeys!0 lt!603869 (bvadd #b00000000000000000000000000000001 i!1457) (size!45591 a!4142)))))

(declare-fun lt!603864 () Unit!45358)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45358)

(assert (=> b!1375035 (= lt!603864 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375035 (= (arrayCountValidKeys!0 lt!603869 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!603865 #b00000000000000000000000000000001))))

(assert (=> b!1375035 (= lt!603865 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375035 (= lt!603869 (array!93272 (store (arr!45039 a!4142) i!1457 k!2959) (size!45591 a!4142)))))

(declare-fun lt!603867 () Unit!45358)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45358)

(assert (=> b!1375035 (= lt!603867 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!918134 () Bool)

(assert (=> start!116648 (=> (not res!918134) (not e!778956))))

(assert (=> start!116648 (= res!918134 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45591 a!4142))))))

(assert (=> start!116648 e!778956))

(assert (=> start!116648 true))

(declare-fun array_inv!34272 (array!93271) Bool)

(assert (=> start!116648 (array_inv!34272 a!4142)))

(declare-fun b!1375034 () Bool)

(declare-fun res!918133 () Bool)

(assert (=> b!1375034 (=> (not res!918133) (not e!778956))))

(assert (=> b!1375034 (= res!918133 (bvslt (size!45591 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116648 res!918134) b!1375032))

(assert (= (and b!1375032 res!918132) b!1375033))

(assert (= (and b!1375033 res!918131) b!1375034))

(assert (= (and b!1375034 res!918133) b!1375035))

(declare-fun m!1258261 () Bool)

(assert (=> b!1375033 m!1258261))

(declare-fun m!1258263 () Bool)

(assert (=> b!1375032 m!1258263))

(assert (=> b!1375032 m!1258263))

(declare-fun m!1258265 () Bool)

(assert (=> b!1375032 m!1258265))

(declare-fun m!1258267 () Bool)

(assert (=> b!1375035 m!1258267))

(declare-fun m!1258269 () Bool)

(assert (=> b!1375035 m!1258269))

(declare-fun m!1258271 () Bool)

(assert (=> b!1375035 m!1258271))

(declare-fun m!1258273 () Bool)

(assert (=> b!1375035 m!1258273))

(declare-fun m!1258275 () Bool)

(assert (=> b!1375035 m!1258275))

(declare-fun m!1258277 () Bool)

(assert (=> b!1375035 m!1258277))

(declare-fun m!1258279 () Bool)

(assert (=> b!1375035 m!1258279))

(declare-fun m!1258281 () Bool)

(assert (=> b!1375035 m!1258281))

(declare-fun m!1258283 () Bool)

(assert (=> b!1375035 m!1258283))

(declare-fun m!1258285 () Bool)

(assert (=> start!116648 m!1258285))

(push 1)

(assert (not b!1375035))

(assert (not b!1375033))

(assert (not start!116648))

(assert (not b!1375032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

