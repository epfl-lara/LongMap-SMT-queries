; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124950 () Bool)

(assert start!124950)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1452257 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!817562 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98398 0))(
  ( (array!98399 (arr!47487 (Array (_ BitVec 32) (_ BitVec 64))) (size!48037 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98398)

(assert (=> b!1452257 (= e!817562 (and (or (= (select (arr!47487 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47487 a!2862) intermediateBeforeIndex!19) (select (arr!47487 a!2862) j!93))) (or (and (= (select (arr!47487 a!2862) index!646) (select (store (arr!47487 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47487 a!2862) index!646) (select (arr!47487 a!2862) j!93))) (= (select (arr!47487 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47487 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452258 () Bool)

(declare-fun res!983410 () Bool)

(declare-fun e!817561 () Bool)

(assert (=> b!1452258 (=> (not res!983410) (not e!817561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452258 (= res!983410 (validKeyInArray!0 (select (arr!47487 a!2862) i!1006)))))

(declare-fun b!1452259 () Bool)

(declare-fun e!817565 () Bool)

(declare-fun e!817560 () Bool)

(assert (=> b!1452259 (= e!817565 e!817560)))

(declare-fun res!983397 () Bool)

(assert (=> b!1452259 (=> (not res!983397) (not e!817560))))

(declare-datatypes ((SeekEntryResult!11739 0))(
  ( (MissingZero!11739 (index!49348 (_ BitVec 32))) (Found!11739 (index!49349 (_ BitVec 32))) (Intermediate!11739 (undefined!12551 Bool) (index!49350 (_ BitVec 32)) (x!130996 (_ BitVec 32))) (Undefined!11739) (MissingVacant!11739 (index!49351 (_ BitVec 32))) )
))
(declare-fun lt!636893 () SeekEntryResult!11739)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98398 (_ BitVec 32)) SeekEntryResult!11739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452259 (= res!983397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47487 a!2862) j!93) mask!2687) (select (arr!47487 a!2862) j!93) a!2862 mask!2687) lt!636893))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452259 (= lt!636893 (Intermediate!11739 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!636894 () (_ BitVec 64))

(declare-fun e!817563 () Bool)

(declare-fun b!1452260 () Bool)

(declare-fun lt!636891 () array!98398)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98398 (_ BitVec 32)) SeekEntryResult!11739)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98398 (_ BitVec 32)) SeekEntryResult!11739)

(assert (=> b!1452260 (= e!817563 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636894 lt!636891 mask!2687) (seekEntryOrOpen!0 lt!636894 lt!636891 mask!2687)))))

(declare-fun b!1452261 () Bool)

(declare-fun e!817564 () Bool)

(assert (=> b!1452261 (= e!817560 e!817564)))

(declare-fun res!983398 () Bool)

(assert (=> b!1452261 (=> (not res!983398) (not e!817564))))

(declare-fun lt!636890 () SeekEntryResult!11739)

(assert (=> b!1452261 (= res!983398 (= lt!636890 (Intermediate!11739 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452261 (= lt!636890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636894 mask!2687) lt!636894 lt!636891 mask!2687))))

(assert (=> b!1452261 (= lt!636894 (select (store (arr!47487 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452262 () Bool)

(declare-fun res!983408 () Bool)

(assert (=> b!1452262 (=> (not res!983408) (not e!817561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98398 (_ BitVec 32)) Bool)

(assert (=> b!1452262 (= res!983408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452263 () Bool)

(declare-fun res!983399 () Bool)

(assert (=> b!1452263 (=> (not res!983399) (not e!817564))))

(assert (=> b!1452263 (= res!983399 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452264 () Bool)

(declare-fun res!983407 () Bool)

(assert (=> b!1452264 (=> (not res!983407) (not e!817560))))

(assert (=> b!1452264 (= res!983407 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47487 a!2862) j!93) a!2862 mask!2687) lt!636893))))

(declare-fun b!1452265 () Bool)

(declare-fun res!983409 () Bool)

(assert (=> b!1452265 (=> (not res!983409) (not e!817561))))

(declare-datatypes ((List!33988 0))(
  ( (Nil!33985) (Cons!33984 (h!35334 (_ BitVec 64)) (t!48682 List!33988)) )
))
(declare-fun arrayNoDuplicates!0 (array!98398 (_ BitVec 32) List!33988) Bool)

(assert (=> b!1452265 (= res!983409 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33985))))

(declare-fun res!983400 () Bool)

(assert (=> start!124950 (=> (not res!983400) (not e!817561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124950 (= res!983400 (validMask!0 mask!2687))))

(assert (=> start!124950 e!817561))

(assert (=> start!124950 true))

(declare-fun array_inv!36515 (array!98398) Bool)

(assert (=> start!124950 (array_inv!36515 a!2862)))

(declare-fun b!1452266 () Bool)

(declare-fun res!983406 () Bool)

(assert (=> b!1452266 (=> (not res!983406) (not e!817564))))

(assert (=> b!1452266 (= res!983406 e!817563)))

(declare-fun c!133941 () Bool)

(assert (=> b!1452266 (= c!133941 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452267 () Bool)

(declare-fun res!983404 () Bool)

(assert (=> b!1452267 (=> (not res!983404) (not e!817562))))

(assert (=> b!1452267 (= res!983404 (= (seekEntryOrOpen!0 (select (arr!47487 a!2862) j!93) a!2862 mask!2687) (Found!11739 j!93)))))

(declare-fun b!1452268 () Bool)

(declare-fun res!983401 () Bool)

(assert (=> b!1452268 (=> (not res!983401) (not e!817561))))

(assert (=> b!1452268 (= res!983401 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48037 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48037 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48037 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452269 () Bool)

(declare-fun res!983405 () Bool)

(assert (=> b!1452269 (=> (not res!983405) (not e!817561))))

(assert (=> b!1452269 (= res!983405 (validKeyInArray!0 (select (arr!47487 a!2862) j!93)))))

(declare-fun b!1452270 () Bool)

(declare-fun res!983403 () Bool)

(assert (=> b!1452270 (=> (not res!983403) (not e!817561))))

(assert (=> b!1452270 (= res!983403 (and (= (size!48037 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48037 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48037 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452271 () Bool)

(assert (=> b!1452271 (= e!817564 (not (or (and (= (select (arr!47487 a!2862) index!646) (select (store (arr!47487 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47487 a!2862) index!646) (select (arr!47487 a!2862) j!93))) (= (select (arr!47487 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1452271 e!817562))

(declare-fun res!983396 () Bool)

(assert (=> b!1452271 (=> (not res!983396) (not e!817562))))

(assert (=> b!1452271 (= res!983396 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48974 0))(
  ( (Unit!48975) )
))
(declare-fun lt!636892 () Unit!48974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48974)

(assert (=> b!1452271 (= lt!636892 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452272 () Bool)

(assert (=> b!1452272 (= e!817561 e!817565)))

(declare-fun res!983402 () Bool)

(assert (=> b!1452272 (=> (not res!983402) (not e!817565))))

(assert (=> b!1452272 (= res!983402 (= (select (store (arr!47487 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452272 (= lt!636891 (array!98399 (store (arr!47487 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48037 a!2862)))))

(declare-fun b!1452273 () Bool)

(assert (=> b!1452273 (= e!817563 (= lt!636890 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636894 lt!636891 mask!2687)))))

(assert (= (and start!124950 res!983400) b!1452270))

(assert (= (and b!1452270 res!983403) b!1452258))

(assert (= (and b!1452258 res!983410) b!1452269))

(assert (= (and b!1452269 res!983405) b!1452262))

(assert (= (and b!1452262 res!983408) b!1452265))

(assert (= (and b!1452265 res!983409) b!1452268))

(assert (= (and b!1452268 res!983401) b!1452272))

(assert (= (and b!1452272 res!983402) b!1452259))

(assert (= (and b!1452259 res!983397) b!1452264))

(assert (= (and b!1452264 res!983407) b!1452261))

(assert (= (and b!1452261 res!983398) b!1452266))

(assert (= (and b!1452266 c!133941) b!1452273))

(assert (= (and b!1452266 (not c!133941)) b!1452260))

(assert (= (and b!1452266 res!983406) b!1452263))

(assert (= (and b!1452263 res!983399) b!1452271))

(assert (= (and b!1452271 res!983396) b!1452267))

(assert (= (and b!1452267 res!983404) b!1452257))

(declare-fun m!1340835 () Bool)

(assert (=> b!1452267 m!1340835))

(assert (=> b!1452267 m!1340835))

(declare-fun m!1340837 () Bool)

(assert (=> b!1452267 m!1340837))

(declare-fun m!1340839 () Bool)

(assert (=> start!124950 m!1340839))

(declare-fun m!1340841 () Bool)

(assert (=> start!124950 m!1340841))

(declare-fun m!1340843 () Bool)

(assert (=> b!1452258 m!1340843))

(assert (=> b!1452258 m!1340843))

(declare-fun m!1340845 () Bool)

(assert (=> b!1452258 m!1340845))

(declare-fun m!1340847 () Bool)

(assert (=> b!1452273 m!1340847))

(declare-fun m!1340849 () Bool)

(assert (=> b!1452265 m!1340849))

(declare-fun m!1340851 () Bool)

(assert (=> b!1452262 m!1340851))

(assert (=> b!1452269 m!1340835))

(assert (=> b!1452269 m!1340835))

(declare-fun m!1340853 () Bool)

(assert (=> b!1452269 m!1340853))

(declare-fun m!1340855 () Bool)

(assert (=> b!1452261 m!1340855))

(assert (=> b!1452261 m!1340855))

(declare-fun m!1340857 () Bool)

(assert (=> b!1452261 m!1340857))

(declare-fun m!1340859 () Bool)

(assert (=> b!1452261 m!1340859))

(declare-fun m!1340861 () Bool)

(assert (=> b!1452261 m!1340861))

(assert (=> b!1452272 m!1340859))

(declare-fun m!1340863 () Bool)

(assert (=> b!1452272 m!1340863))

(assert (=> b!1452259 m!1340835))

(assert (=> b!1452259 m!1340835))

(declare-fun m!1340865 () Bool)

(assert (=> b!1452259 m!1340865))

(assert (=> b!1452259 m!1340865))

(assert (=> b!1452259 m!1340835))

(declare-fun m!1340867 () Bool)

(assert (=> b!1452259 m!1340867))

(declare-fun m!1340869 () Bool)

(assert (=> b!1452271 m!1340869))

(assert (=> b!1452271 m!1340859))

(declare-fun m!1340871 () Bool)

(assert (=> b!1452271 m!1340871))

(declare-fun m!1340873 () Bool)

(assert (=> b!1452271 m!1340873))

(declare-fun m!1340875 () Bool)

(assert (=> b!1452271 m!1340875))

(assert (=> b!1452271 m!1340835))

(assert (=> b!1452257 m!1340859))

(declare-fun m!1340877 () Bool)

(assert (=> b!1452257 m!1340877))

(assert (=> b!1452257 m!1340871))

(assert (=> b!1452257 m!1340873))

(assert (=> b!1452257 m!1340835))

(assert (=> b!1452264 m!1340835))

(assert (=> b!1452264 m!1340835))

(declare-fun m!1340879 () Bool)

(assert (=> b!1452264 m!1340879))

(declare-fun m!1340881 () Bool)

(assert (=> b!1452260 m!1340881))

(declare-fun m!1340883 () Bool)

(assert (=> b!1452260 m!1340883))

(check-sat (not b!1452271) (not b!1452261) (not b!1452269) (not b!1452260) (not start!124950) (not b!1452264) (not b!1452273) (not b!1452267) (not b!1452262) (not b!1452259) (not b!1452265) (not b!1452258))
(check-sat)
