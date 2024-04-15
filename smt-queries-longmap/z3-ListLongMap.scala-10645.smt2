; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124978 () Bool)

(assert start!124978)

(declare-fun b!1453713 () Bool)

(declare-fun e!818174 () Bool)

(declare-fun e!818167 () Bool)

(assert (=> b!1453713 (= e!818174 e!818167)))

(declare-fun res!984779 () Bool)

(assert (=> b!1453713 (=> (not res!984779) (not e!818167))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98404 0))(
  ( (array!98405 (arr!47491 (Array (_ BitVec 32) (_ BitVec 64))) (size!48043 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98404)

(assert (=> b!1453713 (= res!984779 (= (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637167 () array!98404)

(assert (=> b!1453713 (= lt!637167 (array!98405 (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48043 a!2862)))))

(declare-fun res!984777 () Bool)

(assert (=> start!124978 (=> (not res!984777) (not e!818174))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124978 (= res!984777 (validMask!0 mask!2687))))

(assert (=> start!124978 e!818174))

(assert (=> start!124978 true))

(declare-fun array_inv!36724 (array!98404) Bool)

(assert (=> start!124978 (array_inv!36724 a!2862)))

(declare-fun b!1453714 () Bool)

(declare-fun e!818170 () Bool)

(declare-fun e!818169 () Bool)

(assert (=> b!1453714 (= e!818170 (not e!818169))))

(declare-fun res!984789 () Bool)

(assert (=> b!1453714 (=> res!984789 e!818169)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1453714 (= res!984789 (or (and (= (select (arr!47491 a!2862) index!646) (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47491 a!2862) index!646) (select (arr!47491 a!2862) j!93))) (= (select (arr!47491 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818173 () Bool)

(assert (=> b!1453714 e!818173))

(declare-fun res!984788 () Bool)

(assert (=> b!1453714 (=> (not res!984788) (not e!818173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98404 (_ BitVec 32)) Bool)

(assert (=> b!1453714 (= res!984788 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48873 0))(
  ( (Unit!48874) )
))
(declare-fun lt!637160 () Unit!48873)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48873)

(assert (=> b!1453714 (= lt!637160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453715 () Bool)

(declare-fun e!818168 () Bool)

(assert (=> b!1453715 (= e!818167 e!818168)))

(declare-fun res!984783 () Bool)

(assert (=> b!1453715 (=> (not res!984783) (not e!818168))))

(declare-datatypes ((SeekEntryResult!11768 0))(
  ( (MissingZero!11768 (index!49464 (_ BitVec 32))) (Found!11768 (index!49465 (_ BitVec 32))) (Intermediate!11768 (undefined!12580 Bool) (index!49466 (_ BitVec 32)) (x!131100 (_ BitVec 32))) (Undefined!11768) (MissingVacant!11768 (index!49467 (_ BitVec 32))) )
))
(declare-fun lt!637163 () SeekEntryResult!11768)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98404 (_ BitVec 32)) SeekEntryResult!11768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453715 (= res!984783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47491 a!2862) j!93) mask!2687) (select (arr!47491 a!2862) j!93) a!2862 mask!2687) lt!637163))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453715 (= lt!637163 (Intermediate!11768 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453716 () Bool)

(declare-fun res!984774 () Bool)

(assert (=> b!1453716 (=> (not res!984774) (not e!818174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453716 (= res!984774 (validKeyInArray!0 (select (arr!47491 a!2862) i!1006)))))

(declare-fun b!1453717 () Bool)

(declare-fun e!818175 () Bool)

(declare-fun lt!637161 () SeekEntryResult!11768)

(declare-fun lt!637165 () (_ BitVec 64))

(assert (=> b!1453717 (= e!818175 (= lt!637161 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637165 lt!637167 mask!2687)))))

(declare-fun e!818166 () Bool)

(declare-fun b!1453718 () Bool)

(declare-fun lt!637164 () (_ BitVec 32))

(assert (=> b!1453718 (= e!818166 (not (= lt!637161 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637164 lt!637165 lt!637167 mask!2687))))))

(declare-fun lt!637166 () SeekEntryResult!11768)

(declare-fun b!1453719 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98404 (_ BitVec 32)) SeekEntryResult!11768)

(assert (=> b!1453719 (= e!818166 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637164 intermediateAfterIndex!19 lt!637165 lt!637167 mask!2687) lt!637166)))))

(declare-fun b!1453720 () Bool)

(assert (=> b!1453720 (= e!818168 e!818170)))

(declare-fun res!984775 () Bool)

(assert (=> b!1453720 (=> (not res!984775) (not e!818170))))

(assert (=> b!1453720 (= res!984775 (= lt!637161 (Intermediate!11768 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453720 (= lt!637161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637165 mask!2687) lt!637165 lt!637167 mask!2687))))

(assert (=> b!1453720 (= lt!637165 (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453721 () Bool)

(declare-fun res!984787 () Bool)

(assert (=> b!1453721 (=> (not res!984787) (not e!818174))))

(declare-datatypes ((List!34070 0))(
  ( (Nil!34067) (Cons!34066 (h!35416 (_ BitVec 64)) (t!48756 List!34070)) )
))
(declare-fun arrayNoDuplicates!0 (array!98404 (_ BitVec 32) List!34070) Bool)

(assert (=> b!1453721 (= res!984787 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34067))))

(declare-fun b!1453722 () Bool)

(declare-fun res!984785 () Bool)

(assert (=> b!1453722 (=> (not res!984785) (not e!818174))))

(assert (=> b!1453722 (= res!984785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453723 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98404 (_ BitVec 32)) SeekEntryResult!11768)

(assert (=> b!1453723 (= e!818175 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637165 lt!637167 mask!2687) (seekEntryOrOpen!0 lt!637165 lt!637167 mask!2687)))))

(declare-fun b!1453724 () Bool)

(declare-fun res!984780 () Bool)

(assert (=> b!1453724 (=> (not res!984780) (not e!818168))))

(assert (=> b!1453724 (= res!984780 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47491 a!2862) j!93) a!2862 mask!2687) lt!637163))))

(declare-fun b!1453725 () Bool)

(declare-fun res!984782 () Bool)

(assert (=> b!1453725 (=> (not res!984782) (not e!818174))))

(assert (=> b!1453725 (= res!984782 (validKeyInArray!0 (select (arr!47491 a!2862) j!93)))))

(declare-fun b!1453726 () Bool)

(declare-fun res!984778 () Bool)

(assert (=> b!1453726 (=> (not res!984778) (not e!818170))))

(assert (=> b!1453726 (= res!984778 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453727 () Bool)

(declare-fun res!984786 () Bool)

(assert (=> b!1453727 (=> (not res!984786) (not e!818173))))

(assert (=> b!1453727 (= res!984786 (= (seekEntryOrOpen!0 (select (arr!47491 a!2862) j!93) a!2862 mask!2687) (Found!11768 j!93)))))

(declare-fun b!1453728 () Bool)

(declare-fun res!984773 () Bool)

(assert (=> b!1453728 (=> (not res!984773) (not e!818174))))

(assert (=> b!1453728 (= res!984773 (and (= (size!48043 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48043 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48043 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453729 () Bool)

(declare-fun e!818172 () Bool)

(assert (=> b!1453729 (= e!818172 true)))

(declare-fun lt!637162 () Bool)

(assert (=> b!1453729 (= lt!637162 e!818166)))

(declare-fun c!133984 () Bool)

(assert (=> b!1453729 (= c!133984 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1453730 () Bool)

(assert (=> b!1453730 (= e!818173 (and (or (= (select (arr!47491 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47491 a!2862) intermediateBeforeIndex!19) (select (arr!47491 a!2862) j!93))) (let ((bdg!53017 (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47491 a!2862) index!646) bdg!53017) (= (select (arr!47491 a!2862) index!646) (select (arr!47491 a!2862) j!93))) (= (select (arr!47491 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53017 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1453731 () Bool)

(declare-fun res!984781 () Bool)

(assert (=> b!1453731 (=> res!984781 e!818172)))

(assert (=> b!1453731 (= res!984781 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637164 (select (arr!47491 a!2862) j!93) a!2862 mask!2687) lt!637163)))))

(declare-fun b!1453732 () Bool)

(assert (=> b!1453732 (= e!818169 e!818172)))

(declare-fun res!984784 () Bool)

(assert (=> b!1453732 (=> res!984784 e!818172)))

(assert (=> b!1453732 (= res!984784 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637164 #b00000000000000000000000000000000) (bvsge lt!637164 (size!48043 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453732 (= lt!637164 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1453732 (= lt!637166 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637165 lt!637167 mask!2687))))

(assert (=> b!1453732 (= lt!637166 (seekEntryOrOpen!0 lt!637165 lt!637167 mask!2687))))

(declare-fun b!1453733 () Bool)

(declare-fun res!984790 () Bool)

(assert (=> b!1453733 (=> (not res!984790) (not e!818170))))

(assert (=> b!1453733 (= res!984790 e!818175)))

(declare-fun c!133983 () Bool)

(assert (=> b!1453733 (= c!133983 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453734 () Bool)

(declare-fun res!984776 () Bool)

(assert (=> b!1453734 (=> (not res!984776) (not e!818174))))

(assert (=> b!1453734 (= res!984776 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48043 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48043 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48043 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124978 res!984777) b!1453728))

(assert (= (and b!1453728 res!984773) b!1453716))

(assert (= (and b!1453716 res!984774) b!1453725))

(assert (= (and b!1453725 res!984782) b!1453722))

(assert (= (and b!1453722 res!984785) b!1453721))

(assert (= (and b!1453721 res!984787) b!1453734))

(assert (= (and b!1453734 res!984776) b!1453713))

(assert (= (and b!1453713 res!984779) b!1453715))

(assert (= (and b!1453715 res!984783) b!1453724))

(assert (= (and b!1453724 res!984780) b!1453720))

(assert (= (and b!1453720 res!984775) b!1453733))

(assert (= (and b!1453733 c!133983) b!1453717))

(assert (= (and b!1453733 (not c!133983)) b!1453723))

(assert (= (and b!1453733 res!984790) b!1453726))

(assert (= (and b!1453726 res!984778) b!1453714))

(assert (= (and b!1453714 res!984788) b!1453727))

(assert (= (and b!1453727 res!984786) b!1453730))

(assert (= (and b!1453714 (not res!984789)) b!1453732))

(assert (= (and b!1453732 (not res!984784)) b!1453731))

(assert (= (and b!1453731 (not res!984781)) b!1453729))

(assert (= (and b!1453729 c!133984) b!1453718))

(assert (= (and b!1453729 (not c!133984)) b!1453719))

(declare-fun m!1341639 () Bool)

(assert (=> b!1453716 m!1341639))

(assert (=> b!1453716 m!1341639))

(declare-fun m!1341641 () Bool)

(assert (=> b!1453716 m!1341641))

(declare-fun m!1341643 () Bool)

(assert (=> b!1453731 m!1341643))

(assert (=> b!1453731 m!1341643))

(declare-fun m!1341645 () Bool)

(assert (=> b!1453731 m!1341645))

(declare-fun m!1341647 () Bool)

(assert (=> b!1453719 m!1341647))

(declare-fun m!1341649 () Bool)

(assert (=> b!1453722 m!1341649))

(assert (=> b!1453715 m!1341643))

(assert (=> b!1453715 m!1341643))

(declare-fun m!1341651 () Bool)

(assert (=> b!1453715 m!1341651))

(assert (=> b!1453715 m!1341651))

(assert (=> b!1453715 m!1341643))

(declare-fun m!1341653 () Bool)

(assert (=> b!1453715 m!1341653))

(assert (=> b!1453724 m!1341643))

(assert (=> b!1453724 m!1341643))

(declare-fun m!1341655 () Bool)

(assert (=> b!1453724 m!1341655))

(assert (=> b!1453725 m!1341643))

(assert (=> b!1453725 m!1341643))

(declare-fun m!1341657 () Bool)

(assert (=> b!1453725 m!1341657))

(declare-fun m!1341659 () Bool)

(assert (=> b!1453723 m!1341659))

(declare-fun m!1341661 () Bool)

(assert (=> b!1453723 m!1341661))

(declare-fun m!1341663 () Bool)

(assert (=> b!1453730 m!1341663))

(declare-fun m!1341665 () Bool)

(assert (=> b!1453730 m!1341665))

(declare-fun m!1341667 () Bool)

(assert (=> b!1453730 m!1341667))

(declare-fun m!1341669 () Bool)

(assert (=> b!1453730 m!1341669))

(assert (=> b!1453730 m!1341643))

(assert (=> b!1453727 m!1341643))

(assert (=> b!1453727 m!1341643))

(declare-fun m!1341671 () Bool)

(assert (=> b!1453727 m!1341671))

(declare-fun m!1341673 () Bool)

(assert (=> b!1453721 m!1341673))

(declare-fun m!1341675 () Bool)

(assert (=> b!1453717 m!1341675))

(assert (=> b!1453713 m!1341663))

(declare-fun m!1341677 () Bool)

(assert (=> b!1453713 m!1341677))

(declare-fun m!1341679 () Bool)

(assert (=> b!1453714 m!1341679))

(assert (=> b!1453714 m!1341663))

(assert (=> b!1453714 m!1341667))

(assert (=> b!1453714 m!1341669))

(declare-fun m!1341681 () Bool)

(assert (=> b!1453714 m!1341681))

(assert (=> b!1453714 m!1341643))

(declare-fun m!1341683 () Bool)

(assert (=> b!1453732 m!1341683))

(assert (=> b!1453732 m!1341659))

(assert (=> b!1453732 m!1341661))

(declare-fun m!1341685 () Bool)

(assert (=> start!124978 m!1341685))

(declare-fun m!1341687 () Bool)

(assert (=> start!124978 m!1341687))

(declare-fun m!1341689 () Bool)

(assert (=> b!1453720 m!1341689))

(assert (=> b!1453720 m!1341689))

(declare-fun m!1341691 () Bool)

(assert (=> b!1453720 m!1341691))

(assert (=> b!1453720 m!1341663))

(declare-fun m!1341693 () Bool)

(assert (=> b!1453720 m!1341693))

(declare-fun m!1341695 () Bool)

(assert (=> b!1453718 m!1341695))

(check-sat (not b!1453727) (not b!1453714) (not b!1453723) (not b!1453715) (not b!1453732) (not b!1453719) (not b!1453720) (not b!1453718) (not b!1453724) (not b!1453717) (not start!124978) (not b!1453721) (not b!1453716) (not b!1453725) (not b!1453731) (not b!1453722))
(check-sat)
