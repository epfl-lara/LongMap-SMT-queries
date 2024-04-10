; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116464 () Bool)

(assert start!116464)

(declare-fun res!917152 () Bool)

(declare-fun e!778362 () Bool)

(assert (=> start!116464 (=> (not res!917152) (not e!778362))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93164 0))(
  ( (array!93165 (arr!44988 (Array (_ BitVec 32) (_ BitVec 64))) (size!45538 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93164)

(assert (=> start!116464 (= res!917152 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45538 a!4142))))))

(assert (=> start!116464 e!778362))

(assert (=> start!116464 true))

(declare-fun array_inv!34016 (array!93164) Bool)

(assert (=> start!116464 (array_inv!34016 a!4142)))

(declare-fun b!1373967 () Bool)

(declare-fun res!917149 () Bool)

(assert (=> b!1373967 (=> (not res!917149) (not e!778362))))

(assert (=> b!1373967 (= res!917149 (and (bvslt (size!45538 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45538 a!4142))))))

(declare-fun b!1373968 () Bool)

(assert (=> b!1373968 (= e!778362 false)))

(declare-fun lt!603172 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93164 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373968 (= lt!603172 (arrayCountValidKeys!0 (array!93165 (store (arr!44988 a!4142) i!1457 k0!2959) (size!45538 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603171 () (_ BitVec 32))

(assert (=> b!1373968 (= lt!603171 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373966 () Bool)

(declare-fun res!917151 () Bool)

(assert (=> b!1373966 (=> (not res!917151) (not e!778362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373966 (= res!917151 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1373965 () Bool)

(declare-fun res!917150 () Bool)

(assert (=> b!1373965 (=> (not res!917150) (not e!778362))))

(assert (=> b!1373965 (= res!917150 (validKeyInArray!0 (select (arr!44988 a!4142) i!1457)))))

(assert (= (and start!116464 res!917152) b!1373965))

(assert (= (and b!1373965 res!917150) b!1373966))

(assert (= (and b!1373966 res!917151) b!1373967))

(assert (= (and b!1373967 res!917149) b!1373968))

(declare-fun m!1257159 () Bool)

(assert (=> start!116464 m!1257159))

(declare-fun m!1257161 () Bool)

(assert (=> b!1373968 m!1257161))

(declare-fun m!1257163 () Bool)

(assert (=> b!1373968 m!1257163))

(declare-fun m!1257165 () Bool)

(assert (=> b!1373968 m!1257165))

(declare-fun m!1257167 () Bool)

(assert (=> b!1373966 m!1257167))

(declare-fun m!1257169 () Bool)

(assert (=> b!1373965 m!1257169))

(assert (=> b!1373965 m!1257169))

(declare-fun m!1257171 () Bool)

(assert (=> b!1373965 m!1257171))

(check-sat (not b!1373966) (not start!116464) (not b!1373965) (not b!1373968))
