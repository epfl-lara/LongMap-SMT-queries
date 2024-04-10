; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128986 () Bool)

(assert start!128986)

(declare-fun b!1512392 () Bool)

(declare-fun res!1032303 () Bool)

(declare-fun e!844192 () Bool)

(assert (=> b!1512392 (=> (not res!1032303) (not e!844192))))

(declare-datatypes ((array!100842 0))(
  ( (array!100843 (arr!48658 (Array (_ BitVec 32) (_ BitVec 64))) (size!49208 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100842)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100842 (_ BitVec 32)) Bool)

(assert (=> b!1512392 (= res!1032303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1032296 () Bool)

(assert (=> start!128986 (=> (not res!1032296) (not e!844192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128986 (= res!1032296 (validMask!0 mask!2512))))

(assert (=> start!128986 e!844192))

(assert (=> start!128986 true))

(declare-fun array_inv!37686 (array!100842) Bool)

(assert (=> start!128986 (array_inv!37686 a!2804)))

(declare-fun b!1512393 () Bool)

(declare-fun e!844193 () Bool)

(assert (=> b!1512393 (= e!844192 e!844193)))

(declare-fun res!1032307 () Bool)

(assert (=> b!1512393 (=> (not res!1032307) (not e!844193))))

(declare-datatypes ((SeekEntryResult!12829 0))(
  ( (MissingZero!12829 (index!53711 (_ BitVec 32))) (Found!12829 (index!53712 (_ BitVec 32))) (Intermediate!12829 (undefined!13641 Bool) (index!53713 (_ BitVec 32)) (x!135435 (_ BitVec 32))) (Undefined!12829) (MissingVacant!12829 (index!53714 (_ BitVec 32))) )
))
(declare-fun lt!655665 () SeekEntryResult!12829)

(declare-fun lt!655666 () SeekEntryResult!12829)

(assert (=> b!1512393 (= res!1032307 (= lt!655665 lt!655666))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512393 (= lt!655666 (Intermediate!12829 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100842 (_ BitVec 32)) SeekEntryResult!12829)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512393 (= lt!655665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48658 a!2804) j!70) mask!2512) (select (arr!48658 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512394 () Bool)

(declare-fun res!1032301 () Bool)

(assert (=> b!1512394 (=> (not res!1032301) (not e!844192))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512394 (= res!1032301 (and (= (size!49208 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49208 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49208 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512395 () Bool)

(declare-fun res!1032297 () Bool)

(assert (=> b!1512395 (=> (not res!1032297) (not e!844192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512395 (= res!1032297 (validKeyInArray!0 (select (arr!48658 a!2804) j!70)))))

(declare-fun b!1512396 () Bool)

(declare-fun res!1032295 () Bool)

(assert (=> b!1512396 (=> (not res!1032295) (not e!844192))))

(assert (=> b!1512396 (= res!1032295 (validKeyInArray!0 (select (arr!48658 a!2804) i!961)))))

(declare-fun b!1512397 () Bool)

(declare-fun e!844195 () Bool)

(declare-fun e!844191 () Bool)

(assert (=> b!1512397 (= e!844195 e!844191)))

(declare-fun res!1032300 () Bool)

(assert (=> b!1512397 (=> res!1032300 e!844191)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1512397 (= res!1032300 (or (not (= (select (arr!48658 a!2804) j!70) (select (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48658 a!2804) index!487) (select (arr!48658 a!2804) j!70)) (not (= (select (arr!48658 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512398 () Bool)

(declare-fun res!1032305 () Bool)

(assert (=> b!1512398 (=> (not res!1032305) (not e!844192))))

(assert (=> b!1512398 (= res!1032305 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49208 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49208 a!2804))))))

(declare-fun b!1512399 () Bool)

(declare-fun res!1032299 () Bool)

(assert (=> b!1512399 (=> (not res!1032299) (not e!844193))))

(assert (=> b!1512399 (= res!1032299 (= lt!655665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100843 (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49208 a!2804)) mask!2512)))))

(declare-fun b!1512400 () Bool)

(declare-fun res!1032302 () Bool)

(assert (=> b!1512400 (=> (not res!1032302) (not e!844195))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100842 (_ BitVec 32)) SeekEntryResult!12829)

(assert (=> b!1512400 (= res!1032302 (= (seekEntry!0 (select (arr!48658 a!2804) j!70) a!2804 mask!2512) (Found!12829 j!70)))))

(declare-fun b!1512401 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100842 (_ BitVec 32)) SeekEntryResult!12829)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100842 (_ BitVec 32)) SeekEntryResult!12829)

(assert (=> b!1512401 (= e!844191 (= (seekEntryOrOpen!0 (select (arr!48658 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48658 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512402 () Bool)

(declare-fun res!1032304 () Bool)

(assert (=> b!1512402 (=> (not res!1032304) (not e!844193))))

(assert (=> b!1512402 (= res!1032304 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48658 a!2804) j!70) a!2804 mask!2512) lt!655666))))

(declare-fun b!1512403 () Bool)

(assert (=> b!1512403 (= e!844193 (not true))))

(assert (=> b!1512403 e!844195))

(declare-fun res!1032298 () Bool)

(assert (=> b!1512403 (=> (not res!1032298) (not e!844195))))

(assert (=> b!1512403 (= res!1032298 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50526 0))(
  ( (Unit!50527) )
))
(declare-fun lt!655664 () Unit!50526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50526)

(assert (=> b!1512403 (= lt!655664 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512404 () Bool)

(declare-fun res!1032306 () Bool)

(assert (=> b!1512404 (=> (not res!1032306) (not e!844192))))

(declare-datatypes ((List!35141 0))(
  ( (Nil!35138) (Cons!35137 (h!36549 (_ BitVec 64)) (t!49835 List!35141)) )
))
(declare-fun arrayNoDuplicates!0 (array!100842 (_ BitVec 32) List!35141) Bool)

(assert (=> b!1512404 (= res!1032306 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35138))))

(assert (= (and start!128986 res!1032296) b!1512394))

(assert (= (and b!1512394 res!1032301) b!1512396))

(assert (= (and b!1512396 res!1032295) b!1512395))

(assert (= (and b!1512395 res!1032297) b!1512392))

(assert (= (and b!1512392 res!1032303) b!1512404))

(assert (= (and b!1512404 res!1032306) b!1512398))

(assert (= (and b!1512398 res!1032305) b!1512393))

(assert (= (and b!1512393 res!1032307) b!1512402))

(assert (= (and b!1512402 res!1032304) b!1512399))

(assert (= (and b!1512399 res!1032299) b!1512403))

(assert (= (and b!1512403 res!1032298) b!1512400))

(assert (= (and b!1512400 res!1032302) b!1512397))

(assert (= (and b!1512397 (not res!1032300)) b!1512401))

(declare-fun m!1395157 () Bool)

(assert (=> b!1512401 m!1395157))

(assert (=> b!1512401 m!1395157))

(declare-fun m!1395159 () Bool)

(assert (=> b!1512401 m!1395159))

(assert (=> b!1512401 m!1395157))

(declare-fun m!1395161 () Bool)

(assert (=> b!1512401 m!1395161))

(declare-fun m!1395163 () Bool)

(assert (=> b!1512399 m!1395163))

(declare-fun m!1395165 () Bool)

(assert (=> b!1512399 m!1395165))

(assert (=> b!1512399 m!1395165))

(declare-fun m!1395167 () Bool)

(assert (=> b!1512399 m!1395167))

(assert (=> b!1512399 m!1395167))

(assert (=> b!1512399 m!1395165))

(declare-fun m!1395169 () Bool)

(assert (=> b!1512399 m!1395169))

(assert (=> b!1512397 m!1395157))

(assert (=> b!1512397 m!1395163))

(assert (=> b!1512397 m!1395165))

(declare-fun m!1395171 () Bool)

(assert (=> b!1512397 m!1395171))

(declare-fun m!1395173 () Bool)

(assert (=> start!128986 m!1395173))

(declare-fun m!1395175 () Bool)

(assert (=> start!128986 m!1395175))

(declare-fun m!1395177 () Bool)

(assert (=> b!1512392 m!1395177))

(declare-fun m!1395179 () Bool)

(assert (=> b!1512396 m!1395179))

(assert (=> b!1512396 m!1395179))

(declare-fun m!1395181 () Bool)

(assert (=> b!1512396 m!1395181))

(declare-fun m!1395183 () Bool)

(assert (=> b!1512404 m!1395183))

(assert (=> b!1512395 m!1395157))

(assert (=> b!1512395 m!1395157))

(declare-fun m!1395185 () Bool)

(assert (=> b!1512395 m!1395185))

(assert (=> b!1512393 m!1395157))

(assert (=> b!1512393 m!1395157))

(declare-fun m!1395187 () Bool)

(assert (=> b!1512393 m!1395187))

(assert (=> b!1512393 m!1395187))

(assert (=> b!1512393 m!1395157))

(declare-fun m!1395189 () Bool)

(assert (=> b!1512393 m!1395189))

(declare-fun m!1395191 () Bool)

(assert (=> b!1512403 m!1395191))

(declare-fun m!1395193 () Bool)

(assert (=> b!1512403 m!1395193))

(assert (=> b!1512400 m!1395157))

(assert (=> b!1512400 m!1395157))

(declare-fun m!1395195 () Bool)

(assert (=> b!1512400 m!1395195))

(assert (=> b!1512402 m!1395157))

(assert (=> b!1512402 m!1395157))

(declare-fun m!1395197 () Bool)

(assert (=> b!1512402 m!1395197))

(push 1)

