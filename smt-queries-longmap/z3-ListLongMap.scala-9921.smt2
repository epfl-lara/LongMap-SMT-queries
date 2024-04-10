; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117296 () Bool)

(assert start!117296)

(declare-fun res!922141 () Bool)

(declare-fun e!781622 () Bool)

(assert (=> start!117296 (=> (not res!922141) (not e!781622))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93892 0))(
  ( (array!93893 (arr!45345 (Array (_ BitVec 32) (_ BitVec 64))) (size!45895 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93892)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117296 (= res!922141 (and (bvslt (size!45895 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45895 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117296 e!781622))

(declare-fun array_inv!34373 (array!93892) Bool)

(assert (=> start!117296 (array_inv!34373 a!4010)))

(assert (=> start!117296 true))

(declare-fun b!1379702 () Bool)

(declare-fun res!922140 () Bool)

(assert (=> b!1379702 (=> (not res!922140) (not e!781622))))

(declare-fun isPivot!0 (array!93892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379702 (= res!922140 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379703 () Bool)

(assert (=> b!1379703 (= e!781622 (not true))))

(assert (=> b!1379703 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45899 0))(
  ( (Unit!45900) )
))
(declare-fun lt!607722 () Unit!45899)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45899)

(assert (=> b!1379703 (= lt!607722 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117296 res!922141) b!1379702))

(assert (= (and b!1379702 res!922140) b!1379703))

(declare-fun m!1264889 () Bool)

(assert (=> start!117296 m!1264889))

(declare-fun m!1264891 () Bool)

(assert (=> b!1379702 m!1264891))

(declare-fun m!1264893 () Bool)

(assert (=> b!1379703 m!1264893))

(declare-fun m!1264895 () Bool)

(assert (=> b!1379703 m!1264895))

(check-sat (not start!117296) (not b!1379703) (not b!1379702))
