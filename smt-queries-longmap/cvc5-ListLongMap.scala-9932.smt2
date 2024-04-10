; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117414 () Bool)

(assert start!117414)

(declare-fun b!1380006 () Bool)

(declare-fun e!781883 () Bool)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> b!1380006 (= e!781883 (bvsgt to!159 from!3363))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93965 0))(
  ( (array!93966 (arr!45377 (Array (_ BitVec 32) (_ BitVec 64))) (size!45927 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93965)

(declare-fun isPivot!0 (array!93965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380006 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-datatypes ((Unit!45927 0))(
  ( (Unit!45928) )
))
(declare-fun lt!607826 () Unit!45927)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45927)

(assert (=> b!1380006 (= lt!607826 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun res!922276 () Bool)

(declare-fun e!781882 () Bool)

(assert (=> start!117414 (=> (not res!922276) (not e!781882))))

(assert (=> start!117414 (= res!922276 (and (bvslt (size!45927 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45927 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117414 e!781882))

(assert (=> start!117414 true))

(declare-fun array_inv!34405 (array!93965) Bool)

(assert (=> start!117414 (array_inv!34405 a!3985)))

(declare-fun b!1380004 () Bool)

(declare-fun res!922273 () Bool)

(assert (=> b!1380004 (=> (not res!922273) (not e!781882))))

(assert (=> b!1380004 (= res!922273 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380005 () Bool)

(assert (=> b!1380005 (= e!781882 (not e!781883))))

(declare-fun res!922274 () Bool)

(assert (=> b!1380005 (=> res!922274 e!781883)))

(assert (=> b!1380005 (= res!922274 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1380005 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-fun lt!607827 () Unit!45927)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45927)

(assert (=> b!1380005 (= lt!607827 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380003 () Bool)

(declare-fun res!922275 () Bool)

(assert (=> b!1380003 (=> (not res!922275) (not e!781882))))

(assert (=> b!1380003 (= res!922275 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117414 res!922276) b!1380003))

(assert (= (and b!1380003 res!922275) b!1380004))

(assert (= (and b!1380004 res!922273) b!1380005))

(assert (= (and b!1380005 (not res!922274)) b!1380006))

(declare-fun m!1265217 () Bool)

(assert (=> b!1380006 m!1265217))

(declare-fun m!1265219 () Bool)

(assert (=> b!1380006 m!1265219))

(declare-fun m!1265221 () Bool)

(assert (=> start!117414 m!1265221))

(declare-fun m!1265223 () Bool)

(assert (=> b!1380005 m!1265223))

(declare-fun m!1265225 () Bool)

(assert (=> b!1380005 m!1265225))

(declare-fun m!1265227 () Bool)

(assert (=> b!1380003 m!1265227))

(push 1)

(assert (not start!117414))

(assert (not b!1380005))

(assert (not b!1380003))

(assert (not b!1380006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

