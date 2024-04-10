; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117408 () Bool)

(assert start!117408)

(declare-fun res!922246 () Bool)

(declare-fun e!781861 () Bool)

(assert (=> start!117408 (=> (not res!922246) (not e!781861))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93959 0))(
  ( (array!93960 (arr!45374 (Array (_ BitVec 32) (_ BitVec 64))) (size!45924 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93959)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117408 (= res!922246 (and (bvslt (size!45924 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45924 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117408 e!781861))

(assert (=> start!117408 true))

(declare-fun array_inv!34402 (array!93959) Bool)

(assert (=> start!117408 (array_inv!34402 a!3985)))

(declare-fun b!1379974 () Bool)

(declare-fun res!922244 () Bool)

(assert (=> b!1379974 (=> (not res!922244) (not e!781861))))

(declare-fun isPivot!0 (array!93959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379974 (= res!922244 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1379975 () Bool)

(declare-fun res!922245 () Bool)

(assert (=> b!1379975 (=> (not res!922245) (not e!781861))))

(assert (=> b!1379975 (= res!922245 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1379976 () Bool)

(assert (=> b!1379976 (= e!781861 (not true))))

(assert (=> b!1379976 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45921 0))(
  ( (Unit!45922) )
))
(declare-fun lt!607815 () Unit!45921)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45921)

(assert (=> b!1379976 (= lt!607815 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117408 res!922246) b!1379974))

(assert (= (and b!1379974 res!922244) b!1379975))

(assert (= (and b!1379975 res!922245) b!1379976))

(declare-fun m!1265193 () Bool)

(assert (=> start!117408 m!1265193))

(declare-fun m!1265195 () Bool)

(assert (=> b!1379974 m!1265195))

(declare-fun m!1265197 () Bool)

(assert (=> b!1379976 m!1265197))

(declare-fun m!1265199 () Bool)

(assert (=> b!1379976 m!1265199))

(push 1)

(assert (not start!117408))

(assert (not b!1379976))

(assert (not b!1379974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

