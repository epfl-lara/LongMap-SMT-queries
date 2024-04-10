; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125374 () Bool)

(assert start!125374)

(declare-fun e!823606 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98822 0))(
  ( (array!98823 (arr!47699 (Array (_ BitVec 32) (_ BitVec 64))) (size!48249 (_ BitVec 32))) )
))
(declare-fun lt!641525 () array!98822)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1465815 () Bool)

(declare-fun lt!641531 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11951 0))(
  ( (MissingZero!11951 (index!50196 (_ BitVec 32))) (Found!11951 (index!50197 (_ BitVec 32))) (Intermediate!11951 (undefined!12763 Bool) (index!50198 (_ BitVec 32)) (x!131776 (_ BitVec 32))) (Undefined!11951) (MissingVacant!11951 (index!50199 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98822 (_ BitVec 32)) SeekEntryResult!11951)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98822 (_ BitVec 32)) SeekEntryResult!11951)

(assert (=> b!1465815 (= e!823606 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641531 lt!641525 mask!2687) (seekEntryOrOpen!0 lt!641531 lt!641525 mask!2687)))))

(declare-fun b!1465816 () Bool)

(declare-fun res!994644 () Bool)

(declare-fun e!823603 () Bool)

(assert (=> b!1465816 (=> (not res!994644) (not e!823603))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465816 (= res!994644 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465817 () Bool)

(declare-fun res!994637 () Bool)

(assert (=> b!1465817 (=> (not res!994637) (not e!823603))))

(assert (=> b!1465817 (= res!994637 e!823606)))

(declare-fun c!135102 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465817 (= c!135102 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465818 () Bool)

(declare-fun res!994640 () Bool)

(declare-fun e!823602 () Bool)

(assert (=> b!1465818 (=> (not res!994640) (not e!823602))))

(declare-fun a!2862 () array!98822)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465818 (= res!994640 (validKeyInArray!0 (select (arr!47699 a!2862) j!93)))))

(declare-fun b!1465819 () Bool)

(declare-fun res!994636 () Bool)

(declare-fun e!823604 () Bool)

(assert (=> b!1465819 (=> res!994636 e!823604)))

(declare-fun e!823599 () Bool)

(assert (=> b!1465819 (= res!994636 e!823599)))

(declare-fun c!135101 () Bool)

(assert (=> b!1465819 (= c!135101 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465820 () Bool)

(declare-fun e!823601 () Bool)

(declare-fun e!823607 () Bool)

(assert (=> b!1465820 (= e!823601 e!823607)))

(declare-fun res!994647 () Bool)

(assert (=> b!1465820 (=> (not res!994647) (not e!823607))))

(declare-fun lt!641527 () SeekEntryResult!11951)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98822 (_ BitVec 32)) SeekEntryResult!11951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465820 (= res!994647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47699 a!2862) j!93) mask!2687) (select (arr!47699 a!2862) j!93) a!2862 mask!2687) lt!641527))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1465820 (= lt!641527 (Intermediate!11951 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465821 () Bool)

(declare-fun res!994638 () Bool)

(assert (=> b!1465821 (=> res!994638 e!823604)))

(declare-fun lt!641526 () (_ BitVec 32))

(assert (=> b!1465821 (= res!994638 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641526 (select (arr!47699 a!2862) j!93) a!2862 mask!2687) lt!641527)))))

(declare-fun lt!641528 () SeekEntryResult!11951)

(declare-fun b!1465822 () Bool)

(assert (=> b!1465822 (= e!823599 (not (= lt!641528 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641526 lt!641531 lt!641525 mask!2687))))))

(declare-fun b!1465823 () Bool)

(declare-fun res!994641 () Bool)

(assert (=> b!1465823 (=> (not res!994641) (not e!823602))))

(declare-datatypes ((List!34200 0))(
  ( (Nil!34197) (Cons!34196 (h!35546 (_ BitVec 64)) (t!48894 List!34200)) )
))
(declare-fun arrayNoDuplicates!0 (array!98822 (_ BitVec 32) List!34200) Bool)

(assert (=> b!1465823 (= res!994641 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34197))))

(declare-fun b!1465824 () Bool)

(declare-fun res!994643 () Bool)

(assert (=> b!1465824 (=> (not res!994643) (not e!823602))))

