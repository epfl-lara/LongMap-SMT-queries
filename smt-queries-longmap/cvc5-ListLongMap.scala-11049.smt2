; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129126 () Bool)

(assert start!129126)

(declare-fun b!1515275 () Bool)

(declare-fun res!1035181 () Bool)

(declare-fun e!845602 () Bool)

(assert (=> b!1515275 (=> (not res!1035181) (not e!845602))))

(declare-datatypes ((array!100982 0))(
  ( (array!100983 (arr!48728 (Array (_ BitVec 32) (_ BitVec 64))) (size!49278 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100982)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515275 (= res!1035181 (validKeyInArray!0 (select (arr!48728 a!2804) i!961)))))

(declare-fun b!1515276 () Bool)

(declare-fun e!845596 () Bool)

(assert (=> b!1515276 (= e!845602 e!845596)))

(declare-fun res!1035188 () Bool)

(assert (=> b!1515276 (=> (not res!1035188) (not e!845596))))

(declare-datatypes ((SeekEntryResult!12899 0))(
  ( (MissingZero!12899 (index!53991 (_ BitVec 32))) (Found!12899 (index!53992 (_ BitVec 32))) (Intermediate!12899 (undefined!13711 Bool) (index!53993 (_ BitVec 32)) (x!135697 (_ BitVec 32))) (Undefined!12899) (MissingVacant!12899 (index!53994 (_ BitVec 32))) )
))
(declare-fun lt!656747 () SeekEntryResult!12899)

(declare-fun lt!656746 () SeekEntryResult!12899)

(assert (=> b!1515276 (= res!1035188 (= lt!656747 lt!656746))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515276 (= lt!656746 (Intermediate!12899 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100982 (_ BitVec 32)) SeekEntryResult!12899)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515276 (= lt!656747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48728 a!2804) j!70) mask!2512) (select (arr!48728 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515277 () Bool)

(declare-fun res!1035186 () Bool)

(assert (=> b!1515277 (=> (not res!1035186) (not e!845602))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515277 (= res!1035186 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49278 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49278 a!2804))))))

(declare-fun res!1035182 () Bool)

