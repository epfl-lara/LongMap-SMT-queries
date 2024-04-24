; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124956 () Bool)

(assert start!124956)

(declare-fun res!978560 () Bool)

(declare-fun e!815430 () Bool)

(assert (=> start!124956 (=> (not res!978560) (not e!815430))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124956 (= res!978560 (validMask!0 mask!2687))))

(assert (=> start!124956 e!815430))

(assert (=> start!124956 true))

(declare-datatypes ((array!98299 0))(
  ( (array!98300 (arr!47434 (Array (_ BitVec 32) (_ BitVec 64))) (size!47985 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98299)

(declare-fun array_inv!36715 (array!98299) Bool)

(assert (=> start!124956 (array_inv!36715 a!2862)))

(declare-fun b!1447602 () Bool)

(declare-fun res!978563 () Bool)

(assert (=> b!1447602 (=> (not res!978563) (not e!815430))))

(declare-datatypes ((List!33922 0))(
  ( (Nil!33919) (Cons!33918 (h!35279 (_ BitVec 64)) (t!48608 List!33922)) )
))
(declare-fun arrayNoDuplicates!0 (array!98299 (_ BitVec 32) List!33922) Bool)

(assert (=> b!1447602 (= res!978563 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33919))))

(declare-fun b!1447603 () Bool)

(declare-fun e!815426 () Bool)

(declare-fun e!815428 () Bool)

(assert (=> b!1447603 (= e!815426 e!815428)))

(declare-fun res!978565 () Bool)

(assert (=> b!1447603 (=> (not res!978565) (not e!815428))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11583 0))(
  ( (MissingZero!11583 (index!48724 (_ BitVec 32))) (Found!11583 (index!48725 (_ BitVec 32))) (Intermediate!11583 (undefined!12395 Bool) (index!48726 (_ BitVec 32)) (x!130584 (_ BitVec 32))) (Undefined!11583) (MissingVacant!11583 (index!48727 (_ BitVec 32))) )
))
(declare-fun lt!635220 () SeekEntryResult!11583)

(assert (=> b!1447603 (= res!978565 (= lt!635220 (Intermediate!11583 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635221 () (_ BitVec 64))

(declare-fun lt!635222 () array!98299)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98299 (_ BitVec 32)) SeekEntryResult!11583)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447603 (= lt!635220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635221 mask!2687) lt!635221 lt!635222 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1447603 (= lt!635221 (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447604 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!815425 () Bool)

(assert (=> b!1447604 (= e!815425 (= lt!635220 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635221 lt!635222 mask!2687)))))

(declare-fun b!1447605 () Bool)

(declare-fun res!978558 () Bool)

(assert (=> b!1447605 (=> (not res!978558) (not e!815430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98299 (_ BitVec 32)) Bool)

(assert (=> b!1447605 (= res!978558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447606 () Bool)

(declare-fun res!978553 () Bool)

(assert (=> b!1447606 (=> (not res!978553) (not e!815430))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447606 (= res!978553 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47985 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47985 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47985 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447607 () Bool)

(declare-fun res!978554 () Bool)

(assert (=> b!1447607 (=> (not res!978554) (not e!815430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447607 (= res!978554 (validKeyInArray!0 (select (arr!47434 a!2862) j!93)))))

(declare-fun b!1447608 () Bool)

(declare-fun res!978552 () Bool)

(assert (=> b!1447608 (=> (not res!978552) (not e!815426))))

(declare-fun lt!635223 () SeekEntryResult!11583)

(assert (=> b!1447608 (= res!978552 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47434 a!2862) j!93) a!2862 mask!2687) lt!635223))))

(declare-fun b!1447609 () Bool)

(declare-fun res!978562 () Bool)

(assert (=> b!1447609 (=> (not res!978562) (not e!815430))))

(assert (=> b!1447609 (= res!978562 (validKeyInArray!0 (select (arr!47434 a!2862) i!1006)))))

(declare-fun b!1447610 () Bool)

(declare-fun res!978564 () Bool)

(assert (=> b!1447610 (=> (not res!978564) (not e!815428))))

(assert (=> b!1447610 (= res!978564 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447611 () Bool)

(declare-fun e!815429 () Bool)

(assert (=> b!1447611 (= e!815429 e!815426)))

(declare-fun res!978557 () Bool)

(assert (=> b!1447611 (=> (not res!978557) (not e!815426))))

(assert (=> b!1447611 (= res!978557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47434 a!2862) j!93) mask!2687) (select (arr!47434 a!2862) j!93) a!2862 mask!2687) lt!635223))))

(assert (=> b!1447611 (= lt!635223 (Intermediate!11583 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447612 () Bool)

(assert (=> b!1447612 (= e!815428 (not true))))

(declare-fun e!815424 () Bool)

(assert (=> b!1447612 e!815424))

(declare-fun res!978566 () Bool)

(assert (=> b!1447612 (=> (not res!978566) (not e!815424))))

(assert (=> b!1447612 (= res!978566 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48695 0))(
  ( (Unit!48696) )
))
(declare-fun lt!635224 () Unit!48695)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48695)

(assert (=> b!1447612 (= lt!635224 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447613 () Bool)

(assert (=> b!1447613 (= e!815430 e!815429)))

(declare-fun res!978559 () Bool)

(assert (=> b!1447613 (=> (not res!978559) (not e!815429))))

(assert (=> b!1447613 (= res!978559 (= (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447613 (= lt!635222 (array!98300 (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47985 a!2862)))))

(declare-fun b!1447614 () Bool)

(declare-fun res!978555 () Bool)

(assert (=> b!1447614 (=> (not res!978555) (not e!815430))))

(assert (=> b!1447614 (= res!978555 (and (= (size!47985 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47985 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47985 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447615 () Bool)

(declare-fun res!978556 () Bool)

(assert (=> b!1447615 (=> (not res!978556) (not e!815424))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98299 (_ BitVec 32)) SeekEntryResult!11583)

(assert (=> b!1447615 (= res!978556 (= (seekEntryOrOpen!0 (select (arr!47434 a!2862) j!93) a!2862 mask!2687) (Found!11583 j!93)))))

(declare-fun b!1447616 () Bool)

(declare-fun res!978561 () Bool)

(assert (=> b!1447616 (=> (not res!978561) (not e!815428))))

(assert (=> b!1447616 (= res!978561 e!815425)))

(declare-fun c!134044 () Bool)

(assert (=> b!1447616 (= c!134044 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447617 () Bool)

(assert (=> b!1447617 (= e!815424 (or (= (select (arr!47434 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47434 a!2862) intermediateBeforeIndex!19) (select (arr!47434 a!2862) j!93))))))

(declare-fun b!1447618 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98299 (_ BitVec 32)) SeekEntryResult!11583)

(assert (=> b!1447618 (= e!815425 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635221 lt!635222 mask!2687) (seekEntryOrOpen!0 lt!635221 lt!635222 mask!2687)))))

(assert (= (and start!124956 res!978560) b!1447614))

(assert (= (and b!1447614 res!978555) b!1447609))

(assert (= (and b!1447609 res!978562) b!1447607))

(assert (= (and b!1447607 res!978554) b!1447605))

(assert (= (and b!1447605 res!978558) b!1447602))

(assert (= (and b!1447602 res!978563) b!1447606))

(assert (= (and b!1447606 res!978553) b!1447613))

(assert (= (and b!1447613 res!978559) b!1447611))

(assert (= (and b!1447611 res!978557) b!1447608))

(assert (= (and b!1447608 res!978552) b!1447603))

(assert (= (and b!1447603 res!978565) b!1447616))

(assert (= (and b!1447616 c!134044) b!1447604))

(assert (= (and b!1447616 (not c!134044)) b!1447618))

(assert (= (and b!1447616 res!978561) b!1447610))

(assert (= (and b!1447610 res!978564) b!1447612))

(assert (= (and b!1447612 res!978566) b!1447615))

(assert (= (and b!1447615 res!978556) b!1447617))

(declare-fun m!1336603 () Bool)

(assert (=> b!1447602 m!1336603))

(declare-fun m!1336605 () Bool)

(assert (=> b!1447618 m!1336605))

(declare-fun m!1336607 () Bool)

(assert (=> b!1447618 m!1336607))

(declare-fun m!1336609 () Bool)

(assert (=> b!1447608 m!1336609))

(assert (=> b!1447608 m!1336609))

(declare-fun m!1336611 () Bool)

(assert (=> b!1447608 m!1336611))

(assert (=> b!1447611 m!1336609))

(assert (=> b!1447611 m!1336609))

(declare-fun m!1336613 () Bool)

(assert (=> b!1447611 m!1336613))

(assert (=> b!1447611 m!1336613))

(assert (=> b!1447611 m!1336609))

(declare-fun m!1336615 () Bool)

(assert (=> b!1447611 m!1336615))

(declare-fun m!1336617 () Bool)

(assert (=> b!1447604 m!1336617))

(declare-fun m!1336619 () Bool)

(assert (=> b!1447603 m!1336619))

(assert (=> b!1447603 m!1336619))

(declare-fun m!1336621 () Bool)

(assert (=> b!1447603 m!1336621))

(declare-fun m!1336623 () Bool)

(assert (=> b!1447603 m!1336623))

(declare-fun m!1336625 () Bool)

(assert (=> b!1447603 m!1336625))

(assert (=> b!1447613 m!1336623))

(declare-fun m!1336627 () Bool)

(assert (=> b!1447613 m!1336627))

(declare-fun m!1336629 () Bool)

(assert (=> b!1447605 m!1336629))

(assert (=> b!1447607 m!1336609))

(assert (=> b!1447607 m!1336609))

(declare-fun m!1336631 () Bool)

(assert (=> b!1447607 m!1336631))

(declare-fun m!1336633 () Bool)

(assert (=> b!1447617 m!1336633))

(assert (=> b!1447617 m!1336609))

(declare-fun m!1336635 () Bool)

(assert (=> b!1447612 m!1336635))

(declare-fun m!1336637 () Bool)

(assert (=> b!1447612 m!1336637))

(declare-fun m!1336639 () Bool)

(assert (=> start!124956 m!1336639))

(declare-fun m!1336641 () Bool)

(assert (=> start!124956 m!1336641))

(declare-fun m!1336643 () Bool)

(assert (=> b!1447609 m!1336643))

(assert (=> b!1447609 m!1336643))

(declare-fun m!1336645 () Bool)

(assert (=> b!1447609 m!1336645))

(assert (=> b!1447615 m!1336609))

(assert (=> b!1447615 m!1336609))

(declare-fun m!1336647 () Bool)

(assert (=> b!1447615 m!1336647))

(check-sat (not b!1447612) (not b!1447608) (not b!1447604) (not b!1447602) (not start!124956) (not b!1447615) (not b!1447603) (not b!1447609) (not b!1447618) (not b!1447611) (not b!1447605) (not b!1447607))
(check-sat)
