; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116762 () Bool)

(assert start!116762)

(declare-fun b!1375770 () Bool)

(declare-fun e!779489 () Bool)

(declare-fun e!779490 () Bool)

(assert (=> b!1375770 (= e!779489 (not e!779490))))

(declare-fun res!918175 () Bool)

(assert (=> b!1375770 (=> res!918175 e!779490)))

(declare-datatypes ((array!93353 0))(
  ( (array!93354 (arr!45078 (Array (_ BitVec 32) (_ BitVec 64))) (size!45629 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93353)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375770 (= res!918175 (or (bvslt (size!45629 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604092 () (_ BitVec 32))

(declare-fun lt!604089 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93353 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375770 (= (bvadd lt!604092 lt!604089) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45629 a!4142)))))

(declare-datatypes ((Unit!45390 0))(
  ( (Unit!45391) )
))
(declare-fun lt!604090 () Unit!45390)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45390)

(assert (=> b!1375770 (= lt!604090 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45629 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604093 () (_ BitVec 32))

(assert (=> b!1375770 (= lt!604093 lt!604089)))

(assert (=> b!1375770 (= lt!604089 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45629 a!4142)))))

(declare-fun lt!604094 () array!93353)

(assert (=> b!1375770 (= lt!604093 (arrayCountValidKeys!0 lt!604094 (bvadd #b00000000000000000000000000000001 i!1457) (size!45629 a!4142)))))

(declare-fun lt!604088 () Unit!45390)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45390)

(assert (=> b!1375770 (= lt!604088 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604087 () (_ BitVec 32))

(assert (=> b!1375770 (= lt!604087 (bvsub lt!604092 #b00000000000000000000000000000001))))

(assert (=> b!1375770 (= lt!604087 (arrayCountValidKeys!0 lt!604094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375770 (= lt!604092 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375770 (= lt!604094 (array!93354 (store (arr!45078 a!4142) i!1457 k!2959) (size!45629 a!4142)))))

(declare-fun lt!604095 () Unit!45390)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45390)

(assert (=> b!1375770 (= lt!604095 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!918177 () Bool)

(assert (=> start!116762 (=> (not res!918177) (not e!779489))))

(assert (=> start!116762 (= res!918177 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45629 a!4142))))))

(assert (=> start!116762 e!779489))

(assert (=> start!116762 true))

(declare-fun array_inv!34359 (array!93353) Bool)

(assert (=> start!116762 (array_inv!34359 a!4142)))

(declare-fun b!1375771 () Bool)

(declare-fun res!918176 () Bool)

(assert (=> b!1375771 (=> (not res!918176) (not e!779489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375771 (= res!918176 (validKeyInArray!0 (select (arr!45078 a!4142) i!1457)))))

(declare-fun b!1375772 () Bool)

(declare-fun res!918173 () Bool)

(assert (=> b!1375772 (=> (not res!918173) (not e!779489))))

(assert (=> b!1375772 (= res!918173 (bvslt (size!45629 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375773 () Bool)

(assert (=> b!1375773 (= e!779490 true)))

(assert (=> b!1375773 (= (bvadd lt!604087 lt!604093) (arrayCountValidKeys!0 lt!604094 #b00000000000000000000000000000000 (size!45629 a!4142)))))

(declare-fun lt!604091 () Unit!45390)

(assert (=> b!1375773 (= lt!604091 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604094 #b00000000000000000000000000000000 (size!45629 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375774 () Bool)

(declare-fun res!918174 () Bool)

(assert (=> b!1375774 (=> (not res!918174) (not e!779489))))

(assert (=> b!1375774 (= res!918174 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116762 res!918177) b!1375771))

(assert (= (and b!1375771 res!918176) b!1375774))

(assert (= (and b!1375774 res!918174) b!1375772))

(assert (= (and b!1375772 res!918173) b!1375770))

(assert (= (and b!1375770 (not res!918175)) b!1375773))

(declare-fun m!1259473 () Bool)

(assert (=> b!1375773 m!1259473))

(declare-fun m!1259475 () Bool)

(assert (=> b!1375773 m!1259475))

(declare-fun m!1259477 () Bool)

(assert (=> b!1375774 m!1259477))

(declare-fun m!1259479 () Bool)

(assert (=> start!116762 m!1259479))

(declare-fun m!1259481 () Bool)

(assert (=> b!1375770 m!1259481))

(declare-fun m!1259483 () Bool)

(assert (=> b!1375770 m!1259483))

(declare-fun m!1259485 () Bool)

(assert (=> b!1375770 m!1259485))

(declare-fun m!1259487 () Bool)

(assert (=> b!1375770 m!1259487))

(declare-fun m!1259489 () Bool)

(assert (=> b!1375770 m!1259489))

(declare-fun m!1259491 () Bool)

(assert (=> b!1375770 m!1259491))

(declare-fun m!1259493 () Bool)

(assert (=> b!1375770 m!1259493))

(declare-fun m!1259495 () Bool)

(assert (=> b!1375770 m!1259495))

(declare-fun m!1259497 () Bool)

(assert (=> b!1375770 m!1259497))

(declare-fun m!1259499 () Bool)

(assert (=> b!1375771 m!1259499))

(assert (=> b!1375771 m!1259499))

(declare-fun m!1259501 () Bool)

(assert (=> b!1375771 m!1259501))

(push 1)

(assert (not b!1375774))

(assert (not start!116762))

(assert (not b!1375773))

(assert (not b!1375771))

(assert (not b!1375770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

