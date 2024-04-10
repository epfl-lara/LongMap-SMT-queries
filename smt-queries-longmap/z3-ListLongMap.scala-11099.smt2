; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129618 () Bool)

(assert start!129618)

(declare-fun b!1521651 () Bool)

(declare-fun res!1040880 () Bool)

(declare-fun e!848599 () Bool)

(assert (=> b!1521651 (=> (not res!1040880) (not e!848599))))

(declare-datatypes ((array!101293 0))(
  ( (array!101294 (arr!48879 (Array (_ BitVec 32) (_ BitVec 64))) (size!49429 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101293)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521651 (= res!1040880 (validKeyInArray!0 (select (arr!48879 a!2804) j!70)))))

(declare-fun b!1521652 () Bool)

(declare-fun res!1040879 () Bool)

(assert (=> b!1521652 (=> (not res!1040879) (not e!848599))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1521652 (= res!1040879 (and (= (size!49429 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49429 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49429 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521653 () Bool)

(declare-fun e!848597 () Bool)

(assert (=> b!1521653 (= e!848599 e!848597)))

(declare-fun res!1040874 () Bool)

(assert (=> b!1521653 (=> (not res!1040874) (not e!848597))))

(declare-datatypes ((SeekEntryResult!13044 0))(
  ( (MissingZero!13044 (index!54571 (_ BitVec 32))) (Found!13044 (index!54572 (_ BitVec 32))) (Intermediate!13044 (undefined!13856 Bool) (index!54573 (_ BitVec 32)) (x!136264 (_ BitVec 32))) (Undefined!13044) (MissingVacant!13044 (index!54574 (_ BitVec 32))) )
))
(declare-fun lt!659398 () SeekEntryResult!13044)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101293 (_ BitVec 32)) SeekEntryResult!13044)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521653 (= res!1040874 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48879 a!2804) j!70) mask!2512) (select (arr!48879 a!2804) j!70) a!2804 mask!2512) lt!659398))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521653 (= lt!659398 (Intermediate!13044 false resIndex!21 resX!21))))

(declare-fun b!1521655 () Bool)

(declare-fun res!1040875 () Bool)

(assert (=> b!1521655 (=> (not res!1040875) (not e!848599))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521655 (= res!1040875 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49429 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49429 a!2804))))))

(declare-fun b!1521656 () Bool)

(declare-fun res!1040877 () Bool)

(assert (=> b!1521656 (=> (not res!1040877) (not e!848597))))

(assert (=> b!1521656 (= res!1040877 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48879 a!2804) j!70) a!2804 mask!2512) lt!659398))))

(declare-fun b!1521657 () Bool)

(declare-fun res!1040876 () Bool)

(assert (=> b!1521657 (=> (not res!1040876) (not e!848599))))

(declare-datatypes ((List!35362 0))(
  ( (Nil!35359) (Cons!35358 (h!36779 (_ BitVec 64)) (t!50056 List!35362)) )
))
(declare-fun arrayNoDuplicates!0 (array!101293 (_ BitVec 32) List!35362) Bool)

(assert (=> b!1521657 (= res!1040876 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35359))))

(declare-fun b!1521658 () Bool)

(assert (=> b!1521658 (= e!848597 false)))

(declare-fun lt!659397 () SeekEntryResult!13044)

(assert (=> b!1521658 (= lt!659397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48879 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48879 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101294 (store (arr!48879 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49429 a!2804)) mask!2512))))

(declare-fun b!1521659 () Bool)

(declare-fun res!1040873 () Bool)

(assert (=> b!1521659 (=> (not res!1040873) (not e!848599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101293 (_ BitVec 32)) Bool)

(assert (=> b!1521659 (= res!1040873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1040878 () Bool)

(assert (=> start!129618 (=> (not res!1040878) (not e!848599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129618 (= res!1040878 (validMask!0 mask!2512))))

(assert (=> start!129618 e!848599))

(assert (=> start!129618 true))

(declare-fun array_inv!37907 (array!101293) Bool)

(assert (=> start!129618 (array_inv!37907 a!2804)))

(declare-fun b!1521654 () Bool)

(declare-fun res!1040881 () Bool)

(assert (=> b!1521654 (=> (not res!1040881) (not e!848599))))

(assert (=> b!1521654 (= res!1040881 (validKeyInArray!0 (select (arr!48879 a!2804) i!961)))))

(assert (= (and start!129618 res!1040878) b!1521652))

(assert (= (and b!1521652 res!1040879) b!1521654))

(assert (= (and b!1521654 res!1040881) b!1521651))

(assert (= (and b!1521651 res!1040880) b!1521659))

(assert (= (and b!1521659 res!1040873) b!1521657))

(assert (= (and b!1521657 res!1040876) b!1521655))

(assert (= (and b!1521655 res!1040875) b!1521653))

(assert (= (and b!1521653 res!1040874) b!1521656))

(assert (= (and b!1521656 res!1040877) b!1521658))

(declare-fun m!1404749 () Bool)

(assert (=> b!1521651 m!1404749))

(assert (=> b!1521651 m!1404749))

(declare-fun m!1404751 () Bool)

(assert (=> b!1521651 m!1404751))

(declare-fun m!1404753 () Bool)

(assert (=> b!1521659 m!1404753))

(assert (=> b!1521653 m!1404749))

(assert (=> b!1521653 m!1404749))

(declare-fun m!1404755 () Bool)

(assert (=> b!1521653 m!1404755))

(assert (=> b!1521653 m!1404755))

(assert (=> b!1521653 m!1404749))

(declare-fun m!1404757 () Bool)

(assert (=> b!1521653 m!1404757))

(declare-fun m!1404759 () Bool)

(assert (=> b!1521654 m!1404759))

(assert (=> b!1521654 m!1404759))

(declare-fun m!1404761 () Bool)

(assert (=> b!1521654 m!1404761))

(assert (=> b!1521656 m!1404749))

(assert (=> b!1521656 m!1404749))

(declare-fun m!1404763 () Bool)

(assert (=> b!1521656 m!1404763))

(declare-fun m!1404765 () Bool)

(assert (=> b!1521657 m!1404765))

(declare-fun m!1404767 () Bool)

(assert (=> b!1521658 m!1404767))

(declare-fun m!1404769 () Bool)

(assert (=> b!1521658 m!1404769))

(assert (=> b!1521658 m!1404769))

(declare-fun m!1404771 () Bool)

(assert (=> b!1521658 m!1404771))

(assert (=> b!1521658 m!1404771))

(assert (=> b!1521658 m!1404769))

(declare-fun m!1404773 () Bool)

(assert (=> b!1521658 m!1404773))

(declare-fun m!1404775 () Bool)

(assert (=> start!129618 m!1404775))

(declare-fun m!1404777 () Bool)

(assert (=> start!129618 m!1404777))

(check-sat (not start!129618) (not b!1521658) (not b!1521653) (not b!1521659) (not b!1521656) (not b!1521654) (not b!1521651) (not b!1521657))
(check-sat)
