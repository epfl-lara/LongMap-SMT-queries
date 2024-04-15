; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117100 () Bool)

(assert start!117100)

(declare-fun b!1378364 () Bool)

(declare-fun e!780837 () Bool)

(declare-fun e!780838 () Bool)

(assert (=> b!1378364 (= e!780837 e!780838)))

(declare-fun res!920941 () Bool)

(assert (=> b!1378364 (=> (not res!920941) (not e!780838))))

(declare-fun lt!606398 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606399 () (_ BitVec 32))

(assert (=> b!1378364 (= res!920941 (and (= lt!606399 (bvsub lt!606398 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93671 0))(
  ( (array!93672 (arr!45236 (Array (_ BitVec 32) (_ BitVec 64))) (size!45788 (_ BitVec 32))) )
))
(declare-fun lt!606400 () array!93671)

(declare-fun arrayCountValidKeys!0 (array!93671 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378364 (= lt!606399 (arrayCountValidKeys!0 lt!606400 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93671)

(assert (=> b!1378364 (= lt!606398 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378364 (= lt!606400 (array!93672 (store (arr!45236 a!4094) i!1451 k!2953) (size!45788 a!4094)))))

(declare-fun b!1378365 () Bool)

(declare-fun res!920944 () Bool)

(assert (=> b!1378365 (=> (not res!920944) (not e!780837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378365 (= res!920944 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378366 () Bool)

(assert (=> b!1378366 (= e!780838 (not true))))

(assert (=> b!1378366 (= (bvadd (arrayCountValidKeys!0 lt!606400 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606399) (arrayCountValidKeys!0 lt!606400 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45626 0))(
  ( (Unit!45627) )
))
(declare-fun lt!606401 () Unit!45626)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45626)

(assert (=> b!1378366 (= lt!606401 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606400 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378366 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606398) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606397 () Unit!45626)

(assert (=> b!1378366 (= lt!606397 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378368 () Bool)

(declare-fun res!920945 () Bool)

(assert (=> b!1378368 (=> (not res!920945) (not e!780837))))

(assert (=> b!1378368 (= res!920945 (and (bvslt (size!45788 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45788 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!920943 () Bool)

(assert (=> start!117100 (=> (not res!920943) (not e!780837))))

(assert (=> start!117100 (= res!920943 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45788 a!4094))))))

(assert (=> start!117100 e!780837))

(assert (=> start!117100 true))

(declare-fun array_inv!34469 (array!93671) Bool)

(assert (=> start!117100 (array_inv!34469 a!4094)))

(declare-fun b!1378367 () Bool)

(declare-fun res!920942 () Bool)

(assert (=> b!1378367 (=> (not res!920942) (not e!780837))))

(assert (=> b!1378367 (= res!920942 (validKeyInArray!0 (select (arr!45236 a!4094) i!1451)))))

(assert (= (and start!117100 res!920943) b!1378367))

(assert (= (and b!1378367 res!920942) b!1378365))

(assert (= (and b!1378365 res!920944) b!1378368))

(assert (= (and b!1378368 res!920945) b!1378364))

(assert (= (and b!1378364 res!920941) b!1378366))

(declare-fun m!1262555 () Bool)

(assert (=> b!1378365 m!1262555))

(declare-fun m!1262557 () Bool)

(assert (=> b!1378364 m!1262557))

(declare-fun m!1262559 () Bool)

(assert (=> b!1378364 m!1262559))

(declare-fun m!1262561 () Bool)

(assert (=> b!1378364 m!1262561))

(declare-fun m!1262563 () Bool)

(assert (=> start!117100 m!1262563))

(declare-fun m!1262565 () Bool)

(assert (=> b!1378367 m!1262565))

(assert (=> b!1378367 m!1262565))

(declare-fun m!1262567 () Bool)

(assert (=> b!1378367 m!1262567))

(declare-fun m!1262569 () Bool)

(assert (=> b!1378366 m!1262569))

(declare-fun m!1262571 () Bool)

(assert (=> b!1378366 m!1262571))

(declare-fun m!1262573 () Bool)

(assert (=> b!1378366 m!1262573))

(declare-fun m!1262575 () Bool)

(assert (=> b!1378366 m!1262575))

(declare-fun m!1262577 () Bool)

(assert (=> b!1378366 m!1262577))

(declare-fun m!1262579 () Bool)

(assert (=> b!1378366 m!1262579))

(push 1)

(assert (not b!1378364))

(assert (not b!1378366))

(assert (not b!1378367))

(assert (not start!117100))

(assert (not b!1378365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

