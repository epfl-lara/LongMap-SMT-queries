; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116596 () Bool)

(assert start!116596)

(declare-fun b!1374789 () Bool)

(declare-fun e!778823 () Bool)

(assert (=> b!1374789 (= e!778823 (not true))))

(declare-datatypes ((array!93281 0))(
  ( (array!93282 (arr!45045 (Array (_ BitVec 32) (_ BitVec 64))) (size!45595 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93281)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93281 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374789 (= (arrayCountValidKeys!0 (array!93282 (store (arr!45045 a!4142) i!1457 k0!2959) (size!45595 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45479 0))(
  ( (Unit!45480) )
))
(declare-fun lt!603891 () Unit!45479)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45479)

(assert (=> b!1374789 (= lt!603891 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374786 () Bool)

(declare-fun res!917917 () Bool)

(assert (=> b!1374786 (=> (not res!917917) (not e!778823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374786 (= res!917917 (validKeyInArray!0 (select (arr!45045 a!4142) i!1457)))))

(declare-fun b!1374788 () Bool)

(declare-fun res!917915 () Bool)

(assert (=> b!1374788 (=> (not res!917915) (not e!778823))))

(assert (=> b!1374788 (= res!917915 (bvslt (size!45595 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917916 () Bool)

(assert (=> start!116596 (=> (not res!917916) (not e!778823))))

(assert (=> start!116596 (= res!917916 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45595 a!4142))))))

(assert (=> start!116596 e!778823))

(assert (=> start!116596 true))

(declare-fun array_inv!34073 (array!93281) Bool)

(assert (=> start!116596 (array_inv!34073 a!4142)))

(declare-fun b!1374787 () Bool)

(declare-fun res!917914 () Bool)

(assert (=> b!1374787 (=> (not res!917914) (not e!778823))))

(assert (=> b!1374787 (= res!917914 (not (validKeyInArray!0 k0!2959)))))

(assert (= (and start!116596 res!917916) b!1374786))

(assert (= (and b!1374786 res!917917) b!1374787))

(assert (= (and b!1374787 res!917914) b!1374788))

(assert (= (and b!1374788 res!917915) b!1374789))

(declare-fun m!1258343 () Bool)

(assert (=> b!1374789 m!1258343))

(declare-fun m!1258345 () Bool)

(assert (=> b!1374789 m!1258345))

(declare-fun m!1258347 () Bool)

(assert (=> b!1374789 m!1258347))

(declare-fun m!1258349 () Bool)

(assert (=> b!1374789 m!1258349))

(declare-fun m!1258351 () Bool)

(assert (=> b!1374786 m!1258351))

(assert (=> b!1374786 m!1258351))

(declare-fun m!1258353 () Bool)

(assert (=> b!1374786 m!1258353))

(declare-fun m!1258355 () Bool)

(assert (=> start!116596 m!1258355))

(declare-fun m!1258357 () Bool)

(assert (=> b!1374787 m!1258357))

(check-sat (not start!116596) (not b!1374789) (not b!1374787) (not b!1374786))
