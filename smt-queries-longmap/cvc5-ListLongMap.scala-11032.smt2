; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129024 () Bool)

(assert start!129024)

(declare-fun b!1513153 () Bool)

(declare-fun e!844526 () Bool)

(assert (=> b!1513153 (= e!844526 (not true))))

(declare-fun e!844528 () Bool)

(assert (=> b!1513153 e!844528))

(declare-fun res!1033060 () Bool)

(assert (=> b!1513153 (=> (not res!1033060) (not e!844528))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100880 0))(
  ( (array!100881 (arr!48677 (Array (_ BitVec 32) (_ BitVec 64))) (size!49227 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100880)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100880 (_ BitVec 32)) Bool)

(assert (=> b!1513153 (= res!1033060 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50564 0))(
  ( (Unit!50565) )
))
(declare-fun lt!655875 () Unit!50564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50564)

(assert (=> b!1513153 (= lt!655875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513154 () Bool)

(declare-fun res!1033057 () Bool)

(declare-fun e!844525 () Bool)

(assert (=> b!1513154 (=> (not res!1033057) (not e!844525))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513154 (= res!1033057 (validKeyInArray!0 (select (arr!48677 a!2804) i!961)))))

(declare-fun b!1513155 () Bool)

(declare-fun res!1033069 () Bool)

(assert (=> b!1513155 (=> (not res!1033069) (not e!844528))))

(declare-datatypes ((SeekEntryResult!12848 0))(
  ( (MissingZero!12848 (index!53787 (_ BitVec 32))) (Found!12848 (index!53788 (_ BitVec 32))) (Intermediate!12848 (undefined!13660 Bool) (index!53789 (_ BitVec 32)) (x!135510 (_ BitVec 32))) (Undefined!12848) (MissingVacant!12848 (index!53790 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100880 (_ BitVec 32)) SeekEntryResult!12848)

(assert (=> b!1513155 (= res!1033069 (= (seekEntry!0 (select (arr!48677 a!2804) j!70) a!2804 mask!2512) (Found!12848 j!70)))))

(declare-fun b!1513156 () Bool)

(declare-fun e!844527 () Bool)

(declare-fun e!844531 () Bool)

(assert (=> b!1513156 (= e!844527 e!844531)))

(declare-fun res!1033061 () Bool)

(assert (=> b!1513156 (=> (not res!1033061) (not e!844531))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100880 (_ BitVec 32)) SeekEntryResult!12848)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100880 (_ BitVec 32)) SeekEntryResult!12848)

(assert (=> b!1513156 (= res!1033061 (= (seekEntryOrOpen!0 (select (arr!48677 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48677 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513157 () Bool)

(declare-fun res!1033064 () Bool)

(assert (=> b!1513157 (=> (not res!1033064) (not e!844525))))

(assert (=> b!1513157 (= res!1033064 (and (= (size!49227 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49227 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49227 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513158 () Bool)

(declare-fun res!1033066 () Bool)

(assert (=> b!1513158 (=> (not res!1033066) (not e!844525))))

(assert (=> b!1513158 (= res!1033066 (validKeyInArray!0 (select (arr!48677 a!2804) j!70)))))

(declare-fun b!1513159 () Bool)

(declare-fun res!1033067 () Bool)

(assert (=> b!1513159 (=> (not res!1033067) (not e!844525))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513159 (= res!1033067 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49227 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49227 a!2804))))))

(declare-fun b!1513160 () Bool)

(declare-fun e!844529 () Bool)

(assert (=> b!1513160 (= e!844529 e!844526)))

(declare-fun res!1033068 () Bool)

(assert (=> b!1513160 (=> (not res!1033068) (not e!844526))))

(declare-fun lt!655877 () SeekEntryResult!12848)

(declare-fun lt!655876 () array!100880)

(declare-fun lt!655878 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100880 (_ BitVec 32)) SeekEntryResult!12848)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513160 (= res!1033068 (= lt!655877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655878 mask!2512) lt!655878 lt!655876 mask!2512)))))

(assert (=> b!1513160 (= lt!655878 (select (store (arr!48677 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513160 (= lt!655876 (array!100881 (store (arr!48677 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49227 a!2804)))))

(declare-fun b!1513161 () Bool)

(declare-fun res!1033065 () Bool)

(assert (=> b!1513161 (=> (not res!1033065) (not e!844525))))

(declare-datatypes ((List!35160 0))(
  ( (Nil!35157) (Cons!35156 (h!36568 (_ BitVec 64)) (t!49854 List!35160)) )
))
(declare-fun arrayNoDuplicates!0 (array!100880 (_ BitVec 32) List!35160) Bool)

(assert (=> b!1513161 (= res!1033065 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35157))))

(declare-fun b!1513162 () Bool)

(declare-fun res!1033056 () Bool)

(assert (=> b!1513162 (=> (not res!1033056) (not e!844529))))

(declare-fun lt!655879 () SeekEntryResult!12848)

(assert (=> b!1513162 (= res!1033056 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48677 a!2804) j!70) a!2804 mask!2512) lt!655879))))

(declare-fun b!1513163 () Bool)

(assert (=> b!1513163 (= e!844531 (= (seekEntryOrOpen!0 lt!655878 lt!655876 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655878 lt!655876 mask!2512)))))

(declare-fun b!1513164 () Bool)

(declare-fun res!1033063 () Bool)

(assert (=> b!1513164 (=> (not res!1033063) (not e!844525))))

(assert (=> b!1513164 (= res!1033063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513165 () Bool)

(assert (=> b!1513165 (= e!844525 e!844529)))

(declare-fun res!1033058 () Bool)

(assert (=> b!1513165 (=> (not res!1033058) (not e!844529))))

(assert (=> b!1513165 (= res!1033058 (= lt!655877 lt!655879))))

(assert (=> b!1513165 (= lt!655879 (Intermediate!12848 false resIndex!21 resX!21))))

(assert (=> b!1513165 (= lt!655877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48677 a!2804) j!70) mask!2512) (select (arr!48677 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1033059 () Bool)

(assert (=> start!129024 (=> (not res!1033059) (not e!844525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129024 (= res!1033059 (validMask!0 mask!2512))))

(assert (=> start!129024 e!844525))

(assert (=> start!129024 true))

(declare-fun array_inv!37705 (array!100880) Bool)

(assert (=> start!129024 (array_inv!37705 a!2804)))

(declare-fun b!1513166 () Bool)

(assert (=> b!1513166 (= e!844528 e!844527)))

(declare-fun res!1033062 () Bool)

(assert (=> b!1513166 (=> res!1033062 e!844527)))

(assert (=> b!1513166 (= res!1033062 (or (not (= (select (arr!48677 a!2804) j!70) lt!655878)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48677 a!2804) index!487) (select (arr!48677 a!2804) j!70)) (not (= (select (arr!48677 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!129024 res!1033059) b!1513157))

(assert (= (and b!1513157 res!1033064) b!1513154))

(assert (= (and b!1513154 res!1033057) b!1513158))

(assert (= (and b!1513158 res!1033066) b!1513164))

(assert (= (and b!1513164 res!1033063) b!1513161))

(assert (= (and b!1513161 res!1033065) b!1513159))

(assert (= (and b!1513159 res!1033067) b!1513165))

(assert (= (and b!1513165 res!1033058) b!1513162))

(assert (= (and b!1513162 res!1033056) b!1513160))

(assert (= (and b!1513160 res!1033068) b!1513153))

(assert (= (and b!1513153 res!1033060) b!1513155))

(assert (= (and b!1513155 res!1033069) b!1513166))

(assert (= (and b!1513166 (not res!1033062)) b!1513156))

(assert (= (and b!1513156 res!1033061) b!1513163))

(declare-fun m!1395985 () Bool)

(assert (=> b!1513155 m!1395985))

(assert (=> b!1513155 m!1395985))

(declare-fun m!1395987 () Bool)

(assert (=> b!1513155 m!1395987))

(assert (=> b!1513158 m!1395985))

(assert (=> b!1513158 m!1395985))

(declare-fun m!1395989 () Bool)

(assert (=> b!1513158 m!1395989))

(declare-fun m!1395991 () Bool)

(assert (=> b!1513154 m!1395991))

(assert (=> b!1513154 m!1395991))

(declare-fun m!1395993 () Bool)

(assert (=> b!1513154 m!1395993))

(declare-fun m!1395995 () Bool)

(assert (=> b!1513160 m!1395995))

(assert (=> b!1513160 m!1395995))

(declare-fun m!1395997 () Bool)

(assert (=> b!1513160 m!1395997))

(declare-fun m!1395999 () Bool)

(assert (=> b!1513160 m!1395999))

(declare-fun m!1396001 () Bool)

(assert (=> b!1513160 m!1396001))

(declare-fun m!1396003 () Bool)

(assert (=> b!1513161 m!1396003))

(declare-fun m!1396005 () Bool)

(assert (=> b!1513163 m!1396005))

(declare-fun m!1396007 () Bool)

(assert (=> b!1513163 m!1396007))

(declare-fun m!1396009 () Bool)

(assert (=> start!129024 m!1396009))

(declare-fun m!1396011 () Bool)

(assert (=> start!129024 m!1396011))

(assert (=> b!1513165 m!1395985))

(assert (=> b!1513165 m!1395985))

(declare-fun m!1396013 () Bool)

(assert (=> b!1513165 m!1396013))

(assert (=> b!1513165 m!1396013))

(assert (=> b!1513165 m!1395985))

(declare-fun m!1396015 () Bool)

(assert (=> b!1513165 m!1396015))

(declare-fun m!1396017 () Bool)

(assert (=> b!1513164 m!1396017))

(assert (=> b!1513166 m!1395985))

(declare-fun m!1396019 () Bool)

(assert (=> b!1513166 m!1396019))

(declare-fun m!1396021 () Bool)

(assert (=> b!1513153 m!1396021))

(declare-fun m!1396023 () Bool)

(assert (=> b!1513153 m!1396023))

(assert (=> b!1513162 m!1395985))

(assert (=> b!1513162 m!1395985))

(declare-fun m!1396025 () Bool)

(assert (=> b!1513162 m!1396025))

(assert (=> b!1513156 m!1395985))

(assert (=> b!1513156 m!1395985))

(declare-fun m!1396027 () Bool)

(assert (=> b!1513156 m!1396027))

(assert (=> b!1513156 m!1395985))

(declare-fun m!1396029 () Bool)

(assert (=> b!1513156 m!1396029))

(push 1)

