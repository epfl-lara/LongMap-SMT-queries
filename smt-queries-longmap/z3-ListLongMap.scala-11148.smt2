; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130200 () Bool)

(assert start!130200)

(declare-fun b!1528751 () Bool)

(declare-fun e!851976 () Bool)

(declare-fun e!851978 () Bool)

(assert (=> b!1528751 (= e!851976 e!851978)))

(declare-fun res!1046653 () Bool)

(assert (=> b!1528751 (=> (not res!1046653) (not e!851978))))

(declare-datatypes ((SeekEntryResult!13188 0))(
  ( (MissingZero!13188 (index!55147 (_ BitVec 32))) (Found!13188 (index!55148 (_ BitVec 32))) (Intermediate!13188 (undefined!14000 Bool) (index!55149 (_ BitVec 32)) (x!136838 (_ BitVec 32))) (Undefined!13188) (MissingVacant!13188 (index!55150 (_ BitVec 32))) )
))
(declare-fun lt!662024 () SeekEntryResult!13188)

(declare-fun lt!662023 () SeekEntryResult!13188)

(assert (=> b!1528751 (= res!1046653 (= lt!662024 lt!662023))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528751 (= lt!662023 (Intermediate!13188 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101548 0))(
  ( (array!101549 (arr!49000 (Array (_ BitVec 32) (_ BitVec 64))) (size!49552 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101548)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101548 (_ BitVec 32)) SeekEntryResult!13188)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528751 (= lt!662024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49000 a!2804) j!70) mask!2512) (select (arr!49000 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528752 () Bool)

(declare-fun e!851979 () Bool)

(assert (=> b!1528752 (= e!851978 (not e!851979))))

(declare-fun res!1046652 () Bool)

(assert (=> b!1528752 (=> res!1046652 e!851979)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528752 (= res!1046652 (or (not (= (select (arr!49000 a!2804) j!70) (select (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!851980 () Bool)

(assert (=> b!1528752 e!851980))

(declare-fun res!1046646 () Bool)

(assert (=> b!1528752 (=> (not res!1046646) (not e!851980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101548 (_ BitVec 32)) Bool)

(assert (=> b!1528752 (= res!1046646 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50999 0))(
  ( (Unit!51000) )
))
(declare-fun lt!662025 () Unit!50999)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50999)

(assert (=> b!1528752 (= lt!662025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528753 () Bool)

(declare-fun res!1046650 () Bool)

(assert (=> b!1528753 (=> (not res!1046650) (not e!851976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528753 (= res!1046650 (validKeyInArray!0 (select (arr!49000 a!2804) i!961)))))

(declare-fun b!1528754 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101548 (_ BitVec 32)) SeekEntryResult!13188)

(assert (=> b!1528754 (= e!851980 (= (seekEntry!0 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) (Found!13188 j!70)))))

(declare-fun res!1046651 () Bool)

(assert (=> start!130200 (=> (not res!1046651) (not e!851976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130200 (= res!1046651 (validMask!0 mask!2512))))

(assert (=> start!130200 e!851976))

(assert (=> start!130200 true))

(declare-fun array_inv!38233 (array!101548) Bool)

(assert (=> start!130200 (array_inv!38233 a!2804)))

(declare-fun b!1528755 () Bool)

(declare-fun res!1046645 () Bool)

(assert (=> b!1528755 (=> (not res!1046645) (not e!851976))))

(assert (=> b!1528755 (= res!1046645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528756 () Bool)

(declare-fun res!1046647 () Bool)

(assert (=> b!1528756 (=> (not res!1046647) (not e!851976))))

(declare-datatypes ((List!35561 0))(
  ( (Nil!35558) (Cons!35557 (h!36994 (_ BitVec 64)) (t!50247 List!35561)) )
))
(declare-fun arrayNoDuplicates!0 (array!101548 (_ BitVec 32) List!35561) Bool)

(assert (=> b!1528756 (= res!1046647 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35558))))

(declare-fun b!1528757 () Bool)

(declare-fun res!1046644 () Bool)

(assert (=> b!1528757 (=> (not res!1046644) (not e!851976))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1528757 (= res!1046644 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49552 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49552 a!2804))))))

(declare-fun b!1528758 () Bool)

(declare-fun res!1046649 () Bool)

(assert (=> b!1528758 (=> (not res!1046649) (not e!851978))))

(assert (=> b!1528758 (= res!1046649 (= lt!662024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101549 (store (arr!49000 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49552 a!2804)) mask!2512)))))

(declare-fun b!1528759 () Bool)

(assert (=> b!1528759 (= e!851979 true)))

(declare-fun lt!662022 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528759 (= lt!662022 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1528760 () Bool)

(declare-fun res!1046642 () Bool)

(assert (=> b!1528760 (=> (not res!1046642) (not e!851978))))

(assert (=> b!1528760 (= res!1046642 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49000 a!2804) j!70) a!2804 mask!2512) lt!662023))))

(declare-fun b!1528761 () Bool)

(declare-fun res!1046648 () Bool)

(assert (=> b!1528761 (=> (not res!1046648) (not e!851976))))

(assert (=> b!1528761 (= res!1046648 (and (= (size!49552 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49552 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49552 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528762 () Bool)

(declare-fun res!1046643 () Bool)

(assert (=> b!1528762 (=> (not res!1046643) (not e!851976))))

(assert (=> b!1528762 (= res!1046643 (validKeyInArray!0 (select (arr!49000 a!2804) j!70)))))

(assert (= (and start!130200 res!1046651) b!1528761))

(assert (= (and b!1528761 res!1046648) b!1528753))

(assert (= (and b!1528753 res!1046650) b!1528762))

(assert (= (and b!1528762 res!1046643) b!1528755))

(assert (= (and b!1528755 res!1046645) b!1528756))

(assert (= (and b!1528756 res!1046647) b!1528757))

(assert (= (and b!1528757 res!1046644) b!1528751))

(assert (= (and b!1528751 res!1046653) b!1528760))

(assert (= (and b!1528760 res!1046642) b!1528758))

(assert (= (and b!1528758 res!1046649) b!1528752))

(assert (= (and b!1528752 res!1046646) b!1528754))

(assert (= (and b!1528752 (not res!1046652)) b!1528759))

(declare-fun m!1411097 () Bool)

(assert (=> b!1528754 m!1411097))

(assert (=> b!1528754 m!1411097))

(declare-fun m!1411099 () Bool)

(assert (=> b!1528754 m!1411099))

(declare-fun m!1411101 () Bool)

(assert (=> b!1528753 m!1411101))

(assert (=> b!1528753 m!1411101))

(declare-fun m!1411103 () Bool)

(assert (=> b!1528753 m!1411103))

(declare-fun m!1411105 () Bool)

(assert (=> b!1528755 m!1411105))

(declare-fun m!1411107 () Bool)

(assert (=> b!1528756 m!1411107))

(assert (=> b!1528762 m!1411097))

(assert (=> b!1528762 m!1411097))

(declare-fun m!1411109 () Bool)

(assert (=> b!1528762 m!1411109))

(declare-fun m!1411111 () Bool)

(assert (=> start!130200 m!1411111))

(declare-fun m!1411113 () Bool)

(assert (=> start!130200 m!1411113))

(assert (=> b!1528751 m!1411097))

(assert (=> b!1528751 m!1411097))

(declare-fun m!1411115 () Bool)

(assert (=> b!1528751 m!1411115))

(assert (=> b!1528751 m!1411115))

(assert (=> b!1528751 m!1411097))

(declare-fun m!1411117 () Bool)

(assert (=> b!1528751 m!1411117))

(declare-fun m!1411119 () Bool)

(assert (=> b!1528758 m!1411119))

(declare-fun m!1411121 () Bool)

(assert (=> b!1528758 m!1411121))

(assert (=> b!1528758 m!1411121))

(declare-fun m!1411123 () Bool)

(assert (=> b!1528758 m!1411123))

(assert (=> b!1528758 m!1411123))

(assert (=> b!1528758 m!1411121))

(declare-fun m!1411125 () Bool)

(assert (=> b!1528758 m!1411125))

(declare-fun m!1411127 () Bool)

(assert (=> b!1528759 m!1411127))

(assert (=> b!1528760 m!1411097))

(assert (=> b!1528760 m!1411097))

(declare-fun m!1411129 () Bool)

(assert (=> b!1528760 m!1411129))

(assert (=> b!1528752 m!1411097))

(declare-fun m!1411131 () Bool)

(assert (=> b!1528752 m!1411131))

(assert (=> b!1528752 m!1411119))

(assert (=> b!1528752 m!1411121))

(declare-fun m!1411133 () Bool)

(assert (=> b!1528752 m!1411133))

(check-sat (not start!130200) (not b!1528756) (not b!1528759) (not b!1528762) (not b!1528754) (not b!1528752) (not b!1528751) (not b!1528753) (not b!1528758) (not b!1528755) (not b!1528760))
(check-sat)
