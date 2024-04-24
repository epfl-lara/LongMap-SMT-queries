; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126510 () Bool)

(assert start!126510)

(declare-fun b!1480954 () Bool)

(declare-fun res!1005789 () Bool)

(declare-fun e!830819 () Bool)

(assert (=> b!1480954 (=> (not res!1005789) (not e!830819))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99454 0))(
  ( (array!99455 (arr!48001 (Array (_ BitVec 32) (_ BitVec 64))) (size!48552 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99454)

(assert (=> b!1480954 (= res!1005789 (and (= (size!48552 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48552 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48552 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480955 () Bool)

(declare-fun e!830814 () Bool)

(declare-fun e!830815 () Bool)

(assert (=> b!1480955 (= e!830814 e!830815)))

(declare-fun res!1005782 () Bool)

(assert (=> b!1480955 (=> (not res!1005782) (not e!830815))))

(declare-datatypes ((SeekEntryResult!12138 0))(
  ( (MissingZero!12138 (index!50944 (_ BitVec 32))) (Found!12138 (index!50945 (_ BitVec 32))) (Intermediate!12138 (undefined!12950 Bool) (index!50946 (_ BitVec 32)) (x!132714 (_ BitVec 32))) (Undefined!12138) (MissingVacant!12138 (index!50947 (_ BitVec 32))) )
))
(declare-fun lt!646589 () SeekEntryResult!12138)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12138)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480955 (= res!1005782 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48001 a!2862) j!93) mask!2687) (select (arr!48001 a!2862) j!93) a!2862 mask!2687) lt!646589))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480955 (= lt!646589 (Intermediate!12138 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480956 () Bool)

(declare-fun res!1005796 () Bool)

(assert (=> b!1480956 (=> (not res!1005796) (not e!830815))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1480956 (= res!1005796 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48001 a!2862) j!93) a!2862 mask!2687) lt!646589))))

(declare-fun b!1480957 () Bool)

(declare-fun lt!646591 () array!99454)

(declare-fun e!830820 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!646588 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12138)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12138)

(assert (=> b!1480957 (= e!830820 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646588 lt!646591 mask!2687) (seekEntryOrOpen!0 lt!646588 lt!646591 mask!2687)))))

(declare-fun b!1480958 () Bool)

(declare-fun res!1005794 () Bool)

(declare-fun e!830818 () Bool)

(assert (=> b!1480958 (=> (not res!1005794) (not e!830818))))

