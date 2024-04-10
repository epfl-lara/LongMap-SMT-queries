; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117306 () Bool)

(assert start!117306)

(declare-fun res!922170 () Bool)

(declare-fun e!781651 () Bool)

(assert (=> start!117306 (=> (not res!922170) (not e!781651))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93902 0))(
  ( (array!93903 (arr!45350 (Array (_ BitVec 32) (_ BitVec 64))) (size!45900 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93902)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117306 (= res!922170 (and (bvslt (size!45900 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45900 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117306 e!781651))

(declare-fun array_inv!34378 (array!93902) Bool)

(assert (=> start!117306 (array_inv!34378 a!4010)))

(assert (=> start!117306 true))

(declare-fun b!1379732 () Bool)

(declare-fun res!922171 () Bool)

(assert (=> b!1379732 (=> (not res!922171) (not e!781651))))

(declare-fun isPivot!0 (array!93902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379732 (= res!922171 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379733 () Bool)

(assert (=> b!1379733 (= e!781651 (not true))))

(assert (=> b!1379733 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45909 0))(
  ( (Unit!45910) )
))
(declare-fun lt!607737 () Unit!45909)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45909)

(assert (=> b!1379733 (= lt!607737 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117306 res!922170) b!1379732))

(assert (= (and b!1379732 res!922171) b!1379733))

(declare-fun m!1264929 () Bool)

(assert (=> start!117306 m!1264929))

(declare-fun m!1264931 () Bool)

(assert (=> b!1379732 m!1264931))

(declare-fun m!1264933 () Bool)

(assert (=> b!1379733 m!1264933))

(declare-fun m!1264935 () Bool)

(assert (=> b!1379733 m!1264935))

(push 1)

(assert (not start!117306))

(assert (not b!1379733))

(assert (not b!1379732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

