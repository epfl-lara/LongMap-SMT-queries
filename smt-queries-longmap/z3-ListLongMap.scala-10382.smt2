; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122210 () Bool)

(assert start!122210)

(declare-fun b!1417649 () Bool)

(declare-fun res!953430 () Bool)

(declare-fun e!802297 () Bool)

(assert (=> b!1417649 (=> (not res!953430) (not e!802297))))

(declare-datatypes ((array!96747 0))(
  ( (array!96748 (arr!46702 (Array (_ BitVec 32) (_ BitVec 64))) (size!47254 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96747)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417649 (= res!953430 (validKeyInArray!0 (select (arr!46702 a!2831) j!81)))))

(declare-fun b!1417650 () Bool)

(declare-fun res!953433 () Bool)

(assert (=> b!1417650 (=> (not res!953433) (not e!802297))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417650 (= res!953433 (and (= (size!47254 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47254 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47254 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417651 () Bool)

(assert (=> b!1417651 (= e!802297 (bvsgt #b00000000000000000000000000000000 (size!47254 a!2831)))))

(declare-fun b!1417652 () Bool)

(declare-fun res!953434 () Bool)

(assert (=> b!1417652 (=> (not res!953434) (not e!802297))))

(assert (=> b!1417652 (= res!953434 (validKeyInArray!0 (select (arr!46702 a!2831) i!982)))))

(declare-fun b!1417653 () Bool)

(declare-fun res!953431 () Bool)

(assert (=> b!1417653 (=> (not res!953431) (not e!802297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96747 (_ BitVec 32)) Bool)

(assert (=> b!1417653 (= res!953431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!953432 () Bool)

(assert (=> start!122210 (=> (not res!953432) (not e!802297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122210 (= res!953432 (validMask!0 mask!2608))))

(assert (=> start!122210 e!802297))

(assert (=> start!122210 true))

(declare-fun array_inv!35935 (array!96747) Bool)

(assert (=> start!122210 (array_inv!35935 a!2831)))

(assert (= (and start!122210 res!953432) b!1417650))

(assert (= (and b!1417650 res!953433) b!1417652))

(assert (= (and b!1417652 res!953434) b!1417649))

(assert (= (and b!1417649 res!953430) b!1417653))

(assert (= (and b!1417653 res!953431) b!1417651))

(declare-fun m!1307977 () Bool)

(assert (=> b!1417649 m!1307977))

(assert (=> b!1417649 m!1307977))

(declare-fun m!1307979 () Bool)

(assert (=> b!1417649 m!1307979))

(declare-fun m!1307981 () Bool)

(assert (=> b!1417652 m!1307981))

(assert (=> b!1417652 m!1307981))

(declare-fun m!1307983 () Bool)

(assert (=> b!1417652 m!1307983))

(declare-fun m!1307985 () Bool)

(assert (=> b!1417653 m!1307985))

(declare-fun m!1307987 () Bool)

(assert (=> start!122210 m!1307987))

(declare-fun m!1307989 () Bool)

(assert (=> start!122210 m!1307989))

(check-sat (not b!1417649) (not start!122210) (not b!1417652) (not b!1417653))
(check-sat)
