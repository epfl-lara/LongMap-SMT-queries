; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117310 () Bool)

(assert start!117310)

(declare-fun res!922182 () Bool)

(declare-fun e!781663 () Bool)

(assert (=> start!117310 (=> (not res!922182) (not e!781663))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93906 0))(
  ( (array!93907 (arr!45352 (Array (_ BitVec 32) (_ BitVec 64))) (size!45902 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93906)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117310 (= res!922182 (and (bvslt (size!45902 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45902 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117310 e!781663))

(declare-fun array_inv!34380 (array!93906) Bool)

(assert (=> start!117310 (array_inv!34380 a!4010)))

(assert (=> start!117310 true))

(declare-fun b!1379744 () Bool)

(declare-fun res!922183 () Bool)

(assert (=> b!1379744 (=> (not res!922183) (not e!781663))))

(declare-fun isPivot!0 (array!93906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379744 (= res!922183 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379745 () Bool)

(assert (=> b!1379745 (= e!781663 (not true))))

(assert (=> b!1379745 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45913 0))(
  ( (Unit!45914) )
))
(declare-fun lt!607743 () Unit!45913)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45913)

(assert (=> b!1379745 (= lt!607743 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117310 res!922182) b!1379744))

(assert (= (and b!1379744 res!922183) b!1379745))

(declare-fun m!1264945 () Bool)

(assert (=> start!117310 m!1264945))

(declare-fun m!1264947 () Bool)

(assert (=> b!1379744 m!1264947))

(declare-fun m!1264949 () Bool)

(assert (=> b!1379745 m!1264949))

(declare-fun m!1264951 () Bool)

(assert (=> b!1379745 m!1264951))

(push 1)

(assert (not start!117310))

(assert (not b!1379745))

(assert (not b!1379744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

