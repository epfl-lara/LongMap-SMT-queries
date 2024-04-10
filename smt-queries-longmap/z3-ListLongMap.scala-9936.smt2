; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117440 () Bool)

(assert start!117440)

(declare-fun res!922363 () Bool)

(declare-fun e!781967 () Bool)

(assert (=> start!117440 (=> (not res!922363) (not e!781967))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93991 0))(
  ( (array!93992 (arr!45390 (Array (_ BitVec 32) (_ BitVec 64))) (size!45940 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93991)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117440 (= res!922363 (and (bvslt (size!45940 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45940 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117440 e!781967))

(assert (=> start!117440 true))

(declare-fun array_inv!34418 (array!93991) Bool)

(assert (=> start!117440 (array_inv!34418 a!3985)))

(declare-fun b!1380091 () Bool)

(declare-fun res!922362 () Bool)

(assert (=> b!1380091 (=> (not res!922362) (not e!781967))))

(declare-fun isPivot!0 (array!93991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380091 (= res!922362 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380092 () Bool)

(declare-fun res!922361 () Bool)

(assert (=> b!1380092 (=> (not res!922361) (not e!781967))))

(assert (=> b!1380092 (= res!922361 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380093 () Bool)

(assert (=> b!1380093 (= e!781967 (not (and (bvsle (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvsge (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363))))))

(assert (=> b!1380093 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45935 0))(
  ( (Unit!45936) )
))
(declare-fun lt!607854 () Unit!45935)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45935)

(assert (=> b!1380093 (= lt!607854 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117440 res!922363) b!1380091))

(assert (= (and b!1380091 res!922362) b!1380092))

(assert (= (and b!1380092 res!922361) b!1380093))

(declare-fun m!1265297 () Bool)

(assert (=> start!117440 m!1265297))

(declare-fun m!1265299 () Bool)

(assert (=> b!1380091 m!1265299))

(declare-fun m!1265301 () Bool)

(assert (=> b!1380093 m!1265301))

(declare-fun m!1265303 () Bool)

(assert (=> b!1380093 m!1265303))

(check-sat (not b!1380091) (not start!117440) (not b!1380093))
(check-sat)
