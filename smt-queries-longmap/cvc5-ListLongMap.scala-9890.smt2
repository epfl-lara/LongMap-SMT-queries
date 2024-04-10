; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117084 () Bool)

(assert start!117084)

(declare-fun res!920820 () Bool)

(declare-fun e!780778 () Bool)

(assert (=> start!117084 (=> (not res!920820) (not e!780778))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93701 0))(
  ( (array!93702 (arr!45251 (Array (_ BitVec 32) (_ BitVec 64))) (size!45801 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93701)

(assert (=> start!117084 (= res!920820 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45801 a!4094))))))

(assert (=> start!117084 e!780778))

(assert (=> start!117084 true))

(declare-fun array_inv!34279 (array!93701) Bool)

(assert (=> start!117084 (array_inv!34279 a!4094)))

(declare-fun b!1378283 () Bool)

(declare-fun res!920819 () Bool)

(assert (=> b!1378283 (=> (not res!920819) (not e!780778))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378283 (= res!920819 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378284 () Bool)

(declare-fun e!780779 () Bool)

(assert (=> b!1378284 (= e!780778 e!780779)))

(declare-fun res!920818 () Bool)

(assert (=> b!1378284 (=> (not res!920818) (not e!780779))))

(declare-fun lt!606433 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606432 () (_ BitVec 32))

(assert (=> b!1378284 (= res!920818 (and (= lt!606433 (bvsub lt!606432 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606431 () array!93701)

(declare-fun arrayCountValidKeys!0 (array!93701 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378284 (= lt!606433 (arrayCountValidKeys!0 lt!606431 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378284 (= lt!606432 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378284 (= lt!606431 (array!93702 (store (arr!45251 a!4094) i!1451 k!2953) (size!45801 a!4094)))))

(declare-fun b!1378285 () Bool)

(declare-fun res!920821 () Bool)

(assert (=> b!1378285 (=> (not res!920821) (not e!780778))))

(assert (=> b!1378285 (= res!920821 (validKeyInArray!0 (select (arr!45251 a!4094) i!1451)))))

(declare-fun b!1378286 () Bool)

(assert (=> b!1378286 (= e!780779 (not true))))

(assert (=> b!1378286 (= (bvadd (arrayCountValidKeys!0 lt!606431 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606433) (arrayCountValidKeys!0 lt!606431 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45765 0))(
  ( (Unit!45766) )
))
(declare-fun lt!606434 () Unit!45765)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45765)

(assert (=> b!1378286 (= lt!606434 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606431 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378286 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606432) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606435 () Unit!45765)

(assert (=> b!1378286 (= lt!606435 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378287 () Bool)

(declare-fun res!920817 () Bool)

(assert (=> b!1378287 (=> (not res!920817) (not e!780778))))

(assert (=> b!1378287 (= res!920817 (and (bvslt (size!45801 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45801 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117084 res!920820) b!1378285))

(assert (= (and b!1378285 res!920821) b!1378283))

(assert (= (and b!1378283 res!920819) b!1378287))

(assert (= (and b!1378287 res!920817) b!1378284))

(assert (= (and b!1378284 res!920818) b!1378286))

(declare-fun m!1262799 () Bool)

(assert (=> b!1378284 m!1262799))

(declare-fun m!1262801 () Bool)

(assert (=> b!1378284 m!1262801))

(declare-fun m!1262803 () Bool)

(assert (=> b!1378284 m!1262803))

(declare-fun m!1262805 () Bool)

(assert (=> b!1378283 m!1262805))

(declare-fun m!1262807 () Bool)

(assert (=> b!1378286 m!1262807))

(declare-fun m!1262809 () Bool)

(assert (=> b!1378286 m!1262809))

(declare-fun m!1262811 () Bool)

(assert (=> b!1378286 m!1262811))

(declare-fun m!1262813 () Bool)

(assert (=> b!1378286 m!1262813))

(declare-fun m!1262815 () Bool)

(assert (=> b!1378286 m!1262815))

(declare-fun m!1262817 () Bool)

(assert (=> b!1378286 m!1262817))

(declare-fun m!1262819 () Bool)

(assert (=> start!117084 m!1262819))

(declare-fun m!1262821 () Bool)

(assert (=> b!1378285 m!1262821))

(assert (=> b!1378285 m!1262821))

(declare-fun m!1262823 () Bool)

(assert (=> b!1378285 m!1262823))

(push 1)

(assert (not b!1378286))

(assert (not b!1378283))

(assert (not start!117084))

(assert (not b!1378285))

(assert (not b!1378284))

(check-sat)

(pop 1)

