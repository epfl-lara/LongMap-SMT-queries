; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117450 () Bool)

(assert start!117450)

(declare-fun b!1380141 () Bool)

(declare-fun e!781998 () Bool)

(assert (=> b!1380141 (= e!781998 true)))

(declare-datatypes ((array!94001 0))(
  ( (array!94002 (arr!45395 (Array (_ BitVec 32) (_ BitVec 64))) (size!45945 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94001)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-fun isPivot!0 (array!94001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380141 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-datatypes ((Unit!45945 0))(
  ( (Unit!45946) )
))
(declare-fun lt!607871 () Unit!45945)

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45945)

(assert (=> b!1380141 (= lt!607871 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun res!922408 () Bool)

(declare-fun e!782000 () Bool)

(assert (=> start!117450 (=> (not res!922408) (not e!782000))))

(assert (=> start!117450 (= res!922408 (and (bvslt (size!45945 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45945 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117450 e!782000))

(assert (=> start!117450 true))

(declare-fun array_inv!34423 (array!94001) Bool)

(assert (=> start!117450 (array_inv!34423 a!3985)))

(declare-fun b!1380140 () Bool)

(assert (=> b!1380140 (= e!782000 (not e!781998))))

(declare-fun res!922411 () Bool)

(assert (=> b!1380140 (=> res!922411 e!781998)))

(assert (=> b!1380140 (= res!922411 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1380140 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-fun lt!607872 () Unit!45945)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!94001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45945)

(assert (=> b!1380140 (= lt!607872 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380139 () Bool)

(declare-fun res!922409 () Bool)

(assert (=> b!1380139 (=> (not res!922409) (not e!782000))))

(assert (=> b!1380139 (= res!922409 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380138 () Bool)

(declare-fun res!922410 () Bool)

(assert (=> b!1380138 (=> (not res!922410) (not e!782000))))

(assert (=> b!1380138 (= res!922410 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117450 res!922408) b!1380138))

(assert (= (and b!1380138 res!922410) b!1380139))

(assert (= (and b!1380139 res!922409) b!1380140))

(assert (= (and b!1380140 (not res!922411)) b!1380141))

(declare-fun m!1265337 () Bool)

(assert (=> b!1380141 m!1265337))

(declare-fun m!1265339 () Bool)

(assert (=> b!1380141 m!1265339))

(declare-fun m!1265341 () Bool)

(assert (=> start!117450 m!1265341))

(declare-fun m!1265343 () Bool)

(assert (=> b!1380140 m!1265343))

(declare-fun m!1265345 () Bool)

(assert (=> b!1380140 m!1265345))

(declare-fun m!1265347 () Bool)

(assert (=> b!1380138 m!1265347))

(push 1)

(assert (not b!1380140))

(assert (not start!117450))

(assert (not b!1380141))

(assert (not b!1380138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

