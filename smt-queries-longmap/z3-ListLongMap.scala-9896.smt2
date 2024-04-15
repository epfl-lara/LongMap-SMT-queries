; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117116 () Bool)

(assert start!117116)

(declare-fun b!1378504 () Bool)

(declare-fun e!780929 () Bool)

(declare-fun e!780928 () Bool)

(assert (=> b!1378504 (= e!780929 e!780928)))

(declare-fun res!921084 () Bool)

(assert (=> b!1378504 (=> (not res!921084) (not e!780928))))

(declare-fun lt!606618 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606620 () (_ BitVec 32))

(assert (=> b!1378504 (= res!921084 (and (= lt!606618 (bvsub lt!606620 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93687 0))(
  ( (array!93688 (arr!45244 (Array (_ BitVec 32) (_ BitVec 64))) (size!45796 (_ BitVec 32))) )
))
(declare-fun lt!606619 () array!93687)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93687 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378504 (= lt!606618 (arrayCountValidKeys!0 lt!606619 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93687)

(assert (=> b!1378504 (= lt!606620 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378504 (= lt!606619 (array!93688 (store (arr!45244 a!4094) i!1451 k0!2953) (size!45796 a!4094)))))

(declare-fun b!1378505 () Bool)

(declare-fun e!780931 () Bool)

(assert (=> b!1378505 (= e!780928 (not e!780931))))

(declare-fun res!921086 () Bool)

(assert (=> b!1378505 (=> res!921086 e!780931)))

(declare-fun lt!606624 () (_ BitVec 32))

(declare-fun lt!606617 () (_ BitVec 32))

(assert (=> b!1378505 (= res!921086 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45796 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606617 (bvsub lt!606624 #b00000000000000000000000000000001)))))))

(declare-fun lt!606623 () (_ BitVec 32))

(assert (=> b!1378505 (= (bvadd lt!606623 lt!606618) lt!606617)))

(assert (=> b!1378505 (= lt!606617 (arrayCountValidKeys!0 lt!606619 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378505 (= lt!606623 (arrayCountValidKeys!0 lt!606619 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45642 0))(
  ( (Unit!45643) )
))
(declare-fun lt!606625 () Unit!45642)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45642)

(assert (=> b!1378505 (= lt!606625 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606619 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606622 () (_ BitVec 32))

(assert (=> b!1378505 (= (bvadd lt!606622 lt!606620) lt!606624)))

(assert (=> b!1378505 (= lt!606624 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378505 (= lt!606622 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606621 () Unit!45642)

(assert (=> b!1378505 (= lt!606621 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378506 () Bool)

(declare-fun res!921085 () Bool)

(assert (=> b!1378506 (=> (not res!921085) (not e!780929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378506 (= res!921085 (validKeyInArray!0 (select (arr!45244 a!4094) i!1451)))))

(declare-fun b!1378507 () Bool)

(assert (=> b!1378507 (= e!780931 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378507 (= (arrayCountValidKeys!0 lt!606619 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!606626 () Unit!45642)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93687 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45642)

(assert (=> b!1378507 (= lt!606626 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun res!921081 () Bool)

(assert (=> start!117116 (=> (not res!921081) (not e!780929))))

(assert (=> start!117116 (= res!921081 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45796 a!4094))))))

(assert (=> start!117116 e!780929))

(assert (=> start!117116 true))

(declare-fun array_inv!34477 (array!93687) Bool)

(assert (=> start!117116 (array_inv!34477 a!4094)))

(declare-fun b!1378508 () Bool)

(declare-fun res!921082 () Bool)

(assert (=> b!1378508 (=> (not res!921082) (not e!780929))))

(assert (=> b!1378508 (= res!921082 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378509 () Bool)

(declare-fun res!921083 () Bool)

(assert (=> b!1378509 (=> (not res!921083) (not e!780929))))

(assert (=> b!1378509 (= res!921083 (and (bvslt (size!45796 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45796 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117116 res!921081) b!1378506))

(assert (= (and b!1378506 res!921085) b!1378508))

(assert (= (and b!1378508 res!921082) b!1378509))

(assert (= (and b!1378509 res!921083) b!1378504))

(assert (= (and b!1378504 res!921084) b!1378505))

(assert (= (and b!1378505 (not res!921086)) b!1378507))

(declare-fun m!1262799 () Bool)

(assert (=> b!1378504 m!1262799))

(declare-fun m!1262801 () Bool)

(assert (=> b!1378504 m!1262801))

(declare-fun m!1262803 () Bool)

(assert (=> b!1378504 m!1262803))

(declare-fun m!1262805 () Bool)

(assert (=> b!1378508 m!1262805))

(declare-fun m!1262807 () Bool)

(assert (=> b!1378507 m!1262807))

(declare-fun m!1262809 () Bool)

(assert (=> b!1378507 m!1262809))

(declare-fun m!1262811 () Bool)

(assert (=> b!1378507 m!1262811))

(declare-fun m!1262813 () Bool)

(assert (=> start!117116 m!1262813))

(declare-fun m!1262815 () Bool)

(assert (=> b!1378506 m!1262815))

(assert (=> b!1378506 m!1262815))

(declare-fun m!1262817 () Bool)

(assert (=> b!1378506 m!1262817))

(declare-fun m!1262819 () Bool)

(assert (=> b!1378505 m!1262819))

(declare-fun m!1262821 () Bool)

(assert (=> b!1378505 m!1262821))

(declare-fun m!1262823 () Bool)

(assert (=> b!1378505 m!1262823))

(declare-fun m!1262825 () Bool)

(assert (=> b!1378505 m!1262825))

(declare-fun m!1262827 () Bool)

(assert (=> b!1378505 m!1262827))

(declare-fun m!1262829 () Bool)

(assert (=> b!1378505 m!1262829))

(check-sat (not b!1378505) (not b!1378508) (not start!117116) (not b!1378504) (not b!1378506) (not b!1378507))
(check-sat)
