; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124878 () Bool)

(assert start!124878)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!814604 () Bool)

(declare-fun b!1445597 () Bool)

(declare-datatypes ((array!98221 0))(
  ( (array!98222 (arr!47395 (Array (_ BitVec 32) (_ BitVec 64))) (size!47946 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98221)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445597 (= e!814604 (or (= (select (arr!47395 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47395 a!2862) intermediateBeforeIndex!19) (select (arr!47395 a!2862) j!93))))))

(declare-fun b!1445598 () Bool)

(declare-fun e!814600 () Bool)

(assert (=> b!1445598 (= e!814600 true)))

(declare-fun lt!634624 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11544 0))(
  ( (MissingZero!11544 (index!48568 (_ BitVec 32))) (Found!11544 (index!48569 (_ BitVec 32))) (Intermediate!11544 (undefined!12356 Bool) (index!48570 (_ BitVec 32)) (x!130441 (_ BitVec 32))) (Undefined!11544) (MissingVacant!11544 (index!48571 (_ BitVec 32))) )
))
(declare-fun lt!634619 () SeekEntryResult!11544)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634621 () array!98221)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98221 (_ BitVec 32)) SeekEntryResult!11544)

(assert (=> b!1445598 (= lt!634619 (seekEntryOrOpen!0 lt!634624 lt!634621 mask!2687))))

(declare-fun b!1445599 () Bool)

(declare-fun res!976783 () Bool)

(declare-fun e!814602 () Bool)

(assert (=> b!1445599 (=> (not res!976783) (not e!814602))))

(declare-datatypes ((List!33883 0))(
  ( (Nil!33880) (Cons!33879 (h!35240 (_ BitVec 64)) (t!48569 List!33883)) )
))
(declare-fun arrayNoDuplicates!0 (array!98221 (_ BitVec 32) List!33883) Bool)

(assert (=> b!1445599 (= res!976783 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33880))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!814598 () Bool)

(declare-fun b!1445600 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98221 (_ BitVec 32)) SeekEntryResult!11544)

(assert (=> b!1445600 (= e!814598 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634624 lt!634621 mask!2687) (seekEntryOrOpen!0 lt!634624 lt!634621 mask!2687)))))

(declare-fun b!1445601 () Bool)

(declare-fun res!976796 () Bool)

(assert (=> b!1445601 (=> (not res!976796) (not e!814604))))

(assert (=> b!1445601 (= res!976796 (= (seekEntryOrOpen!0 (select (arr!47395 a!2862) j!93) a!2862 mask!2687) (Found!11544 j!93)))))

(declare-fun b!1445602 () Bool)

(declare-fun res!976792 () Bool)

