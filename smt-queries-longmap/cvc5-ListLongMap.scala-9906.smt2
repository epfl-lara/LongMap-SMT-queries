; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117180 () Bool)

(assert start!117180)

(declare-fun b!1379030 () Bool)

(declare-fun res!921568 () Bool)

(declare-fun e!781191 () Bool)

(assert (=> b!1379030 (=> (not res!921568) (not e!781191))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379030 (= res!921568 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379031 () Bool)

(declare-fun res!921567 () Bool)

(assert (=> b!1379031 (=> (not res!921567) (not e!781191))))

(declare-datatypes ((array!93797 0))(
  ( (array!93798 (arr!45299 (Array (_ BitVec 32) (_ BitVec 64))) (size!45849 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93797)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379031 (= res!921567 (and (bvslt (size!45849 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45849 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379032 () Bool)

(declare-fun res!921566 () Bool)

(assert (=> b!1379032 (=> (not res!921566) (not e!781191))))

(assert (=> b!1379032 (= res!921566 (validKeyInArray!0 (select (arr!45299 a!4094) i!1451)))))

(declare-fun res!921564 () Bool)

(assert (=> start!117180 (=> (not res!921564) (not e!781191))))

(assert (=> start!117180 (= res!921564 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45849 a!4094))))))

(assert (=> start!117180 e!781191))

(assert (=> start!117180 true))

(declare-fun array_inv!34327 (array!93797) Bool)

(assert (=> start!117180 (array_inv!34327 a!4094)))

(declare-fun b!1379033 () Bool)

(declare-fun e!781192 () Bool)

(assert (=> b!1379033 (= e!781192 (not true))))

(declare-fun lt!607063 () array!93797)

(declare-fun lt!607064 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93797 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379033 (= (bvadd (arrayCountValidKeys!0 lt!607063 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607064) (arrayCountValidKeys!0 lt!607063 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45825 0))(
  ( (Unit!45826) )
))
(declare-fun lt!607065 () Unit!45825)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45825)

(assert (=> b!1379033 (= lt!607065 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607063 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607061 () (_ BitVec 32))

(assert (=> b!1379033 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607061) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607062 () Unit!45825)

(assert (=> b!1379033 (= lt!607062 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379034 () Bool)

(assert (=> b!1379034 (= e!781191 e!781192)))

(declare-fun res!921565 () Bool)

(assert (=> b!1379034 (=> (not res!921565) (not e!781192))))

(assert (=> b!1379034 (= res!921565 (and (= lt!607064 (bvsub lt!607061 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379034 (= lt!607064 (arrayCountValidKeys!0 lt!607063 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379034 (= lt!607061 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379034 (= lt!607063 (array!93798 (store (arr!45299 a!4094) i!1451 k!2953) (size!45849 a!4094)))))

(assert (= (and start!117180 res!921564) b!1379032))

(assert (= (and b!1379032 res!921566) b!1379030))

(assert (= (and b!1379030 res!921568) b!1379031))

(assert (= (and b!1379031 res!921567) b!1379034))

(assert (= (and b!1379034 res!921565) b!1379033))

(declare-fun m!1263867 () Bool)

(assert (=> b!1379034 m!1263867))

(declare-fun m!1263869 () Bool)

(assert (=> b!1379034 m!1263869))

(declare-fun m!1263871 () Bool)

(assert (=> b!1379034 m!1263871))

(declare-fun m!1263873 () Bool)

(assert (=> start!117180 m!1263873))

(declare-fun m!1263875 () Bool)

(assert (=> b!1379032 m!1263875))

(assert (=> b!1379032 m!1263875))

(declare-fun m!1263877 () Bool)

(assert (=> b!1379032 m!1263877))

(declare-fun m!1263879 () Bool)

(assert (=> b!1379030 m!1263879))

(declare-fun m!1263881 () Bool)

(assert (=> b!1379033 m!1263881))

(declare-fun m!1263883 () Bool)

(assert (=> b!1379033 m!1263883))

(declare-fun m!1263885 () Bool)

(assert (=> b!1379033 m!1263885))

(declare-fun m!1263887 () Bool)

(assert (=> b!1379033 m!1263887))

(declare-fun m!1263889 () Bool)

(assert (=> b!1379033 m!1263889))

(declare-fun m!1263891 () Bool)

(assert (=> b!1379033 m!1263891))

(push 1)

(assert (not b!1379032))

(assert (not b!1379033))

(assert (not b!1379030))

(assert (not b!1379034))

(assert (not start!117180))

(check-sat)

