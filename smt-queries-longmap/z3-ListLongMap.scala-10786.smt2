; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126216 () Bool)

(assert start!126216)

(declare-fun b!1478812 () Bool)

(declare-fun res!1004790 () Bool)

(declare-fun e!829536 () Bool)

(assert (=> b!1478812 (=> (not res!1004790) (not e!829536))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12180 0))(
  ( (MissingZero!12180 (index!51112 (_ BitVec 32))) (Found!12180 (index!51113 (_ BitVec 32))) (Intermediate!12180 (undefined!12992 Bool) (index!51114 (_ BitVec 32)) (x!132699 (_ BitVec 32))) (Undefined!12180) (MissingVacant!12180 (index!51115 (_ BitVec 32))) )
))
(declare-fun lt!645805 () SeekEntryResult!12180)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99322 0))(
  ( (array!99323 (arr!47940 (Array (_ BitVec 32) (_ BitVec 64))) (size!48490 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99322)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99322 (_ BitVec 32)) SeekEntryResult!12180)

(assert (=> b!1478812 (= res!1004790 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47940 a!2862) j!93) a!2862 mask!2687) lt!645805))))

(declare-fun b!1478813 () Bool)

(declare-fun e!829535 () Bool)

(assert (=> b!1478813 (= e!829535 e!829536)))

(declare-fun res!1004795 () Bool)

