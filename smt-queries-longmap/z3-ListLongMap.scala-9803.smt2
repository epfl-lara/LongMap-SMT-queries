; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116470 () Bool)

(assert start!116470)

(declare-fun b!1374003 () Bool)

(declare-fun res!917186 () Bool)

(declare-fun e!778380 () Bool)

(assert (=> b!1374003 (=> (not res!917186) (not e!778380))))

(declare-datatypes ((array!93170 0))(
  ( (array!93171 (arr!44991 (Array (_ BitVec 32) (_ BitVec 64))) (size!45541 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93170)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374003 (= res!917186 (and (bvslt (size!45541 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45541 a!4142))))))

(declare-fun b!1374001 () Bool)

(declare-fun res!917185 () Bool)

(assert (=> b!1374001 (=> (not res!917185) (not e!778380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374001 (= res!917185 (validKeyInArray!0 (select (arr!44991 a!4142) i!1457)))))

(declare-fun b!1374004 () Bool)

(assert (=> b!1374004 (= e!778380 false)))

(declare-fun lt!603189 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93170 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374004 (= lt!603189 (arrayCountValidKeys!0 (array!93171 (store (arr!44991 a!4142) i!1457 k0!2959) (size!45541 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603190 () (_ BitVec 32))

(assert (=> b!1374004 (= lt!603190 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917188 () Bool)

(assert (=> start!116470 (=> (not res!917188) (not e!778380))))

(assert (=> start!116470 (= res!917188 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45541 a!4142))))))

(assert (=> start!116470 e!778380))

(assert (=> start!116470 true))

(declare-fun array_inv!34019 (array!93170) Bool)

(assert (=> start!116470 (array_inv!34019 a!4142)))

(declare-fun b!1374002 () Bool)

(declare-fun res!917187 () Bool)

(assert (=> b!1374002 (=> (not res!917187) (not e!778380))))

(assert (=> b!1374002 (= res!917187 (not (validKeyInArray!0 k0!2959)))))

(assert (= (and start!116470 res!917188) b!1374001))

(assert (= (and b!1374001 res!917185) b!1374002))

(assert (= (and b!1374002 res!917187) b!1374003))

(assert (= (and b!1374003 res!917186) b!1374004))

(declare-fun m!1257201 () Bool)

(assert (=> b!1374001 m!1257201))

(assert (=> b!1374001 m!1257201))

(declare-fun m!1257203 () Bool)

(assert (=> b!1374001 m!1257203))

(declare-fun m!1257205 () Bool)

(assert (=> b!1374004 m!1257205))

(declare-fun m!1257207 () Bool)

(assert (=> b!1374004 m!1257207))

(declare-fun m!1257209 () Bool)

(assert (=> b!1374004 m!1257209))

(declare-fun m!1257211 () Bool)

(assert (=> start!116470 m!1257211))

(declare-fun m!1257213 () Bool)

(assert (=> b!1374002 m!1257213))

(check-sat (not start!116470) (not b!1374004) (not b!1374001) (not b!1374002))
