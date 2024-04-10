; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125110 () Bool)

(assert start!125110)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!819816 () Bool)

(declare-datatypes ((array!98558 0))(
  ( (array!98559 (arr!47567 (Array (_ BitVec 32) (_ BitVec 64))) (size!48117 (_ BitVec 32))) )
))
(declare-fun lt!638619 () array!98558)

(declare-fun b!1457274 () Bool)

(declare-fun lt!638620 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11819 0))(
  ( (MissingZero!11819 (index!49668 (_ BitVec 32))) (Found!11819 (index!49669 (_ BitVec 32))) (Intermediate!11819 (undefined!12631 Bool) (index!49670 (_ BitVec 32)) (x!131292 (_ BitVec 32))) (Undefined!11819) (MissingVacant!11819 (index!49671 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98558 (_ BitVec 32)) SeekEntryResult!11819)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98558 (_ BitVec 32)) SeekEntryResult!11819)

(assert (=> b!1457274 (= e!819816 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638620 lt!638619 mask!2687) (seekEntryOrOpen!0 lt!638620 lt!638619 mask!2687)))))

(declare-fun b!1457276 () Bool)

(declare-fun res!987618 () Bool)

(declare-fun e!819817 () Bool)

(assert (=> b!1457276 (=> (not res!987618) (not e!819817))))

(declare-fun a!2862 () array!98558)

(declare-datatypes ((List!34068 0))(
  ( (Nil!34065) (Cons!34064 (h!35414 (_ BitVec 64)) (t!48762 List!34068)) )
))
(declare-fun arrayNoDuplicates!0 (array!98558 (_ BitVec 32) List!34068) Bool)

(assert (=> b!1457276 (= res!987618 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34065))))

(declare-fun b!1457277 () Bool)

(declare-fun res!987607 () Bool)

