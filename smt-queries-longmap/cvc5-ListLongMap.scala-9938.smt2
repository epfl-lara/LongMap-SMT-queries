; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117450 () Bool)

(assert start!117450)

(declare-fun b!1380094 () Bool)

(declare-fun res!922408 () Bool)

(declare-fun e!781986 () Bool)

(assert (=> b!1380094 (=> (not res!922408) (not e!781986))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(assert (=> b!1380094 (= res!922408 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380095 () Bool)

(declare-fun e!781987 () Bool)

(assert (=> b!1380095 (= e!781986 (not e!781987))))

(declare-fun res!922409 () Bool)

(assert (=> b!1380095 (=> res!922409 e!781987)))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> b!1380095 (= res!922409 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(declare-datatypes ((array!93955 0))(
  ( (array!93956 (arr!45372 (Array (_ BitVec 32) (_ BitVec 64))) (size!45924 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93955)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun isPivot!0 (array!93955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380095 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45790 0))(
  ( (Unit!45791) )
))
(declare-fun lt!607699 () Unit!45790)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45790)

(assert (=> b!1380095 (= lt!607699 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380093 () Bool)

(declare-fun res!922406 () Bool)

(assert (=> b!1380093 (=> (not res!922406) (not e!781986))))

(assert (=> b!1380093 (= res!922406 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380096 () Bool)

(assert (=> b!1380096 (= e!781987 true)))

(assert (=> b!1380096 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-fun lt!607700 () Unit!45790)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45790)

(assert (=> b!1380096 (= lt!607700 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun res!922407 () Bool)

(assert (=> start!117450 (=> (not res!922407) (not e!781986))))

(assert (=> start!117450 (= res!922407 (and (bvslt (size!45924 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45924 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117450 e!781986))

(assert (=> start!117450 true))

(declare-fun array_inv!34605 (array!93955) Bool)

(assert (=> start!117450 (array_inv!34605 a!3985)))

(assert (= (and start!117450 res!922407) b!1380093))

(assert (= (and b!1380093 res!922406) b!1380094))

(assert (= (and b!1380094 res!922408) b!1380095))

(assert (= (and b!1380095 (not res!922409)) b!1380096))

(declare-fun m!1264857 () Bool)

(assert (=> b!1380095 m!1264857))

(declare-fun m!1264859 () Bool)

(assert (=> b!1380095 m!1264859))

(declare-fun m!1264861 () Bool)

(assert (=> b!1380093 m!1264861))

(declare-fun m!1264863 () Bool)

(assert (=> b!1380096 m!1264863))

(declare-fun m!1264865 () Bool)

(assert (=> b!1380096 m!1264865))

(declare-fun m!1264867 () Bool)

(assert (=> start!117450 m!1264867))

(push 1)

(assert (not b!1380096))

(assert (not b!1380095))

(assert (not start!117450))

(assert (not b!1380093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

