; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117076 () Bool)

(assert start!117076)

(declare-fun b!1378223 () Bool)

(declare-fun res!920761 () Bool)

(declare-fun e!780741 () Bool)

(assert (=> b!1378223 (=> (not res!920761) (not e!780741))))

(declare-datatypes ((array!93693 0))(
  ( (array!93694 (arr!45247 (Array (_ BitVec 32) (_ BitVec 64))) (size!45797 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93693)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378223 (= res!920761 (and (bvslt (size!45797 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45797 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!920759 () Bool)

(assert (=> start!117076 (=> (not res!920759) (not e!780741))))

(assert (=> start!117076 (= res!920759 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45797 a!4094))))))

(assert (=> start!117076 e!780741))

(assert (=> start!117076 true))

(declare-fun array_inv!34275 (array!93693) Bool)

(assert (=> start!117076 (array_inv!34275 a!4094)))

(declare-fun b!1378224 () Bool)

(declare-fun e!780743 () Bool)

(assert (=> b!1378224 (= e!780741 e!780743)))

(declare-fun res!920760 () Bool)

(assert (=> b!1378224 (=> (not res!920760) (not e!780743))))

(declare-fun lt!606372 () (_ BitVec 32))

(declare-fun lt!606371 () (_ BitVec 32))

(assert (=> b!1378224 (= res!920760 (and (= lt!606372 (bvsub lt!606371 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606374 () array!93693)

(declare-fun arrayCountValidKeys!0 (array!93693 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378224 (= lt!606372 (arrayCountValidKeys!0 lt!606374 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378224 (= lt!606371 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378224 (= lt!606374 (array!93694 (store (arr!45247 a!4094) i!1451 k!2953) (size!45797 a!4094)))))

(declare-fun b!1378225 () Bool)

(declare-fun res!920758 () Bool)

(assert (=> b!1378225 (=> (not res!920758) (not e!780741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378225 (= res!920758 (validKeyInArray!0 (select (arr!45247 a!4094) i!1451)))))

(declare-fun b!1378226 () Bool)

(assert (=> b!1378226 (= e!780743 (not true))))

(assert (=> b!1378226 (= (bvadd (arrayCountValidKeys!0 lt!606374 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606372) (arrayCountValidKeys!0 lt!606374 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45757 0))(
  ( (Unit!45758) )
))
(declare-fun lt!606373 () Unit!45757)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45757)

(assert (=> b!1378226 (= lt!606373 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606374 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378226 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606371) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606375 () Unit!45757)

(assert (=> b!1378226 (= lt!606375 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378227 () Bool)

(declare-fun res!920757 () Bool)

(assert (=> b!1378227 (=> (not res!920757) (not e!780741))))

(assert (=> b!1378227 (= res!920757 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117076 res!920759) b!1378225))

(assert (= (and b!1378225 res!920758) b!1378227))

(assert (= (and b!1378227 res!920757) b!1378223))

(assert (= (and b!1378223 res!920761) b!1378224))

(assert (= (and b!1378224 res!920760) b!1378226))

(declare-fun m!1262695 () Bool)

(assert (=> b!1378226 m!1262695))

(declare-fun m!1262697 () Bool)

(assert (=> b!1378226 m!1262697))

(declare-fun m!1262699 () Bool)

(assert (=> b!1378226 m!1262699))

(declare-fun m!1262701 () Bool)

(assert (=> b!1378226 m!1262701))

(declare-fun m!1262703 () Bool)

(assert (=> b!1378226 m!1262703))

(declare-fun m!1262705 () Bool)

(assert (=> b!1378226 m!1262705))

(declare-fun m!1262707 () Bool)

(assert (=> b!1378225 m!1262707))

(assert (=> b!1378225 m!1262707))

(declare-fun m!1262709 () Bool)

(assert (=> b!1378225 m!1262709))

(declare-fun m!1262711 () Bool)

(assert (=> b!1378224 m!1262711))

(declare-fun m!1262713 () Bool)

(assert (=> b!1378224 m!1262713))

(declare-fun m!1262715 () Bool)

(assert (=> b!1378224 m!1262715))

(declare-fun m!1262717 () Bool)

(assert (=> start!117076 m!1262717))

(declare-fun m!1262719 () Bool)

(assert (=> b!1378227 m!1262719))

(push 1)

(assert (not b!1378224))

(assert (not start!117076))

(assert (not b!1378225))

(assert (not b!1378226))

(assert (not b!1378227))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