(assert (=> b!1478813 (=> (not res!1004795) (not e!829536))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478813 (= res!1004795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47940 a!2862) j!93) mask!2687) (select (arr!47940 a!2862) j!93) a!2862 mask!2687) lt!645805))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478813 (= lt!645805 (Intermediate!12180 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478814 () Bool)

(declare-fun res!1004793 () Bool)

(declare-fun e!829534 () Bool)

(assert (=> b!1478814 (=> (not res!1004793) (not e!829534))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478814 (= res!1004793 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48490 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48490 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48490 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1004798 () Bool)

(assert (=> start!126216 (=> (not res!1004798) (not e!829534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126216 (= res!1004798 (validMask!0 mask!2687))))

(assert (=> start!126216 e!829534))

(assert (=> start!126216 true))

(declare-fun array_inv!36968 (array!99322) Bool)

(assert (=> start!126216 (array_inv!36968 a!2862)))

(declare-fun b!1478815 () Bool)

(declare-fun e!829531 () Bool)

(assert (=> b!1478815 (= e!829531 (not true))))

(declare-fun e!829538 () Bool)

(assert (=> b!1478815 e!829538))

(declare-fun res!1004797 () Bool)

(assert (=> b!1478815 (=> (not res!1004797) (not e!829538))))

(declare-fun lt!645810 () SeekEntryResult!12180)

(assert (=> b!1478815 (= res!1004797 (and (= lt!645810 (Found!12180 j!93)) (or (= (select (arr!47940 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47940 a!2862) intermediateBeforeIndex!19) (select (arr!47940 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99322 (_ BitVec 32)) SeekEntryResult!12180)

(assert (=> b!1478815 (= lt!645810 (seekEntryOrOpen!0 (select (arr!47940 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99322 (_ BitVec 32)) Bool)

(assert (=> b!1478815 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49700 0))(
  ( (Unit!49701) )
))
(declare-fun lt!645809 () Unit!49700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49700)

(assert (=> b!1478815 (= lt!645809 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478816 () Bool)

(declare-fun res!1004786 () Bool)

(assert (=> b!1478816 (=> (not res!1004786) (not e!829534))))

(assert (=> b!1478816 (= res!1004786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478817 () Bool)

(declare-fun lt!645807 () (_ BitVec 64))

(declare-fun e!829530 () Bool)

(declare-fun lt!645808 () SeekEntryResult!12180)

(declare-fun lt!645806 () array!99322)

(assert (=> b!1478817 (= e!829530 (= lt!645808 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645807 lt!645806 mask!2687)))))

(declare-fun b!1478818 () Bool)

(declare-fun res!1004791 () Bool)

(assert (=> b!1478818 (=> (not res!1004791) (not e!829534))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478818 (= res!1004791 (validKeyInArray!0 (select (arr!47940 a!2862) i!1006)))))

(declare-fun b!1478819 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99322 (_ BitVec 32)) SeekEntryResult!12180)

(assert (=> b!1478819 (= e!829530 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645807 lt!645806 mask!2687) (seekEntryOrOpen!0 lt!645807 lt!645806 mask!2687)))))

(declare-fun b!1478820 () Bool)

(declare-fun res!1004796 () Bool)

(assert (=> b!1478820 (=> (not res!1004796) (not e!829531))))

(assert (=> b!1478820 (= res!1004796 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478821 () Bool)

(declare-fun res!1004787 () Bool)

(assert (=> b!1478821 (=> (not res!1004787) (not e!829534))))

(assert (=> b!1478821 (= res!1004787 (and (= (size!48490 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48490 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48490 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478822 () Bool)

(declare-fun e!829533 () Bool)

(assert (=> b!1478822 (= e!829533 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478823 () Bool)

(assert (=> b!1478823 (= e!829534 e!829535)))

(declare-fun res!1004794 () Bool)

(assert (=> b!1478823 (=> (not res!1004794) (not e!829535))))

(assert (=> b!1478823 (= res!1004794 (= (select (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478823 (= lt!645806 (array!99323 (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48490 a!2862)))))

(declare-fun b!1478824 () Bool)

(declare-fun res!1004799 () Bool)

(assert (=> b!1478824 (=> (not res!1004799) (not e!829531))))

(assert (=> b!1478824 (= res!1004799 e!829530)))

(declare-fun c!136533 () Bool)

(assert (=> b!1478824 (= c!136533 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478825 () Bool)

(declare-fun e!829537 () Bool)

(assert (=> b!1478825 (= e!829538 e!829537)))

(declare-fun res!1004792 () Bool)

(assert (=> b!1478825 (=> res!1004792 e!829537)))

(assert (=> b!1478825 (= res!1004792 (or (and (= (select (arr!47940 a!2862) index!646) (select (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47940 a!2862) index!646) (select (arr!47940 a!2862) j!93))) (not (= (select (arr!47940 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478826 () Bool)

(declare-fun res!1004800 () Bool)

(assert (=> b!1478826 (=> (not res!1004800) (not e!829534))))

(declare-datatypes ((List!34441 0))(
  ( (Nil!34438) (Cons!34437 (h!35805 (_ BitVec 64)) (t!49135 List!34441)) )
))
(declare-fun arrayNoDuplicates!0 (array!99322 (_ BitVec 32) List!34441) Bool)

(assert (=> b!1478826 (= res!1004800 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34438))))

(declare-fun b!1478827 () Bool)

(assert (=> b!1478827 (= e!829537 e!829533)))

(declare-fun res!1004788 () Bool)

(assert (=> b!1478827 (=> (not res!1004788) (not e!829533))))

(assert (=> b!1478827 (= res!1004788 (= lt!645810 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47940 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478828 () Bool)

(assert (=> b!1478828 (= e!829536 e!829531)))

(declare-fun res!1004785 () Bool)

(assert (=> b!1478828 (=> (not res!1004785) (not e!829531))))

(assert (=> b!1478828 (= res!1004785 (= lt!645808 (Intermediate!12180 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478828 (= lt!645808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645807 mask!2687) lt!645807 lt!645806 mask!2687))))

(assert (=> b!1478828 (= lt!645807 (select (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478829 () Bool)

(declare-fun res!1004789 () Bool)

(assert (=> b!1478829 (=> (not res!1004789) (not e!829534))))

(assert (=> b!1478829 (= res!1004789 (validKeyInArray!0 (select (arr!47940 a!2862) j!93)))))

(assert (= (and start!126216 res!1004798) b!1478821))

(assert (= (and b!1478821 res!1004787) b!1478818))

(assert (= (and b!1478818 res!1004791) b!1478829))

(assert (= (and b!1478829 res!1004789) b!1478816))

(assert (= (and b!1478816 res!1004786) b!1478826))

(assert (= (and b!1478826 res!1004800) b!1478814))

(assert (= (and b!1478814 res!1004793) b!1478823))

(assert (= (and b!1478823 res!1004794) b!1478813))

(assert (= (and b!1478813 res!1004795) b!1478812))

(assert (= (and b!1478812 res!1004790) b!1478828))

(assert (= (and b!1478828 res!1004785) b!1478824))

(assert (= (and b!1478824 c!136533) b!1478817))

(assert (= (and b!1478824 (not c!136533)) b!1478819))

(assert (= (and b!1478824 res!1004799) b!1478820))

(assert (= (and b!1478820 res!1004796) b!1478815))

(assert (= (and b!1478815 res!1004797) b!1478825))

(assert (= (and b!1478825 (not res!1004792)) b!1478827))

(assert (= (and b!1478827 res!1004788) b!1478822))

(declare-fun m!1364711 () Bool)

(assert (=> start!126216 m!1364711))

(declare-fun m!1364713 () Bool)

(assert (=> start!126216 m!1364713))

(declare-fun m!1364715 () Bool)

(assert (=> b!1478815 m!1364715))

(declare-fun m!1364717 () Bool)

(assert (=> b!1478815 m!1364717))

(declare-fun m!1364719 () Bool)

(assert (=> b!1478815 m!1364719))

(declare-fun m!1364721 () Bool)

(assert (=> b!1478815 m!1364721))

(declare-fun m!1364723 () Bool)

(assert (=> b!1478815 m!1364723))

(assert (=> b!1478815 m!1364719))

(assert (=> b!1478813 m!1364719))

(assert (=> b!1478813 m!1364719))

(declare-fun m!1364725 () Bool)

(assert (=> b!1478813 m!1364725))

(assert (=> b!1478813 m!1364725))

(assert (=> b!1478813 m!1364719))

(declare-fun m!1364727 () Bool)

(assert (=> b!1478813 m!1364727))

(declare-fun m!1364729 () Bool)

(assert (=> b!1478828 m!1364729))

(assert (=> b!1478828 m!1364729))

(declare-fun m!1364731 () Bool)

(assert (=> b!1478828 m!1364731))

(declare-fun m!1364733 () Bool)

(assert (=> b!1478828 m!1364733))

(declare-fun m!1364735 () Bool)

(assert (=> b!1478828 m!1364735))

(assert (=> b!1478827 m!1364719))

(assert (=> b!1478827 m!1364719))

(declare-fun m!1364737 () Bool)

(assert (=> b!1478827 m!1364737))

(declare-fun m!1364739 () Bool)

(assert (=> b!1478817 m!1364739))

(assert (=> b!1478823 m!1364733))

(declare-fun m!1364741 () Bool)

(assert (=> b!1478823 m!1364741))

(assert (=> b!1478829 m!1364719))

(assert (=> b!1478829 m!1364719))

(declare-fun m!1364743 () Bool)

(assert (=> b!1478829 m!1364743))

(assert (=> b!1478812 m!1364719))

(assert (=> b!1478812 m!1364719))

(declare-fun m!1364745 () Bool)

(assert (=> b!1478812 m!1364745))

(declare-fun m!1364747 () Bool)

(assert (=> b!1478826 m!1364747))

(declare-fun m!1364749 () Bool)

(assert (=> b!1478819 m!1364749))

(declare-fun m!1364751 () Bool)

(assert (=> b!1478819 m!1364751))

(declare-fun m!1364753 () Bool)

(assert (=> b!1478818 m!1364753))

(assert (=> b!1478818 m!1364753))

(declare-fun m!1364755 () Bool)

(assert (=> b!1478818 m!1364755))

(declare-fun m!1364757 () Bool)

(assert (=> b!1478825 m!1364757))

(assert (=> b!1478825 m!1364733))

(declare-fun m!1364759 () Bool)

(assert (=> b!1478825 m!1364759))

(assert (=> b!1478825 m!1364719))

(declare-fun m!1364761 () Bool)

(assert (=> b!1478816 m!1364761))

(check-sat (not b!1478817) (not b!1478818) (not b!1478815) (not b!1478816) (not b!1478829) (not b!1478827) (not b!1478826) (not b!1478813) (not start!126216) (not b!1478812) (not b!1478819) (not b!1478828))
(check-sat)
