; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117440 () Bool)

(assert start!117440)

(declare-fun res!922355 () Bool)

(declare-fun e!781947 () Bool)

(assert (=> start!117440 (=> (not res!922355) (not e!781947))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93945 0))(
  ( (array!93946 (arr!45367 (Array (_ BitVec 32) (_ BitVec 64))) (size!45919 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93945)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117440 (= res!922355 (and (bvslt (size!45919 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45919 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117440 e!781947))

(assert (=> start!117440 true))

(declare-fun array_inv!34600 (array!93945) Bool)

(assert (=> start!117440 (array_inv!34600 a!3985)))

(declare-fun b!1380040 () Bool)

(declare-fun res!922354 () Bool)

(assert (=> b!1380040 (=> (not res!922354) (not e!781947))))

(declare-fun isPivot!0 (array!93945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380040 (= res!922354 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380041 () Bool)

(declare-fun res!922353 () Bool)

(assert (=> b!1380041 (=> (not res!922353) (not e!781947))))

(assert (=> b!1380041 (= res!922353 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380042 () Bool)

(assert (=> b!1380042 (= e!781947 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363) (bvslt (bvsub pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)) (bvsub pivot!40 knownPivot!5)))))))

(assert (=> b!1380042 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45780 0))(
  ( (Unit!45781) )
))
(declare-fun lt!607676 () Unit!45780)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45780)

(assert (=> b!1380042 (= lt!607676 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117440 res!922355) b!1380040))

(assert (= (and b!1380040 res!922354) b!1380041))

(assert (= (and b!1380041 res!922353) b!1380042))

(declare-fun m!1264809 () Bool)

(assert (=> start!117440 m!1264809))

(declare-fun m!1264811 () Bool)

(assert (=> b!1380040 m!1264811))

(declare-fun m!1264813 () Bool)

(assert (=> b!1380042 m!1264813))

(declare-fun m!1264815 () Bool)

(assert (=> b!1380042 m!1264815))

(check-sat (not start!117440) (not b!1380040) (not b!1380042))
(check-sat)
