; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117078 () Bool)

(assert start!117078)

(declare-fun b!1378238 () Bool)

(declare-fun e!780751 () Bool)

(assert (=> b!1378238 (= e!780751 (not true))))

(declare-fun lt!606389 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-datatypes ((array!93695 0))(
  ( (array!93696 (arr!45248 (Array (_ BitVec 32) (_ BitVec 64))) (size!45798 (_ BitVec 32))) )
))
(declare-fun lt!606386 () array!93695)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378238 (= (bvadd (arrayCountValidKeys!0 lt!606386 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606389) (arrayCountValidKeys!0 lt!606386 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45759 0))(
  ( (Unit!45760) )
))
(declare-fun lt!606388 () Unit!45759)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45759)

(assert (=> b!1378238 (= lt!606388 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606386 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606387 () (_ BitVec 32))

(declare-fun a!4094 () array!93695)

(assert (=> b!1378238 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606387) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606390 () Unit!45759)

(assert (=> b!1378238 (= lt!606390 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378239 () Bool)

(declare-fun e!780752 () Bool)

(assert (=> b!1378239 (= e!780752 e!780751)))

(declare-fun res!920776 () Bool)

(assert (=> b!1378239 (=> (not res!920776) (not e!780751))))

(assert (=> b!1378239 (= res!920776 (and (= lt!606389 (bvsub lt!606387 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378239 (= lt!606389 (arrayCountValidKeys!0 lt!606386 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378239 (= lt!606387 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378239 (= lt!606386 (array!93696 (store (arr!45248 a!4094) i!1451 k!2953) (size!45798 a!4094)))))

(declare-fun b!1378240 () Bool)

(declare-fun res!920775 () Bool)

(assert (=> b!1378240 (=> (not res!920775) (not e!780752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378240 (= res!920775 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!920772 () Bool)

(assert (=> start!117078 (=> (not res!920772) (not e!780752))))

(assert (=> start!117078 (= res!920772 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45798 a!4094))))))

(assert (=> start!117078 e!780752))

(assert (=> start!117078 true))

(declare-fun array_inv!34276 (array!93695) Bool)

(assert (=> start!117078 (array_inv!34276 a!4094)))

(declare-fun b!1378241 () Bool)

(declare-fun res!920773 () Bool)

(assert (=> b!1378241 (=> (not res!920773) (not e!780752))))

(assert (=> b!1378241 (= res!920773 (validKeyInArray!0 (select (arr!45248 a!4094) i!1451)))))

(declare-fun b!1378242 () Bool)

(declare-fun res!920774 () Bool)

(assert (=> b!1378242 (=> (not res!920774) (not e!780752))))

(assert (=> b!1378242 (= res!920774 (and (bvslt (size!45798 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45798 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117078 res!920772) b!1378241))

(assert (= (and b!1378241 res!920773) b!1378240))

(assert (= (and b!1378240 res!920775) b!1378242))

(assert (= (and b!1378242 res!920774) b!1378239))

(assert (= (and b!1378239 res!920776) b!1378238))

(declare-fun m!1262721 () Bool)

(assert (=> b!1378241 m!1262721))

(assert (=> b!1378241 m!1262721))

(declare-fun m!1262723 () Bool)

(assert (=> b!1378241 m!1262723))

(declare-fun m!1262725 () Bool)

(assert (=> b!1378239 m!1262725))

(declare-fun m!1262727 () Bool)

(assert (=> b!1378239 m!1262727))

(declare-fun m!1262729 () Bool)

(assert (=> b!1378239 m!1262729))

(declare-fun m!1262731 () Bool)

(assert (=> b!1378238 m!1262731))

(declare-fun m!1262733 () Bool)

(assert (=> b!1378238 m!1262733))

(declare-fun m!1262735 () Bool)

(assert (=> b!1378238 m!1262735))

(declare-fun m!1262737 () Bool)

(assert (=> b!1378238 m!1262737))

(declare-fun m!1262739 () Bool)

(assert (=> b!1378238 m!1262739))

(declare-fun m!1262741 () Bool)

(assert (=> b!1378238 m!1262741))

(declare-fun m!1262743 () Bool)

(assert (=> start!117078 m!1262743))

(declare-fun m!1262745 () Bool)

(assert (=> b!1378240 m!1262745))

(push 1)

(assert (not b!1378240))

(assert (not b!1378238))

(assert (not b!1378241))

(assert (not start!117078))

(assert (not b!1378239))

(check-sat)

