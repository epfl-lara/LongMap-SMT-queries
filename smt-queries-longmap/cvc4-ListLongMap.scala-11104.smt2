; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129650 () Bool)

(assert start!129650)

(declare-fun b!1522101 () Bool)

(declare-fun res!1041327 () Bool)

(declare-fun e!848743 () Bool)

(assert (=> b!1522101 (=> (not res!1041327) (not e!848743))))

(declare-datatypes ((array!101325 0))(
  ( (array!101326 (arr!48895 (Array (_ BitVec 32) (_ BitVec 64))) (size!49445 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101325)

(declare-datatypes ((List!35378 0))(
  ( (Nil!35375) (Cons!35374 (h!36795 (_ BitVec 64)) (t!50072 List!35378)) )
))
(declare-fun arrayNoDuplicates!0 (array!101325 (_ BitVec 32) List!35378) Bool)

(assert (=> b!1522101 (= res!1041327 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35375))))

(declare-fun b!1522102 () Bool)

(declare-fun res!1041325 () Bool)

(assert (=> b!1522102 (=> (not res!1041325) (not e!848743))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522102 (= res!1041325 (validKeyInArray!0 (select (arr!48895 a!2804) j!70)))))

(declare-fun b!1522103 () Bool)

(declare-fun res!1041324 () Bool)

(assert (=> b!1522103 (=> (not res!1041324) (not e!848743))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522103 (= res!1041324 (validKeyInArray!0 (select (arr!48895 a!2804) i!961)))))

(declare-fun b!1522104 () Bool)

(declare-fun res!1041328 () Bool)

(assert (=> b!1522104 (=> (not res!1041328) (not e!848743))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101325 (_ BitVec 32)) Bool)

(assert (=> b!1522104 (= res!1041328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1041326 () Bool)

(assert (=> start!129650 (=> (not res!1041326) (not e!848743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129650 (= res!1041326 (validMask!0 mask!2512))))

(assert (=> start!129650 e!848743))

(assert (=> start!129650 true))

(declare-fun array_inv!37923 (array!101325) Bool)

(assert (=> start!129650 (array_inv!37923 a!2804)))

(declare-fun b!1522105 () Bool)

(declare-fun e!848742 () Bool)

(assert (=> b!1522105 (= e!848743 e!848742)))

(declare-fun res!1041329 () Bool)

(assert (=> b!1522105 (=> (not res!1041329) (not e!848742))))

(declare-datatypes ((SeekEntryResult!13060 0))(
  ( (MissingZero!13060 (index!54635 (_ BitVec 32))) (Found!13060 (index!54636 (_ BitVec 32))) (Intermediate!13060 (undefined!13872 Bool) (index!54637 (_ BitVec 32)) (x!136320 (_ BitVec 32))) (Undefined!13060) (MissingVacant!13060 (index!54638 (_ BitVec 32))) )
))
(declare-fun lt!659493 () SeekEntryResult!13060)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101325 (_ BitVec 32)) SeekEntryResult!13060)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522105 (= res!1041329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48895 a!2804) j!70) mask!2512) (select (arr!48895 a!2804) j!70) a!2804 mask!2512) lt!659493))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522105 (= lt!659493 (Intermediate!13060 false resIndex!21 resX!21))))

(declare-fun b!1522106 () Bool)

(declare-fun res!1041331 () Bool)

(assert (=> b!1522106 (=> (not res!1041331) (not e!848743))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522106 (= res!1041331 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49445 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49445 a!2804))))))

(declare-fun b!1522107 () Bool)

(assert (=> b!1522107 (= e!848742 false)))

(declare-fun lt!659494 () SeekEntryResult!13060)

(assert (=> b!1522107 (= lt!659494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48895 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48895 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101326 (store (arr!48895 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49445 a!2804)) mask!2512))))

(declare-fun b!1522108 () Bool)

(declare-fun res!1041323 () Bool)

(assert (=> b!1522108 (=> (not res!1041323) (not e!848743))))

(assert (=> b!1522108 (= res!1041323 (and (= (size!49445 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49445 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49445 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522109 () Bool)

(declare-fun res!1041330 () Bool)

(assert (=> b!1522109 (=> (not res!1041330) (not e!848742))))

(assert (=> b!1522109 (= res!1041330 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48895 a!2804) j!70) a!2804 mask!2512) lt!659493))))

(assert (= (and start!129650 res!1041326) b!1522108))

(assert (= (and b!1522108 res!1041323) b!1522103))

(assert (= (and b!1522103 res!1041324) b!1522102))

(assert (= (and b!1522102 res!1041325) b!1522104))

(assert (= (and b!1522104 res!1041328) b!1522101))

(assert (= (and b!1522101 res!1041327) b!1522106))

(assert (= (and b!1522106 res!1041331) b!1522105))

(assert (= (and b!1522105 res!1041329) b!1522109))

(assert (= (and b!1522109 res!1041330) b!1522107))

(declare-fun m!1405229 () Bool)

(assert (=> b!1522109 m!1405229))

(assert (=> b!1522109 m!1405229))

(declare-fun m!1405231 () Bool)

(assert (=> b!1522109 m!1405231))

(declare-fun m!1405233 () Bool)

(assert (=> b!1522103 m!1405233))

(assert (=> b!1522103 m!1405233))

(declare-fun m!1405235 () Bool)

(assert (=> b!1522103 m!1405235))

(assert (=> b!1522105 m!1405229))

(assert (=> b!1522105 m!1405229))

(declare-fun m!1405237 () Bool)

(assert (=> b!1522105 m!1405237))

(assert (=> b!1522105 m!1405237))

(assert (=> b!1522105 m!1405229))

(declare-fun m!1405239 () Bool)

(assert (=> b!1522105 m!1405239))

(declare-fun m!1405241 () Bool)

(assert (=> b!1522107 m!1405241))

(declare-fun m!1405243 () Bool)

(assert (=> b!1522107 m!1405243))

(assert (=> b!1522107 m!1405243))

(declare-fun m!1405245 () Bool)

(assert (=> b!1522107 m!1405245))

(assert (=> b!1522107 m!1405245))

(assert (=> b!1522107 m!1405243))

(declare-fun m!1405247 () Bool)

(assert (=> b!1522107 m!1405247))

(declare-fun m!1405249 () Bool)

(assert (=> b!1522104 m!1405249))

(declare-fun m!1405251 () Bool)

(assert (=> b!1522101 m!1405251))

(declare-fun m!1405253 () Bool)

(assert (=> start!129650 m!1405253))

(declare-fun m!1405255 () Bool)

(assert (=> start!129650 m!1405255))

(assert (=> b!1522102 m!1405229))

(assert (=> b!1522102 m!1405229))

(declare-fun m!1405257 () Bool)

(assert (=> b!1522102 m!1405257))

(push 1)

(assert (not b!1522101))

(assert (not b!1522105))

(assert (not b!1522102))

(assert (not b!1522109))

(assert (not b!1522107))

