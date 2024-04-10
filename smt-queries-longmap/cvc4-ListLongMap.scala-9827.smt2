; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116652 () Bool)

(assert start!116652)

(declare-fun b!1375093 () Bool)

(declare-fun res!918160 () Bool)

(declare-fun e!778983 () Bool)

(assert (=> b!1375093 (=> (not res!918160) (not e!778983))))

(declare-datatypes ((array!93321 0))(
  ( (array!93322 (arr!45064 (Array (_ BitVec 32) (_ BitVec 64))) (size!45614 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93321)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375093 (= res!918160 (validKeyInArray!0 (select (arr!45064 a!4142) i!1457)))))

(declare-fun b!1375096 () Bool)

(assert (=> b!1375096 (= e!778983 (not true))))

(declare-fun lt!604047 () (_ BitVec 32))

(declare-fun lt!604045 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93321 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375096 (= (bvadd lt!604047 lt!604045) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45614 a!4142)))))

(declare-datatypes ((Unit!45517 0))(
  ( (Unit!45518) )
))
(declare-fun lt!604046 () Unit!45517)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45517)

(assert (=> b!1375096 (= lt!604046 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45614 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604049 () (_ BitVec 32))

(assert (=> b!1375096 (= lt!604049 lt!604045)))

(assert (=> b!1375096 (= lt!604045 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45614 a!4142)))))

(declare-fun lt!604050 () array!93321)

(assert (=> b!1375096 (= lt!604049 (arrayCountValidKeys!0 lt!604050 (bvadd #b00000000000000000000000000000001 i!1457) (size!45614 a!4142)))))

(declare-fun lt!604051 () Unit!45517)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45517)

(assert (=> b!1375096 (= lt!604051 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375096 (= (arrayCountValidKeys!0 lt!604050 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604047 #b00000000000000000000000000000001))))

(assert (=> b!1375096 (= lt!604047 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375096 (= lt!604050 (array!93322 (store (arr!45064 a!4142) i!1457 k!2959) (size!45614 a!4142)))))

(declare-fun lt!604048 () Unit!45517)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45517)

(assert (=> b!1375096 (= lt!604048 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375095 () Bool)

(declare-fun res!918157 () Bool)

(assert (=> b!1375095 (=> (not res!918157) (not e!778983))))

(assert (=> b!1375095 (= res!918157 (bvslt (size!45614 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375094 () Bool)

(declare-fun res!918159 () Bool)

(assert (=> b!1375094 (=> (not res!918159) (not e!778983))))

(assert (=> b!1375094 (= res!918159 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!918158 () Bool)

(assert (=> start!116652 (=> (not res!918158) (not e!778983))))

(assert (=> start!116652 (= res!918158 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45614 a!4142))))))

(assert (=> start!116652 e!778983))

(assert (=> start!116652 true))

(declare-fun array_inv!34092 (array!93321) Bool)

(assert (=> start!116652 (array_inv!34092 a!4142)))

(assert (= (and start!116652 res!918158) b!1375093))

(assert (= (and b!1375093 res!918160) b!1375094))

(assert (= (and b!1375094 res!918159) b!1375095))

(assert (= (and b!1375095 res!918157) b!1375096))

(declare-fun m!1258763 () Bool)

(assert (=> b!1375093 m!1258763))

(assert (=> b!1375093 m!1258763))

(declare-fun m!1258765 () Bool)

(assert (=> b!1375093 m!1258765))

(declare-fun m!1258767 () Bool)

(assert (=> b!1375096 m!1258767))

(declare-fun m!1258769 () Bool)

(assert (=> b!1375096 m!1258769))

(declare-fun m!1258771 () Bool)

(assert (=> b!1375096 m!1258771))

(declare-fun m!1258773 () Bool)

(assert (=> b!1375096 m!1258773))

(declare-fun m!1258775 () Bool)

(assert (=> b!1375096 m!1258775))

(declare-fun m!1258777 () Bool)

(assert (=> b!1375096 m!1258777))

(declare-fun m!1258779 () Bool)

(assert (=> b!1375096 m!1258779))

(declare-fun m!1258781 () Bool)

(assert (=> b!1375096 m!1258781))

(declare-fun m!1258783 () Bool)

(assert (=> b!1375096 m!1258783))

(declare-fun m!1258785 () Bool)

(assert (=> b!1375094 m!1258785))

(declare-fun m!1258787 () Bool)

(assert (=> start!116652 m!1258787))

(push 1)

(assert (not b!1375094))

(assert (not b!1375096))

(assert (not start!116652))

(assert (not b!1375093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

