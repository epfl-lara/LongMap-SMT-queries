; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116768 () Bool)

(assert start!116768)

(declare-fun b!1375815 () Bool)

(declare-fun e!779518 () Bool)

(declare-fun e!779516 () Bool)

(assert (=> b!1375815 (= e!779518 (not e!779516))))

(declare-fun res!918220 () Bool)

(assert (=> b!1375815 (=> res!918220 e!779516)))

(declare-datatypes ((array!93359 0))(
  ( (array!93360 (arr!45081 (Array (_ BitVec 32) (_ BitVec 64))) (size!45632 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93359)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375815 (= res!918220 (or (bvslt (size!45632 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604172 () (_ BitVec 32))

(declare-fun lt!604174 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93359 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375815 (= (bvadd lt!604172 lt!604174) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45632 a!4142)))))

(declare-datatypes ((Unit!45396 0))(
  ( (Unit!45397) )
))
(declare-fun lt!604171 () Unit!45396)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45396)

(assert (=> b!1375815 (= lt!604171 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45632 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604170 () (_ BitVec 32))

(assert (=> b!1375815 (= lt!604170 lt!604174)))

(assert (=> b!1375815 (= lt!604174 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45632 a!4142)))))

(declare-fun lt!604169 () array!93359)

(assert (=> b!1375815 (= lt!604170 (arrayCountValidKeys!0 lt!604169 (bvadd #b00000000000000000000000000000001 i!1457) (size!45632 a!4142)))))

(declare-fun lt!604176 () Unit!45396)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45396)

(assert (=> b!1375815 (= lt!604176 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604168 () (_ BitVec 32))

(assert (=> b!1375815 (= lt!604168 (bvsub lt!604172 #b00000000000000000000000000000001))))

(assert (=> b!1375815 (= lt!604168 (arrayCountValidKeys!0 lt!604169 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375815 (= lt!604172 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375815 (= lt!604169 (array!93360 (store (arr!45081 a!4142) i!1457 k!2959) (size!45632 a!4142)))))

(declare-fun lt!604175 () Unit!45396)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45396)

(assert (=> b!1375815 (= lt!604175 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!918222 () Bool)

(assert (=> start!116768 (=> (not res!918222) (not e!779518))))

(assert (=> start!116768 (= res!918222 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45632 a!4142))))))

(assert (=> start!116768 e!779518))

(assert (=> start!116768 true))

(declare-fun array_inv!34362 (array!93359) Bool)

(assert (=> start!116768 (array_inv!34362 a!4142)))

(declare-fun b!1375816 () Bool)

(declare-fun res!918221 () Bool)

(assert (=> b!1375816 (=> (not res!918221) (not e!779518))))

(assert (=> b!1375816 (= res!918221 (bvslt (size!45632 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375817 () Bool)

(declare-fun res!918218 () Bool)

(assert (=> b!1375817 (=> (not res!918218) (not e!779518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375817 (= res!918218 (validKeyInArray!0 (select (arr!45081 a!4142) i!1457)))))

(declare-fun b!1375818 () Bool)

(declare-fun res!918219 () Bool)

(assert (=> b!1375818 (=> (not res!918219) (not e!779518))))

(assert (=> b!1375818 (= res!918219 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375819 () Bool)

(assert (=> b!1375819 (= e!779516 true)))

(assert (=> b!1375819 (= (bvadd lt!604168 lt!604170) (arrayCountValidKeys!0 lt!604169 #b00000000000000000000000000000000 (size!45632 a!4142)))))

(declare-fun lt!604173 () Unit!45396)

(assert (=> b!1375819 (= lt!604173 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604169 #b00000000000000000000000000000000 (size!45632 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116768 res!918222) b!1375817))

(assert (= (and b!1375817 res!918218) b!1375818))

(assert (= (and b!1375818 res!918219) b!1375816))

(assert (= (and b!1375816 res!918221) b!1375815))

(assert (= (and b!1375815 (not res!918220)) b!1375819))

(declare-fun m!1259563 () Bool)

(assert (=> b!1375818 m!1259563))

(declare-fun m!1259565 () Bool)

(assert (=> b!1375815 m!1259565))

(declare-fun m!1259567 () Bool)

(assert (=> b!1375815 m!1259567))

(declare-fun m!1259569 () Bool)

(assert (=> b!1375815 m!1259569))

(declare-fun m!1259571 () Bool)

(assert (=> b!1375815 m!1259571))

(declare-fun m!1259573 () Bool)

(assert (=> b!1375815 m!1259573))

(declare-fun m!1259575 () Bool)

(assert (=> b!1375815 m!1259575))

(declare-fun m!1259577 () Bool)

(assert (=> b!1375815 m!1259577))

(declare-fun m!1259579 () Bool)

(assert (=> b!1375815 m!1259579))

(declare-fun m!1259581 () Bool)

(assert (=> b!1375815 m!1259581))

(declare-fun m!1259583 () Bool)

(assert (=> start!116768 m!1259583))

(declare-fun m!1259585 () Bool)

(assert (=> b!1375819 m!1259585))

(declare-fun m!1259587 () Bool)

(assert (=> b!1375819 m!1259587))

(declare-fun m!1259589 () Bool)

(assert (=> b!1375817 m!1259589))

(assert (=> b!1375817 m!1259589))

(declare-fun m!1259591 () Bool)

(assert (=> b!1375817 m!1259591))

(push 1)

(assert (not b!1375815))

(assert (not start!116768))

(assert (not b!1375818))

(assert (not b!1375819))

(assert (not b!1375817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

