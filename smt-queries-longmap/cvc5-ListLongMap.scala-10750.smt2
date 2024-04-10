; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125758 () Bool)

(assert start!125758)

(declare-fun res!999277 () Bool)

(declare-fun e!825965 () Bool)

(assert (=> start!125758 (=> (not res!999277) (not e!825965))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125758 (= res!999277 (validMask!0 mask!2687))))

(assert (=> start!125758 e!825965))

(assert (=> start!125758 true))

(declare-datatypes ((array!99092 0))(
  ( (array!99093 (arr!47831 (Array (_ BitVec 32) (_ BitVec 64))) (size!48381 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99092)

(declare-fun array_inv!36859 (array!99092) Bool)

(assert (=> start!125758 (array_inv!36859 a!2862)))

(declare-fun lt!643299 () array!99092)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!825967 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643297 () (_ BitVec 64))

(declare-fun b!1471499 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12071 0))(
  ( (MissingZero!12071 (index!50676 (_ BitVec 32))) (Found!12071 (index!50677 (_ BitVec 32))) (Intermediate!12071 (undefined!12883 Bool) (index!50678 (_ BitVec 32)) (x!132266 (_ BitVec 32))) (Undefined!12071) (MissingVacant!12071 (index!50679 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99092 (_ BitVec 32)) SeekEntryResult!12071)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99092 (_ BitVec 32)) SeekEntryResult!12071)

(assert (=> b!1471499 (= e!825967 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643297 lt!643299 mask!2687) (seekEntryOrOpen!0 lt!643297 lt!643299 mask!2687)))))

(declare-fun b!1471500 () Bool)

(declare-fun e!825962 () Bool)

(declare-fun e!825968 () Bool)

(assert (=> b!1471500 (= e!825962 e!825968)))

(declare-fun res!999286 () Bool)

(assert (=> b!1471500 (=> (not res!999286) (not e!825968))))

(declare-fun lt!643295 () SeekEntryResult!12071)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99092 (_ BitVec 32)) SeekEntryResult!12071)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471500 (= res!999286 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47831 a!2862) j!93) mask!2687) (select (arr!47831 a!2862) j!93) a!2862 mask!2687) lt!643295))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471500 (= lt!643295 (Intermediate!12071 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!643298 () SeekEntryResult!12071)

(declare-fun b!1471501 () Bool)

(assert (=> b!1471501 (= e!825967 (= lt!643298 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643297 lt!643299 mask!2687)))))

(declare-fun b!1471502 () Bool)

(declare-fun res!999275 () Bool)

(declare-fun e!825966 () Bool)

(assert (=> b!1471502 (=> (not res!999275) (not e!825966))))

(assert (=> b!1471502 (= res!999275 e!825967)))

