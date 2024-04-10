; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117070 () Bool)

(assert start!117070)

(declare-fun b!1378177 () Bool)

(declare-fun e!780714 () Bool)

(declare-fun e!780716 () Bool)

(assert (=> b!1378177 (= e!780714 e!780716)))

(declare-fun res!920713 () Bool)

(assert (=> b!1378177 (=> (not res!920713) (not e!780716))))

(declare-datatypes ((array!93687 0))(
  ( (array!93688 (arr!45244 (Array (_ BitVec 32) (_ BitVec 64))) (size!45794 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93687)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun lt!606330 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93687 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378177 (= res!920713 (= (arrayCountValidKeys!0 (array!93688 (store (arr!45244 a!4094) i!1451 k!2953) (size!45794 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!606330 #b00000000000000000000000000000001)))))

(assert (=> b!1378177 (= lt!606330 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!920712 () Bool)

(assert (=> start!117070 (=> (not res!920712) (not e!780714))))

(assert (=> start!117070 (= res!920712 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45794 a!4094))))))

(assert (=> start!117070 e!780714))

(assert (=> start!117070 true))

(declare-fun array_inv!34272 (array!93687) Bool)

(assert (=> start!117070 (array_inv!34272 a!4094)))

(declare-fun b!1378178 () Bool)

(declare-fun res!920711 () Bool)

(assert (=> b!1378178 (=> (not res!920711) (not e!780716))))

(assert (=> b!1378178 (= res!920711 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1378179 () Bool)

(declare-fun res!920716 () Bool)

(assert (=> b!1378179 (=> (not res!920716) (not e!780714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378179 (= res!920716 (validKeyInArray!0 (select (arr!45244 a!4094) i!1451)))))

(declare-fun b!1378180 () Bool)

(declare-fun res!920714 () Bool)

(assert (=> b!1378180 (=> (not res!920714) (not e!780714))))

(assert (=> b!1378180 (= res!920714 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378181 () Bool)

(declare-fun res!920715 () Bool)

(assert (=> b!1378181 (=> (not res!920715) (not e!780714))))

(assert (=> b!1378181 (= res!920715 (and (bvslt (size!45794 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45794 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378182 () Bool)

(assert (=> b!1378182 (= e!780716 (not true))))

(assert (=> b!1378182 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606330) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45751 0))(
  ( (Unit!45752) )
))
(declare-fun lt!606329 () Unit!45751)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45751)

(assert (=> b!1378182 (= lt!606329 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117070 res!920712) b!1378179))

(assert (= (and b!1378179 res!920716) b!1378180))

(assert (= (and b!1378180 res!920714) b!1378181))

(assert (= (and b!1378181 res!920715) b!1378177))

(assert (= (and b!1378177 res!920713) b!1378178))

(assert (= (and b!1378178 res!920711) b!1378182))

(declare-fun m!1262623 () Bool)

(assert (=> start!117070 m!1262623))

(declare-fun m!1262625 () Bool)

(assert (=> b!1378180 m!1262625))

(declare-fun m!1262627 () Bool)

(assert (=> b!1378179 m!1262627))

(assert (=> b!1378179 m!1262627))

(declare-fun m!1262629 () Bool)

(assert (=> b!1378179 m!1262629))

(declare-fun m!1262631 () Bool)

(assert (=> b!1378177 m!1262631))

(declare-fun m!1262633 () Bool)

(assert (=> b!1378177 m!1262633))

(declare-fun m!1262635 () Bool)

(assert (=> b!1378177 m!1262635))

(declare-fun m!1262637 () Bool)

(assert (=> b!1378182 m!1262637))

(declare-fun m!1262639 () Bool)

(assert (=> b!1378182 m!1262639))

(declare-fun m!1262641 () Bool)

(assert (=> b!1378182 m!1262641))

(push 1)

(assert (not start!117070))

(assert (not b!1378179))

(assert (not b!1378180))

(assert (not b!1378177))

(assert (not b!1378182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

