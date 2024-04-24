; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117230 () Bool)

(assert start!117230)

(declare-fun res!921047 () Bool)

(declare-fun e!781392 () Bool)

(assert (=> start!117230 (=> (not res!921047) (not e!781392))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93758 0))(
  ( (array!93759 (arr!45276 (Array (_ BitVec 32) (_ BitVec 64))) (size!45827 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93758)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117230 (= res!921047 (and (bvslt (size!45827 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45827 a!4197))))))

(assert (=> start!117230 e!781392))

(declare-fun array_inv!34557 (array!93758) Bool)

(assert (=> start!117230 (array_inv!34557 a!4197)))

(assert (=> start!117230 true))

(declare-fun b!1379205 () Bool)

(declare-fun res!921048 () Bool)

(assert (=> b!1379205 (=> (not res!921048) (not e!781392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379205 (= res!921048 (validKeyInArray!0 (select (arr!45276 a!4197) to!360)))))

(declare-fun b!1379206 () Bool)

(declare-fun res!921046 () Bool)

(assert (=> b!1379206 (=> (not res!921046) (not e!781392))))

(assert (=> b!1379206 (= res!921046 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1379207 () Bool)

(assert (=> b!1379207 (= e!781392 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93758 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379207 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45678 0))(
  ( (Unit!45679) )
))
(declare-fun lt!606706 () Unit!45678)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45678)

(assert (=> b!1379207 (= lt!606706 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117230 res!921047) b!1379205))

(assert (= (and b!1379205 res!921048) b!1379206))

(assert (= (and b!1379206 res!921046) b!1379207))

(declare-fun m!1263971 () Bool)

(assert (=> start!117230 m!1263971))

(declare-fun m!1263973 () Bool)

(assert (=> b!1379205 m!1263973))

(assert (=> b!1379205 m!1263973))

(declare-fun m!1263975 () Bool)

(assert (=> b!1379205 m!1263975))

(declare-fun m!1263977 () Bool)

(assert (=> b!1379207 m!1263977))

(declare-fun m!1263979 () Bool)

(assert (=> b!1379207 m!1263979))

(declare-fun m!1263981 () Bool)

(assert (=> b!1379207 m!1263981))

(declare-fun m!1263983 () Bool)

(assert (=> b!1379207 m!1263983))

(push 1)

(assert (not b!1379205))

(assert (not start!117230))

(assert (not b!1379207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

