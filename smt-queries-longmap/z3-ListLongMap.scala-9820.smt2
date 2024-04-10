; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116590 () Bool)

(assert start!116590)

(declare-fun b!1374753 () Bool)

(declare-fun e!778804 () Bool)

(assert (=> b!1374753 (= e!778804 (not true))))

(declare-datatypes ((array!93275 0))(
  ( (array!93276 (arr!45042 (Array (_ BitVec 32) (_ BitVec 64))) (size!45592 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93275)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93275 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374753 (= (arrayCountValidKeys!0 (array!93276 (store (arr!45042 a!4142) i!1457 k0!2959) (size!45592 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45473 0))(
  ( (Unit!45474) )
))
(declare-fun lt!603882 () Unit!45473)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45473)

(assert (=> b!1374753 (= lt!603882 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun res!917878 () Bool)

(assert (=> start!116590 (=> (not res!917878) (not e!778804))))

(assert (=> start!116590 (= res!917878 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45592 a!4142))))))

(assert (=> start!116590 e!778804))

(assert (=> start!116590 true))

(declare-fun array_inv!34070 (array!93275) Bool)

(assert (=> start!116590 (array_inv!34070 a!4142)))

(declare-fun b!1374750 () Bool)

(declare-fun res!917879 () Bool)

(assert (=> b!1374750 (=> (not res!917879) (not e!778804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374750 (= res!917879 (validKeyInArray!0 (select (arr!45042 a!4142) i!1457)))))

(declare-fun b!1374752 () Bool)

(declare-fun res!917881 () Bool)

(assert (=> b!1374752 (=> (not res!917881) (not e!778804))))

(assert (=> b!1374752 (= res!917881 (bvslt (size!45592 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374751 () Bool)

(declare-fun res!917880 () Bool)

(assert (=> b!1374751 (=> (not res!917880) (not e!778804))))

(assert (=> b!1374751 (= res!917880 (not (validKeyInArray!0 k0!2959)))))

(assert (= (and start!116590 res!917878) b!1374750))

(assert (= (and b!1374750 res!917879) b!1374751))

(assert (= (and b!1374751 res!917880) b!1374752))

(assert (= (and b!1374752 res!917881) b!1374753))

(declare-fun m!1258295 () Bool)

(assert (=> b!1374753 m!1258295))

(declare-fun m!1258297 () Bool)

(assert (=> b!1374753 m!1258297))

(declare-fun m!1258299 () Bool)

(assert (=> b!1374753 m!1258299))

(declare-fun m!1258301 () Bool)

(assert (=> b!1374753 m!1258301))

(declare-fun m!1258303 () Bool)

(assert (=> start!116590 m!1258303))

(declare-fun m!1258305 () Bool)

(assert (=> b!1374750 m!1258305))

(assert (=> b!1374750 m!1258305))

(declare-fun m!1258307 () Bool)

(assert (=> b!1374750 m!1258307))

(declare-fun m!1258309 () Bool)

(assert (=> b!1374751 m!1258309))

(check-sat (not start!116590) (not b!1374751) (not b!1374750) (not b!1374753))
