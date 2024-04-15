; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117410 () Bool)

(assert start!117410)

(declare-fun b!1379937 () Bool)

(declare-fun e!781852 () Bool)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> b!1379937 (= e!781852 (bvsgt to!159 from!3363))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93915 0))(
  ( (array!93916 (arr!45352 (Array (_ BitVec 32) (_ BitVec 64))) (size!45904 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93915)

(declare-fun isPivot!0 (array!93915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379937 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-datatypes ((Unit!45768 0))(
  ( (Unit!45769) )
))
(declare-fun lt!607643 () Unit!45768)

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45768)

(assert (=> b!1379937 (= lt!607643 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun b!1379936 () Bool)

(declare-fun e!781850 () Bool)

(assert (=> b!1379936 (= e!781850 (not e!781852))))

(declare-fun res!922248 () Bool)

(assert (=> b!1379936 (=> res!922248 e!781852)))

(assert (=> b!1379936 (= res!922248 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1379936 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-fun lt!607642 () Unit!45768)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45768)

(assert (=> b!1379936 (= lt!607642 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun res!922249 () Bool)

(assert (=> start!117410 (=> (not res!922249) (not e!781850))))

(assert (=> start!117410 (= res!922249 (and (bvslt (size!45904 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45904 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117410 e!781850))

(assert (=> start!117410 true))

(declare-fun array_inv!34585 (array!93915) Bool)

(assert (=> start!117410 (array_inv!34585 a!3985)))

(declare-fun b!1379935 () Bool)

(declare-fun res!922250 () Bool)

(assert (=> b!1379935 (=> (not res!922250) (not e!781850))))

(assert (=> b!1379935 (= res!922250 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1379934 () Bool)

(declare-fun res!922247 () Bool)

(assert (=> b!1379934 (=> (not res!922247) (not e!781850))))

(assert (=> b!1379934 (= res!922247 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117410 res!922249) b!1379934))

(assert (= (and b!1379934 res!922247) b!1379935))

(assert (= (and b!1379935 res!922250) b!1379936))

(assert (= (and b!1379936 (not res!922248)) b!1379937))

(declare-fun m!1264713 () Bool)

(assert (=> b!1379937 m!1264713))

(declare-fun m!1264715 () Bool)

(assert (=> b!1379937 m!1264715))

(declare-fun m!1264717 () Bool)

(assert (=> b!1379936 m!1264717))

(declare-fun m!1264719 () Bool)

(assert (=> b!1379936 m!1264719))

(declare-fun m!1264721 () Bool)

(assert (=> start!117410 m!1264721))

(declare-fun m!1264723 () Bool)

(assert (=> b!1379934 m!1264723))

(check-sat (not b!1379937) (not start!117410) (not b!1379936) (not b!1379934))
(check-sat)
