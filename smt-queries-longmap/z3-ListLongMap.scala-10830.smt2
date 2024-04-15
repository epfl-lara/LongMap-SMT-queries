; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126776 () Bool)

(assert start!126776)

(declare-fun b!1488492 () Bool)

(declare-fun res!1012266 () Bool)

(declare-fun e!834296 () Bool)

(assert (=> b!1488492 (=> (not res!1012266) (not e!834296))))

(declare-datatypes ((array!99547 0))(
  ( (array!99548 (arr!48046 (Array (_ BitVec 32) (_ BitVec 64))) (size!48598 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99547)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12311 0))(
  ( (MissingZero!12311 (index!51636 (_ BitVec 32))) (Found!12311 (index!51637 (_ BitVec 32))) (Intermediate!12311 (undefined!13123 Bool) (index!51638 (_ BitVec 32)) (x!133232 (_ BitVec 32))) (Undefined!12311) (MissingVacant!12311 (index!51639 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12311)

(assert (=> b!1488492 (= res!1012266 (= (seekEntryOrOpen!0 (select (arr!48046 a!2862) j!93) a!2862 mask!2687) (Found!12311 j!93)))))

(declare-fun b!1488493 () Bool)

(declare-fun res!1012275 () Bool)

(declare-fun e!834292 () Bool)

(assert (=> b!1488493 (=> (not res!1012275) (not e!834292))))

(declare-fun e!834289 () Bool)

(assert (=> b!1488493 (= res!1012275 e!834289)))

(declare-fun c!137644 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1488493 (= c!137644 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488494 () Bool)

(declare-fun res!1012265 () Bool)

(declare-fun e!834290 () Bool)

(assert (=> b!1488494 (=> (not res!1012265) (not e!834290))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1488494 (= res!1012265 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48598 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48598 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48598 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488496 () Bool)

(declare-fun e!834291 () Bool)

(assert (=> b!1488496 (= e!834291 e!834292)))

(declare-fun res!1012271 () Bool)

(assert (=> b!1488496 (=> (not res!1012271) (not e!834292))))

(declare-fun lt!649041 () SeekEntryResult!12311)

(assert (=> b!1488496 (= res!1012271 (= lt!649041 (Intermediate!12311 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649040 () array!99547)

(declare-fun lt!649044 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12311)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488496 (= lt!649041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649044 mask!2687) lt!649044 lt!649040 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488496 (= lt!649044 (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488497 () Bool)

(declare-fun res!1012280 () Bool)

(assert (=> b!1488497 (=> (not res!1012280) (not e!834292))))

(assert (=> b!1488497 (= res!1012280 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488498 () Bool)

(declare-fun res!1012276 () Bool)

(assert (=> b!1488498 (=> (not res!1012276) (not e!834291))))

(declare-fun lt!649046 () SeekEntryResult!12311)

(assert (=> b!1488498 (= res!1012276 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48046 a!2862) j!93) a!2862 mask!2687) lt!649046))))

(declare-fun b!1488499 () Bool)

(declare-fun e!834288 () Bool)

(assert (=> b!1488499 (= e!834290 e!834288)))

(declare-fun res!1012267 () Bool)

(assert (=> b!1488499 (=> (not res!1012267) (not e!834288))))

(assert (=> b!1488499 (= res!1012267 (= (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488499 (= lt!649040 (array!99548 (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48598 a!2862)))))

(declare-fun b!1488500 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12311)

(assert (=> b!1488500 (= e!834289 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649044 lt!649040 mask!2687) (seekEntryOrOpen!0 lt!649044 lt!649040 mask!2687)))))

(declare-fun e!834294 () Bool)

(declare-fun b!1488501 () Bool)

(declare-fun lt!649039 () (_ BitVec 32))

(assert (=> b!1488501 (= e!834294 (not (= lt!649041 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649039 lt!649044 lt!649040 mask!2687))))))

(declare-fun b!1488502 () Bool)

(declare-fun res!1012274 () Bool)

(assert (=> b!1488502 (=> (not res!1012274) (not e!834290))))

(assert (=> b!1488502 (= res!1012274 (and (= (size!48598 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48598 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48598 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488503 () Bool)

(declare-fun e!834287 () Bool)

(assert (=> b!1488503 (= e!834287 true)))

(declare-fun lt!649043 () Bool)

(assert (=> b!1488503 (= lt!649043 e!834294)))

(declare-fun c!137643 () Bool)

(assert (=> b!1488503 (= c!137643 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488504 () Bool)

(declare-fun res!1012279 () Bool)

(assert (=> b!1488504 (=> (not res!1012279) (not e!834290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488504 (= res!1012279 (validKeyInArray!0 (select (arr!48046 a!2862) i!1006)))))

(declare-fun b!1488505 () Bool)

(assert (=> b!1488505 (= e!834296 (and (or (= (select (arr!48046 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48046 a!2862) intermediateBeforeIndex!19) (select (arr!48046 a!2862) j!93))) (let ((bdg!54671 (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48046 a!2862) index!646) bdg!54671) (= (select (arr!48046 a!2862) index!646) (select (arr!48046 a!2862) j!93))) (= (select (arr!48046 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54671 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488506 () Bool)

(declare-fun res!1012269 () Bool)

(assert (=> b!1488506 (=> (not res!1012269) (not e!834290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99547 (_ BitVec 32)) Bool)

(assert (=> b!1488506 (= res!1012269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488507 () Bool)

(assert (=> b!1488507 (= e!834288 e!834291)))

(declare-fun res!1012278 () Bool)

(assert (=> b!1488507 (=> (not res!1012278) (not e!834291))))

(assert (=> b!1488507 (= res!1012278 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48046 a!2862) j!93) mask!2687) (select (arr!48046 a!2862) j!93) a!2862 mask!2687) lt!649046))))

(assert (=> b!1488507 (= lt!649046 (Intermediate!12311 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488508 () Bool)

(assert (=> b!1488508 (= e!834289 (= lt!649041 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649044 lt!649040 mask!2687)))))

(declare-fun res!1012282 () Bool)

(assert (=> start!126776 (=> (not res!1012282) (not e!834290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126776 (= res!1012282 (validMask!0 mask!2687))))

(assert (=> start!126776 e!834290))

(assert (=> start!126776 true))

(declare-fun array_inv!37279 (array!99547) Bool)

(assert (=> start!126776 (array_inv!37279 a!2862)))

(declare-fun b!1488495 () Bool)

(declare-fun res!1012270 () Bool)

(assert (=> b!1488495 (=> (not res!1012270) (not e!834290))))

(declare-datatypes ((List!34625 0))(
  ( (Nil!34622) (Cons!34621 (h!36004 (_ BitVec 64)) (t!49311 List!34625)) )
))
(declare-fun arrayNoDuplicates!0 (array!99547 (_ BitVec 32) List!34625) Bool)

(assert (=> b!1488495 (= res!1012270 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34622))))

(declare-fun b!1488509 () Bool)

(declare-fun e!834295 () Bool)

(assert (=> b!1488509 (= e!834292 (not e!834295))))

(declare-fun res!1012272 () Bool)

(assert (=> b!1488509 (=> res!1012272 e!834295)))

(assert (=> b!1488509 (= res!1012272 (or (and (= (select (arr!48046 a!2862) index!646) (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48046 a!2862) index!646) (select (arr!48046 a!2862) j!93))) (= (select (arr!48046 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488509 e!834296))

(declare-fun res!1012273 () Bool)

(assert (=> b!1488509 (=> (not res!1012273) (not e!834296))))

(assert (=> b!1488509 (= res!1012273 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49803 0))(
  ( (Unit!49804) )
))
(declare-fun lt!649042 () Unit!49803)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49803)

(assert (=> b!1488509 (= lt!649042 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488510 () Bool)

(assert (=> b!1488510 (= e!834295 e!834287)))

(declare-fun res!1012277 () Bool)

(assert (=> b!1488510 (=> res!1012277 e!834287)))

(assert (=> b!1488510 (= res!1012277 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649039 #b00000000000000000000000000000000) (bvsge lt!649039 (size!48598 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488510 (= lt!649039 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649045 () SeekEntryResult!12311)

(assert (=> b!1488510 (= lt!649045 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649044 lt!649040 mask!2687))))

(assert (=> b!1488510 (= lt!649045 (seekEntryOrOpen!0 lt!649044 lt!649040 mask!2687))))

(declare-fun b!1488511 () Bool)

(declare-fun res!1012281 () Bool)

(assert (=> b!1488511 (=> (not res!1012281) (not e!834290))))

(assert (=> b!1488511 (= res!1012281 (validKeyInArray!0 (select (arr!48046 a!2862) j!93)))))

(declare-fun b!1488512 () Bool)

(declare-fun res!1012268 () Bool)

(assert (=> b!1488512 (=> res!1012268 e!834287)))

(assert (=> b!1488512 (= res!1012268 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649039 (select (arr!48046 a!2862) j!93) a!2862 mask!2687) lt!649046)))))

(declare-fun b!1488513 () Bool)

(assert (=> b!1488513 (= e!834294 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649039 intermediateAfterIndex!19 lt!649044 lt!649040 mask!2687) lt!649045)))))

(assert (= (and start!126776 res!1012282) b!1488502))

(assert (= (and b!1488502 res!1012274) b!1488504))

(assert (= (and b!1488504 res!1012279) b!1488511))

(assert (= (and b!1488511 res!1012281) b!1488506))

(assert (= (and b!1488506 res!1012269) b!1488495))

(assert (= (and b!1488495 res!1012270) b!1488494))

(assert (= (and b!1488494 res!1012265) b!1488499))

(assert (= (and b!1488499 res!1012267) b!1488507))

(assert (= (and b!1488507 res!1012278) b!1488498))

(assert (= (and b!1488498 res!1012276) b!1488496))

(assert (= (and b!1488496 res!1012271) b!1488493))

(assert (= (and b!1488493 c!137644) b!1488508))

(assert (= (and b!1488493 (not c!137644)) b!1488500))

(assert (= (and b!1488493 res!1012275) b!1488497))

(assert (= (and b!1488497 res!1012280) b!1488509))

(assert (= (and b!1488509 res!1012273) b!1488492))

(assert (= (and b!1488492 res!1012266) b!1488505))

(assert (= (and b!1488509 (not res!1012272)) b!1488510))

(assert (= (and b!1488510 (not res!1012277)) b!1488512))

(assert (= (and b!1488512 (not res!1012268)) b!1488503))

(assert (= (and b!1488503 c!137643) b!1488501))

(assert (= (and b!1488503 (not c!137643)) b!1488513))

(declare-fun m!1372263 () Bool)

(assert (=> b!1488499 m!1372263))

(declare-fun m!1372265 () Bool)

(assert (=> b!1488499 m!1372265))

(declare-fun m!1372267 () Bool)

(assert (=> b!1488496 m!1372267))

(assert (=> b!1488496 m!1372267))

(declare-fun m!1372269 () Bool)

(assert (=> b!1488496 m!1372269))

(assert (=> b!1488496 m!1372263))

(declare-fun m!1372271 () Bool)

(assert (=> b!1488496 m!1372271))

(declare-fun m!1372273 () Bool)

(assert (=> b!1488507 m!1372273))

(assert (=> b!1488507 m!1372273))

(declare-fun m!1372275 () Bool)

(assert (=> b!1488507 m!1372275))

(assert (=> b!1488507 m!1372275))

(assert (=> b!1488507 m!1372273))

(declare-fun m!1372277 () Bool)

(assert (=> b!1488507 m!1372277))

(declare-fun m!1372279 () Bool)

(assert (=> b!1488501 m!1372279))

(declare-fun m!1372281 () Bool)

(assert (=> b!1488504 m!1372281))

(assert (=> b!1488504 m!1372281))

(declare-fun m!1372283 () Bool)

(assert (=> b!1488504 m!1372283))

(assert (=> b!1488498 m!1372273))

(assert (=> b!1488498 m!1372273))

(declare-fun m!1372285 () Bool)

(assert (=> b!1488498 m!1372285))

(assert (=> b!1488492 m!1372273))

(assert (=> b!1488492 m!1372273))

(declare-fun m!1372287 () Bool)

(assert (=> b!1488492 m!1372287))

(assert (=> b!1488505 m!1372263))

(declare-fun m!1372289 () Bool)

(assert (=> b!1488505 m!1372289))

(declare-fun m!1372291 () Bool)

(assert (=> b!1488505 m!1372291))

(declare-fun m!1372293 () Bool)

(assert (=> b!1488505 m!1372293))

(assert (=> b!1488505 m!1372273))

(declare-fun m!1372295 () Bool)

(assert (=> b!1488500 m!1372295))

(declare-fun m!1372297 () Bool)

(assert (=> b!1488500 m!1372297))

(declare-fun m!1372299 () Bool)

(assert (=> b!1488506 m!1372299))

(declare-fun m!1372301 () Bool)

(assert (=> b!1488508 m!1372301))

(declare-fun m!1372303 () Bool)

(assert (=> start!126776 m!1372303))

(declare-fun m!1372305 () Bool)

(assert (=> start!126776 m!1372305))

(declare-fun m!1372307 () Bool)

(assert (=> b!1488495 m!1372307))

(declare-fun m!1372309 () Bool)

(assert (=> b!1488510 m!1372309))

(assert (=> b!1488510 m!1372295))

(assert (=> b!1488510 m!1372297))

(assert (=> b!1488511 m!1372273))

(assert (=> b!1488511 m!1372273))

(declare-fun m!1372311 () Bool)

(assert (=> b!1488511 m!1372311))

(declare-fun m!1372313 () Bool)

(assert (=> b!1488509 m!1372313))

(assert (=> b!1488509 m!1372263))

(assert (=> b!1488509 m!1372291))

(assert (=> b!1488509 m!1372293))

(declare-fun m!1372315 () Bool)

(assert (=> b!1488509 m!1372315))

(assert (=> b!1488509 m!1372273))

(assert (=> b!1488512 m!1372273))

(assert (=> b!1488512 m!1372273))

(declare-fun m!1372317 () Bool)

(assert (=> b!1488512 m!1372317))

(declare-fun m!1372319 () Bool)

(assert (=> b!1488513 m!1372319))

(check-sat (not b!1488512) (not b!1488492) (not b!1488496) (not b!1488506) (not b!1488509) (not b!1488504) (not b!1488511) (not b!1488507) (not b!1488510) (not b!1488501) (not b!1488508) (not b!1488498) (not start!126776) (not b!1488495) (not b!1488500) (not b!1488513))
(check-sat)
