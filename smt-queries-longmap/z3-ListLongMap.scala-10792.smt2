; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126528 () Bool)

(assert start!126528)

(declare-fun res!1006263 () Bool)

(declare-fun e!831084 () Bool)

(assert (=> start!126528 (=> (not res!1006263) (not e!831084))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126528 (= res!1006263 (validMask!0 mask!2687))))

(assert (=> start!126528 e!831084))

(assert (=> start!126528 true))

(declare-datatypes ((array!99472 0))(
  ( (array!99473 (arr!48010 (Array (_ BitVec 32) (_ BitVec 64))) (size!48561 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99472)

(declare-fun array_inv!37291 (array!99472) Bool)

(assert (=> start!126528 (array_inv!37291 a!2862)))

(declare-fun e!831085 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646801 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1481487 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!646800 () array!99472)

(declare-datatypes ((SeekEntryResult!12147 0))(
  ( (MissingZero!12147 (index!50980 (_ BitVec 32))) (Found!12147 (index!50981 (_ BitVec 32))) (Intermediate!12147 (undefined!12959 Bool) (index!50982 (_ BitVec 32)) (x!132747 (_ BitVec 32))) (Undefined!12147) (MissingVacant!12147 (index!50983 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12147)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12147)

(assert (=> b!1481487 (= e!831085 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646801 lt!646800 mask!2687) (seekEntryOrOpen!0 lt!646801 lt!646800 mask!2687)))))

(declare-fun b!1481488 () Bool)

(declare-fun e!831090 () Bool)

(declare-fun e!831088 () Bool)

(assert (=> b!1481488 (= e!831090 e!831088)))

(declare-fun res!1006268 () Bool)

(assert (=> b!1481488 (=> (not res!1006268) (not e!831088))))

(declare-fun lt!646799 () SeekEntryResult!12147)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481488 (= res!1006268 (= lt!646799 (Intermediate!12147 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481488 (= lt!646799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646801 mask!2687) lt!646801 lt!646800 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481488 (= lt!646801 (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481489 () Bool)

(declare-fun res!1006271 () Bool)

(assert (=> b!1481489 (=> (not res!1006271) (not e!831090))))

(declare-fun lt!646802 () SeekEntryResult!12147)

(assert (=> b!1481489 (= res!1006271 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48010 a!2862) j!93) a!2862 mask!2687) lt!646802))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1481490 () Bool)

(declare-fun e!831089 () Bool)

(assert (=> b!1481490 (= e!831089 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1481491 () Bool)

(declare-fun res!1006276 () Bool)

(assert (=> b!1481491 (=> (not res!1006276) (not e!831084))))

(assert (=> b!1481491 (= res!1006276 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48561 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48561 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48561 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481492 () Bool)

(declare-fun res!1006272 () Bool)

(assert (=> b!1481492 (=> (not res!1006272) (not e!831084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481492 (= res!1006272 (validKeyInArray!0 (select (arr!48010 a!2862) j!93)))))

(declare-fun b!1481493 () Bool)

(declare-fun res!1006261 () Bool)

(assert (=> b!1481493 (=> (not res!1006261) (not e!831084))))

(assert (=> b!1481493 (= res!1006261 (validKeyInArray!0 (select (arr!48010 a!2862) i!1006)))))

(declare-fun b!1481494 () Bool)

(declare-fun e!831086 () Bool)

(assert (=> b!1481494 (= e!831088 (not e!831086))))

(declare-fun res!1006266 () Bool)

(assert (=> b!1481494 (=> res!1006266 e!831086)))

(assert (=> b!1481494 (= res!1006266 (or (and (= (select (arr!48010 a!2862) index!646) (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48010 a!2862) index!646) (select (arr!48010 a!2862) j!93))) (not (= (select (arr!48010 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48010 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!831082 () Bool)

(assert (=> b!1481494 e!831082))

(declare-fun res!1006274 () Bool)

(assert (=> b!1481494 (=> (not res!1006274) (not e!831082))))

(declare-fun lt!646803 () SeekEntryResult!12147)

(declare-fun lt!646804 () SeekEntryResult!12147)

(assert (=> b!1481494 (= res!1006274 (and (= lt!646803 lt!646804) (or (= (select (arr!48010 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48010 a!2862) intermediateBeforeIndex!19) (select (arr!48010 a!2862) j!93)))))))

(assert (=> b!1481494 (= lt!646804 (Found!12147 j!93))))

(assert (=> b!1481494 (= lt!646803 (seekEntryOrOpen!0 (select (arr!48010 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99472 (_ BitVec 32)) Bool)

(assert (=> b!1481494 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49667 0))(
  ( (Unit!49668) )
))
(declare-fun lt!646797 () Unit!49667)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49667)

(assert (=> b!1481494 (= lt!646797 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481495 () Bool)

(declare-fun res!1006277 () Bool)

(assert (=> b!1481495 (=> (not res!1006277) (not e!831084))))

(assert (=> b!1481495 (= res!1006277 (and (= (size!48561 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48561 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48561 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481496 () Bool)

(declare-fun e!831083 () Bool)

(assert (=> b!1481496 (= e!831083 e!831090)))

(declare-fun res!1006265 () Bool)

(assert (=> b!1481496 (=> (not res!1006265) (not e!831090))))

(assert (=> b!1481496 (= res!1006265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48010 a!2862) j!93) mask!2687) (select (arr!48010 a!2862) j!93) a!2862 mask!2687) lt!646802))))

(assert (=> b!1481496 (= lt!646802 (Intermediate!12147 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481497 () Bool)

(declare-fun res!1006267 () Bool)

(assert (=> b!1481497 (=> (not res!1006267) (not e!831088))))

(assert (=> b!1481497 (= res!1006267 e!831085)))

(declare-fun c!137143 () Bool)

(assert (=> b!1481497 (= c!137143 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481498 () Bool)

(assert (=> b!1481498 (= e!831086 true)))

(assert (=> b!1481498 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646801 lt!646800 mask!2687) lt!646804)))

(declare-fun lt!646798 () Unit!49667)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49667)

(assert (=> b!1481498 (= lt!646798 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1481499 () Bool)

(assert (=> b!1481499 (= e!831084 e!831083)))

(declare-fun res!1006275 () Bool)

(assert (=> b!1481499 (=> (not res!1006275) (not e!831083))))

(assert (=> b!1481499 (= res!1006275 (= (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481499 (= lt!646800 (array!99473 (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48561 a!2862)))))

(declare-fun b!1481500 () Bool)

(assert (=> b!1481500 (= e!831085 (= lt!646799 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646801 lt!646800 mask!2687)))))

(declare-fun b!1481501 () Bool)

(declare-fun res!1006270 () Bool)

(assert (=> b!1481501 (=> res!1006270 e!831086)))

(assert (=> b!1481501 (= res!1006270 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!48010 a!2862) j!93) a!2862 mask!2687) lt!646804)))))

(declare-fun b!1481502 () Bool)

(declare-fun res!1006269 () Bool)

(assert (=> b!1481502 (=> (not res!1006269) (not e!831084))))

(declare-datatypes ((List!34498 0))(
  ( (Nil!34495) (Cons!34494 (h!35876 (_ BitVec 64)) (t!49184 List!34498)) )
))
(declare-fun arrayNoDuplicates!0 (array!99472 (_ BitVec 32) List!34498) Bool)

(assert (=> b!1481502 (= res!1006269 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34495))))

(declare-fun b!1481503 () Bool)

(declare-fun e!831087 () Bool)

(assert (=> b!1481503 (= e!831082 e!831087)))

(declare-fun res!1006264 () Bool)

(assert (=> b!1481503 (=> res!1006264 e!831087)))

(assert (=> b!1481503 (= res!1006264 (or (and (= (select (arr!48010 a!2862) index!646) (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48010 a!2862) index!646) (select (arr!48010 a!2862) j!93))) (not (= (select (arr!48010 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1481504 () Bool)

(declare-fun res!1006273 () Bool)

(assert (=> b!1481504 (=> (not res!1006273) (not e!831084))))

(assert (=> b!1481504 (= res!1006273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481505 () Bool)

(assert (=> b!1481505 (= e!831087 e!831089)))

(declare-fun res!1006260 () Bool)

(assert (=> b!1481505 (=> (not res!1006260) (not e!831089))))

(assert (=> b!1481505 (= res!1006260 (= lt!646803 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!48010 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1481506 () Bool)

(declare-fun res!1006262 () Bool)

(assert (=> b!1481506 (=> (not res!1006262) (not e!831088))))

(assert (=> b!1481506 (= res!1006262 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126528 res!1006263) b!1481495))

(assert (= (and b!1481495 res!1006277) b!1481493))

(assert (= (and b!1481493 res!1006261) b!1481492))

(assert (= (and b!1481492 res!1006272) b!1481504))

(assert (= (and b!1481504 res!1006273) b!1481502))

(assert (= (and b!1481502 res!1006269) b!1481491))

(assert (= (and b!1481491 res!1006276) b!1481499))

(assert (= (and b!1481499 res!1006275) b!1481496))

(assert (= (and b!1481496 res!1006265) b!1481489))

(assert (= (and b!1481489 res!1006271) b!1481488))

(assert (= (and b!1481488 res!1006268) b!1481497))

(assert (= (and b!1481497 c!137143) b!1481500))

(assert (= (and b!1481497 (not c!137143)) b!1481487))

(assert (= (and b!1481497 res!1006267) b!1481506))

(assert (= (and b!1481506 res!1006262) b!1481494))

(assert (= (and b!1481494 res!1006274) b!1481503))

(assert (= (and b!1481503 (not res!1006264)) b!1481505))

(assert (= (and b!1481505 res!1006260) b!1481490))

(assert (= (and b!1481494 (not res!1006266)) b!1481501))

(assert (= (and b!1481501 (not res!1006270)) b!1481498))

(declare-fun m!1367311 () Bool)

(assert (=> b!1481502 m!1367311))

(declare-fun m!1367313 () Bool)

(assert (=> b!1481492 m!1367313))

(assert (=> b!1481492 m!1367313))

(declare-fun m!1367315 () Bool)

(assert (=> b!1481492 m!1367315))

(declare-fun m!1367317 () Bool)

(assert (=> b!1481498 m!1367317))

(declare-fun m!1367319 () Bool)

(assert (=> b!1481498 m!1367319))

(declare-fun m!1367321 () Bool)

(assert (=> b!1481500 m!1367321))

(assert (=> b!1481501 m!1367313))

(assert (=> b!1481501 m!1367313))

(declare-fun m!1367323 () Bool)

(assert (=> b!1481501 m!1367323))

(assert (=> b!1481487 m!1367317))

(declare-fun m!1367325 () Bool)

(assert (=> b!1481487 m!1367325))

(declare-fun m!1367327 () Bool)

(assert (=> b!1481499 m!1367327))

(declare-fun m!1367329 () Bool)

(assert (=> b!1481499 m!1367329))

(assert (=> b!1481489 m!1367313))

(assert (=> b!1481489 m!1367313))

(declare-fun m!1367331 () Bool)

(assert (=> b!1481489 m!1367331))

(assert (=> b!1481496 m!1367313))

(assert (=> b!1481496 m!1367313))

(declare-fun m!1367333 () Bool)

(assert (=> b!1481496 m!1367333))

(assert (=> b!1481496 m!1367333))

(assert (=> b!1481496 m!1367313))

(declare-fun m!1367335 () Bool)

(assert (=> b!1481496 m!1367335))

(assert (=> b!1481505 m!1367313))

(assert (=> b!1481505 m!1367313))

(declare-fun m!1367337 () Bool)

(assert (=> b!1481505 m!1367337))

(declare-fun m!1367339 () Bool)

(assert (=> b!1481488 m!1367339))

(assert (=> b!1481488 m!1367339))

(declare-fun m!1367341 () Bool)

(assert (=> b!1481488 m!1367341))

(assert (=> b!1481488 m!1367327))

(declare-fun m!1367343 () Bool)

(assert (=> b!1481488 m!1367343))

(declare-fun m!1367345 () Bool)

(assert (=> b!1481503 m!1367345))

(assert (=> b!1481503 m!1367327))

(declare-fun m!1367347 () Bool)

(assert (=> b!1481503 m!1367347))

(assert (=> b!1481503 m!1367313))

(declare-fun m!1367349 () Bool)

(assert (=> start!126528 m!1367349))

(declare-fun m!1367351 () Bool)

(assert (=> start!126528 m!1367351))

(declare-fun m!1367353 () Bool)

(assert (=> b!1481504 m!1367353))

(declare-fun m!1367355 () Bool)

(assert (=> b!1481493 m!1367355))

(assert (=> b!1481493 m!1367355))

(declare-fun m!1367357 () Bool)

(assert (=> b!1481493 m!1367357))

(declare-fun m!1367359 () Bool)

(assert (=> b!1481494 m!1367359))

(assert (=> b!1481494 m!1367327))

(declare-fun m!1367361 () Bool)

(assert (=> b!1481494 m!1367361))

(assert (=> b!1481494 m!1367347))

(assert (=> b!1481494 m!1367345))

(assert (=> b!1481494 m!1367313))

(declare-fun m!1367363 () Bool)

(assert (=> b!1481494 m!1367363))

(declare-fun m!1367365 () Bool)

(assert (=> b!1481494 m!1367365))

(assert (=> b!1481494 m!1367313))

(check-sat (not b!1481496) (not b!1481493) (not b!1481492) (not b!1481489) (not b!1481500) (not b!1481501) (not b!1481505) (not start!126528) (not b!1481487) (not b!1481494) (not b!1481488) (not b!1481502) (not b!1481504) (not b!1481498))
(check-sat)
