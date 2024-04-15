; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125776 () Bool)

(assert start!125776)

(declare-fun b!1472528 () Bool)

(declare-fun res!1000274 () Bool)

(declare-fun e!826350 () Bool)

(assert (=> b!1472528 (=> (not res!1000274) (not e!826350))))

(declare-datatypes ((array!99088 0))(
  ( (array!99089 (arr!47830 (Array (_ BitVec 32) (_ BitVec 64))) (size!48382 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99088)

(declare-datatypes ((List!34409 0))(
  ( (Nil!34406) (Cons!34405 (h!35761 (_ BitVec 64)) (t!49095 List!34409)) )
))
(declare-fun arrayNoDuplicates!0 (array!99088 (_ BitVec 32) List!34409) Bool)

(assert (=> b!1472528 (= res!1000274 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34406))))

(declare-fun b!1472529 () Bool)

(declare-fun res!1000282 () Bool)

(assert (=> b!1472529 (=> (not res!1000282) (not e!826350))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472529 (= res!1000282 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48382 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48382 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48382 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472530 () Bool)

(declare-fun res!1000286 () Bool)

(declare-fun e!826354 () Bool)

(assert (=> b!1472530 (=> (not res!1000286) (not e!826354))))

(declare-fun e!826356 () Bool)

(assert (=> b!1472530 (= res!1000286 e!826356)))

(declare-fun c!135643 () Bool)

(assert (=> b!1472530 (= c!135643 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472531 () Bool)

(declare-fun res!1000279 () Bool)

(assert (=> b!1472531 (=> (not res!1000279) (not e!826350))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472531 (= res!1000279 (validKeyInArray!0 (select (arr!47830 a!2862) j!93)))))

(declare-fun b!1472532 () Bool)

(declare-fun res!1000281 () Bool)

(declare-fun e!826351 () Bool)

(assert (=> b!1472532 (=> (not res!1000281) (not e!826351))))

(declare-datatypes ((SeekEntryResult!12095 0))(
  ( (MissingZero!12095 (index!50772 (_ BitVec 32))) (Found!12095 (index!50773 (_ BitVec 32))) (Intermediate!12095 (undefined!12907 Bool) (index!50774 (_ BitVec 32)) (x!132349 (_ BitVec 32))) (Undefined!12095) (MissingVacant!12095 (index!50775 (_ BitVec 32))) )
))
(declare-fun lt!643421 () SeekEntryResult!12095)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99088 (_ BitVec 32)) SeekEntryResult!12095)

(assert (=> b!1472532 (= res!1000281 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!643421))))

(declare-fun b!1472533 () Bool)

(declare-fun e!826355 () Bool)

(assert (=> b!1472533 (= e!826350 e!826355)))

(declare-fun res!1000277 () Bool)

(assert (=> b!1472533 (=> (not res!1000277) (not e!826355))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472533 (= res!1000277 (= (select (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643423 () array!99088)

(assert (=> b!1472533 (= lt!643423 (array!99089 (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48382 a!2862)))))

(declare-fun res!1000284 () Bool)

(assert (=> start!125776 (=> (not res!1000284) (not e!826350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125776 (= res!1000284 (validMask!0 mask!2687))))

(assert (=> start!125776 e!826350))

(assert (=> start!125776 true))

(declare-fun array_inv!37063 (array!99088) Bool)

(assert (=> start!125776 (array_inv!37063 a!2862)))

(declare-fun b!1472534 () Bool)

(declare-fun res!1000278 () Bool)

(assert (=> b!1472534 (=> (not res!1000278) (not e!826350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99088 (_ BitVec 32)) Bool)

(assert (=> b!1472534 (= res!1000278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472535 () Bool)

(declare-fun e!826352 () Bool)

(assert (=> b!1472535 (= e!826352 (or (= (select (arr!47830 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47830 a!2862) intermediateBeforeIndex!19) (select (arr!47830 a!2862) j!93))))))

(declare-fun lt!643424 () (_ BitVec 64))

(declare-fun b!1472536 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99088 (_ BitVec 32)) SeekEntryResult!12095)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99088 (_ BitVec 32)) SeekEntryResult!12095)

(assert (=> b!1472536 (= e!826356 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643424 lt!643423 mask!2687) (seekEntryOrOpen!0 lt!643424 lt!643423 mask!2687)))))

(declare-fun b!1472537 () Bool)

(declare-fun lt!643425 () SeekEntryResult!12095)

(assert (=> b!1472537 (= e!826356 (= lt!643425 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643424 lt!643423 mask!2687)))))

(declare-fun b!1472538 () Bool)

(declare-fun res!1000288 () Bool)

(assert (=> b!1472538 (=> (not res!1000288) (not e!826350))))

(assert (=> b!1472538 (= res!1000288 (and (= (size!48382 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48382 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48382 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472539 () Bool)

(declare-fun res!1000285 () Bool)

(assert (=> b!1472539 (=> (not res!1000285) (not e!826354))))

(assert (=> b!1472539 (= res!1000285 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472540 () Bool)

(declare-fun res!1000280 () Bool)

(assert (=> b!1472540 (=> (not res!1000280) (not e!826350))))

(assert (=> b!1472540 (= res!1000280 (validKeyInArray!0 (select (arr!47830 a!2862) i!1006)))))

(declare-fun b!1472541 () Bool)

(assert (=> b!1472541 (= e!826351 e!826354)))

(declare-fun res!1000283 () Bool)

(assert (=> b!1472541 (=> (not res!1000283) (not e!826354))))

(assert (=> b!1472541 (= res!1000283 (= lt!643425 (Intermediate!12095 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472541 (= lt!643425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643424 mask!2687) lt!643424 lt!643423 mask!2687))))

(assert (=> b!1472541 (= lt!643424 (select (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472542 () Bool)

(declare-fun res!1000275 () Bool)

(assert (=> b!1472542 (=> (not res!1000275) (not e!826352))))

(assert (=> b!1472542 (= res!1000275 (= (seekEntryOrOpen!0 (select (arr!47830 a!2862) j!93) a!2862 mask!2687) (Found!12095 j!93)))))

(declare-fun b!1472543 () Bool)

(assert (=> b!1472543 (= e!826355 e!826351)))

(declare-fun res!1000287 () Bool)

(assert (=> b!1472543 (=> (not res!1000287) (not e!826351))))

(assert (=> b!1472543 (= res!1000287 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!643421))))

(assert (=> b!1472543 (= lt!643421 (Intermediate!12095 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472544 () Bool)

(assert (=> b!1472544 (= e!826354 (not true))))

(assert (=> b!1472544 e!826352))

(declare-fun res!1000276 () Bool)

(assert (=> b!1472544 (=> (not res!1000276) (not e!826352))))

(assert (=> b!1472544 (= res!1000276 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49371 0))(
  ( (Unit!49372) )
))
(declare-fun lt!643422 () Unit!49371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49371)

(assert (=> b!1472544 (= lt!643422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125776 res!1000284) b!1472538))

(assert (= (and b!1472538 res!1000288) b!1472540))

(assert (= (and b!1472540 res!1000280) b!1472531))

(assert (= (and b!1472531 res!1000279) b!1472534))

(assert (= (and b!1472534 res!1000278) b!1472528))

(assert (= (and b!1472528 res!1000274) b!1472529))

(assert (= (and b!1472529 res!1000282) b!1472533))

(assert (= (and b!1472533 res!1000277) b!1472543))

(assert (= (and b!1472543 res!1000287) b!1472532))

(assert (= (and b!1472532 res!1000281) b!1472541))

(assert (= (and b!1472541 res!1000283) b!1472530))

(assert (= (and b!1472530 c!135643) b!1472537))

(assert (= (and b!1472530 (not c!135643)) b!1472536))

(assert (= (and b!1472530 res!1000286) b!1472539))

(assert (= (and b!1472539 res!1000285) b!1472544))

(assert (= (and b!1472544 res!1000276) b!1472542))

(assert (= (and b!1472542 res!1000275) b!1472535))

(declare-fun m!1358733 () Bool)

(assert (=> b!1472528 m!1358733))

(declare-fun m!1358735 () Bool)

(assert (=> b!1472542 m!1358735))

(assert (=> b!1472542 m!1358735))

(declare-fun m!1358737 () Bool)

(assert (=> b!1472542 m!1358737))

(assert (=> b!1472543 m!1358735))

(assert (=> b!1472543 m!1358735))

(declare-fun m!1358739 () Bool)

(assert (=> b!1472543 m!1358739))

(assert (=> b!1472543 m!1358739))

(assert (=> b!1472543 m!1358735))

(declare-fun m!1358741 () Bool)

(assert (=> b!1472543 m!1358741))

(declare-fun m!1358743 () Bool)

(assert (=> b!1472535 m!1358743))

(assert (=> b!1472535 m!1358735))

(declare-fun m!1358745 () Bool)

(assert (=> start!125776 m!1358745))

(declare-fun m!1358747 () Bool)

(assert (=> start!125776 m!1358747))

(declare-fun m!1358749 () Bool)

(assert (=> b!1472534 m!1358749))

(declare-fun m!1358751 () Bool)

(assert (=> b!1472536 m!1358751))

(declare-fun m!1358753 () Bool)

(assert (=> b!1472536 m!1358753))

(declare-fun m!1358755 () Bool)

(assert (=> b!1472537 m!1358755))

(assert (=> b!1472531 m!1358735))

(assert (=> b!1472531 m!1358735))

(declare-fun m!1358757 () Bool)

(assert (=> b!1472531 m!1358757))

(assert (=> b!1472532 m!1358735))

(assert (=> b!1472532 m!1358735))

(declare-fun m!1358759 () Bool)

(assert (=> b!1472532 m!1358759))

(declare-fun m!1358761 () Bool)

(assert (=> b!1472541 m!1358761))

(assert (=> b!1472541 m!1358761))

(declare-fun m!1358763 () Bool)

(assert (=> b!1472541 m!1358763))

(declare-fun m!1358765 () Bool)

(assert (=> b!1472541 m!1358765))

(declare-fun m!1358767 () Bool)

(assert (=> b!1472541 m!1358767))

(declare-fun m!1358769 () Bool)

(assert (=> b!1472544 m!1358769))

(declare-fun m!1358771 () Bool)

(assert (=> b!1472544 m!1358771))

(declare-fun m!1358773 () Bool)

(assert (=> b!1472540 m!1358773))

(assert (=> b!1472540 m!1358773))

(declare-fun m!1358775 () Bool)

(assert (=> b!1472540 m!1358775))

(assert (=> b!1472533 m!1358765))

(declare-fun m!1358777 () Bool)

(assert (=> b!1472533 m!1358777))

(check-sat (not b!1472531) (not b!1472540) (not b!1472528) (not b!1472541) (not b!1472542) (not b!1472544) (not start!125776) (not b!1472537) (not b!1472536) (not b!1472543) (not b!1472534) (not b!1472532))
(check-sat)
