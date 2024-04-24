; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125076 () Bool)

(assert start!125076)

(declare-fun b!1451010 () Bool)

(declare-fun e!817204 () Bool)

(declare-fun e!817203 () Bool)

(assert (=> b!1451010 (= e!817204 (not e!817203))))

(declare-fun res!981612 () Bool)

(assert (=> b!1451010 (=> res!981612 e!817203)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98419 0))(
  ( (array!98420 (arr!47494 (Array (_ BitVec 32) (_ BitVec 64))) (size!48045 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98419)

(assert (=> b!1451010 (= res!981612 (or (and (= (select (arr!47494 a!2862) index!646) (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47494 a!2862) index!646) (select (arr!47494 a!2862) j!93))) (not (= (select (arr!47494 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47494 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!817205 () Bool)

(assert (=> b!1451010 e!817205))

(declare-fun res!981617 () Bool)

(assert (=> b!1451010 (=> (not res!981617) (not e!817205))))

(declare-datatypes ((SeekEntryResult!11643 0))(
  ( (MissingZero!11643 (index!48964 (_ BitVec 32))) (Found!11643 (index!48965 (_ BitVec 32))) (Intermediate!11643 (undefined!12455 Bool) (index!48966 (_ BitVec 32)) (x!130804 (_ BitVec 32))) (Undefined!11643) (MissingVacant!11643 (index!48967 (_ BitVec 32))) )
))
(declare-fun lt!636469 () SeekEntryResult!11643)

(declare-fun lt!636468 () SeekEntryResult!11643)

(assert (=> b!1451010 (= res!981617 (and (= lt!636468 lt!636469) (or (= (select (arr!47494 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47494 a!2862) intermediateBeforeIndex!19) (select (arr!47494 a!2862) j!93)))))))

(assert (=> b!1451010 (= lt!636469 (Found!11643 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98419 (_ BitVec 32)) SeekEntryResult!11643)

(assert (=> b!1451010 (= lt!636468 (seekEntryOrOpen!0 (select (arr!47494 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98419 (_ BitVec 32)) Bool)

(assert (=> b!1451010 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48815 0))(
  ( (Unit!48816) )
))
(declare-fun lt!636474 () Unit!48815)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48815)

(assert (=> b!1451010 (= lt!636474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!817212 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1451011 () Bool)

(assert (=> b!1451011 (= e!817212 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1451012 () Bool)

(declare-fun e!817210 () Bool)

(declare-fun e!817207 () Bool)

(assert (=> b!1451012 (= e!817210 e!817207)))

(declare-fun res!981602 () Bool)

(assert (=> b!1451012 (=> (not res!981602) (not e!817207))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451012 (= res!981602 (= (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636470 () array!98419)

(assert (=> b!1451012 (= lt!636470 (array!98420 (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48045 a!2862)))))

(declare-fun b!1451013 () Bool)

(declare-fun res!981613 () Bool)

(assert (=> b!1451013 (=> (not res!981613) (not e!817210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451013 (= res!981613 (validKeyInArray!0 (select (arr!47494 a!2862) j!93)))))

(declare-fun res!981601 () Bool)

(assert (=> start!125076 (=> (not res!981601) (not e!817210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125076 (= res!981601 (validMask!0 mask!2687))))

(assert (=> start!125076 e!817210))

(assert (=> start!125076 true))

(declare-fun array_inv!36775 (array!98419) Bool)

(assert (=> start!125076 (array_inv!36775 a!2862)))

(declare-fun b!1451014 () Bool)

(declare-fun res!981609 () Bool)

(assert (=> b!1451014 (=> (not res!981609) (not e!817210))))

(assert (=> b!1451014 (= res!981609 (validKeyInArray!0 (select (arr!47494 a!2862) i!1006)))))

(declare-fun b!1451015 () Bool)

(declare-fun e!817208 () Bool)

(assert (=> b!1451015 (= e!817207 e!817208)))

(declare-fun res!981610 () Bool)

(assert (=> b!1451015 (=> (not res!981610) (not e!817208))))

(declare-fun lt!636471 () SeekEntryResult!11643)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98419 (_ BitVec 32)) SeekEntryResult!11643)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451015 (= res!981610 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47494 a!2862) j!93) mask!2687) (select (arr!47494 a!2862) j!93) a!2862 mask!2687) lt!636471))))

(assert (=> b!1451015 (= lt!636471 (Intermediate!11643 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451016 () Bool)

(declare-fun res!981606 () Bool)

(assert (=> b!1451016 (=> (not res!981606) (not e!817210))))

(assert (=> b!1451016 (= res!981606 (and (= (size!48045 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48045 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48045 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451017 () Bool)

(declare-fun res!981614 () Bool)

(assert (=> b!1451017 (=> (not res!981614) (not e!817204))))

(assert (=> b!1451017 (= res!981614 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451018 () Bool)

(declare-fun res!981608 () Bool)

(assert (=> b!1451018 (=> (not res!981608) (not e!817210))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451018 (= res!981608 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48045 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48045 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48045 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451019 () Bool)

(declare-fun e!817209 () Bool)

(assert (=> b!1451019 (= e!817209 e!817212)))

(declare-fun res!981611 () Bool)

(assert (=> b!1451019 (=> (not res!981611) (not e!817212))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98419 (_ BitVec 32)) SeekEntryResult!11643)

(assert (=> b!1451019 (= res!981611 (= lt!636468 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47494 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun e!817211 () Bool)

(declare-fun b!1451020 () Bool)

(declare-fun lt!636475 () (_ BitVec 64))

(declare-fun lt!636473 () SeekEntryResult!11643)

(assert (=> b!1451020 (= e!817211 (= lt!636473 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636475 lt!636470 mask!2687)))))

(declare-fun b!1451021 () Bool)

(assert (=> b!1451021 (= e!817205 e!817209)))

(declare-fun res!981605 () Bool)

(assert (=> b!1451021 (=> res!981605 e!817209)))

(assert (=> b!1451021 (= res!981605 (or (and (= (select (arr!47494 a!2862) index!646) (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47494 a!2862) index!646) (select (arr!47494 a!2862) j!93))) (not (= (select (arr!47494 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1451022 () Bool)

(declare-fun res!981615 () Bool)

(assert (=> b!1451022 (=> (not res!981615) (not e!817208))))

(assert (=> b!1451022 (= res!981615 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47494 a!2862) j!93) a!2862 mask!2687) lt!636471))))

(declare-fun b!1451023 () Bool)

(declare-fun res!981616 () Bool)

(assert (=> b!1451023 (=> res!981616 e!817203)))

(assert (=> b!1451023 (= res!981616 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47494 a!2862) j!93) a!2862 mask!2687) lt!636469)))))

(declare-fun b!1451024 () Bool)

(declare-fun res!981603 () Bool)

(assert (=> b!1451024 (=> (not res!981603) (not e!817210))))

(declare-datatypes ((List!33982 0))(
  ( (Nil!33979) (Cons!33978 (h!35339 (_ BitVec 64)) (t!48668 List!33982)) )
))
(declare-fun arrayNoDuplicates!0 (array!98419 (_ BitVec 32) List!33982) Bool)

(assert (=> b!1451024 (= res!981603 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33979))))

(declare-fun b!1451025 () Bool)

(declare-fun res!981600 () Bool)

(assert (=> b!1451025 (=> (not res!981600) (not e!817204))))

(assert (=> b!1451025 (= res!981600 e!817211)))

(declare-fun c!134224 () Bool)

(assert (=> b!1451025 (= c!134224 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451026 () Bool)

(assert (=> b!1451026 (= e!817208 e!817204)))

(declare-fun res!981604 () Bool)

(assert (=> b!1451026 (=> (not res!981604) (not e!817204))))

(assert (=> b!1451026 (= res!981604 (= lt!636473 (Intermediate!11643 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451026 (= lt!636473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636475 mask!2687) lt!636475 lt!636470 mask!2687))))

(assert (=> b!1451026 (= lt!636475 (select (store (arr!47494 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451027 () Bool)

(assert (=> b!1451027 (= e!817211 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636475 lt!636470 mask!2687) (seekEntryOrOpen!0 lt!636475 lt!636470 mask!2687)))))

(declare-fun b!1451028 () Bool)

(assert (=> b!1451028 (= e!817203 true)))

(assert (=> b!1451028 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636475 lt!636470 mask!2687) lt!636469)))

(declare-fun lt!636472 () Unit!48815)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48815)

(assert (=> b!1451028 (= lt!636472 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1451029 () Bool)

(declare-fun res!981607 () Bool)

(assert (=> b!1451029 (=> (not res!981607) (not e!817210))))

(assert (=> b!1451029 (= res!981607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125076 res!981601) b!1451016))

(assert (= (and b!1451016 res!981606) b!1451014))

(assert (= (and b!1451014 res!981609) b!1451013))

(assert (= (and b!1451013 res!981613) b!1451029))

(assert (= (and b!1451029 res!981607) b!1451024))

(assert (= (and b!1451024 res!981603) b!1451018))

(assert (= (and b!1451018 res!981608) b!1451012))

(assert (= (and b!1451012 res!981602) b!1451015))

(assert (= (and b!1451015 res!981610) b!1451022))

(assert (= (and b!1451022 res!981615) b!1451026))

(assert (= (and b!1451026 res!981604) b!1451025))

(assert (= (and b!1451025 c!134224) b!1451020))

(assert (= (and b!1451025 (not c!134224)) b!1451027))

(assert (= (and b!1451025 res!981600) b!1451017))

(assert (= (and b!1451017 res!981614) b!1451010))

(assert (= (and b!1451010 res!981617) b!1451021))

(assert (= (and b!1451021 (not res!981605)) b!1451019))

(assert (= (and b!1451019 res!981611) b!1451011))

(assert (= (and b!1451010 (not res!981612)) b!1451023))

(assert (= (and b!1451023 (not res!981616)) b!1451028))

(declare-fun m!1339819 () Bool)

(assert (=> b!1451015 m!1339819))

(assert (=> b!1451015 m!1339819))

(declare-fun m!1339821 () Bool)

(assert (=> b!1451015 m!1339821))

(assert (=> b!1451015 m!1339821))

(assert (=> b!1451015 m!1339819))

(declare-fun m!1339823 () Bool)

(assert (=> b!1451015 m!1339823))

(assert (=> b!1451022 m!1339819))

(assert (=> b!1451022 m!1339819))

(declare-fun m!1339825 () Bool)

(assert (=> b!1451022 m!1339825))

(assert (=> b!1451013 m!1339819))

(assert (=> b!1451013 m!1339819))

(declare-fun m!1339827 () Bool)

(assert (=> b!1451013 m!1339827))

(declare-fun m!1339829 () Bool)

(assert (=> b!1451012 m!1339829))

(declare-fun m!1339831 () Bool)

(assert (=> b!1451012 m!1339831))

(declare-fun m!1339833 () Bool)

(assert (=> b!1451024 m!1339833))

(assert (=> b!1451019 m!1339819))

(assert (=> b!1451019 m!1339819))

(declare-fun m!1339835 () Bool)

(assert (=> b!1451019 m!1339835))

(declare-fun m!1339837 () Bool)

(assert (=> b!1451010 m!1339837))

(assert (=> b!1451010 m!1339829))

(declare-fun m!1339839 () Bool)

(assert (=> b!1451010 m!1339839))

(declare-fun m!1339841 () Bool)

(assert (=> b!1451010 m!1339841))

(declare-fun m!1339843 () Bool)

(assert (=> b!1451010 m!1339843))

(assert (=> b!1451010 m!1339819))

(declare-fun m!1339845 () Bool)

(assert (=> b!1451010 m!1339845))

(declare-fun m!1339847 () Bool)

(assert (=> b!1451010 m!1339847))

(assert (=> b!1451010 m!1339819))

(declare-fun m!1339849 () Bool)

(assert (=> b!1451026 m!1339849))

(assert (=> b!1451026 m!1339849))

(declare-fun m!1339851 () Bool)

(assert (=> b!1451026 m!1339851))

(assert (=> b!1451026 m!1339829))

(declare-fun m!1339853 () Bool)

(assert (=> b!1451026 m!1339853))

(declare-fun m!1339855 () Bool)

(assert (=> b!1451027 m!1339855))

(declare-fun m!1339857 () Bool)

(assert (=> b!1451027 m!1339857))

(declare-fun m!1339859 () Bool)

(assert (=> start!125076 m!1339859))

(declare-fun m!1339861 () Bool)

(assert (=> start!125076 m!1339861))

(assert (=> b!1451028 m!1339855))

(declare-fun m!1339863 () Bool)

(assert (=> b!1451028 m!1339863))

(assert (=> b!1451021 m!1339843))

(assert (=> b!1451021 m!1339829))

(assert (=> b!1451021 m!1339841))

(assert (=> b!1451021 m!1339819))

(declare-fun m!1339865 () Bool)

(assert (=> b!1451014 m!1339865))

(assert (=> b!1451014 m!1339865))

(declare-fun m!1339867 () Bool)

(assert (=> b!1451014 m!1339867))

(assert (=> b!1451023 m!1339819))

(assert (=> b!1451023 m!1339819))

(declare-fun m!1339869 () Bool)

(assert (=> b!1451023 m!1339869))

(declare-fun m!1339871 () Bool)

(assert (=> b!1451029 m!1339871))

(declare-fun m!1339873 () Bool)

(assert (=> b!1451020 m!1339873))

(check-sat (not start!125076) (not b!1451020) (not b!1451014) (not b!1451013) (not b!1451022) (not b!1451024) (not b!1451028) (not b!1451019) (not b!1451026) (not b!1451029) (not b!1451015) (not b!1451010) (not b!1451023) (not b!1451027))
(check-sat)
