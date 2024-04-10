; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126142 () Bool)

(assert start!126142)

(declare-fun lt!645143 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12143 0))(
  ( (MissingZero!12143 (index!50964 (_ BitVec 32))) (Found!12143 (index!50965 (_ BitVec 32))) (Intermediate!12143 (undefined!12955 Bool) (index!50966 (_ BitVec 32)) (x!132566 (_ BitVec 32))) (Undefined!12143) (MissingVacant!12143 (index!50967 (_ BitVec 32))) )
))
(declare-fun lt!645140 () SeekEntryResult!12143)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!828532 () Bool)

(declare-datatypes ((array!99248 0))(
  ( (array!99249 (arr!47903 (Array (_ BitVec 32) (_ BitVec 64))) (size!48453 (_ BitVec 32))) )
))
(declare-fun lt!645142 () array!99248)

(declare-fun b!1476814 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99248 (_ BitVec 32)) SeekEntryResult!12143)

(assert (=> b!1476814 (= e!828532 (= lt!645140 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645143 lt!645142 mask!2687)))))

(declare-fun b!1476815 () Bool)

(declare-fun res!1003010 () Bool)

(declare-fun e!828531 () Bool)

(assert (=> b!1476815 (=> (not res!1003010) (not e!828531))))

(declare-fun lt!645144 () SeekEntryResult!12143)

(declare-fun a!2862 () array!99248)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1476815 (= res!1003010 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47903 a!2862) j!93) a!2862 mask!2687) lt!645144))))

(declare-fun b!1476816 () Bool)

(declare-fun res!1003014 () Bool)

(declare-fun e!828539 () Bool)

(assert (=> b!1476816 (=> (not res!1003014) (not e!828539))))

(declare-datatypes ((List!34404 0))(
  ( (Nil!34401) (Cons!34400 (h!35768 (_ BitVec 64)) (t!49098 List!34404)) )
))
(declare-fun arrayNoDuplicates!0 (array!99248 (_ BitVec 32) List!34404) Bool)

(assert (=> b!1476816 (= res!1003014 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34401))))

(declare-fun b!1476817 () Bool)

(declare-fun res!1003020 () Bool)

