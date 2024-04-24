; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127632 () Bool)

(assert start!127632)

(declare-fun b!1498591 () Bool)

(declare-fun res!1018758 () Bool)

(declare-fun e!839404 () Bool)

(assert (=> b!1498591 (=> (not res!1018758) (not e!839404))))

(declare-datatypes ((array!99933 0))(
  ( (array!99934 (arr!48226 (Array (_ BitVec 32) (_ BitVec 64))) (size!48777 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99933)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498591 (= res!1018758 (validKeyInArray!0 (select (arr!48226 a!2862) i!1006)))))

(declare-fun b!1498592 () Bool)

(declare-fun res!1018757 () Bool)

(declare-fun e!839401 () Bool)

(assert (=> b!1498592 (=> res!1018757 e!839401)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1498592 (= res!1018757 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1498593 () Bool)

(declare-fun res!1018753 () Bool)

(assert (=> b!1498593 (=> res!1018753 e!839401)))

(declare-fun lt!652884 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12363 0))(
  ( (MissingZero!12363 (index!51844 (_ BitVec 32))) (Found!12363 (index!51845 (_ BitVec 32))) (Intermediate!12363 (undefined!13175 Bool) (index!51846 (_ BitVec 32)) (x!133655 (_ BitVec 32))) (Undefined!12363) (MissingVacant!12363 (index!51847 (_ BitVec 32))) )
))
(declare-fun lt!652881 () SeekEntryResult!12363)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99933 (_ BitVec 32)) SeekEntryResult!12363)

(assert (=> b!1498593 (= res!1018753 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652884 (select (arr!48226 a!2862) j!93) a!2862 mask!2687) lt!652881)))))

(declare-fun b!1498594 () Bool)

(declare-fun res!1018759 () Bool)

(assert (=> b!1498594 (=> res!1018759 e!839401)))

(declare-fun e!839408 () Bool)

(assert (=> b!1498594 (= res!1018759 e!839408)))

(declare-fun c!139465 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1498594 (= c!139465 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1498595 () Bool)

(declare-fun res!1018766 () Bool)

(declare-fun e!839407 () Bool)

(assert (=> b!1498595 (=> (not res!1018766) (not e!839407))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1498595 (= res!1018766 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1498596 () Bool)

(declare-fun res!1018765 () Bool)

(assert (=> b!1498596 (=> (not res!1018765) (not e!839404))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1498596 (= res!1018765 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48777 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48777 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48777 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1498597 () Bool)

(declare-fun lt!652883 () array!99933)

(declare-fun lt!652886 () (_ BitVec 64))

(declare-fun e!839403 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99933 (_ BitVec 32)) SeekEntryResult!12363)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99933 (_ BitVec 32)) SeekEntryResult!12363)

(assert (=> b!1498597 (= e!839403 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652886 lt!652883 mask!2687) (seekEntryOrOpen!0 lt!652886 lt!652883 mask!2687)))))

(declare-fun res!1018767 () Bool)

