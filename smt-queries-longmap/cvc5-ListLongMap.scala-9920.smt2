; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117288 () Bool)

(assert start!117288)

(declare-fun res!922117 () Bool)

(declare-fun e!781598 () Bool)

(assert (=> start!117288 (=> (not res!922117) (not e!781598))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93884 0))(
  ( (array!93885 (arr!45341 (Array (_ BitVec 32) (_ BitVec 64))) (size!45891 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93884)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117288 (= res!922117 (and (bvslt (size!45891 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45891 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117288 e!781598))

(declare-fun array_inv!34369 (array!93884) Bool)

(assert (=> start!117288 (array_inv!34369 a!4010)))

(assert (=> start!117288 true))

(declare-fun b!1379678 () Bool)

(declare-fun res!922116 () Bool)

(assert (=> b!1379678 (=> (not res!922116) (not e!781598))))

(declare-fun isPivot!0 (array!93884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379678 (= res!922116 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379679 () Bool)

(assert (=> b!1379679 (= e!781598 (not (bvsge pivot!64 #b00000000000000000000000000000000)))))

(assert (=> b!1379679 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45891 0))(
  ( (Unit!45892) )
))
(declare-fun lt!607710 () Unit!45891)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45891)

(assert (=> b!1379679 (= lt!607710 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117288 res!922117) b!1379678))

(assert (= (and b!1379678 res!922116) b!1379679))

(declare-fun m!1264857 () Bool)

(assert (=> start!117288 m!1264857))

(declare-fun m!1264859 () Bool)

(assert (=> b!1379678 m!1264859))

(declare-fun m!1264861 () Bool)

(assert (=> b!1379679 m!1264861))

(declare-fun m!1264863 () Bool)

(assert (=> b!1379679 m!1264863))

(push 1)

(assert (not b!1379678))

(assert (not b!1379679))

(assert (not start!117288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

