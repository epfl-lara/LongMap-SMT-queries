; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117306 () Bool)

(assert start!117306)

(declare-fun res!922156 () Bool)

(declare-fun e!781632 () Bool)

(assert (=> start!117306 (=> (not res!922156) (not e!781632))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93856 0))(
  ( (array!93857 (arr!45327 (Array (_ BitVec 32) (_ BitVec 64))) (size!45879 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93856)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117306 (= res!922156 (and (bvslt (size!45879 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45879 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117306 e!781632))

(declare-fun array_inv!34560 (array!93856) Bool)

(assert (=> start!117306 (array_inv!34560 a!4010)))

(assert (=> start!117306 true))

(declare-fun b!1379675 () Bool)

(declare-fun res!922157 () Bool)

(assert (=> b!1379675 (=> (not res!922157) (not e!781632))))

(declare-fun isPivot!0 (array!93856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379675 (= res!922157 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379676 () Bool)

(assert (=> b!1379676 (= e!781632 (not true))))

(assert (=> b!1379676 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45754 0))(
  ( (Unit!45755) )
))
(declare-fun lt!607559 () Unit!45754)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45754)

(assert (=> b!1379676 (= lt!607559 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117306 res!922156) b!1379675))

(assert (= (and b!1379675 res!922157) b!1379676))

(declare-fun m!1264441 () Bool)

(assert (=> start!117306 m!1264441))

(declare-fun m!1264443 () Bool)

(assert (=> b!1379675 m!1264443))

(declare-fun m!1264445 () Bool)

(assert (=> b!1379676 m!1264445))

(declare-fun m!1264447 () Bool)

(assert (=> b!1379676 m!1264447))

(push 1)

(assert (not b!1379675))

(assert (not b!1379676))

(assert (not start!117306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

