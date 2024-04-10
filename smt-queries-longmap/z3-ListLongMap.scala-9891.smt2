; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117092 () Bool)

(assert start!117092)

(declare-fun b!1378343 () Bool)

(declare-fun e!780815 () Bool)

(declare-fun e!780813 () Bool)

(assert (=> b!1378343 (= e!780815 e!780813)))

(declare-fun res!920881 () Bool)

(assert (=> b!1378343 (=> (not res!920881) (not e!780813))))

(declare-fun lt!606493 () (_ BitVec 32))

(declare-fun lt!606492 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378343 (= res!920881 (and (= lt!606493 (bvsub lt!606492 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93709 0))(
  ( (array!93710 (arr!45255 (Array (_ BitVec 32) (_ BitVec 64))) (size!45805 (_ BitVec 32))) )
))
(declare-fun lt!606495 () array!93709)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93709 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378343 (= lt!606493 (arrayCountValidKeys!0 lt!606495 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93709)

(assert (=> b!1378343 (= lt!606492 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378343 (= lt!606495 (array!93710 (store (arr!45255 a!4094) i!1451 k0!2953) (size!45805 a!4094)))))

(declare-fun b!1378344 () Bool)

(declare-fun res!920878 () Bool)

(assert (=> b!1378344 (=> (not res!920878) (not e!780815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378344 (= res!920878 (validKeyInArray!0 (select (arr!45255 a!4094) i!1451)))))

(declare-fun b!1378345 () Bool)

(declare-fun res!920880 () Bool)

(assert (=> b!1378345 (=> (not res!920880) (not e!780815))))

(assert (=> b!1378345 (= res!920880 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378346 () Bool)

(declare-fun res!920879 () Bool)

(assert (=> b!1378346 (=> (not res!920879) (not e!780815))))

(assert (=> b!1378346 (= res!920879 (and (bvslt (size!45805 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45805 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378347 () Bool)

(assert (=> b!1378347 (= e!780813 (not true))))

(assert (=> b!1378347 (= (bvadd (arrayCountValidKeys!0 lt!606495 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606493) (arrayCountValidKeys!0 lt!606495 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45773 0))(
  ( (Unit!45774) )
))
(declare-fun lt!606494 () Unit!45773)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45773)

(assert (=> b!1378347 (= lt!606494 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606495 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378347 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606492) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606491 () Unit!45773)

(assert (=> b!1378347 (= lt!606491 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!920877 () Bool)

(assert (=> start!117092 (=> (not res!920877) (not e!780815))))

(assert (=> start!117092 (= res!920877 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45805 a!4094))))))

(assert (=> start!117092 e!780815))

(assert (=> start!117092 true))

(declare-fun array_inv!34283 (array!93709) Bool)

(assert (=> start!117092 (array_inv!34283 a!4094)))

(assert (= (and start!117092 res!920877) b!1378344))

(assert (= (and b!1378344 res!920878) b!1378345))

(assert (= (and b!1378345 res!920880) b!1378346))

(assert (= (and b!1378346 res!920879) b!1378343))

(assert (= (and b!1378343 res!920881) b!1378347))

(declare-fun m!1262903 () Bool)

(assert (=> b!1378343 m!1262903))

(declare-fun m!1262905 () Bool)

(assert (=> b!1378343 m!1262905))

(declare-fun m!1262907 () Bool)

(assert (=> b!1378343 m!1262907))

(declare-fun m!1262909 () Bool)

(assert (=> start!117092 m!1262909))

(declare-fun m!1262911 () Bool)

(assert (=> b!1378345 m!1262911))

(declare-fun m!1262913 () Bool)

(assert (=> b!1378344 m!1262913))

(assert (=> b!1378344 m!1262913))

(declare-fun m!1262915 () Bool)

(assert (=> b!1378344 m!1262915))

(declare-fun m!1262917 () Bool)

(assert (=> b!1378347 m!1262917))

(declare-fun m!1262919 () Bool)

(assert (=> b!1378347 m!1262919))

(declare-fun m!1262921 () Bool)

(assert (=> b!1378347 m!1262921))

(declare-fun m!1262923 () Bool)

(assert (=> b!1378347 m!1262923))

(declare-fun m!1262925 () Bool)

(assert (=> b!1378347 m!1262925))

(declare-fun m!1262927 () Bool)

(assert (=> b!1378347 m!1262927))

(check-sat (not b!1378345) (not b!1378343) (not start!117092) (not b!1378344) (not b!1378347))
(check-sat)
