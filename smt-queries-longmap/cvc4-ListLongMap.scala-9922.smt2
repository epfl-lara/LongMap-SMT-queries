; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117534 () Bool)

(assert start!117534)

(declare-fun res!922679 () Bool)

(declare-fun e!782490 () Bool)

(assert (=> start!117534 (=> (not res!922679) (not e!782490))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94014 0))(
  ( (array!94015 (arr!45401 (Array (_ BitVec 32) (_ BitVec 64))) (size!45952 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94014)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117534 (= res!922679 (and (bvslt (size!45952 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45952 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117534 e!782490))

(declare-fun array_inv!34682 (array!94014) Bool)

(assert (=> start!117534 (array_inv!34682 a!4010)))

(assert (=> start!117534 true))

(declare-fun b!1381030 () Bool)

(declare-fun res!922680 () Bool)

(assert (=> b!1381030 (=> (not res!922680) (not e!782490))))

(declare-fun isPivot!0 (array!94014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381030 (= res!922680 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1381031 () Bool)

(assert (=> b!1381031 (= e!782490 (not true))))

(assert (=> b!1381031 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45844 0))(
  ( (Unit!45845) )
))
(declare-fun lt!608212 () Unit!45844)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45844)

(assert (=> b!1381031 (= lt!608212 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117534 res!922679) b!1381030))

(assert (= (and b!1381030 res!922680) b!1381031))

(declare-fun m!1266549 () Bool)

(assert (=> start!117534 m!1266549))

(declare-fun m!1266551 () Bool)

(assert (=> b!1381030 m!1266551))

(declare-fun m!1266553 () Bool)

(assert (=> b!1381031 m!1266553))

(declare-fun m!1266555 () Bool)

(assert (=> b!1381031 m!1266555))

(push 1)

(assert (not b!1381030))

(assert (not start!117534))

(assert (not b!1381031))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

