; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117516 () Bool)

(assert start!117516)

(declare-fun res!922625 () Bool)

(declare-fun e!782435 () Bool)

(assert (=> start!117516 (=> (not res!922625) (not e!782435))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93996 0))(
  ( (array!93997 (arr!45392 (Array (_ BitVec 32) (_ BitVec 64))) (size!45943 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93996)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117516 (= res!922625 (and (bvslt (size!45943 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45943 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117516 e!782435))

(declare-fun array_inv!34673 (array!93996) Bool)

(assert (=> start!117516 (array_inv!34673 a!4010)))

(assert (=> start!117516 true))

(declare-fun b!1380976 () Bool)

(declare-fun res!922626 () Bool)

(assert (=> b!1380976 (=> (not res!922626) (not e!782435))))

(declare-fun isPivot!0 (array!93996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380976 (= res!922626 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1380977 () Bool)

(assert (=> b!1380977 (= e!782435 (not true))))

(assert (=> b!1380977 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45826 0))(
  ( (Unit!45827) )
))
(declare-fun lt!608185 () Unit!45826)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45826)

(assert (=> b!1380977 (= lt!608185 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117516 res!922625) b!1380976))

(assert (= (and b!1380976 res!922626) b!1380977))

(declare-fun m!1266477 () Bool)

(assert (=> start!117516 m!1266477))

(declare-fun m!1266479 () Bool)

(assert (=> b!1380976 m!1266479))

(declare-fun m!1266481 () Bool)

(assert (=> b!1380977 m!1266481))

(declare-fun m!1266483 () Bool)

(assert (=> b!1380977 m!1266483))

(push 1)

(assert (not b!1380977))

(assert (not b!1380976))

(assert (not start!117516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

