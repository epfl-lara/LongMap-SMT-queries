; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116976 () Bool)

(assert start!116976)

(declare-fun res!920418 () Bool)

(declare-fun e!780456 () Bool)

(assert (=> start!116976 (=> (not res!920418) (not e!780456))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93574 0))(
  ( (array!93575 (arr!45189 (Array (_ BitVec 32) (_ BitVec 64))) (size!45741 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93574)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116976 (= res!920418 (and (bvslt (size!45741 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45741 a!4197))))))

(assert (=> start!116976 e!780456))

(declare-fun array_inv!34422 (array!93574) Bool)

(assert (=> start!116976 (array_inv!34422 a!4197)))

(assert (=> start!116976 true))

(declare-fun b!1377745 () Bool)

(declare-fun res!920420 () Bool)

(assert (=> b!1377745 (=> (not res!920420) (not e!780456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377745 (= res!920420 (validKeyInArray!0 (select (arr!45189 a!4197) to!360)))))

(declare-fun b!1377746 () Bool)

(declare-fun res!920419 () Bool)

(assert (=> b!1377746 (=> (not res!920419) (not e!780456))))

(assert (=> b!1377746 (= res!920419 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377747 () Bool)

(assert (=> b!1377747 (= e!780456 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93574 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377747 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45562 0))(
  ( (Unit!45563) )
))
(declare-fun lt!606014 () Unit!45562)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45562)

(assert (=> b!1377747 (= lt!606014 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116976 res!920418) b!1377745))

(assert (= (and b!1377745 res!920420) b!1377746))

(assert (= (and b!1377746 res!920419) b!1377747))

(declare-fun m!1261705 () Bool)

(assert (=> start!116976 m!1261705))

(declare-fun m!1261707 () Bool)

(assert (=> b!1377745 m!1261707))

(assert (=> b!1377745 m!1261707))

(declare-fun m!1261709 () Bool)

(assert (=> b!1377745 m!1261709))

(declare-fun m!1261711 () Bool)

(assert (=> b!1377747 m!1261711))

(declare-fun m!1261713 () Bool)

(assert (=> b!1377747 m!1261713))

(declare-fun m!1261715 () Bool)

(assert (=> b!1377747 m!1261715))

(declare-fun m!1261717 () Bool)

(assert (=> b!1377747 m!1261717))

(push 1)

(assert (not b!1377745))

(assert (not start!116976))

(assert (not b!1377747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

