; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124640 () Bool)

(assert start!124640)

(declare-fun b!1443739 () Bool)

(declare-fun res!975822 () Bool)

(declare-fun e!813531 () Bool)

(assert (=> b!1443739 (=> (not res!975822) (not e!813531))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11584 0))(
  ( (MissingZero!11584 (index!48728 (_ BitVec 32))) (Found!11584 (index!48729 (_ BitVec 32))) (Intermediate!11584 (undefined!12396 Bool) (index!48730 (_ BitVec 32)) (x!130425 (_ BitVec 32))) (Undefined!11584) (MissingVacant!11584 (index!48731 (_ BitVec 32))) )
))
(declare-fun lt!633964 () SeekEntryResult!11584)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98088 0))(
  ( (array!98089 (arr!47332 (Array (_ BitVec 32) (_ BitVec 64))) (size!47882 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98088)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98088 (_ BitVec 32)) SeekEntryResult!11584)

(assert (=> b!1443739 (= res!975822 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47332 a!2862) j!93) a!2862 mask!2687) lt!633964))))

(declare-fun b!1443740 () Bool)

(declare-fun e!813530 () Bool)

(assert (=> b!1443740 (= e!813530 true)))

(declare-fun lt!633963 () array!98088)

(declare-fun lt!633962 () (_ BitVec 64))

(declare-fun lt!633965 () SeekEntryResult!11584)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98088 (_ BitVec 32)) SeekEntryResult!11584)

(assert (=> b!1443740 (= lt!633965 (seekEntryOrOpen!0 lt!633962 lt!633963 mask!2687))))

(declare-fun b!1443741 () Bool)

(declare-fun res!975813 () Bool)

(declare-fun e!813535 () Bool)

(assert (=> b!1443741 (=> (not res!975813) (not e!813535))))

(declare-datatypes ((List!33833 0))(
  ( (Nil!33830) (Cons!33829 (h!35179 (_ BitVec 64)) (t!48527 List!33833)) )
))
(declare-fun arrayNoDuplicates!0 (array!98088 (_ BitVec 32) List!33833) Bool)

(assert (=> b!1443741 (= res!975813 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33830))))

(declare-fun b!1443742 () Bool)

(declare-fun res!975809 () Bool)

(declare-fun e!813536 () Bool)

