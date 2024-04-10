; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129118 () Bool)

(assert start!129118)

(declare-fun b!1515119 () Bool)

(declare-fun e!845514 () Bool)

(declare-fun e!845515 () Bool)

(assert (=> b!1515119 (= e!845514 e!845515)))

(declare-fun res!1035024 () Bool)

(assert (=> b!1515119 (=> (not res!1035024) (not e!845515))))

(declare-datatypes ((array!100974 0))(
  ( (array!100975 (arr!48724 (Array (_ BitVec 32) (_ BitVec 64))) (size!49274 (_ BitVec 32))) )
))
(declare-fun lt!656628 () array!100974)

(declare-datatypes ((SeekEntryResult!12895 0))(
  ( (MissingZero!12895 (index!53975 (_ BitVec 32))) (Found!12895 (index!53976 (_ BitVec 32))) (Intermediate!12895 (undefined!13707 Bool) (index!53977 (_ BitVec 32)) (x!135677 (_ BitVec 32))) (Undefined!12895) (MissingVacant!12895 (index!53978 (_ BitVec 32))) )
))
(declare-fun lt!656629 () SeekEntryResult!12895)

(declare-fun lt!656620 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100974 (_ BitVec 32)) SeekEntryResult!12895)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515119 (= res!1035024 (= lt!656629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656620 mask!2512) lt!656620 lt!656628 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100974)

