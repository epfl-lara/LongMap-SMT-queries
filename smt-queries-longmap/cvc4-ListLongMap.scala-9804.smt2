; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116478 () Bool)

(assert start!116478)

(declare-fun b!1374050 () Bool)

(declare-fun res!917235 () Bool)

(declare-fun e!778405 () Bool)

(assert (=> b!1374050 (=> (not res!917235) (not e!778405))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374050 (= res!917235 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374052 () Bool)

(assert (=> b!1374052 (= e!778405 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lt!603213 () (_ BitVec 32))

(declare-datatypes ((array!93178 0))(
  ( (array!93179 (arr!44995 (Array (_ BitVec 32) (_ BitVec 64))) (size!45545 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93178)

(declare-fun arrayCountValidKeys!0 (array!93178 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374052 (= lt!603213 (arrayCountValidKeys!0 (array!93179 (store (arr!44995 a!4142) i!1457 k!2959) (size!45545 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603214 () (_ BitVec 32))

(assert (=> b!1374052 (= lt!603214 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374051 () Bool)

(declare-fun res!917233 () Bool)

(assert (=> b!1374051 (=> (not res!917233) (not e!778405))))

(assert (=> b!1374051 (= res!917233 (and (bvslt (size!45545 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45545 a!4142))))))

(declare-fun b!1374049 () Bool)

(declare-fun res!917234 () Bool)

(assert (=> b!1374049 (=> (not res!917234) (not e!778405))))

(assert (=> b!1374049 (= res!917234 (validKeyInArray!0 (select (arr!44995 a!4142) i!1457)))))

(declare-fun res!917236 () Bool)

(assert (=> start!116478 (=> (not res!917236) (not e!778405))))

(assert (=> start!116478 (= res!917236 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45545 a!4142))))))

(assert (=> start!116478 e!778405))

(assert (=> start!116478 true))

(declare-fun array_inv!34023 (array!93178) Bool)

(assert (=> start!116478 (array_inv!34023 a!4142)))

(assert (= (and start!116478 res!917236) b!1374049))

(assert (= (and b!1374049 res!917234) b!1374050))

(assert (= (and b!1374050 res!917235) b!1374051))

(assert (= (and b!1374051 res!917233) b!1374052))

(declare-fun m!1257257 () Bool)

(assert (=> b!1374050 m!1257257))

(declare-fun m!1257259 () Bool)

(assert (=> b!1374052 m!1257259))

(declare-fun m!1257261 () Bool)

(assert (=> b!1374052 m!1257261))

(declare-fun m!1257263 () Bool)

(assert (=> b!1374052 m!1257263))

(declare-fun m!1257265 () Bool)

(assert (=> b!1374049 m!1257265))

(assert (=> b!1374049 m!1257265))

(declare-fun m!1257267 () Bool)

(assert (=> b!1374049 m!1257267))

(declare-fun m!1257269 () Bool)

(assert (=> start!116478 m!1257269))

(push 1)

(assert (not start!116478))

(assert (not b!1374052))

(assert (not b!1374050))

(assert (not b!1374049))

(check-sat)

(pop 1)

