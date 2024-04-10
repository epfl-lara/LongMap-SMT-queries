; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129172 () Bool)

(assert start!129172)

(declare-fun b!1516147 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!846038 () Bool)

(declare-datatypes ((array!101028 0))(
  ( (array!101029 (arr!48751 (Array (_ BitVec 32) (_ BitVec 64))) (size!49301 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101028)

(assert (=> b!1516147 (= e!846038 (not (or (not (= (select (arr!48751 a!2804) j!70) (select (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!846039 () Bool)

(assert (=> b!1516147 e!846039))

(declare-fun res!1036054 () Bool)

(assert (=> b!1516147 (=> (not res!1036054) (not e!846039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101028 (_ BitVec 32)) Bool)

(assert (=> b!1516147 (= res!1036054 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50712 0))(
  ( (Unit!50713) )
))
(declare-fun lt!657311 () Unit!50712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50712)

(assert (=> b!1516147 (= lt!657311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516148 () Bool)

(declare-fun res!1036058 () Bool)

(declare-fun e!846037 () Bool)

(assert (=> b!1516148 (=> (not res!1036058) (not e!846037))))

(assert (=> b!1516148 (= res!1036058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1036055 () Bool)

(assert (=> start!129172 (=> (not res!1036055) (not e!846037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129172 (= res!1036055 (validMask!0 mask!2512))))

(assert (=> start!129172 e!846037))

(assert (=> start!129172 true))

(declare-fun array_inv!37779 (array!101028) Bool)

(assert (=> start!129172 (array_inv!37779 a!2804)))

(declare-fun b!1516149 () Bool)

(declare-fun res!1036059 () Bool)

(assert (=> b!1516149 (=> (not res!1036059) (not e!846037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516149 (= res!1036059 (validKeyInArray!0 (select (arr!48751 a!2804) i!961)))))

(declare-fun b!1516150 () Bool)

(declare-fun res!1036051 () Bool)

(assert (=> b!1516150 (=> (not res!1036051) (not e!846037))))

(assert (=> b!1516150 (= res!1036051 (validKeyInArray!0 (select (arr!48751 a!2804) j!70)))))

(declare-fun b!1516151 () Bool)

(declare-fun res!1036056 () Bool)

(assert (=> b!1516151 (=> (not res!1036056) (not e!846037))))

(declare-datatypes ((List!35234 0))(
  ( (Nil!35231) (Cons!35230 (h!36642 (_ BitVec 64)) (t!49928 List!35234)) )
))
(declare-fun arrayNoDuplicates!0 (array!101028 (_ BitVec 32) List!35234) Bool)

(assert (=> b!1516151 (= res!1036056 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35231))))

(declare-fun b!1516152 () Bool)

(assert (=> b!1516152 (= e!846037 e!846038)))

(declare-fun res!1036052 () Bool)

(assert (=> b!1516152 (=> (not res!1036052) (not e!846038))))

(declare-datatypes ((SeekEntryResult!12922 0))(
  ( (MissingZero!12922 (index!54083 (_ BitVec 32))) (Found!12922 (index!54084 (_ BitVec 32))) (Intermediate!12922 (undefined!13734 Bool) (index!54085 (_ BitVec 32)) (x!135776 (_ BitVec 32))) (Undefined!12922) (MissingVacant!12922 (index!54086 (_ BitVec 32))) )
))
(declare-fun lt!657312 () SeekEntryResult!12922)

(declare-fun lt!657313 () SeekEntryResult!12922)

(assert (=> b!1516152 (= res!1036052 (= lt!657312 lt!657313))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516152 (= lt!657313 (Intermediate!12922 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101028 (_ BitVec 32)) SeekEntryResult!12922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516152 (= lt!657312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48751 a!2804) j!70) mask!2512) (select (arr!48751 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516153 () Bool)

(declare-fun res!1036060 () Bool)

(assert (=> b!1516153 (=> (not res!1036060) (not e!846038))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1516153 (= res!1036060 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48751 a!2804) j!70) a!2804 mask!2512) lt!657313))))

(declare-fun b!1516154 () Bool)

(declare-fun res!1036053 () Bool)

(assert (=> b!1516154 (=> (not res!1036053) (not e!846037))))

(assert (=> b!1516154 (= res!1036053 (and (= (size!49301 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49301 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49301 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516155 () Bool)

(declare-fun res!1036057 () Bool)

(assert (=> b!1516155 (=> (not res!1036057) (not e!846037))))

(assert (=> b!1516155 (= res!1036057 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49301 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49301 a!2804))))))

(declare-fun b!1516156 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101028 (_ BitVec 32)) SeekEntryResult!12922)

(assert (=> b!1516156 (= e!846039 (= (seekEntry!0 (select (arr!48751 a!2804) j!70) a!2804 mask!2512) (Found!12922 j!70)))))

(declare-fun b!1516157 () Bool)

(declare-fun res!1036050 () Bool)

(assert (=> b!1516157 (=> (not res!1036050) (not e!846038))))

(assert (=> b!1516157 (= res!1036050 (= lt!657312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101029 (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49301 a!2804)) mask!2512)))))

(assert (= (and start!129172 res!1036055) b!1516154))

(assert (= (and b!1516154 res!1036053) b!1516149))

(assert (= (and b!1516149 res!1036059) b!1516150))

(assert (= (and b!1516150 res!1036051) b!1516148))

(assert (= (and b!1516148 res!1036058) b!1516151))

(assert (= (and b!1516151 res!1036056) b!1516155))

(assert (= (and b!1516155 res!1036057) b!1516152))

(assert (= (and b!1516152 res!1036052) b!1516153))

(assert (= (and b!1516153 res!1036060) b!1516157))

(assert (= (and b!1516157 res!1036050) b!1516147))

(assert (= (and b!1516147 res!1036054) b!1516156))

(declare-fun m!1399393 () Bool)

(assert (=> b!1516150 m!1399393))

(assert (=> b!1516150 m!1399393))

(declare-fun m!1399395 () Bool)

(assert (=> b!1516150 m!1399395))

(declare-fun m!1399397 () Bool)

(assert (=> b!1516148 m!1399397))

(declare-fun m!1399399 () Bool)

(assert (=> b!1516157 m!1399399))

(declare-fun m!1399401 () Bool)

(assert (=> b!1516157 m!1399401))

(assert (=> b!1516157 m!1399401))

(declare-fun m!1399403 () Bool)

(assert (=> b!1516157 m!1399403))

(assert (=> b!1516157 m!1399403))

(assert (=> b!1516157 m!1399401))

(declare-fun m!1399405 () Bool)

(assert (=> b!1516157 m!1399405))

(assert (=> b!1516147 m!1399393))

(declare-fun m!1399407 () Bool)

(assert (=> b!1516147 m!1399407))

(assert (=> b!1516147 m!1399399))

(assert (=> b!1516147 m!1399401))

(declare-fun m!1399409 () Bool)

(assert (=> b!1516147 m!1399409))

(assert (=> b!1516152 m!1399393))

(assert (=> b!1516152 m!1399393))

(declare-fun m!1399411 () Bool)

(assert (=> b!1516152 m!1399411))

(assert (=> b!1516152 m!1399411))

(assert (=> b!1516152 m!1399393))

(declare-fun m!1399413 () Bool)

(assert (=> b!1516152 m!1399413))

(declare-fun m!1399415 () Bool)

(assert (=> b!1516149 m!1399415))

(assert (=> b!1516149 m!1399415))

(declare-fun m!1399417 () Bool)

(assert (=> b!1516149 m!1399417))

(declare-fun m!1399419 () Bool)

(assert (=> b!1516151 m!1399419))

(assert (=> b!1516156 m!1399393))

(assert (=> b!1516156 m!1399393))

(declare-fun m!1399421 () Bool)

(assert (=> b!1516156 m!1399421))

(assert (=> b!1516153 m!1399393))

(assert (=> b!1516153 m!1399393))

(declare-fun m!1399423 () Bool)

(assert (=> b!1516153 m!1399423))

(declare-fun m!1399425 () Bool)

(assert (=> start!129172 m!1399425))

(declare-fun m!1399427 () Bool)

(assert (=> start!129172 m!1399427))

(push 1)

(assert (not b!1516151))

(assert (not b!1516152))

(assert (not b!1516148))

(assert (not b!1516157))

(assert (not b!1516147))

(assert (not b!1516150))