(assert (=> b!1465824 (= res!994643 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48249 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48249 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48249 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465825 () Bool)

(declare-fun e!823605 () Bool)

(assert (=> b!1465825 (= e!823605 e!823604)))

(declare-fun res!994649 () Bool)

(assert (=> b!1465825 (=> res!994649 e!823604)))

(assert (=> b!1465825 (= res!994649 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641526 #b00000000000000000000000000000000) (bvsge lt!641526 (size!48249 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465825 (= lt!641526 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465826 () Bool)

(declare-fun res!994648 () Bool)

(assert (=> b!1465826 (=> (not res!994648) (not e!823602))))

(assert (=> b!1465826 (= res!994648 (validKeyInArray!0 (select (arr!47699 a!2862) i!1006)))))

(declare-fun res!994645 () Bool)

(assert (=> start!125374 (=> (not res!994645) (not e!823602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125374 (= res!994645 (validMask!0 mask!2687))))

(assert (=> start!125374 e!823602))

(assert (=> start!125374 true))

(declare-fun array_inv!36727 (array!98822) Bool)

(assert (=> start!125374 (array_inv!36727 a!2862)))

(declare-fun b!1465827 () Bool)

(assert (=> b!1465827 (= e!823604 true)))

(declare-fun lt!641532 () SeekEntryResult!11951)

(assert (=> b!1465827 (= lt!641532 (seekEntryOrOpen!0 lt!641531 lt!641525 mask!2687))))

(declare-datatypes ((Unit!49398 0))(
  ( (Unit!49399) )
))
(declare-fun lt!641530 () Unit!49398)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49398)

(assert (=> b!1465827 (= lt!641530 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641526 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1465828 () Bool)

(declare-fun res!994634 () Bool)

(assert (=> b!1465828 (=> (not res!994634) (not e!823607))))

(assert (=> b!1465828 (= res!994634 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47699 a!2862) j!93) a!2862 mask!2687) lt!641527))))

(declare-fun b!1465829 () Bool)

(assert (=> b!1465829 (= e!823603 (not e!823605))))

(declare-fun res!994642 () Bool)

(assert (=> b!1465829 (=> res!994642 e!823605)))

(assert (=> b!1465829 (= res!994642 (or (and (= (select (arr!47699 a!2862) index!646) (select (store (arr!47699 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47699 a!2862) index!646) (select (arr!47699 a!2862) j!93))) (= (select (arr!47699 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465829 (and (= lt!641532 (Found!11951 j!93)) (or (= (select (arr!47699 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47699 a!2862) intermediateBeforeIndex!19) (select (arr!47699 a!2862) j!93))))))

(assert (=> b!1465829 (= lt!641532 (seekEntryOrOpen!0 (select (arr!47699 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98822 (_ BitVec 32)) Bool)

(assert (=> b!1465829 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641529 () Unit!49398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49398)

(assert (=> b!1465829 (= lt!641529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465830 () Bool)

(assert (=> b!1465830 (= e!823599 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641526 intermediateAfterIndex!19 lt!641531 lt!641525 mask!2687) (seekEntryOrOpen!0 lt!641531 lt!641525 mask!2687))))))

(declare-fun b!1465831 () Bool)

(declare-fun res!994635 () Bool)

(assert (=> b!1465831 (=> (not res!994635) (not e!823602))))

(assert (=> b!1465831 (= res!994635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465832 () Bool)

(assert (=> b!1465832 (= e!823602 e!823601)))

(declare-fun res!994651 () Bool)

(assert (=> b!1465832 (=> (not res!994651) (not e!823601))))

(assert (=> b!1465832 (= res!994651 (= (select (store (arr!47699 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465832 (= lt!641525 (array!98823 (store (arr!47699 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48249 a!2862)))))

(declare-fun b!1465833 () Bool)

(declare-fun res!994639 () Bool)

(assert (=> b!1465833 (=> res!994639 e!823604)))

(assert (=> b!1465833 (= res!994639 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1465834 () Bool)

(assert (=> b!1465834 (= e!823606 (= lt!641528 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641531 lt!641525 mask!2687)))))

(declare-fun b!1465835 () Bool)

(declare-fun res!994646 () Bool)

(assert (=> b!1465835 (=> (not res!994646) (not e!823602))))

(assert (=> b!1465835 (= res!994646 (and (= (size!48249 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48249 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48249 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465836 () Bool)

(assert (=> b!1465836 (= e!823607 e!823603)))

(declare-fun res!994650 () Bool)

(assert (=> b!1465836 (=> (not res!994650) (not e!823603))))

(assert (=> b!1465836 (= res!994650 (= lt!641528 (Intermediate!11951 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465836 (= lt!641528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641531 mask!2687) lt!641531 lt!641525 mask!2687))))

(assert (=> b!1465836 (= lt!641531 (select (store (arr!47699 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125374 res!994645) b!1465835))

(assert (= (and b!1465835 res!994646) b!1465826))

(assert (= (and b!1465826 res!994648) b!1465818))

(assert (= (and b!1465818 res!994640) b!1465831))

(assert (= (and b!1465831 res!994635) b!1465823))

(assert (= (and b!1465823 res!994641) b!1465824))

(assert (= (and b!1465824 res!994643) b!1465832))

(assert (= (and b!1465832 res!994651) b!1465820))

(assert (= (and b!1465820 res!994647) b!1465828))

(assert (= (and b!1465828 res!994634) b!1465836))

(assert (= (and b!1465836 res!994650) b!1465817))

(assert (= (and b!1465817 c!135102) b!1465834))

(assert (= (and b!1465817 (not c!135102)) b!1465815))

(assert (= (and b!1465817 res!994637) b!1465816))

(assert (= (and b!1465816 res!994644) b!1465829))

(assert (= (and b!1465829 (not res!994642)) b!1465825))

(assert (= (and b!1465825 (not res!994649)) b!1465821))

(assert (= (and b!1465821 (not res!994638)) b!1465819))

(assert (= (and b!1465819 c!135101) b!1465822))

(assert (= (and b!1465819 (not c!135101)) b!1465830))

(assert (= (and b!1465819 (not res!994636)) b!1465833))

(assert (= (and b!1465833 (not res!994639)) b!1465827))

(declare-fun m!1352863 () Bool)

(assert (=> b!1465831 m!1352863))

(declare-fun m!1352865 () Bool)

(assert (=> b!1465822 m!1352865))

(declare-fun m!1352867 () Bool)

(assert (=> b!1465826 m!1352867))

(assert (=> b!1465826 m!1352867))

(declare-fun m!1352869 () Bool)

(assert (=> b!1465826 m!1352869))

(declare-fun m!1352871 () Bool)

(assert (=> start!125374 m!1352871))

(declare-fun m!1352873 () Bool)

(assert (=> start!125374 m!1352873))

(declare-fun m!1352875 () Bool)

(assert (=> b!1465821 m!1352875))

(assert (=> b!1465821 m!1352875))

(declare-fun m!1352877 () Bool)

(assert (=> b!1465821 m!1352877))

(declare-fun m!1352879 () Bool)

(assert (=> b!1465830 m!1352879))

(declare-fun m!1352881 () Bool)

(assert (=> b!1465830 m!1352881))

(assert (=> b!1465828 m!1352875))

(assert (=> b!1465828 m!1352875))

(declare-fun m!1352883 () Bool)

(assert (=> b!1465828 m!1352883))

(declare-fun m!1352885 () Bool)

(assert (=> b!1465832 m!1352885))

(declare-fun m!1352887 () Bool)

(assert (=> b!1465832 m!1352887))

(assert (=> b!1465827 m!1352881))

(declare-fun m!1352889 () Bool)

(assert (=> b!1465827 m!1352889))

(declare-fun m!1352891 () Bool)

(assert (=> b!1465825 m!1352891))

(assert (=> b!1465818 m!1352875))

(assert (=> b!1465818 m!1352875))

(declare-fun m!1352893 () Bool)

(assert (=> b!1465818 m!1352893))

(assert (=> b!1465820 m!1352875))

(assert (=> b!1465820 m!1352875))

(declare-fun m!1352895 () Bool)

(assert (=> b!1465820 m!1352895))

(assert (=> b!1465820 m!1352895))

(assert (=> b!1465820 m!1352875))

(declare-fun m!1352897 () Bool)

(assert (=> b!1465820 m!1352897))

(declare-fun m!1352899 () Bool)

(assert (=> b!1465834 m!1352899))

(declare-fun m!1352901 () Bool)

(assert (=> b!1465815 m!1352901))

(assert (=> b!1465815 m!1352881))

(declare-fun m!1352903 () Bool)

(assert (=> b!1465823 m!1352903))

(declare-fun m!1352905 () Bool)

(assert (=> b!1465836 m!1352905))

(assert (=> b!1465836 m!1352905))

(declare-fun m!1352907 () Bool)

(assert (=> b!1465836 m!1352907))

(assert (=> b!1465836 m!1352885))

(declare-fun m!1352909 () Bool)

(assert (=> b!1465836 m!1352909))

(declare-fun m!1352911 () Bool)

(assert (=> b!1465829 m!1352911))

(assert (=> b!1465829 m!1352885))

(declare-fun m!1352913 () Bool)

(assert (=> b!1465829 m!1352913))

(declare-fun m!1352915 () Bool)

(assert (=> b!1465829 m!1352915))

(declare-fun m!1352917 () Bool)

(assert (=> b!1465829 m!1352917))

(assert (=> b!1465829 m!1352875))

(declare-fun m!1352919 () Bool)

(assert (=> b!1465829 m!1352919))

(declare-fun m!1352921 () Bool)

(assert (=> b!1465829 m!1352921))

(assert (=> b!1465829 m!1352875))

(push 1)

