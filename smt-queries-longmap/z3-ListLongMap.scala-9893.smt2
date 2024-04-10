; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117104 () Bool)

(assert start!117104)

(declare-fun res!920970 () Bool)

(declare-fun e!780868 () Bool)

(assert (=> start!117104 (=> (not res!920970) (not e!780868))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93721 0))(
  ( (array!93722 (arr!45261 (Array (_ BitVec 32) (_ BitVec 64))) (size!45811 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93721)

(assert (=> start!117104 (= res!920970 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45811 a!4094))))))

(assert (=> start!117104 e!780868))

(assert (=> start!117104 true))

(declare-fun array_inv!34289 (array!93721) Bool)

(assert (=> start!117104 (array_inv!34289 a!4094)))

(declare-fun b!1378433 () Bool)

(declare-fun res!920971 () Bool)

(assert (=> b!1378433 (=> (not res!920971) (not e!780868))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378433 (= res!920971 (and (bvslt (size!45811 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45811 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378434 () Bool)

(declare-fun res!920968 () Bool)

(assert (=> b!1378434 (=> (not res!920968) (not e!780868))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378434 (= res!920968 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378435 () Bool)

(declare-fun res!920967 () Bool)

(assert (=> b!1378435 (=> (not res!920967) (not e!780868))))

(assert (=> b!1378435 (= res!920967 (validKeyInArray!0 (select (arr!45261 a!4094) i!1451)))))

(declare-fun b!1378436 () Bool)

(declare-fun e!780869 () Bool)

(assert (=> b!1378436 (= e!780869 (not true))))

(declare-fun lt!606583 () array!93721)

(declare-fun lt!606584 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93721 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378436 (= (bvadd (arrayCountValidKeys!0 lt!606583 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606584) (arrayCountValidKeys!0 lt!606583 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45785 0))(
  ( (Unit!45786) )
))
(declare-fun lt!606585 () Unit!45785)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45785)

(assert (=> b!1378436 (= lt!606585 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606583 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606581 () (_ BitVec 32))

(assert (=> b!1378436 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606581) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606582 () Unit!45785)

(assert (=> b!1378436 (= lt!606582 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378437 () Bool)

(assert (=> b!1378437 (= e!780868 e!780869)))

(declare-fun res!920969 () Bool)

(assert (=> b!1378437 (=> (not res!920969) (not e!780869))))

(assert (=> b!1378437 (= res!920969 (and (= lt!606584 (bvsub lt!606581 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378437 (= lt!606584 (arrayCountValidKeys!0 lt!606583 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378437 (= lt!606581 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378437 (= lt!606583 (array!93722 (store (arr!45261 a!4094) i!1451 k0!2953) (size!45811 a!4094)))))

(assert (= (and start!117104 res!920970) b!1378435))

(assert (= (and b!1378435 res!920967) b!1378434))

(assert (= (and b!1378434 res!920968) b!1378433))

(assert (= (and b!1378433 res!920971) b!1378437))

(assert (= (and b!1378437 res!920969) b!1378436))

(declare-fun m!1263059 () Bool)

(assert (=> b!1378435 m!1263059))

(assert (=> b!1378435 m!1263059))

(declare-fun m!1263061 () Bool)

(assert (=> b!1378435 m!1263061))

(declare-fun m!1263063 () Bool)

(assert (=> start!117104 m!1263063))

(declare-fun m!1263065 () Bool)

(assert (=> b!1378436 m!1263065))

(declare-fun m!1263067 () Bool)

(assert (=> b!1378436 m!1263067))

(declare-fun m!1263069 () Bool)

(assert (=> b!1378436 m!1263069))

(declare-fun m!1263071 () Bool)

(assert (=> b!1378436 m!1263071))

(declare-fun m!1263073 () Bool)

(assert (=> b!1378436 m!1263073))

(declare-fun m!1263075 () Bool)

(assert (=> b!1378436 m!1263075))

(declare-fun m!1263077 () Bool)

(assert (=> b!1378434 m!1263077))

(declare-fun m!1263079 () Bool)

(assert (=> b!1378437 m!1263079))

(declare-fun m!1263081 () Bool)

(assert (=> b!1378437 m!1263081))

(declare-fun m!1263083 () Bool)

(assert (=> b!1378437 m!1263083))

(check-sat (not b!1378435) (not b!1378434) (not b!1378437) (not start!117104) (not b!1378436))
(check-sat)
