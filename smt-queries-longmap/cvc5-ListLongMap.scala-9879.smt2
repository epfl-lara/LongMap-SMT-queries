; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116990 () Bool)

(assert start!116990)

(declare-fun res!920481 () Bool)

(declare-fun e!780514 () Bool)

(assert (=> start!116990 (=> (not res!920481) (not e!780514))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93632 0))(
  ( (array!93633 (arr!45218 (Array (_ BitVec 32) (_ BitVec 64))) (size!45768 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93632)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116990 (= res!920481 (and (bvslt (size!45768 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45768 a!4197))))))

(assert (=> start!116990 e!780514))

(declare-fun array_inv!34246 (array!93632) Bool)

(assert (=> start!116990 (array_inv!34246 a!4197)))

(assert (=> start!116990 true))

(declare-fun b!1377854 () Bool)

(declare-fun res!920482 () Bool)

(assert (=> b!1377854 (=> (not res!920482) (not e!780514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377854 (= res!920482 (validKeyInArray!0 (select (arr!45218 a!4197) to!360)))))

(declare-fun b!1377855 () Bool)

(declare-fun res!920480 () Bool)

(assert (=> b!1377855 (=> (not res!920480) (not e!780514))))

(assert (=> b!1377855 (= res!920480 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377856 () Bool)

(assert (=> b!1377856 (= e!780514 (not (bvsle to!360 (size!45768 a!4197))))))

(declare-fun arrayCountValidKeys!0 (array!93632 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377856 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45729 0))(
  ( (Unit!45730) )
))
(declare-fun lt!606211 () Unit!45729)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45729)

(assert (=> b!1377856 (= lt!606211 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116990 res!920481) b!1377854))

(assert (= (and b!1377854 res!920482) b!1377855))

(assert (= (and b!1377855 res!920480) b!1377856))

(declare-fun m!1262273 () Bool)

(assert (=> start!116990 m!1262273))

(declare-fun m!1262275 () Bool)

(assert (=> b!1377854 m!1262275))

(assert (=> b!1377854 m!1262275))

(declare-fun m!1262277 () Bool)

(assert (=> b!1377854 m!1262277))

(declare-fun m!1262279 () Bool)

(assert (=> b!1377856 m!1262279))

(declare-fun m!1262281 () Bool)

(assert (=> b!1377856 m!1262281))

(declare-fun m!1262283 () Bool)

(assert (=> b!1377856 m!1262283))

(declare-fun m!1262285 () Bool)

(assert (=> b!1377856 m!1262285))

(push 1)

(assert (not b!1377856))

(assert (not start!116990))

(assert (not b!1377854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

