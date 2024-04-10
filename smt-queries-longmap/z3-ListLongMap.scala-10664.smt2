; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125124 () Bool)

(assert start!125124)

(declare-fun b!1457736 () Bool)

(declare-fun e!820023 () Bool)

(assert (=> b!1457736 (= e!820023 true)))

(declare-fun lt!638790 () Bool)

(declare-fun e!820029 () Bool)

(assert (=> b!1457736 (= lt!638790 e!820029)))

(declare-fun c!134387 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457736 (= c!134387 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457737 () Bool)

(declare-fun e!820030 () Bool)

(declare-fun e!820022 () Bool)

(assert (=> b!1457737 (= e!820030 e!820022)))

(declare-fun res!987993 () Bool)

(assert (=> b!1457737 (=> (not res!987993) (not e!820022))))

(declare-datatypes ((SeekEntryResult!11826 0))(
  ( (MissingZero!11826 (index!49696 (_ BitVec 32))) (Found!11826 (index!49697 (_ BitVec 32))) (Intermediate!11826 (undefined!12638 Bool) (index!49698 (_ BitVec 32)) (x!131315 (_ BitVec 32))) (Undefined!11826) (MissingVacant!11826 (index!49699 (_ BitVec 32))) )
))
(declare-fun lt!638791 () SeekEntryResult!11826)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98572 0))(
  ( (array!98573 (arr!47574 (Array (_ BitVec 32) (_ BitVec 64))) (size!48124 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98572)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98572 (_ BitVec 32)) SeekEntryResult!11826)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457737 (= res!987993 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47574 a!2862) j!93) mask!2687) (select (arr!47574 a!2862) j!93) a!2862 mask!2687) lt!638791))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457737 (= lt!638791 (Intermediate!11826 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457738 () Bool)

(declare-fun res!987985 () Bool)

(declare-fun e!820025 () Bool)

(assert (=> b!1457738 (=> (not res!987985) (not e!820025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457738 (= res!987985 (validKeyInArray!0 (select (arr!47574 a!2862) j!93)))))

(declare-fun b!1457739 () Bool)

(declare-fun res!987983 () Bool)

(declare-fun e!820028 () Bool)

(assert (=> b!1457739 (=> (not res!987983) (not e!820028))))

(declare-fun e!820026 () Bool)

(assert (=> b!1457739 (= res!987983 e!820026)))

(declare-fun c!134388 () Bool)

(assert (=> b!1457739 (= c!134388 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457741 () Bool)

(declare-fun res!987992 () Bool)

(assert (=> b!1457741 (=> (not res!987992) (not e!820025))))

(declare-datatypes ((List!34075 0))(
  ( (Nil!34072) (Cons!34071 (h!35421 (_ BitVec 64)) (t!48769 List!34075)) )
))
(declare-fun arrayNoDuplicates!0 (array!98572 (_ BitVec 32) List!34075) Bool)

(assert (=> b!1457741 (= res!987992 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34072))))

(declare-fun b!1457742 () Bool)

(assert (=> b!1457742 (= e!820025 e!820030)))

(declare-fun res!987997 () Bool)

(assert (=> b!1457742 (=> (not res!987997) (not e!820030))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457742 (= res!987997 (= (select (store (arr!47574 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638793 () array!98572)

(assert (=> b!1457742 (= lt!638793 (array!98573 (store (arr!47574 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48124 a!2862)))))

(declare-fun e!820027 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1457743 () Bool)

(assert (=> b!1457743 (= e!820027 (and (or (= (select (arr!47574 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47574 a!2862) intermediateBeforeIndex!19) (select (arr!47574 a!2862) j!93))) (let ((bdg!53362 (select (store (arr!47574 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47574 a!2862) index!646) bdg!53362) (= (select (arr!47574 a!2862) index!646) (select (arr!47574 a!2862) j!93))) (= (select (arr!47574 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53362 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457744 () Bool)

(declare-fun res!987984 () Bool)

(assert (=> b!1457744 (=> res!987984 e!820023)))

(declare-fun lt!638787 () (_ BitVec 32))

(assert (=> b!1457744 (= res!987984 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638787 (select (arr!47574 a!2862) j!93) a!2862 mask!2687) lt!638791)))))

(declare-fun b!1457745 () Bool)

(declare-fun lt!638788 () SeekEntryResult!11826)

(declare-fun lt!638789 () (_ BitVec 64))

(assert (=> b!1457745 (= e!820029 (not (= lt!638788 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638787 lt!638789 lt!638793 mask!2687))))))

(declare-fun b!1457746 () Bool)

(declare-fun e!820024 () Bool)

(assert (=> b!1457746 (= e!820028 (not e!820024))))

(declare-fun res!987988 () Bool)

(assert (=> b!1457746 (=> res!987988 e!820024)))

(assert (=> b!1457746 (= res!987988 (or (and (= (select (arr!47574 a!2862) index!646) (select (store (arr!47574 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47574 a!2862) index!646) (select (arr!47574 a!2862) j!93))) (= (select (arr!47574 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457746 e!820027))

(declare-fun res!987991 () Bool)

(assert (=> b!1457746 (=> (not res!987991) (not e!820027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98572 (_ BitVec 32)) Bool)

(assert (=> b!1457746 (= res!987991 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49148 0))(
  ( (Unit!49149) )
))
(declare-fun lt!638792 () Unit!49148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49148)

(assert (=> b!1457746 (= lt!638792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457747 () Bool)

(declare-fun res!987990 () Bool)

(assert (=> b!1457747 (=> (not res!987990) (not e!820027))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98572 (_ BitVec 32)) SeekEntryResult!11826)

(assert (=> b!1457747 (= res!987990 (= (seekEntryOrOpen!0 (select (arr!47574 a!2862) j!93) a!2862 mask!2687) (Found!11826 j!93)))))

(declare-fun b!1457748 () Bool)

(declare-fun res!987995 () Bool)

(assert (=> b!1457748 (=> (not res!987995) (not e!820025))))

(assert (=> b!1457748 (= res!987995 (validKeyInArray!0 (select (arr!47574 a!2862) i!1006)))))

(declare-fun b!1457749 () Bool)

(declare-fun res!988000 () Bool)

(assert (=> b!1457749 (=> (not res!988000) (not e!820025))))

(assert (=> b!1457749 (= res!988000 (and (= (size!48124 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48124 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48124 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457750 () Bool)

(declare-fun res!987994 () Bool)

(assert (=> b!1457750 (=> (not res!987994) (not e!820028))))

(assert (=> b!1457750 (= res!987994 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457751 () Bool)

(assert (=> b!1457751 (= e!820026 (= lt!638788 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638789 lt!638793 mask!2687)))))

(declare-fun b!1457752 () Bool)

(declare-fun res!987986 () Bool)

(assert (=> b!1457752 (=> (not res!987986) (not e!820022))))

(assert (=> b!1457752 (= res!987986 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47574 a!2862) j!93) a!2862 mask!2687) lt!638791))))

(declare-fun b!1457753 () Bool)

(assert (=> b!1457753 (= e!820024 e!820023)))

(declare-fun res!987987 () Bool)

(assert (=> b!1457753 (=> res!987987 e!820023)))

(assert (=> b!1457753 (= res!987987 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638787 #b00000000000000000000000000000000) (bvsge lt!638787 (size!48124 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457753 (= lt!638787 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638786 () SeekEntryResult!11826)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98572 (_ BitVec 32)) SeekEntryResult!11826)

(assert (=> b!1457753 (= lt!638786 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638789 lt!638793 mask!2687))))

(assert (=> b!1457753 (= lt!638786 (seekEntryOrOpen!0 lt!638789 lt!638793 mask!2687))))

(declare-fun b!1457754 () Bool)

(assert (=> b!1457754 (= e!820022 e!820028)))

(declare-fun res!987996 () Bool)

(assert (=> b!1457754 (=> (not res!987996) (not e!820028))))

(assert (=> b!1457754 (= res!987996 (= lt!638788 (Intermediate!11826 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457754 (= lt!638788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638789 mask!2687) lt!638789 lt!638793 mask!2687))))

(assert (=> b!1457754 (= lt!638789 (select (store (arr!47574 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457755 () Bool)

(assert (=> b!1457755 (= e!820029 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638787 intermediateAfterIndex!19 lt!638789 lt!638793 mask!2687) lt!638786)))))

(declare-fun b!1457740 () Bool)

(declare-fun res!987989 () Bool)

(assert (=> b!1457740 (=> (not res!987989) (not e!820025))))

(assert (=> b!1457740 (= res!987989 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48124 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48124 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48124 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!987998 () Bool)

(assert (=> start!125124 (=> (not res!987998) (not e!820025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125124 (= res!987998 (validMask!0 mask!2687))))

(assert (=> start!125124 e!820025))

(assert (=> start!125124 true))

(declare-fun array_inv!36602 (array!98572) Bool)

(assert (=> start!125124 (array_inv!36602 a!2862)))

(declare-fun b!1457756 () Bool)

(assert (=> b!1457756 (= e!820026 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638789 lt!638793 mask!2687) (seekEntryOrOpen!0 lt!638789 lt!638793 mask!2687)))))

(declare-fun b!1457757 () Bool)

(declare-fun res!987999 () Bool)

(assert (=> b!1457757 (=> (not res!987999) (not e!820025))))

(assert (=> b!1457757 (= res!987999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125124 res!987998) b!1457749))

(assert (= (and b!1457749 res!988000) b!1457748))

(assert (= (and b!1457748 res!987995) b!1457738))

(assert (= (and b!1457738 res!987985) b!1457757))

(assert (= (and b!1457757 res!987999) b!1457741))

(assert (= (and b!1457741 res!987992) b!1457740))

(assert (= (and b!1457740 res!987989) b!1457742))

(assert (= (and b!1457742 res!987997) b!1457737))

(assert (= (and b!1457737 res!987993) b!1457752))

(assert (= (and b!1457752 res!987986) b!1457754))

(assert (= (and b!1457754 res!987996) b!1457739))

(assert (= (and b!1457739 c!134388) b!1457751))

(assert (= (and b!1457739 (not c!134388)) b!1457756))

(assert (= (and b!1457739 res!987983) b!1457750))

(assert (= (and b!1457750 res!987994) b!1457746))

(assert (= (and b!1457746 res!987991) b!1457747))

(assert (= (and b!1457747 res!987990) b!1457743))

(assert (= (and b!1457746 (not res!987988)) b!1457753))

(assert (= (and b!1457753 (not res!987987)) b!1457744))

(assert (= (and b!1457744 (not res!987984)) b!1457736))

(assert (= (and b!1457736 c!134387) b!1457745))

(assert (= (and b!1457736 (not c!134387)) b!1457755))

(declare-fun m!1345679 () Bool)

(assert (=> b!1457746 m!1345679))

(declare-fun m!1345681 () Bool)

(assert (=> b!1457746 m!1345681))

(declare-fun m!1345683 () Bool)

(assert (=> b!1457746 m!1345683))

(declare-fun m!1345685 () Bool)

(assert (=> b!1457746 m!1345685))

(declare-fun m!1345687 () Bool)

(assert (=> b!1457746 m!1345687))

(declare-fun m!1345689 () Bool)

(assert (=> b!1457746 m!1345689))

(declare-fun m!1345691 () Bool)

(assert (=> b!1457745 m!1345691))

(assert (=> b!1457747 m!1345689))

(assert (=> b!1457747 m!1345689))

(declare-fun m!1345693 () Bool)

(assert (=> b!1457747 m!1345693))

(declare-fun m!1345695 () Bool)

(assert (=> b!1457751 m!1345695))

(assert (=> b!1457744 m!1345689))

(assert (=> b!1457744 m!1345689))

(declare-fun m!1345697 () Bool)

(assert (=> b!1457744 m!1345697))

(assert (=> b!1457742 m!1345681))

(declare-fun m!1345699 () Bool)

(assert (=> b!1457742 m!1345699))

(declare-fun m!1345701 () Bool)

(assert (=> b!1457755 m!1345701))

(declare-fun m!1345703 () Bool)

(assert (=> b!1457757 m!1345703))

(declare-fun m!1345705 () Bool)

(assert (=> b!1457741 m!1345705))

(declare-fun m!1345707 () Bool)

(assert (=> b!1457748 m!1345707))

(assert (=> b!1457748 m!1345707))

(declare-fun m!1345709 () Bool)

(assert (=> b!1457748 m!1345709))

(declare-fun m!1345711 () Bool)

(assert (=> b!1457754 m!1345711))

(assert (=> b!1457754 m!1345711))

(declare-fun m!1345713 () Bool)

(assert (=> b!1457754 m!1345713))

(assert (=> b!1457754 m!1345681))

(declare-fun m!1345715 () Bool)

(assert (=> b!1457754 m!1345715))

(assert (=> b!1457737 m!1345689))

(assert (=> b!1457737 m!1345689))

(declare-fun m!1345717 () Bool)

(assert (=> b!1457737 m!1345717))

(assert (=> b!1457737 m!1345717))

(assert (=> b!1457737 m!1345689))

(declare-fun m!1345719 () Bool)

(assert (=> b!1457737 m!1345719))

(assert (=> b!1457743 m!1345681))

(declare-fun m!1345721 () Bool)

(assert (=> b!1457743 m!1345721))

(assert (=> b!1457743 m!1345683))

(assert (=> b!1457743 m!1345685))

(assert (=> b!1457743 m!1345689))

(assert (=> b!1457738 m!1345689))

(assert (=> b!1457738 m!1345689))

(declare-fun m!1345723 () Bool)

(assert (=> b!1457738 m!1345723))

(assert (=> b!1457752 m!1345689))

(assert (=> b!1457752 m!1345689))

(declare-fun m!1345725 () Bool)

(assert (=> b!1457752 m!1345725))

(declare-fun m!1345727 () Bool)

(assert (=> start!125124 m!1345727))

(declare-fun m!1345729 () Bool)

(assert (=> start!125124 m!1345729))

(declare-fun m!1345731 () Bool)

(assert (=> b!1457756 m!1345731))

(declare-fun m!1345733 () Bool)

(assert (=> b!1457756 m!1345733))

(declare-fun m!1345735 () Bool)

(assert (=> b!1457753 m!1345735))

(assert (=> b!1457753 m!1345731))

(assert (=> b!1457753 m!1345733))

(check-sat (not b!1457745) (not b!1457755) (not b!1457753) (not b!1457756) (not b!1457746) (not b!1457757) (not b!1457741) (not start!125124) (not b!1457752) (not b!1457747) (not b!1457748) (not b!1457754) (not b!1457744) (not b!1457737) (not b!1457738) (not b!1457751))
(check-sat)
