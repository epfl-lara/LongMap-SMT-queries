; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117418 () Bool)

(assert start!117418)

(declare-fun b!1380030 () Bool)

(declare-fun e!781899 () Bool)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> b!1380030 (= e!781899 (bvsgt to!159 from!3363))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93969 0))(
  ( (array!93970 (arr!45379 (Array (_ BitVec 32) (_ BitVec 64))) (size!45929 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93969)

(declare-fun isPivot!0 (array!93969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380030 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-datatypes ((Unit!45931 0))(
  ( (Unit!45932) )
))
(declare-fun lt!607838 () Unit!45931)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45931)

(assert (=> b!1380030 (= lt!607838 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun b!1380029 () Bool)

(declare-fun e!781901 () Bool)

(assert (=> b!1380029 (= e!781901 (not e!781899))))

(declare-fun res!922298 () Bool)

(assert (=> b!1380029 (=> res!922298 e!781899)))

(assert (=> b!1380029 (= res!922298 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1380029 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-fun lt!607839 () Unit!45931)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45931)

(assert (=> b!1380029 (= lt!607839 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun res!922297 () Bool)

(assert (=> start!117418 (=> (not res!922297) (not e!781901))))

(assert (=> start!117418 (= res!922297 (and (bvslt (size!45929 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45929 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117418 e!781901))

(assert (=> start!117418 true))

(declare-fun array_inv!34407 (array!93969) Bool)

(assert (=> start!117418 (array_inv!34407 a!3985)))

(declare-fun b!1380028 () Bool)

(declare-fun res!922300 () Bool)

(assert (=> b!1380028 (=> (not res!922300) (not e!781901))))

(assert (=> b!1380028 (= res!922300 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380027 () Bool)

(declare-fun res!922299 () Bool)

(assert (=> b!1380027 (=> (not res!922299) (not e!781901))))

(assert (=> b!1380027 (= res!922299 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117418 res!922297) b!1380027))

(assert (= (and b!1380027 res!922299) b!1380028))

(assert (= (and b!1380028 res!922300) b!1380029))

(assert (= (and b!1380029 (not res!922298)) b!1380030))

(declare-fun m!1265241 () Bool)

(assert (=> b!1380030 m!1265241))

(declare-fun m!1265243 () Bool)

(assert (=> b!1380030 m!1265243))

(declare-fun m!1265245 () Bool)

(assert (=> b!1380029 m!1265245))

(declare-fun m!1265247 () Bool)

(assert (=> b!1380029 m!1265247))

(declare-fun m!1265249 () Bool)

(assert (=> start!117418 m!1265249))

(declare-fun m!1265251 () Bool)

(assert (=> b!1380027 m!1265251))

(push 1)

(assert (not b!1380030))

(assert (not start!117418))

(assert (not b!1380029))

(assert (not b!1380027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

