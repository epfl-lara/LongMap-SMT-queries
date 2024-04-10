; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124594 () Bool)

(assert start!124594)

(declare-fun b!1442540 () Bool)

(declare-fun res!974747 () Bool)

(declare-fun e!813026 () Bool)

(assert (=> b!1442540 (=> (not res!974747) (not e!813026))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98042 0))(
  ( (array!98043 (arr!47309 (Array (_ BitVec 32) (_ BitVec 64))) (size!47859 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98042)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442540 (= res!974747 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47859 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47859 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47859 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442541 () Bool)

(declare-fun e!813021 () Bool)

(declare-fun e!813023 () Bool)

(assert (=> b!1442541 (= e!813021 e!813023)))

(declare-fun res!974757 () Bool)

(assert (=> b!1442541 (=> (not res!974757) (not e!813023))))

(declare-datatypes ((SeekEntryResult!11561 0))(
  ( (MissingZero!11561 (index!48636 (_ BitVec 32))) (Found!11561 (index!48637 (_ BitVec 32))) (Intermediate!11561 (undefined!12373 Bool) (index!48638 (_ BitVec 32)) (x!130346 (_ BitVec 32))) (Undefined!11561) (MissingVacant!11561 (index!48639 (_ BitVec 32))) )
))
(declare-fun lt!633590 () SeekEntryResult!11561)

(assert (=> b!1442541 (= res!974757 (= lt!633590 (Intermediate!11561 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633591 () (_ BitVec 64))

(declare-fun lt!633594 () array!98042)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98042 (_ BitVec 32)) SeekEntryResult!11561)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442541 (= lt!633590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633591 mask!2687) lt!633591 lt!633594 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442541 (= lt!633591 (select (store (arr!47309 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!813022 () Bool)

(declare-fun b!1442542 () Bool)

(assert (=> b!1442542 (= e!813022 (or (= (select (arr!47309 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47309 a!2862) intermediateBeforeIndex!19) (select (arr!47309 a!2862) j!93))))))

(declare-fun b!1442543 () Bool)

(declare-fun e!813024 () Bool)

(assert (=> b!1442543 (= e!813024 e!813021)))

(declare-fun res!974754 () Bool)

(assert (=> b!1442543 (=> (not res!974754) (not e!813021))))

(declare-fun lt!633593 () SeekEntryResult!11561)

(assert (=> b!1442543 (= res!974754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47309 a!2862) j!93) mask!2687) (select (arr!47309 a!2862) j!93) a!2862 mask!2687) lt!633593))))

(assert (=> b!1442543 (= lt!633593 (Intermediate!11561 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442544 () Bool)

(declare-fun res!974750 () Bool)

(assert (=> b!1442544 (=> (not res!974750) (not e!813023))))

(assert (=> b!1442544 (= res!974750 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442545 () Bool)

(declare-fun res!974760 () Bool)

(assert (=> b!1442545 (=> (not res!974760) (not e!813026))))

(declare-datatypes ((List!33810 0))(
  ( (Nil!33807) (Cons!33806 (h!35156 (_ BitVec 64)) (t!48504 List!33810)) )
))
(declare-fun arrayNoDuplicates!0 (array!98042 (_ BitVec 32) List!33810) Bool)

(assert (=> b!1442545 (= res!974760 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33807))))

(declare-fun b!1442546 () Bool)

(declare-fun e!813020 () Bool)

(assert (=> b!1442546 (= e!813020 (= lt!633590 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633591 lt!633594 mask!2687)))))

(declare-fun b!1442547 () Bool)

(declare-fun res!974748 () Bool)

(assert (=> b!1442547 (=> (not res!974748) (not e!813026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442547 (= res!974748 (validKeyInArray!0 (select (arr!47309 a!2862) j!93)))))

(declare-fun b!1442548 () Bool)

(declare-fun res!974756 () Bool)

(assert (=> b!1442548 (=> (not res!974756) (not e!813026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98042 (_ BitVec 32)) Bool)

(assert (=> b!1442548 (= res!974756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442549 () Bool)

(assert (=> b!1442549 (= e!813023 (not true))))

(assert (=> b!1442549 e!813022))

(declare-fun res!974755 () Bool)

(assert (=> b!1442549 (=> (not res!974755) (not e!813022))))

(assert (=> b!1442549 (= res!974755 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48618 0))(
  ( (Unit!48619) )
))
(declare-fun lt!633592 () Unit!48618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48618)

(assert (=> b!1442549 (= lt!633592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442550 () Bool)

(declare-fun res!974758 () Bool)

(assert (=> b!1442550 (=> (not res!974758) (not e!813026))))

(assert (=> b!1442550 (= res!974758 (and (= (size!47859 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47859 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47859 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442551 () Bool)

(assert (=> b!1442551 (= e!813026 e!813024)))

(declare-fun res!974759 () Bool)

(assert (=> b!1442551 (=> (not res!974759) (not e!813024))))

(assert (=> b!1442551 (= res!974759 (= (select (store (arr!47309 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442551 (= lt!633594 (array!98043 (store (arr!47309 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47859 a!2862)))))

(declare-fun b!1442552 () Bool)

(declare-fun res!974752 () Bool)

(assert (=> b!1442552 (=> (not res!974752) (not e!813026))))

(assert (=> b!1442552 (= res!974752 (validKeyInArray!0 (select (arr!47309 a!2862) i!1006)))))

(declare-fun b!1442553 () Bool)

(declare-fun res!974749 () Bool)

(assert (=> b!1442553 (=> (not res!974749) (not e!813022))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98042 (_ BitVec 32)) SeekEntryResult!11561)

(assert (=> b!1442553 (= res!974749 (= (seekEntryOrOpen!0 (select (arr!47309 a!2862) j!93) a!2862 mask!2687) (Found!11561 j!93)))))

(declare-fun b!1442554 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98042 (_ BitVec 32)) SeekEntryResult!11561)

(assert (=> b!1442554 (= e!813020 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633591 lt!633594 mask!2687) (seekEntryOrOpen!0 lt!633591 lt!633594 mask!2687)))))

(declare-fun b!1442555 () Bool)

(declare-fun res!974751 () Bool)

(assert (=> b!1442555 (=> (not res!974751) (not e!813021))))

(assert (=> b!1442555 (= res!974751 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47309 a!2862) j!93) a!2862 mask!2687) lt!633593))))

(declare-fun b!1442556 () Bool)

(declare-fun res!974761 () Bool)

(assert (=> b!1442556 (=> (not res!974761) (not e!813023))))

(assert (=> b!1442556 (= res!974761 e!813020)))

(declare-fun c!133407 () Bool)

(assert (=> b!1442556 (= c!133407 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!974753 () Bool)

(assert (=> start!124594 (=> (not res!974753) (not e!813026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124594 (= res!974753 (validMask!0 mask!2687))))

(assert (=> start!124594 e!813026))

(assert (=> start!124594 true))

(declare-fun array_inv!36337 (array!98042) Bool)

(assert (=> start!124594 (array_inv!36337 a!2862)))

(assert (= (and start!124594 res!974753) b!1442550))

(assert (= (and b!1442550 res!974758) b!1442552))

(assert (= (and b!1442552 res!974752) b!1442547))

(assert (= (and b!1442547 res!974748) b!1442548))

(assert (= (and b!1442548 res!974756) b!1442545))

(assert (= (and b!1442545 res!974760) b!1442540))

(assert (= (and b!1442540 res!974747) b!1442551))

(assert (= (and b!1442551 res!974759) b!1442543))

(assert (= (and b!1442543 res!974754) b!1442555))

(assert (= (and b!1442555 res!974751) b!1442541))

(assert (= (and b!1442541 res!974757) b!1442556))

(assert (= (and b!1442556 c!133407) b!1442546))

(assert (= (and b!1442556 (not c!133407)) b!1442554))

(assert (= (and b!1442556 res!974761) b!1442544))

(assert (= (and b!1442544 res!974750) b!1442549))

(assert (= (and b!1442549 res!974755) b!1442553))

(assert (= (and b!1442553 res!974749) b!1442542))

(declare-fun m!1331683 () Bool)

(assert (=> b!1442542 m!1331683))

(declare-fun m!1331685 () Bool)

(assert (=> b!1442542 m!1331685))

(declare-fun m!1331687 () Bool)

(assert (=> b!1442551 m!1331687))

(declare-fun m!1331689 () Bool)

(assert (=> b!1442551 m!1331689))

(assert (=> b!1442543 m!1331685))

(assert (=> b!1442543 m!1331685))

(declare-fun m!1331691 () Bool)

(assert (=> b!1442543 m!1331691))

(assert (=> b!1442543 m!1331691))

(assert (=> b!1442543 m!1331685))

(declare-fun m!1331693 () Bool)

(assert (=> b!1442543 m!1331693))

(declare-fun m!1331695 () Bool)

(assert (=> start!124594 m!1331695))

(declare-fun m!1331697 () Bool)

(assert (=> start!124594 m!1331697))

(declare-fun m!1331699 () Bool)

(assert (=> b!1442554 m!1331699))

(declare-fun m!1331701 () Bool)

(assert (=> b!1442554 m!1331701))

(declare-fun m!1331703 () Bool)

(assert (=> b!1442549 m!1331703))

(declare-fun m!1331705 () Bool)

(assert (=> b!1442549 m!1331705))

(assert (=> b!1442553 m!1331685))

(assert (=> b!1442553 m!1331685))

(declare-fun m!1331707 () Bool)

(assert (=> b!1442553 m!1331707))

(assert (=> b!1442555 m!1331685))

(assert (=> b!1442555 m!1331685))

(declare-fun m!1331709 () Bool)

(assert (=> b!1442555 m!1331709))

(declare-fun m!1331711 () Bool)

(assert (=> b!1442541 m!1331711))

(assert (=> b!1442541 m!1331711))

(declare-fun m!1331713 () Bool)

(assert (=> b!1442541 m!1331713))

(assert (=> b!1442541 m!1331687))

(declare-fun m!1331715 () Bool)

(assert (=> b!1442541 m!1331715))

(declare-fun m!1331717 () Bool)

(assert (=> b!1442548 m!1331717))

(assert (=> b!1442547 m!1331685))

(assert (=> b!1442547 m!1331685))

(declare-fun m!1331719 () Bool)

(assert (=> b!1442547 m!1331719))

(declare-fun m!1331721 () Bool)

(assert (=> b!1442552 m!1331721))

(assert (=> b!1442552 m!1331721))

(declare-fun m!1331723 () Bool)

(assert (=> b!1442552 m!1331723))

(declare-fun m!1331725 () Bool)

(assert (=> b!1442545 m!1331725))

(declare-fun m!1331727 () Bool)

(assert (=> b!1442546 m!1331727))

(push 1)

