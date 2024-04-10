; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71964 () Bool)

(assert start!71964)

(declare-datatypes ((array!46874 0))(
  ( (array!46875 (arr!22471 (Array (_ BitVec 32) (_ BitVec 64))) (size!22892 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46874)

(declare-fun e!466474 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun b!836190 () Bool)

(declare-fun lt!380386 () array!46874)

(declare-fun arrayCountValidKeys!0 (array!46874 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836190 (= e!466474 (not (= (arrayCountValidKeys!0 lt!380386 (bvadd #b00000000000000000000000000000001 i!1466) (size!22892 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22892 a!4227)))))))

(declare-fun b!836191 () Bool)

(declare-fun res!568917 () Bool)

(declare-fun e!466475 () Bool)

(assert (=> b!836191 (=> (not res!568917) (not e!466475))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836191 (= res!568917 (validKeyInArray!0 k0!2968))))

(declare-fun b!836192 () Bool)

(declare-fun res!568919 () Bool)

(assert (=> b!836192 (=> (not res!568919) (not e!466475))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836192 (= res!568919 (and (bvslt (size!22892 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22892 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836193 () Bool)

(declare-fun res!568921 () Bool)

(assert (=> b!836193 (=> (not res!568921) (not e!466475))))

(assert (=> b!836193 (= res!568921 (not (validKeyInArray!0 (select (arr!22471 a!4227) i!1466))))))

(declare-fun res!568918 () Bool)

(assert (=> start!71964 (=> (not res!568918) (not e!466475))))

(assert (=> start!71964 (= res!568918 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22892 a!4227))))))

(assert (=> start!71964 e!466475))

(assert (=> start!71964 true))

(declare-fun array_inv!17918 (array!46874) Bool)

(assert (=> start!71964 (array_inv!17918 a!4227)))

(declare-fun b!836194 () Bool)

(declare-fun res!568920 () Bool)

(assert (=> b!836194 (=> (not res!568920) (not e!466474))))

(assert (=> b!836194 (= res!568920 (= to!390 (size!22892 a!4227)))))

(declare-fun b!836195 () Bool)

(assert (=> b!836195 (= e!466475 e!466474)))

(declare-fun res!568922 () Bool)

(assert (=> b!836195 (=> (not res!568922) (not e!466474))))

(assert (=> b!836195 (= res!568922 (= (arrayCountValidKeys!0 lt!380386 (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (=> b!836195 (= lt!380386 (array!46875 (store (arr!22471 a!4227) i!1466 k0!2968) (size!22892 a!4227)))))

(assert (= (and start!71964 res!568918) b!836193))

(assert (= (and b!836193 res!568921) b!836191))

(assert (= (and b!836191 res!568917) b!836192))

(assert (= (and b!836192 res!568919) b!836195))

(assert (= (and b!836195 res!568922) b!836194))

(assert (= (and b!836194 res!568920) b!836190))

(declare-fun m!781585 () Bool)

(assert (=> b!836195 m!781585))

(declare-fun m!781587 () Bool)

(assert (=> b!836195 m!781587))

(declare-fun m!781589 () Bool)

(assert (=> b!836195 m!781589))

(declare-fun m!781591 () Bool)

(assert (=> start!71964 m!781591))

(declare-fun m!781593 () Bool)

(assert (=> b!836193 m!781593))

(assert (=> b!836193 m!781593))

(declare-fun m!781595 () Bool)

(assert (=> b!836193 m!781595))

(declare-fun m!781597 () Bool)

(assert (=> b!836190 m!781597))

(declare-fun m!781599 () Bool)

(assert (=> b!836190 m!781599))

(declare-fun m!781601 () Bool)

(assert (=> b!836191 m!781601))

(check-sat (not b!836191) (not b!836195) (not b!836193) (not b!836190) (not start!71964))
(check-sat)
