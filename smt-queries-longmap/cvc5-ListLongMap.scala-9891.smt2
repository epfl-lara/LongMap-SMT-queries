; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117090 () Bool)

(assert start!117090)

(declare-fun b!1378328 () Bool)

(declare-fun e!780804 () Bool)

(assert (=> b!1378328 (= e!780804 (not true))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606478 () (_ BitVec 32))

(declare-datatypes ((array!93707 0))(
  ( (array!93708 (arr!45254 (Array (_ BitVec 32) (_ BitVec 64))) (size!45804 (_ BitVec 32))) )
))
(declare-fun lt!606480 () array!93707)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93707 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378328 (= (bvadd (arrayCountValidKeys!0 lt!606480 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606478) (arrayCountValidKeys!0 lt!606480 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45771 0))(
  ( (Unit!45772) )
))
(declare-fun lt!606479 () Unit!45771)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45771)

(assert (=> b!1378328 (= lt!606479 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606480 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606476 () (_ BitVec 32))

(declare-fun a!4094 () array!93707)

(assert (=> b!1378328 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606476) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606477 () Unit!45771)

(assert (=> b!1378328 (= lt!606477 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378329 () Bool)

(declare-fun res!920863 () Bool)

(declare-fun e!780805 () Bool)

(assert (=> b!1378329 (=> (not res!920863) (not e!780805))))

(assert (=> b!1378329 (= res!920863 (and (bvslt (size!45804 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45804 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378330 () Bool)

(declare-fun res!920862 () Bool)

(assert (=> b!1378330 (=> (not res!920862) (not e!780805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378330 (= res!920862 (validKeyInArray!0 (select (arr!45254 a!4094) i!1451)))))

(declare-fun res!920865 () Bool)

(assert (=> start!117090 (=> (not res!920865) (not e!780805))))

(assert (=> start!117090 (= res!920865 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45804 a!4094))))))

(assert (=> start!117090 e!780805))

(assert (=> start!117090 true))

(declare-fun array_inv!34282 (array!93707) Bool)

(assert (=> start!117090 (array_inv!34282 a!4094)))

(declare-fun b!1378331 () Bool)

(declare-fun res!920864 () Bool)

(assert (=> b!1378331 (=> (not res!920864) (not e!780805))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378331 (= res!920864 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378332 () Bool)

(assert (=> b!1378332 (= e!780805 e!780804)))

(declare-fun res!920866 () Bool)

(assert (=> b!1378332 (=> (not res!920866) (not e!780804))))

(assert (=> b!1378332 (= res!920866 (and (= lt!606478 (bvsub lt!606476 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378332 (= lt!606478 (arrayCountValidKeys!0 lt!606480 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378332 (= lt!606476 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378332 (= lt!606480 (array!93708 (store (arr!45254 a!4094) i!1451 k!2953) (size!45804 a!4094)))))

(assert (= (and start!117090 res!920865) b!1378330))

(assert (= (and b!1378330 res!920862) b!1378331))

(assert (= (and b!1378331 res!920864) b!1378329))

(assert (= (and b!1378329 res!920863) b!1378332))

(assert (= (and b!1378332 res!920866) b!1378328))

(declare-fun m!1262877 () Bool)

(assert (=> b!1378332 m!1262877))

(declare-fun m!1262879 () Bool)

(assert (=> b!1378332 m!1262879))

(declare-fun m!1262881 () Bool)

(assert (=> b!1378332 m!1262881))

(declare-fun m!1262883 () Bool)

(assert (=> b!1378328 m!1262883))

(declare-fun m!1262885 () Bool)

(assert (=> b!1378328 m!1262885))

(declare-fun m!1262887 () Bool)

(assert (=> b!1378328 m!1262887))

(declare-fun m!1262889 () Bool)

(assert (=> b!1378328 m!1262889))

(declare-fun m!1262891 () Bool)

(assert (=> b!1378328 m!1262891))

(declare-fun m!1262893 () Bool)

(assert (=> b!1378328 m!1262893))

(declare-fun m!1262895 () Bool)

(assert (=> b!1378331 m!1262895))

(declare-fun m!1262897 () Bool)

(assert (=> b!1378330 m!1262897))

(assert (=> b!1378330 m!1262897))

(declare-fun m!1262899 () Bool)

(assert (=> b!1378330 m!1262899))

(declare-fun m!1262901 () Bool)

(assert (=> start!117090 m!1262901))

(push 1)

(assert (not start!117090))

(assert (not b!1378328))

(assert (not b!1378330))

(assert (not b!1378332))

(assert (not b!1378331))

(check-sat)

(pop 1)

