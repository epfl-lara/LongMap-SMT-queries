; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116648 () Bool)

(assert start!116648)

(declare-fun b!1375070 () Bool)

(declare-fun res!918136 () Bool)

(declare-fun e!778972 () Bool)

(assert (=> b!1375070 (=> (not res!918136) (not e!778972))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375070 (= res!918136 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375072 () Bool)

(assert (=> b!1375072 (= e!778972 (not true))))

(declare-fun lt!604008 () (_ BitVec 32))

(declare-fun lt!604009 () (_ BitVec 32))

(declare-datatypes ((array!93317 0))(
  ( (array!93318 (arr!45062 (Array (_ BitVec 32) (_ BitVec 64))) (size!45612 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93317)

(declare-fun arrayCountValidKeys!0 (array!93317 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375072 (= (bvadd lt!604008 lt!604009) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45612 a!4142)))))

(declare-datatypes ((Unit!45513 0))(
  ( (Unit!45514) )
))
(declare-fun lt!604005 () Unit!45513)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45513)

(assert (=> b!1375072 (= lt!604005 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45612 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604003 () (_ BitVec 32))

(assert (=> b!1375072 (= lt!604003 lt!604009)))

(assert (=> b!1375072 (= lt!604009 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45612 a!4142)))))

(declare-fun lt!604006 () array!93317)

(assert (=> b!1375072 (= lt!604003 (arrayCountValidKeys!0 lt!604006 (bvadd #b00000000000000000000000000000001 i!1457) (size!45612 a!4142)))))

(declare-fun lt!604007 () Unit!45513)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45513)

(assert (=> b!1375072 (= lt!604007 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375072 (= (arrayCountValidKeys!0 lt!604006 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604008 #b00000000000000000000000000000001))))

(assert (=> b!1375072 (= lt!604008 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375072 (= lt!604006 (array!93318 (store (arr!45062 a!4142) i!1457 k!2959) (size!45612 a!4142)))))

(declare-fun lt!604004 () Unit!45513)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45513)

(assert (=> b!1375072 (= lt!604004 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!918135 () Bool)

(assert (=> start!116648 (=> (not res!918135) (not e!778972))))

(assert (=> start!116648 (= res!918135 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45612 a!4142))))))

(assert (=> start!116648 e!778972))

(assert (=> start!116648 true))

(declare-fun array_inv!34090 (array!93317) Bool)

(assert (=> start!116648 (array_inv!34090 a!4142)))

(declare-fun b!1375069 () Bool)

(declare-fun res!918133 () Bool)

(assert (=> b!1375069 (=> (not res!918133) (not e!778972))))

(assert (=> b!1375069 (= res!918133 (validKeyInArray!0 (select (arr!45062 a!4142) i!1457)))))

(declare-fun b!1375071 () Bool)

(declare-fun res!918134 () Bool)

(assert (=> b!1375071 (=> (not res!918134) (not e!778972))))

(assert (=> b!1375071 (= res!918134 (bvslt (size!45612 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116648 res!918135) b!1375069))

(assert (= (and b!1375069 res!918133) b!1375070))

(assert (= (and b!1375070 res!918136) b!1375071))

(assert (= (and b!1375071 res!918134) b!1375072))

(declare-fun m!1258711 () Bool)

(assert (=> b!1375070 m!1258711))

(declare-fun m!1258713 () Bool)

(assert (=> b!1375072 m!1258713))

(declare-fun m!1258715 () Bool)

(assert (=> b!1375072 m!1258715))

(declare-fun m!1258717 () Bool)

(assert (=> b!1375072 m!1258717))

(declare-fun m!1258719 () Bool)

(assert (=> b!1375072 m!1258719))

(declare-fun m!1258721 () Bool)

(assert (=> b!1375072 m!1258721))

(declare-fun m!1258723 () Bool)

(assert (=> b!1375072 m!1258723))

(declare-fun m!1258725 () Bool)

(assert (=> b!1375072 m!1258725))

(declare-fun m!1258727 () Bool)

(assert (=> b!1375072 m!1258727))

(declare-fun m!1258729 () Bool)

(assert (=> b!1375072 m!1258729))

(declare-fun m!1258731 () Bool)

(assert (=> start!116648 m!1258731))

(declare-fun m!1258733 () Bool)

(assert (=> b!1375069 m!1258733))

(assert (=> b!1375069 m!1258733))

(declare-fun m!1258735 () Bool)

(assert (=> b!1375069 m!1258735))

(push 1)

(assert (not b!1375072))

(assert (not start!116648))

(assert (not b!1375069))

(assert (not b!1375070))

