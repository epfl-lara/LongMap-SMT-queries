; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123866 () Bool)

(assert start!123866)

(declare-fun b!1435565 () Bool)

(declare-fun res!968674 () Bool)

(declare-fun e!810155 () Bool)

(assert (=> b!1435565 (=> (not res!968674) (not e!810155))))

(declare-datatypes ((array!97575 0))(
  ( (array!97576 (arr!47089 (Array (_ BitVec 32) (_ BitVec 64))) (size!47641 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97575)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435565 (= res!968674 (validKeyInArray!0 (select (arr!47089 a!2862) j!93)))))

(declare-fun b!1435566 () Bool)

(assert (=> b!1435566 (= e!810155 (bvsgt #b00000000000000000000000000000000 (size!47641 a!2862)))))

(declare-fun b!1435563 () Bool)

(declare-fun res!968676 () Bool)

(assert (=> b!1435563 (=> (not res!968676) (not e!810155))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435563 (= res!968676 (and (= (size!47641 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47641 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47641 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!968677 () Bool)

(assert (=> start!123866 (=> (not res!968677) (not e!810155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123866 (= res!968677 (validMask!0 mask!2687))))

(assert (=> start!123866 e!810155))

(assert (=> start!123866 true))

(declare-fun array_inv!36322 (array!97575) Bool)

(assert (=> start!123866 (array_inv!36322 a!2862)))

(declare-fun b!1435564 () Bool)

(declare-fun res!968675 () Bool)

(assert (=> b!1435564 (=> (not res!968675) (not e!810155))))

(assert (=> b!1435564 (= res!968675 (validKeyInArray!0 (select (arr!47089 a!2862) i!1006)))))

(assert (= (and start!123866 res!968677) b!1435563))

(assert (= (and b!1435563 res!968676) b!1435564))

(assert (= (and b!1435564 res!968675) b!1435565))

(assert (= (and b!1435565 res!968674) b!1435566))

(declare-fun m!1324451 () Bool)

(assert (=> b!1435565 m!1324451))

(assert (=> b!1435565 m!1324451))

(declare-fun m!1324453 () Bool)

(assert (=> b!1435565 m!1324453))

(declare-fun m!1324455 () Bool)

(assert (=> start!123866 m!1324455))

(declare-fun m!1324457 () Bool)

(assert (=> start!123866 m!1324457))

(declare-fun m!1324459 () Bool)

(assert (=> b!1435564 m!1324459))

(assert (=> b!1435564 m!1324459))

(declare-fun m!1324461 () Bool)

(assert (=> b!1435564 m!1324461))

(check-sat (not start!123866) (not b!1435565) (not b!1435564))
(check-sat)