(assert (=> b!1515119 (= lt!656620 (select (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515119 (= lt!656628 (array!100975 (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49274 a!2804)))))

(declare-fun b!1515120 () Bool)

(declare-fun res!1035032 () Bool)

(declare-fun e!845512 () Bool)

(assert (=> b!1515120 (=> (not res!1035032) (not e!845512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100974 (_ BitVec 32)) Bool)

(assert (=> b!1515120 (= res!1035032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515121 () Bool)

(declare-fun res!1035034 () Bool)

(assert (=> b!1515121 (=> (not res!1035034) (not e!845512))))

(assert (=> b!1515121 (= res!1035034 (and (= (size!49274 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49274 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49274 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1035033 () Bool)

(assert (=> start!129118 (=> (not res!1035033) (not e!845512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129118 (= res!1035033 (validMask!0 mask!2512))))

(assert (=> start!129118 e!845512))

(assert (=> start!129118 true))

(declare-fun array_inv!37752 (array!100974) Bool)

(assert (=> start!129118 (array_inv!37752 a!2804)))

(declare-fun b!1515122 () Bool)

(declare-fun res!1035023 () Bool)

(assert (=> b!1515122 (=> (not res!1035023) (not e!845512))))

(declare-datatypes ((List!35207 0))(
  ( (Nil!35204) (Cons!35203 (h!36615 (_ BitVec 64)) (t!49901 List!35207)) )
))
(declare-fun arrayNoDuplicates!0 (array!100974 (_ BitVec 32) List!35207) Bool)

(assert (=> b!1515122 (= res!1035023 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35204))))

(declare-fun b!1515123 () Bool)

(declare-fun res!1035025 () Bool)

(assert (=> b!1515123 (=> (not res!1035025) (not e!845514))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!656625 () SeekEntryResult!12895)

(assert (=> b!1515123 (= res!1035025 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48724 a!2804) j!70) a!2804 mask!2512) lt!656625))))

(declare-fun b!1515124 () Bool)

(declare-fun res!1035027 () Bool)

(assert (=> b!1515124 (=> (not res!1035027) (not e!845512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515124 (= res!1035027 (validKeyInArray!0 (select (arr!48724 a!2804) i!961)))))

(declare-fun e!845518 () Bool)

(declare-fun b!1515125 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100974 (_ BitVec 32)) SeekEntryResult!12895)

(assert (=> b!1515125 (= e!845518 (= (seekEntry!0 (select (arr!48724 a!2804) j!70) a!2804 mask!2512) (Found!12895 j!70)))))

(declare-fun b!1515126 () Bool)

(declare-fun res!1035028 () Bool)

(assert (=> b!1515126 (=> (not res!1035028) (not e!845512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515126 (= res!1035028 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49274 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49274 a!2804))))))

(declare-fun b!1515127 () Bool)

(declare-fun e!845517 () Bool)

(assert (=> b!1515127 (= e!845515 (not e!845517))))

(declare-fun res!1035026 () Bool)

(assert (=> b!1515127 (=> res!1035026 e!845517)))

(assert (=> b!1515127 (= res!1035026 (or (not (= (select (arr!48724 a!2804) j!70) lt!656620)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48724 a!2804) index!487) (select (arr!48724 a!2804) j!70)) (not (= (select (arr!48724 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515127 e!845518))

(declare-fun res!1035022 () Bool)

(assert (=> b!1515127 (=> (not res!1035022) (not e!845518))))

(assert (=> b!1515127 (= res!1035022 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50658 0))(
  ( (Unit!50659) )
))
(declare-fun lt!656623 () Unit!50658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50658)

(assert (=> b!1515127 (= lt!656623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515128 () Bool)

(declare-fun e!845516 () Bool)

(assert (=> b!1515128 (= e!845516 true)))

(declare-fun lt!656621 () SeekEntryResult!12895)

(declare-fun lt!656626 () SeekEntryResult!12895)

(assert (=> b!1515128 (= lt!656621 lt!656626)))

(declare-fun lt!656627 () Unit!50658)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50658)

(assert (=> b!1515128 (= lt!656627 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515129 () Bool)

(assert (=> b!1515129 (= e!845512 e!845514)))

(declare-fun res!1035029 () Bool)

(assert (=> b!1515129 (=> (not res!1035029) (not e!845514))))

(assert (=> b!1515129 (= res!1035029 (= lt!656629 lt!656625))))

(assert (=> b!1515129 (= lt!656625 (Intermediate!12895 false resIndex!21 resX!21))))

(assert (=> b!1515129 (= lt!656629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48724 a!2804) j!70) mask!2512) (select (arr!48724 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515130 () Bool)

(assert (=> b!1515130 (= e!845517 e!845516)))

(declare-fun res!1035031 () Bool)

(assert (=> b!1515130 (=> res!1035031 e!845516)))

(assert (=> b!1515130 (= res!1035031 (not (= lt!656626 (Found!12895 j!70))))))

(declare-fun lt!656624 () SeekEntryResult!12895)

(assert (=> b!1515130 (= lt!656624 lt!656621)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100974 (_ BitVec 32)) SeekEntryResult!12895)

(assert (=> b!1515130 (= lt!656621 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656620 lt!656628 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100974 (_ BitVec 32)) SeekEntryResult!12895)

(assert (=> b!1515130 (= lt!656624 (seekEntryOrOpen!0 lt!656620 lt!656628 mask!2512))))

(declare-fun lt!656622 () SeekEntryResult!12895)

(assert (=> b!1515130 (= lt!656622 lt!656626)))

(assert (=> b!1515130 (= lt!656626 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48724 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515130 (= lt!656622 (seekEntryOrOpen!0 (select (arr!48724 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515131 () Bool)

(declare-fun res!1035030 () Bool)

(assert (=> b!1515131 (=> (not res!1035030) (not e!845512))))

(assert (=> b!1515131 (= res!1035030 (validKeyInArray!0 (select (arr!48724 a!2804) j!70)))))

(assert (= (and start!129118 res!1035033) b!1515121))

(assert (= (and b!1515121 res!1035034) b!1515124))

(assert (= (and b!1515124 res!1035027) b!1515131))

(assert (= (and b!1515131 res!1035030) b!1515120))

(assert (= (and b!1515120 res!1035032) b!1515122))

(assert (= (and b!1515122 res!1035023) b!1515126))

(assert (= (and b!1515126 res!1035028) b!1515129))

(assert (= (and b!1515129 res!1035029) b!1515123))

(assert (= (and b!1515123 res!1035025) b!1515119))

(assert (= (and b!1515119 res!1035024) b!1515127))

(assert (= (and b!1515127 res!1035022) b!1515125))

(assert (= (and b!1515127 (not res!1035026)) b!1515130))

(assert (= (and b!1515130 (not res!1035031)) b!1515128))

(declare-fun m!1398151 () Bool)

(assert (=> b!1515124 m!1398151))

(assert (=> b!1515124 m!1398151))

(declare-fun m!1398153 () Bool)

(assert (=> b!1515124 m!1398153))

(declare-fun m!1398155 () Bool)

(assert (=> b!1515129 m!1398155))

(assert (=> b!1515129 m!1398155))

(declare-fun m!1398157 () Bool)

(assert (=> b!1515129 m!1398157))

(assert (=> b!1515129 m!1398157))

(assert (=> b!1515129 m!1398155))

(declare-fun m!1398159 () Bool)

(assert (=> b!1515129 m!1398159))

(assert (=> b!1515130 m!1398155))

(declare-fun m!1398161 () Bool)

(assert (=> b!1515130 m!1398161))

(assert (=> b!1515130 m!1398155))

(assert (=> b!1515130 m!1398155))

(declare-fun m!1398163 () Bool)

(assert (=> b!1515130 m!1398163))

(declare-fun m!1398165 () Bool)

(assert (=> b!1515130 m!1398165))

(declare-fun m!1398167 () Bool)

(assert (=> b!1515130 m!1398167))

(declare-fun m!1398169 () Bool)

(assert (=> b!1515119 m!1398169))

(assert (=> b!1515119 m!1398169))

(declare-fun m!1398171 () Bool)

(assert (=> b!1515119 m!1398171))

(declare-fun m!1398173 () Bool)

(assert (=> b!1515119 m!1398173))

(declare-fun m!1398175 () Bool)

(assert (=> b!1515119 m!1398175))

(assert (=> b!1515125 m!1398155))

(assert (=> b!1515125 m!1398155))

(declare-fun m!1398177 () Bool)

(assert (=> b!1515125 m!1398177))

(declare-fun m!1398179 () Bool)

(assert (=> b!1515122 m!1398179))

(assert (=> b!1515123 m!1398155))

(assert (=> b!1515123 m!1398155))

(declare-fun m!1398181 () Bool)

(assert (=> b!1515123 m!1398181))

(assert (=> b!1515127 m!1398155))

(declare-fun m!1398183 () Bool)

(assert (=> b!1515127 m!1398183))

(declare-fun m!1398185 () Bool)

(assert (=> b!1515127 m!1398185))

(declare-fun m!1398187 () Bool)

(assert (=> b!1515127 m!1398187))

(declare-fun m!1398189 () Bool)

(assert (=> start!129118 m!1398189))

(declare-fun m!1398191 () Bool)

(assert (=> start!129118 m!1398191))

(assert (=> b!1515131 m!1398155))

(assert (=> b!1515131 m!1398155))

(declare-fun m!1398193 () Bool)

(assert (=> b!1515131 m!1398193))

(declare-fun m!1398195 () Bool)

(assert (=> b!1515128 m!1398195))

(declare-fun m!1398197 () Bool)

(assert (=> b!1515120 m!1398197))

(push 1)

