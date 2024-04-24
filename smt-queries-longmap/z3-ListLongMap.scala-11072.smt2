; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129620 () Bool)

(assert start!129620)

(declare-fun b!1520017 () Bool)

(declare-fun e!848139 () Bool)

(declare-fun e!848138 () Bool)

(assert (=> b!1520017 (= e!848139 (not e!848138))))

(declare-fun res!1038569 () Bool)

(assert (=> b!1520017 (=> res!1038569 e!848138)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101239 0))(
  ( (array!101240 (arr!48850 (Array (_ BitVec 32) (_ BitVec 64))) (size!49401 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101239)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1520017 (= res!1038569 (or (not (= (select (arr!48850 a!2804) j!70) (select (store (arr!48850 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!848140 () Bool)

(assert (=> b!1520017 e!848140))

(declare-fun res!1038560 () Bool)

(assert (=> b!1520017 (=> (not res!1038560) (not e!848140))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101239 (_ BitVec 32)) Bool)

(assert (=> b!1520017 (= res!1038560 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50731 0))(
  ( (Unit!50732) )
))
(declare-fun lt!658763 () Unit!50731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50731)

(assert (=> b!1520017 (= lt!658763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520018 () Bool)

(declare-fun res!1038565 () Bool)

(declare-fun e!848137 () Bool)

(assert (=> b!1520018 (=> (not res!1038565) (not e!848137))))

(declare-datatypes ((List!35320 0))(
  ( (Nil!35317) (Cons!35316 (h!36746 (_ BitVec 64)) (t!50006 List!35320)) )
))
(declare-fun arrayNoDuplicates!0 (array!101239 (_ BitVec 32) List!35320) Bool)

(assert (=> b!1520018 (= res!1038565 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35317))))

(declare-fun b!1520019 () Bool)

(declare-fun res!1038568 () Bool)

(assert (=> b!1520019 (=> (not res!1038568) (not e!848139))))

(declare-datatypes ((SeekEntryResult!12914 0))(
  ( (MissingZero!12914 (index!54051 (_ BitVec 32))) (Found!12914 (index!54052 (_ BitVec 32))) (Intermediate!12914 (undefined!13726 Bool) (index!54053 (_ BitVec 32)) (x!135939 (_ BitVec 32))) (Undefined!12914) (MissingVacant!12914 (index!54054 (_ BitVec 32))) )
))
(declare-fun lt!658761 () SeekEntryResult!12914)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101239 (_ BitVec 32)) SeekEntryResult!12914)

(assert (=> b!1520019 (= res!1038568 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48850 a!2804) j!70) a!2804 mask!2512) lt!658761))))

(declare-fun b!1520020 () Bool)

(declare-fun res!1038563 () Bool)

(assert (=> b!1520020 (=> (not res!1038563) (not e!848137))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520020 (= res!1038563 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49401 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49401 a!2804))))))

(declare-fun b!1520021 () Bool)

(declare-fun res!1038564 () Bool)

(assert (=> b!1520021 (=> (not res!1038564) (not e!848139))))

(declare-fun lt!658764 () SeekEntryResult!12914)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520021 (= res!1038564 (= lt!658764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48850 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48850 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101240 (store (arr!48850 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49401 a!2804)) mask!2512)))))

(declare-fun b!1520022 () Bool)

(declare-fun e!848141 () Bool)

(assert (=> b!1520022 (= e!848138 e!848141)))

(declare-fun res!1038566 () Bool)

(assert (=> b!1520022 (=> res!1038566 e!848141)))

(declare-fun lt!658762 () (_ BitVec 32))