(assert (=> b!1476817 (=> (not res!1003020) (not e!828539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99248 (_ BitVec 32)) Bool)

(assert (=> b!1476817 (= res!1003020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476818 () Bool)

(declare-fun res!1003016 () Bool)

(assert (=> b!1476818 (=> (not res!1003016) (not e!828539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476818 (= res!1003016 (validKeyInArray!0 (select (arr!47903 a!2862) j!93)))))

(declare-fun b!1476819 () Bool)

(declare-fun e!828533 () Bool)

(assert (=> b!1476819 (= e!828531 e!828533)))

(declare-fun res!1003022 () Bool)

(assert (=> b!1476819 (=> (not res!1003022) (not e!828533))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476819 (= res!1003022 (= lt!645140 (Intermediate!12143 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476819 (= lt!645140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645143 mask!2687) lt!645143 lt!645142 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476819 (= lt!645143 (select (store (arr!47903 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476820 () Bool)

(declare-fun res!1003019 () Bool)

(assert (=> b!1476820 (=> (not res!1003019) (not e!828533))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476820 (= res!1003019 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476821 () Bool)

(declare-fun res!1003013 () Bool)

(assert (=> b!1476821 (=> (not res!1003013) (not e!828533))))

(assert (=> b!1476821 (= res!1003013 e!828532)))

(declare-fun c!136422 () Bool)

(assert (=> b!1476821 (= c!136422 (bvsle x!665 intermediateAfterX!19))))

(declare-fun e!828537 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1476822 () Bool)

(assert (=> b!1476822 (= e!828537 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476824 () Bool)

(assert (=> b!1476824 (= e!828533 (not true))))

(declare-fun e!828536 () Bool)

(assert (=> b!1476824 e!828536))

(declare-fun res!1003012 () Bool)

(assert (=> b!1476824 (=> (not res!1003012) (not e!828536))))

(declare-fun lt!645141 () SeekEntryResult!12143)

(assert (=> b!1476824 (= res!1003012 (and (= lt!645141 (Found!12143 j!93)) (or (= (select (arr!47903 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47903 a!2862) intermediateBeforeIndex!19) (select (arr!47903 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99248 (_ BitVec 32)) SeekEntryResult!12143)

(assert (=> b!1476824 (= lt!645141 (seekEntryOrOpen!0 (select (arr!47903 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476824 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49626 0))(
  ( (Unit!49627) )
))
(declare-fun lt!645139 () Unit!49626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49626)

(assert (=> b!1476824 (= lt!645139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476825 () Bool)

(declare-fun res!1003011 () Bool)

(assert (=> b!1476825 (=> (not res!1003011) (not e!828539))))

(assert (=> b!1476825 (= res!1003011 (validKeyInArray!0 (select (arr!47903 a!2862) i!1006)))))

(declare-fun b!1476826 () Bool)

(declare-fun e!828534 () Bool)

(assert (=> b!1476826 (= e!828539 e!828534)))

(declare-fun res!1003024 () Bool)

(assert (=> b!1476826 (=> (not res!1003024) (not e!828534))))

(assert (=> b!1476826 (= res!1003024 (= (select (store (arr!47903 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476826 (= lt!645142 (array!99249 (store (arr!47903 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48453 a!2862)))))

(declare-fun b!1476827 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99248 (_ BitVec 32)) SeekEntryResult!12143)

(assert (=> b!1476827 (= e!828532 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645143 lt!645142 mask!2687) (seekEntryOrOpen!0 lt!645143 lt!645142 mask!2687)))))

(declare-fun b!1476828 () Bool)

(assert (=> b!1476828 (= e!828534 e!828531)))

(declare-fun res!1003018 () Bool)

(assert (=> b!1476828 (=> (not res!1003018) (not e!828531))))

(assert (=> b!1476828 (= res!1003018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47903 a!2862) j!93) mask!2687) (select (arr!47903 a!2862) j!93) a!2862 mask!2687) lt!645144))))

(assert (=> b!1476828 (= lt!645144 (Intermediate!12143 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476829 () Bool)

(declare-fun res!1003009 () Bool)

(assert (=> b!1476829 (=> (not res!1003009) (not e!828539))))

(assert (=> b!1476829 (= res!1003009 (and (= (size!48453 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48453 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48453 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1003015 () Bool)

(assert (=> start!126142 (=> (not res!1003015) (not e!828539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126142 (= res!1003015 (validMask!0 mask!2687))))

(assert (=> start!126142 e!828539))

(assert (=> start!126142 true))

(declare-fun array_inv!36931 (array!99248) Bool)

(assert (=> start!126142 (array_inv!36931 a!2862)))

(declare-fun b!1476823 () Bool)

(declare-fun res!1003023 () Bool)

(assert (=> b!1476823 (=> (not res!1003023) (not e!828539))))

(assert (=> b!1476823 (= res!1003023 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48453 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48453 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48453 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476830 () Bool)

(declare-fun e!828535 () Bool)

(assert (=> b!1476830 (= e!828536 e!828535)))

(declare-fun res!1003017 () Bool)

(assert (=> b!1476830 (=> res!1003017 e!828535)))

(assert (=> b!1476830 (= res!1003017 (or (and (= (select (arr!47903 a!2862) index!646) (select (store (arr!47903 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47903 a!2862) index!646) (select (arr!47903 a!2862) j!93))) (not (= (select (arr!47903 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476831 () Bool)

(assert (=> b!1476831 (= e!828535 e!828537)))

(declare-fun res!1003021 () Bool)

(assert (=> b!1476831 (=> (not res!1003021) (not e!828537))))

(assert (=> b!1476831 (= res!1003021 (= lt!645141 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47903 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!126142 res!1003015) b!1476829))

(assert (= (and b!1476829 res!1003009) b!1476825))

(assert (= (and b!1476825 res!1003011) b!1476818))

(assert (= (and b!1476818 res!1003016) b!1476817))

(assert (= (and b!1476817 res!1003020) b!1476816))

(assert (= (and b!1476816 res!1003014) b!1476823))

(assert (= (and b!1476823 res!1003023) b!1476826))

(assert (= (and b!1476826 res!1003024) b!1476828))

(assert (= (and b!1476828 res!1003018) b!1476815))

(assert (= (and b!1476815 res!1003010) b!1476819))

(assert (= (and b!1476819 res!1003022) b!1476821))

(assert (= (and b!1476821 c!136422) b!1476814))

(assert (= (and b!1476821 (not c!136422)) b!1476827))

(assert (= (and b!1476821 res!1003013) b!1476820))

(assert (= (and b!1476820 res!1003019) b!1476824))

(assert (= (and b!1476824 res!1003012) b!1476830))

(assert (= (and b!1476830 (not res!1003017)) b!1476831))

(assert (= (and b!1476831 res!1003021) b!1476822))

(declare-fun m!1362787 () Bool)

(assert (=> b!1476817 m!1362787))

(declare-fun m!1362789 () Bool)

(assert (=> b!1476819 m!1362789))

(assert (=> b!1476819 m!1362789))

(declare-fun m!1362791 () Bool)

(assert (=> b!1476819 m!1362791))

(declare-fun m!1362793 () Bool)

(assert (=> b!1476819 m!1362793))

(declare-fun m!1362795 () Bool)

(assert (=> b!1476819 m!1362795))

(declare-fun m!1362797 () Bool)

(assert (=> b!1476827 m!1362797))

(declare-fun m!1362799 () Bool)

(assert (=> b!1476827 m!1362799))

(declare-fun m!1362801 () Bool)

(assert (=> b!1476830 m!1362801))

(assert (=> b!1476830 m!1362793))

(declare-fun m!1362803 () Bool)

(assert (=> b!1476830 m!1362803))

(declare-fun m!1362805 () Bool)

(assert (=> b!1476830 m!1362805))

(declare-fun m!1362807 () Bool)

(assert (=> b!1476825 m!1362807))

(assert (=> b!1476825 m!1362807))

(declare-fun m!1362809 () Bool)

(assert (=> b!1476825 m!1362809))

(declare-fun m!1362811 () Bool)

(assert (=> start!126142 m!1362811))

(declare-fun m!1362813 () Bool)

(assert (=> start!126142 m!1362813))

(assert (=> b!1476828 m!1362805))

(assert (=> b!1476828 m!1362805))

(declare-fun m!1362815 () Bool)

(assert (=> b!1476828 m!1362815))

(assert (=> b!1476828 m!1362815))

(assert (=> b!1476828 m!1362805))

(declare-fun m!1362817 () Bool)

(assert (=> b!1476828 m!1362817))

(declare-fun m!1362819 () Bool)

(assert (=> b!1476824 m!1362819))

(declare-fun m!1362821 () Bool)

(assert (=> b!1476824 m!1362821))

(assert (=> b!1476824 m!1362805))

(declare-fun m!1362823 () Bool)

(assert (=> b!1476824 m!1362823))

(declare-fun m!1362825 () Bool)

(assert (=> b!1476824 m!1362825))

(assert (=> b!1476824 m!1362805))

(assert (=> b!1476831 m!1362805))

(assert (=> b!1476831 m!1362805))

(declare-fun m!1362827 () Bool)

(assert (=> b!1476831 m!1362827))

(assert (=> b!1476815 m!1362805))

(assert (=> b!1476815 m!1362805))

(declare-fun m!1362829 () Bool)

(assert (=> b!1476815 m!1362829))

(assert (=> b!1476826 m!1362793))

(declare-fun m!1362831 () Bool)

(assert (=> b!1476826 m!1362831))

(declare-fun m!1362833 () Bool)

(assert (=> b!1476814 m!1362833))

(assert (=> b!1476818 m!1362805))

(assert (=> b!1476818 m!1362805))

(declare-fun m!1362835 () Bool)

(assert (=> b!1476818 m!1362835))

(declare-fun m!1362837 () Bool)

(assert (=> b!1476816 m!1362837))

(push 1)

