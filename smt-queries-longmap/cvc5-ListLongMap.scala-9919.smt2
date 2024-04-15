; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117282 () Bool)

(assert start!117282)

(declare-fun res!922084 () Bool)

(declare-fun e!781561 () Bool)

(assert (=> start!117282 (=> (not res!922084) (not e!781561))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93832 0))(
  ( (array!93833 (arr!45315 (Array (_ BitVec 32) (_ BitVec 64))) (size!45867 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93832)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117282 (= res!922084 (and (bvslt (size!45867 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45867 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117282 e!781561))

(declare-fun array_inv!34548 (array!93832) Bool)

(assert (=> start!117282 (array_inv!34548 a!4010)))

(assert (=> start!117282 true))

(declare-fun b!1379603 () Bool)

(declare-fun res!922085 () Bool)

(assert (=> b!1379603 (=> (not res!922085) (not e!781561))))

(declare-fun isPivot!0 (array!93832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379603 (= res!922085 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379604 () Bool)

(assert (=> b!1379604 (= e!781561 (not true))))

(assert (=> b!1379604 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45730 0))(
  ( (Unit!45731) )
))
(declare-fun lt!607523 () Unit!45730)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45730)

(assert (=> b!1379604 (= lt!607523 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117282 res!922084) b!1379603))

(assert (= (and b!1379603 res!922085) b!1379604))

(declare-fun m!1264345 () Bool)

(assert (=> start!117282 m!1264345))

(declare-fun m!1264347 () Bool)

(assert (=> b!1379603 m!1264347))

(declare-fun m!1264349 () Bool)

(assert (=> b!1379604 m!1264349))

(declare-fun m!1264351 () Bool)

(assert (=> b!1379604 m!1264351))

(push 1)

(assert (not b!1379603))

(assert (not b!1379604))

(assert (not start!117282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

