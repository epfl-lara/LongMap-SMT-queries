; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117178 () Bool)

(assert start!117178)

(declare-fun b!1378976 () Bool)

(declare-fun res!921554 () Bool)

(declare-fun e!781169 () Bool)

(assert (=> b!1378976 (=> (not res!921554) (not e!781169))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378976 (= res!921554 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378977 () Bool)

(declare-fun e!781171 () Bool)

(assert (=> b!1378977 (= e!781169 e!781171)))

(declare-fun res!921557 () Bool)

(assert (=> b!1378977 (=> (not res!921557) (not e!781171))))

(declare-fun lt!606896 () (_ BitVec 32))

(declare-fun lt!606895 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378977 (= res!921557 (and (= lt!606896 (bvsub lt!606895 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93749 0))(
  ( (array!93750 (arr!45275 (Array (_ BitVec 32) (_ BitVec 64))) (size!45827 (_ BitVec 32))) )
))
(declare-fun lt!606893 () array!93749)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378977 (= lt!606896 (arrayCountValidKeys!0 lt!606893 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93749)

(assert (=> b!1378977 (= lt!606895 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378977 (= lt!606893 (array!93750 (store (arr!45275 a!4094) i!1451 k!2953) (size!45827 a!4094)))))

(declare-fun b!1378978 () Bool)

(assert (=> b!1378978 (= e!781171 (not true))))

(assert (=> b!1378978 (= (bvadd (arrayCountValidKeys!0 lt!606893 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606896) (arrayCountValidKeys!0 lt!606893 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45668 0))(
  ( (Unit!45669) )
))
(declare-fun lt!606892 () Unit!45668)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45668)

(assert (=> b!1378978 (= lt!606892 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606893 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378978 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606895) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606894 () Unit!45668)

(assert (=> b!1378978 (= lt!606894 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378980 () Bool)

(declare-fun res!921553 () Bool)

(assert (=> b!1378980 (=> (not res!921553) (not e!781169))))

(assert (=> b!1378980 (= res!921553 (validKeyInArray!0 (select (arr!45275 a!4094) i!1451)))))

(declare-fun b!1378979 () Bool)

(declare-fun res!921555 () Bool)

(assert (=> b!1378979 (=> (not res!921555) (not e!781169))))

(assert (=> b!1378979 (= res!921555 (and (bvslt (size!45827 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45827 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921556 () Bool)

(assert (=> start!117178 (=> (not res!921556) (not e!781169))))

(assert (=> start!117178 (= res!921556 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45827 a!4094))))))

(assert (=> start!117178 e!781169))

(assert (=> start!117178 true))

(declare-fun array_inv!34508 (array!93749) Bool)

(assert (=> start!117178 (array_inv!34508 a!4094)))

(assert (= (and start!117178 res!921556) b!1378980))

(assert (= (and b!1378980 res!921553) b!1378976))

(assert (= (and b!1378976 res!921554) b!1378979))

(assert (= (and b!1378979 res!921555) b!1378977))

(assert (= (and b!1378977 res!921557) b!1378978))

(declare-fun m!1263389 () Bool)

(assert (=> b!1378980 m!1263389))

(assert (=> b!1378980 m!1263389))

(declare-fun m!1263391 () Bool)

(assert (=> b!1378980 m!1263391))

(declare-fun m!1263393 () Bool)

(assert (=> b!1378978 m!1263393))

(declare-fun m!1263395 () Bool)

(assert (=> b!1378978 m!1263395))

(declare-fun m!1263397 () Bool)

(assert (=> b!1378978 m!1263397))

(declare-fun m!1263399 () Bool)

(assert (=> b!1378978 m!1263399))

(declare-fun m!1263401 () Bool)

(assert (=> b!1378978 m!1263401))

(declare-fun m!1263403 () Bool)

(assert (=> b!1378978 m!1263403))

(declare-fun m!1263405 () Bool)

(assert (=> b!1378977 m!1263405))

(declare-fun m!1263407 () Bool)

(assert (=> b!1378977 m!1263407))

(declare-fun m!1263409 () Bool)

(assert (=> b!1378977 m!1263409))

(declare-fun m!1263411 () Bool)

(assert (=> start!117178 m!1263411))

(declare-fun m!1263413 () Bool)

(assert (=> b!1378976 m!1263413))

(push 1)

(assert (not b!1378978))

(assert (not start!117178))

(assert (not b!1378976))

(assert (not b!1378980))

(assert (not b!1378977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

