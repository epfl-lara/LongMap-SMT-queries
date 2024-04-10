; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125372 () Bool)

(assert start!125372)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98820 0))(
  ( (array!98821 (arr!47698 (Array (_ BitVec 32) (_ BitVec 64))) (size!48248 (_ BitVec 32))) )
))
(declare-fun lt!641505 () array!98820)

(declare-fun lt!641502 () (_ BitVec 64))

(declare-fun b!1465749 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!823573 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11950 0))(
  ( (MissingZero!11950 (index!50192 (_ BitVec 32))) (Found!11950 (index!50193 (_ BitVec 32))) (Intermediate!11950 (undefined!12762 Bool) (index!50194 (_ BitVec 32)) (x!131767 (_ BitVec 32))) (Undefined!11950) (MissingVacant!11950 (index!50195 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98820 (_ BitVec 32)) SeekEntryResult!11950)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98820 (_ BitVec 32)) SeekEntryResult!11950)

(assert (=> b!1465749 (= e!823573 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641502 lt!641505 mask!2687) (seekEntryOrOpen!0 lt!641502 lt!641505 mask!2687)))))

(declare-fun b!1465750 () Bool)

(declare-fun res!994592 () Bool)

(declare-fun e!823575 () Bool)

(assert (=> b!1465750 (=> (not res!994592) (not e!823575))))

(declare-fun lt!641507 () SeekEntryResult!11950)

(declare-fun a!2862 () array!98820)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98820 (_ BitVec 32)) SeekEntryResult!11950)

(assert (=> b!1465750 (= res!994592 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47698 a!2862) j!93) a!2862 mask!2687) lt!641507))))

(declare-fun b!1465751 () Bool)

(declare-fun e!823574 () Bool)

(assert (=> b!1465751 (= e!823574 true)))

(declare-fun lt!641506 () Bool)

(declare-fun e!823572 () Bool)

(assert (=> b!1465751 (= lt!641506 e!823572)))

