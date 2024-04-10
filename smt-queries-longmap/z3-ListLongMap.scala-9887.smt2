; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117068 () Bool)

(assert start!117068)

(declare-fun b!1378159 () Bool)

(declare-fun res!920697 () Bool)

(declare-fun e!780706 () Bool)

(assert (=> b!1378159 (=> (not res!920697) (not e!780706))))

(declare-datatypes ((array!93685 0))(
  ( (array!93686 (arr!45243 (Array (_ BitVec 32) (_ BitVec 64))) (size!45793 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93685)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378159 (= res!920697 (validKeyInArray!0 (select (arr!45243 a!4094) i!1451)))))

(declare-fun b!1378160 () Bool)

(declare-fun res!920694 () Bool)

(assert (=> b!1378160 (=> (not res!920694) (not e!780706))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378160 (= res!920694 (and (bvslt (size!45793 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45793 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378161 () Bool)

(declare-fun e!780707 () Bool)

(assert (=> b!1378161 (= e!780706 e!780707)))

(declare-fun res!920695 () Bool)

(assert (=> b!1378161 (=> (not res!920695) (not e!780707))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun lt!606323 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93685 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378161 (= res!920695 (= (arrayCountValidKeys!0 (array!93686 (store (arr!45243 a!4094) i!1451 k0!2953) (size!45793 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!606323 #b00000000000000000000000000000001)))))

(assert (=> b!1378161 (= lt!606323 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378162 () Bool)

(declare-fun res!920698 () Bool)

(assert (=> b!1378162 (=> (not res!920698) (not e!780706))))

(assert (=> b!1378162 (= res!920698 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!920693 () Bool)

(assert (=> start!117068 (=> (not res!920693) (not e!780706))))

(assert (=> start!117068 (= res!920693 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45793 a!4094))))))

(assert (=> start!117068 e!780706))

(assert (=> start!117068 true))

(declare-fun array_inv!34271 (array!93685) Bool)

(assert (=> start!117068 (array_inv!34271 a!4094)))

(declare-fun b!1378163 () Bool)

(assert (=> b!1378163 (= e!780707 (not true))))

(assert (=> b!1378163 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606323) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45749 0))(
  ( (Unit!45750) )
))
(declare-fun lt!606324 () Unit!45749)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45749)

(assert (=> b!1378163 (= lt!606324 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378164 () Bool)

(declare-fun res!920696 () Bool)

(assert (=> b!1378164 (=> (not res!920696) (not e!780707))))

(assert (=> b!1378164 (= res!920696 (bvsgt from!3466 #b00000000000000000000000000000000))))

(assert (= (and start!117068 res!920693) b!1378159))

(assert (= (and b!1378159 res!920697) b!1378162))

(assert (= (and b!1378162 res!920698) b!1378160))

(assert (= (and b!1378160 res!920694) b!1378161))

(assert (= (and b!1378161 res!920695) b!1378164))

(assert (= (and b!1378164 res!920696) b!1378163))

(declare-fun m!1262603 () Bool)

(assert (=> b!1378159 m!1262603))

(assert (=> b!1378159 m!1262603))

(declare-fun m!1262605 () Bool)

(assert (=> b!1378159 m!1262605))

(declare-fun m!1262607 () Bool)

(assert (=> b!1378161 m!1262607))

(declare-fun m!1262609 () Bool)

(assert (=> b!1378161 m!1262609))

(declare-fun m!1262611 () Bool)

(assert (=> b!1378161 m!1262611))

(declare-fun m!1262613 () Bool)

(assert (=> start!117068 m!1262613))

(declare-fun m!1262615 () Bool)

(assert (=> b!1378163 m!1262615))

(declare-fun m!1262617 () Bool)

(assert (=> b!1378163 m!1262617))

(declare-fun m!1262619 () Bool)

(assert (=> b!1378163 m!1262619))

(declare-fun m!1262621 () Bool)

(assert (=> b!1378162 m!1262621))

(check-sat (not b!1378162) (not start!117068) (not b!1378163) (not b!1378159) (not b!1378161))
(check-sat)