(assert (=> b!1480958 (= res!1005794 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480959 () Bool)

(assert (=> b!1480959 (= e!830819 e!830814)))

(declare-fun res!1005790 () Bool)

(assert (=> b!1480959 (=> (not res!1005790) (not e!830814))))

(assert (=> b!1480959 (= res!1005790 (= (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480959 (= lt!646591 (array!99455 (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48552 a!2862)))))

(declare-fun b!1480960 () Bool)

(declare-fun lt!646594 () SeekEntryResult!12138)

(assert (=> b!1480960 (= e!830820 (= lt!646594 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646588 lt!646591 mask!2687)))))

(declare-fun b!1480961 () Bool)

(declare-fun res!1005793 () Bool)

(assert (=> b!1480961 (=> (not res!1005793) (not e!830819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99454 (_ BitVec 32)) Bool)

(assert (=> b!1480961 (= res!1005793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!646590 () SeekEntryResult!12138)

(declare-fun b!1480962 () Bool)

(declare-fun e!830812 () Bool)

(assert (=> b!1480962 (= e!830812 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!48001 a!2862) j!93) a!2862 mask!2687) lt!646590))))

(declare-fun b!1480963 () Bool)

(declare-fun e!830811 () Bool)

(declare-fun e!830817 () Bool)

(assert (=> b!1480963 (= e!830811 e!830817)))

(declare-fun res!1005781 () Bool)

(assert (=> b!1480963 (=> res!1005781 e!830817)))

(assert (=> b!1480963 (= res!1005781 (or (and (= (select (arr!48001 a!2862) index!646) (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48001 a!2862) index!646) (select (arr!48001 a!2862) j!93))) (not (= (select (arr!48001 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480964 () Bool)

(declare-fun res!1005783 () Bool)

(assert (=> b!1480964 (=> (not res!1005783) (not e!830819))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480964 (= res!1005783 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48552 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48552 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48552 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1005786 () Bool)

(assert (=> start!126510 (=> (not res!1005786) (not e!830819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126510 (= res!1005786 (validMask!0 mask!2687))))

(assert (=> start!126510 e!830819))

(assert (=> start!126510 true))

(declare-fun array_inv!37282 (array!99454) Bool)

(assert (=> start!126510 (array_inv!37282 a!2862)))

(declare-fun b!1480965 () Bool)

(declare-fun res!1005797 () Bool)

(assert (=> b!1480965 (=> (not res!1005797) (not e!830819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480965 (= res!1005797 (validKeyInArray!0 (select (arr!48001 a!2862) i!1006)))))

(declare-fun b!1480966 () Bool)

(declare-fun res!1005788 () Bool)

(assert (=> b!1480966 (=> (not res!1005788) (not e!830819))))

(assert (=> b!1480966 (= res!1005788 (validKeyInArray!0 (select (arr!48001 a!2862) j!93)))))

(declare-fun b!1480967 () Bool)

(declare-fun res!1005785 () Bool)

(assert (=> b!1480967 (=> (not res!1005785) (not e!830818))))

(assert (=> b!1480967 (= res!1005785 e!830820)))

(declare-fun c!137116 () Bool)

(assert (=> b!1480967 (= c!137116 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480968 () Bool)

(declare-fun e!830813 () Bool)

(assert (=> b!1480968 (= e!830817 e!830813)))

(declare-fun res!1005784 () Bool)

(assert (=> b!1480968 (=> (not res!1005784) (not e!830813))))

(declare-fun lt!646592 () SeekEntryResult!12138)

(assert (=> b!1480968 (= res!1005784 (= lt!646592 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!48001 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480969 () Bool)

(assert (=> b!1480969 (= e!830813 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480970 () Bool)

(assert (=> b!1480970 (= e!830818 (not e!830812))))

(declare-fun res!1005795 () Bool)

(assert (=> b!1480970 (=> res!1005795 e!830812)))

(assert (=> b!1480970 (= res!1005795 (or (and (= (select (arr!48001 a!2862) index!646) (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48001 a!2862) index!646) (select (arr!48001 a!2862) j!93))) (not (= (select (arr!48001 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48001 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480970 e!830811))

(declare-fun res!1005792 () Bool)

(assert (=> b!1480970 (=> (not res!1005792) (not e!830811))))

(assert (=> b!1480970 (= res!1005792 (and (= lt!646592 lt!646590) (or (= (select (arr!48001 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48001 a!2862) intermediateBeforeIndex!19) (select (arr!48001 a!2862) j!93)))))))

(assert (=> b!1480970 (= lt!646590 (Found!12138 j!93))))

(assert (=> b!1480970 (= lt!646592 (seekEntryOrOpen!0 (select (arr!48001 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1480970 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49649 0))(
  ( (Unit!49650) )
))
(declare-fun lt!646593 () Unit!49649)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49649)

(assert (=> b!1480970 (= lt!646593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480971 () Bool)

(assert (=> b!1480971 (= e!830815 e!830818)))

(declare-fun res!1005791 () Bool)

(assert (=> b!1480971 (=> (not res!1005791) (not e!830818))))

(assert (=> b!1480971 (= res!1005791 (= lt!646594 (Intermediate!12138 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1480971 (= lt!646594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646588 mask!2687) lt!646588 lt!646591 mask!2687))))

(assert (=> b!1480971 (= lt!646588 (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480972 () Bool)

(declare-fun res!1005787 () Bool)

(assert (=> b!1480972 (=> (not res!1005787) (not e!830819))))

(declare-datatypes ((List!34489 0))(
  ( (Nil!34486) (Cons!34485 (h!35867 (_ BitVec 64)) (t!49175 List!34489)) )
))
(declare-fun arrayNoDuplicates!0 (array!99454 (_ BitVec 32) List!34489) Bool)

(assert (=> b!1480972 (= res!1005787 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34486))))

(assert (= (and start!126510 res!1005786) b!1480954))

(assert (= (and b!1480954 res!1005789) b!1480965))

(assert (= (and b!1480965 res!1005797) b!1480966))

(assert (= (and b!1480966 res!1005788) b!1480961))

(assert (= (and b!1480961 res!1005793) b!1480972))

(assert (= (and b!1480972 res!1005787) b!1480964))

(assert (= (and b!1480964 res!1005783) b!1480959))

(assert (= (and b!1480959 res!1005790) b!1480955))

(assert (= (and b!1480955 res!1005782) b!1480956))

(assert (= (and b!1480956 res!1005796) b!1480971))

(assert (= (and b!1480971 res!1005791) b!1480967))

(assert (= (and b!1480967 c!137116) b!1480960))

(assert (= (and b!1480967 (not c!137116)) b!1480957))

(assert (= (and b!1480967 res!1005785) b!1480958))

(assert (= (and b!1480958 res!1005794) b!1480970))

(assert (= (and b!1480970 res!1005792) b!1480963))

(assert (= (and b!1480963 (not res!1005781)) b!1480968))

(assert (= (and b!1480968 res!1005784) b!1480969))

(assert (= (and b!1480970 (not res!1005795)) b!1480962))

(declare-fun m!1366813 () Bool)

(assert (=> b!1480957 m!1366813))

(declare-fun m!1366815 () Bool)

(assert (=> b!1480957 m!1366815))

(declare-fun m!1366817 () Bool)

(assert (=> b!1480970 m!1366817))

(declare-fun m!1366819 () Bool)

(assert (=> b!1480970 m!1366819))

(declare-fun m!1366821 () Bool)

(assert (=> b!1480970 m!1366821))

(declare-fun m!1366823 () Bool)

(assert (=> b!1480970 m!1366823))

(declare-fun m!1366825 () Bool)

(assert (=> b!1480970 m!1366825))

(declare-fun m!1366827 () Bool)

(assert (=> b!1480970 m!1366827))

(declare-fun m!1366829 () Bool)

(assert (=> b!1480970 m!1366829))

(declare-fun m!1366831 () Bool)

(assert (=> b!1480970 m!1366831))

(assert (=> b!1480970 m!1366827))

(assert (=> b!1480963 m!1366825))

(assert (=> b!1480963 m!1366819))

(assert (=> b!1480963 m!1366823))

(assert (=> b!1480963 m!1366827))

(declare-fun m!1366833 () Bool)

(assert (=> b!1480965 m!1366833))

(assert (=> b!1480965 m!1366833))

(declare-fun m!1366835 () Bool)

(assert (=> b!1480965 m!1366835))

(declare-fun m!1366837 () Bool)

(assert (=> b!1480971 m!1366837))

(assert (=> b!1480971 m!1366837))

(declare-fun m!1366839 () Bool)

(assert (=> b!1480971 m!1366839))

(assert (=> b!1480971 m!1366819))

(declare-fun m!1366841 () Bool)

(assert (=> b!1480971 m!1366841))

(assert (=> b!1480966 m!1366827))

(assert (=> b!1480966 m!1366827))

(declare-fun m!1366843 () Bool)

(assert (=> b!1480966 m!1366843))

(declare-fun m!1366845 () Bool)

(assert (=> b!1480960 m!1366845))

(assert (=> b!1480962 m!1366827))

(assert (=> b!1480962 m!1366827))

(declare-fun m!1366847 () Bool)

(assert (=> b!1480962 m!1366847))

(declare-fun m!1366849 () Bool)

(assert (=> b!1480972 m!1366849))

(declare-fun m!1366851 () Bool)

(assert (=> start!126510 m!1366851))

(declare-fun m!1366853 () Bool)

(assert (=> start!126510 m!1366853))

(declare-fun m!1366855 () Bool)

(assert (=> b!1480961 m!1366855))

(assert (=> b!1480955 m!1366827))

(assert (=> b!1480955 m!1366827))

(declare-fun m!1366857 () Bool)

(assert (=> b!1480955 m!1366857))

(assert (=> b!1480955 m!1366857))

(assert (=> b!1480955 m!1366827))

(declare-fun m!1366859 () Bool)

(assert (=> b!1480955 m!1366859))

(assert (=> b!1480968 m!1366827))

(assert (=> b!1480968 m!1366827))

(declare-fun m!1366861 () Bool)

(assert (=> b!1480968 m!1366861))

(assert (=> b!1480959 m!1366819))

(declare-fun m!1366863 () Bool)

(assert (=> b!1480959 m!1366863))

(assert (=> b!1480956 m!1366827))

(assert (=> b!1480956 m!1366827))

(declare-fun m!1366865 () Bool)

(assert (=> b!1480956 m!1366865))

(check-sat (not start!126510) (not b!1480966) (not b!1480970) (not b!1480961) (not b!1480957) (not b!1480971) (not b!1480960) (not b!1480965) (not b!1480968) (not b!1480956) (not b!1480962) (not b!1480955) (not b!1480972))
(check-sat)
