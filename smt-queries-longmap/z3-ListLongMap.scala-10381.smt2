; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122204 () Bool)

(assert start!122204)

(declare-fun b!1417612 () Bool)

(declare-fun res!953394 () Bool)

(declare-fun e!802280 () Bool)

(assert (=> b!1417612 (=> (not res!953394) (not e!802280))))

(declare-datatypes ((array!96741 0))(
  ( (array!96742 (arr!46699 (Array (_ BitVec 32) (_ BitVec 64))) (size!47251 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96741)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417612 (= res!953394 (validKeyInArray!0 (select (arr!46699 a!2831) i!982)))))

(declare-fun res!953393 () Bool)

(assert (=> start!122204 (=> (not res!953393) (not e!802280))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122204 (= res!953393 (validMask!0 mask!2608))))

(assert (=> start!122204 e!802280))

(assert (=> start!122204 true))

(declare-fun array_inv!35932 (array!96741) Bool)

(assert (=> start!122204 (array_inv!35932 a!2831)))

(declare-fun b!1417614 () Bool)

(assert (=> b!1417614 (= e!802280 (bvsgt #b00000000000000000000000000000000 (size!47251 a!2831)))))

(declare-fun b!1417611 () Bool)

(declare-fun res!953392 () Bool)

(assert (=> b!1417611 (=> (not res!953392) (not e!802280))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1417611 (= res!953392 (and (= (size!47251 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47251 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47251 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417613 () Bool)

(declare-fun res!953395 () Bool)

(assert (=> b!1417613 (=> (not res!953395) (not e!802280))))

(assert (=> b!1417613 (= res!953395 (validKeyInArray!0 (select (arr!46699 a!2831) j!81)))))

(assert (= (and start!122204 res!953393) b!1417611))

(assert (= (and b!1417611 res!953392) b!1417612))

(assert (= (and b!1417612 res!953394) b!1417613))

(assert (= (and b!1417613 res!953395) b!1417614))

(declare-fun m!1307941 () Bool)

(assert (=> b!1417612 m!1307941))

(assert (=> b!1417612 m!1307941))

(declare-fun m!1307943 () Bool)

(assert (=> b!1417612 m!1307943))

(declare-fun m!1307945 () Bool)

(assert (=> start!122204 m!1307945))

(declare-fun m!1307947 () Bool)

(assert (=> start!122204 m!1307947))

(declare-fun m!1307949 () Bool)

(assert (=> b!1417613 m!1307949))

(assert (=> b!1417613 m!1307949))

(declare-fun m!1307951 () Bool)

(assert (=> b!1417613 m!1307951))

(check-sat (not b!1417612) (not b!1417613) (not start!122204))
(check-sat)
