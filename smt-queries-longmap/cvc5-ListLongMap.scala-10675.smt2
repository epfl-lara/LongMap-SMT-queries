; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125188 () Bool)

(assert start!125188)

(declare-fun b!1459848 () Bool)

(declare-fun res!989714 () Bool)

(declare-fun e!820929 () Bool)

(assert (=> b!1459848 (=> (not res!989714) (not e!820929))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98636 0))(
  ( (array!98637 (arr!47606 (Array (_ BitVec 32) (_ BitVec 64))) (size!48156 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98636)

(assert (=> b!1459848 (= res!989714 (and (= (size!48156 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48156 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48156 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11858 0))(
  ( (MissingZero!11858 (index!49824 (_ BitVec 32))) (Found!11858 (index!49825 (_ BitVec 32))) (Intermediate!11858 (undefined!12670 Bool) (index!49826 (_ BitVec 32)) (x!131435 (_ BitVec 32))) (Undefined!11858) (MissingVacant!11858 (index!49827 (_ BitVec 32))) )
))
(declare-fun lt!639610 () SeekEntryResult!11858)

(declare-fun lt!639613 () (_ BitVec 32))

(declare-fun lt!639614 () (_ BitVec 64))

(declare-fun lt!639616 () array!98636)

(declare-fun b!1459849 () Bool)

(declare-fun e!820931 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98636 (_ BitVec 32)) SeekEntryResult!11858)

(assert (=> b!1459849 (= e!820931 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639613 intermediateAfterIndex!19 lt!639614 lt!639616 mask!2687) lt!639610)))))

(declare-fun b!1459850 () Bool)

(declare-fun e!820933 () Bool)

(declare-fun e!820926 () Bool)

(assert (=> b!1459850 (= e!820933 (not e!820926))))

(declare-fun res!989721 () Bool)

(assert (=> b!1459850 (=> res!989721 e!820926)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1459850 (= res!989721 (or (and (= (select (arr!47606 a!2862) index!646) (select (store (arr!47606 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47606 a!2862) index!646) (select (arr!47606 a!2862) j!93))) (= (select (arr!47606 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!639618 () SeekEntryResult!11858)

(assert (=> b!1459850 (and (= lt!639618 (Found!11858 j!93)) (or (= (select (arr!47606 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47606 a!2862) intermediateBeforeIndex!19) (select (arr!47606 a!2862) j!93))) (let ((bdg!53545 (select (store (arr!47606 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47606 a!2862) index!646) bdg!53545) (= (select (arr!47606 a!2862) index!646) (select (arr!47606 a!2862) j!93))) (= (select (arr!47606 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53545 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98636 (_ BitVec 32)) SeekEntryResult!11858)

(assert (=> b!1459850 (= lt!639618 (seekEntryOrOpen!0 (select (arr!47606 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98636 (_ BitVec 32)) Bool)

(assert (=> b!1459850 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49212 0))(
  ( (Unit!49213) )
))
(declare-fun lt!639615 () Unit!49212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49212)

(assert (=> b!1459850 (= lt!639615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459851 () Bool)

(declare-fun e!820930 () Bool)

(assert (=> b!1459851 (= e!820926 e!820930)))

(declare-fun res!989720 () Bool)

(assert (=> b!1459851 (=> res!989720 e!820930)))

(assert (=> b!1459851 (= res!989720 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639613 #b00000000000000000000000000000000) (bvsge lt!639613 (size!48156 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459851 (= lt!639613 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459851 (= lt!639610 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639614 lt!639616 mask!2687))))

(assert (=> b!1459851 (= lt!639610 (seekEntryOrOpen!0 lt!639614 lt!639616 mask!2687))))

(declare-fun b!1459853 () Bool)

(declare-fun e!820928 () Bool)

(assert (=> b!1459853 (= e!820928 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639614 lt!639616 mask!2687) (seekEntryOrOpen!0 lt!639614 lt!639616 mask!2687)))))

(declare-fun b!1459854 () Bool)

(declare-fun res!989712 () Bool)

(assert (=> b!1459854 (=> res!989712 e!820930)))

(declare-fun lt!639617 () SeekEntryResult!11858)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98636 (_ BitVec 32)) SeekEntryResult!11858)

(assert (=> b!1459854 (= res!989712 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639613 (select (arr!47606 a!2862) j!93) a!2862 mask!2687) lt!639617)))))

(declare-fun b!1459855 () Bool)

(declare-fun e!820927 () Bool)

(assert (=> b!1459855 (= e!820927 e!820933)))

(declare-fun res!989713 () Bool)

(assert (=> b!1459855 (=> (not res!989713) (not e!820933))))

(declare-fun lt!639612 () SeekEntryResult!11858)

(assert (=> b!1459855 (= res!989713 (= lt!639612 (Intermediate!11858 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459855 (= lt!639612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639614 mask!2687) lt!639614 lt!639616 mask!2687))))

(assert (=> b!1459855 (= lt!639614 (select (store (arr!47606 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459856 () Bool)

(declare-fun res!989724 () Bool)

(assert (=> b!1459856 (=> (not res!989724) (not e!820929))))

(assert (=> b!1459856 (= res!989724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459857 () Bool)

(assert (=> b!1459857 (= e!820931 (not (= lt!639612 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639613 lt!639614 lt!639616 mask!2687))))))

(declare-fun b!1459858 () Bool)

(declare-fun res!989725 () Bool)

(assert (=> b!1459858 (=> (not res!989725) (not e!820929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459858 (= res!989725 (validKeyInArray!0 (select (arr!47606 a!2862) i!1006)))))

(declare-fun b!1459859 () Bool)

(assert (=> b!1459859 (= e!820930 true)))

(assert (=> b!1459859 (= lt!639618 lt!639610)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lt!639611 () Unit!49212)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49212)

(assert (=> b!1459859 (= lt!639611 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639613 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459860 () Bool)

(declare-fun e!820934 () Bool)

(assert (=> b!1459860 (= e!820934 e!820927)))

(declare-fun res!989715 () Bool)

(assert (=> b!1459860 (=> (not res!989715) (not e!820927))))

(assert (=> b!1459860 (= res!989715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47606 a!2862) j!93) mask!2687) (select (arr!47606 a!2862) j!93) a!2862 mask!2687) lt!639617))))

(assert (=> b!1459860 (= lt!639617 (Intermediate!11858 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459852 () Bool)

(declare-fun res!989711 () Bool)

(assert (=> b!1459852 (=> (not res!989711) (not e!820929))))

(declare-datatypes ((List!34107 0))(
  ( (Nil!34104) (Cons!34103 (h!35453 (_ BitVec 64)) (t!48801 List!34107)) )
))
(declare-fun arrayNoDuplicates!0 (array!98636 (_ BitVec 32) List!34107) Bool)

(assert (=> b!1459852 (= res!989711 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34104))))

(declare-fun res!989726 () Bool)

(assert (=> start!125188 (=> (not res!989726) (not e!820929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125188 (= res!989726 (validMask!0 mask!2687))))

(assert (=> start!125188 e!820929))

(assert (=> start!125188 true))

(declare-fun array_inv!36634 (array!98636) Bool)

(assert (=> start!125188 (array_inv!36634 a!2862)))

(declare-fun b!1459861 () Bool)

(declare-fun res!989728 () Bool)

(assert (=> b!1459861 (=> (not res!989728) (not e!820929))))

(assert (=> b!1459861 (= res!989728 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48156 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48156 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48156 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459862 () Bool)

(declare-fun res!989716 () Bool)

(assert (=> b!1459862 (=> res!989716 e!820930)))

(assert (=> b!1459862 (= res!989716 e!820931)))

(declare-fun c!134579 () Bool)

(assert (=> b!1459862 (= c!134579 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459863 () Bool)

(declare-fun res!989719 () Bool)

(assert (=> b!1459863 (=> (not res!989719) (not e!820929))))

(assert (=> b!1459863 (= res!989719 (validKeyInArray!0 (select (arr!47606 a!2862) j!93)))))

(declare-fun b!1459864 () Bool)

(declare-fun res!989727 () Bool)

(assert (=> b!1459864 (=> (not res!989727) (not e!820927))))

(assert (=> b!1459864 (= res!989727 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47606 a!2862) j!93) a!2862 mask!2687) lt!639617))))

(declare-fun b!1459865 () Bool)

(assert (=> b!1459865 (= e!820929 e!820934)))

(declare-fun res!989722 () Bool)

(assert (=> b!1459865 (=> (not res!989722) (not e!820934))))

(assert (=> b!1459865 (= res!989722 (= (select (store (arr!47606 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459865 (= lt!639616 (array!98637 (store (arr!47606 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48156 a!2862)))))

(declare-fun b!1459866 () Bool)

(declare-fun res!989723 () Bool)

(assert (=> b!1459866 (=> (not res!989723) (not e!820933))))

(assert (=> b!1459866 (= res!989723 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459867 () Bool)

(assert (=> b!1459867 (= e!820928 (= lt!639612 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639614 lt!639616 mask!2687)))))

(declare-fun b!1459868 () Bool)

(declare-fun res!989717 () Bool)

(assert (=> b!1459868 (=> (not res!989717) (not e!820933))))

(assert (=> b!1459868 (= res!989717 e!820928)))

(declare-fun c!134580 () Bool)

(assert (=> b!1459868 (= c!134580 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459869 () Bool)

(declare-fun res!989718 () Bool)

(assert (=> b!1459869 (=> res!989718 e!820930)))

(assert (=> b!1459869 (= res!989718 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(assert (= (and start!125188 res!989726) b!1459848))

(assert (= (and b!1459848 res!989714) b!1459858))

(assert (= (and b!1459858 res!989725) b!1459863))

(assert (= (and b!1459863 res!989719) b!1459856))

(assert (= (and b!1459856 res!989724) b!1459852))

(assert (= (and b!1459852 res!989711) b!1459861))

(assert (= (and b!1459861 res!989728) b!1459865))

(assert (= (and b!1459865 res!989722) b!1459860))

(assert (= (and b!1459860 res!989715) b!1459864))

(assert (= (and b!1459864 res!989727) b!1459855))

(assert (= (and b!1459855 res!989713) b!1459868))

(assert (= (and b!1459868 c!134580) b!1459867))

(assert (= (and b!1459868 (not c!134580)) b!1459853))

(assert (= (and b!1459868 res!989717) b!1459866))

(assert (= (and b!1459866 res!989723) b!1459850))

(assert (= (and b!1459850 (not res!989721)) b!1459851))

(assert (= (and b!1459851 (not res!989720)) b!1459854))

(assert (= (and b!1459854 (not res!989712)) b!1459862))

(assert (= (and b!1459862 c!134579) b!1459857))

(assert (= (and b!1459862 (not c!134579)) b!1459849))

(assert (= (and b!1459862 (not res!989716)) b!1459869))

(assert (= (and b!1459869 (not res!989718)) b!1459859))

(declare-fun m!1347571 () Bool)

(assert (=> b!1459864 m!1347571))

(assert (=> b!1459864 m!1347571))

(declare-fun m!1347573 () Bool)

(assert (=> b!1459864 m!1347573))

(assert (=> b!1459854 m!1347571))

(assert (=> b!1459854 m!1347571))

(declare-fun m!1347575 () Bool)

(assert (=> b!1459854 m!1347575))

(declare-fun m!1347577 () Bool)

(assert (=> b!1459850 m!1347577))

(declare-fun m!1347579 () Bool)

(assert (=> b!1459850 m!1347579))

(declare-fun m!1347581 () Bool)

(assert (=> b!1459850 m!1347581))

(declare-fun m!1347583 () Bool)

(assert (=> b!1459850 m!1347583))

(declare-fun m!1347585 () Bool)

(assert (=> b!1459850 m!1347585))

(assert (=> b!1459850 m!1347571))

(declare-fun m!1347587 () Bool)

(assert (=> b!1459850 m!1347587))

(declare-fun m!1347589 () Bool)

(assert (=> b!1459850 m!1347589))

(assert (=> b!1459850 m!1347571))

(declare-fun m!1347591 () Bool)

(assert (=> b!1459856 m!1347591))

(assert (=> b!1459863 m!1347571))

(assert (=> b!1459863 m!1347571))

(declare-fun m!1347593 () Bool)

(assert (=> b!1459863 m!1347593))

(declare-fun m!1347595 () Bool)

(assert (=> b!1459852 m!1347595))

(assert (=> b!1459865 m!1347579))

(declare-fun m!1347597 () Bool)

(assert (=> b!1459865 m!1347597))

(declare-fun m!1347599 () Bool)

(assert (=> b!1459867 m!1347599))

(assert (=> b!1459860 m!1347571))

(assert (=> b!1459860 m!1347571))

(declare-fun m!1347601 () Bool)

(assert (=> b!1459860 m!1347601))

(assert (=> b!1459860 m!1347601))

(assert (=> b!1459860 m!1347571))

(declare-fun m!1347603 () Bool)

(assert (=> b!1459860 m!1347603))

(declare-fun m!1347605 () Bool)

(assert (=> b!1459853 m!1347605))

(declare-fun m!1347607 () Bool)

(assert (=> b!1459853 m!1347607))

(declare-fun m!1347609 () Bool)

(assert (=> start!125188 m!1347609))

(declare-fun m!1347611 () Bool)

(assert (=> start!125188 m!1347611))

(declare-fun m!1347613 () Bool)

(assert (=> b!1459851 m!1347613))

(assert (=> b!1459851 m!1347605))

(assert (=> b!1459851 m!1347607))

(declare-fun m!1347615 () Bool)

(assert (=> b!1459858 m!1347615))

(assert (=> b!1459858 m!1347615))

(declare-fun m!1347617 () Bool)

(assert (=> b!1459858 m!1347617))

(declare-fun m!1347619 () Bool)

(assert (=> b!1459857 m!1347619))

(declare-fun m!1347621 () Bool)

(assert (=> b!1459855 m!1347621))

(assert (=> b!1459855 m!1347621))

(declare-fun m!1347623 () Bool)

(assert (=> b!1459855 m!1347623))

(assert (=> b!1459855 m!1347579))

(declare-fun m!1347625 () Bool)

(assert (=> b!1459855 m!1347625))

(declare-fun m!1347627 () Bool)

(assert (=> b!1459849 m!1347627))

(declare-fun m!1347629 () Bool)

(assert (=> b!1459859 m!1347629))

(push 1)

