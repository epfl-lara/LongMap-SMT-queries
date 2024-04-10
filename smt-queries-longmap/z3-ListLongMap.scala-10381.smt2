; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122210 () Bool)

(assert start!122210)

(declare-fun res!953436 () Bool)

(declare-fun e!802324 () Bool)

(assert (=> start!122210 (=> (not res!953436) (not e!802324))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122210 (= res!953436 (validMask!0 mask!2608))))

(assert (=> start!122210 e!802324))

(assert (=> start!122210 true))

(declare-datatypes ((array!96794 0))(
  ( (array!96795 (arr!46725 (Array (_ BitVec 32) (_ BitVec 64))) (size!47275 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96794)

(declare-fun array_inv!35753 (array!96794) Bool)

(assert (=> start!122210 (array_inv!35753 a!2831)))

(declare-fun b!1417705 () Bool)

(declare-fun res!953434 () Bool)

(assert (=> b!1417705 (=> (not res!953434) (not e!802324))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417705 (= res!953434 (validKeyInArray!0 (select (arr!46725 a!2831) i!982)))))

(declare-fun b!1417706 () Bool)

(declare-fun res!953435 () Bool)

(assert (=> b!1417706 (=> (not res!953435) (not e!802324))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1417706 (= res!953435 (validKeyInArray!0 (select (arr!46725 a!2831) j!81)))))

(declare-fun b!1417707 () Bool)

(assert (=> b!1417707 (= e!802324 (bvsgt #b00000000000000000000000000000000 (size!47275 a!2831)))))

(declare-fun b!1417704 () Bool)

(declare-fun res!953437 () Bool)

(assert (=> b!1417704 (=> (not res!953437) (not e!802324))))

(assert (=> b!1417704 (= res!953437 (and (= (size!47275 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47275 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47275 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122210 res!953436) b!1417704))

(assert (= (and b!1417704 res!953437) b!1417705))

(assert (= (and b!1417705 res!953434) b!1417706))

(assert (= (and b!1417706 res!953435) b!1417707))

(declare-fun m!1308489 () Bool)

(assert (=> start!122210 m!1308489))

(declare-fun m!1308491 () Bool)

(assert (=> start!122210 m!1308491))

(declare-fun m!1308493 () Bool)

(assert (=> b!1417705 m!1308493))

(assert (=> b!1417705 m!1308493))

(declare-fun m!1308495 () Bool)

(assert (=> b!1417705 m!1308495))

(declare-fun m!1308497 () Bool)

(assert (=> b!1417706 m!1308497))

(assert (=> b!1417706 m!1308497))

(declare-fun m!1308499 () Bool)

(assert (=> b!1417706 m!1308499))

(check-sat (not b!1417706) (not b!1417705) (not start!122210))
(check-sat)
