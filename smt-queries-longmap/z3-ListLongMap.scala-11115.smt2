; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129796 () Bool)

(assert start!129796)

(declare-fun b!1523611 () Bool)

(declare-fun res!1042528 () Bool)

(declare-fun e!849402 () Bool)

(assert (=> b!1523611 (=> (not res!1042528) (not e!849402))))

(declare-datatypes ((array!101392 0))(
  ( (array!101393 (arr!48927 (Array (_ BitVec 32) (_ BitVec 64))) (size!49477 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101392)

(declare-datatypes ((List!35410 0))(
  ( (Nil!35407) (Cons!35406 (h!36830 (_ BitVec 64)) (t!50104 List!35410)) )
))
(declare-fun arrayNoDuplicates!0 (array!101392 (_ BitVec 32) List!35410) Bool)

(assert (=> b!1523611 (= res!1042528 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35407))))

(declare-fun b!1523612 () Bool)

(declare-fun res!1042520 () Bool)

(declare-fun e!849400 () Bool)

(assert (=> b!1523612 (=> (not res!1042520) (not e!849400))))

(declare-datatypes ((SeekEntryResult!13092 0))(
  ( (MissingZero!13092 (index!54763 (_ BitVec 32))) (Found!13092 (index!54764 (_ BitVec 32))) (Intermediate!13092 (undefined!13904 Bool) (index!54765 (_ BitVec 32)) (x!136450 (_ BitVec 32))) (Undefined!13092) (MissingVacant!13092 (index!54766 (_ BitVec 32))) )
))
(declare-fun lt!660000 () SeekEntryResult!13092)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101392 (_ BitVec 32)) SeekEntryResult!13092)

(assert (=> b!1523612 (= res!1042520 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48927 a!2804) j!70) a!2804 mask!2512) lt!660000))))

(declare-fun b!1523613 () Bool)

(declare-fun res!1042522 () Bool)

(assert (=> b!1523613 (=> (not res!1042522) (not e!849400))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!660001 () SeekEntryResult!13092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523613 (= res!1042522 (= lt!660001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48927 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48927 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101393 (store (arr!48927 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49477 a!2804)) mask!2512)))))

(declare-fun b!1523615 () Bool)

(declare-fun res!1042518 () Bool)

(assert (=> b!1523615 (=> (not res!1042518) (not e!849402))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523615 (= res!1042518 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49477 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49477 a!2804))))))

(declare-fun b!1523616 () Bool)

(declare-fun res!1042519 () Bool)

