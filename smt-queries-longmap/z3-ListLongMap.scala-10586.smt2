; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124872 () Bool)

(assert start!124872)

(declare-fun b!1445442 () Bool)

(declare-fun res!976646 () Bool)

(declare-fun e!814538 () Bool)

(assert (=> b!1445442 (=> (not res!976646) (not e!814538))))

(declare-datatypes ((array!98215 0))(
  ( (array!98216 (arr!47392 (Array (_ BitVec 32) (_ BitVec 64))) (size!47943 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98215)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445442 (= res!976646 (validKeyInArray!0 (select (arr!47392 a!2862) j!93)))))

(declare-fun b!1445443 () Bool)

(declare-fun e!814536 () Bool)

(declare-fun e!814533 () Bool)

(assert (=> b!1445443 (= e!814536 e!814533)))

(declare-fun res!976645 () Bool)

(assert (=> b!1445443 (=> (not res!976645) (not e!814533))))

(declare-datatypes ((SeekEntryResult!11541 0))(
  ( (MissingZero!11541 (index!48556 (_ BitVec 32))) (Found!11541 (index!48557 (_ BitVec 32))) (Intermediate!11541 (undefined!12353 Bool) (index!48558 (_ BitVec 32)) (x!130430 (_ BitVec 32))) (Undefined!11541) (MissingVacant!11541 (index!48559 (_ BitVec 32))) )
))
(declare-fun lt!634565 () SeekEntryResult!11541)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445443 (= res!976645 (= lt!634565 (Intermediate!11541 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634570 () array!98215)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634568 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98215 (_ BitVec 32)) SeekEntryResult!11541)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445443 (= lt!634565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634568 mask!2687) lt!634568 lt!634570 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445443 (= lt!634568 (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445444 () Bool)

(declare-fun res!976654 () Bool)

(assert (=> b!1445444 (=> (not res!976654) (not e!814538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98215 (_ BitVec 32)) Bool)

(assert (=> b!1445444 (= res!976654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445445 () Bool)

(declare-fun res!976648 () Bool)

(assert (=> b!1445445 (=> (not res!976648) (not e!814533))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445445 (= res!976648 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445446 () Bool)

(declare-fun e!814534 () Bool)

(assert (=> b!1445446 (= e!814534 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1445447 () Bool)

(assert (=> b!1445447 (= e!814533 (not e!814534))))

(declare-fun res!976655 () Bool)

(assert (=> b!1445447 (=> res!976655 e!814534)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1445447 (= res!976655 (or (not (= (select (arr!47392 a!2862) index!646) (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47392 a!2862) index!646) (select (arr!47392 a!2862) j!93)))))))

(declare-fun lt!634569 () SeekEntryResult!11541)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445447 (and (= lt!634569 (Found!11541 j!93)) (or (= (select (arr!47392 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47392 a!2862) intermediateBeforeIndex!19) (select (arr!47392 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98215 (_ BitVec 32)) SeekEntryResult!11541)

(assert (=> b!1445447 (= lt!634569 (seekEntryOrOpen!0 (select (arr!47392 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1445447 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48611 0))(
  ( (Unit!48612) )
))
(declare-fun lt!634567 () Unit!48611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48611)

(assert (=> b!1445447 (= lt!634567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445448 () Bool)

(declare-fun res!976653 () Bool)

(assert (=> b!1445448 (=> (not res!976653) (not e!814533))))

(declare-fun e!814539 () Bool)

(assert (=> b!1445448 (= res!976653 e!814539)))

(declare-fun c!133918 () Bool)

(assert (=> b!1445448 (= c!133918 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445449 () Bool)

(declare-fun e!814537 () Bool)

(assert (=> b!1445449 (= e!814538 e!814537)))

(declare-fun res!976649 () Bool)

(assert (=> b!1445449 (=> (not res!976649) (not e!814537))))

(assert (=> b!1445449 (= res!976649 (= (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445449 (= lt!634570 (array!98216 (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47943 a!2862)))))

(declare-fun b!1445450 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98215 (_ BitVec 32)) SeekEntryResult!11541)

(assert (=> b!1445450 (= e!814539 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634568 lt!634570 mask!2687) (seekEntryOrOpen!0 lt!634568 lt!634570 mask!2687)))))

(declare-fun b!1445451 () Bool)

(declare-fun res!976658 () Bool)

(assert (=> b!1445451 (=> (not res!976658) (not e!814538))))

(assert (=> b!1445451 (= res!976658 (and (= (size!47943 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47943 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47943 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445452 () Bool)

(assert (=> b!1445452 (= e!814537 e!814536)))

(declare-fun res!976650 () Bool)

(assert (=> b!1445452 (=> (not res!976650) (not e!814536))))

(declare-fun lt!634566 () SeekEntryResult!11541)

(assert (=> b!1445452 (= res!976650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47392 a!2862) j!93) mask!2687) (select (arr!47392 a!2862) j!93) a!2862 mask!2687) lt!634566))))

(assert (=> b!1445452 (= lt!634566 (Intermediate!11541 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445453 () Bool)

(declare-fun res!976652 () Bool)

(assert (=> b!1445453 (=> (not res!976652) (not e!814538))))

(assert (=> b!1445453 (= res!976652 (validKeyInArray!0 (select (arr!47392 a!2862) i!1006)))))

(declare-fun res!976657 () Bool)

(assert (=> start!124872 (=> (not res!976657) (not e!814538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124872 (= res!976657 (validMask!0 mask!2687))))

(assert (=> start!124872 e!814538))

(assert (=> start!124872 true))

(declare-fun array_inv!36673 (array!98215) Bool)

(assert (=> start!124872 (array_inv!36673 a!2862)))

(declare-fun b!1445454 () Bool)

(declare-fun res!976651 () Bool)

(assert (=> b!1445454 (=> (not res!976651) (not e!814538))))

(declare-datatypes ((List!33880 0))(
  ( (Nil!33877) (Cons!33876 (h!35237 (_ BitVec 64)) (t!48566 List!33880)) )
))
(declare-fun arrayNoDuplicates!0 (array!98215 (_ BitVec 32) List!33880) Bool)

(assert (=> b!1445454 (= res!976651 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33877))))

(declare-fun b!1445455 () Bool)

(declare-fun res!976647 () Bool)

(assert (=> b!1445455 (=> res!976647 e!814534)))

(assert (=> b!1445455 (= res!976647 (not (= lt!634569 (seekEntryOrOpen!0 lt!634568 lt!634570 mask!2687))))))

(declare-fun b!1445456 () Bool)

(declare-fun res!976656 () Bool)

(assert (=> b!1445456 (=> (not res!976656) (not e!814538))))

(assert (=> b!1445456 (= res!976656 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47943 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47943 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47943 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445457 () Bool)

(assert (=> b!1445457 (= e!814539 (= lt!634565 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634568 lt!634570 mask!2687)))))

(declare-fun b!1445458 () Bool)

(declare-fun res!976644 () Bool)

(assert (=> b!1445458 (=> (not res!976644) (not e!814536))))

(assert (=> b!1445458 (= res!976644 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47392 a!2862) j!93) a!2862 mask!2687) lt!634566))))

(assert (= (and start!124872 res!976657) b!1445451))

(assert (= (and b!1445451 res!976658) b!1445453))

(assert (= (and b!1445453 res!976652) b!1445442))

(assert (= (and b!1445442 res!976646) b!1445444))

(assert (= (and b!1445444 res!976654) b!1445454))

(assert (= (and b!1445454 res!976651) b!1445456))

(assert (= (and b!1445456 res!976656) b!1445449))

(assert (= (and b!1445449 res!976649) b!1445452))

(assert (= (and b!1445452 res!976650) b!1445458))

(assert (= (and b!1445458 res!976644) b!1445443))

(assert (= (and b!1445443 res!976645) b!1445448))

(assert (= (and b!1445448 c!133918) b!1445457))

(assert (= (and b!1445448 (not c!133918)) b!1445450))

(assert (= (and b!1445448 res!976653) b!1445445))

(assert (= (and b!1445445 res!976648) b!1445447))

(assert (= (and b!1445447 (not res!976655)) b!1445455))

(assert (= (and b!1445455 (not res!976647)) b!1445446))

(declare-fun m!1334593 () Bool)

(assert (=> b!1445453 m!1334593))

(assert (=> b!1445453 m!1334593))

(declare-fun m!1334595 () Bool)

(assert (=> b!1445453 m!1334595))

(declare-fun m!1334597 () Bool)

(assert (=> b!1445450 m!1334597))

(declare-fun m!1334599 () Bool)

(assert (=> b!1445450 m!1334599))

(assert (=> b!1445455 m!1334599))

(declare-fun m!1334601 () Bool)

(assert (=> b!1445443 m!1334601))

(assert (=> b!1445443 m!1334601))

(declare-fun m!1334603 () Bool)

(assert (=> b!1445443 m!1334603))

(declare-fun m!1334605 () Bool)

(assert (=> b!1445443 m!1334605))

(declare-fun m!1334607 () Bool)

(assert (=> b!1445443 m!1334607))

(declare-fun m!1334609 () Bool)

(assert (=> b!1445442 m!1334609))

(assert (=> b!1445442 m!1334609))

(declare-fun m!1334611 () Bool)

(assert (=> b!1445442 m!1334611))

(declare-fun m!1334613 () Bool)

(assert (=> b!1445454 m!1334613))

(assert (=> b!1445452 m!1334609))

(assert (=> b!1445452 m!1334609))

(declare-fun m!1334615 () Bool)

(assert (=> b!1445452 m!1334615))

(assert (=> b!1445452 m!1334615))

(assert (=> b!1445452 m!1334609))

(declare-fun m!1334617 () Bool)

(assert (=> b!1445452 m!1334617))

(declare-fun m!1334619 () Bool)

(assert (=> b!1445444 m!1334619))

(declare-fun m!1334621 () Bool)

(assert (=> b!1445447 m!1334621))

(assert (=> b!1445447 m!1334605))

(declare-fun m!1334623 () Bool)

(assert (=> b!1445447 m!1334623))

(declare-fun m!1334625 () Bool)

(assert (=> b!1445447 m!1334625))

(declare-fun m!1334627 () Bool)

(assert (=> b!1445447 m!1334627))

(assert (=> b!1445447 m!1334609))

(declare-fun m!1334629 () Bool)

(assert (=> b!1445447 m!1334629))

(declare-fun m!1334631 () Bool)

(assert (=> b!1445447 m!1334631))

(assert (=> b!1445447 m!1334609))

(declare-fun m!1334633 () Bool)

(assert (=> start!124872 m!1334633))

(declare-fun m!1334635 () Bool)

(assert (=> start!124872 m!1334635))

(assert (=> b!1445449 m!1334605))

(declare-fun m!1334637 () Bool)

(assert (=> b!1445449 m!1334637))

(assert (=> b!1445458 m!1334609))

(assert (=> b!1445458 m!1334609))

(declare-fun m!1334639 () Bool)

(assert (=> b!1445458 m!1334639))

(declare-fun m!1334641 () Bool)

(assert (=> b!1445457 m!1334641))

(check-sat (not b!1445452) (not b!1445455) (not b!1445444) (not b!1445454) (not b!1445447) (not b!1445453) (not b!1445443) (not b!1445457) (not b!1445450) (not start!124872) (not b!1445458) (not b!1445442))
(check-sat)
