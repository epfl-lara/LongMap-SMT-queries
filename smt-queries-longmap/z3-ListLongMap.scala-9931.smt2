; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117410 () Bool)

(assert start!117410)

(declare-fun res!922253 () Bool)

(declare-fun e!781867 () Bool)

(assert (=> start!117410 (=> (not res!922253) (not e!781867))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93961 0))(
  ( (array!93962 (arr!45375 (Array (_ BitVec 32) (_ BitVec 64))) (size!45925 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93961)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117410 (= res!922253 (and (bvslt (size!45925 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45925 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117410 e!781867))

(assert (=> start!117410 true))

(declare-fun array_inv!34403 (array!93961) Bool)

(assert (=> start!117410 (array_inv!34403 a!3985)))

(declare-fun b!1379983 () Bool)

(declare-fun res!922255 () Bool)

(assert (=> b!1379983 (=> (not res!922255) (not e!781867))))

(declare-fun isPivot!0 (array!93961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379983 (= res!922255 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1379984 () Bool)

(declare-fun res!922254 () Bool)

(assert (=> b!1379984 (=> (not res!922254) (not e!781867))))

(assert (=> b!1379984 (= res!922254 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1379985 () Bool)

(assert (=> b!1379985 (= e!781867 (not true))))

(assert (=> b!1379985 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45923 0))(
  ( (Unit!45924) )
))
(declare-fun lt!607818 () Unit!45923)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45923)

(assert (=> b!1379985 (= lt!607818 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117410 res!922253) b!1379983))

(assert (= (and b!1379983 res!922255) b!1379984))

(assert (= (and b!1379984 res!922254) b!1379985))

(declare-fun m!1265201 () Bool)

(assert (=> start!117410 m!1265201))

(declare-fun m!1265203 () Bool)

(assert (=> b!1379983 m!1265203))

(declare-fun m!1265205 () Bool)

(assert (=> b!1379985 m!1265205))

(declare-fun m!1265207 () Bool)

(assert (=> b!1379985 m!1265207))

(check-sat (not b!1379983) (not start!117410) (not b!1379985))