(assert (=> b!1457277 (=> (not res!987607) (not e!819817))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457277 (= res!987607 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48117 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48117 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48117 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457278 () Bool)

(declare-fun res!987619 () Bool)

(assert (=> b!1457278 (=> (not res!987619) (not e!819817))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457278 (= res!987619 (validKeyInArray!0 (select (arr!47567 a!2862) j!93)))))

(declare-fun b!1457279 () Bool)

(declare-fun e!819821 () Bool)

(declare-fun e!819815 () Bool)

(assert (=> b!1457279 (= e!819821 e!819815)))

(declare-fun res!987610 () Bool)

(assert (=> b!1457279 (=> (not res!987610) (not e!819815))))

(declare-fun lt!638621 () SeekEntryResult!11819)

(assert (=> b!1457279 (= res!987610 (= lt!638621 (Intermediate!11819 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98558 (_ BitVec 32)) SeekEntryResult!11819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457279 (= lt!638621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638620 mask!2687) lt!638620 lt!638619 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457279 (= lt!638620 (select (store (arr!47567 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun lt!638625 () (_ BitVec 32))

(declare-fun e!819819 () Bool)

(declare-fun b!1457280 () Bool)

(assert (=> b!1457280 (= e!819819 (not (= lt!638621 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638625 lt!638620 lt!638619 mask!2687))))))

(declare-fun res!987615 () Bool)

(assert (=> start!125110 (=> (not res!987615) (not e!819817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125110 (= res!987615 (validMask!0 mask!2687))))

(assert (=> start!125110 e!819817))

(assert (=> start!125110 true))

(declare-fun array_inv!36595 (array!98558) Bool)

(assert (=> start!125110 (array_inv!36595 a!2862)))

(declare-fun b!1457275 () Bool)

(declare-fun lt!638623 () SeekEntryResult!11819)

(assert (=> b!1457275 (= e!819819 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638625 intermediateAfterIndex!19 lt!638620 lt!638619 mask!2687) lt!638623)))))

(declare-fun b!1457281 () Bool)

(declare-fun e!819813 () Bool)

(assert (=> b!1457281 (= e!819813 true)))

(declare-fun lt!638624 () Bool)

(assert (=> b!1457281 (= lt!638624 e!819819)))

(declare-fun c!134345 () Bool)

(assert (=> b!1457281 (= c!134345 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457282 () Bool)

(declare-fun res!987613 () Bool)

(declare-fun e!819820 () Bool)

(assert (=> b!1457282 (=> (not res!987613) (not e!819820))))

(assert (=> b!1457282 (= res!987613 (= (seekEntryOrOpen!0 (select (arr!47567 a!2862) j!93) a!2862 mask!2687) (Found!11819 j!93)))))

(declare-fun b!1457283 () Bool)

(declare-fun e!819814 () Bool)

(assert (=> b!1457283 (= e!819815 (not e!819814))))

(declare-fun res!987611 () Bool)

(assert (=> b!1457283 (=> res!987611 e!819814)))

(assert (=> b!1457283 (= res!987611 (or (and (= (select (arr!47567 a!2862) index!646) (select (store (arr!47567 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47567 a!2862) index!646) (select (arr!47567 a!2862) j!93))) (= (select (arr!47567 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457283 e!819820))

(declare-fun res!987605 () Bool)

(assert (=> b!1457283 (=> (not res!987605) (not e!819820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98558 (_ BitVec 32)) Bool)

(assert (=> b!1457283 (= res!987605 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49134 0))(
  ( (Unit!49135) )
))
(declare-fun lt!638618 () Unit!49134)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49134)

(assert (=> b!1457283 (= lt!638618 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457284 () Bool)

(assert (=> b!1457284 (= e!819820 (and (or (= (select (arr!47567 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47567 a!2862) intermediateBeforeIndex!19) (select (arr!47567 a!2862) j!93))) (let ((bdg!53323 (select (store (arr!47567 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47567 a!2862) index!646) bdg!53323) (= (select (arr!47567 a!2862) index!646) (select (arr!47567 a!2862) j!93))) (= (select (arr!47567 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53323 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457285 () Bool)

(declare-fun e!819818 () Bool)

(assert (=> b!1457285 (= e!819817 e!819818)))

(declare-fun res!987614 () Bool)

(assert (=> b!1457285 (=> (not res!987614) (not e!819818))))

(assert (=> b!1457285 (= res!987614 (= (select (store (arr!47567 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457285 (= lt!638619 (array!98559 (store (arr!47567 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48117 a!2862)))))

(declare-fun b!1457286 () Bool)

(declare-fun res!987609 () Bool)

(assert (=> b!1457286 (=> (not res!987609) (not e!819815))))

(assert (=> b!1457286 (= res!987609 e!819816)))

(declare-fun c!134346 () Bool)

(assert (=> b!1457286 (= c!134346 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457287 () Bool)

(declare-fun res!987617 () Bool)

(assert (=> b!1457287 (=> (not res!987617) (not e!819817))))

(assert (=> b!1457287 (= res!987617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457288 () Bool)

(assert (=> b!1457288 (= e!819814 e!819813)))

(declare-fun res!987612 () Bool)

(assert (=> b!1457288 (=> res!987612 e!819813)))

(assert (=> b!1457288 (= res!987612 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638625 #b00000000000000000000000000000000) (bvsge lt!638625 (size!48117 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457288 (= lt!638625 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457288 (= lt!638623 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638620 lt!638619 mask!2687))))

(assert (=> b!1457288 (= lt!638623 (seekEntryOrOpen!0 lt!638620 lt!638619 mask!2687))))

(declare-fun b!1457289 () Bool)

(declare-fun res!987608 () Bool)

(assert (=> b!1457289 (=> (not res!987608) (not e!819821))))

(declare-fun lt!638622 () SeekEntryResult!11819)

(assert (=> b!1457289 (= res!987608 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47567 a!2862) j!93) a!2862 mask!2687) lt!638622))))

(declare-fun b!1457290 () Bool)

(declare-fun res!987622 () Bool)

(assert (=> b!1457290 (=> (not res!987622) (not e!819817))))

(assert (=> b!1457290 (= res!987622 (and (= (size!48117 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48117 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48117 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457291 () Bool)

(declare-fun res!987620 () Bool)

(assert (=> b!1457291 (=> (not res!987620) (not e!819815))))

(assert (=> b!1457291 (= res!987620 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457292 () Bool)

(declare-fun res!987606 () Bool)

(assert (=> b!1457292 (=> (not res!987606) (not e!819817))))

(assert (=> b!1457292 (= res!987606 (validKeyInArray!0 (select (arr!47567 a!2862) i!1006)))))

(declare-fun b!1457293 () Bool)

(declare-fun res!987621 () Bool)

(assert (=> b!1457293 (=> res!987621 e!819813)))

(assert (=> b!1457293 (= res!987621 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638625 (select (arr!47567 a!2862) j!93) a!2862 mask!2687) lt!638622)))))

(declare-fun b!1457294 () Bool)

(assert (=> b!1457294 (= e!819818 e!819821)))

(declare-fun res!987616 () Bool)

(assert (=> b!1457294 (=> (not res!987616) (not e!819821))))

(assert (=> b!1457294 (= res!987616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47567 a!2862) j!93) mask!2687) (select (arr!47567 a!2862) j!93) a!2862 mask!2687) lt!638622))))

(assert (=> b!1457294 (= lt!638622 (Intermediate!11819 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457295 () Bool)

(assert (=> b!1457295 (= e!819816 (= lt!638621 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638620 lt!638619 mask!2687)))))

(assert (= (and start!125110 res!987615) b!1457290))

(assert (= (and b!1457290 res!987622) b!1457292))

(assert (= (and b!1457292 res!987606) b!1457278))

(assert (= (and b!1457278 res!987619) b!1457287))

(assert (= (and b!1457287 res!987617) b!1457276))

(assert (= (and b!1457276 res!987618) b!1457277))

(assert (= (and b!1457277 res!987607) b!1457285))

(assert (= (and b!1457285 res!987614) b!1457294))

(assert (= (and b!1457294 res!987616) b!1457289))

(assert (= (and b!1457289 res!987608) b!1457279))

(assert (= (and b!1457279 res!987610) b!1457286))

(assert (= (and b!1457286 c!134346) b!1457295))

(assert (= (and b!1457286 (not c!134346)) b!1457274))

(assert (= (and b!1457286 res!987609) b!1457291))

(assert (= (and b!1457291 res!987620) b!1457283))

(assert (= (and b!1457283 res!987605) b!1457282))

(assert (= (and b!1457282 res!987613) b!1457284))

(assert (= (and b!1457283 (not res!987611)) b!1457288))

(assert (= (and b!1457288 (not res!987612)) b!1457293))

(assert (= (and b!1457293 (not res!987621)) b!1457281))

(assert (= (and b!1457281 c!134345) b!1457280))

(assert (= (and b!1457281 (not c!134345)) b!1457275))

(declare-fun m!1345273 () Bool)

(assert (=> b!1457288 m!1345273))

(declare-fun m!1345275 () Bool)

(assert (=> b!1457288 m!1345275))

(declare-fun m!1345277 () Bool)

(assert (=> b!1457288 m!1345277))

(declare-fun m!1345279 () Bool)

(assert (=> b!1457284 m!1345279))

(declare-fun m!1345281 () Bool)

(assert (=> b!1457284 m!1345281))

(declare-fun m!1345283 () Bool)

(assert (=> b!1457284 m!1345283))

(declare-fun m!1345285 () Bool)

(assert (=> b!1457284 m!1345285))

(declare-fun m!1345287 () Bool)

(assert (=> b!1457284 m!1345287))

(assert (=> b!1457293 m!1345287))

(assert (=> b!1457293 m!1345287))

(declare-fun m!1345289 () Bool)

(assert (=> b!1457293 m!1345289))

(assert (=> b!1457294 m!1345287))

(assert (=> b!1457294 m!1345287))

(declare-fun m!1345291 () Bool)

(assert (=> b!1457294 m!1345291))

(assert (=> b!1457294 m!1345291))

(assert (=> b!1457294 m!1345287))

(declare-fun m!1345293 () Bool)

(assert (=> b!1457294 m!1345293))

(assert (=> b!1457285 m!1345279))

(declare-fun m!1345295 () Bool)

(assert (=> b!1457285 m!1345295))

(assert (=> b!1457282 m!1345287))

(assert (=> b!1457282 m!1345287))

(declare-fun m!1345297 () Bool)

(assert (=> b!1457282 m!1345297))

(declare-fun m!1345299 () Bool)

(assert (=> b!1457276 m!1345299))

(declare-fun m!1345301 () Bool)

(assert (=> start!125110 m!1345301))

(declare-fun m!1345303 () Bool)

(assert (=> start!125110 m!1345303))

(assert (=> b!1457274 m!1345275))

(assert (=> b!1457274 m!1345277))

(declare-fun m!1345305 () Bool)

(assert (=> b!1457283 m!1345305))

(assert (=> b!1457283 m!1345279))

(assert (=> b!1457283 m!1345283))

(assert (=> b!1457283 m!1345285))

(declare-fun m!1345307 () Bool)

(assert (=> b!1457283 m!1345307))

(assert (=> b!1457283 m!1345287))

(declare-fun m!1345309 () Bool)

(assert (=> b!1457287 m!1345309))

(declare-fun m!1345311 () Bool)

(assert (=> b!1457292 m!1345311))

(assert (=> b!1457292 m!1345311))

(declare-fun m!1345313 () Bool)

(assert (=> b!1457292 m!1345313))

(assert (=> b!1457278 m!1345287))

(assert (=> b!1457278 m!1345287))

(declare-fun m!1345315 () Bool)

(assert (=> b!1457278 m!1345315))

(declare-fun m!1345317 () Bool)

(assert (=> b!1457279 m!1345317))

(assert (=> b!1457279 m!1345317))

(declare-fun m!1345319 () Bool)

(assert (=> b!1457279 m!1345319))

(assert (=> b!1457279 m!1345279))

(declare-fun m!1345321 () Bool)

(assert (=> b!1457279 m!1345321))

(declare-fun m!1345323 () Bool)

(assert (=> b!1457280 m!1345323))

(declare-fun m!1345325 () Bool)

(assert (=> b!1457275 m!1345325))

(assert (=> b!1457289 m!1345287))

(assert (=> b!1457289 m!1345287))

(declare-fun m!1345327 () Bool)

(assert (=> b!1457289 m!1345327))

(declare-fun m!1345329 () Bool)

(assert (=> b!1457295 m!1345329))

(push 1)

