; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117424 () Bool)

(assert start!117424)

(declare-fun b!1380430 () Bool)

(declare-fun res!922176 () Bool)

(declare-fun e!782095 () Bool)

(assert (=> b!1380430 (=> (not res!922176) (not e!782095))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380430 (= res!922176 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1380431 () Bool)

(declare-fun res!922178 () Bool)

(assert (=> b!1380431 (=> (not res!922178) (not e!782095))))

(declare-datatypes ((array!93925 0))(
  ( (array!93926 (arr!45358 (Array (_ BitVec 32) (_ BitVec 64))) (size!45909 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93925)

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1380431 (= res!922178 (validKeyInArray!0 (select (arr!45358 a!4094) i!1451)))))

(declare-fun b!1380433 () Bool)

(declare-fun e!782096 () Bool)

(assert (=> b!1380433 (= e!782096 (not true))))

(declare-fun lt!607635 () (_ BitVec 32))

(declare-fun lt!607634 () array!93925)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93925 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380433 (= (bvadd (arrayCountValidKeys!0 lt!607634 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607635) (arrayCountValidKeys!0 lt!607634 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45776 0))(
  ( (Unit!45777) )
))
(declare-fun lt!607636 () Unit!45776)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45776)

(assert (=> b!1380433 (= lt!607636 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607634 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607633 () (_ BitVec 32))

(assert (=> b!1380433 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607633) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607632 () Unit!45776)

(assert (=> b!1380433 (= lt!607632 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1380434 () Bool)

(assert (=> b!1380434 (= e!782095 e!782096)))

(declare-fun res!922177 () Bool)

(assert (=> b!1380434 (=> (not res!922177) (not e!782096))))

(assert (=> b!1380434 (= res!922177 (and (= lt!607635 (bvsub lt!607633 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1380434 (= lt!607635 (arrayCountValidKeys!0 lt!607634 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380434 (= lt!607633 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380434 (= lt!607634 (array!93926 (store (arr!45358 a!4094) i!1451 k0!2953) (size!45909 a!4094)))))

(declare-fun b!1380432 () Bool)

(declare-fun res!922175 () Bool)

(assert (=> b!1380432 (=> (not res!922175) (not e!782095))))

(assert (=> b!1380432 (= res!922175 (and (bvslt (size!45909 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45909 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!922179 () Bool)

(assert (=> start!117424 (=> (not res!922179) (not e!782095))))

(assert (=> start!117424 (= res!922179 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45909 a!4094))))))

(assert (=> start!117424 e!782095))

(assert (=> start!117424 true))

(declare-fun array_inv!34639 (array!93925) Bool)

(assert (=> start!117424 (array_inv!34639 a!4094)))

(assert (= (and start!117424 res!922179) b!1380431))

(assert (= (and b!1380431 res!922178) b!1380430))

(assert (= (and b!1380430 res!922176) b!1380432))

(assert (= (and b!1380432 res!922175) b!1380434))

(assert (= (and b!1380434 res!922177) b!1380433))

(declare-fun m!1265659 () Bool)

(assert (=> b!1380434 m!1265659))

(declare-fun m!1265661 () Bool)

(assert (=> b!1380434 m!1265661))

(declare-fun m!1265663 () Bool)

(assert (=> b!1380434 m!1265663))

(declare-fun m!1265665 () Bool)

(assert (=> start!117424 m!1265665))

(declare-fun m!1265667 () Bool)

(assert (=> b!1380430 m!1265667))

(declare-fun m!1265669 () Bool)

(assert (=> b!1380433 m!1265669))

(declare-fun m!1265671 () Bool)

(assert (=> b!1380433 m!1265671))

(declare-fun m!1265673 () Bool)

(assert (=> b!1380433 m!1265673))

(declare-fun m!1265675 () Bool)

(assert (=> b!1380433 m!1265675))

(declare-fun m!1265677 () Bool)

(assert (=> b!1380433 m!1265677))

(declare-fun m!1265679 () Bool)

(assert (=> b!1380433 m!1265679))

(declare-fun m!1265681 () Bool)

(assert (=> b!1380431 m!1265681))

(assert (=> b!1380431 m!1265681))

(declare-fun m!1265683 () Bool)

(assert (=> b!1380431 m!1265683))

(check-sat (not b!1380433) (not b!1380434) (not start!117424) (not b!1380431) (not b!1380430))
(check-sat)
