; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117540 () Bool)

(assert start!117540)

(declare-fun res!922697 () Bool)

(declare-fun e!782507 () Bool)

(assert (=> start!117540 (=> (not res!922697) (not e!782507))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94020 0))(
  ( (array!94021 (arr!45404 (Array (_ BitVec 32) (_ BitVec 64))) (size!45955 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94020)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117540 (= res!922697 (and (bvslt (size!45955 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45955 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117540 e!782507))

(declare-fun array_inv!34685 (array!94020) Bool)

(assert (=> start!117540 (array_inv!34685 a!4010)))

(assert (=> start!117540 true))

(declare-fun b!1381048 () Bool)

(declare-fun res!922698 () Bool)

(assert (=> b!1381048 (=> (not res!922698) (not e!782507))))

(declare-fun isPivot!0 (array!94020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381048 (= res!922698 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1381049 () Bool)

(assert (=> b!1381049 (= e!782507 (not true))))

(assert (=> b!1381049 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45850 0))(
  ( (Unit!45851) )
))
(declare-fun lt!608221 () Unit!45850)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45850)

(assert (=> b!1381049 (= lt!608221 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117540 res!922697) b!1381048))

(assert (= (and b!1381048 res!922698) b!1381049))

(declare-fun m!1266573 () Bool)

(assert (=> start!117540 m!1266573))

(declare-fun m!1266575 () Bool)

(assert (=> b!1381048 m!1266575))

(declare-fun m!1266577 () Bool)

(assert (=> b!1381049 m!1266577))

(declare-fun m!1266579 () Bool)

(assert (=> b!1381049 m!1266579))

(push 1)

(assert (not b!1381048))

(assert (not b!1381049))

(assert (not start!117540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

