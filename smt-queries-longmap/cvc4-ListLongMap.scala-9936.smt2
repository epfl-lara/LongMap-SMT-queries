; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117672 () Bool)

(assert start!117672)

(declare-fun res!922884 () Bool)

(declare-fun e!782817 () Bool)

(assert (=> start!117672 (=> (not res!922884) (not e!782817))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-datatypes ((array!94107 0))(
  ( (array!94108 (arr!45443 (Array (_ BitVec 32) (_ BitVec 64))) (size!45994 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94107)

(assert (=> start!117672 (= res!922884 (and (bvslt (size!45994 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45994 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117672 e!782817))

(assert (=> start!117672 true))

(declare-fun array_inv!34724 (array!94107) Bool)

(assert (=> start!117672 (array_inv!34724 a!3985)))

(declare-fun b!1381401 () Bool)

(declare-fun res!922883 () Bool)

(assert (=> b!1381401 (=> (not res!922883) (not e!782817))))

(declare-fun isPivot!0 (array!94107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381401 (= res!922883 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1381402 () Bool)

(declare-fun res!922882 () Bool)

(assert (=> b!1381402 (=> (not res!922882) (not e!782817))))

(assert (=> b!1381402 (= res!922882 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1381403 () Bool)

(assert (=> b!1381403 (= e!782817 (not (and (bvsle (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvsge (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363))))))

(assert (=> b!1381403 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45874 0))(
  ( (Unit!45875) )
))
(declare-fun lt!608335 () Unit!45874)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!94107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45874)

(assert (=> b!1381403 (= lt!608335 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117672 res!922884) b!1381401))

(assert (= (and b!1381401 res!922883) b!1381402))

(assert (= (and b!1381402 res!922882) b!1381403))

(declare-fun m!1266933 () Bool)

(assert (=> start!117672 m!1266933))

(declare-fun m!1266935 () Bool)

(assert (=> b!1381401 m!1266935))

(declare-fun m!1266937 () Bool)

(assert (=> b!1381403 m!1266937))

(declare-fun m!1266939 () Bool)

(assert (=> b!1381403 m!1266939))

(push 1)

(assert (not b!1381403))

(assert (not start!117672))

(assert (not b!1381401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

