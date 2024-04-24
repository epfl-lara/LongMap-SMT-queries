; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127170 () Bool)

(assert start!127170)

(declare-fun b!1492604 () Bool)

(declare-fun res!1014739 () Bool)

(declare-fun e!836448 () Bool)

(assert (=> b!1492604 (=> (not res!1014739) (not e!836448))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12294 0))(
  ( (MissingZero!12294 (index!51568 (_ BitVec 32))) (Found!12294 (index!51569 (_ BitVec 32))) (Intermediate!12294 (undefined!13106 Bool) (index!51570 (_ BitVec 32)) (x!133343 (_ BitVec 32))) (Undefined!12294) (MissingVacant!12294 (index!51571 (_ BitVec 32))) )
))
(declare-fun lt!650737 () SeekEntryResult!12294)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99781 0))(
  ( (array!99782 (arr!48157 (Array (_ BitVec 32) (_ BitVec 64))) (size!48708 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99781)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99781 (_ BitVec 32)) SeekEntryResult!12294)

(assert (=> b!1492604 (= res!1014739 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48157 a!2862) j!93) a!2862 mask!2687) lt!650737))))

(declare-fun b!1492605 () Bool)

(declare-fun res!1014736 () Bool)

(declare-fun e!836454 () Bool)

(assert (=> b!1492605 (=> (not res!1014736) (not e!836454))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99781 (_ BitVec 32)) SeekEntryResult!12294)

(assert (=> b!1492605 (= res!1014736 (= (seekEntryOrOpen!0 (select (arr!48157 a!2862) j!93) a!2862 mask!2687) (Found!12294 j!93)))))

(declare-fun lt!650734 () (_ BitVec 64))

(declare-fun lt!650732 () array!99781)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!836451 () Bool)

(declare-fun b!1492606 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99781 (_ BitVec 32)) SeekEntryResult!12294)

(assert (=> b!1492606 (= e!836451 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650734 lt!650732 mask!2687) (seekEntryOrOpen!0 lt!650734 lt!650732 mask!2687)))))

(declare-fun b!1492607 () Bool)

(declare-fun res!1014746 () Bool)

(declare-fun e!836453 () Bool)

(assert (=> b!1492607 (=> (not res!1014746) (not e!836453))))

(declare-datatypes ((List!34645 0))(
  ( (Nil!34642) (Cons!34641 (h!36038 (_ BitVec 64)) (t!49331 List!34645)) )
))
(declare-fun arrayNoDuplicates!0 (array!99781 (_ BitVec 32) List!34645) Bool)

(assert (=> b!1492607 (= res!1014746 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34642))))

(declare-fun lt!650736 () SeekEntryResult!12294)

(declare-fun b!1492608 () Bool)

