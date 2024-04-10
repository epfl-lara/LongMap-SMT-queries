; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117448 () Bool)

(assert start!117448)

(declare-fun res!922399 () Bool)

(declare-fun e!781991 () Bool)

(assert (=> start!117448 (=> (not res!922399) (not e!781991))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93999 0))(
  ( (array!94000 (arr!45394 (Array (_ BitVec 32) (_ BitVec 64))) (size!45944 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93999)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117448 (= res!922399 (and (bvslt (size!45944 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45944 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117448 e!781991))

(assert (=> start!117448 true))

(declare-fun array_inv!34422 (array!93999) Bool)

(assert (=> start!117448 (array_inv!34422 a!3985)))

(declare-fun b!1380127 () Bool)

(declare-fun res!922397 () Bool)

(assert (=> b!1380127 (=> (not res!922397) (not e!781991))))

(declare-fun isPivot!0 (array!93999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380127 (= res!922397 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380128 () Bool)

(declare-fun res!922398 () Bool)

(assert (=> b!1380128 (=> (not res!922398) (not e!781991))))

(assert (=> b!1380128 (= res!922398 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380129 () Bool)

(assert (=> b!1380129 (= e!781991 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363) (bvslt (bvsub pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)) (bvsub pivot!40 knownPivot!5)))))))

(assert (=> b!1380129 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45943 0))(
  ( (Unit!45944) )
))
(declare-fun lt!607866 () Unit!45943)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45943)

(assert (=> b!1380129 (= lt!607866 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117448 res!922399) b!1380127))

(assert (= (and b!1380127 res!922397) b!1380128))

(assert (= (and b!1380128 res!922398) b!1380129))

(declare-fun m!1265329 () Bool)

(assert (=> start!117448 m!1265329))

(declare-fun m!1265331 () Bool)

(assert (=> b!1380127 m!1265331))

(declare-fun m!1265333 () Bool)

(assert (=> b!1380129 m!1265333))

(declare-fun m!1265335 () Bool)

(assert (=> b!1380129 m!1265335))

(push 1)

(assert (not b!1380127))

(assert (not b!1380129))

(assert (not start!117448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

