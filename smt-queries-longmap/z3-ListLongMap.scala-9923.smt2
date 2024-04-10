; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117308 () Bool)

(assert start!117308)

(declare-fun res!922177 () Bool)

(declare-fun e!781657 () Bool)

(assert (=> start!117308 (=> (not res!922177) (not e!781657))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93904 0))(
  ( (array!93905 (arr!45351 (Array (_ BitVec 32) (_ BitVec 64))) (size!45901 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93904)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117308 (= res!922177 (and (bvslt (size!45901 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45901 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117308 e!781657))

(declare-fun array_inv!34379 (array!93904) Bool)

(assert (=> start!117308 (array_inv!34379 a!4010)))

(assert (=> start!117308 true))

(declare-fun b!1379738 () Bool)

(declare-fun res!922176 () Bool)

(assert (=> b!1379738 (=> (not res!922176) (not e!781657))))

(declare-fun isPivot!0 (array!93904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379738 (= res!922176 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379739 () Bool)

(assert (=> b!1379739 (= e!781657 (not true))))

(assert (=> b!1379739 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45911 0))(
  ( (Unit!45912) )
))
(declare-fun lt!607740 () Unit!45911)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45911)

(assert (=> b!1379739 (= lt!607740 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117308 res!922177) b!1379738))

(assert (= (and b!1379738 res!922176) b!1379739))

(declare-fun m!1264937 () Bool)

(assert (=> start!117308 m!1264937))

(declare-fun m!1264939 () Bool)

(assert (=> b!1379738 m!1264939))

(declare-fun m!1264941 () Bool)

(assert (=> b!1379739 m!1264941))

(declare-fun m!1264943 () Bool)

(assert (=> b!1379739 m!1264943))

(check-sat (not start!117308) (not b!1379739) (not b!1379738))
