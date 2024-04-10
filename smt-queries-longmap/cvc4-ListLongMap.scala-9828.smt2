; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116658 () Bool)

(assert start!116658)

(declare-fun b!1375131 () Bool)

(declare-fun res!918196 () Bool)

(declare-fun e!779002 () Bool)

(assert (=> b!1375131 (=> (not res!918196) (not e!779002))))

(declare-datatypes ((array!93327 0))(
  ( (array!93328 (arr!45067 (Array (_ BitVec 32) (_ BitVec 64))) (size!45617 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93327)

(assert (=> b!1375131 (= res!918196 (bvslt (size!45617 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375132 () Bool)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375132 (= e!779002 (not (and (bvsge (size!45617 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!604109 () (_ BitVec 32))

(declare-fun lt!604112 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93327 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375132 (= (bvadd lt!604109 lt!604112) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45617 a!4142)))))

(declare-datatypes ((Unit!45523 0))(
  ( (Unit!45524) )
))
(declare-fun lt!604111 () Unit!45523)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45523)

(assert (=> b!1375132 (= lt!604111 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45617 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604108 () (_ BitVec 32))

(assert (=> b!1375132 (= lt!604108 lt!604112)))

(assert (=> b!1375132 (= lt!604112 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45617 a!4142)))))

(declare-fun lt!604110 () array!93327)

(assert (=> b!1375132 (= lt!604108 (arrayCountValidKeys!0 lt!604110 (bvadd #b00000000000000000000000000000001 i!1457) (size!45617 a!4142)))))

(declare-fun lt!604113 () Unit!45523)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93327 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45523)

(assert (=> b!1375132 (= lt!604113 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375132 (= (arrayCountValidKeys!0 lt!604110 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604109 #b00000000000000000000000000000001))))

(assert (=> b!1375132 (= lt!604109 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375132 (= lt!604110 (array!93328 (store (arr!45067 a!4142) i!1457 k!2959) (size!45617 a!4142)))))

(declare-fun lt!604114 () Unit!45523)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93327 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45523)

(assert (=> b!1375132 (= lt!604114 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375129 () Bool)

(declare-fun res!918195 () Bool)

(assert (=> b!1375129 (=> (not res!918195) (not e!779002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375129 (= res!918195 (validKeyInArray!0 (select (arr!45067 a!4142) i!1457)))))

(declare-fun res!918194 () Bool)

(assert (=> start!116658 (=> (not res!918194) (not e!779002))))

(assert (=> start!116658 (= res!918194 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45617 a!4142))))))

(assert (=> start!116658 e!779002))

(assert (=> start!116658 true))

(declare-fun array_inv!34095 (array!93327) Bool)

(assert (=> start!116658 (array_inv!34095 a!4142)))

(declare-fun b!1375130 () Bool)

(declare-fun res!918193 () Bool)

(assert (=> b!1375130 (=> (not res!918193) (not e!779002))))

(assert (=> b!1375130 (= res!918193 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116658 res!918194) b!1375129))

(assert (= (and b!1375129 res!918195) b!1375130))

(assert (= (and b!1375130 res!918193) b!1375131))

(assert (= (and b!1375131 res!918196) b!1375132))

(declare-fun m!1258841 () Bool)

(assert (=> b!1375132 m!1258841))

(declare-fun m!1258843 () Bool)

(assert (=> b!1375132 m!1258843))

(declare-fun m!1258845 () Bool)

(assert (=> b!1375132 m!1258845))

(declare-fun m!1258847 () Bool)

(assert (=> b!1375132 m!1258847))

(declare-fun m!1258849 () Bool)

(assert (=> b!1375132 m!1258849))

(declare-fun m!1258851 () Bool)

(assert (=> b!1375132 m!1258851))

(declare-fun m!1258853 () Bool)

(assert (=> b!1375132 m!1258853))

(declare-fun m!1258855 () Bool)

(assert (=> b!1375132 m!1258855))

(declare-fun m!1258857 () Bool)

(assert (=> b!1375132 m!1258857))

(declare-fun m!1258859 () Bool)

(assert (=> b!1375129 m!1258859))

(assert (=> b!1375129 m!1258859))

(declare-fun m!1258861 () Bool)

(assert (=> b!1375129 m!1258861))

(declare-fun m!1258863 () Bool)

(assert (=> start!116658 m!1258863))

(declare-fun m!1258865 () Bool)

(assert (=> b!1375130 m!1258865))

(push 1)

(assert (not b!1375132))

(assert (not start!116658))

(assert (not b!1375129))