(assert (=> b!1445602 (=> (not res!976792) (not e!814602))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445602 (= res!976792 (and (= (size!47946 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47946 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47946 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445603 () Bool)

(declare-fun res!976781 () Bool)

(assert (=> b!1445603 (=> (not res!976781) (not e!814602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445603 (= res!976781 (validKeyInArray!0 (select (arr!47395 a!2862) i!1006)))))

(declare-fun b!1445604 () Bool)

(declare-fun res!976787 () Bool)

(assert (=> b!1445604 (=> (not res!976787) (not e!814602))))

(assert (=> b!1445604 (= res!976787 (validKeyInArray!0 (select (arr!47395 a!2862) j!93)))))

(declare-fun b!1445605 () Bool)

(declare-fun e!814605 () Bool)

(declare-fun e!814601 () Bool)

(assert (=> b!1445605 (= e!814605 e!814601)))

(declare-fun res!976788 () Bool)

(assert (=> b!1445605 (=> (not res!976788) (not e!814601))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!634623 () SeekEntryResult!11544)

(assert (=> b!1445605 (= res!976788 (= lt!634623 (Intermediate!11544 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98221 (_ BitVec 32)) SeekEntryResult!11544)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445605 (= lt!634623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634624 mask!2687) lt!634624 lt!634621 mask!2687))))

(assert (=> b!1445605 (= lt!634624 (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445606 () Bool)

(assert (=> b!1445606 (= e!814601 (not e!814600))))

(declare-fun res!976793 () Bool)

(assert (=> b!1445606 (=> res!976793 e!814600)))

(assert (=> b!1445606 (= res!976793 (or (not (= (select (arr!47395 a!2862) index!646) (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47395 a!2862) index!646) (select (arr!47395 a!2862) j!93)))))))

(assert (=> b!1445606 e!814604))

(declare-fun res!976782 () Bool)

(assert (=> b!1445606 (=> (not res!976782) (not e!814604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98221 (_ BitVec 32)) Bool)

(assert (=> b!1445606 (= res!976782 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48617 0))(
  ( (Unit!48618) )
))
(declare-fun lt!634622 () Unit!48617)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48617)

(assert (=> b!1445606 (= lt!634622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445607 () Bool)

(assert (=> b!1445607 (= e!814598 (= lt!634623 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634624 lt!634621 mask!2687)))))

(declare-fun b!1445608 () Bool)

(declare-fun res!976786 () Bool)

(assert (=> b!1445608 (=> (not res!976786) (not e!814602))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445608 (= res!976786 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47946 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47946 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47946 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445610 () Bool)

(declare-fun res!976790 () Bool)

(assert (=> b!1445610 (=> (not res!976790) (not e!814601))))

(assert (=> b!1445610 (= res!976790 e!814598)))

(declare-fun c!133927 () Bool)

(assert (=> b!1445610 (= c!133927 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445611 () Bool)

(declare-fun res!976785 () Bool)

(assert (=> b!1445611 (=> (not res!976785) (not e!814601))))

(assert (=> b!1445611 (= res!976785 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445612 () Bool)

(declare-fun res!976794 () Bool)

(assert (=> b!1445612 (=> (not res!976794) (not e!814602))))

(assert (=> b!1445612 (= res!976794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445613 () Bool)

(declare-fun e!814603 () Bool)

(assert (=> b!1445613 (= e!814603 e!814605)))

(declare-fun res!976784 () Bool)

(assert (=> b!1445613 (=> (not res!976784) (not e!814605))))

(declare-fun lt!634620 () SeekEntryResult!11544)

(assert (=> b!1445613 (= res!976784 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47395 a!2862) j!93) mask!2687) (select (arr!47395 a!2862) j!93) a!2862 mask!2687) lt!634620))))

(assert (=> b!1445613 (= lt!634620 (Intermediate!11544 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445614 () Bool)

(assert (=> b!1445614 (= e!814602 e!814603)))

(declare-fun res!976789 () Bool)

(assert (=> b!1445614 (=> (not res!976789) (not e!814603))))

(assert (=> b!1445614 (= res!976789 (= (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445614 (= lt!634621 (array!98222 (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47946 a!2862)))))

(declare-fun b!1445609 () Bool)

(declare-fun res!976791 () Bool)

(assert (=> b!1445609 (=> (not res!976791) (not e!814605))))

(assert (=> b!1445609 (= res!976791 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47395 a!2862) j!93) a!2862 mask!2687) lt!634620))))

(declare-fun res!976795 () Bool)

(assert (=> start!124878 (=> (not res!976795) (not e!814602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124878 (= res!976795 (validMask!0 mask!2687))))

(assert (=> start!124878 e!814602))

(assert (=> start!124878 true))

(declare-fun array_inv!36676 (array!98221) Bool)

(assert (=> start!124878 (array_inv!36676 a!2862)))

(assert (= (and start!124878 res!976795) b!1445602))

(assert (= (and b!1445602 res!976792) b!1445603))

(assert (= (and b!1445603 res!976781) b!1445604))

(assert (= (and b!1445604 res!976787) b!1445612))

(assert (= (and b!1445612 res!976794) b!1445599))

(assert (= (and b!1445599 res!976783) b!1445608))

(assert (= (and b!1445608 res!976786) b!1445614))

(assert (= (and b!1445614 res!976789) b!1445613))

(assert (= (and b!1445613 res!976784) b!1445609))

(assert (= (and b!1445609 res!976791) b!1445605))

(assert (= (and b!1445605 res!976788) b!1445610))

(assert (= (and b!1445610 c!133927) b!1445607))

(assert (= (and b!1445610 (not c!133927)) b!1445600))

(assert (= (and b!1445610 res!976790) b!1445611))

(assert (= (and b!1445611 res!976785) b!1445606))

(assert (= (and b!1445606 res!976782) b!1445601))

(assert (= (and b!1445601 res!976796) b!1445597))

(assert (= (and b!1445606 (not res!976793)) b!1445598))

(declare-fun m!1334743 () Bool)

(assert (=> b!1445597 m!1334743))

(declare-fun m!1334745 () Bool)

(assert (=> b!1445597 m!1334745))

(assert (=> b!1445604 m!1334745))

(assert (=> b!1445604 m!1334745))

(declare-fun m!1334747 () Bool)

(assert (=> b!1445604 m!1334747))

(assert (=> b!1445601 m!1334745))

(assert (=> b!1445601 m!1334745))

(declare-fun m!1334749 () Bool)

(assert (=> b!1445601 m!1334749))

(declare-fun m!1334751 () Bool)

(assert (=> start!124878 m!1334751))

(declare-fun m!1334753 () Bool)

(assert (=> start!124878 m!1334753))

(declare-fun m!1334755 () Bool)

(assert (=> b!1445606 m!1334755))

(declare-fun m!1334757 () Bool)

(assert (=> b!1445606 m!1334757))

(declare-fun m!1334759 () Bool)

(assert (=> b!1445606 m!1334759))

(declare-fun m!1334761 () Bool)

(assert (=> b!1445606 m!1334761))

(declare-fun m!1334763 () Bool)

(assert (=> b!1445606 m!1334763))

(assert (=> b!1445606 m!1334745))

(declare-fun m!1334765 () Bool)

(assert (=> b!1445607 m!1334765))

(assert (=> b!1445609 m!1334745))

(assert (=> b!1445609 m!1334745))

(declare-fun m!1334767 () Bool)

(assert (=> b!1445609 m!1334767))

(declare-fun m!1334769 () Bool)

(assert (=> b!1445599 m!1334769))

(assert (=> b!1445614 m!1334757))

(declare-fun m!1334771 () Bool)

(assert (=> b!1445614 m!1334771))

(declare-fun m!1334773 () Bool)

(assert (=> b!1445605 m!1334773))

(assert (=> b!1445605 m!1334773))

(declare-fun m!1334775 () Bool)

(assert (=> b!1445605 m!1334775))

(assert (=> b!1445605 m!1334757))

(declare-fun m!1334777 () Bool)

(assert (=> b!1445605 m!1334777))

(declare-fun m!1334779 () Bool)

(assert (=> b!1445603 m!1334779))

(assert (=> b!1445603 m!1334779))

(declare-fun m!1334781 () Bool)

(assert (=> b!1445603 m!1334781))

(declare-fun m!1334783 () Bool)

(assert (=> b!1445600 m!1334783))

(declare-fun m!1334785 () Bool)

(assert (=> b!1445600 m!1334785))

(assert (=> b!1445613 m!1334745))

(assert (=> b!1445613 m!1334745))

(declare-fun m!1334787 () Bool)

(assert (=> b!1445613 m!1334787))

(assert (=> b!1445613 m!1334787))

(assert (=> b!1445613 m!1334745))

(declare-fun m!1334789 () Bool)

(assert (=> b!1445613 m!1334789))

(assert (=> b!1445598 m!1334785))

(declare-fun m!1334791 () Bool)

(assert (=> b!1445612 m!1334791))

(check-sat (not start!124878) (not b!1445601) (not b!1445604) (not b!1445600) (not b!1445605) (not b!1445607) (not b!1445612) (not b!1445606) (not b!1445599) (not b!1445613) (not b!1445609) (not b!1445598) (not b!1445603))
(check-sat)
