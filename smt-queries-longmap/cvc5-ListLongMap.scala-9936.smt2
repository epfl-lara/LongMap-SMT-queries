; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117438 () Bool)

(assert start!117438)

(declare-fun res!922354 () Bool)

(declare-fun e!781961 () Bool)

(assert (=> start!117438 (=> (not res!922354) (not e!781961))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-datatypes ((array!93989 0))(
  ( (array!93990 (arr!45389 (Array (_ BitVec 32) (_ BitVec 64))) (size!45939 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93989)

(assert (=> start!117438 (= res!922354 (and (bvslt (size!45939 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45939 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117438 e!781961))

(assert (=> start!117438 true))

(declare-fun array_inv!34417 (array!93989) Bool)

(assert (=> start!117438 (array_inv!34417 a!3985)))

(declare-fun b!1380082 () Bool)

(declare-fun res!922353 () Bool)

(assert (=> b!1380082 (=> (not res!922353) (not e!781961))))

(declare-fun isPivot!0 (array!93989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380082 (= res!922353 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380083 () Bool)

(declare-fun res!922352 () Bool)

(assert (=> b!1380083 (=> (not res!922352) (not e!781961))))

(assert (=> b!1380083 (= res!922352 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380084 () Bool)

(assert (=> b!1380084 (= e!781961 (not (and (bvsle (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvsge (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363))))))

(assert (=> b!1380084 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45933 0))(
  ( (Unit!45934) )
))
(declare-fun lt!607851 () Unit!45933)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45933)

(assert (=> b!1380084 (= lt!607851 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117438 res!922354) b!1380082))

(assert (= (and b!1380082 res!922353) b!1380083))

(assert (= (and b!1380083 res!922352) b!1380084))

(declare-fun m!1265289 () Bool)

(assert (=> start!117438 m!1265289))

(declare-fun m!1265291 () Bool)

(assert (=> b!1380082 m!1265291))

(declare-fun m!1265293 () Bool)

(assert (=> b!1380084 m!1265293))

(declare-fun m!1265295 () Bool)

(assert (=> b!1380084 m!1265295))

(push 1)

(assert (not start!117438))

(assert (not b!1380084))

(assert (not b!1380082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

