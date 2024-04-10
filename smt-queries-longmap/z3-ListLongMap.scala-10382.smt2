; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122216 () Bool)

(assert start!122216)

(declare-fun res!953478 () Bool)

(declare-fun e!802343 () Bool)

(assert (=> start!122216 (=> (not res!953478) (not e!802343))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122216 (= res!953478 (validMask!0 mask!2608))))

(assert (=> start!122216 e!802343))

(assert (=> start!122216 true))

(declare-datatypes ((array!96800 0))(
  ( (array!96801 (arr!46728 (Array (_ BitVec 32) (_ BitVec 64))) (size!47278 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96800)

(declare-fun array_inv!35756 (array!96800) Bool)

(assert (=> start!122216 (array_inv!35756 a!2831)))

(declare-fun b!1417745 () Bool)

(declare-fun res!953476 () Bool)

(assert (=> b!1417745 (=> (not res!953476) (not e!802343))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417745 (= res!953476 (validKeyInArray!0 (select (arr!46728 a!2831) i!982)))))

(declare-fun b!1417746 () Bool)

(declare-fun res!953479 () Bool)

(assert (=> b!1417746 (=> (not res!953479) (not e!802343))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1417746 (= res!953479 (validKeyInArray!0 (select (arr!46728 a!2831) j!81)))))

(declare-fun b!1417747 () Bool)

(declare-fun res!953475 () Bool)

(assert (=> b!1417747 (=> (not res!953475) (not e!802343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96800 (_ BitVec 32)) Bool)

(assert (=> b!1417747 (= res!953475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417748 () Bool)

(assert (=> b!1417748 (= e!802343 (bvsgt #b00000000000000000000000000000000 (size!47278 a!2831)))))

(declare-fun b!1417749 () Bool)

(declare-fun res!953477 () Bool)

(assert (=> b!1417749 (=> (not res!953477) (not e!802343))))

(assert (=> b!1417749 (= res!953477 (and (= (size!47278 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47278 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47278 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122216 res!953478) b!1417749))

(assert (= (and b!1417749 res!953477) b!1417745))

(assert (= (and b!1417745 res!953476) b!1417746))

(assert (= (and b!1417746 res!953479) b!1417747))

(assert (= (and b!1417747 res!953475) b!1417748))

(declare-fun m!1308527 () Bool)

(assert (=> start!122216 m!1308527))

(declare-fun m!1308529 () Bool)

(assert (=> start!122216 m!1308529))

(declare-fun m!1308531 () Bool)

(assert (=> b!1417745 m!1308531))

(assert (=> b!1417745 m!1308531))

(declare-fun m!1308533 () Bool)

(assert (=> b!1417745 m!1308533))

(declare-fun m!1308535 () Bool)

(assert (=> b!1417746 m!1308535))

(assert (=> b!1417746 m!1308535))

(declare-fun m!1308537 () Bool)

(assert (=> b!1417746 m!1308537))

(declare-fun m!1308539 () Bool)

(assert (=> b!1417747 m!1308539))

(check-sat (not b!1417746) (not b!1417747) (not b!1417745) (not start!122216))
(check-sat)
