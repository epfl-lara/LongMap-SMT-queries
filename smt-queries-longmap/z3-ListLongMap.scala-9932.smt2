; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117416 () Bool)

(assert start!117416)

(declare-fun b!1380015 () Bool)

(declare-fun res!922288 () Bool)

(declare-fun e!781892 () Bool)

(assert (=> b!1380015 (=> (not res!922288) (not e!781892))))

(declare-datatypes ((array!93967 0))(
  ( (array!93968 (arr!45378 (Array (_ BitVec 32) (_ BitVec 64))) (size!45928 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93967)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun isPivot!0 (array!93967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380015 (= res!922288 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun res!922287 () Bool)

(assert (=> start!117416 (=> (not res!922287) (not e!781892))))

(declare-fun pivot!40 () (_ BitVec 32))

(assert (=> start!117416 (= res!922287 (and (bvslt (size!45928 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45928 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117416 e!781892))

(assert (=> start!117416 true))

(declare-fun array_inv!34406 (array!93967) Bool)

(assert (=> start!117416 (array_inv!34406 a!3985)))

(declare-fun b!1380017 () Bool)

(declare-fun e!781890 () Bool)

(assert (=> b!1380017 (= e!781892 (not e!781890))))

(declare-fun res!922286 () Bool)

(assert (=> b!1380017 (=> res!922286 e!781890)))

(assert (=> b!1380017 (= res!922286 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1380017 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45929 0))(
  ( (Unit!45930) )
))
(declare-fun lt!607833 () Unit!45929)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45929)

(assert (=> b!1380017 (= lt!607833 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380016 () Bool)

(declare-fun res!922285 () Bool)

(assert (=> b!1380016 (=> (not res!922285) (not e!781892))))

(assert (=> b!1380016 (= res!922285 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380018 () Bool)

(assert (=> b!1380018 (= e!781890 (bvsgt to!159 from!3363))))

(assert (=> b!1380018 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-fun lt!607832 () Unit!45929)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45929)

(assert (=> b!1380018 (= lt!607832 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(assert (= (and start!117416 res!922287) b!1380015))

(assert (= (and b!1380015 res!922288) b!1380016))

(assert (= (and b!1380016 res!922285) b!1380017))

(assert (= (and b!1380017 (not res!922286)) b!1380018))

(declare-fun m!1265229 () Bool)

(assert (=> b!1380015 m!1265229))

(declare-fun m!1265231 () Bool)

(assert (=> start!117416 m!1265231))

(declare-fun m!1265233 () Bool)

(assert (=> b!1380017 m!1265233))

(declare-fun m!1265235 () Bool)

(assert (=> b!1380017 m!1265235))

(declare-fun m!1265237 () Bool)

(assert (=> b!1380018 m!1265237))

(declare-fun m!1265239 () Bool)

(assert (=> b!1380018 m!1265239))

(check-sat (not b!1380015) (not b!1380018) (not start!117416) (not b!1380017))
(check-sat)
