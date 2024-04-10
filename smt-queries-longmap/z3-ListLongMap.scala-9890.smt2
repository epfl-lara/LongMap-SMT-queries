; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117086 () Bool)

(assert start!117086)

(declare-fun b!1378298 () Bool)

(declare-fun res!920835 () Bool)

(declare-fun e!780786 () Bool)

(assert (=> b!1378298 (=> (not res!920835) (not e!780786))))

(declare-datatypes ((array!93703 0))(
  ( (array!93704 (arr!45252 (Array (_ BitVec 32) (_ BitVec 64))) (size!45802 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93703)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378298 (= res!920835 (validKeyInArray!0 (select (arr!45252 a!4094) i!1451)))))

(declare-fun b!1378299 () Bool)

(declare-fun res!920834 () Bool)

(assert (=> b!1378299 (=> (not res!920834) (not e!780786))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378299 (= res!920834 (and (bvslt (size!45802 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45802 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378301 () Bool)

(declare-fun res!920833 () Bool)

(assert (=> b!1378301 (=> (not res!920833) (not e!780786))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378301 (= res!920833 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378302 () Bool)

(declare-fun e!780788 () Bool)

(assert (=> b!1378302 (= e!780786 e!780788)))

(declare-fun res!920836 () Bool)

(assert (=> b!1378302 (=> (not res!920836) (not e!780788))))

(declare-fun lt!606449 () (_ BitVec 32))

(declare-fun lt!606450 () (_ BitVec 32))

(assert (=> b!1378302 (= res!920836 (and (= lt!606450 (bvsub lt!606449 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606446 () array!93703)

(declare-fun arrayCountValidKeys!0 (array!93703 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378302 (= lt!606450 (arrayCountValidKeys!0 lt!606446 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378302 (= lt!606449 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378302 (= lt!606446 (array!93704 (store (arr!45252 a!4094) i!1451 k0!2953) (size!45802 a!4094)))))

(declare-fun res!920832 () Bool)

(assert (=> start!117086 (=> (not res!920832) (not e!780786))))

(assert (=> start!117086 (= res!920832 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45802 a!4094))))))

(assert (=> start!117086 e!780786))

(assert (=> start!117086 true))

(declare-fun array_inv!34280 (array!93703) Bool)

(assert (=> start!117086 (array_inv!34280 a!4094)))

(declare-fun b!1378300 () Bool)

(assert (=> b!1378300 (= e!780788 (not true))))

(assert (=> b!1378300 (= (bvadd (arrayCountValidKeys!0 lt!606446 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606450) (arrayCountValidKeys!0 lt!606446 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45767 0))(
  ( (Unit!45768) )
))
(declare-fun lt!606448 () Unit!45767)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45767)

(assert (=> b!1378300 (= lt!606448 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606446 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378300 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606449) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606447 () Unit!45767)

(assert (=> b!1378300 (= lt!606447 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117086 res!920832) b!1378298))

(assert (= (and b!1378298 res!920835) b!1378301))

(assert (= (and b!1378301 res!920833) b!1378299))

(assert (= (and b!1378299 res!920834) b!1378302))

(assert (= (and b!1378302 res!920836) b!1378300))

(declare-fun m!1262825 () Bool)

(assert (=> b!1378298 m!1262825))

(assert (=> b!1378298 m!1262825))

(declare-fun m!1262827 () Bool)

(assert (=> b!1378298 m!1262827))

(declare-fun m!1262829 () Bool)

(assert (=> b!1378302 m!1262829))

(declare-fun m!1262831 () Bool)

(assert (=> b!1378302 m!1262831))

(declare-fun m!1262833 () Bool)

(assert (=> b!1378302 m!1262833))

(declare-fun m!1262835 () Bool)

(assert (=> b!1378300 m!1262835))

(declare-fun m!1262837 () Bool)

(assert (=> b!1378300 m!1262837))

(declare-fun m!1262839 () Bool)

(assert (=> b!1378300 m!1262839))

(declare-fun m!1262841 () Bool)

(assert (=> b!1378300 m!1262841))

(declare-fun m!1262843 () Bool)

(assert (=> b!1378300 m!1262843))

(declare-fun m!1262845 () Bool)

(assert (=> b!1378300 m!1262845))

(declare-fun m!1262847 () Bool)

(assert (=> b!1378301 m!1262847))

(declare-fun m!1262849 () Bool)

(assert (=> start!117086 m!1262849))

(check-sat (not start!117086) (not b!1378300) (not b!1378301) (not b!1378298) (not b!1378302))
(check-sat)
