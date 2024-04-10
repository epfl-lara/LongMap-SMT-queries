; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116654 () Bool)

(assert start!116654)

(declare-fun res!918169 () Bool)

(declare-fun e!778989 () Bool)

(assert (=> start!116654 (=> (not res!918169) (not e!778989))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93323 0))(
  ( (array!93324 (arr!45065 (Array (_ BitVec 32) (_ BitVec 64))) (size!45615 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93323)

(assert (=> start!116654 (= res!918169 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45615 a!4142))))))

(assert (=> start!116654 e!778989))

(assert (=> start!116654 true))

(declare-fun array_inv!34093 (array!93323) Bool)

(assert (=> start!116654 (array_inv!34093 a!4142)))

(declare-fun b!1375105 () Bool)

(declare-fun res!918171 () Bool)

(assert (=> b!1375105 (=> (not res!918171) (not e!778989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375105 (= res!918171 (validKeyInArray!0 (select (arr!45065 a!4142) i!1457)))))

(declare-fun b!1375107 () Bool)

(declare-fun res!918170 () Bool)

(assert (=> b!1375107 (=> (not res!918170) (not e!778989))))

(assert (=> b!1375107 (= res!918170 (bvslt (size!45615 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375106 () Bool)

(declare-fun res!918172 () Bool)

(assert (=> b!1375106 (=> (not res!918172) (not e!778989))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375106 (= res!918172 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375108 () Bool)

(assert (=> b!1375108 (= e!778989 (not (and (bvsge (size!45615 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!604068 () (_ BitVec 32))

(declare-fun lt!604067 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93323 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375108 (= (bvadd lt!604068 lt!604067) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45615 a!4142)))))

(declare-datatypes ((Unit!45519 0))(
  ( (Unit!45520) )
))
(declare-fun lt!604066 () Unit!45519)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45519)

(assert (=> b!1375108 (= lt!604066 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45615 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604071 () (_ BitVec 32))

(assert (=> b!1375108 (= lt!604071 lt!604067)))

(assert (=> b!1375108 (= lt!604067 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45615 a!4142)))))

(declare-fun lt!604070 () array!93323)

(assert (=> b!1375108 (= lt!604071 (arrayCountValidKeys!0 lt!604070 (bvadd #b00000000000000000000000000000001 i!1457) (size!45615 a!4142)))))

(declare-fun lt!604069 () Unit!45519)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45519)

(assert (=> b!1375108 (= lt!604069 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375108 (= (arrayCountValidKeys!0 lt!604070 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604068 #b00000000000000000000000000000001))))

(assert (=> b!1375108 (= lt!604068 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375108 (= lt!604070 (array!93324 (store (arr!45065 a!4142) i!1457 k!2959) (size!45615 a!4142)))))

(declare-fun lt!604072 () Unit!45519)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45519)

(assert (=> b!1375108 (= lt!604072 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116654 res!918169) b!1375105))

(assert (= (and b!1375105 res!918171) b!1375106))

(assert (= (and b!1375106 res!918172) b!1375107))

(assert (= (and b!1375107 res!918170) b!1375108))

(declare-fun m!1258789 () Bool)

(assert (=> start!116654 m!1258789))

(declare-fun m!1258791 () Bool)

(assert (=> b!1375105 m!1258791))

(assert (=> b!1375105 m!1258791))

(declare-fun m!1258793 () Bool)

(assert (=> b!1375105 m!1258793))

(declare-fun m!1258795 () Bool)

(assert (=> b!1375106 m!1258795))

(declare-fun m!1258797 () Bool)

(assert (=> b!1375108 m!1258797))

(declare-fun m!1258799 () Bool)

(assert (=> b!1375108 m!1258799))

(declare-fun m!1258801 () Bool)

(assert (=> b!1375108 m!1258801))

(declare-fun m!1258803 () Bool)

(assert (=> b!1375108 m!1258803))

(declare-fun m!1258805 () Bool)

(assert (=> b!1375108 m!1258805))

(declare-fun m!1258807 () Bool)

(assert (=> b!1375108 m!1258807))

(declare-fun m!1258809 () Bool)

(assert (=> b!1375108 m!1258809))

(declare-fun m!1258811 () Bool)

(assert (=> b!1375108 m!1258811))

(declare-fun m!1258813 () Bool)

(assert (=> b!1375108 m!1258813))

(push 1)

(assert (not start!116654))

(assert (not b!1375105))

(assert (not b!1375106))

(assert (not b!1375108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

