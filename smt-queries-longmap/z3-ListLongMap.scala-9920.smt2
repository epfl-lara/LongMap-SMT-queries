; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117290 () Bool)

(assert start!117290)

(declare-fun res!922122 () Bool)

(declare-fun e!781604 () Bool)

(assert (=> start!117290 (=> (not res!922122) (not e!781604))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93886 0))(
  ( (array!93887 (arr!45342 (Array (_ BitVec 32) (_ BitVec 64))) (size!45892 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93886)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117290 (= res!922122 (and (bvslt (size!45892 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45892 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117290 e!781604))

(declare-fun array_inv!34370 (array!93886) Bool)

(assert (=> start!117290 (array_inv!34370 a!4010)))

(assert (=> start!117290 true))

(declare-fun b!1379684 () Bool)

(declare-fun res!922123 () Bool)

(assert (=> b!1379684 (=> (not res!922123) (not e!781604))))

(declare-fun isPivot!0 (array!93886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379684 (= res!922123 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379685 () Bool)

(assert (=> b!1379685 (= e!781604 (not (bvsge pivot!64 #b00000000000000000000000000000000)))))

(assert (=> b!1379685 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45893 0))(
  ( (Unit!45894) )
))
(declare-fun lt!607713 () Unit!45893)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45893)

(assert (=> b!1379685 (= lt!607713 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117290 res!922122) b!1379684))

(assert (= (and b!1379684 res!922123) b!1379685))

(declare-fun m!1264865 () Bool)

(assert (=> start!117290 m!1264865))

(declare-fun m!1264867 () Bool)

(assert (=> b!1379684 m!1264867))

(declare-fun m!1264869 () Bool)

(assert (=> b!1379685 m!1264869))

(declare-fun m!1264871 () Bool)

(assert (=> b!1379685 m!1264871))

(check-sat (not b!1379684) (not b!1379685) (not start!117290))
(check-sat)
