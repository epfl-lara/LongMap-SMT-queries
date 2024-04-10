; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129074 () Bool)

(assert start!129074)

(declare-fun b!1514203 () Bool)

(declare-fun e!845054 () Bool)

(declare-fun e!845055 () Bool)

(assert (=> b!1514203 (= e!845054 e!845055)))

(declare-fun res!1034118 () Bool)

(assert (=> b!1514203 (=> res!1034118 e!845055)))

(declare-fun lt!656252 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100930 0))(
  ( (array!100931 (arr!48702 (Array (_ BitVec 32) (_ BitVec 64))) (size!49252 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100930)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514203 (= res!1034118 (or (not (= (select (arr!48702 a!2804) j!70) lt!656252)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48702 a!2804) index!487) (select (arr!48702 a!2804) j!70)) (not (= (select (arr!48702 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514204 () Bool)

(declare-fun lt!656254 () array!100930)

(declare-fun e!845053 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12873 0))(
  ( (MissingZero!12873 (index!53887 (_ BitVec 32))) (Found!12873 (index!53888 (_ BitVec 32))) (Intermediate!12873 (undefined!13685 Bool) (index!53889 (_ BitVec 32)) (x!135599 (_ BitVec 32))) (Undefined!12873) (MissingVacant!12873 (index!53890 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12873)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12873)

(assert (=> b!1514204 (= e!845053 (= (seekEntryOrOpen!0 lt!656252 lt!656254 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656252 lt!656254 mask!2512)))))

(declare-fun b!1514205 () Bool)

(declare-fun e!845050 () Bool)

(declare-fun e!845056 () Bool)

(assert (=> b!1514205 (= e!845050 e!845056)))

(declare-fun res!1034117 () Bool)

(assert (=> b!1514205 (=> (not res!1034117) (not e!845056))))

(declare-fun lt!656250 () SeekEntryResult!12873)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514205 (= res!1034117 (= lt!656250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656252 mask!2512) lt!656252 lt!656254 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514205 (= lt!656252 (select (store (arr!48702 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514205 (= lt!656254 (array!100931 (store (arr!48702 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49252 a!2804)))))

(declare-fun b!1514206 () Bool)

(declare-fun res!1034116 () Bool)

(declare-fun e!845052 () Bool)

(assert (=> b!1514206 (=> (not res!1034116) (not e!845052))))

(declare-datatypes ((List!35185 0))(
  ( (Nil!35182) (Cons!35181 (h!36593 (_ BitVec 64)) (t!49879 List!35185)) )
))
(declare-fun arrayNoDuplicates!0 (array!100930 (_ BitVec 32) List!35185) Bool)

(assert (=> b!1514206 (= res!1034116 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35182))))

(declare-fun b!1514207 () Bool)

(declare-fun res!1034112 () Bool)

(assert (=> b!1514207 (=> (not res!1034112) (not e!845052))))

(assert (=> b!1514207 (= res!1034112 (and (= (size!49252 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49252 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49252 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514208 () Bool)

(declare-fun res!1034114 () Bool)

(assert (=> b!1514208 (=> (not res!1034114) (not e!845052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100930 (_ BitVec 32)) Bool)

(assert (=> b!1514208 (= res!1034114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514209 () Bool)

(assert (=> b!1514209 (= e!845052 e!845050)))

(declare-fun res!1034108 () Bool)

(assert (=> b!1514209 (=> (not res!1034108) (not e!845050))))

(declare-fun lt!656251 () SeekEntryResult!12873)

(assert (=> b!1514209 (= res!1034108 (= lt!656250 lt!656251))))

(assert (=> b!1514209 (= lt!656251 (Intermediate!12873 false resIndex!21 resX!21))))

(assert (=> b!1514209 (= lt!656250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48702 a!2804) j!70) mask!2512) (select (arr!48702 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514210 () Bool)

(declare-fun res!1034119 () Bool)

(assert (=> b!1514210 (=> (not res!1034119) (not e!845052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514210 (= res!1034119 (validKeyInArray!0 (select (arr!48702 a!2804) j!70)))))

(declare-fun b!1514211 () Bool)

(assert (=> b!1514211 (= e!845056 (not true))))

(assert (=> b!1514211 e!845054))

(declare-fun res!1034107 () Bool)

(assert (=> b!1514211 (=> (not res!1034107) (not e!845054))))

(assert (=> b!1514211 (= res!1034107 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50614 0))(
  ( (Unit!50615) )
))
(declare-fun lt!656253 () Unit!50614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50614)

(assert (=> b!1514211 (= lt!656253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514212 () Bool)

(assert (=> b!1514212 (= e!845055 e!845053)))

(declare-fun res!1034110 () Bool)

(assert (=> b!1514212 (=> (not res!1034110) (not e!845053))))

(assert (=> b!1514212 (= res!1034110 (= (seekEntryOrOpen!0 (select (arr!48702 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48702 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514214 () Bool)

(declare-fun res!1034111 () Bool)

(assert (=> b!1514214 (=> (not res!1034111) (not e!845050))))

(assert (=> b!1514214 (= res!1034111 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48702 a!2804) j!70) a!2804 mask!2512) lt!656251))))

(declare-fun b!1514215 () Bool)

(declare-fun res!1034113 () Bool)

(assert (=> b!1514215 (=> (not res!1034113) (not e!845054))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12873)

(assert (=> b!1514215 (= res!1034113 (= (seekEntry!0 (select (arr!48702 a!2804) j!70) a!2804 mask!2512) (Found!12873 j!70)))))

(declare-fun b!1514216 () Bool)

(declare-fun res!1034115 () Bool)

(assert (=> b!1514216 (=> (not res!1034115) (not e!845052))))

(assert (=> b!1514216 (= res!1034115 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49252 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49252 a!2804))))))

(declare-fun res!1034106 () Bool)

(assert (=> start!129074 (=> (not res!1034106) (not e!845052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129074 (= res!1034106 (validMask!0 mask!2512))))

(assert (=> start!129074 e!845052))

(assert (=> start!129074 true))

(declare-fun array_inv!37730 (array!100930) Bool)

(assert (=> start!129074 (array_inv!37730 a!2804)))

(declare-fun b!1514213 () Bool)

(declare-fun res!1034109 () Bool)

(assert (=> b!1514213 (=> (not res!1034109) (not e!845052))))

(assert (=> b!1514213 (= res!1034109 (validKeyInArray!0 (select (arr!48702 a!2804) i!961)))))

(assert (= (and start!129074 res!1034106) b!1514207))

(assert (= (and b!1514207 res!1034112) b!1514213))

(assert (= (and b!1514213 res!1034109) b!1514210))

(assert (= (and b!1514210 res!1034119) b!1514208))

(assert (= (and b!1514208 res!1034114) b!1514206))

(assert (= (and b!1514206 res!1034116) b!1514216))

(assert (= (and b!1514216 res!1034115) b!1514209))

(assert (= (and b!1514209 res!1034108) b!1514214))

(assert (= (and b!1514214 res!1034111) b!1514205))

(assert (= (and b!1514205 res!1034117) b!1514211))

(assert (= (and b!1514211 res!1034107) b!1514215))

(assert (= (and b!1514215 res!1034113) b!1514203))

(assert (= (and b!1514203 (not res!1034118)) b!1514212))

(assert (= (and b!1514212 res!1034110) b!1514204))

(declare-fun m!1397135 () Bool)

(assert (=> b!1514204 m!1397135))

(declare-fun m!1397137 () Bool)

(assert (=> b!1514204 m!1397137))

(declare-fun m!1397139 () Bool)

(assert (=> b!1514205 m!1397139))

(assert (=> b!1514205 m!1397139))

(declare-fun m!1397141 () Bool)

(assert (=> b!1514205 m!1397141))

(declare-fun m!1397143 () Bool)

(assert (=> b!1514205 m!1397143))

(declare-fun m!1397145 () Bool)

(assert (=> b!1514205 m!1397145))

(declare-fun m!1397147 () Bool)

(assert (=> b!1514209 m!1397147))

(assert (=> b!1514209 m!1397147))

(declare-fun m!1397149 () Bool)

(assert (=> b!1514209 m!1397149))

(assert (=> b!1514209 m!1397149))

(assert (=> b!1514209 m!1397147))

(declare-fun m!1397151 () Bool)

(assert (=> b!1514209 m!1397151))

(assert (=> b!1514210 m!1397147))

(assert (=> b!1514210 m!1397147))

(declare-fun m!1397153 () Bool)

(assert (=> b!1514210 m!1397153))

(declare-fun m!1397155 () Bool)

(assert (=> b!1514208 m!1397155))

(declare-fun m!1397157 () Bool)

(assert (=> b!1514213 m!1397157))

(assert (=> b!1514213 m!1397157))

(declare-fun m!1397159 () Bool)

(assert (=> b!1514213 m!1397159))

(assert (=> b!1514214 m!1397147))

(assert (=> b!1514214 m!1397147))

(declare-fun m!1397161 () Bool)

(assert (=> b!1514214 m!1397161))

(declare-fun m!1397163 () Bool)

(assert (=> b!1514206 m!1397163))

(assert (=> b!1514203 m!1397147))

(declare-fun m!1397165 () Bool)

(assert (=> b!1514203 m!1397165))

(declare-fun m!1397167 () Bool)

(assert (=> b!1514211 m!1397167))

(declare-fun m!1397169 () Bool)

(assert (=> b!1514211 m!1397169))

(assert (=> b!1514215 m!1397147))

(assert (=> b!1514215 m!1397147))

(declare-fun m!1397171 () Bool)

(assert (=> b!1514215 m!1397171))

(assert (=> b!1514212 m!1397147))

(assert (=> b!1514212 m!1397147))

(declare-fun m!1397173 () Bool)

(assert (=> b!1514212 m!1397173))

(assert (=> b!1514212 m!1397147))

(declare-fun m!1397175 () Bool)

(assert (=> b!1514212 m!1397175))

(declare-fun m!1397177 () Bool)

(assert (=> start!129074 m!1397177))

(declare-fun m!1397179 () Bool)

(assert (=> start!129074 m!1397179))

(check-sat (not b!1514204) (not b!1514215) (not b!1514210) (not b!1514205) (not b!1514211) (not b!1514206) (not b!1514212) (not b!1514214) (not b!1514213) (not start!129074) (not b!1514208) (not b!1514209))
(check-sat)
