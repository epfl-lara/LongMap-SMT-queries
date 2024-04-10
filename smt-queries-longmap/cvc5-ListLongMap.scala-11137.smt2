; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130118 () Bool)

(assert start!130118)

(declare-fun b!1527364 () Bool)

(declare-fun res!1045400 () Bool)

(declare-fun e!851298 () Bool)

(assert (=> b!1527364 (=> (not res!1045400) (not e!851298))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101531 0))(
  ( (array!101532 (arr!48992 (Array (_ BitVec 32) (_ BitVec 64))) (size!49542 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101531)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527364 (= res!1045400 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49542 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49542 a!2804))))))

(declare-fun b!1527365 () Bool)

(declare-fun res!1045399 () Bool)

(assert (=> b!1527365 (=> (not res!1045399) (not e!851298))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101531 (_ BitVec 32)) Bool)

(assert (=> b!1527365 (= res!1045399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1045398 () Bool)

(assert (=> start!130118 (=> (not res!1045398) (not e!851298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130118 (= res!1045398 (validMask!0 mask!2512))))

(assert (=> start!130118 e!851298))

(assert (=> start!130118 true))

(declare-fun array_inv!38020 (array!101531) Bool)

(assert (=> start!130118 (array_inv!38020 a!2804)))

(declare-fun b!1527366 () Bool)

(declare-fun res!1045406 () Bool)

(declare-fun e!851295 () Bool)

(assert (=> b!1527366 (=> (not res!1045406) (not e!851295))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13157 0))(
  ( (MissingZero!13157 (index!55023 (_ BitVec 32))) (Found!13157 (index!55024 (_ BitVec 32))) (Intermediate!13157 (undefined!13969 Bool) (index!55025 (_ BitVec 32)) (x!136715 (_ BitVec 32))) (Undefined!13157) (MissingVacant!13157 (index!55026 (_ BitVec 32))) )
))
(declare-fun lt!661404 () SeekEntryResult!13157)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101531 (_ BitVec 32)) SeekEntryResult!13157)

(assert (=> b!1527366 (= res!1045406 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48992 a!2804) j!70) a!2804 mask!2512) lt!661404))))

(declare-fun b!1527367 () Bool)

(declare-fun e!851293 () Bool)

(declare-fun e!851297 () Bool)

(assert (=> b!1527367 (= e!851293 e!851297)))

(declare-fun res!1045408 () Bool)

(assert (=> b!1527367 (=> res!1045408 e!851297)))

(declare-fun lt!661407 () (_ BitVec 64))