(assert (=> b!1523616 (=> (not res!1042519) (not e!849402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523616 (= res!1042519 (validKeyInArray!0 (select (arr!48927 a!2804) i!961)))))

(declare-fun b!1523617 () Bool)

(assert (=> b!1523617 (= e!849402 e!849400)))

(declare-fun res!1042527 () Bool)

(assert (=> b!1523617 (=> (not res!1042527) (not e!849400))))

(assert (=> b!1523617 (= res!1042527 (= lt!660001 lt!660000))))

(assert (=> b!1523617 (= lt!660000 (Intermediate!13092 false resIndex!21 resX!21))))

(assert (=> b!1523617 (= lt!660001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48927 a!2804) j!70) mask!2512) (select (arr!48927 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523618 () Bool)

(declare-fun res!1042525 () Bool)

(assert (=> b!1523618 (=> (not res!1042525) (not e!849402))))

(assert (=> b!1523618 (= res!1042525 (validKeyInArray!0 (select (arr!48927 a!2804) j!70)))))

(declare-fun b!1523619 () Bool)

(assert (=> b!1523619 (= e!849400 (not true))))

(declare-fun e!849403 () Bool)

(assert (=> b!1523619 e!849403))

(declare-fun res!1042524 () Bool)

(assert (=> b!1523619 (=> (not res!1042524) (not e!849403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101392 (_ BitVec 32)) Bool)

(assert (=> b!1523619 (= res!1042524 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50968 0))(
  ( (Unit!50969) )
))
(declare-fun lt!659999 () Unit!50968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50968)

(assert (=> b!1523619 (= lt!659999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523614 () Bool)

(declare-fun res!1042526 () Bool)

(assert (=> b!1523614 (=> (not res!1042526) (not e!849402))))

(assert (=> b!1523614 (= res!1042526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1042523 () Bool)

(assert (=> start!129796 (=> (not res!1042523) (not e!849402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129796 (= res!1042523 (validMask!0 mask!2512))))

(assert (=> start!129796 e!849402))

(assert (=> start!129796 true))

(declare-fun array_inv!37955 (array!101392) Bool)

(assert (=> start!129796 (array_inv!37955 a!2804)))

(declare-fun b!1523620 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101392 (_ BitVec 32)) SeekEntryResult!13092)

(assert (=> b!1523620 (= e!849403 (= (seekEntry!0 (select (arr!48927 a!2804) j!70) a!2804 mask!2512) (Found!13092 j!70)))))

(declare-fun b!1523621 () Bool)

(declare-fun res!1042521 () Bool)

(assert (=> b!1523621 (=> (not res!1042521) (not e!849402))))

(assert (=> b!1523621 (= res!1042521 (and (= (size!49477 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49477 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49477 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129796 res!1042523) b!1523621))

(assert (= (and b!1523621 res!1042521) b!1523616))

(assert (= (and b!1523616 res!1042519) b!1523618))

(assert (= (and b!1523618 res!1042525) b!1523614))

(assert (= (and b!1523614 res!1042526) b!1523611))

(assert (= (and b!1523611 res!1042528) b!1523615))

(assert (= (and b!1523615 res!1042518) b!1523617))

(assert (= (and b!1523617 res!1042527) b!1523612))

(assert (= (and b!1523612 res!1042520) b!1523613))

(assert (= (and b!1523613 res!1042522) b!1523619))

(assert (= (and b!1523619 res!1042524) b!1523620))

(declare-fun m!1406745 () Bool)

(assert (=> start!129796 m!1406745))

(declare-fun m!1406747 () Bool)

(assert (=> start!129796 m!1406747))

(declare-fun m!1406749 () Bool)

(assert (=> b!1523613 m!1406749))

(declare-fun m!1406751 () Bool)

(assert (=> b!1523613 m!1406751))

(assert (=> b!1523613 m!1406751))

(declare-fun m!1406753 () Bool)

(assert (=> b!1523613 m!1406753))

(assert (=> b!1523613 m!1406753))

(assert (=> b!1523613 m!1406751))

(declare-fun m!1406755 () Bool)

(assert (=> b!1523613 m!1406755))

(declare-fun m!1406757 () Bool)

(assert (=> b!1523616 m!1406757))

(assert (=> b!1523616 m!1406757))

(declare-fun m!1406759 () Bool)

(assert (=> b!1523616 m!1406759))

(declare-fun m!1406761 () Bool)

(assert (=> b!1523619 m!1406761))

(declare-fun m!1406763 () Bool)

(assert (=> b!1523619 m!1406763))

(declare-fun m!1406765 () Bool)

(assert (=> b!1523614 m!1406765))

(declare-fun m!1406767 () Bool)

(assert (=> b!1523620 m!1406767))

(assert (=> b!1523620 m!1406767))

(declare-fun m!1406769 () Bool)

(assert (=> b!1523620 m!1406769))

(assert (=> b!1523612 m!1406767))

(assert (=> b!1523612 m!1406767))

(declare-fun m!1406771 () Bool)

(assert (=> b!1523612 m!1406771))

(assert (=> b!1523618 m!1406767))

(assert (=> b!1523618 m!1406767))

(declare-fun m!1406773 () Bool)

(assert (=> b!1523618 m!1406773))

(assert (=> b!1523617 m!1406767))

(assert (=> b!1523617 m!1406767))

(declare-fun m!1406775 () Bool)

(assert (=> b!1523617 m!1406775))

(assert (=> b!1523617 m!1406775))

(assert (=> b!1523617 m!1406767))

(declare-fun m!1406777 () Bool)

(assert (=> b!1523617 m!1406777))

(declare-fun m!1406779 () Bool)

(assert (=> b!1523611 m!1406779))

(check-sat (not b!1523619) (not b!1523620) (not b!1523618) (not b!1523616) (not b!1523617) (not b!1523612) (not b!1523611) (not b!1523613) (not b!1523614) (not start!129796))
(check-sat)
