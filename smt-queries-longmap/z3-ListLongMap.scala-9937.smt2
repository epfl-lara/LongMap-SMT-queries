; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117446 () Bool)

(assert start!117446)

(declare-fun res!922389 () Bool)

(declare-fun e!781985 () Bool)

(assert (=> start!117446 (=> (not res!922389) (not e!781985))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93997 0))(
  ( (array!93998 (arr!45393 (Array (_ BitVec 32) (_ BitVec 64))) (size!45943 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93997)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun knownPivot!5 () (_ BitVec 32))

(assert (=> start!117446 (= res!922389 (and (bvslt (size!45943 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45943 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117446 e!781985))

(assert (=> start!117446 true))

(declare-fun array_inv!34421 (array!93997) Bool)

(assert (=> start!117446 (array_inv!34421 a!3985)))

(declare-fun b!1380118 () Bool)

(declare-fun res!922388 () Bool)

(assert (=> b!1380118 (=> (not res!922388) (not e!781985))))

(declare-fun isPivot!0 (array!93997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380118 (= res!922388 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380119 () Bool)

(declare-fun res!922390 () Bool)

(assert (=> b!1380119 (=> (not res!922390) (not e!781985))))

(assert (=> b!1380119 (= res!922390 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380120 () Bool)

(assert (=> b!1380120 (= e!781985 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363) (bvslt (bvsub pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)) (bvsub pivot!40 knownPivot!5)))))))

(assert (=> b!1380120 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45941 0))(
  ( (Unit!45942) )
))
(declare-fun lt!607863 () Unit!45941)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45941)

(assert (=> b!1380120 (= lt!607863 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117446 res!922389) b!1380118))

(assert (= (and b!1380118 res!922388) b!1380119))

(assert (= (and b!1380119 res!922390) b!1380120))

(declare-fun m!1265321 () Bool)

(assert (=> start!117446 m!1265321))

(declare-fun m!1265323 () Bool)

(assert (=> b!1380118 m!1265323))

(declare-fun m!1265325 () Bool)

(assert (=> b!1380120 m!1265325))

(declare-fun m!1265327 () Bool)

(assert (=> b!1380120 m!1265327))

(check-sat (not b!1380120) (not start!117446) (not b!1380118))
(check-sat)
