; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116988 () Bool)

(assert start!116988)

(declare-fun res!920473 () Bool)

(declare-fun e!780507 () Bool)

(assert (=> start!116988 (=> (not res!920473) (not e!780507))))

(declare-fun to!360 () (_ BitVec 32))

(declare-fun from!3564 () (_ BitVec 32))

(declare-datatypes ((array!93630 0))(
  ( (array!93631 (arr!45217 (Array (_ BitVec 32) (_ BitVec 64))) (size!45767 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93630)

(assert (=> start!116988 (= res!920473 (and (bvslt (size!45767 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45767 a!4197))))))

(assert (=> start!116988 e!780507))

(declare-fun array_inv!34245 (array!93630) Bool)

(assert (=> start!116988 (array_inv!34245 a!4197)))

(assert (=> start!116988 true))

(declare-fun b!1377845 () Bool)

(declare-fun res!920471 () Bool)

(assert (=> b!1377845 (=> (not res!920471) (not e!780507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377845 (= res!920471 (validKeyInArray!0 (select (arr!45217 a!4197) to!360)))))

(declare-fun b!1377846 () Bool)

(declare-fun res!920472 () Bool)

(assert (=> b!1377846 (=> (not res!920472) (not e!780507))))

(assert (=> b!1377846 (= res!920472 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377847 () Bool)

(assert (=> b!1377847 (= e!780507 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93630 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377847 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45727 0))(
  ( (Unit!45728) )
))
(declare-fun lt!606208 () Unit!45727)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45727)

(assert (=> b!1377847 (= lt!606208 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116988 res!920473) b!1377845))

(assert (= (and b!1377845 res!920471) b!1377846))

(assert (= (and b!1377846 res!920472) b!1377847))

(declare-fun m!1262259 () Bool)

(assert (=> start!116988 m!1262259))

(declare-fun m!1262261 () Bool)

(assert (=> b!1377845 m!1262261))

(assert (=> b!1377845 m!1262261))

(declare-fun m!1262263 () Bool)

(assert (=> b!1377845 m!1262263))

(declare-fun m!1262265 () Bool)

(assert (=> b!1377847 m!1262265))

(declare-fun m!1262267 () Bool)

(assert (=> b!1377847 m!1262267))

(declare-fun m!1262269 () Bool)

(assert (=> b!1377847 m!1262269))

(declare-fun m!1262271 () Bool)

(assert (=> b!1377847 m!1262271))

(push 1)

(assert (not b!1377845))

(assert (not b!1377847))

(assert (not start!116988))

(check-sat)