(assert (=> b!1492608 (= e!836451 (= lt!650736 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650734 lt!650732 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1492609 () Bool)

(assert (=> b!1492609 (= e!836454 (or (= (select (arr!48157 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48157 a!2862) intermediateBeforeIndex!19) (select (arr!48157 a!2862) j!93))))))

(declare-fun b!1492610 () Bool)

(declare-fun res!1014749 () Bool)

(assert (=> b!1492610 (=> (not res!1014749) (not e!836453))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1492610 (= res!1014749 (and (= (size!48708 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48708 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48708 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492611 () Bool)

(declare-fun e!836450 () Bool)

(assert (=> b!1492611 (= e!836448 e!836450)))

(declare-fun res!1014738 () Bool)

(assert (=> b!1492611 (=> (not res!1014738) (not e!836450))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1492611 (= res!1014738 (= lt!650736 (Intermediate!12294 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492611 (= lt!650736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650734 mask!2687) lt!650734 lt!650732 mask!2687))))

(assert (=> b!1492611 (= lt!650734 (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492612 () Bool)

(declare-fun e!836447 () Bool)

(assert (=> b!1492612 (= e!836453 e!836447)))

(declare-fun res!1014748 () Bool)

(assert (=> b!1492612 (=> (not res!1014748) (not e!836447))))

(assert (=> b!1492612 (= res!1014748 (= (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492612 (= lt!650732 (array!99782 (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48708 a!2862)))))

(declare-fun b!1492613 () Bool)

(declare-fun res!1014740 () Bool)

(assert (=> b!1492613 (=> (not res!1014740) (not e!836453))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492613 (= res!1014740 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48708 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48708 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48708 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492614 () Bool)

(declare-fun res!1014741 () Bool)

(assert (=> b!1492614 (=> (not res!1014741) (not e!836453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492614 (= res!1014741 (validKeyInArray!0 (select (arr!48157 a!2862) j!93)))))

(declare-fun b!1492615 () Bool)

(assert (=> b!1492615 (= e!836447 e!836448)))

(declare-fun res!1014734 () Bool)

(assert (=> b!1492615 (=> (not res!1014734) (not e!836448))))

(assert (=> b!1492615 (= res!1014734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48157 a!2862) j!93) mask!2687) (select (arr!48157 a!2862) j!93) a!2862 mask!2687) lt!650737))))

(assert (=> b!1492615 (= lt!650737 (Intermediate!12294 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492616 () Bool)

(declare-fun res!1014737 () Bool)

(assert (=> b!1492616 (=> (not res!1014737) (not e!836453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99781 (_ BitVec 32)) Bool)

(assert (=> b!1492616 (= res!1014737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492617 () Bool)

(declare-fun e!836449 () Bool)

(assert (=> b!1492617 (= e!836449 true)))

(declare-fun lt!650735 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492617 (= lt!650735 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun res!1014744 () Bool)

(assert (=> start!127170 (=> (not res!1014744) (not e!836453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127170 (= res!1014744 (validMask!0 mask!2687))))

(assert (=> start!127170 e!836453))

(assert (=> start!127170 true))

(declare-fun array_inv!37438 (array!99781) Bool)

(assert (=> start!127170 (array_inv!37438 a!2862)))

(declare-fun b!1492618 () Bool)

(declare-fun res!1014742 () Bool)

(assert (=> b!1492618 (=> (not res!1014742) (not e!836450))))

(assert (=> b!1492618 (= res!1014742 e!836451)))

(declare-fun c!138472 () Bool)

(assert (=> b!1492618 (= c!138472 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492619 () Bool)

(assert (=> b!1492619 (= e!836450 (not e!836449))))

(declare-fun res!1014747 () Bool)

(assert (=> b!1492619 (=> res!1014747 e!836449)))

(assert (=> b!1492619 (= res!1014747 (or (and (= (select (arr!48157 a!2862) index!646) (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48157 a!2862) index!646) (select (arr!48157 a!2862) j!93))) (= (select (arr!48157 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1492619 e!836454))

(declare-fun res!1014743 () Bool)

(assert (=> b!1492619 (=> (not res!1014743) (not e!836454))))

(assert (=> b!1492619 (= res!1014743 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49961 0))(
  ( (Unit!49962) )
))
(declare-fun lt!650733 () Unit!49961)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49961)

(assert (=> b!1492619 (= lt!650733 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492620 () Bool)

(declare-fun res!1014735 () Bool)

(assert (=> b!1492620 (=> (not res!1014735) (not e!836453))))

(assert (=> b!1492620 (= res!1014735 (validKeyInArray!0 (select (arr!48157 a!2862) i!1006)))))

(declare-fun b!1492621 () Bool)

(declare-fun res!1014745 () Bool)

(assert (=> b!1492621 (=> (not res!1014745) (not e!836450))))

(assert (=> b!1492621 (= res!1014745 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127170 res!1014744) b!1492610))

(assert (= (and b!1492610 res!1014749) b!1492620))

(assert (= (and b!1492620 res!1014735) b!1492614))

(assert (= (and b!1492614 res!1014741) b!1492616))

(assert (= (and b!1492616 res!1014737) b!1492607))

(assert (= (and b!1492607 res!1014746) b!1492613))

(assert (= (and b!1492613 res!1014740) b!1492612))

(assert (= (and b!1492612 res!1014748) b!1492615))

(assert (= (and b!1492615 res!1014734) b!1492604))

(assert (= (and b!1492604 res!1014739) b!1492611))

(assert (= (and b!1492611 res!1014738) b!1492618))

(assert (= (and b!1492618 c!138472) b!1492608))

(assert (= (and b!1492618 (not c!138472)) b!1492606))

(assert (= (and b!1492618 res!1014742) b!1492621))

(assert (= (and b!1492621 res!1014745) b!1492619))

(assert (= (and b!1492619 res!1014743) b!1492605))

(assert (= (and b!1492605 res!1014736) b!1492609))

(assert (= (and b!1492619 (not res!1014747)) b!1492617))

(declare-fun m!1376743 () Bool)

(assert (=> b!1492611 m!1376743))

(assert (=> b!1492611 m!1376743))

(declare-fun m!1376745 () Bool)

(assert (=> b!1492611 m!1376745))

(declare-fun m!1376747 () Bool)

(assert (=> b!1492611 m!1376747))

(declare-fun m!1376749 () Bool)

(assert (=> b!1492611 m!1376749))

(declare-fun m!1376751 () Bool)

(assert (=> b!1492609 m!1376751))

(declare-fun m!1376753 () Bool)

(assert (=> b!1492609 m!1376753))

(declare-fun m!1376755 () Bool)

(assert (=> b!1492619 m!1376755))

(assert (=> b!1492619 m!1376747))

(declare-fun m!1376757 () Bool)

(assert (=> b!1492619 m!1376757))

(declare-fun m!1376759 () Bool)

(assert (=> b!1492619 m!1376759))

(declare-fun m!1376761 () Bool)

(assert (=> b!1492619 m!1376761))

(assert (=> b!1492619 m!1376753))

(assert (=> b!1492615 m!1376753))

(assert (=> b!1492615 m!1376753))

(declare-fun m!1376763 () Bool)

(assert (=> b!1492615 m!1376763))

(assert (=> b!1492615 m!1376763))

(assert (=> b!1492615 m!1376753))

(declare-fun m!1376765 () Bool)

(assert (=> b!1492615 m!1376765))

(assert (=> b!1492605 m!1376753))

(assert (=> b!1492605 m!1376753))

(declare-fun m!1376767 () Bool)

(assert (=> b!1492605 m!1376767))

(declare-fun m!1376769 () Bool)

(assert (=> b!1492607 m!1376769))

(declare-fun m!1376771 () Bool)

(assert (=> b!1492608 m!1376771))

(declare-fun m!1376773 () Bool)

(assert (=> b!1492617 m!1376773))

(assert (=> b!1492614 m!1376753))

(assert (=> b!1492614 m!1376753))

(declare-fun m!1376775 () Bool)

(assert (=> b!1492614 m!1376775))

(declare-fun m!1376777 () Bool)

(assert (=> start!127170 m!1376777))

(declare-fun m!1376779 () Bool)

(assert (=> start!127170 m!1376779))

(declare-fun m!1376781 () Bool)

(assert (=> b!1492606 m!1376781))

(declare-fun m!1376783 () Bool)

(assert (=> b!1492606 m!1376783))

(assert (=> b!1492604 m!1376753))

(assert (=> b!1492604 m!1376753))

(declare-fun m!1376785 () Bool)

(assert (=> b!1492604 m!1376785))

(declare-fun m!1376787 () Bool)

(assert (=> b!1492616 m!1376787))

(declare-fun m!1376789 () Bool)

(assert (=> b!1492620 m!1376789))

(assert (=> b!1492620 m!1376789))

(declare-fun m!1376791 () Bool)

(assert (=> b!1492620 m!1376791))

(assert (=> b!1492612 m!1376747))

(declare-fun m!1376793 () Bool)

(assert (=> b!1492612 m!1376793))

(check-sat (not b!1492611) (not b!1492617) (not b!1492608) (not b!1492615) (not start!127170) (not b!1492607) (not b!1492616) (not b!1492604) (not b!1492614) (not b!1492605) (not b!1492620) (not b!1492619) (not b!1492606))
(check-sat)