(declare-fun c!135627 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471502 (= c!135627 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471503 () Bool)

(declare-fun res!999272 () Bool)

(assert (=> b!1471503 (=> (not res!999272) (not e!825965))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471503 (= res!999272 (validKeyInArray!0 (select (arr!47831 a!2862) i!1006)))))

(declare-fun b!1471504 () Bool)

(assert (=> b!1471504 (= e!825965 e!825962)))

(declare-fun res!999281 () Bool)

(assert (=> b!1471504 (=> (not res!999281) (not e!825962))))

(assert (=> b!1471504 (= res!999281 (= (select (store (arr!47831 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471504 (= lt!643299 (array!99093 (store (arr!47831 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48381 a!2862)))))

(declare-fun b!1471505 () Bool)

(assert (=> b!1471505 (= e!825968 e!825966)))

(declare-fun res!999276 () Bool)

(assert (=> b!1471505 (=> (not res!999276) (not e!825966))))

(assert (=> b!1471505 (= res!999276 (= lt!643298 (Intermediate!12071 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471505 (= lt!643298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643297 mask!2687) lt!643297 lt!643299 mask!2687))))

(assert (=> b!1471505 (= lt!643297 (select (store (arr!47831 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471506 () Bool)

(declare-fun res!999283 () Bool)

(assert (=> b!1471506 (=> (not res!999283) (not e!825965))))

(assert (=> b!1471506 (= res!999283 (and (= (size!48381 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48381 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48381 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!825964 () Bool)

(declare-fun b!1471507 () Bool)

(assert (=> b!1471507 (= e!825964 (or (= (select (arr!47831 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47831 a!2862) intermediateBeforeIndex!19) (select (arr!47831 a!2862) j!93))))))

(declare-fun b!1471508 () Bool)

(declare-fun res!999284 () Bool)

(assert (=> b!1471508 (=> (not res!999284) (not e!825965))))

(assert (=> b!1471508 (= res!999284 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48381 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48381 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48381 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471509 () Bool)

(declare-fun res!999274 () Bool)

(assert (=> b!1471509 (=> (not res!999274) (not e!825965))))

(declare-datatypes ((List!34332 0))(
  ( (Nil!34329) (Cons!34328 (h!35684 (_ BitVec 64)) (t!49026 List!34332)) )
))
(declare-fun arrayNoDuplicates!0 (array!99092 (_ BitVec 32) List!34332) Bool)

(assert (=> b!1471509 (= res!999274 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34329))))

(declare-fun b!1471510 () Bool)

(declare-fun res!999273 () Bool)

(assert (=> b!1471510 (=> (not res!999273) (not e!825965))))

(assert (=> b!1471510 (= res!999273 (validKeyInArray!0 (select (arr!47831 a!2862) j!93)))))

(declare-fun b!1471511 () Bool)

(assert (=> b!1471511 (= e!825966 (not true))))

(assert (=> b!1471511 e!825964))

(declare-fun res!999280 () Bool)

(assert (=> b!1471511 (=> (not res!999280) (not e!825964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99092 (_ BitVec 32)) Bool)

(assert (=> b!1471511 (= res!999280 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49482 0))(
  ( (Unit!49483) )
))
(declare-fun lt!643296 () Unit!49482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49482)

(assert (=> b!1471511 (= lt!643296 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471512 () Bool)

(declare-fun res!999279 () Bool)

(assert (=> b!1471512 (=> (not res!999279) (not e!825966))))

(assert (=> b!1471512 (= res!999279 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471513 () Bool)

(declare-fun res!999282 () Bool)

(assert (=> b!1471513 (=> (not res!999282) (not e!825965))))

(assert (=> b!1471513 (= res!999282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471514 () Bool)

(declare-fun res!999285 () Bool)

(assert (=> b!1471514 (=> (not res!999285) (not e!825964))))

(assert (=> b!1471514 (= res!999285 (= (seekEntryOrOpen!0 (select (arr!47831 a!2862) j!93) a!2862 mask!2687) (Found!12071 j!93)))))

(declare-fun b!1471515 () Bool)

(declare-fun res!999278 () Bool)

(assert (=> b!1471515 (=> (not res!999278) (not e!825968))))

(assert (=> b!1471515 (= res!999278 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47831 a!2862) j!93) a!2862 mask!2687) lt!643295))))

(assert (= (and start!125758 res!999277) b!1471506))

(assert (= (and b!1471506 res!999283) b!1471503))

(assert (= (and b!1471503 res!999272) b!1471510))

(assert (= (and b!1471510 res!999273) b!1471513))

(assert (= (and b!1471513 res!999282) b!1471509))

(assert (= (and b!1471509 res!999274) b!1471508))

(assert (= (and b!1471508 res!999284) b!1471504))

(assert (= (and b!1471504 res!999281) b!1471500))

(assert (= (and b!1471500 res!999286) b!1471515))

(assert (= (and b!1471515 res!999278) b!1471505))

(assert (= (and b!1471505 res!999276) b!1471502))

(assert (= (and b!1471502 c!135627) b!1471501))

(assert (= (and b!1471502 (not c!135627)) b!1471499))

(assert (= (and b!1471502 res!999275) b!1471512))

(assert (= (and b!1471512 res!999279) b!1471511))

(assert (= (and b!1471511 res!999280) b!1471514))

(assert (= (and b!1471514 res!999285) b!1471507))

(declare-fun m!1358305 () Bool)

(assert (=> b!1471505 m!1358305))

(assert (=> b!1471505 m!1358305))

(declare-fun m!1358307 () Bool)

(assert (=> b!1471505 m!1358307))

(declare-fun m!1358309 () Bool)

(assert (=> b!1471505 m!1358309))

(declare-fun m!1358311 () Bool)

(assert (=> b!1471505 m!1358311))

(declare-fun m!1358313 () Bool)

(assert (=> b!1471503 m!1358313))

(assert (=> b!1471503 m!1358313))

(declare-fun m!1358315 () Bool)

(assert (=> b!1471503 m!1358315))

(declare-fun m!1358317 () Bool)

(assert (=> b!1471515 m!1358317))

(assert (=> b!1471515 m!1358317))

(declare-fun m!1358319 () Bool)

(assert (=> b!1471515 m!1358319))

(declare-fun m!1358321 () Bool)

(assert (=> b!1471511 m!1358321))

(declare-fun m!1358323 () Bool)

(assert (=> b!1471511 m!1358323))

(declare-fun m!1358325 () Bool)

(assert (=> b!1471507 m!1358325))

(assert (=> b!1471507 m!1358317))

(declare-fun m!1358327 () Bool)

(assert (=> b!1471501 m!1358327))

(declare-fun m!1358329 () Bool)

(assert (=> b!1471499 m!1358329))

(declare-fun m!1358331 () Bool)

(assert (=> b!1471499 m!1358331))

(assert (=> b!1471504 m!1358309))

(declare-fun m!1358333 () Bool)

(assert (=> b!1471504 m!1358333))

(declare-fun m!1358335 () Bool)

(assert (=> b!1471509 m!1358335))

(assert (=> b!1471510 m!1358317))

(assert (=> b!1471510 m!1358317))

(declare-fun m!1358337 () Bool)

(assert (=> b!1471510 m!1358337))

(declare-fun m!1358339 () Bool)

(assert (=> start!125758 m!1358339))

(declare-fun m!1358341 () Bool)

(assert (=> start!125758 m!1358341))

(assert (=> b!1471514 m!1358317))

(assert (=> b!1471514 m!1358317))

(declare-fun m!1358343 () Bool)

(assert (=> b!1471514 m!1358343))

(assert (=> b!1471500 m!1358317))

(assert (=> b!1471500 m!1358317))

(declare-fun m!1358345 () Bool)

(assert (=> b!1471500 m!1358345))

(assert (=> b!1471500 m!1358345))

(assert (=> b!1471500 m!1358317))

(declare-fun m!1358347 () Bool)

(assert (=> b!1471500 m!1358347))

(declare-fun m!1358349 () Bool)

(assert (=> b!1471513 m!1358349))

(push 1)

