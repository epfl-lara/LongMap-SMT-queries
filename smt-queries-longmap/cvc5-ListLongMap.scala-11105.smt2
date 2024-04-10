; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129652 () Bool)

(assert start!129652)

(declare-fun b!1522130 () Bool)

(declare-fun res!1041355 () Bool)

(declare-fun e!848752 () Bool)

(assert (=> b!1522130 (=> (not res!1041355) (not e!848752))))

(declare-datatypes ((array!101327 0))(
  ( (array!101328 (arr!48896 (Array (_ BitVec 32) (_ BitVec 64))) (size!49446 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101327)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522130 (= res!1041355 (validKeyInArray!0 (select (arr!48896 a!2804) j!70)))))

(declare-fun b!1522131 () Bool)

(declare-fun e!848750 () Bool)

(assert (=> b!1522131 (= e!848752 e!848750)))

(declare-fun res!1041359 () Bool)

(assert (=> b!1522131 (=> (not res!1041359) (not e!848750))))

(declare-datatypes ((SeekEntryResult!13061 0))(
  ( (MissingZero!13061 (index!54639 (_ BitVec 32))) (Found!13061 (index!54640 (_ BitVec 32))) (Intermediate!13061 (undefined!13873 Bool) (index!54641 (_ BitVec 32)) (x!136329 (_ BitVec 32))) (Undefined!13061) (MissingVacant!13061 (index!54642 (_ BitVec 32))) )
))
(declare-fun lt!659502 () SeekEntryResult!13061)

(declare-fun lt!659503 () SeekEntryResult!13061)

(assert (=> b!1522131 (= res!1041359 (= lt!659502 lt!659503))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522131 (= lt!659503 (Intermediate!13061 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101327 (_ BitVec 32)) SeekEntryResult!13061)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522131 (= lt!659502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48896 a!2804) j!70) mask!2512) (select (arr!48896 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522133 () Bool)

(declare-fun res!1041354 () Bool)

(assert (=> b!1522133 (=> (not res!1041354) (not e!848752))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522133 (= res!1041354 (and (= (size!49446 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49446 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49446 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522134 () Bool)

(declare-fun res!1041357 () Bool)

(assert (=> b!1522134 (=> (not res!1041357) (not e!848750))))

(assert (=> b!1522134 (= res!1041357 (= lt!659502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48896 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48896 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101328 (store (arr!48896 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49446 a!2804)) mask!2512)))))

(declare-fun b!1522135 () Bool)

(declare-fun res!1041356 () Bool)

(assert (=> b!1522135 (=> (not res!1041356) (not e!848752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101327 (_ BitVec 32)) Bool)

(assert (=> b!1522135 (= res!1041356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522136 () Bool)

(declare-fun res!1041358 () Bool)

(assert (=> b!1522136 (=> (not res!1041358) (not e!848752))))

(assert (=> b!1522136 (= res!1041358 (validKeyInArray!0 (select (arr!48896 a!2804) i!961)))))

(declare-fun b!1522137 () Bool)

(assert (=> b!1522137 (= e!848750 (not true))))

(assert (=> b!1522137 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50906 0))(
  ( (Unit!50907) )
))
(declare-fun lt!659501 () Unit!50906)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50906)

(assert (=> b!1522137 (= lt!659501 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522138 () Bool)

(declare-fun res!1041352 () Bool)

(assert (=> b!1522138 (=> (not res!1041352) (not e!848752))))

(declare-datatypes ((List!35379 0))(
  ( (Nil!35376) (Cons!35375 (h!36796 (_ BitVec 64)) (t!50073 List!35379)) )
))
(declare-fun arrayNoDuplicates!0 (array!101327 (_ BitVec 32) List!35379) Bool)

(assert (=> b!1522138 (= res!1041352 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35376))))

(declare-fun b!1522139 () Bool)

(declare-fun res!1041360 () Bool)

(assert (=> b!1522139 (=> (not res!1041360) (not e!848750))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522139 (= res!1041360 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48896 a!2804) j!70) a!2804 mask!2512) lt!659503))))

(declare-fun b!1522132 () Bool)

(declare-fun res!1041353 () Bool)

(assert (=> b!1522132 (=> (not res!1041353) (not e!848752))))

(assert (=> b!1522132 (= res!1041353 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49446 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49446 a!2804))))))

(declare-fun res!1041361 () Bool)

(assert (=> start!129652 (=> (not res!1041361) (not e!848752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129652 (= res!1041361 (validMask!0 mask!2512))))

(assert (=> start!129652 e!848752))

(assert (=> start!129652 true))

(declare-fun array_inv!37924 (array!101327) Bool)

(assert (=> start!129652 (array_inv!37924 a!2804)))

(assert (= (and start!129652 res!1041361) b!1522133))

(assert (= (and b!1522133 res!1041354) b!1522136))

(assert (= (and b!1522136 res!1041358) b!1522130))

(assert (= (and b!1522130 res!1041355) b!1522135))

(assert (= (and b!1522135 res!1041356) b!1522138))

(assert (= (and b!1522138 res!1041352) b!1522132))

(assert (= (and b!1522132 res!1041353) b!1522131))

(assert (= (and b!1522131 res!1041359) b!1522139))

(assert (= (and b!1522139 res!1041360) b!1522134))

(assert (= (and b!1522134 res!1041357) b!1522137))

(declare-fun m!1405259 () Bool)

(assert (=> b!1522130 m!1405259))

(assert (=> b!1522130 m!1405259))

(declare-fun m!1405261 () Bool)

(assert (=> b!1522130 m!1405261))

(declare-fun m!1405263 () Bool)

(assert (=> b!1522134 m!1405263))

(declare-fun m!1405265 () Bool)

(assert (=> b!1522134 m!1405265))

(assert (=> b!1522134 m!1405265))

(declare-fun m!1405267 () Bool)

(assert (=> b!1522134 m!1405267))

(assert (=> b!1522134 m!1405267))

(assert (=> b!1522134 m!1405265))

(declare-fun m!1405269 () Bool)

(assert (=> b!1522134 m!1405269))

(declare-fun m!1405271 () Bool)

(assert (=> b!1522136 m!1405271))

(assert (=> b!1522136 m!1405271))

(declare-fun m!1405273 () Bool)

(assert (=> b!1522136 m!1405273))

(assert (=> b!1522139 m!1405259))

(assert (=> b!1522139 m!1405259))

(declare-fun m!1405275 () Bool)

(assert (=> b!1522139 m!1405275))

(declare-fun m!1405277 () Bool)

(assert (=> b!1522138 m!1405277))

(declare-fun m!1405279 () Bool)

(assert (=> start!129652 m!1405279))

(declare-fun m!1405281 () Bool)

(assert (=> start!129652 m!1405281))

(declare-fun m!1405283 () Bool)

(assert (=> b!1522135 m!1405283))

(assert (=> b!1522131 m!1405259))

(assert (=> b!1522131 m!1405259))

(declare-fun m!1405285 () Bool)

(assert (=> b!1522131 m!1405285))

(assert (=> b!1522131 m!1405285))

(assert (=> b!1522131 m!1405259))

(declare-fun m!1405287 () Bool)

(assert (=> b!1522131 m!1405287))

(declare-fun m!1405289 () Bool)

(assert (=> b!1522137 m!1405289))

(declare-fun m!1405291 () Bool)

(assert (=> b!1522137 m!1405291))

(push 1)