(assert (=> b!1520022 (= res!1038566 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658762 #b00000000000000000000000000000000) (bvsge lt!658762 (size!49401 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520022 (= lt!658762 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1520023 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101239 (_ BitVec 32)) SeekEntryResult!12914)

(assert (=> b!1520023 (= e!848140 (= (seekEntry!0 (select (arr!48850 a!2804) j!70) a!2804 mask!2512) (Found!12914 j!70)))))

(declare-fun b!1520024 () Bool)

(assert (=> b!1520024 (= e!848137 e!848139)))

(declare-fun res!1038561 () Bool)

(assert (=> b!1520024 (=> (not res!1038561) (not e!848139))))

(assert (=> b!1520024 (= res!1038561 (= lt!658764 lt!658761))))

(assert (=> b!1520024 (= lt!658761 (Intermediate!12914 false resIndex!21 resX!21))))

(assert (=> b!1520024 (= lt!658764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48850 a!2804) j!70) mask!2512) (select (arr!48850 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520025 () Bool)

(assert (=> b!1520025 (= e!848141 true)))

(declare-fun lt!658765 () SeekEntryResult!12914)

(assert (=> b!1520025 (= lt!658765 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658762 (select (arr!48850 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520026 () Bool)

(declare-fun res!1038562 () Bool)

(assert (=> b!1520026 (=> (not res!1038562) (not e!848137))))

(assert (=> b!1520026 (= res!1038562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520027 () Bool)

(declare-fun res!1038571 () Bool)

(assert (=> b!1520027 (=> (not res!1038571) (not e!848137))))

(assert (=> b!1520027 (= res!1038571 (and (= (size!49401 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49401 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49401 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1038572 () Bool)

(assert (=> start!129620 (=> (not res!1038572) (not e!848137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129620 (= res!1038572 (validMask!0 mask!2512))))

(assert (=> start!129620 e!848137))

(assert (=> start!129620 true))

(declare-fun array_inv!38131 (array!101239) Bool)

(assert (=> start!129620 (array_inv!38131 a!2804)))

(declare-fun b!1520028 () Bool)

(declare-fun res!1038567 () Bool)

(assert (=> b!1520028 (=> (not res!1038567) (not e!848137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520028 (= res!1038567 (validKeyInArray!0 (select (arr!48850 a!2804) i!961)))))

(declare-fun b!1520029 () Bool)

(declare-fun res!1038570 () Bool)

(assert (=> b!1520029 (=> (not res!1038570) (not e!848137))))

(assert (=> b!1520029 (= res!1038570 (validKeyInArray!0 (select (arr!48850 a!2804) j!70)))))

(assert (= (and start!129620 res!1038572) b!1520027))

(assert (= (and b!1520027 res!1038571) b!1520028))

(assert (= (and b!1520028 res!1038567) b!1520029))

(assert (= (and b!1520029 res!1038570) b!1520026))

(assert (= (and b!1520026 res!1038562) b!1520018))

(assert (= (and b!1520018 res!1038565) b!1520020))

(assert (= (and b!1520020 res!1038563) b!1520024))

(assert (= (and b!1520024 res!1038561) b!1520019))

(assert (= (and b!1520019 res!1038568) b!1520021))

(assert (= (and b!1520021 res!1038564) b!1520017))

(assert (= (and b!1520017 res!1038560) b!1520023))

(assert (= (and b!1520017 (not res!1038569)) b!1520022))

(assert (= (and b!1520022 (not res!1038566)) b!1520025))

(declare-fun m!1403169 () Bool)

(assert (=> b!1520021 m!1403169))

(declare-fun m!1403171 () Bool)

(assert (=> b!1520021 m!1403171))

(assert (=> b!1520021 m!1403171))

(declare-fun m!1403173 () Bool)

(assert (=> b!1520021 m!1403173))

(assert (=> b!1520021 m!1403173))

(assert (=> b!1520021 m!1403171))

(declare-fun m!1403175 () Bool)

(assert (=> b!1520021 m!1403175))

(declare-fun m!1403177 () Bool)

(assert (=> b!1520026 m!1403177))

(declare-fun m!1403179 () Bool)

(assert (=> b!1520028 m!1403179))

(assert (=> b!1520028 m!1403179))

(declare-fun m!1403181 () Bool)

(assert (=> b!1520028 m!1403181))

(declare-fun m!1403183 () Bool)

(assert (=> b!1520024 m!1403183))

(assert (=> b!1520024 m!1403183))

(declare-fun m!1403185 () Bool)

(assert (=> b!1520024 m!1403185))

(assert (=> b!1520024 m!1403185))

(assert (=> b!1520024 m!1403183))

(declare-fun m!1403187 () Bool)

(assert (=> b!1520024 m!1403187))

(assert (=> b!1520023 m!1403183))

(assert (=> b!1520023 m!1403183))

(declare-fun m!1403189 () Bool)

(assert (=> b!1520023 m!1403189))

(assert (=> b!1520025 m!1403183))

(assert (=> b!1520025 m!1403183))

(declare-fun m!1403191 () Bool)

(assert (=> b!1520025 m!1403191))

(declare-fun m!1403193 () Bool)

(assert (=> b!1520018 m!1403193))

(assert (=> b!1520019 m!1403183))

(assert (=> b!1520019 m!1403183))

(declare-fun m!1403195 () Bool)

(assert (=> b!1520019 m!1403195))

(declare-fun m!1403197 () Bool)

(assert (=> start!129620 m!1403197))

(declare-fun m!1403199 () Bool)

(assert (=> start!129620 m!1403199))

(assert (=> b!1520017 m!1403183))

(declare-fun m!1403201 () Bool)

(assert (=> b!1520017 m!1403201))

(assert (=> b!1520017 m!1403169))

(assert (=> b!1520017 m!1403171))

(declare-fun m!1403203 () Bool)

(assert (=> b!1520017 m!1403203))

(declare-fun m!1403205 () Bool)

(assert (=> b!1520022 m!1403205))

(assert (=> b!1520029 m!1403183))

(assert (=> b!1520029 m!1403183))

(declare-fun m!1403207 () Bool)

(assert (=> b!1520029 m!1403207))

(check-sat (not b!1520019) (not b!1520018) (not b!1520028) (not b!1520017) (not b!1520029) (not b!1520026) (not b!1520023) (not b!1520024) (not b!1520021) (not start!129620) (not b!1520022) (not b!1520025))
(check-sat)