(assert (=> start!129126 (=> (not res!1035182) (not e!845602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129126 (= res!1035182 (validMask!0 mask!2512))))

(assert (=> start!129126 e!845602))

(assert (=> start!129126 true))

(declare-fun array_inv!37756 (array!100982) Bool)

(assert (=> start!129126 (array_inv!37756 a!2804)))

(declare-fun b!1515278 () Bool)

(declare-fun e!845598 () Bool)

(declare-fun e!845597 () Bool)

(assert (=> b!1515278 (= e!845598 (not e!845597))))

(declare-fun res!1035180 () Bool)

(assert (=> b!1515278 (=> res!1035180 e!845597)))

(declare-fun lt!656741 () (_ BitVec 64))

(assert (=> b!1515278 (= res!1035180 (or (not (= (select (arr!48728 a!2804) j!70) lt!656741)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48728 a!2804) index!487) (select (arr!48728 a!2804) j!70)) (not (= (select (arr!48728 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845600 () Bool)

(assert (=> b!1515278 e!845600))

(declare-fun res!1035189 () Bool)

(assert (=> b!1515278 (=> (not res!1035189) (not e!845600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100982 (_ BitVec 32)) Bool)

(assert (=> b!1515278 (= res!1035189 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50666 0))(
  ( (Unit!50667) )
))
(declare-fun lt!656749 () Unit!50666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50666)

(assert (=> b!1515278 (= lt!656749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515279 () Bool)

(declare-fun res!1035185 () Bool)

(assert (=> b!1515279 (=> (not res!1035185) (not e!845602))))

(assert (=> b!1515279 (= res!1035185 (validKeyInArray!0 (select (arr!48728 a!2804) j!70)))))

(declare-fun b!1515280 () Bool)

(declare-fun res!1035187 () Bool)

(assert (=> b!1515280 (=> (not res!1035187) (not e!845602))))

(assert (=> b!1515280 (= res!1035187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515281 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100982 (_ BitVec 32)) SeekEntryResult!12899)

(assert (=> b!1515281 (= e!845600 (= (seekEntry!0 (select (arr!48728 a!2804) j!70) a!2804 mask!2512) (Found!12899 j!70)))))

(declare-fun b!1515282 () Bool)

(declare-fun e!845599 () Bool)

(assert (=> b!1515282 (= e!845599 true)))

(declare-fun lt!656740 () SeekEntryResult!12899)

(declare-fun lt!656744 () SeekEntryResult!12899)

(assert (=> b!1515282 (= lt!656740 lt!656744)))

(declare-fun lt!656748 () Unit!50666)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50666)

(assert (=> b!1515282 (= lt!656748 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515283 () Bool)

(declare-fun res!1035184 () Bool)

(assert (=> b!1515283 (=> (not res!1035184) (not e!845602))))

(assert (=> b!1515283 (= res!1035184 (and (= (size!49278 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49278 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49278 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515284 () Bool)

(assert (=> b!1515284 (= e!845596 e!845598)))

(declare-fun res!1035179 () Bool)

(assert (=> b!1515284 (=> (not res!1035179) (not e!845598))))

(declare-fun lt!656745 () array!100982)

(assert (=> b!1515284 (= res!1035179 (= lt!656747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656741 mask!2512) lt!656741 lt!656745 mask!2512)))))

(assert (=> b!1515284 (= lt!656741 (select (store (arr!48728 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515284 (= lt!656745 (array!100983 (store (arr!48728 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49278 a!2804)))))

(declare-fun b!1515285 () Bool)

(assert (=> b!1515285 (= e!845597 e!845599)))

(declare-fun res!1035183 () Bool)

(assert (=> b!1515285 (=> res!1035183 e!845599)))

(assert (=> b!1515285 (= res!1035183 (not (= lt!656744 (Found!12899 j!70))))))

(declare-fun lt!656743 () SeekEntryResult!12899)

(assert (=> b!1515285 (= lt!656743 lt!656740)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100982 (_ BitVec 32)) SeekEntryResult!12899)

(assert (=> b!1515285 (= lt!656740 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656741 lt!656745 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100982 (_ BitVec 32)) SeekEntryResult!12899)

(assert (=> b!1515285 (= lt!656743 (seekEntryOrOpen!0 lt!656741 lt!656745 mask!2512))))

(declare-fun lt!656742 () SeekEntryResult!12899)

(assert (=> b!1515285 (= lt!656742 lt!656744)))

(assert (=> b!1515285 (= lt!656744 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48728 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515285 (= lt!656742 (seekEntryOrOpen!0 (select (arr!48728 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515286 () Bool)

(declare-fun res!1035190 () Bool)

(assert (=> b!1515286 (=> (not res!1035190) (not e!845596))))

(assert (=> b!1515286 (= res!1035190 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48728 a!2804) j!70) a!2804 mask!2512) lt!656746))))

(declare-fun b!1515287 () Bool)

(declare-fun res!1035178 () Bool)

(assert (=> b!1515287 (=> (not res!1035178) (not e!845602))))

(declare-datatypes ((List!35211 0))(
  ( (Nil!35208) (Cons!35207 (h!36619 (_ BitVec 64)) (t!49905 List!35211)) )
))
(declare-fun arrayNoDuplicates!0 (array!100982 (_ BitVec 32) List!35211) Bool)

(assert (=> b!1515287 (= res!1035178 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35208))))

(assert (= (and start!129126 res!1035182) b!1515283))

(assert (= (and b!1515283 res!1035184) b!1515275))

(assert (= (and b!1515275 res!1035181) b!1515279))

(assert (= (and b!1515279 res!1035185) b!1515280))

(assert (= (and b!1515280 res!1035187) b!1515287))

(assert (= (and b!1515287 res!1035178) b!1515277))

(assert (= (and b!1515277 res!1035186) b!1515276))

(assert (= (and b!1515276 res!1035188) b!1515286))

(assert (= (and b!1515286 res!1035190) b!1515284))

(assert (= (and b!1515284 res!1035179) b!1515278))

(assert (= (and b!1515278 res!1035189) b!1515281))

(assert (= (and b!1515278 (not res!1035180)) b!1515285))

(assert (= (and b!1515285 (not res!1035183)) b!1515282))

(declare-fun m!1398343 () Bool)

(assert (=> b!1515285 m!1398343))

(declare-fun m!1398345 () Bool)

(assert (=> b!1515285 m!1398345))

(assert (=> b!1515285 m!1398343))

(declare-fun m!1398347 () Bool)

(assert (=> b!1515285 m!1398347))

(declare-fun m!1398349 () Bool)

(assert (=> b!1515285 m!1398349))

(assert (=> b!1515285 m!1398343))

(declare-fun m!1398351 () Bool)

(assert (=> b!1515285 m!1398351))

(declare-fun m!1398353 () Bool)

(assert (=> b!1515275 m!1398353))

(assert (=> b!1515275 m!1398353))

(declare-fun m!1398355 () Bool)

(assert (=> b!1515275 m!1398355))

(assert (=> b!1515286 m!1398343))

(assert (=> b!1515286 m!1398343))

(declare-fun m!1398357 () Bool)

(assert (=> b!1515286 m!1398357))

(assert (=> b!1515276 m!1398343))

(assert (=> b!1515276 m!1398343))

(declare-fun m!1398359 () Bool)

(assert (=> b!1515276 m!1398359))

(assert (=> b!1515276 m!1398359))

(assert (=> b!1515276 m!1398343))

(declare-fun m!1398361 () Bool)

(assert (=> b!1515276 m!1398361))

(assert (=> b!1515279 m!1398343))

(assert (=> b!1515279 m!1398343))

(declare-fun m!1398363 () Bool)

(assert (=> b!1515279 m!1398363))

(assert (=> b!1515278 m!1398343))

(declare-fun m!1398365 () Bool)

(assert (=> b!1515278 m!1398365))

(declare-fun m!1398367 () Bool)

(assert (=> b!1515278 m!1398367))

(declare-fun m!1398369 () Bool)

(assert (=> b!1515278 m!1398369))

(assert (=> b!1515281 m!1398343))

(assert (=> b!1515281 m!1398343))

(declare-fun m!1398371 () Bool)

(assert (=> b!1515281 m!1398371))

(declare-fun m!1398373 () Bool)

(assert (=> b!1515280 m!1398373))

(declare-fun m!1398375 () Bool)

(assert (=> b!1515287 m!1398375))

(declare-fun m!1398377 () Bool)

(assert (=> b!1515284 m!1398377))

(assert (=> b!1515284 m!1398377))

(declare-fun m!1398379 () Bool)

(assert (=> b!1515284 m!1398379))

(declare-fun m!1398381 () Bool)

(assert (=> b!1515284 m!1398381))

(declare-fun m!1398383 () Bool)

(assert (=> b!1515284 m!1398383))

(declare-fun m!1398385 () Bool)

(assert (=> start!129126 m!1398385))

(declare-fun m!1398387 () Bool)

(assert (=> start!129126 m!1398387))

(declare-fun m!1398389 () Bool)

(assert (=> b!1515282 m!1398389))

(push 1)

