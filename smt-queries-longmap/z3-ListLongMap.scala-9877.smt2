; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116980 () Bool)

(assert start!116980)

(declare-fun res!920435 () Bool)

(declare-fun e!780484 () Bool)

(assert (=> start!116980 (=> (not res!920435) (not e!780484))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93622 0))(
  ( (array!93623 (arr!45213 (Array (_ BitVec 32) (_ BitVec 64))) (size!45763 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93622)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116980 (= res!920435 (and (bvslt (size!45763 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45763 a!4197))))))

(assert (=> start!116980 e!780484))

(declare-fun array_inv!34241 (array!93622) Bool)

(assert (=> start!116980 (array_inv!34241 a!4197)))

(assert (=> start!116980 true))

(declare-fun b!1377809 () Bool)

(declare-fun res!920436 () Bool)

(assert (=> b!1377809 (=> (not res!920436) (not e!780484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377809 (= res!920436 (validKeyInArray!0 (select (arr!45213 a!4197) to!360)))))

(declare-fun b!1377810 () Bool)

(declare-fun res!920437 () Bool)

(assert (=> b!1377810 (=> (not res!920437) (not e!780484))))

(assert (=> b!1377810 (= res!920437 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377811 () Bool)

(assert (=> b!1377811 (= e!780484 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93622 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377811 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45719 0))(
  ( (Unit!45720) )
))
(declare-fun lt!606196 () Unit!45719)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45719)

(assert (=> b!1377811 (= lt!606196 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116980 res!920435) b!1377809))

(assert (= (and b!1377809 res!920436) b!1377810))

(assert (= (and b!1377810 res!920437) b!1377811))

(declare-fun m!1262203 () Bool)

(assert (=> start!116980 m!1262203))

(declare-fun m!1262205 () Bool)

(assert (=> b!1377809 m!1262205))

(assert (=> b!1377809 m!1262205))

(declare-fun m!1262207 () Bool)

(assert (=> b!1377809 m!1262207))

(declare-fun m!1262209 () Bool)

(assert (=> b!1377811 m!1262209))

(declare-fun m!1262211 () Bool)

(assert (=> b!1377811 m!1262211))

(declare-fun m!1262213 () Bool)

(assert (=> b!1377811 m!1262213))

(declare-fun m!1262215 () Bool)

(assert (=> b!1377811 m!1262215))

(check-sat (not b!1377811) (not start!116980) (not b!1377809))
