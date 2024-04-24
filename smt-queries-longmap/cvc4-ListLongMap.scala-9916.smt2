; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117498 () Bool)

(assert start!117498)

(declare-fun res!922569 () Bool)

(declare-fun e!782379 () Bool)

(assert (=> start!117498 (=> (not res!922569) (not e!782379))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93978 0))(
  ( (array!93979 (arr!45383 (Array (_ BitVec 32) (_ BitVec 64))) (size!45934 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93978)

(assert (=> start!117498 (= res!922569 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45934 a!4094))))))

(assert (=> start!117498 e!782379))

(assert (=> start!117498 true))

(declare-fun array_inv!34664 (array!93978) Bool)

(assert (=> start!117498 (array_inv!34664 a!4094)))

(declare-fun b!1380915 () Bool)

(declare-fun res!922565 () Bool)

(assert (=> b!1380915 (=> (not res!922565) (not e!782379))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1380915 (= res!922565 (and (bvslt (size!45934 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45934 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1380916 () Bool)

(declare-fun res!922567 () Bool)

(assert (=> b!1380916 (=> (not res!922567) (not e!782379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380916 (= res!922567 (validKeyInArray!0 (select (arr!45383 a!4094) i!1451)))))

(declare-fun b!1380917 () Bool)

(declare-fun res!922566 () Bool)

(declare-fun e!782378 () Bool)

(assert (=> b!1380917 (=> (not res!922566) (not e!782378))))

(assert (=> b!1380917 (= res!922566 (bvsle from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1380918 () Bool)

(declare-fun res!922568 () Bool)

(assert (=> b!1380918 (=> (not res!922568) (not e!782379))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1380918 (= res!922568 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380919 () Bool)

(assert (=> b!1380919 (= e!782379 e!782378)))

(declare-fun res!922564 () Bool)

(assert (=> b!1380919 (=> (not res!922564) (not e!782378))))

(declare-fun lt!608158 () array!93978)

(declare-fun arrayCountValidKeys!0 (array!93978 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380919 (= res!922564 (= (arrayCountValidKeys!0 lt!608158 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(assert (=> b!1380919 (= lt!608158 (array!93979 (store (arr!45383 a!4094) i!1451 k!2953) (size!45934 a!4094)))))

(declare-fun b!1380920 () Bool)

(assert (=> b!1380920 (= e!782378 (not (= (arrayCountValidKeys!0 lt!608158 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))))

(assert (= (and start!117498 res!922569) b!1380916))

(assert (= (and b!1380916 res!922567) b!1380918))

(assert (= (and b!1380918 res!922568) b!1380915))

(assert (= (and b!1380915 res!922565) b!1380919))

(assert (= (and b!1380919 res!922564) b!1380917))

(assert (= (and b!1380917 res!922566) b!1380920))

(declare-fun m!1266397 () Bool)

(assert (=> b!1380918 m!1266397))

(declare-fun m!1266399 () Bool)

(assert (=> start!117498 m!1266399))

(declare-fun m!1266401 () Bool)

(assert (=> b!1380916 m!1266401))

(assert (=> b!1380916 m!1266401))

(declare-fun m!1266403 () Bool)

(assert (=> b!1380916 m!1266403))

(declare-fun m!1266405 () Bool)

(assert (=> b!1380919 m!1266405))

(declare-fun m!1266407 () Bool)

(assert (=> b!1380919 m!1266407))

(declare-fun m!1266409 () Bool)

(assert (=> b!1380919 m!1266409))

(declare-fun m!1266411 () Bool)

(assert (=> b!1380920 m!1266411))

(declare-fun m!1266413 () Bool)

(assert (=> b!1380920 m!1266413))

(push 1)

(assert (not start!117498))

(assert (not b!1380919))

(assert (not b!1380918))

(assert (not b!1380920))

(assert (not b!1380916))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

