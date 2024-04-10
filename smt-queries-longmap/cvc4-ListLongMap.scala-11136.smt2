; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130116 () Bool)

(assert start!130116)

(declare-fun b!1527322 () Bool)

(declare-fun e!851278 () Bool)

(declare-fun e!851277 () Bool)

(assert (=> b!1527322 (= e!851278 e!851277)))

(declare-fun res!1045364 () Bool)

(assert (=> b!1527322 (=> res!1045364 e!851277)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!661389 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101529 0))(
  ( (array!101530 (arr!48991 (Array (_ BitVec 32) (_ BitVec 64))) (size!49541 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101529)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527322 (= res!1045364 (or (not (= (select (arr!48991 a!2804) j!70) lt!661389)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48991 a!2804) index!487) (select (arr!48991 a!2804) j!70)) (not (= (select (arr!48991 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527323 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!661392 () array!101529)

(declare-fun e!851274 () Bool)

(declare-datatypes ((SeekEntryResult!13156 0))(
  ( (MissingZero!13156 (index!55019 (_ BitVec 32))) (Found!13156 (index!55020 (_ BitVec 32))) (Intermediate!13156 (undefined!13968 Bool) (index!55021 (_ BitVec 32)) (x!136706 (_ BitVec 32))) (Undefined!13156) (MissingVacant!13156 (index!55022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101529 (_ BitVec 32)) SeekEntryResult!13156)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101529 (_ BitVec 32)) SeekEntryResult!13156)

(assert (=> b!1527323 (= e!851274 (= (seekEntryOrOpen!0 lt!661389 lt!661392 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661389 lt!661392 mask!2512)))))

(declare-fun b!1527324 () Bool)

(declare-fun e!851272 () Bool)

(declare-fun e!851276 () Bool)

(assert (=> b!1527324 (= e!851272 e!851276)))

(declare-fun res!1045361 () Bool)

(assert (=> b!1527324 (=> (not res!1045361) (not e!851276))))

(declare-fun lt!661390 () SeekEntryResult!13156)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101529 (_ BitVec 32)) SeekEntryResult!13156)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527324 (= res!1045361 (= lt!661390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661389 mask!2512) lt!661389 lt!661392 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527324 (= lt!661389 (select (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527324 (= lt!661392 (array!101530 (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49541 a!2804)))))

(declare-fun res!1045358 () Bool)

(declare-fun e!851275 () Bool)

(assert (=> start!130116 (=> (not res!1045358) (not e!851275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130116 (= res!1045358 (validMask!0 mask!2512))))

(assert (=> start!130116 e!851275))

(assert (=> start!130116 true))

(declare-fun array_inv!38019 (array!101529) Bool)

(assert (=> start!130116 (array_inv!38019 a!2804)))

(declare-fun b!1527325 () Bool)

(declare-fun res!1045356 () Bool)

(assert (=> b!1527325 (=> (not res!1045356) (not e!851275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527325 (= res!1045356 (validKeyInArray!0 (select (arr!48991 a!2804) i!961)))))

(declare-fun b!1527326 () Bool)

(declare-fun res!1045365 () Bool)

(assert (=> b!1527326 (=> (not res!1045365) (not e!851278))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101529 (_ BitVec 32)) SeekEntryResult!13156)

(assert (=> b!1527326 (= res!1045365 (= (seekEntry!0 (select (arr!48991 a!2804) j!70) a!2804 mask!2512) (Found!13156 j!70)))))

(declare-fun b!1527327 () Bool)

(declare-fun res!1045363 () Bool)

(assert (=> b!1527327 (=> (not res!1045363) (not e!851275))))

(assert (=> b!1527327 (= res!1045363 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49541 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49541 a!2804))))))

(declare-fun b!1527328 () Bool)

(assert (=> b!1527328 (= e!851275 e!851272)))

(declare-fun res!1045369 () Bool)

(assert (=> b!1527328 (=> (not res!1045369) (not e!851272))))

(declare-fun lt!661393 () SeekEntryResult!13156)

(assert (=> b!1527328 (= res!1045369 (= lt!661390 lt!661393))))

(assert (=> b!1527328 (= lt!661393 (Intermediate!13156 false resIndex!21 resX!21))))

(assert (=> b!1527328 (= lt!661390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48991 a!2804) j!70) mask!2512) (select (arr!48991 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527329 () Bool)

(declare-fun res!1045360 () Bool)

(assert (=> b!1527329 (=> (not res!1045360) (not e!851275))))

(assert (=> b!1527329 (= res!1045360 (validKeyInArray!0 (select (arr!48991 a!2804) j!70)))))

(declare-fun b!1527330 () Bool)

(assert (=> b!1527330 (= e!851277 e!851274)))

(declare-fun res!1045362 () Bool)

(assert (=> b!1527330 (=> (not res!1045362) (not e!851274))))

(assert (=> b!1527330 (= res!1045362 (= (seekEntryOrOpen!0 (select (arr!48991 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48991 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527331 () Bool)

(declare-fun res!1045357 () Bool)

(assert (=> b!1527331 (=> (not res!1045357) (not e!851275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101529 (_ BitVec 32)) Bool)

(assert (=> b!1527331 (= res!1045357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527332 () Bool)

(declare-fun res!1045368 () Bool)

(assert (=> b!1527332 (=> (not res!1045368) (not e!851275))))

(assert (=> b!1527332 (= res!1045368 (and (= (size!49541 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49541 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49541 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527333 () Bool)

(declare-fun res!1045366 () Bool)

(assert (=> b!1527333 (=> (not res!1045366) (not e!851272))))

(assert (=> b!1527333 (= res!1045366 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48991 a!2804) j!70) a!2804 mask!2512) lt!661393))))

(declare-fun b!1527334 () Bool)

(declare-fun res!1045367 () Bool)

(assert (=> b!1527334 (=> (not res!1045367) (not e!851275))))

(declare-datatypes ((List!35474 0))(
  ( (Nil!35471) (Cons!35470 (h!36903 (_ BitVec 64)) (t!50168 List!35474)) )
))
(declare-fun arrayNoDuplicates!0 (array!101529 (_ BitVec 32) List!35474) Bool)

(assert (=> b!1527334 (= res!1045367 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35471))))

(declare-fun b!1527335 () Bool)

(assert (=> b!1527335 (= e!851276 (not true))))

(assert (=> b!1527335 e!851278))

(declare-fun res!1045359 () Bool)

(assert (=> b!1527335 (=> (not res!1045359) (not e!851278))))

(assert (=> b!1527335 (= res!1045359 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51096 0))(
  ( (Unit!51097) )
))
(declare-fun lt!661391 () Unit!51096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51096)

(assert (=> b!1527335 (= lt!661391 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130116 res!1045358) b!1527332))

(assert (= (and b!1527332 res!1045368) b!1527325))

(assert (= (and b!1527325 res!1045356) b!1527329))

(assert (= (and b!1527329 res!1045360) b!1527331))

(assert (= (and b!1527331 res!1045357) b!1527334))

(assert (= (and b!1527334 res!1045367) b!1527327))

(assert (= (and b!1527327 res!1045363) b!1527328))

(assert (= (and b!1527328 res!1045369) b!1527333))

(assert (= (and b!1527333 res!1045366) b!1527324))

(assert (= (and b!1527324 res!1045361) b!1527335))

(assert (= (and b!1527335 res!1045359) b!1527326))

(assert (= (and b!1527326 res!1045365) b!1527322))

(assert (= (and b!1527322 (not res!1045364)) b!1527330))

(assert (= (and b!1527330 res!1045362) b!1527323))

(declare-fun m!1410209 () Bool)

(assert (=> start!130116 m!1410209))

(declare-fun m!1410211 () Bool)

(assert (=> start!130116 m!1410211))

(declare-fun m!1410213 () Bool)

(assert (=> b!1527322 m!1410213))

(declare-fun m!1410215 () Bool)

(assert (=> b!1527322 m!1410215))

(assert (=> b!1527326 m!1410213))

(assert (=> b!1527326 m!1410213))

(declare-fun m!1410217 () Bool)

(assert (=> b!1527326 m!1410217))

(declare-fun m!1410219 () Bool)

(assert (=> b!1527335 m!1410219))

(declare-fun m!1410221 () Bool)

(assert (=> b!1527335 m!1410221))

(declare-fun m!1410223 () Bool)

(assert (=> b!1527324 m!1410223))

(assert (=> b!1527324 m!1410223))

(declare-fun m!1410225 () Bool)

(assert (=> b!1527324 m!1410225))

(declare-fun m!1410227 () Bool)

(assert (=> b!1527324 m!1410227))

(declare-fun m!1410229 () Bool)

(assert (=> b!1527324 m!1410229))

(assert (=> b!1527333 m!1410213))

(assert (=> b!1527333 m!1410213))

(declare-fun m!1410231 () Bool)

(assert (=> b!1527333 m!1410231))

(declare-fun m!1410233 () Bool)

(assert (=> b!1527334 m!1410233))

(assert (=> b!1527329 m!1410213))

(assert (=> b!1527329 m!1410213))

(declare-fun m!1410235 () Bool)

(assert (=> b!1527329 m!1410235))

(declare-fun m!1410237 () Bool)

(assert (=> b!1527331 m!1410237))

(assert (=> b!1527328 m!1410213))

(assert (=> b!1527328 m!1410213))

(declare-fun m!1410239 () Bool)

(assert (=> b!1527328 m!1410239))

(assert (=> b!1527328 m!1410239))

(assert (=> b!1527328 m!1410213))

(declare-fun m!1410241 () Bool)

(assert (=> b!1527328 m!1410241))

(assert (=> b!1527330 m!1410213))

(assert (=> b!1527330 m!1410213))

(declare-fun m!1410243 () Bool)

(assert (=> b!1527330 m!1410243))

(assert (=> b!1527330 m!1410213))

(declare-fun m!1410245 () Bool)

(assert (=> b!1527330 m!1410245))

(declare-fun m!1410247 () Bool)

(assert (=> b!1527325 m!1410247))

(assert (=> b!1527325 m!1410247))

(declare-fun m!1410249 () Bool)

(assert (=> b!1527325 m!1410249))

(declare-fun m!1410251 () Bool)

(assert (=> b!1527323 m!1410251))

(declare-fun m!1410253 () Bool)

(assert (=> b!1527323 m!1410253))

(push 1)

