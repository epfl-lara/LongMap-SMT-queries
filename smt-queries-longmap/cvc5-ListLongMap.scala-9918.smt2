; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117512 () Bool)

(assert start!117512)

(declare-fun res!922613 () Bool)

(declare-fun e!782423 () Bool)

(assert (=> start!117512 (=> (not res!922613) (not e!782423))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93992 0))(
  ( (array!93993 (arr!45390 (Array (_ BitVec 32) (_ BitVec 64))) (size!45941 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93992)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117512 (= res!922613 (and (bvslt (size!45941 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45941 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117512 e!782423))

(declare-fun array_inv!34671 (array!93992) Bool)

(assert (=> start!117512 (array_inv!34671 a!4010)))

(assert (=> start!117512 true))

(declare-fun b!1380964 () Bool)

(declare-fun res!922614 () Bool)

(assert (=> b!1380964 (=> (not res!922614) (not e!782423))))

(declare-fun isPivot!0 (array!93992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380964 (= res!922614 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1380965 () Bool)

(assert (=> b!1380965 (= e!782423 (not (bvsle pivot!64 (size!45941 a!4010))))))

(assert (=> b!1380965 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45822 0))(
  ( (Unit!45823) )
))
(declare-fun lt!608179 () Unit!45822)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45822)

(assert (=> b!1380965 (= lt!608179 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117512 res!922613) b!1380964))

(assert (= (and b!1380964 res!922614) b!1380965))

(declare-fun m!1266461 () Bool)

(assert (=> start!117512 m!1266461))

(declare-fun m!1266463 () Bool)

(assert (=> b!1380964 m!1266463))

(declare-fun m!1266465 () Bool)

(assert (=> b!1380965 m!1266465))

(declare-fun m!1266467 () Bool)

(assert (=> b!1380965 m!1266467))

(push 1)

(assert (not b!1380965))

(assert (not start!117512))

(assert (not b!1380964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