(declare-fun c!135096 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465751 (= c!135096 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465752 () Bool)

(declare-fun e!823577 () Bool)

(assert (=> b!1465752 (= e!823577 e!823575)))

(declare-fun res!994596 () Bool)

(assert (=> b!1465752 (=> (not res!994596) (not e!823575))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465752 (= res!994596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47698 a!2862) j!93) mask!2687) (select (arr!47698 a!2862) j!93) a!2862 mask!2687) lt!641507))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465752 (= lt!641507 (Intermediate!11950 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465754 () Bool)

(declare-fun res!994595 () Bool)

(declare-fun e!823571 () Bool)

(assert (=> b!1465754 (=> (not res!994595) (not e!823571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98820 (_ BitVec 32)) Bool)

(assert (=> b!1465754 (= res!994595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465755 () Bool)

(declare-fun lt!641508 () SeekEntryResult!11950)

(assert (=> b!1465755 (= e!823573 (= lt!641508 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641502 lt!641505 mask!2687)))))

(declare-fun b!1465756 () Bool)

(declare-fun res!994590 () Bool)

(assert (=> b!1465756 (=> (not res!994590) (not e!823571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465756 (= res!994590 (validKeyInArray!0 (select (arr!47698 a!2862) j!93)))))

(declare-fun b!1465757 () Bool)

(declare-fun res!994594 () Bool)

(assert (=> b!1465757 (=> (not res!994594) (not e!823571))))

(declare-datatypes ((List!34199 0))(
  ( (Nil!34196) (Cons!34195 (h!35545 (_ BitVec 64)) (t!48893 List!34199)) )
))
(declare-fun arrayNoDuplicates!0 (array!98820 (_ BitVec 32) List!34199) Bool)

(assert (=> b!1465757 (= res!994594 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34196))))

(declare-fun b!1465758 () Bool)

(declare-fun res!994591 () Bool)

(declare-fun e!823576 () Bool)

(assert (=> b!1465758 (=> (not res!994591) (not e!823576))))

(assert (=> b!1465758 (= res!994591 (= (seekEntryOrOpen!0 (select (arr!47698 a!2862) j!93) a!2862 mask!2687) (Found!11950 j!93)))))

(declare-fun b!1465759 () Bool)

(assert (=> b!1465759 (= e!823571 e!823577)))

(declare-fun res!994584 () Bool)

(assert (=> b!1465759 (=> (not res!994584) (not e!823577))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465759 (= res!994584 (= (select (store (arr!47698 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465759 (= lt!641505 (array!98821 (store (arr!47698 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48248 a!2862)))))

(declare-fun b!1465760 () Bool)

(declare-fun res!994583 () Bool)

(declare-fun e!823579 () Bool)

(assert (=> b!1465760 (=> (not res!994583) (not e!823579))))

(assert (=> b!1465760 (= res!994583 e!823573)))

(declare-fun c!135095 () Bool)

(assert (=> b!1465760 (= c!135095 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465761 () Bool)

(declare-fun e!823578 () Bool)

(assert (=> b!1465761 (= e!823578 e!823574)))

(declare-fun res!994586 () Bool)

(assert (=> b!1465761 (=> res!994586 e!823574)))

(declare-fun lt!641503 () (_ BitVec 32))

(assert (=> b!1465761 (= res!994586 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641503 #b00000000000000000000000000000000) (bvsge lt!641503 (size!48248 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465761 (= lt!641503 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465762 () Bool)

(assert (=> b!1465762 (= e!823572 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641503 intermediateAfterIndex!19 lt!641502 lt!641505 mask!2687) (seekEntryOrOpen!0 lt!641502 lt!641505 mask!2687))))))

(declare-fun b!1465763 () Bool)

(declare-fun res!994588 () Bool)

(assert (=> b!1465763 (=> res!994588 e!823574)))

(assert (=> b!1465763 (= res!994588 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641503 (select (arr!47698 a!2862) j!93) a!2862 mask!2687) lt!641507)))))

(declare-fun b!1465764 () Bool)

(declare-fun res!994589 () Bool)

(assert (=> b!1465764 (=> (not res!994589) (not e!823571))))

(assert (=> b!1465764 (= res!994589 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48248 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48248 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48248 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465765 () Bool)

(assert (=> b!1465765 (= e!823579 (not e!823578))))

(declare-fun res!994597 () Bool)

(assert (=> b!1465765 (=> res!994597 e!823578)))

(assert (=> b!1465765 (= res!994597 (or (and (= (select (arr!47698 a!2862) index!646) (select (store (arr!47698 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47698 a!2862) index!646) (select (arr!47698 a!2862) j!93))) (= (select (arr!47698 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465765 e!823576))

(declare-fun res!994580 () Bool)

(assert (=> b!1465765 (=> (not res!994580) (not e!823576))))

(assert (=> b!1465765 (= res!994580 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49396 0))(
  ( (Unit!49397) )
))
(declare-fun lt!641504 () Unit!49396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49396)

(assert (=> b!1465765 (= lt!641504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465766 () Bool)

(assert (=> b!1465766 (= e!823572 (not (= lt!641508 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641503 lt!641502 lt!641505 mask!2687))))))

(declare-fun res!994593 () Bool)

(assert (=> start!125372 (=> (not res!994593) (not e!823571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125372 (= res!994593 (validMask!0 mask!2687))))

(assert (=> start!125372 e!823571))

(assert (=> start!125372 true))

(declare-fun array_inv!36726 (array!98820) Bool)

(assert (=> start!125372 (array_inv!36726 a!2862)))

(declare-fun b!1465753 () Bool)

(declare-fun res!994587 () Bool)

(assert (=> b!1465753 (=> (not res!994587) (not e!823571))))

(assert (=> b!1465753 (= res!994587 (and (= (size!48248 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48248 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48248 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465767 () Bool)

(declare-fun res!994581 () Bool)

(assert (=> b!1465767 (=> (not res!994581) (not e!823579))))

(assert (=> b!1465767 (= res!994581 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465768 () Bool)

(assert (=> b!1465768 (= e!823575 e!823579)))

(declare-fun res!994585 () Bool)

(assert (=> b!1465768 (=> (not res!994585) (not e!823579))))

(assert (=> b!1465768 (= res!994585 (= lt!641508 (Intermediate!11950 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465768 (= lt!641508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641502 mask!2687) lt!641502 lt!641505 mask!2687))))

(assert (=> b!1465768 (= lt!641502 (select (store (arr!47698 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465769 () Bool)

(declare-fun res!994582 () Bool)

(assert (=> b!1465769 (=> (not res!994582) (not e!823571))))

(assert (=> b!1465769 (= res!994582 (validKeyInArray!0 (select (arr!47698 a!2862) i!1006)))))

(declare-fun b!1465770 () Bool)

(assert (=> b!1465770 (= e!823576 (or (= (select (arr!47698 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47698 a!2862) intermediateBeforeIndex!19) (select (arr!47698 a!2862) j!93))))))

(assert (= (and start!125372 res!994593) b!1465753))

(assert (= (and b!1465753 res!994587) b!1465769))

(assert (= (and b!1465769 res!994582) b!1465756))

(assert (= (and b!1465756 res!994590) b!1465754))

(assert (= (and b!1465754 res!994595) b!1465757))

(assert (= (and b!1465757 res!994594) b!1465764))

(assert (= (and b!1465764 res!994589) b!1465759))

(assert (= (and b!1465759 res!994584) b!1465752))

(assert (= (and b!1465752 res!994596) b!1465750))

(assert (= (and b!1465750 res!994592) b!1465768))

(assert (= (and b!1465768 res!994585) b!1465760))

(assert (= (and b!1465760 c!135095) b!1465755))

(assert (= (and b!1465760 (not c!135095)) b!1465749))

(assert (= (and b!1465760 res!994583) b!1465767))

(assert (= (and b!1465767 res!994581) b!1465765))

(assert (= (and b!1465765 res!994580) b!1465758))

(assert (= (and b!1465758 res!994591) b!1465770))

(assert (= (and b!1465765 (not res!994597)) b!1465761))

(assert (= (and b!1465761 (not res!994586)) b!1465763))

(assert (= (and b!1465763 (not res!994588)) b!1465751))

(assert (= (and b!1465751 c!135096) b!1465766))

(assert (= (and b!1465751 (not c!135096)) b!1465762))

(declare-fun m!1352805 () Bool)

(assert (=> start!125372 m!1352805))

(declare-fun m!1352807 () Bool)

(assert (=> start!125372 m!1352807))

(declare-fun m!1352809 () Bool)

(assert (=> b!1465758 m!1352809))

(assert (=> b!1465758 m!1352809))

(declare-fun m!1352811 () Bool)

(assert (=> b!1465758 m!1352811))

(assert (=> b!1465763 m!1352809))

(assert (=> b!1465763 m!1352809))

(declare-fun m!1352813 () Bool)

(assert (=> b!1465763 m!1352813))

(declare-fun m!1352815 () Bool)

(assert (=> b!1465766 m!1352815))

(declare-fun m!1352817 () Bool)

(assert (=> b!1465757 m!1352817))

(assert (=> b!1465756 m!1352809))

(assert (=> b!1465756 m!1352809))

(declare-fun m!1352819 () Bool)

(assert (=> b!1465756 m!1352819))

(declare-fun m!1352821 () Bool)

(assert (=> b!1465754 m!1352821))

(declare-fun m!1352823 () Bool)

(assert (=> b!1465755 m!1352823))

(declare-fun m!1352825 () Bool)

(assert (=> b!1465761 m!1352825))

(declare-fun m!1352827 () Bool)

(assert (=> b!1465769 m!1352827))

(assert (=> b!1465769 m!1352827))

(declare-fun m!1352829 () Bool)

(assert (=> b!1465769 m!1352829))

(declare-fun m!1352831 () Bool)

(assert (=> b!1465749 m!1352831))

(declare-fun m!1352833 () Bool)

(assert (=> b!1465749 m!1352833))

(assert (=> b!1465750 m!1352809))

(assert (=> b!1465750 m!1352809))

(declare-fun m!1352835 () Bool)

(assert (=> b!1465750 m!1352835))

(declare-fun m!1352837 () Bool)

(assert (=> b!1465759 m!1352837))

(declare-fun m!1352839 () Bool)

(assert (=> b!1465759 m!1352839))

(declare-fun m!1352841 () Bool)

(assert (=> b!1465762 m!1352841))

(assert (=> b!1465762 m!1352833))

(declare-fun m!1352843 () Bool)

(assert (=> b!1465770 m!1352843))

(assert (=> b!1465770 m!1352809))

(declare-fun m!1352845 () Bool)

(assert (=> b!1465768 m!1352845))

(assert (=> b!1465768 m!1352845))

(declare-fun m!1352847 () Bool)

(assert (=> b!1465768 m!1352847))

(assert (=> b!1465768 m!1352837))

(declare-fun m!1352849 () Bool)

(assert (=> b!1465768 m!1352849))

(assert (=> b!1465752 m!1352809))

(assert (=> b!1465752 m!1352809))

(declare-fun m!1352851 () Bool)

(assert (=> b!1465752 m!1352851))

(assert (=> b!1465752 m!1352851))

(assert (=> b!1465752 m!1352809))

(declare-fun m!1352853 () Bool)

(assert (=> b!1465752 m!1352853))

(declare-fun m!1352855 () Bool)

(assert (=> b!1465765 m!1352855))

(assert (=> b!1465765 m!1352837))

(declare-fun m!1352857 () Bool)

(assert (=> b!1465765 m!1352857))

(declare-fun m!1352859 () Bool)

(assert (=> b!1465765 m!1352859))

(declare-fun m!1352861 () Bool)

(assert (=> b!1465765 m!1352861))

(assert (=> b!1465765 m!1352809))

(push 1)