(assert (=> start!127632 (=> (not res!1018767) (not e!839404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127632 (= res!1018767 (validMask!0 mask!2687))))

(assert (=> start!127632 e!839404))

(assert (=> start!127632 true))

(declare-fun array_inv!37507 (array!99933) Bool)

(assert (=> start!127632 (array_inv!37507 a!2862)))

(declare-fun lt!652885 () SeekEntryResult!12363)

(declare-fun b!1498598 () Bool)

(assert (=> b!1498598 (= e!839403 (= lt!652885 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652886 lt!652883 mask!2687)))))

(declare-fun b!1498599 () Bool)

(declare-fun res!1018755 () Bool)

(assert (=> b!1498599 (=> (not res!1018755) (not e!839404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99933 (_ BitVec 32)) Bool)

(assert (=> b!1498599 (= res!1018755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1498600 () Bool)

(declare-fun res!1018768 () Bool)

(declare-fun e!839402 () Bool)

(assert (=> b!1498600 (=> (not res!1018768) (not e!839402))))

(assert (=> b!1498600 (= res!1018768 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48226 a!2862) j!93) a!2862 mask!2687) lt!652881))))

(declare-fun b!1498601 () Bool)

(declare-fun res!1018752 () Bool)

(assert (=> b!1498601 (=> (not res!1018752) (not e!839404))))

(assert (=> b!1498601 (= res!1018752 (and (= (size!48777 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48777 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48777 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1498602 () Bool)

(declare-fun res!1018756 () Bool)

(assert (=> b!1498602 (=> (not res!1018756) (not e!839404))))

(declare-datatypes ((List!34714 0))(
  ( (Nil!34711) (Cons!34710 (h!36122 (_ BitVec 64)) (t!49400 List!34714)) )
))
(declare-fun arrayNoDuplicates!0 (array!99933 (_ BitVec 32) List!34714) Bool)

(assert (=> b!1498602 (= res!1018756 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34711))))

(declare-fun b!1498603 () Bool)

(declare-fun res!1018754 () Bool)

(assert (=> b!1498603 (=> (not res!1018754) (not e!839407))))

(assert (=> b!1498603 (= res!1018754 e!839403)))

(declare-fun c!139464 () Bool)

(assert (=> b!1498603 (= c!139464 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1498604 () Bool)

(assert (=> b!1498604 (= e!839408 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652884 intermediateAfterIndex!19 lt!652886 lt!652883 mask!2687) (seekEntryOrOpen!0 lt!652886 lt!652883 mask!2687))))))

(declare-fun b!1498605 () Bool)

(assert (=> b!1498605 (= e!839408 (not (= lt!652885 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652884 lt!652886 lt!652883 mask!2687))))))

(declare-fun b!1498606 () Bool)

(declare-fun e!839406 () Bool)

(assert (=> b!1498606 (= e!839404 e!839406)))

(declare-fun res!1018769 () Bool)

(assert (=> b!1498606 (=> (not res!1018769) (not e!839406))))

(assert (=> b!1498606 (= res!1018769 (= (select (store (arr!48226 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1498606 (= lt!652883 (array!99934 (store (arr!48226 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48777 a!2862)))))

(declare-fun b!1498607 () Bool)

(declare-fun e!839409 () Bool)

(assert (=> b!1498607 (= e!839407 (not e!839409))))

(declare-fun res!1018761 () Bool)

(assert (=> b!1498607 (=> res!1018761 e!839409)))

(assert (=> b!1498607 (= res!1018761 (or (and (= (select (arr!48226 a!2862) index!646) (select (store (arr!48226 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48226 a!2862) index!646) (select (arr!48226 a!2862) j!93))) (= (select (arr!48226 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!652882 () SeekEntryResult!12363)

(assert (=> b!1498607 (and (= lt!652882 (Found!12363 j!93)) (or (= (select (arr!48226 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48226 a!2862) intermediateBeforeIndex!19) (select (arr!48226 a!2862) j!93))))))

(assert (=> b!1498607 (= lt!652882 (seekEntryOrOpen!0 (select (arr!48226 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1498607 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50099 0))(
  ( (Unit!50100) )
))
(declare-fun lt!652880 () Unit!50099)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50099)

(assert (=> b!1498607 (= lt!652880 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1498608 () Bool)

(assert (=> b!1498608 (= e!839409 e!839401)))

(declare-fun res!1018764 () Bool)

(assert (=> b!1498608 (=> res!1018764 e!839401)))

(assert (=> b!1498608 (= res!1018764 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652884 #b00000000000000000000000000000000) (bvsge lt!652884 (size!48777 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498608 (= lt!652884 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1498609 () Bool)

(assert (=> b!1498609 (= e!839402 e!839407)))

(declare-fun res!1018760 () Bool)

(assert (=> b!1498609 (=> (not res!1018760) (not e!839407))))

(assert (=> b!1498609 (= res!1018760 (= lt!652885 (Intermediate!12363 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498609 (= lt!652885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652886 mask!2687) lt!652886 lt!652883 mask!2687))))

(assert (=> b!1498609 (= lt!652886 (select (store (arr!48226 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1498610 () Bool)

(declare-fun res!1018763 () Bool)

(assert (=> b!1498610 (=> (not res!1018763) (not e!839404))))

(assert (=> b!1498610 (= res!1018763 (validKeyInArray!0 (select (arr!48226 a!2862) j!93)))))

(declare-fun b!1498611 () Bool)

(assert (=> b!1498611 (= e!839406 e!839402)))

(declare-fun res!1018762 () Bool)

(assert (=> b!1498611 (=> (not res!1018762) (not e!839402))))

(assert (=> b!1498611 (= res!1018762 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48226 a!2862) j!93) mask!2687) (select (arr!48226 a!2862) j!93) a!2862 mask!2687) lt!652881))))

(assert (=> b!1498611 (= lt!652881 (Intermediate!12363 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1498612 () Bool)

(assert (=> b!1498612 (= e!839401 true)))

(assert (=> b!1498612 (= lt!652882 (seekEntryOrOpen!0 lt!652886 lt!652883 mask!2687))))

(declare-fun lt!652887 () Unit!50099)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50099)

(assert (=> b!1498612 (= lt!652887 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652884 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(assert (= (and start!127632 res!1018767) b!1498601))

(assert (= (and b!1498601 res!1018752) b!1498591))

(assert (= (and b!1498591 res!1018758) b!1498610))

(assert (= (and b!1498610 res!1018763) b!1498599))

(assert (= (and b!1498599 res!1018755) b!1498602))

(assert (= (and b!1498602 res!1018756) b!1498596))

(assert (= (and b!1498596 res!1018765) b!1498606))

(assert (= (and b!1498606 res!1018769) b!1498611))

(assert (= (and b!1498611 res!1018762) b!1498600))

(assert (= (and b!1498600 res!1018768) b!1498609))

(assert (= (and b!1498609 res!1018760) b!1498603))

(assert (= (and b!1498603 c!139464) b!1498598))

(assert (= (and b!1498603 (not c!139464)) b!1498597))

(assert (= (and b!1498603 res!1018754) b!1498595))

(assert (= (and b!1498595 res!1018766) b!1498607))

(assert (= (and b!1498607 (not res!1018761)) b!1498608))

(assert (= (and b!1498608 (not res!1018764)) b!1498593))

(assert (= (and b!1498593 (not res!1018753)) b!1498594))

(assert (= (and b!1498594 c!139465) b!1498605))

(assert (= (and b!1498594 (not c!139465)) b!1498604))

(assert (= (and b!1498594 (not res!1018759)) b!1498592))

(assert (= (and b!1498592 (not res!1018757)) b!1498612))

(declare-fun m!1381737 () Bool)

(assert (=> b!1498604 m!1381737))

(declare-fun m!1381739 () Bool)

(assert (=> b!1498604 m!1381739))

(declare-fun m!1381741 () Bool)

(assert (=> b!1498597 m!1381741))

(assert (=> b!1498597 m!1381739))

(declare-fun m!1381743 () Bool)

(assert (=> b!1498593 m!1381743))

(assert (=> b!1498593 m!1381743))

(declare-fun m!1381745 () Bool)

(assert (=> b!1498593 m!1381745))

(declare-fun m!1381747 () Bool)

(assert (=> b!1498609 m!1381747))

(assert (=> b!1498609 m!1381747))

(declare-fun m!1381749 () Bool)

(assert (=> b!1498609 m!1381749))

(declare-fun m!1381751 () Bool)

(assert (=> b!1498609 m!1381751))

(declare-fun m!1381753 () Bool)

(assert (=> b!1498609 m!1381753))

(declare-fun m!1381755 () Bool)

(assert (=> b!1498602 m!1381755))

(assert (=> b!1498606 m!1381751))

(declare-fun m!1381757 () Bool)

(assert (=> b!1498606 m!1381757))

(declare-fun m!1381759 () Bool)

(assert (=> b!1498605 m!1381759))

(declare-fun m!1381761 () Bool)

(assert (=> b!1498608 m!1381761))

(declare-fun m!1381763 () Bool)

(assert (=> b!1498599 m!1381763))

(declare-fun m!1381765 () Bool)

(assert (=> b!1498607 m!1381765))

(assert (=> b!1498607 m!1381751))

(declare-fun m!1381767 () Bool)

(assert (=> b!1498607 m!1381767))

(declare-fun m!1381769 () Bool)

(assert (=> b!1498607 m!1381769))

(declare-fun m!1381771 () Bool)

(assert (=> b!1498607 m!1381771))

(assert (=> b!1498607 m!1381743))

(declare-fun m!1381773 () Bool)

(assert (=> b!1498607 m!1381773))

(declare-fun m!1381775 () Bool)

(assert (=> b!1498607 m!1381775))

(assert (=> b!1498607 m!1381743))

(declare-fun m!1381777 () Bool)

(assert (=> start!127632 m!1381777))

(declare-fun m!1381779 () Bool)

(assert (=> start!127632 m!1381779))

(assert (=> b!1498610 m!1381743))

(assert (=> b!1498610 m!1381743))

(declare-fun m!1381781 () Bool)

(assert (=> b!1498610 m!1381781))

(assert (=> b!1498612 m!1381739))

(declare-fun m!1381783 () Bool)

(assert (=> b!1498612 m!1381783))

(declare-fun m!1381785 () Bool)

(assert (=> b!1498591 m!1381785))

(assert (=> b!1498591 m!1381785))

(declare-fun m!1381787 () Bool)

(assert (=> b!1498591 m!1381787))

(declare-fun m!1381789 () Bool)

(assert (=> b!1498598 m!1381789))

(assert (=> b!1498611 m!1381743))

(assert (=> b!1498611 m!1381743))

(declare-fun m!1381791 () Bool)

(assert (=> b!1498611 m!1381791))

(assert (=> b!1498611 m!1381791))

(assert (=> b!1498611 m!1381743))

(declare-fun m!1381793 () Bool)

(assert (=> b!1498611 m!1381793))

(assert (=> b!1498600 m!1381743))

(assert (=> b!1498600 m!1381743))

(declare-fun m!1381795 () Bool)

(assert (=> b!1498600 m!1381795))

(check-sat (not b!1498610) (not b!1498602) (not start!127632) (not b!1498612) (not b!1498611) (not b!1498605) (not b!1498607) (not b!1498600) (not b!1498598) (not b!1498593) (not b!1498608) (not b!1498591) (not b!1498597) (not b!1498609) (not b!1498599) (not b!1498604))
(check-sat)
