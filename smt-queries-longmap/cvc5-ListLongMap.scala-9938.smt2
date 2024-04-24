; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117686 () Bool)

(assert start!117686)

(declare-fun b!1381473 () Bool)

(declare-fun res!922955 () Bool)

(declare-fun e!782868 () Bool)

(assert (=> b!1381473 (=> (not res!922955) (not e!782868))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(assert (=> b!1381473 (= res!922955 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1381472 () Bool)

(declare-fun res!922954 () Bool)

(assert (=> b!1381472 (=> (not res!922954) (not e!782868))))

(declare-datatypes ((array!94121 0))(
  ( (array!94122 (arr!45450 (Array (_ BitVec 32) (_ BitVec 64))) (size!46001 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94121)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun isPivot!0 (array!94121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381472 (= res!922954 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1381475 () Bool)

(declare-fun e!782866 () Bool)

(assert (=> b!1381475 (= e!782866 true)))

(assert (=> b!1381475 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-datatypes ((Unit!45888 0))(
  ( (Unit!45889) )
))
(declare-fun lt!608364 () Unit!45888)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45888)

(assert (=> b!1381475 (= lt!608364 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun res!922953 () Bool)

(assert (=> start!117686 (=> (not res!922953) (not e!782868))))

(assert (=> start!117686 (= res!922953 (and (bvslt (size!46001 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!46001 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117686 e!782868))

(assert (=> start!117686 true))

(declare-fun array_inv!34731 (array!94121) Bool)

(assert (=> start!117686 (array_inv!34731 a!3985)))

(declare-fun b!1381474 () Bool)

(assert (=> b!1381474 (= e!782868 (not e!782866))))

(declare-fun res!922956 () Bool)

(assert (=> b!1381474 (=> res!922956 e!782866)))

(assert (=> b!1381474 (= res!922956 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1381474 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-fun lt!608365 () Unit!45888)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!94121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45888)

(assert (=> b!1381474 (= lt!608365 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117686 res!922953) b!1381472))

(assert (= (and b!1381472 res!922954) b!1381473))

(assert (= (and b!1381473 res!922955) b!1381474))

(assert (= (and b!1381474 (not res!922956)) b!1381475))

(declare-fun m!1266997 () Bool)

(assert (=> b!1381472 m!1266997))

(declare-fun m!1266999 () Bool)

(assert (=> b!1381475 m!1266999))

(declare-fun m!1267001 () Bool)

(assert (=> b!1381475 m!1267001))

(declare-fun m!1267003 () Bool)

(assert (=> start!117686 m!1267003))

(declare-fun m!1267005 () Bool)

(assert (=> b!1381474 m!1267005))

(declare-fun m!1267007 () Bool)

(assert (=> b!1381474 m!1267007))

(push 1)

(assert (not b!1381475))

(assert (not start!117686))

(assert (not b!1381474))

(assert (not b!1381472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

