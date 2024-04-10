; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126238 () Bool)

(assert start!126238)

(declare-fun b!1479419 () Bool)

(declare-fun res!1005341 () Bool)

(declare-fun e!829839 () Bool)

(assert (=> b!1479419 (=> (not res!1005341) (not e!829839))))

(declare-datatypes ((array!99344 0))(
  ( (array!99345 (arr!47951 (Array (_ BitVec 32) (_ BitVec 64))) (size!48501 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99344)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479419 (= res!1005341 (validKeyInArray!0 (select (arr!47951 a!2862) j!93)))))

(declare-fun b!1479420 () Bool)

(declare-fun res!1005337 () Bool)

(assert (=> b!1479420 (=> (not res!1005337) (not e!829839))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479420 (= res!1005337 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48501 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48501 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48501 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479421 () Bool)

(declare-fun res!1005335 () Bool)

(assert (=> b!1479421 (=> (not res!1005335) (not e!829839))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479421 (= res!1005335 (validKeyInArray!0 (select (arr!47951 a!2862) i!1006)))))

(declare-fun e!829841 () Bool)

(declare-fun b!1479422 () Bool)

(assert (=> b!1479422 (= e!829841 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!1005343 () Bool)

(assert (=> start!126238 (=> (not res!1005343) (not e!829839))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126238 (= res!1005343 (validMask!0 mask!2687))))

(assert (=> start!126238 e!829839))

(assert (=> start!126238 true))

(declare-fun array_inv!36979 (array!99344) Bool)

(assert (=> start!126238 (array_inv!36979 a!2862)))

(declare-fun b!1479423 () Bool)

(declare-fun e!829842 () Bool)

(assert (=> b!1479423 (= e!829839 e!829842)))

(declare-fun res!1005326 () Bool)

(assert (=> b!1479423 (=> (not res!1005326) (not e!829842))))

(assert (=> b!1479423 (= res!1005326 (= (select (store (arr!47951 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646022 () array!99344)

(assert (=> b!1479423 (= lt!646022 (array!99345 (store (arr!47951 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48501 a!2862)))))

(declare-fun b!1479424 () Bool)

(declare-fun res!1005332 () Bool)

(declare-fun e!829847 () Bool)

(assert (=> b!1479424 (=> (not res!1005332) (not e!829847))))

(declare-datatypes ((SeekEntryResult!12191 0))(
  ( (MissingZero!12191 (index!51156 (_ BitVec 32))) (Found!12191 (index!51157 (_ BitVec 32))) (Intermediate!12191 (undefined!13003 Bool) (index!51158 (_ BitVec 32)) (x!132742 (_ BitVec 32))) (Undefined!12191) (MissingVacant!12191 (index!51159 (_ BitVec 32))) )
))
(declare-fun lt!646023 () SeekEntryResult!12191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99344 (_ BitVec 32)) SeekEntryResult!12191)

(assert (=> b!1479424 (= res!1005332 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47951 a!2862) j!93) a!2862 mask!2687) lt!646023))))

(declare-fun b!1479425 () Bool)

(declare-fun e!829843 () Bool)

(assert (=> b!1479425 (= e!829847 e!829843)))

(declare-fun res!1005340 () Bool)

(assert (=> b!1479425 (=> (not res!1005340) (not e!829843))))

(declare-fun lt!646019 () SeekEntryResult!12191)

(assert (=> b!1479425 (= res!1005340 (= lt!646019 (Intermediate!12191 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646017 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479425 (= lt!646019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646017 mask!2687) lt!646017 lt!646022 mask!2687))))

(assert (=> b!1479425 (= lt!646017 (select (store (arr!47951 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479426 () Bool)

(declare-fun res!1005327 () Bool)

(assert (=> b!1479426 (=> (not res!1005327) (not e!829843))))

(assert (=> b!1479426 (= res!1005327 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479427 () Bool)

(declare-fun res!1005342 () Bool)

(assert (=> b!1479427 (=> (not res!1005342) (not e!829839))))

(assert (=> b!1479427 (= res!1005342 (and (= (size!48501 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48501 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48501 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479428 () Bool)

(declare-fun e!829838 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99344 (_ BitVec 32)) SeekEntryResult!12191)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99344 (_ BitVec 32)) SeekEntryResult!12191)

(assert (=> b!1479428 (= e!829838 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646017 lt!646022 mask!2687) (seekEntryOrOpen!0 lt!646017 lt!646022 mask!2687)))))

(declare-fun b!1479429 () Bool)

(declare-fun res!1005328 () Bool)

(declare-fun e!829840 () Bool)

(assert (=> b!1479429 (=> res!1005328 e!829840)))

(declare-fun lt!646020 () SeekEntryResult!12191)

(assert (=> b!1479429 (= res!1005328 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47951 a!2862) j!93) a!2862 mask!2687) lt!646020)))))

(declare-fun b!1479430 () Bool)

(assert (=> b!1479430 (= e!829842 e!829847)))

(declare-fun res!1005339 () Bool)

(assert (=> b!1479430 (=> (not res!1005339) (not e!829847))))

(assert (=> b!1479430 (= res!1005339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47951 a!2862) j!93) mask!2687) (select (arr!47951 a!2862) j!93) a!2862 mask!2687) lt!646023))))

(assert (=> b!1479430 (= lt!646023 (Intermediate!12191 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479431 () Bool)

(declare-fun res!1005331 () Bool)

(assert (=> b!1479431 (=> (not res!1005331) (not e!829843))))

(assert (=> b!1479431 (= res!1005331 e!829838)))

(declare-fun c!136566 () Bool)

(assert (=> b!1479431 (= c!136566 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479432 () Bool)

(assert (=> b!1479432 (= e!829838 (= lt!646019 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646017 lt!646022 mask!2687)))))

(declare-fun b!1479433 () Bool)

(assert (=> b!1479433 (= e!829840 true)))

(assert (=> b!1479433 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646017 lt!646022 mask!2687) lt!646020)))

(declare-datatypes ((Unit!49722 0))(
  ( (Unit!49723) )
))
(declare-fun lt!646018 () Unit!49722)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49722)

(assert (=> b!1479433 (= lt!646018 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479434 () Bool)

(declare-fun e!829845 () Bool)

(declare-fun e!829844 () Bool)

(assert (=> b!1479434 (= e!829845 e!829844)))

(declare-fun res!1005333 () Bool)

(assert (=> b!1479434 (=> res!1005333 e!829844)))

(assert (=> b!1479434 (= res!1005333 (or (and (= (select (arr!47951 a!2862) index!646) (select (store (arr!47951 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47951 a!2862) index!646) (select (arr!47951 a!2862) j!93))) (not (= (select (arr!47951 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479435 () Bool)

(declare-fun res!1005338 () Bool)

(assert (=> b!1479435 (=> (not res!1005338) (not e!829839))))

(declare-datatypes ((List!34452 0))(
  ( (Nil!34449) (Cons!34448 (h!35816 (_ BitVec 64)) (t!49146 List!34452)) )
))
(declare-fun arrayNoDuplicates!0 (array!99344 (_ BitVec 32) List!34452) Bool)

(assert (=> b!1479435 (= res!1005338 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34449))))

(declare-fun b!1479436 () Bool)

(assert (=> b!1479436 (= e!829844 e!829841)))

(declare-fun res!1005329 () Bool)

(assert (=> b!1479436 (=> (not res!1005329) (not e!829841))))

(declare-fun lt!646021 () SeekEntryResult!12191)

(assert (=> b!1479436 (= res!1005329 (= lt!646021 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47951 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479437 () Bool)

(declare-fun res!1005330 () Bool)

(assert (=> b!1479437 (=> (not res!1005330) (not e!829839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99344 (_ BitVec 32)) Bool)

(assert (=> b!1479437 (= res!1005330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479438 () Bool)

(assert (=> b!1479438 (= e!829843 (not e!829840))))

(declare-fun res!1005336 () Bool)

(assert (=> b!1479438 (=> res!1005336 e!829840)))

(assert (=> b!1479438 (= res!1005336 (or (and (= (select (arr!47951 a!2862) index!646) (select (store (arr!47951 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47951 a!2862) index!646) (select (arr!47951 a!2862) j!93))) (not (= (select (arr!47951 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47951 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479438 e!829845))

(declare-fun res!1005334 () Bool)

(assert (=> b!1479438 (=> (not res!1005334) (not e!829845))))

(assert (=> b!1479438 (= res!1005334 (and (= lt!646021 lt!646020) (or (= (select (arr!47951 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47951 a!2862) intermediateBeforeIndex!19) (select (arr!47951 a!2862) j!93)))))))

(assert (=> b!1479438 (= lt!646020 (Found!12191 j!93))))

(assert (=> b!1479438 (= lt!646021 (seekEntryOrOpen!0 (select (arr!47951 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479438 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646016 () Unit!49722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49722)

(assert (=> b!1479438 (= lt!646016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126238 res!1005343) b!1479427))

(assert (= (and b!1479427 res!1005342) b!1479421))

(assert (= (and b!1479421 res!1005335) b!1479419))

(assert (= (and b!1479419 res!1005341) b!1479437))

(assert (= (and b!1479437 res!1005330) b!1479435))

(assert (= (and b!1479435 res!1005338) b!1479420))

(assert (= (and b!1479420 res!1005337) b!1479423))

(assert (= (and b!1479423 res!1005326) b!1479430))

(assert (= (and b!1479430 res!1005339) b!1479424))

(assert (= (and b!1479424 res!1005332) b!1479425))

(assert (= (and b!1479425 res!1005340) b!1479431))

(assert (= (and b!1479431 c!136566) b!1479432))

(assert (= (and b!1479431 (not c!136566)) b!1479428))

(assert (= (and b!1479431 res!1005331) b!1479426))

(assert (= (and b!1479426 res!1005327) b!1479438))

(assert (= (and b!1479438 res!1005334) b!1479434))

(assert (= (and b!1479434 (not res!1005333)) b!1479436))

(assert (= (and b!1479436 res!1005329) b!1479422))

(assert (= (and b!1479438 (not res!1005336)) b!1479429))

(assert (= (and b!1479429 (not res!1005328)) b!1479433))

(declare-fun m!1365289 () Bool)

(assert (=> b!1479434 m!1365289))

(declare-fun m!1365291 () Bool)

(assert (=> b!1479434 m!1365291))

(declare-fun m!1365293 () Bool)

(assert (=> b!1479434 m!1365293))

(declare-fun m!1365295 () Bool)

(assert (=> b!1479434 m!1365295))

(declare-fun m!1365297 () Bool)

(assert (=> b!1479438 m!1365297))

(assert (=> b!1479438 m!1365291))

(declare-fun m!1365299 () Bool)

(assert (=> b!1479438 m!1365299))

(assert (=> b!1479438 m!1365293))

(assert (=> b!1479438 m!1365289))

(assert (=> b!1479438 m!1365295))

(declare-fun m!1365301 () Bool)

(assert (=> b!1479438 m!1365301))

(declare-fun m!1365303 () Bool)

(assert (=> b!1479438 m!1365303))

(assert (=> b!1479438 m!1365295))

(declare-fun m!1365305 () Bool)

(assert (=> b!1479428 m!1365305))

(declare-fun m!1365307 () Bool)

(assert (=> b!1479428 m!1365307))

(declare-fun m!1365309 () Bool)

(assert (=> start!126238 m!1365309))

(declare-fun m!1365311 () Bool)

(assert (=> start!126238 m!1365311))

(declare-fun m!1365313 () Bool)

(assert (=> b!1479437 m!1365313))

(assert (=> b!1479433 m!1365305))

(declare-fun m!1365315 () Bool)

(assert (=> b!1479433 m!1365315))

(assert (=> b!1479436 m!1365295))

(assert (=> b!1479436 m!1365295))

(declare-fun m!1365317 () Bool)

(assert (=> b!1479436 m!1365317))

(assert (=> b!1479423 m!1365291))

(declare-fun m!1365319 () Bool)

(assert (=> b!1479423 m!1365319))

(assert (=> b!1479419 m!1365295))

(assert (=> b!1479419 m!1365295))

(declare-fun m!1365321 () Bool)

(assert (=> b!1479419 m!1365321))

(declare-fun m!1365323 () Bool)

(assert (=> b!1479425 m!1365323))

(assert (=> b!1479425 m!1365323))

(declare-fun m!1365325 () Bool)

(assert (=> b!1479425 m!1365325))

(assert (=> b!1479425 m!1365291))

(declare-fun m!1365327 () Bool)

(assert (=> b!1479425 m!1365327))

(declare-fun m!1365329 () Bool)

(assert (=> b!1479421 m!1365329))

(assert (=> b!1479421 m!1365329))

(declare-fun m!1365331 () Bool)

(assert (=> b!1479421 m!1365331))

(assert (=> b!1479424 m!1365295))

(assert (=> b!1479424 m!1365295))

(declare-fun m!1365333 () Bool)

(assert (=> b!1479424 m!1365333))

(assert (=> b!1479429 m!1365295))

(assert (=> b!1479429 m!1365295))

(declare-fun m!1365335 () Bool)

(assert (=> b!1479429 m!1365335))

(declare-fun m!1365337 () Bool)

(assert (=> b!1479432 m!1365337))

(declare-fun m!1365339 () Bool)

(assert (=> b!1479435 m!1365339))

(assert (=> b!1479430 m!1365295))

(assert (=> b!1479430 m!1365295))

(declare-fun m!1365341 () Bool)

(assert (=> b!1479430 m!1365341))

(assert (=> b!1479430 m!1365341))

(assert (=> b!1479430 m!1365295))

(declare-fun m!1365343 () Bool)

(assert (=> b!1479430 m!1365343))

(push 1)

