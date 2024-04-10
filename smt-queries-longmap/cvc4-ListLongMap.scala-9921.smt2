; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117298 () Bool)

(assert start!117298)

(declare-fun res!922147 () Bool)

(declare-fun e!781627 () Bool)

(assert (=> start!117298 (=> (not res!922147) (not e!781627))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93894 0))(
  ( (array!93895 (arr!45346 (Array (_ BitVec 32) (_ BitVec 64))) (size!45896 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93894)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117298 (= res!922147 (and (bvslt (size!45896 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45896 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117298 e!781627))

(declare-fun array_inv!34374 (array!93894) Bool)

(assert (=> start!117298 (array_inv!34374 a!4010)))

(assert (=> start!117298 true))

(declare-fun b!1379708 () Bool)

(declare-fun res!922146 () Bool)

(assert (=> b!1379708 (=> (not res!922146) (not e!781627))))

(declare-fun isPivot!0 (array!93894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379708 (= res!922146 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379709 () Bool)

(assert (=> b!1379709 (= e!781627 (not true))))

(assert (=> b!1379709 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45901 0))(
  ( (Unit!45902) )
))
(declare-fun lt!607725 () Unit!45901)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45901)

(assert (=> b!1379709 (= lt!607725 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117298 res!922147) b!1379708))

(assert (= (and b!1379708 res!922146) b!1379709))

(declare-fun m!1264897 () Bool)

(assert (=> start!117298 m!1264897))

(declare-fun m!1264899 () Bool)

(assert (=> b!1379708 m!1264899))

(declare-fun m!1264901 () Bool)

(assert (=> b!1379709 m!1264901))

(declare-fun m!1264903 () Bool)

(assert (=> b!1379709 m!1264903))

(push 1)

(assert (not start!117298))

(assert (not b!1379709))

(assert (not b!1379708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

