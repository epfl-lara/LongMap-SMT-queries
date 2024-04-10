; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116984 () Bool)

(assert start!116984)

(declare-fun res!920453 () Bool)

(declare-fun e!780496 () Bool)

(assert (=> start!116984 (=> (not res!920453) (not e!780496))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93626 0))(
  ( (array!93627 (arr!45215 (Array (_ BitVec 32) (_ BitVec 64))) (size!45765 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93626)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116984 (= res!920453 (and (bvslt (size!45765 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45765 a!4197))))))

(assert (=> start!116984 e!780496))

(declare-fun array_inv!34243 (array!93626) Bool)

(assert (=> start!116984 (array_inv!34243 a!4197)))

(assert (=> start!116984 true))

(declare-fun b!1377827 () Bool)

(declare-fun res!920454 () Bool)

(assert (=> b!1377827 (=> (not res!920454) (not e!780496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377827 (= res!920454 (validKeyInArray!0 (select (arr!45215 a!4197) to!360)))))

(declare-fun b!1377828 () Bool)

(declare-fun res!920455 () Bool)

(assert (=> b!1377828 (=> (not res!920455) (not e!780496))))

(assert (=> b!1377828 (= res!920455 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377829 () Bool)

(assert (=> b!1377829 (= e!780496 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93626 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377829 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45723 0))(
  ( (Unit!45724) )
))
(declare-fun lt!606202 () Unit!45723)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45723)

(assert (=> b!1377829 (= lt!606202 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116984 res!920453) b!1377827))

(assert (= (and b!1377827 res!920454) b!1377828))

(assert (= (and b!1377828 res!920455) b!1377829))

(declare-fun m!1262231 () Bool)

(assert (=> start!116984 m!1262231))

(declare-fun m!1262233 () Bool)

(assert (=> b!1377827 m!1262233))

(assert (=> b!1377827 m!1262233))

(declare-fun m!1262235 () Bool)

(assert (=> b!1377827 m!1262235))

(declare-fun m!1262237 () Bool)

(assert (=> b!1377829 m!1262237))

(declare-fun m!1262239 () Bool)

(assert (=> b!1377829 m!1262239))

(declare-fun m!1262241 () Bool)

(assert (=> b!1377829 m!1262241))

(declare-fun m!1262243 () Bool)

(assert (=> b!1377829 m!1262243))

(push 1)

(assert (not b!1377827))

(assert (not b!1377829))

(assert (not start!116984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

