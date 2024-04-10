; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130110 () Bool)

(assert start!130110)

(declare-fun b!1527196 () Bool)

(declare-fun res!1045234 () Bool)

(declare-fun e!851213 () Bool)

(assert (=> b!1527196 (=> (not res!1045234) (not e!851213))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101523 0))(
  ( (array!101524 (arr!48988 (Array (_ BitVec 32) (_ BitVec 64))) (size!49538 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101523)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527196 (= res!1045234 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49538 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49538 a!2804))))))

(declare-fun b!1527197 () Bool)

(declare-fun res!1045238 () Bool)

(declare-fun e!851212 () Bool)

(assert (=> b!1527197 (=> (not res!1045238) (not e!851212))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13153 0))(
  ( (MissingZero!13153 (index!55007 (_ BitVec 32))) (Found!13153 (index!55008 (_ BitVec 32))) (Intermediate!13153 (undefined!13965 Bool) (index!55009 (_ BitVec 32)) (x!136695 (_ BitVec 32))) (Undefined!13153) (MissingVacant!13153 (index!55010 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101523 (_ BitVec 32)) SeekEntryResult!13153)

(assert (=> b!1527197 (= res!1045238 (= (seekEntry!0 (select (arr!48988 a!2804) j!70) a!2804 mask!2512) (Found!13153 j!70)))))

(declare-fun b!1527198 () Bool)

(declare-fun res!1045231 () Bool)

(assert (=> b!1527198 (=> (not res!1045231) (not e!851213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527198 (= res!1045231 (validKeyInArray!0 (select (arr!48988 a!2804) j!70)))))

(declare-fun lt!661347 () (_ BitVec 64))

(declare-fun b!1527199 () Bool)

(declare-fun e!851210 () Bool)

(declare-fun lt!661348 () array!101523)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101523 (_ BitVec 32)) SeekEntryResult!13153)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101523 (_ BitVec 32)) SeekEntryResult!13153)

(assert (=> b!1527199 (= e!851210 (= (seekEntryOrOpen!0 lt!661347 lt!661348 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661347 lt!661348 mask!2512)))))

(declare-fun b!1527200 () Bool)

(declare-fun res!1045235 () Bool)

(declare-fun e!851215 () Bool)

(assert (=> b!1527200 (=> (not res!1045235) (not e!851215))))

(declare-fun lt!661346 () SeekEntryResult!13153)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101523 (_ BitVec 32)) SeekEntryResult!13153)

(assert (=> b!1527200 (= res!1045235 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48988 a!2804) j!70) a!2804 mask!2512) lt!661346))))

(declare-fun b!1527201 () Bool)

(declare-fun e!851214 () Bool)

(assert (=> b!1527201 (= e!851212 e!851214)))

(declare-fun res!1045237 () Bool)

(assert (=> b!1527201 (=> res!1045237 e!851214)))

