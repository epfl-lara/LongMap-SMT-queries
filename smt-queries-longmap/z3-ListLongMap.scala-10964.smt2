; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128360 () Bool)

(assert start!128360)

(declare-fun res!1026335 () Bool)

(declare-fun e!841560 () Bool)

(assert (=> start!128360 (=> (not res!1026335) (not e!841560))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128360 (= res!1026335 (validMask!0 mask!2512))))

(assert (=> start!128360 e!841560))

(assert (=> start!128360 true))

(declare-datatypes ((array!100405 0))(
  ( (array!100406 (arr!48448 (Array (_ BitVec 32) (_ BitVec 64))) (size!49000 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100405)

(declare-fun array_inv!37681 (array!100405) Bool)

(assert (=> start!128360 (array_inv!37681 a!2804)))

(declare-fun b!1505770 () Bool)

(declare-fun res!1026336 () Bool)

(assert (=> b!1505770 (=> (not res!1026336) (not e!841560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100405 (_ BitVec 32)) Bool)

(assert (=> b!1505770 (= res!1026336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505771 () Bool)

(declare-fun res!1026338 () Bool)

(assert (=> b!1505771 (=> (not res!1026338) (not e!841560))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505771 (= res!1026338 (validKeyInArray!0 (select (arr!48448 a!2804) j!70)))))

(declare-fun b!1505772 () Bool)

(declare-fun res!1026337 () Bool)

(assert (=> b!1505772 (=> (not res!1026337) (not e!841560))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1505772 (= res!1026337 (and (= (size!49000 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49000 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49000 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505773 () Bool)

(declare-fun res!1026333 () Bool)

(assert (=> b!1505773 (=> (not res!1026333) (not e!841560))))

(declare-datatypes ((List!35009 0))(
  ( (Nil!35006) (Cons!35005 (h!36403 (_ BitVec 64)) (t!49695 List!35009)) )
))
(declare-fun arrayNoDuplicates!0 (array!100405 (_ BitVec 32) List!35009) Bool)

(assert (=> b!1505773 (= res!1026333 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35006))))

(declare-fun b!1505774 () Bool)

(assert (=> b!1505774 (= e!841560 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!653859 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505774 (= lt!653859 (toIndex!0 (select (arr!48448 a!2804) j!70) mask!2512))))

(declare-fun b!1505775 () Bool)

(declare-fun res!1026334 () Bool)

(assert (=> b!1505775 (=> (not res!1026334) (not e!841560))))

(assert (=> b!1505775 (= res!1026334 (validKeyInArray!0 (select (arr!48448 a!2804) i!961)))))

(declare-fun b!1505776 () Bool)

(declare-fun res!1026332 () Bool)

(assert (=> b!1505776 (=> (not res!1026332) (not e!841560))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1505776 (= res!1026332 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49000 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49000 a!2804))))))

(assert (= (and start!128360 res!1026335) b!1505772))

(assert (= (and b!1505772 res!1026337) b!1505775))

(assert (= (and b!1505775 res!1026334) b!1505771))

(assert (= (and b!1505771 res!1026338) b!1505770))

(assert (= (and b!1505770 res!1026336) b!1505773))

(assert (= (and b!1505773 res!1026333) b!1505776))

(assert (= (and b!1505776 res!1026332) b!1505774))

(declare-fun m!1388213 () Bool)

(assert (=> b!1505775 m!1388213))

(assert (=> b!1505775 m!1388213))

(declare-fun m!1388215 () Bool)

(assert (=> b!1505775 m!1388215))

(declare-fun m!1388217 () Bool)

(assert (=> start!128360 m!1388217))

(declare-fun m!1388219 () Bool)

(assert (=> start!128360 m!1388219))

(declare-fun m!1388221 () Bool)

(assert (=> b!1505774 m!1388221))

(assert (=> b!1505774 m!1388221))

(declare-fun m!1388223 () Bool)

(assert (=> b!1505774 m!1388223))

(declare-fun m!1388225 () Bool)

(assert (=> b!1505773 m!1388225))

(declare-fun m!1388227 () Bool)

(assert (=> b!1505770 m!1388227))

(assert (=> b!1505771 m!1388221))

(assert (=> b!1505771 m!1388221))

(declare-fun m!1388229 () Bool)

(assert (=> b!1505771 m!1388229))

(check-sat (not b!1505774) (not b!1505770) (not b!1505773) (not start!128360) (not b!1505771) (not b!1505775))
(check-sat)
