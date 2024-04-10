; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117412 () Bool)

(assert start!117412)

(declare-fun res!922264 () Bool)

(declare-fun e!781873 () Bool)

(assert (=> start!117412 (=> (not res!922264) (not e!781873))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93963 0))(
  ( (array!93964 (arr!45376 (Array (_ BitVec 32) (_ BitVec 64))) (size!45926 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93963)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117412 (= res!922264 (and (bvslt (size!45926 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45926 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117412 e!781873))

(assert (=> start!117412 true))

(declare-fun array_inv!34404 (array!93963) Bool)

(assert (=> start!117412 (array_inv!34404 a!3985)))

(declare-fun b!1379992 () Bool)

(declare-fun res!922262 () Bool)

(assert (=> b!1379992 (=> (not res!922262) (not e!781873))))

(declare-fun isPivot!0 (array!93963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379992 (= res!922262 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1379993 () Bool)

(declare-fun res!922263 () Bool)

(assert (=> b!1379993 (=> (not res!922263) (not e!781873))))

(assert (=> b!1379993 (= res!922263 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1379994 () Bool)

(assert (=> b!1379994 (= e!781873 (not true))))

(assert (=> b!1379994 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45925 0))(
  ( (Unit!45926) )
))
(declare-fun lt!607821 () Unit!45925)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45925)

(assert (=> b!1379994 (= lt!607821 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117412 res!922264) b!1379992))

(assert (= (and b!1379992 res!922262) b!1379993))

(assert (= (and b!1379993 res!922263) b!1379994))

(declare-fun m!1265209 () Bool)

(assert (=> start!117412 m!1265209))

(declare-fun m!1265211 () Bool)

(assert (=> b!1379992 m!1265211))

(declare-fun m!1265213 () Bool)

(assert (=> b!1379994 m!1265213))

(declare-fun m!1265215 () Bool)

(assert (=> b!1379994 m!1265215))

(push 1)

(assert (not start!117412))

(assert (not b!1379994))

(assert (not b!1379992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

