; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116482 () Bool)

(assert start!116482)

(declare-fun b!1374074 () Bool)

(declare-fun res!917259 () Bool)

(declare-fun e!778416 () Bool)

(assert (=> b!1374074 (=> (not res!917259) (not e!778416))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374074 (= res!917259 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374076 () Bool)

(assert (=> b!1374076 (= e!778416 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lt!603225 () (_ BitVec 32))

(declare-datatypes ((array!93182 0))(
  ( (array!93183 (arr!44997 (Array (_ BitVec 32) (_ BitVec 64))) (size!45547 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93182)

(declare-fun arrayCountValidKeys!0 (array!93182 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374076 (= lt!603225 (arrayCountValidKeys!0 (array!93183 (store (arr!44997 a!4142) i!1457 k0!2959) (size!45547 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603226 () (_ BitVec 32))

(assert (=> b!1374076 (= lt!603226 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374075 () Bool)

(declare-fun res!917260 () Bool)

(assert (=> b!1374075 (=> (not res!917260) (not e!778416))))

(assert (=> b!1374075 (= res!917260 (and (bvslt (size!45547 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45547 a!4142))))))

(declare-fun res!917257 () Bool)

(assert (=> start!116482 (=> (not res!917257) (not e!778416))))

(assert (=> start!116482 (= res!917257 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45547 a!4142))))))

(assert (=> start!116482 e!778416))

(assert (=> start!116482 true))

(declare-fun array_inv!34025 (array!93182) Bool)

(assert (=> start!116482 (array_inv!34025 a!4142)))

(declare-fun b!1374073 () Bool)

(declare-fun res!917258 () Bool)

(assert (=> b!1374073 (=> (not res!917258) (not e!778416))))

(assert (=> b!1374073 (= res!917258 (validKeyInArray!0 (select (arr!44997 a!4142) i!1457)))))

(assert (= (and start!116482 res!917257) b!1374073))

(assert (= (and b!1374073 res!917258) b!1374074))

(assert (= (and b!1374074 res!917259) b!1374075))

(assert (= (and b!1374075 res!917260) b!1374076))

(declare-fun m!1257285 () Bool)

(assert (=> b!1374074 m!1257285))

(declare-fun m!1257287 () Bool)

(assert (=> b!1374076 m!1257287))

(declare-fun m!1257289 () Bool)

(assert (=> b!1374076 m!1257289))

(declare-fun m!1257291 () Bool)

(assert (=> b!1374076 m!1257291))

(declare-fun m!1257293 () Bool)

(assert (=> start!116482 m!1257293))

(declare-fun m!1257295 () Bool)

(assert (=> b!1374073 m!1257295))

(assert (=> b!1374073 m!1257295))

(declare-fun m!1257297 () Bool)

(assert (=> b!1374073 m!1257297))

(check-sat (not b!1374073) (not b!1374074) (not b!1374076) (not start!116482))
