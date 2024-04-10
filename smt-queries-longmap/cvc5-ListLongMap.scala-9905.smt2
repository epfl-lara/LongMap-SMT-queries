; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117174 () Bool)

(assert start!117174)

(declare-fun b!1378978 () Bool)

(declare-fun e!781164 () Bool)

(declare-fun e!781165 () Bool)

(assert (=> b!1378978 (= e!781164 e!781165)))

(declare-fun res!921512 () Bool)

(assert (=> b!1378978 (=> (not res!921512) (not e!781165))))

(declare-datatypes ((array!93791 0))(
  ( (array!93792 (arr!45296 (Array (_ BitVec 32) (_ BitVec 64))) (size!45846 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93791)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607037 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378978 (= res!921512 (= (arrayCountValidKeys!0 (array!93792 (store (arr!45296 a!4094) i!1451 k!2953) (size!45846 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!607037 #b00000000000000000000000000000001)))))

(assert (=> b!1378978 (= lt!607037 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921514 () Bool)

(assert (=> start!117174 (=> (not res!921514) (not e!781164))))

(assert (=> start!117174 (= res!921514 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45846 a!4094))))))

(assert (=> start!117174 e!781164))

(assert (=> start!117174 true))

(declare-fun array_inv!34324 (array!93791) Bool)

(assert (=> start!117174 (array_inv!34324 a!4094)))

(declare-fun b!1378979 () Bool)

(declare-fun res!921516 () Bool)

(assert (=> b!1378979 (=> (not res!921516) (not e!781164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378979 (= res!921516 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378980 () Bool)

(declare-fun res!921517 () Bool)

(assert (=> b!1378980 (=> (not res!921517) (not e!781165))))

(assert (=> b!1378980 (= res!921517 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1378981 () Bool)

(declare-fun res!921513 () Bool)

(assert (=> b!1378981 (=> (not res!921513) (not e!781164))))

(assert (=> b!1378981 (= res!921513 (and (bvslt (size!45846 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45846 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378982 () Bool)

(assert (=> b!1378982 (= e!781165 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(assert (=> b!1378982 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607037) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45819 0))(
  ( (Unit!45820) )
))
(declare-fun lt!607038 () Unit!45819)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45819)

(assert (=> b!1378982 (= lt!607038 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378983 () Bool)

(declare-fun res!921515 () Bool)

(assert (=> b!1378983 (=> (not res!921515) (not e!781164))))

(assert (=> b!1378983 (= res!921515 (validKeyInArray!0 (select (arr!45296 a!4094) i!1451)))))

(assert (= (and start!117174 res!921514) b!1378983))

(assert (= (and b!1378983 res!921515) b!1378979))

(assert (= (and b!1378979 res!921516) b!1378981))

(assert (= (and b!1378981 res!921513) b!1378978))

(assert (= (and b!1378978 res!921512) b!1378980))

(assert (= (and b!1378980 res!921517) b!1378982))

(declare-fun m!1263807 () Bool)

(assert (=> b!1378979 m!1263807))

(declare-fun m!1263809 () Bool)

(assert (=> b!1378983 m!1263809))

(assert (=> b!1378983 m!1263809))

(declare-fun m!1263811 () Bool)

(assert (=> b!1378983 m!1263811))

(declare-fun m!1263813 () Bool)

(assert (=> start!117174 m!1263813))

(declare-fun m!1263815 () Bool)

(assert (=> b!1378982 m!1263815))

(declare-fun m!1263817 () Bool)

(assert (=> b!1378982 m!1263817))

(declare-fun m!1263819 () Bool)

(assert (=> b!1378982 m!1263819))

(declare-fun m!1263821 () Bool)

(assert (=> b!1378978 m!1263821))

(declare-fun m!1263823 () Bool)

(assert (=> b!1378978 m!1263823))

(declare-fun m!1263825 () Bool)

(assert (=> b!1378978 m!1263825))

(push 1)

(assert (not start!117174))

(assert (not b!1378978))

(assert (not b!1378983))

(assert (not b!1378979))

(assert (not b!1378982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

