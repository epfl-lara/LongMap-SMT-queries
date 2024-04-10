; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117100 () Bool)

(assert start!117100)

(declare-fun b!1378403 () Bool)

(declare-fun e!780849 () Bool)

(declare-fun e!780850 () Bool)

(assert (=> b!1378403 (= e!780849 e!780850)))

(declare-fun res!920938 () Bool)

(assert (=> b!1378403 (=> (not res!920938) (not e!780850))))

(declare-fun lt!606551 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606553 () (_ BitVec 32))

(assert (=> b!1378403 (= res!920938 (and (= lt!606553 (bvsub lt!606551 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93717 0))(
  ( (array!93718 (arr!45259 (Array (_ BitVec 32) (_ BitVec 64))) (size!45809 (_ BitVec 32))) )
))
(declare-fun lt!606555 () array!93717)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93717 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378403 (= lt!606553 (arrayCountValidKeys!0 lt!606555 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93717)

(assert (=> b!1378403 (= lt!606551 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378403 (= lt!606555 (array!93718 (store (arr!45259 a!4094) i!1451 k!2953) (size!45809 a!4094)))))

(declare-fun b!1378404 () Bool)

(declare-fun res!920939 () Bool)

(assert (=> b!1378404 (=> (not res!920939) (not e!780849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378404 (= res!920939 (validKeyInArray!0 (select (arr!45259 a!4094) i!1451)))))

(declare-fun b!1378405 () Bool)

(assert (=> b!1378405 (= e!780850 (not true))))

(assert (=> b!1378405 (= (bvadd (arrayCountValidKeys!0 lt!606555 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606553) (arrayCountValidKeys!0 lt!606555 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45781 0))(
  ( (Unit!45782) )
))
(declare-fun lt!606554 () Unit!45781)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45781)

(assert (=> b!1378405 (= lt!606554 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606555 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378405 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606551) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606552 () Unit!45781)

(assert (=> b!1378405 (= lt!606552 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378407 () Bool)

(declare-fun res!920941 () Bool)

(assert (=> b!1378407 (=> (not res!920941) (not e!780849))))

(assert (=> b!1378407 (= res!920941 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378406 () Bool)

(declare-fun res!920940 () Bool)

(assert (=> b!1378406 (=> (not res!920940) (not e!780849))))

(assert (=> b!1378406 (= res!920940 (and (bvslt (size!45809 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45809 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!920937 () Bool)

(assert (=> start!117100 (=> (not res!920937) (not e!780849))))

(assert (=> start!117100 (= res!920937 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45809 a!4094))))))

(assert (=> start!117100 e!780849))

(assert (=> start!117100 true))

(declare-fun array_inv!34287 (array!93717) Bool)

(assert (=> start!117100 (array_inv!34287 a!4094)))

(assert (= (and start!117100 res!920937) b!1378404))

(assert (= (and b!1378404 res!920939) b!1378407))

(assert (= (and b!1378407 res!920941) b!1378406))

(assert (= (and b!1378406 res!920940) b!1378403))

(assert (= (and b!1378403 res!920938) b!1378405))

(declare-fun m!1263007 () Bool)

(assert (=> b!1378407 m!1263007))

(declare-fun m!1263009 () Bool)

(assert (=> b!1378405 m!1263009))

(declare-fun m!1263011 () Bool)

(assert (=> b!1378405 m!1263011))

(declare-fun m!1263013 () Bool)

(assert (=> b!1378405 m!1263013))

(declare-fun m!1263015 () Bool)

(assert (=> b!1378405 m!1263015))

(declare-fun m!1263017 () Bool)

(assert (=> b!1378405 m!1263017))

(declare-fun m!1263019 () Bool)

(assert (=> b!1378405 m!1263019))

(declare-fun m!1263021 () Bool)

(assert (=> b!1378403 m!1263021))

(declare-fun m!1263023 () Bool)

(assert (=> b!1378403 m!1263023))

(declare-fun m!1263025 () Bool)

(assert (=> b!1378403 m!1263025))

(declare-fun m!1263027 () Bool)

(assert (=> start!117100 m!1263027))

(declare-fun m!1263029 () Bool)

(assert (=> b!1378404 m!1263029))

(assert (=> b!1378404 m!1263029))

(declare-fun m!1263031 () Bool)

(assert (=> b!1378404 m!1263031))

(push 1)

(assert (not b!1378403))

(assert (not start!117100))

(assert (not b!1378405))

(assert (not b!1378404))

(assert (not b!1378407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

