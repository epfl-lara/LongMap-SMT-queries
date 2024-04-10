; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128894 () Bool)

(assert start!128894)

(declare-fun b!1510741 () Bool)

(declare-fun res!1030651 () Bool)

(declare-fun e!843569 () Bool)

(assert (=> b!1510741 (=> (not res!1030651) (not e!843569))))

(declare-datatypes ((array!100750 0))(
  ( (array!100751 (arr!48612 (Array (_ BitVec 32) (_ BitVec 64))) (size!49162 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100750)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100750 (_ BitVec 32)) Bool)

(assert (=> b!1510741 (= res!1030651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510742 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!843570 () Bool)

(declare-datatypes ((SeekEntryResult!12783 0))(
  ( (MissingZero!12783 (index!53527 (_ BitVec 32))) (Found!12783 (index!53528 (_ BitVec 32))) (Intermediate!12783 (undefined!13595 Bool) (index!53529 (_ BitVec 32)) (x!135269 (_ BitVec 32))) (Undefined!12783) (MissingVacant!12783 (index!53530 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100750 (_ BitVec 32)) SeekEntryResult!12783)

(assert (=> b!1510742 (= e!843570 (= (seekEntry!0 (select (arr!48612 a!2804) j!70) a!2804 mask!2512) (Found!12783 j!70)))))

(declare-fun b!1510743 () Bool)

(declare-fun res!1030652 () Bool)

(assert (=> b!1510743 (=> (not res!1030652) (not e!843569))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510743 (= res!1030652 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49162 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49162 a!2804))))))

(declare-fun res!1030650 () Bool)

(assert (=> start!128894 (=> (not res!1030650) (not e!843569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128894 (= res!1030650 (validMask!0 mask!2512))))

(assert (=> start!128894 e!843569))

(assert (=> start!128894 true))

(declare-fun array_inv!37640 (array!100750) Bool)

(assert (=> start!128894 (array_inv!37640 a!2804)))

(declare-fun b!1510744 () Bool)

(declare-fun res!1030648 () Bool)

(declare-fun e!843571 () Bool)

(assert (=> b!1510744 (=> (not res!1030648) (not e!843571))))

(declare-fun lt!655250 () SeekEntryResult!12783)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100750 (_ BitVec 32)) SeekEntryResult!12783)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510744 (= res!1030648 (= lt!655250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48612 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48612 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100751 (store (arr!48612 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49162 a!2804)) mask!2512)))))

(declare-fun b!1510745 () Bool)

(assert (=> b!1510745 (= e!843569 e!843571)))

(declare-fun res!1030647 () Bool)

(assert (=> b!1510745 (=> (not res!1030647) (not e!843571))))

(declare-fun lt!655251 () SeekEntryResult!12783)

(assert (=> b!1510745 (= res!1030647 (= lt!655250 lt!655251))))

(assert (=> b!1510745 (= lt!655251 (Intermediate!12783 false resIndex!21 resX!21))))

(assert (=> b!1510745 (= lt!655250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48612 a!2804) j!70) mask!2512) (select (arr!48612 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510746 () Bool)

(declare-fun res!1030649 () Bool)

(assert (=> b!1510746 (=> (not res!1030649) (not e!843571))))

(assert (=> b!1510746 (= res!1030649 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48612 a!2804) j!70) a!2804 mask!2512) lt!655251))))

(declare-fun b!1510747 () Bool)

(declare-fun res!1030645 () Bool)

