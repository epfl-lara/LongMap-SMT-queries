; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117066 () Bool)

(assert start!117066)

(declare-fun res!920676 () Bool)

(declare-fun e!780696 () Bool)

(assert (=> start!117066 (=> (not res!920676) (not e!780696))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93683 0))(
  ( (array!93684 (arr!45242 (Array (_ BitVec 32) (_ BitVec 64))) (size!45792 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93683)

(assert (=> start!117066 (= res!920676 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45792 a!4094))))))

(assert (=> start!117066 e!780696))

(assert (=> start!117066 true))

(declare-fun array_inv!34270 (array!93683) Bool)

(assert (=> start!117066 (array_inv!34270 a!4094)))

(declare-fun b!1378141 () Bool)

(declare-fun res!920679 () Bool)

(assert (=> b!1378141 (=> (not res!920679) (not e!780696))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378141 (= res!920679 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378142 () Bool)

(declare-fun e!780697 () Bool)

(assert (=> b!1378142 (= e!780697 (not true))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606318 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93683 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378142 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606318) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45747 0))(
  ( (Unit!45748) )
))
(declare-fun lt!606317 () Unit!45747)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45747)

(assert (=> b!1378142 (= lt!606317 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378143 () Bool)

(declare-fun res!920677 () Bool)

(assert (=> b!1378143 (=> (not res!920677) (not e!780696))))

(assert (=> b!1378143 (= res!920677 (and (bvslt (size!45792 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45792 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378144 () Bool)

(declare-fun res!920680 () Bool)

(assert (=> b!1378144 (=> (not res!920680) (not e!780697))))

(assert (=> b!1378144 (= res!920680 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1378145 () Bool)

(declare-fun res!920675 () Bool)

(assert (=> b!1378145 (=> (not res!920675) (not e!780696))))

(assert (=> b!1378145 (= res!920675 (validKeyInArray!0 (select (arr!45242 a!4094) i!1451)))))

(declare-fun b!1378146 () Bool)

(assert (=> b!1378146 (= e!780696 e!780697)))

(declare-fun res!920678 () Bool)

(assert (=> b!1378146 (=> (not res!920678) (not e!780697))))

(assert (=> b!1378146 (= res!920678 (= (arrayCountValidKeys!0 (array!93684 (store (arr!45242 a!4094) i!1451 k!2953) (size!45792 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!606318 #b00000000000000000000000000000001)))))

(assert (=> b!1378146 (= lt!606318 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (= (and start!117066 res!920676) b!1378145))

(assert (= (and b!1378145 res!920675) b!1378141))

(assert (= (and b!1378141 res!920679) b!1378143))

(assert (= (and b!1378143 res!920677) b!1378146))

(assert (= (and b!1378146 res!920678) b!1378144))

(assert (= (and b!1378144 res!920680) b!1378142))

(declare-fun m!1262583 () Bool)

(assert (=> b!1378142 m!1262583))

(declare-fun m!1262585 () Bool)

(assert (=> b!1378142 m!1262585))

(declare-fun m!1262587 () Bool)

(assert (=> b!1378142 m!1262587))

(declare-fun m!1262589 () Bool)

(assert (=> b!1378146 m!1262589))

(declare-fun m!1262591 () Bool)

(assert (=> b!1378146 m!1262591))

(declare-fun m!1262593 () Bool)

(assert (=> b!1378146 m!1262593))

(declare-fun m!1262595 () Bool)

(assert (=> b!1378145 m!1262595))

(assert (=> b!1378145 m!1262595))

(declare-fun m!1262597 () Bool)

(assert (=> b!1378145 m!1262597))

(declare-fun m!1262599 () Bool)

(assert (=> start!117066 m!1262599))

(declare-fun m!1262601 () Bool)

(assert (=> b!1378141 m!1262601))

(push 1)

