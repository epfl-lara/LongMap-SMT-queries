; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126494 () Bool)

(assert start!126494)

(declare-fun b!1483351 () Bool)

(declare-fun res!1008240 () Bool)

(declare-fun e!831765 () Bool)

(assert (=> b!1483351 (=> (not res!1008240) (not e!831765))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99456 0))(
  ( (array!99457 (arr!48004 (Array (_ BitVec 32) (_ BitVec 64))) (size!48554 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99456)

(assert (=> b!1483351 (= res!1008240 (and (= (size!48554 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48554 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48554 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483352 () Bool)

(declare-fun e!831766 () Bool)

(declare-fun e!831761 () Bool)

(assert (=> b!1483352 (= e!831766 (not e!831761))))

(declare-fun res!1008239 () Bool)

(assert (=> b!1483352 (=> res!1008239 e!831761)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1483352 (= res!1008239 (or (and (= (select (arr!48004 a!2862) index!646) (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48004 a!2862) index!646) (select (arr!48004 a!2862) j!93))) (= (select (arr!48004 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!831763 () Bool)

(assert (=> b!1483352 e!831763))

(declare-fun res!1008236 () Bool)

(assert (=> b!1483352 (=> (not res!1008236) (not e!831763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99456 (_ BitVec 32)) Bool)

(assert (=> b!1483352 (= res!1008236 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49828 0))(
  ( (Unit!49829) )
))
(declare-fun lt!647399 () Unit!49828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49828)

(assert (=> b!1483352 (= lt!647399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1008235 () Bool)

(assert (=> start!126494 (=> (not res!1008235) (not e!831765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126494 (= res!1008235 (validMask!0 mask!2687))))

(assert (=> start!126494 e!831765))

(assert (=> start!126494 true))

(declare-fun array_inv!37032 (array!99456) Bool)

(assert (=> start!126494 (array_inv!37032 a!2862)))

(declare-fun b!1483353 () Bool)

(declare-fun res!1008246 () Bool)

(assert (=> b!1483353 (=> (not res!1008246) (not e!831763))))

(declare-datatypes ((SeekEntryResult!12244 0))(
  ( (MissingZero!12244 (index!51368 (_ BitVec 32))) (Found!12244 (index!51369 (_ BitVec 32))) (Intermediate!12244 (undefined!13056 Bool) (index!51370 (_ BitVec 32)) (x!132952 (_ BitVec 32))) (Undefined!12244) (MissingVacant!12244 (index!51371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99456 (_ BitVec 32)) SeekEntryResult!12244)

(assert (=> b!1483353 (= res!1008246 (= (seekEntryOrOpen!0 (select (arr!48004 a!2862) j!93) a!2862 mask!2687) (Found!12244 j!93)))))

(declare-fun b!1483354 () Bool)

(declare-fun e!831764 () Bool)

(declare-fun e!831758 () Bool)

(assert (=> b!1483354 (= e!831764 e!831758)))

(declare-fun res!1008248 () Bool)

(assert (=> b!1483354 (=> (not res!1008248) (not e!831758))))

(declare-fun lt!647397 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483354 (= res!1008248 (and (= index!646 intermediateAfterIndex!19) (= lt!647397 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483355 () Bool)

(declare-fun e!831760 () Bool)

(assert (=> b!1483355 (= e!831765 e!831760)))

(declare-fun res!1008247 () Bool)

(assert (=> b!1483355 (=> (not res!1008247) (not e!831760))))

(assert (=> b!1483355 (= res!1008247 (= (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647398 () array!99456)

(assert (=> b!1483355 (= lt!647398 (array!99457 (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48554 a!2862)))))

(declare-fun b!1483356 () Bool)

(declare-fun res!1008234 () Bool)

(assert (=> b!1483356 (=> (not res!1008234) (not e!831765))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483356 (= res!1008234 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48554 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48554 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48554 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483357 () Bool)

(declare-fun res!1008250 () Bool)

(assert (=> b!1483357 (=> (not res!1008250) (not e!831766))))

(declare-fun e!831762 () Bool)

(assert (=> b!1483357 (= res!1008250 e!831762)))

(declare-fun c!137082 () Bool)

(assert (=> b!1483357 (= c!137082 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483358 () Bool)

(assert (=> b!1483358 (= e!831763 e!831764)))

(declare-fun res!1008244 () Bool)

(assert (=> b!1483358 (=> res!1008244 e!831764)))

(assert (=> b!1483358 (= res!1008244 (or (and (= (select (arr!48004 a!2862) index!646) lt!647397) (= (select (arr!48004 a!2862) index!646) (select (arr!48004 a!2862) j!93))) (= (select (arr!48004 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483358 (= lt!647397 (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483359 () Bool)

(assert (=> b!1483359 (= e!831761 true)))

(declare-fun lt!647400 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483359 (= lt!647400 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483360 () Bool)

(declare-fun res!1008245 () Bool)

(assert (=> b!1483360 (=> (not res!1008245) (not e!831765))))

(declare-datatypes ((List!34505 0))(
  ( (Nil!34502) (Cons!34501 (h!35875 (_ BitVec 64)) (t!49199 List!34505)) )
))
(declare-fun arrayNoDuplicates!0 (array!99456 (_ BitVec 32) List!34505) Bool)

(assert (=> b!1483360 (= res!1008245 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34502))))

(declare-fun b!1483361 () Bool)

(declare-fun res!1008238 () Bool)

(assert (=> b!1483361 (=> (not res!1008238) (not e!831765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483361 (= res!1008238 (validKeyInArray!0 (select (arr!48004 a!2862) j!93)))))

(declare-fun b!1483362 () Bool)

(declare-fun e!831767 () Bool)

(assert (=> b!1483362 (= e!831760 e!831767)))

(declare-fun res!1008233 () Bool)

(assert (=> b!1483362 (=> (not res!1008233) (not e!831767))))

(declare-fun lt!647402 () SeekEntryResult!12244)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99456 (_ BitVec 32)) SeekEntryResult!12244)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483362 (= res!1008233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48004 a!2862) j!93) mask!2687) (select (arr!48004 a!2862) j!93) a!2862 mask!2687) lt!647402))))

(assert (=> b!1483362 (= lt!647402 (Intermediate!12244 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483363 () Bool)

(declare-fun lt!647401 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99456 (_ BitVec 32)) SeekEntryResult!12244)

(assert (=> b!1483363 (= e!831758 (= (seekEntryOrOpen!0 lt!647401 lt!647398 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647401 lt!647398 mask!2687)))))

(declare-fun b!1483364 () Bool)

(assert (=> b!1483364 (= e!831767 e!831766)))

(declare-fun res!1008237 () Bool)

(assert (=> b!1483364 (=> (not res!1008237) (not e!831766))))

(declare-fun lt!647403 () SeekEntryResult!12244)

(assert (=> b!1483364 (= res!1008237 (= lt!647403 (Intermediate!12244 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483364 (= lt!647403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647401 mask!2687) lt!647401 lt!647398 mask!2687))))

(assert (=> b!1483364 (= lt!647401 (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483365 () Bool)

(assert (=> b!1483365 (= e!831762 (= lt!647403 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647401 lt!647398 mask!2687)))))

(declare-fun b!1483366 () Bool)

(declare-fun res!1008243 () Bool)

(assert (=> b!1483366 (=> (not res!1008243) (not e!831767))))

(assert (=> b!1483366 (= res!1008243 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48004 a!2862) j!93) a!2862 mask!2687) lt!647402))))

(declare-fun b!1483367 () Bool)

(assert (=> b!1483367 (= e!831762 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647401 lt!647398 mask!2687) (seekEntryOrOpen!0 lt!647401 lt!647398 mask!2687)))))

(declare-fun b!1483368 () Bool)

(declare-fun res!1008241 () Bool)

(assert (=> b!1483368 (=> (not res!1008241) (not e!831765))))

(assert (=> b!1483368 (= res!1008241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483369 () Bool)

(declare-fun res!1008242 () Bool)

(assert (=> b!1483369 (=> (not res!1008242) (not e!831763))))

(assert (=> b!1483369 (= res!1008242 (or (= (select (arr!48004 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48004 a!2862) intermediateBeforeIndex!19) (select (arr!48004 a!2862) j!93))))))

(declare-fun b!1483370 () Bool)

(declare-fun res!1008232 () Bool)

(assert (=> b!1483370 (=> (not res!1008232) (not e!831765))))

(assert (=> b!1483370 (= res!1008232 (validKeyInArray!0 (select (arr!48004 a!2862) i!1006)))))

(declare-fun b!1483371 () Bool)

(declare-fun res!1008249 () Bool)

(assert (=> b!1483371 (=> (not res!1008249) (not e!831766))))

(assert (=> b!1483371 (= res!1008249 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126494 res!1008235) b!1483351))

(assert (= (and b!1483351 res!1008240) b!1483370))

(assert (= (and b!1483370 res!1008232) b!1483361))

(assert (= (and b!1483361 res!1008238) b!1483368))

(assert (= (and b!1483368 res!1008241) b!1483360))

(assert (= (and b!1483360 res!1008245) b!1483356))

(assert (= (and b!1483356 res!1008234) b!1483355))

(assert (= (and b!1483355 res!1008247) b!1483362))

(assert (= (and b!1483362 res!1008233) b!1483366))

(assert (= (and b!1483366 res!1008243) b!1483364))

(assert (= (and b!1483364 res!1008237) b!1483357))

(assert (= (and b!1483357 c!137082) b!1483365))

(assert (= (and b!1483357 (not c!137082)) b!1483367))

(assert (= (and b!1483357 res!1008250) b!1483371))

(assert (= (and b!1483371 res!1008249) b!1483352))

(assert (= (and b!1483352 res!1008236) b!1483353))

(assert (= (and b!1483353 res!1008246) b!1483369))

(assert (= (and b!1483369 res!1008242) b!1483358))

(assert (= (and b!1483358 (not res!1008244)) b!1483354))

(assert (= (and b!1483354 res!1008248) b!1483363))

(assert (= (and b!1483352 (not res!1008239)) b!1483359))

(declare-fun m!1368849 () Bool)

(assert (=> b!1483360 m!1368849))

(declare-fun m!1368851 () Bool)

(assert (=> b!1483370 m!1368851))

(assert (=> b!1483370 m!1368851))

(declare-fun m!1368853 () Bool)

(assert (=> b!1483370 m!1368853))

(declare-fun m!1368855 () Bool)

(assert (=> b!1483353 m!1368855))

(assert (=> b!1483353 m!1368855))

(declare-fun m!1368857 () Bool)

(assert (=> b!1483353 m!1368857))

(declare-fun m!1368859 () Bool)

(assert (=> b!1483364 m!1368859))

(assert (=> b!1483364 m!1368859))

(declare-fun m!1368861 () Bool)

(assert (=> b!1483364 m!1368861))

(declare-fun m!1368863 () Bool)

(assert (=> b!1483364 m!1368863))

(declare-fun m!1368865 () Bool)

(assert (=> b!1483364 m!1368865))

(declare-fun m!1368867 () Bool)

(assert (=> b!1483365 m!1368867))

(assert (=> b!1483366 m!1368855))

(assert (=> b!1483366 m!1368855))

(declare-fun m!1368869 () Bool)

(assert (=> b!1483366 m!1368869))

(declare-fun m!1368871 () Bool)

(assert (=> start!126494 m!1368871))

(declare-fun m!1368873 () Bool)

(assert (=> start!126494 m!1368873))

(assert (=> b!1483355 m!1368863))

(declare-fun m!1368875 () Bool)

(assert (=> b!1483355 m!1368875))

(declare-fun m!1368877 () Bool)

(assert (=> b!1483358 m!1368877))

(assert (=> b!1483358 m!1368855))

(assert (=> b!1483358 m!1368863))

(declare-fun m!1368879 () Bool)

(assert (=> b!1483358 m!1368879))

(declare-fun m!1368881 () Bool)

(assert (=> b!1483352 m!1368881))

(assert (=> b!1483352 m!1368863))

(assert (=> b!1483352 m!1368879))

(assert (=> b!1483352 m!1368877))

(declare-fun m!1368883 () Bool)

(assert (=> b!1483352 m!1368883))

(assert (=> b!1483352 m!1368855))

(declare-fun m!1368885 () Bool)

(assert (=> b!1483369 m!1368885))

(assert (=> b!1483369 m!1368855))

(declare-fun m!1368887 () Bool)

(assert (=> b!1483368 m!1368887))

(declare-fun m!1368889 () Bool)

(assert (=> b!1483367 m!1368889))

(declare-fun m!1368891 () Bool)

(assert (=> b!1483367 m!1368891))

(assert (=> b!1483361 m!1368855))

(assert (=> b!1483361 m!1368855))

(declare-fun m!1368893 () Bool)

(assert (=> b!1483361 m!1368893))

(assert (=> b!1483363 m!1368891))

(assert (=> b!1483363 m!1368889))

(declare-fun m!1368895 () Bool)

(assert (=> b!1483359 m!1368895))

(assert (=> b!1483362 m!1368855))

(assert (=> b!1483362 m!1368855))

(declare-fun m!1368897 () Bool)

(assert (=> b!1483362 m!1368897))

(assert (=> b!1483362 m!1368897))

(assert (=> b!1483362 m!1368855))

(declare-fun m!1368899 () Bool)

(assert (=> b!1483362 m!1368899))

(push 1)

