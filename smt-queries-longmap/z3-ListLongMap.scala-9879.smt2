; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116984 () Bool)

(assert start!116984)

(declare-fun res!920454 () Bool)

(declare-fun e!780481 () Bool)

(assert (=> start!116984 (=> (not res!920454) (not e!780481))))

(declare-fun to!360 () (_ BitVec 32))

(declare-fun from!3564 () (_ BitVec 32))

(declare-datatypes ((array!93582 0))(
  ( (array!93583 (arr!45193 (Array (_ BitVec 32) (_ BitVec 64))) (size!45745 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93582)

(assert (=> start!116984 (= res!920454 (and (bvslt (size!45745 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45745 a!4197))))))

(assert (=> start!116984 e!780481))

(declare-fun array_inv!34426 (array!93582) Bool)

(assert (=> start!116984 (array_inv!34426 a!4197)))

(assert (=> start!116984 true))

(declare-fun b!1377781 () Bool)

(declare-fun res!920456 () Bool)

(assert (=> b!1377781 (=> (not res!920456) (not e!780481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377781 (= res!920456 (validKeyInArray!0 (select (arr!45193 a!4197) to!360)))))

(declare-fun b!1377782 () Bool)

(declare-fun res!920455 () Bool)

(assert (=> b!1377782 (=> (not res!920455) (not e!780481))))

(assert (=> b!1377782 (= res!920455 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377783 () Bool)

(assert (=> b!1377783 (= e!780481 (not (bvsle to!360 (size!45745 a!4197))))))

(declare-fun arrayCountValidKeys!0 (array!93582 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377783 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45570 0))(
  ( (Unit!45571) )
))
(declare-fun lt!606026 () Unit!45570)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45570)

(assert (=> b!1377783 (= lt!606026 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116984 res!920454) b!1377781))

(assert (= (and b!1377781 res!920456) b!1377782))

(assert (= (and b!1377782 res!920455) b!1377783))

(declare-fun m!1261761 () Bool)

(assert (=> start!116984 m!1261761))

(declare-fun m!1261763 () Bool)

(assert (=> b!1377781 m!1261763))

(assert (=> b!1377781 m!1261763))

(declare-fun m!1261765 () Bool)

(assert (=> b!1377781 m!1261765))

(declare-fun m!1261767 () Bool)

(assert (=> b!1377783 m!1261767))

(declare-fun m!1261769 () Bool)

(assert (=> b!1377783 m!1261769))

(declare-fun m!1261771 () Bool)

(assert (=> b!1377783 m!1261771))

(declare-fun m!1261773 () Bool)

(assert (=> b!1377783 m!1261773))

(check-sat (not b!1377783) (not start!116984) (not b!1377781))
(check-sat)