(assert (=> b!1527367 (= res!1045408 (or (not (= (select (arr!48992 a!2804) j!70) lt!661407)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48992 a!2804) index!487) (select (arr!48992 a!2804) j!70)) (not (= (select (arr!48992 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527368 () Bool)

(declare-fun e!851299 () Bool)

(assert (=> b!1527368 (= e!851295 e!851299)))

(declare-fun res!1045409 () Bool)

(assert (=> b!1527368 (=> (not res!1045409) (not e!851299))))

(declare-fun lt!661408 () SeekEntryResult!13157)

(declare-fun lt!661405 () array!101531)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527368 (= res!1045409 (= lt!661408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661407 mask!2512) lt!661407 lt!661405 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527368 (= lt!661407 (select (store (arr!48992 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527368 (= lt!661405 (array!101532 (store (arr!48992 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49542 a!2804)))))

(declare-fun e!851296 () Bool)

(declare-fun b!1527369 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101531 (_ BitVec 32)) SeekEntryResult!13157)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101531 (_ BitVec 32)) SeekEntryResult!13157)

(assert (=> b!1527369 (= e!851296 (= (seekEntryOrOpen!0 lt!661407 lt!661405 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661407 lt!661405 mask!2512)))))

(declare-fun b!1527370 () Bool)

(assert (=> b!1527370 (= e!851297 e!851296)))

(declare-fun res!1045404 () Bool)

(assert (=> b!1527370 (=> (not res!1045404) (not e!851296))))

(assert (=> b!1527370 (= res!1045404 (= (seekEntryOrOpen!0 (select (arr!48992 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48992 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527371 () Bool)

(assert (=> b!1527371 (= e!851298 e!851295)))

(declare-fun res!1045410 () Bool)

(assert (=> b!1527371 (=> (not res!1045410) (not e!851295))))

(assert (=> b!1527371 (= res!1045410 (= lt!661408 lt!661404))))

(assert (=> b!1527371 (= lt!661404 (Intermediate!13157 false resIndex!21 resX!21))))

(assert (=> b!1527371 (= lt!661408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48992 a!2804) j!70) mask!2512) (select (arr!48992 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527372 () Bool)

(assert (=> b!1527372 (= e!851299 (not true))))

(assert (=> b!1527372 e!851293))

(declare-fun res!1045407 () Bool)

(assert (=> b!1527372 (=> (not res!1045407) (not e!851293))))

(assert (=> b!1527372 (= res!1045407 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51098 0))(
  ( (Unit!51099) )
))
(declare-fun lt!661406 () Unit!51098)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51098)

(assert (=> b!1527372 (= lt!661406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527373 () Bool)

(declare-fun res!1045411 () Bool)

(assert (=> b!1527373 (=> (not res!1045411) (not e!851298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527373 (= res!1045411 (validKeyInArray!0 (select (arr!48992 a!2804) j!70)))))

(declare-fun b!1527374 () Bool)

(declare-fun res!1045401 () Bool)

(assert (=> b!1527374 (=> (not res!1045401) (not e!851293))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101531 (_ BitVec 32)) SeekEntryResult!13157)

(assert (=> b!1527374 (= res!1045401 (= (seekEntry!0 (select (arr!48992 a!2804) j!70) a!2804 mask!2512) (Found!13157 j!70)))))

(declare-fun b!1527375 () Bool)

(declare-fun res!1045403 () Bool)

(assert (=> b!1527375 (=> (not res!1045403) (not e!851298))))

(assert (=> b!1527375 (= res!1045403 (validKeyInArray!0 (select (arr!48992 a!2804) i!961)))))

(declare-fun b!1527376 () Bool)

(declare-fun res!1045402 () Bool)

(assert (=> b!1527376 (=> (not res!1045402) (not e!851298))))

(assert (=> b!1527376 (= res!1045402 (and (= (size!49542 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49542 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49542 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527377 () Bool)

(declare-fun res!1045405 () Bool)

(assert (=> b!1527377 (=> (not res!1045405) (not e!851298))))

(declare-datatypes ((List!35475 0))(
  ( (Nil!35472) (Cons!35471 (h!36904 (_ BitVec 64)) (t!50169 List!35475)) )
))
(declare-fun arrayNoDuplicates!0 (array!101531 (_ BitVec 32) List!35475) Bool)

(assert (=> b!1527377 (= res!1045405 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35472))))

(assert (= (and start!130118 res!1045398) b!1527376))

(assert (= (and b!1527376 res!1045402) b!1527375))

(assert (= (and b!1527375 res!1045403) b!1527373))

(assert (= (and b!1527373 res!1045411) b!1527365))

(assert (= (and b!1527365 res!1045399) b!1527377))

(assert (= (and b!1527377 res!1045405) b!1527364))

(assert (= (and b!1527364 res!1045400) b!1527371))

(assert (= (and b!1527371 res!1045410) b!1527366))

(assert (= (and b!1527366 res!1045406) b!1527368))

(assert (= (and b!1527368 res!1045409) b!1527372))

(assert (= (and b!1527372 res!1045407) b!1527374))

(assert (= (and b!1527374 res!1045401) b!1527367))

(assert (= (and b!1527367 (not res!1045408)) b!1527370))

(assert (= (and b!1527370 res!1045404) b!1527369))

(declare-fun m!1410255 () Bool)

(assert (=> b!1527374 m!1410255))

(assert (=> b!1527374 m!1410255))

(declare-fun m!1410257 () Bool)

(assert (=> b!1527374 m!1410257))

(assert (=> b!1527367 m!1410255))

(declare-fun m!1410259 () Bool)

(assert (=> b!1527367 m!1410259))

(declare-fun m!1410261 () Bool)

(assert (=> b!1527377 m!1410261))

(declare-fun m!1410263 () Bool)

(assert (=> b!1527372 m!1410263))

(declare-fun m!1410265 () Bool)

(assert (=> b!1527372 m!1410265))

(assert (=> b!1527366 m!1410255))

(assert (=> b!1527366 m!1410255))

(declare-fun m!1410267 () Bool)

(assert (=> b!1527366 m!1410267))

(declare-fun m!1410269 () Bool)

(assert (=> start!130118 m!1410269))

(declare-fun m!1410271 () Bool)

(assert (=> start!130118 m!1410271))

(assert (=> b!1527371 m!1410255))

(assert (=> b!1527371 m!1410255))

(declare-fun m!1410273 () Bool)

(assert (=> b!1527371 m!1410273))

(assert (=> b!1527371 m!1410273))

(assert (=> b!1527371 m!1410255))

(declare-fun m!1410275 () Bool)

(assert (=> b!1527371 m!1410275))

(assert (=> b!1527373 m!1410255))

(assert (=> b!1527373 m!1410255))

(declare-fun m!1410277 () Bool)

(assert (=> b!1527373 m!1410277))

(declare-fun m!1410279 () Bool)

(assert (=> b!1527365 m!1410279))

(declare-fun m!1410281 () Bool)

(assert (=> b!1527375 m!1410281))

(assert (=> b!1527375 m!1410281))

(declare-fun m!1410283 () Bool)

(assert (=> b!1527375 m!1410283))

(assert (=> b!1527370 m!1410255))

(assert (=> b!1527370 m!1410255))

(declare-fun m!1410285 () Bool)

(assert (=> b!1527370 m!1410285))

(assert (=> b!1527370 m!1410255))

(declare-fun m!1410287 () Bool)

(assert (=> b!1527370 m!1410287))

(declare-fun m!1410289 () Bool)

(assert (=> b!1527368 m!1410289))

(assert (=> b!1527368 m!1410289))

(declare-fun m!1410291 () Bool)

(assert (=> b!1527368 m!1410291))

(declare-fun m!1410293 () Bool)

(assert (=> b!1527368 m!1410293))

(declare-fun m!1410295 () Bool)

(assert (=> b!1527368 m!1410295))

(declare-fun m!1410297 () Bool)

(assert (=> b!1527369 m!1410297))

(declare-fun m!1410299 () Bool)

(assert (=> b!1527369 m!1410299))

(push 1)

