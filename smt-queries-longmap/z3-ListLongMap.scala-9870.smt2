; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116908 () Bool)

(assert start!116908)

(declare-fun res!920283 () Bool)

(declare-fun e!780318 () Bool)

(assert (=> start!116908 (=> (not res!920283) (not e!780318))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93577 0))(
  ( (array!93578 (arr!45192 (Array (_ BitVec 32) (_ BitVec 64))) (size!45742 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93577)

(assert (=> start!116908 (= res!920283 (and (bvslt (size!45742 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45742 a!4212))))))

(assert (=> start!116908 e!780318))

(declare-fun array_inv!34220 (array!93577) Bool)

(assert (=> start!116908 (array_inv!34220 a!4212)))

(assert (=> start!116908 true))

(declare-fun b!1377560 () Bool)

(declare-fun res!920284 () Bool)

(assert (=> b!1377560 (=> (not res!920284) (not e!780318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377560 (= res!920284 (not (validKeyInArray!0 (select (arr!45192 a!4212) to!375))))))

(declare-fun b!1377561 () Bool)

(declare-fun res!920282 () Bool)

(assert (=> b!1377561 (=> (not res!920282) (not e!780318))))

(assert (=> b!1377561 (= res!920282 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377562 () Bool)

(assert (=> b!1377562 (= e!780318 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93577 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377562 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45689 0))(
  ( (Unit!45690) )
))
(declare-fun lt!606091 () Unit!45689)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45689)

(assert (=> b!1377562 (= lt!606091 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116908 res!920283) b!1377560))

(assert (= (and b!1377560 res!920284) b!1377561))

(assert (= (and b!1377561 res!920282) b!1377562))

(declare-fun m!1261891 () Bool)

(assert (=> start!116908 m!1261891))

(declare-fun m!1261893 () Bool)

(assert (=> b!1377560 m!1261893))

(assert (=> b!1377560 m!1261893))

(declare-fun m!1261895 () Bool)

(assert (=> b!1377560 m!1261895))

(declare-fun m!1261897 () Bool)

(assert (=> b!1377562 m!1261897))

(declare-fun m!1261899 () Bool)

(assert (=> b!1377562 m!1261899))

(declare-fun m!1261901 () Bool)

(assert (=> b!1377562 m!1261901))

(declare-fun m!1261903 () Bool)

(assert (=> b!1377562 m!1261903))

(check-sat (not b!1377560) (not start!116908) (not b!1377562))
