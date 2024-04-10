; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124714 () Bool)

(assert start!124714)

(declare-fun b!1445663 () Bool)

(declare-fun e!814334 () Bool)

(declare-fun e!814339 () Bool)

(assert (=> b!1445663 (= e!814334 e!814339)))

(declare-fun res!977518 () Bool)

(assert (=> b!1445663 (=> (not res!977518) (not e!814339))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98162 0))(
  ( (array!98163 (arr!47369 (Array (_ BitVec 32) (_ BitVec 64))) (size!47919 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98162)

(assert (=> b!1445663 (= res!977518 (= (select (store (arr!47369 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634566 () array!98162)

(assert (=> b!1445663 (= lt!634566 (array!98163 (store (arr!47369 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47919 a!2862)))))

(declare-fun b!1445664 () Bool)

(declare-fun res!977521 () Bool)

(declare-fun e!814338 () Bool)

(assert (=> b!1445664 (=> (not res!977521) (not e!814338))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11621 0))(
  ( (MissingZero!11621 (index!48876 (_ BitVec 32))) (Found!11621 (index!48877 (_ BitVec 32))) (Intermediate!11621 (undefined!12433 Bool) (index!48878 (_ BitVec 32)) (x!130566 (_ BitVec 32))) (Undefined!11621) (MissingVacant!11621 (index!48879 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98162 (_ BitVec 32)) SeekEntryResult!11621)

(assert (=> b!1445664 (= res!977521 (= (seekEntryOrOpen!0 (select (arr!47369 a!2862) j!93) a!2862 mask!2687) (Found!11621 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1445665 () Bool)

(assert (=> b!1445665 (= e!814338 (or (= (select (arr!47369 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47369 a!2862) intermediateBeforeIndex!19) (select (arr!47369 a!2862) j!93))))))

(declare-fun b!1445666 () Bool)

(declare-fun res!977510 () Bool)

(declare-fun e!814337 () Bool)

(assert (=> b!1445666 (=> (not res!977510) (not e!814337))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634563 () SeekEntryResult!11621)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98162 (_ BitVec 32)) SeekEntryResult!11621)

(assert (=> b!1445666 (= res!977510 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47369 a!2862) j!93) a!2862 mask!2687) lt!634563))))

(declare-fun b!1445667 () Bool)

(declare-fun res!977520 () Bool)

(assert (=> b!1445667 (=> (not res!977520) (not e!814334))))

(assert (=> b!1445667 (= res!977520 (and (= (size!47919 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47919 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47919 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445668 () Bool)

(declare-fun res!977512 () Bool)

(assert (=> b!1445668 (=> (not res!977512) (not e!814334))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445668 (= res!977512 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47919 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47919 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47919 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445669 () Bool)

(declare-fun e!814340 () Bool)

(assert (=> b!1445669 (= e!814340 (not (or (and (= (select (arr!47369 a!2862) index!646) (select (store (arr!47369 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47369 a!2862) index!646) (select (arr!47369 a!2862) j!93))) (not (= (select (arr!47369 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1445669 e!814338))

(declare-fun res!977523 () Bool)

(assert (=> b!1445669 (=> (not res!977523) (not e!814338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98162 (_ BitVec 32)) Bool)

(assert (=> b!1445669 (= res!977523 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48738 0))(
  ( (Unit!48739) )
))
(declare-fun lt!634562 () Unit!48738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48738)

(assert (=> b!1445669 (= lt!634562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445670 () Bool)

(declare-fun res!977514 () Bool)

(assert (=> b!1445670 (=> (not res!977514) (not e!814334))))

(declare-datatypes ((List!33870 0))(
  ( (Nil!33867) (Cons!33866 (h!35216 (_ BitVec 64)) (t!48564 List!33870)) )
))
(declare-fun arrayNoDuplicates!0 (array!98162 (_ BitVec 32) List!33870) Bool)

(assert (=> b!1445670 (= res!977514 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33867))))

(declare-fun b!1445672 () Bool)

(declare-fun res!977515 () Bool)

(assert (=> b!1445672 (=> (not res!977515) (not e!814334))))

(assert (=> b!1445672 (= res!977515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!634565 () (_ BitVec 64))

(declare-fun b!1445673 () Bool)

(declare-fun e!814336 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98162 (_ BitVec 32)) SeekEntryResult!11621)

(assert (=> b!1445673 (= e!814336 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634565 lt!634566 mask!2687) (seekEntryOrOpen!0 lt!634565 lt!634566 mask!2687)))))

(declare-fun b!1445674 () Bool)

(declare-fun res!977513 () Bool)

(assert (=> b!1445674 (=> (not res!977513) (not e!814340))))

(assert (=> b!1445674 (= res!977513 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445675 () Bool)

(declare-fun res!977516 () Bool)

(assert (=> b!1445675 (=> (not res!977516) (not e!814334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445675 (= res!977516 (validKeyInArray!0 (select (arr!47369 a!2862) i!1006)))))

(declare-fun b!1445676 () Bool)

(declare-fun res!977517 () Bool)

(assert (=> b!1445676 (=> (not res!977517) (not e!814334))))

(assert (=> b!1445676 (= res!977517 (validKeyInArray!0 (select (arr!47369 a!2862) j!93)))))

(declare-fun b!1445677 () Bool)

(assert (=> b!1445677 (= e!814337 e!814340)))

(declare-fun res!977524 () Bool)

(assert (=> b!1445677 (=> (not res!977524) (not e!814340))))

(declare-fun lt!634564 () SeekEntryResult!11621)

(assert (=> b!1445677 (= res!977524 (= lt!634564 (Intermediate!11621 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445677 (= lt!634564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634565 mask!2687) lt!634565 lt!634566 mask!2687))))

(assert (=> b!1445677 (= lt!634565 (select (store (arr!47369 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445678 () Bool)

(assert (=> b!1445678 (= e!814339 e!814337)))

(declare-fun res!977522 () Bool)

(assert (=> b!1445678 (=> (not res!977522) (not e!814337))))

(assert (=> b!1445678 (= res!977522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47369 a!2862) j!93) mask!2687) (select (arr!47369 a!2862) j!93) a!2862 mask!2687) lt!634563))))

(assert (=> b!1445678 (= lt!634563 (Intermediate!11621 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445679 () Bool)

(assert (=> b!1445679 (= e!814336 (= lt!634564 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634565 lt!634566 mask!2687)))))

(declare-fun res!977511 () Bool)

(assert (=> start!124714 (=> (not res!977511) (not e!814334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124714 (= res!977511 (validMask!0 mask!2687))))

(assert (=> start!124714 e!814334))

(assert (=> start!124714 true))

(declare-fun array_inv!36397 (array!98162) Bool)

(assert (=> start!124714 (array_inv!36397 a!2862)))

(declare-fun b!1445671 () Bool)

(declare-fun res!977519 () Bool)

(assert (=> b!1445671 (=> (not res!977519) (not e!814340))))

(assert (=> b!1445671 (= res!977519 e!814336)))

(declare-fun c!133587 () Bool)

(assert (=> b!1445671 (= c!133587 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124714 res!977511) b!1445667))

(assert (= (and b!1445667 res!977520) b!1445675))

(assert (= (and b!1445675 res!977516) b!1445676))

(assert (= (and b!1445676 res!977517) b!1445672))

(assert (= (and b!1445672 res!977515) b!1445670))

(assert (= (and b!1445670 res!977514) b!1445668))

(assert (= (and b!1445668 res!977512) b!1445663))

(assert (= (and b!1445663 res!977518) b!1445678))

(assert (= (and b!1445678 res!977522) b!1445666))

(assert (= (and b!1445666 res!977510) b!1445677))

(assert (= (and b!1445677 res!977524) b!1445671))

(assert (= (and b!1445671 c!133587) b!1445679))

(assert (= (and b!1445671 (not c!133587)) b!1445673))

(assert (= (and b!1445671 res!977519) b!1445674))

(assert (= (and b!1445674 res!977513) b!1445669))

(assert (= (and b!1445669 res!977523) b!1445664))

(assert (= (and b!1445664 res!977521) b!1445665))

(declare-fun m!1334599 () Bool)

(assert (=> b!1445670 m!1334599))

(declare-fun m!1334601 () Bool)

(assert (=> start!124714 m!1334601))

(declare-fun m!1334603 () Bool)

(assert (=> start!124714 m!1334603))

(declare-fun m!1334605 () Bool)

(assert (=> b!1445677 m!1334605))

(assert (=> b!1445677 m!1334605))

(declare-fun m!1334607 () Bool)

(assert (=> b!1445677 m!1334607))

(declare-fun m!1334609 () Bool)

(assert (=> b!1445677 m!1334609))

(declare-fun m!1334611 () Bool)

(assert (=> b!1445677 m!1334611))

(declare-fun m!1334613 () Bool)

(assert (=> b!1445673 m!1334613))

(declare-fun m!1334615 () Bool)

(assert (=> b!1445673 m!1334615))

(declare-fun m!1334617 () Bool)

(assert (=> b!1445675 m!1334617))

(assert (=> b!1445675 m!1334617))

(declare-fun m!1334619 () Bool)

(assert (=> b!1445675 m!1334619))

(assert (=> b!1445663 m!1334609))

(declare-fun m!1334621 () Bool)

(assert (=> b!1445663 m!1334621))

(declare-fun m!1334623 () Bool)

(assert (=> b!1445665 m!1334623))

(declare-fun m!1334625 () Bool)

(assert (=> b!1445665 m!1334625))

(declare-fun m!1334627 () Bool)

(assert (=> b!1445672 m!1334627))

(declare-fun m!1334629 () Bool)

(assert (=> b!1445679 m!1334629))

(declare-fun m!1334631 () Bool)

(assert (=> b!1445669 m!1334631))

(assert (=> b!1445669 m!1334609))

(declare-fun m!1334633 () Bool)

(assert (=> b!1445669 m!1334633))

(declare-fun m!1334635 () Bool)

(assert (=> b!1445669 m!1334635))

(declare-fun m!1334637 () Bool)

(assert (=> b!1445669 m!1334637))

(assert (=> b!1445669 m!1334625))

(assert (=> b!1445666 m!1334625))

(assert (=> b!1445666 m!1334625))

(declare-fun m!1334639 () Bool)

(assert (=> b!1445666 m!1334639))

(assert (=> b!1445678 m!1334625))

(assert (=> b!1445678 m!1334625))

(declare-fun m!1334641 () Bool)

(assert (=> b!1445678 m!1334641))

(assert (=> b!1445678 m!1334641))

(assert (=> b!1445678 m!1334625))

(declare-fun m!1334643 () Bool)

(assert (=> b!1445678 m!1334643))

(assert (=> b!1445676 m!1334625))

(assert (=> b!1445676 m!1334625))

(declare-fun m!1334645 () Bool)

(assert (=> b!1445676 m!1334645))

(assert (=> b!1445664 m!1334625))

(assert (=> b!1445664 m!1334625))

(declare-fun m!1334647 () Bool)

(assert (=> b!1445664 m!1334647))

(push 1)

(assert (not b!1445664))

(assert (not b!1445669))

(assert (not b!1445677))

(assert (not b!1445666))

(assert (not b!1445676))

(assert (not b!1445670))

(assert (not b!1445672))

(assert (not start!124714))

(assert (not b!1445679))

(assert (not b!1445675))

(assert (not b!1445678))

(assert (not b!1445673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

