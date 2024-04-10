; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117442 () Bool)

(assert start!117442)

(declare-fun res!922371 () Bool)

(declare-fun e!781972 () Bool)

(assert (=> start!117442 (=> (not res!922371) (not e!781972))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93993 0))(
  ( (array!93994 (arr!45391 (Array (_ BitVec 32) (_ BitVec 64))) (size!45941 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93993)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117442 (= res!922371 (and (bvslt (size!45941 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45941 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117442 e!781972))

(assert (=> start!117442 true))

(declare-fun array_inv!34419 (array!93993) Bool)

(assert (=> start!117442 (array_inv!34419 a!3985)))

(declare-fun b!1380100 () Bool)

(declare-fun res!922370 () Bool)

(assert (=> b!1380100 (=> (not res!922370) (not e!781972))))

(declare-fun isPivot!0 (array!93993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380100 (= res!922370 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380101 () Bool)

(declare-fun res!922372 () Bool)

(assert (=> b!1380101 (=> (not res!922372) (not e!781972))))

(assert (=> b!1380101 (= res!922372 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380102 () Bool)

(assert (=> b!1380102 (= e!781972 (not (and (bvsle (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvsge (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363))))))

(assert (=> b!1380102 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45937 0))(
  ( (Unit!45938) )
))
(declare-fun lt!607857 () Unit!45937)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45937)

(assert (=> b!1380102 (= lt!607857 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117442 res!922371) b!1380100))

(assert (= (and b!1380100 res!922370) b!1380101))

(assert (= (and b!1380101 res!922372) b!1380102))

(declare-fun m!1265305 () Bool)

(assert (=> start!117442 m!1265305))

(declare-fun m!1265307 () Bool)

(assert (=> b!1380100 m!1265307))

(declare-fun m!1265309 () Bool)

(assert (=> b!1380102 m!1265309))

(declare-fun m!1265311 () Bool)

(assert (=> b!1380102 m!1265311))

(push 1)

(assert (not b!1380100))

(assert (not start!117442))

(assert (not b!1380102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