(assert (=> b!1443742 (=> (not res!975809) (not e!813536))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443742 (= res!975809 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443743 () Bool)

(declare-fun res!975819 () Bool)

(assert (=> b!1443743 (=> (not res!975819) (not e!813535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443743 (= res!975819 (validKeyInArray!0 (select (arr!47332 a!2862) i!1006)))))

(declare-fun b!1443744 () Bool)

(declare-fun res!975821 () Bool)

(assert (=> b!1443744 (=> (not res!975821) (not e!813535))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443744 (= res!975821 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47882 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47882 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47882 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443746 () Bool)

(declare-fun e!813533 () Bool)

(assert (=> b!1443746 (= e!813535 e!813533)))

(declare-fun res!975818 () Bool)

(assert (=> b!1443746 (=> (not res!975818) (not e!813533))))

(assert (=> b!1443746 (= res!975818 (= (select (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443746 (= lt!633963 (array!98089 (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47882 a!2862)))))

(declare-fun b!1443747 () Bool)

(declare-fun e!813532 () Bool)

(assert (=> b!1443747 (= e!813532 (or (= (select (arr!47332 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47332 a!2862) intermediateBeforeIndex!19) (select (arr!47332 a!2862) j!93))))))

(declare-fun b!1443748 () Bool)

(declare-fun res!975808 () Bool)

(assert (=> b!1443748 (=> (not res!975808) (not e!813536))))

(declare-fun e!813534 () Bool)

(assert (=> b!1443748 (= res!975808 e!813534)))

(declare-fun c!133476 () Bool)

(assert (=> b!1443748 (= c!133476 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!633961 () SeekEntryResult!11584)

(declare-fun b!1443749 () Bool)

(assert (=> b!1443749 (= e!813534 (= lt!633961 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633962 lt!633963 mask!2687)))))

(declare-fun b!1443750 () Bool)

(assert (=> b!1443750 (= e!813533 e!813531)))

(declare-fun res!975817 () Bool)

(assert (=> b!1443750 (=> (not res!975817) (not e!813531))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443750 (= res!975817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47332 a!2862) j!93) mask!2687) (select (arr!47332 a!2862) j!93) a!2862 mask!2687) lt!633964))))

(assert (=> b!1443750 (= lt!633964 (Intermediate!11584 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443751 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98088 (_ BitVec 32)) SeekEntryResult!11584)

(assert (=> b!1443751 (= e!813534 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633962 lt!633963 mask!2687) (seekEntryOrOpen!0 lt!633962 lt!633963 mask!2687)))))

(declare-fun b!1443752 () Bool)

(declare-fun res!975810 () Bool)

(assert (=> b!1443752 (=> (not res!975810) (not e!813535))))

(assert (=> b!1443752 (= res!975810 (validKeyInArray!0 (select (arr!47332 a!2862) j!93)))))

(declare-fun b!1443753 () Bool)

(assert (=> b!1443753 (= e!813536 (not e!813530))))

(declare-fun res!975823 () Bool)

(assert (=> b!1443753 (=> res!975823 e!813530)))

(assert (=> b!1443753 (= res!975823 (or (not (= (select (arr!47332 a!2862) index!646) (select (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47332 a!2862) index!646) (select (arr!47332 a!2862) j!93)))))))

(assert (=> b!1443753 e!813532))

(declare-fun res!975811 () Bool)

(assert (=> b!1443753 (=> (not res!975811) (not e!813532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98088 (_ BitVec 32)) Bool)

(assert (=> b!1443753 (= res!975811 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48664 0))(
  ( (Unit!48665) )
))
(declare-fun lt!633966 () Unit!48664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48664)

(assert (=> b!1443753 (= lt!633966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443754 () Bool)

(declare-fun res!975814 () Bool)

(assert (=> b!1443754 (=> (not res!975814) (not e!813532))))

(assert (=> b!1443754 (= res!975814 (= (seekEntryOrOpen!0 (select (arr!47332 a!2862) j!93) a!2862 mask!2687) (Found!11584 j!93)))))

(declare-fun b!1443755 () Bool)

(assert (=> b!1443755 (= e!813531 e!813536)))

(declare-fun res!975816 () Bool)

(assert (=> b!1443755 (=> (not res!975816) (not e!813536))))

(assert (=> b!1443755 (= res!975816 (= lt!633961 (Intermediate!11584 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443755 (= lt!633961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633962 mask!2687) lt!633962 lt!633963 mask!2687))))

(assert (=> b!1443755 (= lt!633962 (select (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443756 () Bool)

(declare-fun res!975815 () Bool)

(assert (=> b!1443756 (=> (not res!975815) (not e!813535))))

(assert (=> b!1443756 (= res!975815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443745 () Bool)

(declare-fun res!975812 () Bool)

(assert (=> b!1443745 (=> (not res!975812) (not e!813535))))

(assert (=> b!1443745 (= res!975812 (and (= (size!47882 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47882 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47882 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!975820 () Bool)

(assert (=> start!124640 (=> (not res!975820) (not e!813535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124640 (= res!975820 (validMask!0 mask!2687))))

(assert (=> start!124640 e!813535))

(assert (=> start!124640 true))

(declare-fun array_inv!36360 (array!98088) Bool)

(assert (=> start!124640 (array_inv!36360 a!2862)))

(assert (= (and start!124640 res!975820) b!1443745))

(assert (= (and b!1443745 res!975812) b!1443743))

(assert (= (and b!1443743 res!975819) b!1443752))

(assert (= (and b!1443752 res!975810) b!1443756))

(assert (= (and b!1443756 res!975815) b!1443741))

(assert (= (and b!1443741 res!975813) b!1443744))

(assert (= (and b!1443744 res!975821) b!1443746))

(assert (= (and b!1443746 res!975818) b!1443750))

(assert (= (and b!1443750 res!975817) b!1443739))

(assert (= (and b!1443739 res!975822) b!1443755))

(assert (= (and b!1443755 res!975816) b!1443748))

(assert (= (and b!1443748 c!133476) b!1443749))

(assert (= (and b!1443748 (not c!133476)) b!1443751))

(assert (= (and b!1443748 res!975808) b!1443742))

(assert (= (and b!1443742 res!975809) b!1443753))

(assert (= (and b!1443753 res!975811) b!1443754))

(assert (= (and b!1443754 res!975814) b!1443747))

(assert (= (and b!1443753 (not res!975823)) b!1443740))

(declare-fun m!1332803 () Bool)

(assert (=> start!124640 m!1332803))

(declare-fun m!1332805 () Bool)

(assert (=> start!124640 m!1332805))

(declare-fun m!1332807 () Bool)

(assert (=> b!1443749 m!1332807))

(declare-fun m!1332809 () Bool)

(assert (=> b!1443747 m!1332809))

(declare-fun m!1332811 () Bool)

(assert (=> b!1443747 m!1332811))

(declare-fun m!1332813 () Bool)

(assert (=> b!1443751 m!1332813))

(declare-fun m!1332815 () Bool)

(assert (=> b!1443751 m!1332815))

(declare-fun m!1332817 () Bool)

(assert (=> b!1443741 m!1332817))

(assert (=> b!1443739 m!1332811))

(assert (=> b!1443739 m!1332811))

(declare-fun m!1332819 () Bool)

(assert (=> b!1443739 m!1332819))

(declare-fun m!1332821 () Bool)

(assert (=> b!1443743 m!1332821))

(assert (=> b!1443743 m!1332821))

(declare-fun m!1332823 () Bool)

(assert (=> b!1443743 m!1332823))

(assert (=> b!1443754 m!1332811))

(assert (=> b!1443754 m!1332811))

(declare-fun m!1332825 () Bool)

(assert (=> b!1443754 m!1332825))

(declare-fun m!1332827 () Bool)

(assert (=> b!1443755 m!1332827))

(assert (=> b!1443755 m!1332827))

(declare-fun m!1332829 () Bool)

(assert (=> b!1443755 m!1332829))

(declare-fun m!1332831 () Bool)

(assert (=> b!1443755 m!1332831))

(declare-fun m!1332833 () Bool)

(assert (=> b!1443755 m!1332833))

(assert (=> b!1443746 m!1332831))

(declare-fun m!1332835 () Bool)

(assert (=> b!1443746 m!1332835))

(assert (=> b!1443752 m!1332811))

(assert (=> b!1443752 m!1332811))

(declare-fun m!1332837 () Bool)

(assert (=> b!1443752 m!1332837))

(declare-fun m!1332839 () Bool)

(assert (=> b!1443756 m!1332839))

(declare-fun m!1332841 () Bool)

(assert (=> b!1443753 m!1332841))

(assert (=> b!1443753 m!1332831))

(declare-fun m!1332843 () Bool)

(assert (=> b!1443753 m!1332843))

(declare-fun m!1332845 () Bool)

(assert (=> b!1443753 m!1332845))

(declare-fun m!1332847 () Bool)

(assert (=> b!1443753 m!1332847))

(assert (=> b!1443753 m!1332811))

(assert (=> b!1443740 m!1332815))

(assert (=> b!1443750 m!1332811))

(assert (=> b!1443750 m!1332811))

(declare-fun m!1332849 () Bool)

(assert (=> b!1443750 m!1332849))

(assert (=> b!1443750 m!1332849))

(assert (=> b!1443750 m!1332811))

(declare-fun m!1332851 () Bool)

(assert (=> b!1443750 m!1332851))

(push 1)

