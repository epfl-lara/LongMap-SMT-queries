; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129030 () Bool)

(assert start!129030)

(declare-fun b!1513279 () Bool)

(declare-fun res!1033193 () Bool)

(declare-fun e!844589 () Bool)

(assert (=> b!1513279 (=> (not res!1033193) (not e!844589))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100886 0))(
  ( (array!100887 (arr!48680 (Array (_ BitVec 32) (_ BitVec 64))) (size!49230 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100886)

(assert (=> b!1513279 (= res!1033193 (and (= (size!49230 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49230 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49230 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513280 () Bool)

(declare-fun e!844594 () Bool)

(declare-fun e!844592 () Bool)

(assert (=> b!1513280 (= e!844594 e!844592)))

(declare-fun res!1033191 () Bool)

(assert (=> b!1513280 (=> (not res!1033191) (not e!844592))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12851 0))(
  ( (MissingZero!12851 (index!53799 (_ BitVec 32))) (Found!12851 (index!53800 (_ BitVec 32))) (Intermediate!12851 (undefined!13663 Bool) (index!53801 (_ BitVec 32)) (x!135521 (_ BitVec 32))) (Undefined!12851) (MissingVacant!12851 (index!53802 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100886 (_ BitVec 32)) SeekEntryResult!12851)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100886 (_ BitVec 32)) SeekEntryResult!12851)

(assert (=> b!1513280 (= res!1033191 (= (seekEntryOrOpen!0 (select (arr!48680 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48680 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513281 () Bool)

(declare-fun res!1033186 () Bool)

(assert (=> b!1513281 (=> (not res!1033186) (not e!844589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513281 (= res!1033186 (validKeyInArray!0 (select (arr!48680 a!2804) j!70)))))

(declare-fun b!1513282 () Bool)

(declare-fun e!844588 () Bool)

(assert (=> b!1513282 (= e!844588 e!844594)))

(declare-fun res!1033192 () Bool)

(assert (=> b!1513282 (=> res!1033192 e!844594)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!655921 () (_ BitVec 64))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513282 (= res!1033192 (or (not (= (select (arr!48680 a!2804) j!70) lt!655921)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48680 a!2804) index!487) (select (arr!48680 a!2804) j!70)) (not (= (select (arr!48680 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513283 () Bool)

(declare-fun e!844591 () Bool)

(assert (=> b!1513283 (= e!844591 (not true))))

(assert (=> b!1513283 e!844588))

(declare-fun res!1033187 () Bool)

(assert (=> b!1513283 (=> (not res!1033187) (not e!844588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100886 (_ BitVec 32)) Bool)

(assert (=> b!1513283 (= res!1033187 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50570 0))(
  ( (Unit!50571) )
))
(declare-fun lt!655922 () Unit!50570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50570)

(assert (=> b!1513283 (= lt!655922 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513284 () Bool)

(declare-fun res!1033195 () Bool)

(assert (=> b!1513284 (=> (not res!1033195) (not e!844589))))

(assert (=> b!1513284 (= res!1033195 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49230 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49230 a!2804))))))

(declare-fun b!1513285 () Bool)

(declare-fun res!1033194 () Bool)

(assert (=> b!1513285 (=> (not res!1033194) (not e!844588))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100886 (_ BitVec 32)) SeekEntryResult!12851)

(assert (=> b!1513285 (= res!1033194 (= (seekEntry!0 (select (arr!48680 a!2804) j!70) a!2804 mask!2512) (Found!12851 j!70)))))

(declare-fun b!1513286 () Bool)

(declare-fun e!844593 () Bool)

(assert (=> b!1513286 (= e!844593 e!844591)))

(declare-fun res!1033189 () Bool)

(assert (=> b!1513286 (=> (not res!1033189) (not e!844591))))

(declare-fun lt!655923 () SeekEntryResult!12851)

(declare-fun lt!655920 () array!100886)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100886 (_ BitVec 32)) SeekEntryResult!12851)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513286 (= res!1033189 (= lt!655923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655921 mask!2512) lt!655921 lt!655920 mask!2512)))))

(assert (=> b!1513286 (= lt!655921 (select (store (arr!48680 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513286 (= lt!655920 (array!100887 (store (arr!48680 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49230 a!2804)))))

(declare-fun b!1513287 () Bool)

(assert (=> b!1513287 (= e!844589 e!844593)))

(declare-fun res!1033190 () Bool)

(assert (=> b!1513287 (=> (not res!1033190) (not e!844593))))

(declare-fun lt!655924 () SeekEntryResult!12851)

(assert (=> b!1513287 (= res!1033190 (= lt!655923 lt!655924))))

(assert (=> b!1513287 (= lt!655924 (Intermediate!12851 false resIndex!21 resX!21))))

(assert (=> b!1513287 (= lt!655923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48680 a!2804) j!70) mask!2512) (select (arr!48680 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513288 () Bool)

(declare-fun res!1033183 () Bool)

(assert (=> b!1513288 (=> (not res!1033183) (not e!844589))))

(assert (=> b!1513288 (= res!1033183 (validKeyInArray!0 (select (arr!48680 a!2804) i!961)))))

(declare-fun b!1513289 () Bool)

(assert (=> b!1513289 (= e!844592 (= (seekEntryOrOpen!0 lt!655921 lt!655920 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655921 lt!655920 mask!2512)))))

(declare-fun b!1513290 () Bool)

(declare-fun res!1033182 () Bool)

(assert (=> b!1513290 (=> (not res!1033182) (not e!844589))))

(assert (=> b!1513290 (= res!1033182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1033185 () Bool)

(assert (=> start!129030 (=> (not res!1033185) (not e!844589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129030 (= res!1033185 (validMask!0 mask!2512))))

(assert (=> start!129030 e!844589))

(assert (=> start!129030 true))

(declare-fun array_inv!37708 (array!100886) Bool)

(assert (=> start!129030 (array_inv!37708 a!2804)))

(declare-fun b!1513291 () Bool)

(declare-fun res!1033184 () Bool)

(assert (=> b!1513291 (=> (not res!1033184) (not e!844589))))

(declare-datatypes ((List!35163 0))(
  ( (Nil!35160) (Cons!35159 (h!36571 (_ BitVec 64)) (t!49857 List!35163)) )
))
(declare-fun arrayNoDuplicates!0 (array!100886 (_ BitVec 32) List!35163) Bool)

(assert (=> b!1513291 (= res!1033184 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35160))))

(declare-fun b!1513292 () Bool)

(declare-fun res!1033188 () Bool)

(assert (=> b!1513292 (=> (not res!1033188) (not e!844593))))

(assert (=> b!1513292 (= res!1033188 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48680 a!2804) j!70) a!2804 mask!2512) lt!655924))))

(assert (= (and start!129030 res!1033185) b!1513279))

(assert (= (and b!1513279 res!1033193) b!1513288))

(assert (= (and b!1513288 res!1033183) b!1513281))

(assert (= (and b!1513281 res!1033186) b!1513290))

(assert (= (and b!1513290 res!1033182) b!1513291))

(assert (= (and b!1513291 res!1033184) b!1513284))

(assert (= (and b!1513284 res!1033195) b!1513287))

(assert (= (and b!1513287 res!1033190) b!1513292))

(assert (= (and b!1513292 res!1033188) b!1513286))

(assert (= (and b!1513286 res!1033189) b!1513283))

(assert (= (and b!1513283 res!1033187) b!1513285))

(assert (= (and b!1513285 res!1033194) b!1513282))

(assert (= (and b!1513282 (not res!1033192)) b!1513280))

(assert (= (and b!1513280 res!1033191) b!1513289))

(declare-fun m!1396123 () Bool)

(assert (=> b!1513287 m!1396123))

(assert (=> b!1513287 m!1396123))

(declare-fun m!1396125 () Bool)

(assert (=> b!1513287 m!1396125))

(assert (=> b!1513287 m!1396125))

(assert (=> b!1513287 m!1396123))

(declare-fun m!1396127 () Bool)

(assert (=> b!1513287 m!1396127))

(assert (=> b!1513282 m!1396123))

(declare-fun m!1396129 () Bool)

(assert (=> b!1513282 m!1396129))

(declare-fun m!1396131 () Bool)

(assert (=> start!129030 m!1396131))

(declare-fun m!1396133 () Bool)

(assert (=> start!129030 m!1396133))

(declare-fun m!1396135 () Bool)

(assert (=> b!1513283 m!1396135))

(declare-fun m!1396137 () Bool)

(assert (=> b!1513283 m!1396137))

(declare-fun m!1396139 () Bool)

(assert (=> b!1513291 m!1396139))

(assert (=> b!1513292 m!1396123))

(assert (=> b!1513292 m!1396123))

(declare-fun m!1396141 () Bool)

(assert (=> b!1513292 m!1396141))

(declare-fun m!1396143 () Bool)

(assert (=> b!1513288 m!1396143))

(assert (=> b!1513288 m!1396143))

(declare-fun m!1396145 () Bool)

(assert (=> b!1513288 m!1396145))

(assert (=> b!1513281 m!1396123))

(assert (=> b!1513281 m!1396123))

(declare-fun m!1396147 () Bool)

(assert (=> b!1513281 m!1396147))

(declare-fun m!1396149 () Bool)

(assert (=> b!1513290 m!1396149))

(assert (=> b!1513285 m!1396123))

(assert (=> b!1513285 m!1396123))

(declare-fun m!1396151 () Bool)

(assert (=> b!1513285 m!1396151))

(declare-fun m!1396153 () Bool)

(assert (=> b!1513286 m!1396153))

(assert (=> b!1513286 m!1396153))

(declare-fun m!1396155 () Bool)

(assert (=> b!1513286 m!1396155))

(declare-fun m!1396157 () Bool)

(assert (=> b!1513286 m!1396157))

(declare-fun m!1396159 () Bool)

(assert (=> b!1513286 m!1396159))

(declare-fun m!1396161 () Bool)

(assert (=> b!1513289 m!1396161))

(declare-fun m!1396163 () Bool)

(assert (=> b!1513289 m!1396163))

(assert (=> b!1513280 m!1396123))

(assert (=> b!1513280 m!1396123))

(declare-fun m!1396165 () Bool)

(assert (=> b!1513280 m!1396165))

(assert (=> b!1513280 m!1396123))

(declare-fun m!1396167 () Bool)

(assert (=> b!1513280 m!1396167))

(push 1)

