; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117278 () Bool)

(assert start!117278)

(declare-fun res!922086 () Bool)

(declare-fun e!781567 () Bool)

(assert (=> start!117278 (=> (not res!922086) (not e!781567))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(declare-datatypes ((array!93874 0))(
  ( (array!93875 (arr!45336 (Array (_ BitVec 32) (_ BitVec 64))) (size!45886 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93874)

(assert (=> start!117278 (= res!922086 (and (bvslt (size!45886 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45886 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117278 e!781567))

(declare-fun array_inv!34364 (array!93874) Bool)

(assert (=> start!117278 (array_inv!34364 a!4010)))

(assert (=> start!117278 true))

(declare-fun b!1379648 () Bool)

(declare-fun res!922087 () Bool)

(assert (=> b!1379648 (=> (not res!922087) (not e!781567))))

(declare-fun isPivot!0 (array!93874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379648 (= res!922087 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379649 () Bool)

(assert (=> b!1379649 (= e!781567 (not (bvsle pivot!64 (size!45886 a!4010))))))

(assert (=> b!1379649 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45881 0))(
  ( (Unit!45882) )
))
(declare-fun lt!607695 () Unit!45881)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45881)

(assert (=> b!1379649 (= lt!607695 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117278 res!922086) b!1379648))

(assert (= (and b!1379648 res!922087) b!1379649))

(declare-fun m!1264817 () Bool)

(assert (=> start!117278 m!1264817))

(declare-fun m!1264819 () Bool)

(assert (=> b!1379648 m!1264819))

(declare-fun m!1264821 () Bool)

(assert (=> b!1379649 m!1264821))

(declare-fun m!1264823 () Bool)

(assert (=> b!1379649 m!1264823))

(check-sat (not b!1379648) (not b!1379649) (not start!117278))
(check-sat)
