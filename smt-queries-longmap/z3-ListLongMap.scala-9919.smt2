; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117284 () Bool)

(assert start!117284)

(declare-fun res!922104 () Bool)

(declare-fun e!781585 () Bool)

(assert (=> start!117284 (=> (not res!922104) (not e!781585))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93880 0))(
  ( (array!93881 (arr!45339 (Array (_ BitVec 32) (_ BitVec 64))) (size!45889 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93880)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117284 (= res!922104 (and (bvslt (size!45889 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45889 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117284 e!781585))

(declare-fun array_inv!34367 (array!93880) Bool)

(assert (=> start!117284 (array_inv!34367 a!4010)))

(assert (=> start!117284 true))

(declare-fun b!1379666 () Bool)

(declare-fun res!922105 () Bool)

(assert (=> b!1379666 (=> (not res!922105) (not e!781585))))

(declare-fun isPivot!0 (array!93880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379666 (= res!922105 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379667 () Bool)

(assert (=> b!1379667 (= e!781585 (not true))))

(assert (=> b!1379667 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45887 0))(
  ( (Unit!45888) )
))
(declare-fun lt!607704 () Unit!45887)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45887)

(assert (=> b!1379667 (= lt!607704 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117284 res!922104) b!1379666))

(assert (= (and b!1379666 res!922105) b!1379667))

(declare-fun m!1264841 () Bool)

(assert (=> start!117284 m!1264841))

(declare-fun m!1264843 () Bool)

(assert (=> b!1379666 m!1264843))

(declare-fun m!1264845 () Bool)

(assert (=> b!1379667 m!1264845))

(declare-fun m!1264847 () Bool)

(assert (=> b!1379667 m!1264847))

(check-sat (not b!1379666) (not b!1379667) (not start!117284))
