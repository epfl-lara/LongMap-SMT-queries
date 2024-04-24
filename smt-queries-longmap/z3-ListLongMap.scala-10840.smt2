; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127164 () Bool)

(assert start!127164)

(declare-fun b!1492442 () Bool)

(declare-fun res!1014602 () Bool)

(declare-fun e!836379 () Bool)

(assert (=> b!1492442 (=> (not res!1014602) (not e!836379))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99775 0))(
  ( (array!99776 (arr!48154 (Array (_ BitVec 32) (_ BitVec 64))) (size!48705 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99775)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492442 (= res!1014602 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48705 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48705 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48705 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492443 () Bool)

(declare-fun e!836378 () Bool)

(declare-fun e!836381 () Bool)

(assert (=> b!1492443 (= e!836378 e!836381)))

(declare-fun res!1014591 () Bool)

(assert (=> b!1492443 (=> (not res!1014591) (not e!836381))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12291 0))(
  ( (MissingZero!12291 (index!51556 (_ BitVec 32))) (Found!12291 (index!51557 (_ BitVec 32))) (Intermediate!12291 (undefined!13103 Bool) (index!51558 (_ BitVec 32)) (x!133332 (_ BitVec 32))) (Undefined!12291) (MissingVacant!12291 (index!51559 (_ BitVec 32))) )
))
(declare-fun lt!650678 () SeekEntryResult!12291)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99775 (_ BitVec 32)) SeekEntryResult!12291)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492443 (= res!1014591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!650678))))

