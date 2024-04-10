; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124716 () Bool)

(assert start!124716)

(declare-fun b!1445714 () Bool)

(declare-fun res!977557 () Bool)

(declare-fun e!814355 () Bool)

(assert (=> b!1445714 (=> (not res!977557) (not e!814355))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445714 (= res!977557 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!814360 () Bool)

(declare-fun b!1445715 () Bool)

(declare-datatypes ((array!98164 0))(
  ( (array!98165 (arr!47370 (Array (_ BitVec 32) (_ BitVec 64))) (size!47920 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98164)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445715 (= e!814360 (or (= (select (arr!47370 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47370 a!2862) intermediateBeforeIndex!19) (select (arr!47370 a!2862) j!93))))))

(declare-fun b!1445716 () Bool)

(declare-fun res!977568 () Bool)

(assert (=> b!1445716 (=> (not res!977568) (not e!814360))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11622 0))(
  ( (MissingZero!11622 (index!48880 (_ BitVec 32))) (Found!11622 (index!48881 (_ BitVec 32))) (Intermediate!11622 (undefined!12434 Bool) (index!48882 (_ BitVec 32)) (x!130567 (_ BitVec 32))) (Undefined!11622) (MissingVacant!11622 (index!48883 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98164 (_ BitVec 32)) SeekEntryResult!11622)

(assert (=> b!1445716 (= res!977568 (= (seekEntryOrOpen!0 (select (arr!47370 a!2862) j!93) a!2862 mask!2687) (Found!11622 j!93)))))

(declare-fun b!1445717 () Bool)

(declare-fun res!977569 () Bool)

(declare-fun e!814359 () Bool)

(assert (=> b!1445717 (=> (not res!977569) (not e!814359))))

(declare-datatypes ((List!33871 0))(
  ( (Nil!33868) (Cons!33867 (h!35217 (_ BitVec 64)) (t!48565 List!33871)) )
))
(declare-fun arrayNoDuplicates!0 (array!98164 (_ BitVec 32) List!33871) Bool)

(assert (=> b!1445717 (= res!977569 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33868))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1445718 () Bool)

(assert (=> b!1445718 (= e!814355 (not (or (and (= (select (arr!47370 a!2862) index!646) (select (store (arr!47370 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47370 a!2862) index!646) (select (arr!47370 a!2862) j!93))) (not (= (select (arr!47370 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1445718 e!814360))

(declare-fun res!977561 () Bool)

(assert (=> b!1445718 (=> (not res!977561) (not e!814360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98164 (_ BitVec 32)) Bool)

(assert (=> b!1445718 (= res!977561 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48740 0))(
  ( (Unit!48741) )
))
(declare-fun lt!634580 () Unit!48740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48740)

(assert (=> b!1445718 (= lt!634580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445719 () Bool)

(declare-fun e!814358 () Bool)

(assert (=> b!1445719 (= e!814359 e!814358)))

(declare-fun res!977563 () Bool)

(assert (=> b!1445719 (=> (not res!977563) (not e!814358))))

(assert (=> b!1445719 (= res!977563 (= (select (store (arr!47370 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634577 () array!98164)

(assert (=> b!1445719 (= lt!634577 (array!98165 (store (arr!47370 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47920 a!2862)))))

(declare-fun b!1445721 () Bool)

(declare-fun res!977558 () Bool)

(assert (=> b!1445721 (=> (not res!977558) (not e!814359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445721 (= res!977558 (validKeyInArray!0 (select (arr!47370 a!2862) i!1006)))))

(declare-fun b!1445722 () Bool)

(declare-fun e!814361 () Bool)

(assert (=> b!1445722 (= e!814361 e!814355)))

(declare-fun res!977559 () Bool)

(assert (=> b!1445722 (=> (not res!977559) (not e!814355))))

(declare-fun lt!634579 () SeekEntryResult!11622)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445722 (= res!977559 (= lt!634579 (Intermediate!11622 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634578 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98164 (_ BitVec 32)) SeekEntryResult!11622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445722 (= lt!634579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634578 mask!2687) lt!634578 lt!634577 mask!2687))))

(assert (=> b!1445722 (= lt!634578 (select (store (arr!47370 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445723 () Bool)

(declare-fun res!977562 () Bool)

(assert (=> b!1445723 (=> (not res!977562) (not e!814361))))

(declare-fun lt!634581 () SeekEntryResult!11622)

(assert (=> b!1445723 (= res!977562 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47370 a!2862) j!93) a!2862 mask!2687) lt!634581))))

(declare-fun b!1445724 () Bool)

(declare-fun e!814356 () Bool)

(assert (=> b!1445724 (= e!814356 (= lt!634579 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634578 lt!634577 mask!2687)))))

(declare-fun b!1445725 () Bool)

(declare-fun res!977564 () Bool)

(assert (=> b!1445725 (=> (not res!977564) (not e!814355))))

(assert (=> b!1445725 (= res!977564 e!814356)))

(declare-fun c!133590 () Bool)

(assert (=> b!1445725 (= c!133590 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445726 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98164 (_ BitVec 32)) SeekEntryResult!11622)

(assert (=> b!1445726 (= e!814356 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634578 lt!634577 mask!2687) (seekEntryOrOpen!0 lt!634578 lt!634577 mask!2687)))))

(declare-fun b!1445727 () Bool)

(declare-fun res!977555 () Bool)

(assert (=> b!1445727 (=> (not res!977555) (not e!814359))))

(assert (=> b!1445727 (= res!977555 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47920 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47920 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47920 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445728 () Bool)

(assert (=> b!1445728 (= e!814358 e!814361)))

(declare-fun res!977556 () Bool)

(assert (=> b!1445728 (=> (not res!977556) (not e!814361))))

(assert (=> b!1445728 (= res!977556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47370 a!2862) j!93) mask!2687) (select (arr!47370 a!2862) j!93) a!2862 mask!2687) lt!634581))))

(assert (=> b!1445728 (= lt!634581 (Intermediate!11622 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445729 () Bool)

(declare-fun res!977560 () Bool)

(assert (=> b!1445729 (=> (not res!977560) (not e!814359))))

(assert (=> b!1445729 (= res!977560 (and (= (size!47920 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47920 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47920 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445730 () Bool)

(declare-fun res!977567 () Bool)

(assert (=> b!1445730 (=> (not res!977567) (not e!814359))))

(assert (=> b!1445730 (= res!977567 (validKeyInArray!0 (select (arr!47370 a!2862) j!93)))))

(declare-fun res!977566 () Bool)

(assert (=> start!124716 (=> (not res!977566) (not e!814359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124716 (= res!977566 (validMask!0 mask!2687))))

(assert (=> start!124716 e!814359))

(assert (=> start!124716 true))

(declare-fun array_inv!36398 (array!98164) Bool)

(assert (=> start!124716 (array_inv!36398 a!2862)))

(declare-fun b!1445720 () Bool)

(declare-fun res!977565 () Bool)

(assert (=> b!1445720 (=> (not res!977565) (not e!814359))))

(assert (=> b!1445720 (= res!977565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124716 res!977566) b!1445729))

(assert (= (and b!1445729 res!977560) b!1445721))

(assert (= (and b!1445721 res!977558) b!1445730))

(assert (= (and b!1445730 res!977567) b!1445720))

(assert (= (and b!1445720 res!977565) b!1445717))

(assert (= (and b!1445717 res!977569) b!1445727))

(assert (= (and b!1445727 res!977555) b!1445719))

(assert (= (and b!1445719 res!977563) b!1445728))

(assert (= (and b!1445728 res!977556) b!1445723))

(assert (= (and b!1445723 res!977562) b!1445722))

(assert (= (and b!1445722 res!977559) b!1445725))

(assert (= (and b!1445725 c!133590) b!1445724))

(assert (= (and b!1445725 (not c!133590)) b!1445726))

(assert (= (and b!1445725 res!977564) b!1445714))

(assert (= (and b!1445714 res!977557) b!1445718))

(assert (= (and b!1445718 res!977561) b!1445716))

(assert (= (and b!1445716 res!977568) b!1445715))

(declare-fun m!1334649 () Bool)

(assert (=> start!124716 m!1334649))

(declare-fun m!1334651 () Bool)

(assert (=> start!124716 m!1334651))

(declare-fun m!1334653 () Bool)

(assert (=> b!1445723 m!1334653))

(assert (=> b!1445723 m!1334653))

(declare-fun m!1334655 () Bool)

(assert (=> b!1445723 m!1334655))

(declare-fun m!1334657 () Bool)

(assert (=> b!1445722 m!1334657))

(assert (=> b!1445722 m!1334657))

(declare-fun m!1334659 () Bool)

(assert (=> b!1445722 m!1334659))

(declare-fun m!1334661 () Bool)

(assert (=> b!1445722 m!1334661))

(declare-fun m!1334663 () Bool)

(assert (=> b!1445722 m!1334663))

(declare-fun m!1334665 () Bool)

(assert (=> b!1445724 m!1334665))

(assert (=> b!1445728 m!1334653))

(assert (=> b!1445728 m!1334653))

(declare-fun m!1334667 () Bool)

(assert (=> b!1445728 m!1334667))

(assert (=> b!1445728 m!1334667))

(assert (=> b!1445728 m!1334653))

(declare-fun m!1334669 () Bool)

(assert (=> b!1445728 m!1334669))

(declare-fun m!1334671 () Bool)

(assert (=> b!1445726 m!1334671))

(declare-fun m!1334673 () Bool)

(assert (=> b!1445726 m!1334673))

(declare-fun m!1334675 () Bool)

(assert (=> b!1445721 m!1334675))

(assert (=> b!1445721 m!1334675))

(declare-fun m!1334677 () Bool)

(assert (=> b!1445721 m!1334677))

(assert (=> b!1445719 m!1334661))

(declare-fun m!1334679 () Bool)

(assert (=> b!1445719 m!1334679))

(assert (=> b!1445716 m!1334653))

(assert (=> b!1445716 m!1334653))

(declare-fun m!1334681 () Bool)

(assert (=> b!1445716 m!1334681))

(declare-fun m!1334683 () Bool)

(assert (=> b!1445718 m!1334683))

(assert (=> b!1445718 m!1334661))

(declare-fun m!1334685 () Bool)

(assert (=> b!1445718 m!1334685))

(declare-fun m!1334687 () Bool)

(assert (=> b!1445718 m!1334687))

(declare-fun m!1334689 () Bool)

(assert (=> b!1445718 m!1334689))

(assert (=> b!1445718 m!1334653))

(assert (=> b!1445730 m!1334653))

(assert (=> b!1445730 m!1334653))

(declare-fun m!1334691 () Bool)

(assert (=> b!1445730 m!1334691))

(declare-fun m!1334693 () Bool)

(assert (=> b!1445715 m!1334693))

(assert (=> b!1445715 m!1334653))

(declare-fun m!1334695 () Bool)

(assert (=> b!1445717 m!1334695))

(declare-fun m!1334697 () Bool)

(assert (=> b!1445720 m!1334697))

(check-sat (not b!1445726) (not start!124716) (not b!1445728) (not b!1445717) (not b!1445724) (not b!1445730) (not b!1445716) (not b!1445718) (not b!1445720) (not b!1445721) (not b!1445723) (not b!1445722))
(check-sat)
