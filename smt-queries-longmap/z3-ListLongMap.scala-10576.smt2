; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124564 () Bool)

(assert start!124564)

(declare-fun b!1442345 () Bool)

(declare-fun e!812906 () Bool)

(assert (=> b!1442345 (= e!812906 (not true))))

(declare-fun e!812910 () Bool)

(assert (=> b!1442345 e!812910))

(declare-fun res!974679 () Bool)

(assert (=> b!1442345 (=> (not res!974679) (not e!812910))))

(declare-datatypes ((array!97990 0))(
  ( (array!97991 (arr!47284 (Array (_ BitVec 32) (_ BitVec 64))) (size!47836 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97990)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97990 (_ BitVec 32)) Bool)

(assert (=> b!1442345 (= res!974679 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48459 0))(
  ( (Unit!48460) )
))
(declare-fun lt!633358 () Unit!48459)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48459)

(assert (=> b!1442345 (= lt!633358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442346 () Bool)

(declare-fun res!974669 () Bool)

(declare-fun e!812905 () Bool)

(assert (=> b!1442346 (=> (not res!974669) (not e!812905))))

(assert (=> b!1442346 (= res!974669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442347 () Bool)

(declare-fun res!974674 () Bool)

(assert (=> b!1442347 (=> (not res!974674) (not e!812905))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442347 (= res!974674 (and (= (size!47836 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47836 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47836 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442348 () Bool)

(declare-fun res!974672 () Bool)

(assert (=> b!1442348 (=> (not res!974672) (not e!812905))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442348 (= res!974672 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47836 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47836 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47836 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442349 () Bool)

(declare-fun res!974671 () Bool)

(assert (=> b!1442349 (=> (not res!974671) (not e!812905))))

(declare-datatypes ((List!33863 0))(
  ( (Nil!33860) (Cons!33859 (h!35209 (_ BitVec 64)) (t!48549 List!33863)) )
))
(declare-fun arrayNoDuplicates!0 (array!97990 (_ BitVec 32) List!33863) Bool)

(assert (=> b!1442349 (= res!974671 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33860))))

(declare-fun b!1442350 () Bool)

(declare-fun res!974680 () Bool)

(declare-fun e!812909 () Bool)

(assert (=> b!1442350 (=> (not res!974680) (not e!812909))))

(declare-datatypes ((SeekEntryResult!11561 0))(
  ( (MissingZero!11561 (index!48636 (_ BitVec 32))) (Found!11561 (index!48637 (_ BitVec 32))) (Intermediate!11561 (undefined!12373 Bool) (index!48638 (_ BitVec 32)) (x!130341 (_ BitVec 32))) (Undefined!11561) (MissingVacant!11561 (index!48639 (_ BitVec 32))) )
))
(declare-fun lt!633356 () SeekEntryResult!11561)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97990 (_ BitVec 32)) SeekEntryResult!11561)

(assert (=> b!1442350 (= res!974680 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47284 a!2862) j!93) a!2862 mask!2687) lt!633356))))

(declare-fun res!974673 () Bool)

(assert (=> start!124564 (=> (not res!974673) (not e!812905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124564 (= res!974673 (validMask!0 mask!2687))))

(assert (=> start!124564 e!812905))

(assert (=> start!124564 true))

(declare-fun array_inv!36517 (array!97990) Bool)

(assert (=> start!124564 (array_inv!36517 a!2862)))

(declare-fun b!1442351 () Bool)

(declare-fun res!974681 () Bool)

(assert (=> b!1442351 (=> (not res!974681) (not e!812905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442351 (= res!974681 (validKeyInArray!0 (select (arr!47284 a!2862) j!93)))))

(declare-fun e!812908 () Bool)

(declare-fun lt!633359 () (_ BitVec 64))

(declare-fun b!1442352 () Bool)

(declare-fun lt!633357 () SeekEntryResult!11561)

(declare-fun lt!633360 () array!97990)

(assert (=> b!1442352 (= e!812908 (= lt!633357 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633359 lt!633360 mask!2687)))))

(declare-fun b!1442353 () Bool)

(assert (=> b!1442353 (= e!812909 e!812906)))

(declare-fun res!974676 () Bool)

(assert (=> b!1442353 (=> (not res!974676) (not e!812906))))

(assert (=> b!1442353 (= res!974676 (= lt!633357 (Intermediate!11561 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442353 (= lt!633357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633359 mask!2687) lt!633359 lt!633360 mask!2687))))

(assert (=> b!1442353 (= lt!633359 (select (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442354 () Bool)

(assert (=> b!1442354 (= e!812910 (or (= (select (arr!47284 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47284 a!2862) intermediateBeforeIndex!19) (select (arr!47284 a!2862) j!93))))))

(declare-fun b!1442355 () Bool)

(declare-fun e!812904 () Bool)

(assert (=> b!1442355 (= e!812905 e!812904)))

(declare-fun res!974682 () Bool)

(assert (=> b!1442355 (=> (not res!974682) (not e!812904))))

(assert (=> b!1442355 (= res!974682 (= (select (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442355 (= lt!633360 (array!97991 (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47836 a!2862)))))

(declare-fun b!1442356 () Bool)

(assert (=> b!1442356 (= e!812904 e!812909)))

(declare-fun res!974683 () Bool)

(assert (=> b!1442356 (=> (not res!974683) (not e!812909))))

(assert (=> b!1442356 (= res!974683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47284 a!2862) j!93) mask!2687) (select (arr!47284 a!2862) j!93) a!2862 mask!2687) lt!633356))))

(assert (=> b!1442356 (= lt!633356 (Intermediate!11561 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442357 () Bool)

(declare-fun res!974670 () Bool)

(assert (=> b!1442357 (=> (not res!974670) (not e!812910))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97990 (_ BitVec 32)) SeekEntryResult!11561)

(assert (=> b!1442357 (= res!974670 (= (seekEntryOrOpen!0 (select (arr!47284 a!2862) j!93) a!2862 mask!2687) (Found!11561 j!93)))))

(declare-fun b!1442358 () Bool)

(declare-fun res!974678 () Bool)

(assert (=> b!1442358 (=> (not res!974678) (not e!812905))))

(assert (=> b!1442358 (= res!974678 (validKeyInArray!0 (select (arr!47284 a!2862) i!1006)))))

(declare-fun b!1442359 () Bool)

(declare-fun res!974677 () Bool)

(assert (=> b!1442359 (=> (not res!974677) (not e!812906))))

(assert (=> b!1442359 (= res!974677 e!812908)))

(declare-fun c!133351 () Bool)

(assert (=> b!1442359 (= c!133351 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442360 () Bool)

(declare-fun res!974675 () Bool)

(assert (=> b!1442360 (=> (not res!974675) (not e!812906))))

(assert (=> b!1442360 (= res!974675 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442361 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97990 (_ BitVec 32)) SeekEntryResult!11561)

(assert (=> b!1442361 (= e!812908 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633359 lt!633360 mask!2687) (seekEntryOrOpen!0 lt!633359 lt!633360 mask!2687)))))

(assert (= (and start!124564 res!974673) b!1442347))

(assert (= (and b!1442347 res!974674) b!1442358))

(assert (= (and b!1442358 res!974678) b!1442351))

(assert (= (and b!1442351 res!974681) b!1442346))

(assert (= (and b!1442346 res!974669) b!1442349))

(assert (= (and b!1442349 res!974671) b!1442348))

(assert (= (and b!1442348 res!974672) b!1442355))

(assert (= (and b!1442355 res!974682) b!1442356))

(assert (= (and b!1442356 res!974683) b!1442350))

(assert (= (and b!1442350 res!974680) b!1442353))

(assert (= (and b!1442353 res!974676) b!1442359))

(assert (= (and b!1442359 c!133351) b!1442352))

(assert (= (and b!1442359 (not c!133351)) b!1442361))

(assert (= (and b!1442359 res!974677) b!1442360))

(assert (= (and b!1442360 res!974675) b!1442345))

(assert (= (and b!1442345 res!974679) b!1442357))

(assert (= (and b!1442357 res!974670) b!1442354))

(declare-fun m!1331007 () Bool)

(assert (=> b!1442345 m!1331007))

(declare-fun m!1331009 () Bool)

(assert (=> b!1442345 m!1331009))

(declare-fun m!1331011 () Bool)

(assert (=> b!1442361 m!1331011))

(declare-fun m!1331013 () Bool)

(assert (=> b!1442361 m!1331013))

(declare-fun m!1331015 () Bool)

(assert (=> b!1442352 m!1331015))

(declare-fun m!1331017 () Bool)

(assert (=> b!1442358 m!1331017))

(assert (=> b!1442358 m!1331017))

(declare-fun m!1331019 () Bool)

(assert (=> b!1442358 m!1331019))

(declare-fun m!1331021 () Bool)

(assert (=> b!1442346 m!1331021))

(declare-fun m!1331023 () Bool)

(assert (=> b!1442350 m!1331023))

(assert (=> b!1442350 m!1331023))

(declare-fun m!1331025 () Bool)

(assert (=> b!1442350 m!1331025))

(declare-fun m!1331027 () Bool)

(assert (=> b!1442355 m!1331027))

(declare-fun m!1331029 () Bool)

(assert (=> b!1442355 m!1331029))

(declare-fun m!1331031 () Bool)

(assert (=> b!1442353 m!1331031))

(assert (=> b!1442353 m!1331031))

(declare-fun m!1331033 () Bool)

(assert (=> b!1442353 m!1331033))

(assert (=> b!1442353 m!1331027))

(declare-fun m!1331035 () Bool)

(assert (=> b!1442353 m!1331035))

(assert (=> b!1442351 m!1331023))

(assert (=> b!1442351 m!1331023))

(declare-fun m!1331037 () Bool)

(assert (=> b!1442351 m!1331037))

(declare-fun m!1331039 () Bool)

(assert (=> b!1442354 m!1331039))

(assert (=> b!1442354 m!1331023))

(declare-fun m!1331041 () Bool)

(assert (=> b!1442349 m!1331041))

(assert (=> b!1442356 m!1331023))

(assert (=> b!1442356 m!1331023))

(declare-fun m!1331043 () Bool)

(assert (=> b!1442356 m!1331043))

(assert (=> b!1442356 m!1331043))

(assert (=> b!1442356 m!1331023))

(declare-fun m!1331045 () Bool)

(assert (=> b!1442356 m!1331045))

(assert (=> b!1442357 m!1331023))

(assert (=> b!1442357 m!1331023))

(declare-fun m!1331047 () Bool)

(assert (=> b!1442357 m!1331047))

(declare-fun m!1331049 () Bool)

(assert (=> start!124564 m!1331049))

(declare-fun m!1331051 () Bool)

(assert (=> start!124564 m!1331051))

(check-sat (not b!1442357) (not b!1442356) (not b!1442352) (not b!1442345) (not b!1442361) (not b!1442349) (not b!1442358) (not b!1442351) (not b!1442353) (not b!1442346) (not b!1442350) (not start!124564))
(check-sat)
