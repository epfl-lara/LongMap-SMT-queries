; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130112 () Bool)

(assert start!130112)

(declare-fun b!1527238 () Bool)

(declare-fun res!1045275 () Bool)

(declare-fun e!851230 () Bool)

(assert (=> b!1527238 (=> (not res!1045275) (not e!851230))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101525 0))(
  ( (array!101526 (arr!48989 (Array (_ BitVec 32) (_ BitVec 64))) (size!49539 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101525)

(declare-datatypes ((SeekEntryResult!13154 0))(
  ( (MissingZero!13154 (index!55011 (_ BitVec 32))) (Found!13154 (index!55012 (_ BitVec 32))) (Intermediate!13154 (undefined!13966 Bool) (index!55013 (_ BitVec 32)) (x!136704 (_ BitVec 32))) (Undefined!13154) (MissingVacant!13154 (index!55014 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101525 (_ BitVec 32)) SeekEntryResult!13154)

(assert (=> b!1527238 (= res!1045275 (= (seekEntry!0 (select (arr!48989 a!2804) j!70) a!2804 mask!2512) (Found!13154 j!70)))))

(declare-fun b!1527239 () Bool)

(declare-fun e!851236 () Bool)

(assert (=> b!1527239 (= e!851230 e!851236)))

(declare-fun res!1045281 () Bool)

(assert (=> b!1527239 (=> res!1045281 e!851236)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!661361 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527239 (= res!1045281 (or (not (= (select (arr!48989 a!2804) j!70) lt!661361)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48989 a!2804) index!487) (select (arr!48989 a!2804) j!70)) (not (= (select (arr!48989 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527240 () Bool)

(declare-fun e!851231 () Bool)

(declare-fun lt!661363 () array!101525)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101525 (_ BitVec 32)) SeekEntryResult!13154)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101525 (_ BitVec 32)) SeekEntryResult!13154)

(assert (=> b!1527240 (= e!851231 (= (seekEntryOrOpen!0 lt!661361 lt!661363 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661361 lt!661363 mask!2512)))))

(declare-fun b!1527241 () Bool)

(declare-fun res!1045274 () Bool)

(declare-fun e!851232 () Bool)

(assert (=> b!1527241 (=> (not res!1045274) (not e!851232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527241 (= res!1045274 (validKeyInArray!0 (select (arr!48989 a!2804) j!70)))))

(declare-fun b!1527242 () Bool)

(declare-fun e!851234 () Bool)

(declare-fun e!851233 () Bool)

(assert (=> b!1527242 (= e!851234 e!851233)))

(declare-fun res!1045282 () Bool)

(assert (=> b!1527242 (=> (not res!1045282) (not e!851233))))

(declare-fun lt!661362 () SeekEntryResult!13154)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101525 (_ BitVec 32)) SeekEntryResult!13154)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527242 (= res!1045282 (= lt!661362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661361 mask!2512) lt!661361 lt!661363 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527242 (= lt!661361 (select (store (arr!48989 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527242 (= lt!661363 (array!101526 (store (arr!48989 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49539 a!2804)))))

(declare-fun b!1527243 () Bool)

(declare-fun res!1045280 () Bool)

(assert (=> b!1527243 (=> (not res!1045280) (not e!851232))))

(assert (=> b!1527243 (= res!1045280 (validKeyInArray!0 (select (arr!48989 a!2804) i!961)))))

(declare-fun res!1045279 () Bool)

(assert (=> start!130112 (=> (not res!1045279) (not e!851232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130112 (= res!1045279 (validMask!0 mask!2512))))

(assert (=> start!130112 e!851232))

(assert (=> start!130112 true))

(declare-fun array_inv!38017 (array!101525) Bool)

(assert (=> start!130112 (array_inv!38017 a!2804)))

(declare-fun b!1527244 () Bool)

(assert (=> b!1527244 (= e!851233 (not true))))

(assert (=> b!1527244 e!851230))

(declare-fun res!1045284 () Bool)

(assert (=> b!1527244 (=> (not res!1045284) (not e!851230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101525 (_ BitVec 32)) Bool)

(assert (=> b!1527244 (= res!1045284 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51092 0))(
  ( (Unit!51093) )
))
(declare-fun lt!661359 () Unit!51092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51092)

(assert (=> b!1527244 (= lt!661359 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527245 () Bool)

(assert (=> b!1527245 (= e!851232 e!851234)))

(declare-fun res!1045272 () Bool)

(assert (=> b!1527245 (=> (not res!1045272) (not e!851234))))

(declare-fun lt!661360 () SeekEntryResult!13154)

(assert (=> b!1527245 (= res!1045272 (= lt!661362 lt!661360))))

(assert (=> b!1527245 (= lt!661360 (Intermediate!13154 false resIndex!21 resX!21))))

(assert (=> b!1527245 (= lt!661362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48989 a!2804) j!70) mask!2512) (select (arr!48989 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527246 () Bool)

(declare-fun res!1045277 () Bool)

(assert (=> b!1527246 (=> (not res!1045277) (not e!851232))))

(declare-datatypes ((List!35472 0))(
  ( (Nil!35469) (Cons!35468 (h!36901 (_ BitVec 64)) (t!50166 List!35472)) )
))
(declare-fun arrayNoDuplicates!0 (array!101525 (_ BitVec 32) List!35472) Bool)

(assert (=> b!1527246 (= res!1045277 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35469))))

(declare-fun b!1527247 () Bool)

(declare-fun res!1045285 () Bool)

(assert (=> b!1527247 (=> (not res!1045285) (not e!851232))))

(assert (=> b!1527247 (= res!1045285 (and (= (size!49539 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49539 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49539 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527248 () Bool)

(declare-fun res!1045278 () Bool)

(assert (=> b!1527248 (=> (not res!1045278) (not e!851232))))

(assert (=> b!1527248 (= res!1045278 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49539 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49539 a!2804))))))

(declare-fun b!1527249 () Bool)

(declare-fun res!1045276 () Bool)

(assert (=> b!1527249 (=> (not res!1045276) (not e!851234))))

(assert (=> b!1527249 (= res!1045276 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48989 a!2804) j!70) a!2804 mask!2512) lt!661360))))

(declare-fun b!1527250 () Bool)

(assert (=> b!1527250 (= e!851236 e!851231)))

(declare-fun res!1045273 () Bool)

(assert (=> b!1527250 (=> (not res!1045273) (not e!851231))))

(assert (=> b!1527250 (= res!1045273 (= (seekEntryOrOpen!0 (select (arr!48989 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48989 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527251 () Bool)

(declare-fun res!1045283 () Bool)

(assert (=> b!1527251 (=> (not res!1045283) (not e!851232))))

(assert (=> b!1527251 (= res!1045283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130112 res!1045279) b!1527247))

(assert (= (and b!1527247 res!1045285) b!1527243))

(assert (= (and b!1527243 res!1045280) b!1527241))

(assert (= (and b!1527241 res!1045274) b!1527251))

(assert (= (and b!1527251 res!1045283) b!1527246))

(assert (= (and b!1527246 res!1045277) b!1527248))

(assert (= (and b!1527248 res!1045278) b!1527245))

(assert (= (and b!1527245 res!1045272) b!1527249))

(assert (= (and b!1527249 res!1045276) b!1527242))

(assert (= (and b!1527242 res!1045282) b!1527244))

(assert (= (and b!1527244 res!1045284) b!1527238))

(assert (= (and b!1527238 res!1045275) b!1527239))

(assert (= (and b!1527239 (not res!1045281)) b!1527250))

(assert (= (and b!1527250 res!1045273) b!1527240))

(declare-fun m!1410117 () Bool)

(assert (=> b!1527246 m!1410117))

(declare-fun m!1410119 () Bool)

(assert (=> b!1527243 m!1410119))

(assert (=> b!1527243 m!1410119))

(declare-fun m!1410121 () Bool)

(assert (=> b!1527243 m!1410121))

(declare-fun m!1410123 () Bool)

(assert (=> b!1527250 m!1410123))

(assert (=> b!1527250 m!1410123))

(declare-fun m!1410125 () Bool)

(assert (=> b!1527250 m!1410125))

(assert (=> b!1527250 m!1410123))

(declare-fun m!1410127 () Bool)

(assert (=> b!1527250 m!1410127))

(assert (=> b!1527249 m!1410123))

(assert (=> b!1527249 m!1410123))

(declare-fun m!1410129 () Bool)

(assert (=> b!1527249 m!1410129))

(assert (=> b!1527241 m!1410123))

(assert (=> b!1527241 m!1410123))

(declare-fun m!1410131 () Bool)

(assert (=> b!1527241 m!1410131))

(assert (=> b!1527239 m!1410123))

(declare-fun m!1410133 () Bool)

(assert (=> b!1527239 m!1410133))

(declare-fun m!1410135 () Bool)

(assert (=> start!130112 m!1410135))

(declare-fun m!1410137 () Bool)

(assert (=> start!130112 m!1410137))

(assert (=> b!1527245 m!1410123))

(assert (=> b!1527245 m!1410123))

(declare-fun m!1410139 () Bool)

(assert (=> b!1527245 m!1410139))

(assert (=> b!1527245 m!1410139))

(assert (=> b!1527245 m!1410123))

(declare-fun m!1410141 () Bool)

(assert (=> b!1527245 m!1410141))

(declare-fun m!1410143 () Bool)

(assert (=> b!1527242 m!1410143))

(assert (=> b!1527242 m!1410143))

(declare-fun m!1410145 () Bool)

(assert (=> b!1527242 m!1410145))

(declare-fun m!1410147 () Bool)

(assert (=> b!1527242 m!1410147))

(declare-fun m!1410149 () Bool)

(assert (=> b!1527242 m!1410149))

(declare-fun m!1410151 () Bool)

(assert (=> b!1527251 m!1410151))

(declare-fun m!1410153 () Bool)

(assert (=> b!1527244 m!1410153))

(declare-fun m!1410155 () Bool)

(assert (=> b!1527244 m!1410155))

(declare-fun m!1410157 () Bool)

(assert (=> b!1527240 m!1410157))

(declare-fun m!1410159 () Bool)

(assert (=> b!1527240 m!1410159))

(assert (=> b!1527238 m!1410123))

(assert (=> b!1527238 m!1410123))

(declare-fun m!1410161 () Bool)

(assert (=> b!1527238 m!1410161))

(push 1)

