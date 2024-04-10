; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116476 () Bool)

(assert start!116476)

(declare-fun b!1374040 () Bool)

(declare-fun e!778399 () Bool)

(assert (=> b!1374040 (= e!778399 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93176 0))(
  ( (array!93177 (arr!44994 (Array (_ BitVec 32) (_ BitVec 64))) (size!45544 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93176)

(declare-fun lt!603208 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93176 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374040 (= lt!603208 (arrayCountValidKeys!0 (array!93177 (store (arr!44994 a!4142) i!1457 k0!2959) (size!45544 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603207 () (_ BitVec 32))

(assert (=> b!1374040 (= lt!603207 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374038 () Bool)

(declare-fun res!917221 () Bool)

(assert (=> b!1374038 (=> (not res!917221) (not e!778399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374038 (= res!917221 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!917224 () Bool)

(assert (=> start!116476 (=> (not res!917224) (not e!778399))))

(assert (=> start!116476 (= res!917224 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45544 a!4142))))))

(assert (=> start!116476 e!778399))

(assert (=> start!116476 true))

(declare-fun array_inv!34022 (array!93176) Bool)

(assert (=> start!116476 (array_inv!34022 a!4142)))

(declare-fun b!1374039 () Bool)

(declare-fun res!917222 () Bool)

(assert (=> b!1374039 (=> (not res!917222) (not e!778399))))

(assert (=> b!1374039 (= res!917222 (and (bvslt (size!45544 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45544 a!4142))))))

(declare-fun b!1374037 () Bool)

(declare-fun res!917223 () Bool)

(assert (=> b!1374037 (=> (not res!917223) (not e!778399))))

(assert (=> b!1374037 (= res!917223 (validKeyInArray!0 (select (arr!44994 a!4142) i!1457)))))

(assert (= (and start!116476 res!917224) b!1374037))

(assert (= (and b!1374037 res!917223) b!1374038))

(assert (= (and b!1374038 res!917221) b!1374039))

(assert (= (and b!1374039 res!917222) b!1374040))

(declare-fun m!1257243 () Bool)

(assert (=> b!1374040 m!1257243))

(declare-fun m!1257245 () Bool)

(assert (=> b!1374040 m!1257245))

(declare-fun m!1257247 () Bool)

(assert (=> b!1374040 m!1257247))

(declare-fun m!1257249 () Bool)

(assert (=> b!1374038 m!1257249))

(declare-fun m!1257251 () Bool)

(assert (=> start!116476 m!1257251))

(declare-fun m!1257253 () Bool)

(assert (=> b!1374037 m!1257253))

(assert (=> b!1374037 m!1257253))

(declare-fun m!1257255 () Bool)

(assert (=> b!1374037 m!1257255))

(check-sat (not b!1374040) (not b!1374038) (not b!1374037) (not start!116476))
