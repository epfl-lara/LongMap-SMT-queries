; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117284 () Bool)

(assert start!117284)

(declare-fun res!922090 () Bool)

(declare-fun e!781566 () Bool)

(assert (=> start!117284 (=> (not res!922090) (not e!781566))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93834 0))(
  ( (array!93835 (arr!45316 (Array (_ BitVec 32) (_ BitVec 64))) (size!45868 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93834)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117284 (= res!922090 (and (bvslt (size!45868 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45868 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117284 e!781566))

(declare-fun array_inv!34549 (array!93834) Bool)

(assert (=> start!117284 (array_inv!34549 a!4010)))

(assert (=> start!117284 true))

(declare-fun b!1379609 () Bool)

(declare-fun res!922091 () Bool)

(assert (=> b!1379609 (=> (not res!922091) (not e!781566))))

(declare-fun isPivot!0 (array!93834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379609 (= res!922091 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379610 () Bool)

(assert (=> b!1379610 (= e!781566 (not (bvsge pivot!64 #b00000000000000000000000000000000)))))

(assert (=> b!1379610 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45732 0))(
  ( (Unit!45733) )
))
(declare-fun lt!607526 () Unit!45732)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45732)

(assert (=> b!1379610 (= lt!607526 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117284 res!922090) b!1379609))

(assert (= (and b!1379609 res!922091) b!1379610))

(declare-fun m!1264353 () Bool)

(assert (=> start!117284 m!1264353))

(declare-fun m!1264355 () Bool)

(assert (=> b!1379609 m!1264355))

(declare-fun m!1264357 () Bool)

(assert (=> b!1379610 m!1264357))

(declare-fun m!1264359 () Bool)

(assert (=> b!1379610 m!1264359))

(check-sat (not b!1379609) (not start!117284) (not b!1379610))
(check-sat)
