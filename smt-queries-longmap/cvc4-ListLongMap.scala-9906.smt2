; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117184 () Bool)

(assert start!117184)

(declare-fun b!1379060 () Bool)

(declare-fun e!781210 () Bool)

(declare-fun e!781211 () Bool)

(assert (=> b!1379060 (= e!781210 e!781211)))

(declare-fun res!921594 () Bool)

(assert (=> b!1379060 (=> (not res!921594) (not e!781211))))

(declare-fun lt!607095 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607092 () (_ BitVec 32))

(assert (=> b!1379060 (= res!921594 (and (= lt!607095 (bvsub lt!607092 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93801 0))(
  ( (array!93802 (arr!45301 (Array (_ BitVec 32) (_ BitVec 64))) (size!45851 (_ BitVec 32))) )
))
(declare-fun lt!607094 () array!93801)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93801 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379060 (= lt!607095 (arrayCountValidKeys!0 lt!607094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93801)

(assert (=> b!1379060 (= lt!607092 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379060 (= lt!607094 (array!93802 (store (arr!45301 a!4094) i!1451 k!2953) (size!45851 a!4094)))))

(declare-fun res!921596 () Bool)

(assert (=> start!117184 (=> (not res!921596) (not e!781210))))

(assert (=> start!117184 (= res!921596 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45851 a!4094))))))

(assert (=> start!117184 e!781210))

(assert (=> start!117184 true))

(declare-fun array_inv!34329 (array!93801) Bool)

(assert (=> start!117184 (array_inv!34329 a!4094)))

(declare-fun b!1379061 () Bool)

(declare-fun res!921595 () Bool)

(assert (=> b!1379061 (=> (not res!921595) (not e!781210))))

(assert (=> b!1379061 (= res!921595 (and (bvslt (size!45851 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45851 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379062 () Bool)

(declare-fun res!921597 () Bool)

(assert (=> b!1379062 (=> (not res!921597) (not e!781210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379062 (= res!921597 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379063 () Bool)

(assert (=> b!1379063 (= e!781211 (not true))))

(assert (=> b!1379063 (= (bvadd (arrayCountValidKeys!0 lt!607094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607095) (arrayCountValidKeys!0 lt!607094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45829 0))(
  ( (Unit!45830) )
))
(declare-fun lt!607093 () Unit!45829)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45829)

(assert (=> b!1379063 (= lt!607093 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379063 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607092) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607091 () Unit!45829)

(assert (=> b!1379063 (= lt!607091 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379064 () Bool)

(declare-fun res!921598 () Bool)

(assert (=> b!1379064 (=> (not res!921598) (not e!781210))))

(assert (=> b!1379064 (= res!921598 (validKeyInArray!0 (select (arr!45301 a!4094) i!1451)))))

(assert (= (and start!117184 res!921596) b!1379064))

(assert (= (and b!1379064 res!921598) b!1379062))

(assert (= (and b!1379062 res!921597) b!1379061))

(assert (= (and b!1379061 res!921595) b!1379060))

(assert (= (and b!1379060 res!921594) b!1379063))

(declare-fun m!1263919 () Bool)

(assert (=> b!1379063 m!1263919))

(declare-fun m!1263921 () Bool)

(assert (=> b!1379063 m!1263921))

(declare-fun m!1263923 () Bool)

(assert (=> b!1379063 m!1263923))

(declare-fun m!1263925 () Bool)

(assert (=> b!1379063 m!1263925))

(declare-fun m!1263927 () Bool)

(assert (=> b!1379063 m!1263927))

(declare-fun m!1263929 () Bool)

(assert (=> b!1379063 m!1263929))

(declare-fun m!1263931 () Bool)

(assert (=> b!1379064 m!1263931))

(assert (=> b!1379064 m!1263931))

(declare-fun m!1263933 () Bool)

(assert (=> b!1379064 m!1263933))

(declare-fun m!1263935 () Bool)

(assert (=> start!117184 m!1263935))

(declare-fun m!1263937 () Bool)

(assert (=> b!1379060 m!1263937))

(declare-fun m!1263939 () Bool)

(assert (=> b!1379060 m!1263939))

(declare-fun m!1263941 () Bool)

(assert (=> b!1379060 m!1263941))

(declare-fun m!1263943 () Bool)

(assert (=> b!1379062 m!1263943))

(push 1)

(assert (not b!1379063))

(assert (not b!1379060))

(assert (not start!117184))

(assert (not b!1379062))

(assert (not b!1379064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

