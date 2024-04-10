; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116546 () Bool)

(assert start!116546)

(declare-fun res!917715 () Bool)

(declare-fun e!778684 () Bool)

(assert (=> start!116546 (=> (not res!917715) (not e!778684))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93246 0))(
  ( (array!93247 (arr!45029 (Array (_ BitVec 32) (_ BitVec 64))) (size!45579 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93246)

(assert (=> start!116546 (= res!917715 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45579 a!4142))))))

(assert (=> start!116546 e!778684))

(assert (=> start!116546 true))

(declare-fun array_inv!34057 (array!93246) Bool)

(assert (=> start!116546 (array_inv!34057 a!4142)))

(declare-fun b!1374531 () Bool)

(declare-fun res!917717 () Bool)

(assert (=> b!1374531 (=> (not res!917717) (not e!778684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374531 (= res!917717 (validKeyInArray!0 (select (arr!45029 a!4142) i!1457)))))

(declare-fun b!1374532 () Bool)

(declare-fun res!917719 () Bool)

(assert (=> b!1374532 (=> (not res!917719) (not e!778684))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374532 (= res!917719 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374533 () Bool)

(declare-fun res!917716 () Bool)

(assert (=> b!1374533 (=> (not res!917716) (not e!778684))))

(assert (=> b!1374533 (= res!917716 (bvslt (size!45579 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374534 () Bool)

(declare-fun e!778683 () Bool)

(assert (=> b!1374534 (= e!778684 (not e!778683))))

(declare-fun res!917718 () Bool)

(assert (=> b!1374534 (=> res!917718 e!778683)))

(assert (=> b!1374534 (= res!917718 (or (bvslt (size!45579 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603720 () (_ BitVec 32))

(declare-fun lt!603722 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93246 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374534 (= (bvadd lt!603720 lt!603722) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45579 a!4142)))))

(declare-datatypes ((Unit!45459 0))(
  ( (Unit!45460) )
))
(declare-fun lt!603725 () Unit!45459)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45459)

(assert (=> b!1374534 (= lt!603725 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45579 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603724 () (_ BitVec 32))

(assert (=> b!1374534 (= lt!603724 lt!603722)))

(assert (=> b!1374534 (= lt!603722 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45579 a!4142)))))

(declare-fun lt!603726 () array!93246)

(assert (=> b!1374534 (= lt!603724 (arrayCountValidKeys!0 lt!603726 (bvadd #b00000000000000000000000000000001 i!1457) (size!45579 a!4142)))))

(declare-fun lt!603723 () Unit!45459)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93246 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45459)

(assert (=> b!1374534 (= lt!603723 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603727 () (_ BitVec 32))

(assert (=> b!1374534 (= lt!603727 (bvsub lt!603720 #b00000000000000000000000000000001))))

(assert (=> b!1374534 (= lt!603727 (arrayCountValidKeys!0 lt!603726 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374534 (= lt!603720 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374534 (= lt!603726 (array!93247 (store (arr!45029 a!4142) i!1457 k!2959) (size!45579 a!4142)))))

(declare-fun lt!603721 () Unit!45459)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93246 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45459)

(assert (=> b!1374534 (= lt!603721 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374535 () Bool)

(assert (=> b!1374535 (= e!778683 true)))

(assert (=> b!1374535 (= (bvadd lt!603727 lt!603724) (arrayCountValidKeys!0 lt!603726 #b00000000000000000000000000000000 (size!45579 a!4142)))))

(declare-fun lt!603719 () Unit!45459)

(assert (=> b!1374535 (= lt!603719 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603726 #b00000000000000000000000000000000 (size!45579 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116546 res!917715) b!1374531))

(assert (= (and b!1374531 res!917717) b!1374532))

(assert (= (and b!1374532 res!917719) b!1374533))

(assert (= (and b!1374533 res!917716) b!1374534))

(assert (= (and b!1374534 (not res!917718)) b!1374535))

(declare-fun m!1257997 () Bool)

(assert (=> b!1374531 m!1257997))

(assert (=> b!1374531 m!1257997))

(declare-fun m!1257999 () Bool)

(assert (=> b!1374531 m!1257999))

(declare-fun m!1258001 () Bool)

(assert (=> b!1374535 m!1258001))

(declare-fun m!1258003 () Bool)

(assert (=> b!1374535 m!1258003))

(declare-fun m!1258005 () Bool)

(assert (=> start!116546 m!1258005))

(declare-fun m!1258007 () Bool)

(assert (=> b!1374534 m!1258007))

(declare-fun m!1258009 () Bool)

(assert (=> b!1374534 m!1258009))

(declare-fun m!1258011 () Bool)

(assert (=> b!1374534 m!1258011))

(declare-fun m!1258013 () Bool)

(assert (=> b!1374534 m!1258013))

(declare-fun m!1258015 () Bool)

(assert (=> b!1374534 m!1258015))

(declare-fun m!1258017 () Bool)

(assert (=> b!1374534 m!1258017))

(declare-fun m!1258019 () Bool)

(assert (=> b!1374534 m!1258019))

(declare-fun m!1258021 () Bool)

(assert (=> b!1374534 m!1258021))

(declare-fun m!1258023 () Bool)

(assert (=> b!1374534 m!1258023))

(declare-fun m!1258025 () Bool)

(assert (=> b!1374532 m!1258025))

(push 1)

(assert (not b!1374532))

(assert (not start!116546))

(assert (not b!1374534))

(assert (not b!1374535))

(assert (not b!1374531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