(assert (=> b!1527201 (= res!1045237 (or (not (= (select (arr!48988 a!2804) j!70) lt!661347)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48988 a!2804) index!487) (select (arr!48988 a!2804) j!70)) (not (= (select (arr!48988 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527202 () Bool)

(declare-fun res!1045230 () Bool)

(assert (=> b!1527202 (=> (not res!1045230) (not e!851213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101523 (_ BitVec 32)) Bool)

(assert (=> b!1527202 (= res!1045230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527203 () Bool)

(declare-fun res!1045242 () Bool)

(assert (=> b!1527203 (=> (not res!1045242) (not e!851213))))

(declare-datatypes ((List!35471 0))(
  ( (Nil!35468) (Cons!35467 (h!36900 (_ BitVec 64)) (t!50165 List!35471)) )
))
(declare-fun arrayNoDuplicates!0 (array!101523 (_ BitVec 32) List!35471) Bool)

(assert (=> b!1527203 (= res!1045242 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35468))))

(declare-fun res!1045236 () Bool)

(assert (=> start!130110 (=> (not res!1045236) (not e!851213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130110 (= res!1045236 (validMask!0 mask!2512))))

(assert (=> start!130110 e!851213))

(assert (=> start!130110 true))

(declare-fun array_inv!38016 (array!101523) Bool)

(assert (=> start!130110 (array_inv!38016 a!2804)))

(declare-fun b!1527204 () Bool)

(declare-fun res!1045232 () Bool)

(assert (=> b!1527204 (=> (not res!1045232) (not e!851213))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527204 (= res!1045232 (validKeyInArray!0 (select (arr!48988 a!2804) i!961)))))

(declare-fun b!1527205 () Bool)

(assert (=> b!1527205 (= e!851214 e!851210)))

(declare-fun res!1045241 () Bool)

(assert (=> b!1527205 (=> (not res!1045241) (not e!851210))))

(assert (=> b!1527205 (= res!1045241 (= (seekEntryOrOpen!0 (select (arr!48988 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48988 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527206 () Bool)

(declare-fun res!1045243 () Bool)

(assert (=> b!1527206 (=> (not res!1045243) (not e!851213))))

(assert (=> b!1527206 (= res!1045243 (and (= (size!49538 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49538 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49538 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527207 () Bool)

(assert (=> b!1527207 (= e!851213 e!851215)))

(declare-fun res!1045233 () Bool)

(assert (=> b!1527207 (=> (not res!1045233) (not e!851215))))

(declare-fun lt!661345 () SeekEntryResult!13153)

(assert (=> b!1527207 (= res!1045233 (= lt!661345 lt!661346))))

(assert (=> b!1527207 (= lt!661346 (Intermediate!13153 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527207 (= lt!661345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48988 a!2804) j!70) mask!2512) (select (arr!48988 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527208 () Bool)

(declare-fun e!851209 () Bool)

(assert (=> b!1527208 (= e!851209 (not true))))

(assert (=> b!1527208 e!851212))

(declare-fun res!1045240 () Bool)

(assert (=> b!1527208 (=> (not res!1045240) (not e!851212))))

(assert (=> b!1527208 (= res!1045240 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51090 0))(
  ( (Unit!51091) )
))
(declare-fun lt!661344 () Unit!51090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51090)

(assert (=> b!1527208 (= lt!661344 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527209 () Bool)

(assert (=> b!1527209 (= e!851215 e!851209)))

(declare-fun res!1045239 () Bool)

(assert (=> b!1527209 (=> (not res!1045239) (not e!851209))))

(assert (=> b!1527209 (= res!1045239 (= lt!661345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661347 mask!2512) lt!661347 lt!661348 mask!2512)))))

(assert (=> b!1527209 (= lt!661347 (select (store (arr!48988 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527209 (= lt!661348 (array!101524 (store (arr!48988 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49538 a!2804)))))

(assert (= (and start!130110 res!1045236) b!1527206))

(assert (= (and b!1527206 res!1045243) b!1527204))

(assert (= (and b!1527204 res!1045232) b!1527198))

(assert (= (and b!1527198 res!1045231) b!1527202))

(assert (= (and b!1527202 res!1045230) b!1527203))

(assert (= (and b!1527203 res!1045242) b!1527196))

(assert (= (and b!1527196 res!1045234) b!1527207))

(assert (= (and b!1527207 res!1045233) b!1527200))

(assert (= (and b!1527200 res!1045235) b!1527209))

(assert (= (and b!1527209 res!1045239) b!1527208))

(assert (= (and b!1527208 res!1045240) b!1527197))

(assert (= (and b!1527197 res!1045238) b!1527201))

(assert (= (and b!1527201 (not res!1045237)) b!1527205))

(assert (= (and b!1527205 res!1045241) b!1527199))

(declare-fun m!1410071 () Bool)

(assert (=> b!1527209 m!1410071))

(assert (=> b!1527209 m!1410071))

(declare-fun m!1410073 () Bool)

(assert (=> b!1527209 m!1410073))

(declare-fun m!1410075 () Bool)

(assert (=> b!1527209 m!1410075))

(declare-fun m!1410077 () Bool)

(assert (=> b!1527209 m!1410077))

(declare-fun m!1410079 () Bool)

(assert (=> b!1527199 m!1410079))

(declare-fun m!1410081 () Bool)

(assert (=> b!1527199 m!1410081))

(declare-fun m!1410083 () Bool)

(assert (=> b!1527204 m!1410083))

(assert (=> b!1527204 m!1410083))

(declare-fun m!1410085 () Bool)

(assert (=> b!1527204 m!1410085))

(declare-fun m!1410087 () Bool)

(assert (=> b!1527202 m!1410087))

(declare-fun m!1410089 () Bool)

(assert (=> b!1527203 m!1410089))

(declare-fun m!1410091 () Bool)

(assert (=> b!1527207 m!1410091))

(assert (=> b!1527207 m!1410091))

(declare-fun m!1410093 () Bool)

(assert (=> b!1527207 m!1410093))

(assert (=> b!1527207 m!1410093))

(assert (=> b!1527207 m!1410091))

(declare-fun m!1410095 () Bool)

(assert (=> b!1527207 m!1410095))

(assert (=> b!1527198 m!1410091))

(assert (=> b!1527198 m!1410091))

(declare-fun m!1410097 () Bool)

(assert (=> b!1527198 m!1410097))

(assert (=> b!1527197 m!1410091))

(assert (=> b!1527197 m!1410091))

(declare-fun m!1410099 () Bool)

(assert (=> b!1527197 m!1410099))

(assert (=> b!1527205 m!1410091))

(assert (=> b!1527205 m!1410091))

(declare-fun m!1410101 () Bool)

(assert (=> b!1527205 m!1410101))

(assert (=> b!1527205 m!1410091))

(declare-fun m!1410103 () Bool)

(assert (=> b!1527205 m!1410103))

(assert (=> b!1527201 m!1410091))

(declare-fun m!1410105 () Bool)

(assert (=> b!1527201 m!1410105))

(declare-fun m!1410107 () Bool)

(assert (=> b!1527208 m!1410107))

(declare-fun m!1410109 () Bool)

(assert (=> b!1527208 m!1410109))

(declare-fun m!1410111 () Bool)

(assert (=> start!130110 m!1410111))

(declare-fun m!1410113 () Bool)

(assert (=> start!130110 m!1410113))

(assert (=> b!1527200 m!1410091))

(assert (=> b!1527200 m!1410091))

(declare-fun m!1410115 () Bool)

(assert (=> b!1527200 m!1410115))

(push 1)

