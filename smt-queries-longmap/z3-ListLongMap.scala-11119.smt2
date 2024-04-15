; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129828 () Bool)

(assert start!129828)

(declare-fun b!1524024 () Bool)

(declare-fun e!849565 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101365 0))(
  ( (array!101366 (arr!48913 (Array (_ BitVec 32) (_ BitVec 64))) (size!49465 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101365)

(declare-datatypes ((SeekEntryResult!13101 0))(
  ( (MissingZero!13101 (index!54799 (_ BitVec 32))) (Found!13101 (index!54800 (_ BitVec 32))) (Intermediate!13101 (undefined!13913 Bool) (index!54801 (_ BitVec 32)) (x!136492 (_ BitVec 32))) (Undefined!13101) (MissingVacant!13101 (index!54802 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101365 (_ BitVec 32)) SeekEntryResult!13101)

(assert (=> b!1524024 (= e!849565 (= (seekEntry!0 (select (arr!48913 a!2804) j!70) a!2804 mask!2512) (Found!13101 j!70)))))

(declare-fun b!1524025 () Bool)

(declare-fun res!1042867 () Bool)

(declare-fun e!849564 () Bool)

(assert (=> b!1524025 (=> (not res!1042867) (not e!849564))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524025 (= res!1042867 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49465 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49465 a!2804))))))

(declare-fun b!1524026 () Bool)

(declare-fun res!1042870 () Bool)

(assert (=> b!1524026 (=> (not res!1042870) (not e!849564))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1524026 (= res!1042870 (and (= (size!49465 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49465 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49465 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524027 () Bool)

(declare-fun res!1042861 () Bool)

(assert (=> b!1524027 (=> (not res!1042861) (not e!849564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101365 (_ BitVec 32)) Bool)

(assert (=> b!1524027 (= res!1042861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524028 () Bool)

(declare-fun res!1042868 () Bool)

(declare-fun e!849563 () Bool)

(assert (=> b!1524028 (=> (not res!1042868) (not e!849563))))

(declare-fun lt!660003 () SeekEntryResult!13101)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101365 (_ BitVec 32)) SeekEntryResult!13101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524028 (= res!1042868 (= lt!660003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48913 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48913 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101366 (store (arr!48913 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49465 a!2804)) mask!2512)))))

(declare-fun b!1524029 () Bool)

(declare-fun res!1042862 () Bool)

(assert (=> b!1524029 (=> (not res!1042862) (not e!849564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524029 (= res!1042862 (validKeyInArray!0 (select (arr!48913 a!2804) i!961)))))

(declare-fun b!1524030 () Bool)

(declare-fun res!1042860 () Bool)

(assert (=> b!1524030 (=> (not res!1042860) (not e!849564))))

(assert (=> b!1524030 (= res!1042860 (validKeyInArray!0 (select (arr!48913 a!2804) j!70)))))

(declare-fun b!1524031 () Bool)

(declare-fun res!1042863 () Bool)

(assert (=> b!1524031 (=> (not res!1042863) (not e!849563))))

(declare-fun lt!660001 () SeekEntryResult!13101)

(assert (=> b!1524031 (= res!1042863 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48913 a!2804) j!70) a!2804 mask!2512) lt!660001))))

(declare-fun b!1524032 () Bool)

(declare-fun res!1042865 () Bool)

(assert (=> b!1524032 (=> (not res!1042865) (not e!849564))))

(declare-datatypes ((List!35474 0))(
  ( (Nil!35471) (Cons!35470 (h!36898 (_ BitVec 64)) (t!50160 List!35474)) )
))
(declare-fun arrayNoDuplicates!0 (array!101365 (_ BitVec 32) List!35474) Bool)

(assert (=> b!1524032 (= res!1042865 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35471))))

(declare-fun res!1042869 () Bool)

(assert (=> start!129828 (=> (not res!1042869) (not e!849564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129828 (= res!1042869 (validMask!0 mask!2512))))

(assert (=> start!129828 e!849564))

(assert (=> start!129828 true))

(declare-fun array_inv!38146 (array!101365) Bool)

(assert (=> start!129828 (array_inv!38146 a!2804)))

(declare-fun b!1524033 () Bool)

(assert (=> b!1524033 (= e!849564 e!849563)))

(declare-fun res!1042866 () Bool)

(assert (=> b!1524033 (=> (not res!1042866) (not e!849563))))

(assert (=> b!1524033 (= res!1042866 (= lt!660003 lt!660001))))

(assert (=> b!1524033 (= lt!660001 (Intermediate!13101 false resIndex!21 resX!21))))

(assert (=> b!1524033 (= lt!660003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48913 a!2804) j!70) mask!2512) (select (arr!48913 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524034 () Bool)

(assert (=> b!1524034 (= e!849563 (not true))))

(assert (=> b!1524034 e!849565))

(declare-fun res!1042864 () Bool)

(assert (=> b!1524034 (=> (not res!1042864) (not e!849565))))

(assert (=> b!1524034 (= res!1042864 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50825 0))(
  ( (Unit!50826) )
))
(declare-fun lt!660002 () Unit!50825)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50825)

(assert (=> b!1524034 (= lt!660002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129828 res!1042869) b!1524026))

(assert (= (and b!1524026 res!1042870) b!1524029))

(assert (= (and b!1524029 res!1042862) b!1524030))

(assert (= (and b!1524030 res!1042860) b!1524027))

(assert (= (and b!1524027 res!1042861) b!1524032))

(assert (= (and b!1524032 res!1042865) b!1524025))

(assert (= (and b!1524025 res!1042867) b!1524033))

(assert (= (and b!1524033 res!1042866) b!1524031))

(assert (= (and b!1524031 res!1042863) b!1524028))

(assert (= (and b!1524028 res!1042868) b!1524034))

(assert (= (and b!1524034 res!1042864) b!1524024))

(declare-fun m!1406483 () Bool)

(assert (=> b!1524027 m!1406483))

(declare-fun m!1406485 () Bool)

(assert (=> b!1524029 m!1406485))

(assert (=> b!1524029 m!1406485))

(declare-fun m!1406487 () Bool)

(assert (=> b!1524029 m!1406487))

(declare-fun m!1406489 () Bool)

(assert (=> b!1524032 m!1406489))

(declare-fun m!1406491 () Bool)

(assert (=> b!1524033 m!1406491))

(assert (=> b!1524033 m!1406491))

(declare-fun m!1406493 () Bool)

(assert (=> b!1524033 m!1406493))

(assert (=> b!1524033 m!1406493))

(assert (=> b!1524033 m!1406491))

(declare-fun m!1406495 () Bool)

(assert (=> b!1524033 m!1406495))

(declare-fun m!1406497 () Bool)

(assert (=> start!129828 m!1406497))

(declare-fun m!1406499 () Bool)

(assert (=> start!129828 m!1406499))

(assert (=> b!1524031 m!1406491))

(assert (=> b!1524031 m!1406491))

(declare-fun m!1406501 () Bool)

(assert (=> b!1524031 m!1406501))

(assert (=> b!1524024 m!1406491))

(assert (=> b!1524024 m!1406491))

(declare-fun m!1406503 () Bool)

(assert (=> b!1524024 m!1406503))

(declare-fun m!1406505 () Bool)

(assert (=> b!1524028 m!1406505))

(declare-fun m!1406507 () Bool)

(assert (=> b!1524028 m!1406507))

(assert (=> b!1524028 m!1406507))

(declare-fun m!1406509 () Bool)

(assert (=> b!1524028 m!1406509))

(assert (=> b!1524028 m!1406509))

(assert (=> b!1524028 m!1406507))

(declare-fun m!1406511 () Bool)

(assert (=> b!1524028 m!1406511))

(assert (=> b!1524030 m!1406491))

(assert (=> b!1524030 m!1406491))

(declare-fun m!1406513 () Bool)

(assert (=> b!1524030 m!1406513))

(declare-fun m!1406515 () Bool)

(assert (=> b!1524034 m!1406515))

(declare-fun m!1406517 () Bool)

(assert (=> b!1524034 m!1406517))

(check-sat (not b!1524028) (not b!1524032) (not b!1524024) (not b!1524031) (not b!1524029) (not b!1524030) (not b!1524027) (not b!1524033) (not start!129828) (not b!1524034))
(check-sat)
