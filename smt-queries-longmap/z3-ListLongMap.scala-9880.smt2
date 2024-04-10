; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116998 () Bool)

(assert start!116998)

(declare-fun res!920518 () Bool)

(declare-fun e!780538 () Bool)

(assert (=> start!116998 (=> (not res!920518) (not e!780538))))

(declare-datatypes ((array!93640 0))(
  ( (array!93641 (arr!45222 (Array (_ BitVec 32) (_ BitVec 64))) (size!45772 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93640)

(declare-fun from!3564 () (_ BitVec 32))

(declare-fun to!360 () (_ BitVec 32))

(assert (=> start!116998 (= res!920518 (and (bvslt (size!45772 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45772 a!4197))))))

(assert (=> start!116998 e!780538))

(declare-fun array_inv!34250 (array!93640) Bool)

(assert (=> start!116998 (array_inv!34250 a!4197)))

(assert (=> start!116998 true))

(declare-fun b!1377890 () Bool)

(declare-fun res!920516 () Bool)

(assert (=> b!1377890 (=> (not res!920516) (not e!780538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377890 (= res!920516 (validKeyInArray!0 (select (arr!45222 a!4197) to!360)))))

(declare-fun b!1377891 () Bool)

(declare-fun res!920517 () Bool)

(assert (=> b!1377891 (=> (not res!920517) (not e!780538))))

(assert (=> b!1377891 (= res!920517 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377892 () Bool)

(assert (=> b!1377892 (= e!780538 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93640 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377892 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45737 0))(
  ( (Unit!45738) )
))
(declare-fun lt!606223 () Unit!45737)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45737)

(assert (=> b!1377892 (= lt!606223 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116998 res!920518) b!1377890))

(assert (= (and b!1377890 res!920516) b!1377891))

(assert (= (and b!1377891 res!920517) b!1377892))

(declare-fun m!1262329 () Bool)

(assert (=> start!116998 m!1262329))

(declare-fun m!1262331 () Bool)

(assert (=> b!1377890 m!1262331))

(assert (=> b!1377890 m!1262331))

(declare-fun m!1262333 () Bool)

(assert (=> b!1377890 m!1262333))

(declare-fun m!1262335 () Bool)

(assert (=> b!1377892 m!1262335))

(declare-fun m!1262337 () Bool)

(assert (=> b!1377892 m!1262337))

(declare-fun m!1262339 () Bool)

(assert (=> b!1377892 m!1262339))

(declare-fun m!1262341 () Bool)

(assert (=> b!1377892 m!1262341))

(check-sat (not b!1377890) (not start!116998) (not b!1377892))
