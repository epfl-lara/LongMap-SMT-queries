; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116992 () Bool)

(assert start!116992)

(declare-fun res!920491 () Bool)

(declare-fun e!780519 () Bool)

(assert (=> start!116992 (=> (not res!920491) (not e!780519))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93634 0))(
  ( (array!93635 (arr!45219 (Array (_ BitVec 32) (_ BitVec 64))) (size!45769 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93634)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116992 (= res!920491 (and (bvslt (size!45769 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45769 a!4197))))))

(assert (=> start!116992 e!780519))

(declare-fun array_inv!34247 (array!93634) Bool)

(assert (=> start!116992 (array_inv!34247 a!4197)))

(assert (=> start!116992 true))

(declare-fun b!1377863 () Bool)

(declare-fun res!920489 () Bool)

(assert (=> b!1377863 (=> (not res!920489) (not e!780519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377863 (= res!920489 (validKeyInArray!0 (select (arr!45219 a!4197) to!360)))))

(declare-fun b!1377864 () Bool)

(declare-fun res!920490 () Bool)

(assert (=> b!1377864 (=> (not res!920490) (not e!780519))))

(assert (=> b!1377864 (= res!920490 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377865 () Bool)

(assert (=> b!1377865 (= e!780519 (not (bvsle to!360 (size!45769 a!4197))))))

(declare-fun arrayCountValidKeys!0 (array!93634 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377865 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45731 0))(
  ( (Unit!45732) )
))
(declare-fun lt!606214 () Unit!45731)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45731)

(assert (=> b!1377865 (= lt!606214 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116992 res!920491) b!1377863))

(assert (= (and b!1377863 res!920489) b!1377864))

(assert (= (and b!1377864 res!920490) b!1377865))

(declare-fun m!1262287 () Bool)

(assert (=> start!116992 m!1262287))

(declare-fun m!1262289 () Bool)

(assert (=> b!1377863 m!1262289))

(assert (=> b!1377863 m!1262289))

(declare-fun m!1262291 () Bool)

(assert (=> b!1377863 m!1262291))

(declare-fun m!1262293 () Bool)

(assert (=> b!1377865 m!1262293))

(declare-fun m!1262295 () Bool)

(assert (=> b!1377865 m!1262295))

(declare-fun m!1262297 () Bool)

(assert (=> b!1377865 m!1262297))

(declare-fun m!1262299 () Bool)

(assert (=> b!1377865 m!1262299))

(check-sat (not b!1377865) (not start!116992) (not b!1377863))
(check-sat)
