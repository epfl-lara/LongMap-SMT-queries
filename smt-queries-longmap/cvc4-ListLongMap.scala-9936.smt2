; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117436 () Bool)

(assert start!117436)

(declare-fun res!922335 () Bool)

(declare-fun e!781936 () Bool)

(assert (=> start!117436 (=> (not res!922335) (not e!781936))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93941 0))(
  ( (array!93942 (arr!45365 (Array (_ BitVec 32) (_ BitVec 64))) (size!45917 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93941)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117436 (= res!922335 (and (bvslt (size!45917 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45917 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117436 e!781936))

(assert (=> start!117436 true))

(declare-fun array_inv!34598 (array!93941) Bool)

(assert (=> start!117436 (array_inv!34598 a!3985)))

(declare-fun b!1380022 () Bool)

(declare-fun res!922336 () Bool)

(assert (=> b!1380022 (=> (not res!922336) (not e!781936))))

(declare-fun isPivot!0 (array!93941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380022 (= res!922336 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380023 () Bool)

(declare-fun res!922337 () Bool)

(assert (=> b!1380023 (=> (not res!922337) (not e!781936))))

(assert (=> b!1380023 (= res!922337 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380024 () Bool)

(assert (=> b!1380024 (= e!781936 (not (and (bvsle (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvsge (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363))))))

(assert (=> b!1380024 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45776 0))(
  ( (Unit!45777) )
))
(declare-fun lt!607670 () Unit!45776)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45776)

(assert (=> b!1380024 (= lt!607670 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117436 res!922335) b!1380022))

(assert (= (and b!1380022 res!922336) b!1380023))

(assert (= (and b!1380023 res!922337) b!1380024))

(declare-fun m!1264793 () Bool)

(assert (=> start!117436 m!1264793))

(declare-fun m!1264795 () Bool)

(assert (=> b!1380022 m!1264795))

(declare-fun m!1264797 () Bool)

(assert (=> b!1380024 m!1264797))

(declare-fun m!1264799 () Bool)

(assert (=> b!1380024 m!1264799))

(push 1)

(assert (not start!117436))

(assert (not b!1380024))

(assert (not b!1380022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

