; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126936 () Bool)

(assert start!126936)

(declare-fun b!1488527 () Bool)

(declare-fun e!834520 () Bool)

(declare-fun e!834524 () Bool)

(assert (=> b!1488527 (= e!834520 (not e!834524))))

(declare-fun res!1011750 () Bool)

(assert (=> b!1488527 (=> res!1011750 e!834524)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99673 0))(
  ( (array!99674 (arr!48106 (Array (_ BitVec 32) (_ BitVec 64))) (size!48657 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99673)

(assert (=> b!1488527 (= res!1011750 (or (and (= (select (arr!48106 a!2862) index!646) (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48106 a!2862) index!646) (select (arr!48106 a!2862) j!93))) (= (select (arr!48106 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!834517 () Bool)

(assert (=> b!1488527 e!834517))

(declare-fun res!1011761 () Bool)

(assert (=> b!1488527 (=> (not res!1011761) (not e!834517))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99673 (_ BitVec 32)) Bool)

(assert (=> b!1488527 (= res!1011761 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49859 0))(
  ( (Unit!49860) )
))
(declare-fun lt!649236 () Unit!49859)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49859)

(assert (=> b!1488527 (= lt!649236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488528 () Bool)

(declare-fun res!1011743 () Bool)

(declare-fun e!834518 () Bool)

(assert (=> b!1488528 (=> (not res!1011743) (not e!834518))))

(declare-datatypes ((List!34594 0))(
  ( (Nil!34591) (Cons!34590 (h!35981 (_ BitVec 64)) (t!49280 List!34594)) )
))
(declare-fun arrayNoDuplicates!0 (array!99673 (_ BitVec 32) List!34594) Bool)

(assert (=> b!1488528 (= res!1011743 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34591))))

(declare-fun b!1488529 () Bool)

(declare-fun res!1011756 () Bool)

(assert (=> b!1488529 (=> (not res!1011756) (not e!834518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488529 (= res!1011756 (validKeyInArray!0 (select (arr!48106 a!2862) i!1006)))))

(declare-fun b!1488530 () Bool)

(declare-fun lt!649231 () array!99673)

(declare-fun e!834519 () Bool)

(declare-fun lt!649237 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12243 0))(
  ( (MissingZero!12243 (index!51364 (_ BitVec 32))) (Found!12243 (index!51365 (_ BitVec 32))) (Intermediate!12243 (undefined!13055 Bool) (index!51366 (_ BitVec 32)) (x!133132 (_ BitVec 32))) (Undefined!12243) (MissingVacant!12243 (index!51367 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99673 (_ BitVec 32)) SeekEntryResult!12243)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99673 (_ BitVec 32)) SeekEntryResult!12243)

(assert (=> b!1488530 (= e!834519 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649237 lt!649231 mask!2687) (seekEntryOrOpen!0 lt!649237 lt!649231 mask!2687)))))

(declare-fun b!1488531 () Bool)

(declare-fun e!834525 () Bool)

(declare-fun e!834521 () Bool)

(assert (=> b!1488531 (= e!834525 e!834521)))

(declare-fun res!1011753 () Bool)

(assert (=> b!1488531 (=> (not res!1011753) (not e!834521))))

(declare-fun lt!649232 () SeekEntryResult!12243)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99673 (_ BitVec 32)) SeekEntryResult!12243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488531 (= res!1011753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48106 a!2862) j!93) mask!2687) (select (arr!48106 a!2862) j!93) a!2862 mask!2687) lt!649232))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488531 (= lt!649232 (Intermediate!12243 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!834522 () Bool)

(declare-fun b!1488532 () Bool)

(assert (=> b!1488532 (= e!834522 (= (seekEntryOrOpen!0 lt!649237 lt!649231 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649237 lt!649231 mask!2687)))))

(declare-fun b!1488533 () Bool)

(assert (=> b!1488533 (= e!834524 true)))

(declare-fun lt!649233 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488533 (= lt!649233 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!649234 () SeekEntryResult!12243)

(declare-fun b!1488534 () Bool)

(assert (=> b!1488534 (= e!834519 (= lt!649234 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649237 lt!649231 mask!2687)))))

(declare-fun b!1488535 () Bool)

(assert (=> b!1488535 (= e!834521 e!834520)))

(declare-fun res!1011758 () Bool)

(assert (=> b!1488535 (=> (not res!1011758) (not e!834520))))

(assert (=> b!1488535 (= res!1011758 (= lt!649234 (Intermediate!12243 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1488535 (= lt!649234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649237 mask!2687) lt!649237 lt!649231 mask!2687))))

(assert (=> b!1488535 (= lt!649237 (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1011746 () Bool)

(assert (=> start!126936 (=> (not res!1011746) (not e!834518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126936 (= res!1011746 (validMask!0 mask!2687))))

(assert (=> start!126936 e!834518))

(assert (=> start!126936 true))

(declare-fun array_inv!37387 (array!99673) Bool)

(assert (=> start!126936 (array_inv!37387 a!2862)))

(declare-fun b!1488536 () Bool)

(declare-fun res!1011744 () Bool)

(assert (=> b!1488536 (=> (not res!1011744) (not e!834518))))

(assert (=> b!1488536 (= res!1011744 (and (= (size!48657 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48657 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48657 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488537 () Bool)

(declare-fun res!1011751 () Bool)

(assert (=> b!1488537 (=> (not res!1011751) (not e!834518))))

(assert (=> b!1488537 (= res!1011751 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48657 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48657 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48657 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488538 () Bool)

(declare-fun res!1011749 () Bool)

(assert (=> b!1488538 (=> (not res!1011749) (not e!834520))))

(assert (=> b!1488538 (= res!1011749 e!834519)))

(declare-fun c!137926 () Bool)

(assert (=> b!1488538 (= c!137926 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488539 () Bool)

(declare-fun res!1011760 () Bool)

(assert (=> b!1488539 (=> (not res!1011760) (not e!834521))))

(assert (=> b!1488539 (= res!1011760 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48106 a!2862) j!93) a!2862 mask!2687) lt!649232))))

(declare-fun b!1488540 () Bool)

(declare-fun e!834523 () Bool)

(assert (=> b!1488540 (= e!834523 e!834522)))

(declare-fun res!1011747 () Bool)

(assert (=> b!1488540 (=> (not res!1011747) (not e!834522))))

(declare-fun lt!649235 () (_ BitVec 64))

(assert (=> b!1488540 (= res!1011747 (and (= index!646 intermediateAfterIndex!19) (= lt!649235 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488541 () Bool)

(assert (=> b!1488541 (= e!834518 e!834525)))

(declare-fun res!1011745 () Bool)

(assert (=> b!1488541 (=> (not res!1011745) (not e!834525))))

(assert (=> b!1488541 (= res!1011745 (= (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488541 (= lt!649231 (array!99674 (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48657 a!2862)))))

(declare-fun b!1488542 () Bool)

(declare-fun res!1011757 () Bool)

(assert (=> b!1488542 (=> (not res!1011757) (not e!834517))))

(assert (=> b!1488542 (= res!1011757 (or (= (select (arr!48106 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48106 a!2862) intermediateBeforeIndex!19) (select (arr!48106 a!2862) j!93))))))

(declare-fun b!1488543 () Bool)

(declare-fun res!1011754 () Bool)

(assert (=> b!1488543 (=> (not res!1011754) (not e!834518))))

(assert (=> b!1488543 (= res!1011754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488544 () Bool)

(assert (=> b!1488544 (= e!834517 e!834523)))

(declare-fun res!1011755 () Bool)

(assert (=> b!1488544 (=> res!1011755 e!834523)))

(assert (=> b!1488544 (= res!1011755 (or (and (= (select (arr!48106 a!2862) index!646) lt!649235) (= (select (arr!48106 a!2862) index!646) (select (arr!48106 a!2862) j!93))) (= (select (arr!48106 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488544 (= lt!649235 (select (store (arr!48106 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1488545 () Bool)

(declare-fun res!1011748 () Bool)

(assert (=> b!1488545 (=> (not res!1011748) (not e!834518))))

(assert (=> b!1488545 (= res!1011748 (validKeyInArray!0 (select (arr!48106 a!2862) j!93)))))

(declare-fun b!1488546 () Bool)

(declare-fun res!1011759 () Bool)

(assert (=> b!1488546 (=> (not res!1011759) (not e!834520))))

(assert (=> b!1488546 (= res!1011759 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488547 () Bool)

(declare-fun res!1011752 () Bool)

(assert (=> b!1488547 (=> (not res!1011752) (not e!834517))))

(assert (=> b!1488547 (= res!1011752 (= (seekEntryOrOpen!0 (select (arr!48106 a!2862) j!93) a!2862 mask!2687) (Found!12243 j!93)))))

(assert (= (and start!126936 res!1011746) b!1488536))

(assert (= (and b!1488536 res!1011744) b!1488529))

(assert (= (and b!1488529 res!1011756) b!1488545))

(assert (= (and b!1488545 res!1011748) b!1488543))

(assert (= (and b!1488543 res!1011754) b!1488528))

(assert (= (and b!1488528 res!1011743) b!1488537))

(assert (= (and b!1488537 res!1011751) b!1488541))

(assert (= (and b!1488541 res!1011745) b!1488531))

(assert (= (and b!1488531 res!1011753) b!1488539))

(assert (= (and b!1488539 res!1011760) b!1488535))

(assert (= (and b!1488535 res!1011758) b!1488538))

(assert (= (and b!1488538 c!137926) b!1488534))

(assert (= (and b!1488538 (not c!137926)) b!1488530))

(assert (= (and b!1488538 res!1011749) b!1488546))

(assert (= (and b!1488546 res!1011759) b!1488527))

(assert (= (and b!1488527 res!1011761) b!1488547))

(assert (= (and b!1488547 res!1011752) b!1488542))

(assert (= (and b!1488542 res!1011757) b!1488544))

(assert (= (and b!1488544 (not res!1011755)) b!1488540))

(assert (= (and b!1488540 res!1011747) b!1488532))

(assert (= (and b!1488527 (not res!1011750)) b!1488533))

(declare-fun m!1373323 () Bool)

(assert (=> b!1488539 m!1373323))

(assert (=> b!1488539 m!1373323))

(declare-fun m!1373325 () Bool)

(assert (=> b!1488539 m!1373325))

(declare-fun m!1373327 () Bool)

(assert (=> b!1488528 m!1373327))

(declare-fun m!1373329 () Bool)

(assert (=> b!1488542 m!1373329))

(assert (=> b!1488542 m!1373323))

(declare-fun m!1373331 () Bool)

(assert (=> b!1488541 m!1373331))

(declare-fun m!1373333 () Bool)

(assert (=> b!1488541 m!1373333))

(declare-fun m!1373335 () Bool)

(assert (=> b!1488534 m!1373335))

(declare-fun m!1373337 () Bool)

(assert (=> b!1488544 m!1373337))

(assert (=> b!1488544 m!1373323))

(assert (=> b!1488544 m!1373331))

(declare-fun m!1373339 () Bool)

(assert (=> b!1488544 m!1373339))

(assert (=> b!1488531 m!1373323))

(assert (=> b!1488531 m!1373323))

(declare-fun m!1373341 () Bool)

(assert (=> b!1488531 m!1373341))

(assert (=> b!1488531 m!1373341))

(assert (=> b!1488531 m!1373323))

(declare-fun m!1373343 () Bool)

(assert (=> b!1488531 m!1373343))

(declare-fun m!1373345 () Bool)

(assert (=> start!126936 m!1373345))

(declare-fun m!1373347 () Bool)

(assert (=> start!126936 m!1373347))

(declare-fun m!1373349 () Bool)

(assert (=> b!1488533 m!1373349))

(assert (=> b!1488547 m!1373323))

(assert (=> b!1488547 m!1373323))

(declare-fun m!1373351 () Bool)

(assert (=> b!1488547 m!1373351))

(declare-fun m!1373353 () Bool)

(assert (=> b!1488527 m!1373353))

(assert (=> b!1488527 m!1373331))

(assert (=> b!1488527 m!1373339))

(assert (=> b!1488527 m!1373337))

(declare-fun m!1373355 () Bool)

(assert (=> b!1488527 m!1373355))

(assert (=> b!1488527 m!1373323))

(declare-fun m!1373357 () Bool)

(assert (=> b!1488543 m!1373357))

(declare-fun m!1373359 () Bool)

(assert (=> b!1488530 m!1373359))

(declare-fun m!1373361 () Bool)

(assert (=> b!1488530 m!1373361))

(assert (=> b!1488532 m!1373361))

(assert (=> b!1488532 m!1373359))

(declare-fun m!1373363 () Bool)

(assert (=> b!1488529 m!1373363))

(assert (=> b!1488529 m!1373363))

(declare-fun m!1373365 () Bool)

(assert (=> b!1488529 m!1373365))

(assert (=> b!1488545 m!1373323))

(assert (=> b!1488545 m!1373323))

(declare-fun m!1373367 () Bool)

(assert (=> b!1488545 m!1373367))

(declare-fun m!1373369 () Bool)

(assert (=> b!1488535 m!1373369))

(assert (=> b!1488535 m!1373369))

(declare-fun m!1373371 () Bool)

(assert (=> b!1488535 m!1373371))

(assert (=> b!1488535 m!1373331))

(declare-fun m!1373373 () Bool)

(assert (=> b!1488535 m!1373373))

(check-sat (not b!1488532) (not b!1488531) (not b!1488530) (not b!1488528) (not b!1488529) (not b!1488543) (not b!1488535) (not b!1488547) (not b!1488539) (not b!1488527) (not b!1488545) (not b!1488534) (not b!1488533) (not start!126936))
(check-sat)
