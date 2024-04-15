; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117062 () Bool)

(assert start!117062)

(declare-fun b!1378072 () Bool)

(declare-fun res!920649 () Bool)

(declare-fun e!780666 () Bool)

(assert (=> b!1378072 (=> (not res!920649) (not e!780666))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378072 (= res!920649 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1378073 () Bool)

(assert (=> b!1378073 (= e!780666 (not true))))

(declare-fun lt!606133 () (_ BitVec 32))

(declare-datatypes ((array!93633 0))(
  ( (array!93634 (arr!45217 (Array (_ BitVec 32) (_ BitVec 64))) (size!45769 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93633)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93633 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378073 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606133) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45588 0))(
  ( (Unit!45589) )
))
(declare-fun lt!606134 () Unit!45588)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45588)

(assert (=> b!1378073 (= lt!606134 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378074 () Bool)

(declare-fun res!920654 () Bool)

(declare-fun e!780665 () Bool)

(assert (=> b!1378074 (=> (not res!920654) (not e!780665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378074 (= res!920654 (validKeyInArray!0 (select (arr!45217 a!4094) i!1451)))))

(declare-fun b!1378075 () Bool)

(declare-fun res!920653 () Bool)

(assert (=> b!1378075 (=> (not res!920653) (not e!780665))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378075 (= res!920653 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378076 () Bool)

(declare-fun res!920651 () Bool)

(assert (=> b!1378076 (=> (not res!920651) (not e!780665))))

(assert (=> b!1378076 (= res!920651 (and (bvslt (size!45769 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45769 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378077 () Bool)

(assert (=> b!1378077 (= e!780665 e!780666)))

(declare-fun res!920652 () Bool)

(assert (=> b!1378077 (=> (not res!920652) (not e!780666))))

(assert (=> b!1378077 (= res!920652 (= (arrayCountValidKeys!0 (array!93634 (store (arr!45217 a!4094) i!1451 k0!2953) (size!45769 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!606133 #b00000000000000000000000000000001)))))

(assert (=> b!1378077 (= lt!606133 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!920650 () Bool)

(assert (=> start!117062 (=> (not res!920650) (not e!780665))))

(assert (=> start!117062 (= res!920650 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45769 a!4094))))))

(assert (=> start!117062 e!780665))

(assert (=> start!117062 true))

(declare-fun array_inv!34450 (array!93633) Bool)

(assert (=> start!117062 (array_inv!34450 a!4094)))

(assert (= (and start!117062 res!920650) b!1378074))

(assert (= (and b!1378074 res!920654) b!1378075))

(assert (= (and b!1378075 res!920653) b!1378076))

(assert (= (and b!1378076 res!920651) b!1378077))

(assert (= (and b!1378077 res!920652) b!1378072))

(assert (= (and b!1378072 res!920649) b!1378073))

(declare-fun m!1262079 () Bool)

(assert (=> b!1378077 m!1262079))

(declare-fun m!1262081 () Bool)

(assert (=> b!1378077 m!1262081))

(declare-fun m!1262083 () Bool)

(assert (=> b!1378077 m!1262083))

(declare-fun m!1262085 () Bool)

(assert (=> b!1378075 m!1262085))

(declare-fun m!1262087 () Bool)

(assert (=> b!1378074 m!1262087))

(assert (=> b!1378074 m!1262087))

(declare-fun m!1262089 () Bool)

(assert (=> b!1378074 m!1262089))

(declare-fun m!1262091 () Bool)

(assert (=> start!117062 m!1262091))

(declare-fun m!1262093 () Bool)

(assert (=> b!1378073 m!1262093))

(declare-fun m!1262095 () Bool)

(assert (=> b!1378073 m!1262095))

(declare-fun m!1262097 () Bool)

(assert (=> b!1378073 m!1262097))

(check-sat (not b!1378074) (not b!1378077) (not b!1378073) (not b!1378075) (not start!117062))
(check-sat)