(assert (=> b!1510747 (=> (not res!1030645) (not e!843569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510747 (= res!1030645 (validKeyInArray!0 (select (arr!48612 a!2804) j!70)))))

(declare-fun b!1510748 () Bool)

(declare-fun res!1030654 () Bool)

(assert (=> b!1510748 (=> (not res!1030654) (not e!843569))))

(assert (=> b!1510748 (= res!1030654 (and (= (size!49162 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49162 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49162 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510749 () Bool)

(declare-fun res!1030646 () Bool)

(assert (=> b!1510749 (=> (not res!1030646) (not e!843569))))

(declare-datatypes ((List!35095 0))(
  ( (Nil!35092) (Cons!35091 (h!36503 (_ BitVec 64)) (t!49789 List!35095)) )
))
(declare-fun arrayNoDuplicates!0 (array!100750 (_ BitVec 32) List!35095) Bool)

(assert (=> b!1510749 (= res!1030646 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35092))))

(declare-fun b!1510750 () Bool)

(assert (=> b!1510750 (= e!843571 (not true))))

(assert (=> b!1510750 e!843570))

(declare-fun res!1030644 () Bool)

(assert (=> b!1510750 (=> (not res!1030644) (not e!843570))))

(assert (=> b!1510750 (= res!1030644 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50434 0))(
  ( (Unit!50435) )
))
(declare-fun lt!655252 () Unit!50434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50434)

(assert (=> b!1510750 (= lt!655252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510751 () Bool)

(declare-fun res!1030653 () Bool)

(assert (=> b!1510751 (=> (not res!1030653) (not e!843569))))

(assert (=> b!1510751 (= res!1030653 (validKeyInArray!0 (select (arr!48612 a!2804) i!961)))))

(assert (= (and start!128894 res!1030650) b!1510748))

(assert (= (and b!1510748 res!1030654) b!1510751))

(assert (= (and b!1510751 res!1030653) b!1510747))

(assert (= (and b!1510747 res!1030645) b!1510741))

(assert (= (and b!1510741 res!1030651) b!1510749))

(assert (= (and b!1510749 res!1030646) b!1510743))

(assert (= (and b!1510743 res!1030652) b!1510745))

(assert (= (and b!1510745 res!1030647) b!1510746))

(assert (= (and b!1510746 res!1030649) b!1510744))

(assert (= (and b!1510744 res!1030648) b!1510750))

(assert (= (and b!1510750 res!1030644) b!1510742))

(declare-fun m!1393363 () Bool)

(assert (=> b!1510746 m!1393363))

(assert (=> b!1510746 m!1393363))

(declare-fun m!1393365 () Bool)

(assert (=> b!1510746 m!1393365))

(declare-fun m!1393367 () Bool)

(assert (=> b!1510749 m!1393367))

(assert (=> b!1510745 m!1393363))

(assert (=> b!1510745 m!1393363))

(declare-fun m!1393369 () Bool)

(assert (=> b!1510745 m!1393369))

(assert (=> b!1510745 m!1393369))

(assert (=> b!1510745 m!1393363))

(declare-fun m!1393371 () Bool)

(assert (=> b!1510745 m!1393371))

(declare-fun m!1393373 () Bool)

(assert (=> b!1510744 m!1393373))

(declare-fun m!1393375 () Bool)

(assert (=> b!1510744 m!1393375))

(assert (=> b!1510744 m!1393375))

(declare-fun m!1393377 () Bool)

(assert (=> b!1510744 m!1393377))

(assert (=> b!1510744 m!1393377))

(assert (=> b!1510744 m!1393375))

(declare-fun m!1393379 () Bool)

(assert (=> b!1510744 m!1393379))

(declare-fun m!1393381 () Bool)

(assert (=> b!1510750 m!1393381))

(declare-fun m!1393383 () Bool)

(assert (=> b!1510750 m!1393383))

(declare-fun m!1393385 () Bool)

(assert (=> b!1510751 m!1393385))

(assert (=> b!1510751 m!1393385))

(declare-fun m!1393387 () Bool)

(assert (=> b!1510751 m!1393387))

(assert (=> b!1510747 m!1393363))

(assert (=> b!1510747 m!1393363))

(declare-fun m!1393389 () Bool)

(assert (=> b!1510747 m!1393389))

(declare-fun m!1393391 () Bool)

(assert (=> b!1510741 m!1393391))

(declare-fun m!1393393 () Bool)

(assert (=> start!128894 m!1393393))

(declare-fun m!1393395 () Bool)

(assert (=> start!128894 m!1393395))

(assert (=> b!1510742 m!1393363))

(assert (=> b!1510742 m!1393363))

(declare-fun m!1393397 () Bool)

(assert (=> b!1510742 m!1393397))

(check-sat (not b!1510750) (not b!1510749) (not b!1510742) (not b!1510746) (not b!1510741) (not b!1510747) (not start!128894) (not b!1510745) (not b!1510751) (not b!1510744))
(check-sat)