(assert (=> b!1492443 (= lt!650678 (Intermediate!12291 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492444 () Bool)

(declare-fun res!1014593 () Bool)

(declare-fun e!836375 () Bool)

(assert (=> b!1492444 (=> (not res!1014593) (not e!836375))))

(declare-fun e!836382 () Bool)

(assert (=> b!1492444 (= res!1014593 e!836382)))

(declare-fun c!138463 () Bool)

(assert (=> b!1492444 (= c!138463 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!650683 () array!99775)

(declare-fun lt!650682 () SeekEntryResult!12291)

(declare-fun lt!650679 () (_ BitVec 64))

(declare-fun b!1492445 () Bool)

(assert (=> b!1492445 (= e!836382 (= lt!650682 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650679 lt!650683 mask!2687)))))

(declare-fun res!1014605 () Bool)

(assert (=> start!127164 (=> (not res!1014605) (not e!836379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127164 (= res!1014605 (validMask!0 mask!2687))))

(assert (=> start!127164 e!836379))

(assert (=> start!127164 true))

(declare-fun array_inv!37435 (array!99775) Bool)

(assert (=> start!127164 (array_inv!37435 a!2862)))

(declare-fun b!1492446 () Bool)

(declare-fun res!1014603 () Bool)

(assert (=> b!1492446 (=> (not res!1014603) (not e!836379))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1492446 (= res!1014603 (and (= (size!48705 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48705 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48705 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492447 () Bool)

(declare-fun e!836380 () Bool)

(assert (=> b!1492447 (= e!836380 true)))

(declare-fun lt!650681 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492447 (= lt!650681 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1492448 () Bool)

(declare-fun res!1014590 () Bool)

(assert (=> b!1492448 (=> (not res!1014590) (not e!836381))))

(assert (=> b!1492448 (= res!1014590 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!650678))))

(declare-fun b!1492449 () Bool)

(declare-fun e!836377 () Bool)

(assert (=> b!1492449 (= e!836377 (or (= (select (arr!48154 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48154 a!2862) intermediateBeforeIndex!19) (select (arr!48154 a!2862) j!93))))))

(declare-fun b!1492450 () Bool)

(declare-fun res!1014595 () Bool)

(assert (=> b!1492450 (=> (not res!1014595) (not e!836379))))

(declare-datatypes ((List!34642 0))(
  ( (Nil!34639) (Cons!34638 (h!36035 (_ BitVec 64)) (t!49328 List!34642)) )
))
(declare-fun arrayNoDuplicates!0 (array!99775 (_ BitVec 32) List!34642) Bool)

(assert (=> b!1492450 (= res!1014595 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34639))))

(declare-fun b!1492451 () Bool)

(declare-fun res!1014596 () Bool)

(assert (=> b!1492451 (=> (not res!1014596) (not e!836377))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99775 (_ BitVec 32)) SeekEntryResult!12291)

(assert (=> b!1492451 (= res!1014596 (= (seekEntryOrOpen!0 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) (Found!12291 j!93)))))

(declare-fun b!1492452 () Bool)

(declare-fun res!1014600 () Bool)

(assert (=> b!1492452 (=> (not res!1014600) (not e!836379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99775 (_ BitVec 32)) Bool)

(assert (=> b!1492452 (= res!1014600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492453 () Bool)

(assert (=> b!1492453 (= e!836381 e!836375)))

(declare-fun res!1014599 () Bool)

(assert (=> b!1492453 (=> (not res!1014599) (not e!836375))))

(assert (=> b!1492453 (= res!1014599 (= lt!650682 (Intermediate!12291 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1492453 (= lt!650682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650679 mask!2687) lt!650679 lt!650683 mask!2687))))

(assert (=> b!1492453 (= lt!650679 (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492454 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99775 (_ BitVec 32)) SeekEntryResult!12291)

(assert (=> b!1492454 (= e!836382 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650679 lt!650683 mask!2687) (seekEntryOrOpen!0 lt!650679 lt!650683 mask!2687)))))

(declare-fun b!1492455 () Bool)

(declare-fun res!1014594 () Bool)

(assert (=> b!1492455 (=> (not res!1014594) (not e!836375))))

(assert (=> b!1492455 (= res!1014594 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492456 () Bool)

(declare-fun res!1014597 () Bool)

(assert (=> b!1492456 (=> (not res!1014597) (not e!836379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492456 (= res!1014597 (validKeyInArray!0 (select (arr!48154 a!2862) i!1006)))))

(declare-fun b!1492457 () Bool)

(declare-fun res!1014604 () Bool)

(assert (=> b!1492457 (=> (not res!1014604) (not e!836379))))

(assert (=> b!1492457 (= res!1014604 (validKeyInArray!0 (select (arr!48154 a!2862) j!93)))))

(declare-fun b!1492458 () Bool)

(assert (=> b!1492458 (= e!836375 (not e!836380))))

(declare-fun res!1014601 () Bool)

(assert (=> b!1492458 (=> res!1014601 e!836380)))

(assert (=> b!1492458 (= res!1014601 (or (and (= (select (arr!48154 a!2862) index!646) (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48154 a!2862) index!646) (select (arr!48154 a!2862) j!93))) (= (select (arr!48154 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1492458 e!836377))

(declare-fun res!1014598 () Bool)

(assert (=> b!1492458 (=> (not res!1014598) (not e!836377))))

(assert (=> b!1492458 (= res!1014598 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49955 0))(
  ( (Unit!49956) )
))
(declare-fun lt!650680 () Unit!49955)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49955)

(assert (=> b!1492458 (= lt!650680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492459 () Bool)

(assert (=> b!1492459 (= e!836379 e!836378)))

(declare-fun res!1014592 () Bool)

(assert (=> b!1492459 (=> (not res!1014592) (not e!836378))))

(assert (=> b!1492459 (= res!1014592 (= (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492459 (= lt!650683 (array!99776 (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48705 a!2862)))))

(assert (= (and start!127164 res!1014605) b!1492446))

(assert (= (and b!1492446 res!1014603) b!1492456))

(assert (= (and b!1492456 res!1014597) b!1492457))

(assert (= (and b!1492457 res!1014604) b!1492452))

(assert (= (and b!1492452 res!1014600) b!1492450))

(assert (= (and b!1492450 res!1014595) b!1492442))

(assert (= (and b!1492442 res!1014602) b!1492459))

(assert (= (and b!1492459 res!1014592) b!1492443))

(assert (= (and b!1492443 res!1014591) b!1492448))

(assert (= (and b!1492448 res!1014590) b!1492453))

(assert (= (and b!1492453 res!1014599) b!1492444))

(assert (= (and b!1492444 c!138463) b!1492445))

(assert (= (and b!1492444 (not c!138463)) b!1492454))

(assert (= (and b!1492444 res!1014593) b!1492455))

(assert (= (and b!1492455 res!1014594) b!1492458))

(assert (= (and b!1492458 res!1014598) b!1492451))

(assert (= (and b!1492451 res!1014596) b!1492449))

(assert (= (and b!1492458 (not res!1014601)) b!1492447))

(declare-fun m!1376587 () Bool)

(assert (=> b!1492447 m!1376587))

(declare-fun m!1376589 () Bool)

(assert (=> b!1492456 m!1376589))

(assert (=> b!1492456 m!1376589))

(declare-fun m!1376591 () Bool)

(assert (=> b!1492456 m!1376591))

(declare-fun m!1376593 () Bool)

(assert (=> b!1492443 m!1376593))

(assert (=> b!1492443 m!1376593))

(declare-fun m!1376595 () Bool)

(assert (=> b!1492443 m!1376595))

(assert (=> b!1492443 m!1376595))

(assert (=> b!1492443 m!1376593))

(declare-fun m!1376597 () Bool)

(assert (=> b!1492443 m!1376597))

(declare-fun m!1376599 () Bool)

(assert (=> b!1492459 m!1376599))

(declare-fun m!1376601 () Bool)

(assert (=> b!1492459 m!1376601))

(declare-fun m!1376603 () Bool)

(assert (=> b!1492453 m!1376603))

(assert (=> b!1492453 m!1376603))

(declare-fun m!1376605 () Bool)

(assert (=> b!1492453 m!1376605))

(assert (=> b!1492453 m!1376599))

(declare-fun m!1376607 () Bool)

(assert (=> b!1492453 m!1376607))

(declare-fun m!1376609 () Bool)

(assert (=> b!1492454 m!1376609))

(declare-fun m!1376611 () Bool)

(assert (=> b!1492454 m!1376611))

(declare-fun m!1376613 () Bool)

(assert (=> b!1492450 m!1376613))

(declare-fun m!1376615 () Bool)

(assert (=> b!1492452 m!1376615))

(assert (=> b!1492451 m!1376593))

(assert (=> b!1492451 m!1376593))

(declare-fun m!1376617 () Bool)

(assert (=> b!1492451 m!1376617))

(assert (=> b!1492457 m!1376593))

(assert (=> b!1492457 m!1376593))

(declare-fun m!1376619 () Bool)

(assert (=> b!1492457 m!1376619))

(declare-fun m!1376621 () Bool)

(assert (=> b!1492449 m!1376621))

(assert (=> b!1492449 m!1376593))

(declare-fun m!1376623 () Bool)

(assert (=> b!1492458 m!1376623))

(assert (=> b!1492458 m!1376599))

(declare-fun m!1376625 () Bool)

(assert (=> b!1492458 m!1376625))

(declare-fun m!1376627 () Bool)

(assert (=> b!1492458 m!1376627))

(declare-fun m!1376629 () Bool)

(assert (=> b!1492458 m!1376629))

(assert (=> b!1492458 m!1376593))

(declare-fun m!1376631 () Bool)

(assert (=> b!1492445 m!1376631))

(declare-fun m!1376633 () Bool)

(assert (=> start!127164 m!1376633))

(declare-fun m!1376635 () Bool)

(assert (=> start!127164 m!1376635))

(assert (=> b!1492448 m!1376593))

(assert (=> b!1492448 m!1376593))

(declare-fun m!1376637 () Bool)

(assert (=> b!1492448 m!1376637))

(check-sat (not b!1492448) (not b!1492452) (not b!1492453) (not b!1492457) (not start!127164) (not b!1492447) (not b!1492451) (not b!1492458) (not b!1492456) (not b!1492454) (not b!1492445) (not b!1492450) (not b!1492443))
(check-sat)
