; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126256 () Bool)

(assert start!126256)

(declare-fun b!1479959 () Bool)

(declare-fun e!830110 () Bool)

(declare-fun e!830111 () Bool)

(assert (=> b!1479959 (= e!830110 e!830111)))

(declare-fun res!1005823 () Bool)

(assert (=> b!1479959 (=> res!1005823 e!830111)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99362 0))(
  ( (array!99363 (arr!47960 (Array (_ BitVec 32) (_ BitVec 64))) (size!48510 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99362)

(assert (=> b!1479959 (= res!1005823 (or (and (= (select (arr!47960 a!2862) index!646) (select (store (arr!47960 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47960 a!2862) index!646) (select (arr!47960 a!2862) j!93))) (not (= (select (arr!47960 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479960 () Bool)

(declare-fun e!830115 () Bool)

(declare-fun e!830116 () Bool)

(assert (=> b!1479960 (= e!830115 (not e!830116))))

(declare-fun res!1005821 () Bool)

(assert (=> b!1479960 (=> res!1005821 e!830116)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1479960 (= res!1005821 (or (and (= (select (arr!47960 a!2862) index!646) (select (store (arr!47960 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47960 a!2862) index!646) (select (arr!47960 a!2862) j!93))) (not (= (select (arr!47960 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47960 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479960 e!830110))

(declare-fun res!1005826 () Bool)

(assert (=> b!1479960 (=> (not res!1005826) (not e!830110))))

(declare-datatypes ((SeekEntryResult!12200 0))(
  ( (MissingZero!12200 (index!51192 (_ BitVec 32))) (Found!12200 (index!51193 (_ BitVec 32))) (Intermediate!12200 (undefined!13012 Bool) (index!51194 (_ BitVec 32)) (x!132775 (_ BitVec 32))) (Undefined!12200) (MissingVacant!12200 (index!51195 (_ BitVec 32))) )
))
(declare-fun lt!646239 () SeekEntryResult!12200)

(declare-fun lt!646235 () SeekEntryResult!12200)

(assert (=> b!1479960 (= res!1005826 (and (= lt!646235 lt!646239) (or (= (select (arr!47960 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47960 a!2862) intermediateBeforeIndex!19) (select (arr!47960 a!2862) j!93)))))))

(assert (=> b!1479960 (= lt!646239 (Found!12200 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99362 (_ BitVec 32)) SeekEntryResult!12200)

(assert (=> b!1479960 (= lt!646235 (seekEntryOrOpen!0 (select (arr!47960 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99362 (_ BitVec 32)) Bool)

(assert (=> b!1479960 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49740 0))(
  ( (Unit!49741) )
))
(declare-fun lt!646237 () Unit!49740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49740)

(assert (=> b!1479960 (= lt!646237 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479961 () Bool)

(declare-fun res!1005817 () Bool)

(declare-fun e!830113 () Bool)

(assert (=> b!1479961 (=> (not res!1005817) (not e!830113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479961 (= res!1005817 (validKeyInArray!0 (select (arr!47960 a!2862) i!1006)))))

(declare-fun b!1479962 () Bool)

(declare-fun res!1005825 () Bool)

(assert (=> b!1479962 (=> (not res!1005825) (not e!830113))))

(assert (=> b!1479962 (= res!1005825 (validKeyInArray!0 (select (arr!47960 a!2862) j!93)))))

(declare-fun b!1479963 () Bool)

(declare-fun e!830108 () Bool)

(assert (=> b!1479963 (= e!830113 e!830108)))

(declare-fun res!1005815 () Bool)

(assert (=> b!1479963 (=> (not res!1005815) (not e!830108))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479963 (= res!1005815 (= (select (store (arr!47960 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646236 () array!99362)

(assert (=> b!1479963 (= lt!646236 (array!99363 (store (arr!47960 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48510 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1479964 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!830109 () Bool)

(assert (=> b!1479964 (= e!830109 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479965 () Bool)

(declare-fun res!1005813 () Bool)

(assert (=> b!1479965 (=> (not res!1005813) (not e!830113))))

(declare-datatypes ((List!34461 0))(
  ( (Nil!34458) (Cons!34457 (h!35825 (_ BitVec 64)) (t!49155 List!34461)) )
))
(declare-fun arrayNoDuplicates!0 (array!99362 (_ BitVec 32) List!34461) Bool)

(assert (=> b!1479965 (= res!1005813 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34458))))

(declare-fun b!1479966 () Bool)

(declare-fun res!1005829 () Bool)

(assert (=> b!1479966 (=> (not res!1005829) (not e!830115))))

(declare-fun e!830117 () Bool)

(assert (=> b!1479966 (= res!1005829 e!830117)))

(declare-fun c!136593 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479966 (= c!136593 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479967 () Bool)

(declare-fun res!1005820 () Bool)

(assert (=> b!1479967 (=> res!1005820 e!830116)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99362 (_ BitVec 32)) SeekEntryResult!12200)

(assert (=> b!1479967 (= res!1005820 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47960 a!2862) j!93) a!2862 mask!2687) lt!646239)))))

(declare-fun b!1479968 () Bool)

(declare-fun res!1005818 () Bool)

(assert (=> b!1479968 (=> (not res!1005818) (not e!830113))))

(assert (=> b!1479968 (= res!1005818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479969 () Bool)

(declare-fun res!1005814 () Bool)

(assert (=> b!1479969 (=> (not res!1005814) (not e!830113))))

(assert (=> b!1479969 (= res!1005814 (and (= (size!48510 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48510 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48510 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1005816 () Bool)

(assert (=> start!126256 (=> (not res!1005816) (not e!830113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126256 (= res!1005816 (validMask!0 mask!2687))))

(assert (=> start!126256 e!830113))

(assert (=> start!126256 true))

(declare-fun array_inv!36988 (array!99362) Bool)

(assert (=> start!126256 (array_inv!36988 a!2862)))

(declare-fun b!1479970 () Bool)

(assert (=> b!1479970 (= e!830116 true)))

(declare-fun lt!646238 () (_ BitVec 64))

(assert (=> b!1479970 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646238 lt!646236 mask!2687) lt!646239)))

(declare-fun lt!646234 () Unit!49740)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49740)

(assert (=> b!1479970 (= lt!646234 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479971 () Bool)

(declare-fun lt!646232 () SeekEntryResult!12200)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99362 (_ BitVec 32)) SeekEntryResult!12200)

(assert (=> b!1479971 (= e!830117 (= lt!646232 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646238 lt!646236 mask!2687)))))

(declare-fun b!1479972 () Bool)

(declare-fun e!830112 () Bool)

(assert (=> b!1479972 (= e!830108 e!830112)))

(declare-fun res!1005819 () Bool)

(assert (=> b!1479972 (=> (not res!1005819) (not e!830112))))

(declare-fun lt!646233 () SeekEntryResult!12200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479972 (= res!1005819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47960 a!2862) j!93) mask!2687) (select (arr!47960 a!2862) j!93) a!2862 mask!2687) lt!646233))))

(assert (=> b!1479972 (= lt!646233 (Intermediate!12200 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479973 () Bool)

(assert (=> b!1479973 (= e!830111 e!830109)))

(declare-fun res!1005822 () Bool)

(assert (=> b!1479973 (=> (not res!1005822) (not e!830109))))

(assert (=> b!1479973 (= res!1005822 (= lt!646235 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47960 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479974 () Bool)

(declare-fun res!1005824 () Bool)

(assert (=> b!1479974 (=> (not res!1005824) (not e!830113))))

(assert (=> b!1479974 (= res!1005824 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48510 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48510 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48510 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479975 () Bool)

(declare-fun res!1005828 () Bool)

(assert (=> b!1479975 (=> (not res!1005828) (not e!830112))))

(assert (=> b!1479975 (= res!1005828 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47960 a!2862) j!93) a!2862 mask!2687) lt!646233))))

(declare-fun b!1479976 () Bool)

(declare-fun res!1005827 () Bool)

(assert (=> b!1479976 (=> (not res!1005827) (not e!830115))))

(assert (=> b!1479976 (= res!1005827 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479977 () Bool)

(assert (=> b!1479977 (= e!830112 e!830115)))

(declare-fun res!1005812 () Bool)

(assert (=> b!1479977 (=> (not res!1005812) (not e!830115))))

(assert (=> b!1479977 (= res!1005812 (= lt!646232 (Intermediate!12200 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479977 (= lt!646232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646238 mask!2687) lt!646238 lt!646236 mask!2687))))

(assert (=> b!1479977 (= lt!646238 (select (store (arr!47960 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479978 () Bool)

(assert (=> b!1479978 (= e!830117 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646238 lt!646236 mask!2687) (seekEntryOrOpen!0 lt!646238 lt!646236 mask!2687)))))

(assert (= (and start!126256 res!1005816) b!1479969))

(assert (= (and b!1479969 res!1005814) b!1479961))

(assert (= (and b!1479961 res!1005817) b!1479962))

(assert (= (and b!1479962 res!1005825) b!1479968))

(assert (= (and b!1479968 res!1005818) b!1479965))

(assert (= (and b!1479965 res!1005813) b!1479974))

(assert (= (and b!1479974 res!1005824) b!1479963))

(assert (= (and b!1479963 res!1005815) b!1479972))

(assert (= (and b!1479972 res!1005819) b!1479975))

(assert (= (and b!1479975 res!1005828) b!1479977))

(assert (= (and b!1479977 res!1005812) b!1479966))

(assert (= (and b!1479966 c!136593) b!1479971))

(assert (= (and b!1479966 (not c!136593)) b!1479978))

(assert (= (and b!1479966 res!1005829) b!1479976))

(assert (= (and b!1479976 res!1005827) b!1479960))

(assert (= (and b!1479960 res!1005826) b!1479959))

(assert (= (and b!1479959 (not res!1005823)) b!1479973))

(assert (= (and b!1479973 res!1005822) b!1479964))

(assert (= (and b!1479960 (not res!1005821)) b!1479967))

(assert (= (and b!1479967 (not res!1005820)) b!1479970))

(declare-fun m!1365793 () Bool)

(assert (=> b!1479977 m!1365793))

(assert (=> b!1479977 m!1365793))

(declare-fun m!1365795 () Bool)

(assert (=> b!1479977 m!1365795))

(declare-fun m!1365797 () Bool)

(assert (=> b!1479977 m!1365797))

(declare-fun m!1365799 () Bool)

(assert (=> b!1479977 m!1365799))

(declare-fun m!1365801 () Bool)

(assert (=> b!1479973 m!1365801))

(assert (=> b!1479973 m!1365801))

(declare-fun m!1365803 () Bool)

(assert (=> b!1479973 m!1365803))

(declare-fun m!1365805 () Bool)

(assert (=> b!1479961 m!1365805))

(assert (=> b!1479961 m!1365805))

(declare-fun m!1365807 () Bool)

(assert (=> b!1479961 m!1365807))

(declare-fun m!1365809 () Bool)

(assert (=> b!1479970 m!1365809))

(declare-fun m!1365811 () Bool)

(assert (=> b!1479970 m!1365811))

(declare-fun m!1365813 () Bool)

(assert (=> b!1479965 m!1365813))

(declare-fun m!1365815 () Bool)

(assert (=> b!1479968 m!1365815))

(assert (=> b!1479962 m!1365801))

(assert (=> b!1479962 m!1365801))

(declare-fun m!1365817 () Bool)

(assert (=> b!1479962 m!1365817))

(assert (=> b!1479975 m!1365801))

(assert (=> b!1479975 m!1365801))

(declare-fun m!1365819 () Bool)

(assert (=> b!1479975 m!1365819))

(declare-fun m!1365821 () Bool)

(assert (=> b!1479971 m!1365821))

(declare-fun m!1365823 () Bool)

(assert (=> b!1479959 m!1365823))

(assert (=> b!1479959 m!1365797))

(declare-fun m!1365825 () Bool)

(assert (=> b!1479959 m!1365825))

(assert (=> b!1479959 m!1365801))

(assert (=> b!1479967 m!1365801))

(assert (=> b!1479967 m!1365801))

(declare-fun m!1365827 () Bool)

(assert (=> b!1479967 m!1365827))

(assert (=> b!1479978 m!1365809))

(declare-fun m!1365829 () Bool)

(assert (=> b!1479978 m!1365829))

(declare-fun m!1365831 () Bool)

(assert (=> b!1479960 m!1365831))

(assert (=> b!1479960 m!1365797))

(declare-fun m!1365833 () Bool)

(assert (=> b!1479960 m!1365833))

(assert (=> b!1479960 m!1365825))

(assert (=> b!1479960 m!1365823))

(assert (=> b!1479960 m!1365801))

(declare-fun m!1365835 () Bool)

(assert (=> b!1479960 m!1365835))

(declare-fun m!1365837 () Bool)

(assert (=> b!1479960 m!1365837))

(assert (=> b!1479960 m!1365801))

(assert (=> b!1479972 m!1365801))

(assert (=> b!1479972 m!1365801))

(declare-fun m!1365839 () Bool)

(assert (=> b!1479972 m!1365839))

(assert (=> b!1479972 m!1365839))

(assert (=> b!1479972 m!1365801))

(declare-fun m!1365841 () Bool)

(assert (=> b!1479972 m!1365841))

(declare-fun m!1365843 () Bool)

(assert (=> start!126256 m!1365843))

(declare-fun m!1365845 () Bool)

(assert (=> start!126256 m!1365845))

(assert (=> b!1479963 m!1365797))

(declare-fun m!1365847 () Bool)

(assert (=> b!1479963 m!1365847))

(push 1)

