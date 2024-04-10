; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117176 () Bool)

(assert start!117176)

(declare-fun b!1378996 () Bool)

(declare-fun e!781175 () Bool)

(declare-fun e!781174 () Bool)

(assert (=> b!1378996 (= e!781175 e!781174)))

(declare-fun res!921532 () Bool)

(assert (=> b!1378996 (=> (not res!921532) (not e!781174))))

(declare-datatypes ((array!93793 0))(
  ( (array!93794 (arr!45297 (Array (_ BitVec 32) (_ BitVec 64))) (size!45847 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93793)

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607044 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93793 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378996 (= res!921532 (= (arrayCountValidKeys!0 (array!93794 (store (arr!45297 a!4094) i!1451 k0!2953) (size!45847 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!607044 #b00000000000000000000000000000001)))))

(assert (=> b!1378996 (= lt!607044 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378997 () Bool)

(declare-fun res!921535 () Bool)

(assert (=> b!1378997 (=> (not res!921535) (not e!781174))))

(assert (=> b!1378997 (= res!921535 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1378998 () Bool)

(declare-fun res!921533 () Bool)

(assert (=> b!1378998 (=> (not res!921533) (not e!781175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378998 (= res!921533 (validKeyInArray!0 (select (arr!45297 a!4094) i!1451)))))

(declare-fun b!1378999 () Bool)

(assert (=> b!1378999 (= e!781174 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(assert (=> b!1378999 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607044) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45821 0))(
  ( (Unit!45822) )
))
(declare-fun lt!607043 () Unit!45821)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45821)

(assert (=> b!1378999 (= lt!607043 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379000 () Bool)

(declare-fun res!921534 () Bool)

(assert (=> b!1379000 (=> (not res!921534) (not e!781175))))

(assert (=> b!1379000 (= res!921534 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379001 () Bool)

(declare-fun res!921530 () Bool)

(assert (=> b!1379001 (=> (not res!921530) (not e!781175))))

(assert (=> b!1379001 (= res!921530 (and (bvslt (size!45847 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45847 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921531 () Bool)

(assert (=> start!117176 (=> (not res!921531) (not e!781175))))

(assert (=> start!117176 (= res!921531 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45847 a!4094))))))

(assert (=> start!117176 e!781175))

(assert (=> start!117176 true))

(declare-fun array_inv!34325 (array!93793) Bool)

(assert (=> start!117176 (array_inv!34325 a!4094)))

(assert (= (and start!117176 res!921531) b!1378998))

(assert (= (and b!1378998 res!921533) b!1379000))

(assert (= (and b!1379000 res!921534) b!1379001))

(assert (= (and b!1379001 res!921530) b!1378996))

(assert (= (and b!1378996 res!921532) b!1378997))

(assert (= (and b!1378997 res!921535) b!1378999))

(declare-fun m!1263827 () Bool)

(assert (=> b!1378999 m!1263827))

(declare-fun m!1263829 () Bool)

(assert (=> b!1378999 m!1263829))

(declare-fun m!1263831 () Bool)

(assert (=> b!1378999 m!1263831))

(declare-fun m!1263833 () Bool)

(assert (=> start!117176 m!1263833))

(declare-fun m!1263835 () Bool)

(assert (=> b!1378996 m!1263835))

(declare-fun m!1263837 () Bool)

(assert (=> b!1378996 m!1263837))

(declare-fun m!1263839 () Bool)

(assert (=> b!1378996 m!1263839))

(declare-fun m!1263841 () Bool)

(assert (=> b!1378998 m!1263841))

(assert (=> b!1378998 m!1263841))

(declare-fun m!1263843 () Bool)

(assert (=> b!1378998 m!1263843))

(declare-fun m!1263845 () Bool)

(assert (=> b!1379000 m!1263845))

(check-sat (not b!1378999) (not b!1378996) (not b!1379000) (not start!117176) (not b!1378998))
(check-sat)
