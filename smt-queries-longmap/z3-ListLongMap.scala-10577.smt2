; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124818 () Bool)

(assert start!124818)

(declare-fun b!1444021 () Bool)

(declare-fun res!975395 () Bool)

(declare-fun e!813926 () Bool)

(assert (=> b!1444021 (=> (not res!975395) (not e!813926))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98161 0))(
  ( (array!98162 (arr!47365 (Array (_ BitVec 32) (_ BitVec 64))) (size!47916 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98161)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444021 (= res!975395 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47916 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47916 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47916 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444022 () Bool)

(declare-fun res!975391 () Bool)

(assert (=> b!1444022 (=> (not res!975391) (not e!813926))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444022 (= res!975391 (and (= (size!47916 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47916 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47916 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444023 () Bool)

(declare-fun res!975384 () Bool)

(declare-fun e!813927 () Bool)

(assert (=> b!1444023 (=> (not res!975384) (not e!813927))))

(declare-datatypes ((SeekEntryResult!11514 0))(
  ( (MissingZero!11514 (index!48448 (_ BitVec 32))) (Found!11514 (index!48449 (_ BitVec 32))) (Intermediate!11514 (undefined!12326 Bool) (index!48450 (_ BitVec 32)) (x!130331 (_ BitVec 32))) (Undefined!11514) (MissingVacant!11514 (index!48451 (_ BitVec 32))) )
))
(declare-fun lt!634117 () SeekEntryResult!11514)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98161 (_ BitVec 32)) SeekEntryResult!11514)

(assert (=> b!1444023 (= res!975384 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47365 a!2862) j!93) a!2862 mask!2687) lt!634117))))

(declare-fun b!1444024 () Bool)

(declare-fun res!975392 () Bool)

(assert (=> b!1444024 (=> (not res!975392) (not e!813926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444024 (= res!975392 (validKeyInArray!0 (select (arr!47365 a!2862) j!93)))))

(declare-fun lt!634115 () array!98161)

(declare-fun lt!634116 () (_ BitVec 64))

(declare-fun e!813923 () Bool)

(declare-fun b!1444025 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98161 (_ BitVec 32)) SeekEntryResult!11514)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98161 (_ BitVec 32)) SeekEntryResult!11514)

(assert (=> b!1444025 (= e!813923 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634116 lt!634115 mask!2687) (seekEntryOrOpen!0 lt!634116 lt!634115 mask!2687)))))

(declare-fun b!1444026 () Bool)

(declare-fun e!813924 () Bool)

(assert (=> b!1444026 (= e!813926 e!813924)))

(declare-fun res!975385 () Bool)

(assert (=> b!1444026 (=> (not res!975385) (not e!813924))))

(assert (=> b!1444026 (= res!975385 (= (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444026 (= lt!634115 (array!98162 (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47916 a!2862)))))

(declare-fun b!1444027 () Bool)

(declare-fun res!975396 () Bool)

(declare-fun e!813925 () Bool)

(assert (=> b!1444027 (=> (not res!975396) (not e!813925))))

(assert (=> b!1444027 (= res!975396 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444028 () Bool)

(declare-fun res!975389 () Bool)

(assert (=> b!1444028 (=> (not res!975389) (not e!813926))))

(assert (=> b!1444028 (= res!975389 (validKeyInArray!0 (select (arr!47365 a!2862) i!1006)))))

(declare-fun e!813921 () Bool)

(declare-fun b!1444020 () Bool)

(assert (=> b!1444020 (= e!813921 (or (= (select (arr!47365 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47365 a!2862) intermediateBeforeIndex!19) (select (arr!47365 a!2862) j!93))))))

(declare-fun res!975390 () Bool)

(assert (=> start!124818 (=> (not res!975390) (not e!813926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124818 (= res!975390 (validMask!0 mask!2687))))

(assert (=> start!124818 e!813926))

(assert (=> start!124818 true))

(declare-fun array_inv!36646 (array!98161) Bool)

(assert (=> start!124818 (array_inv!36646 a!2862)))

(declare-fun b!1444029 () Bool)

(assert (=> b!1444029 (= e!813927 e!813925)))

(declare-fun res!975388 () Bool)

(assert (=> b!1444029 (=> (not res!975388) (not e!813925))))

(declare-fun lt!634114 () SeekEntryResult!11514)

(assert (=> b!1444029 (= res!975388 (= lt!634114 (Intermediate!11514 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444029 (= lt!634114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634116 mask!2687) lt!634116 lt!634115 mask!2687))))

(assert (=> b!1444029 (= lt!634116 (select (store (arr!47365 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444030 () Bool)

(declare-fun res!975387 () Bool)

(assert (=> b!1444030 (=> (not res!975387) (not e!813926))))

(declare-datatypes ((List!33853 0))(
  ( (Nil!33850) (Cons!33849 (h!35210 (_ BitVec 64)) (t!48539 List!33853)) )
))
(declare-fun arrayNoDuplicates!0 (array!98161 (_ BitVec 32) List!33853) Bool)

(assert (=> b!1444030 (= res!975387 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33850))))

(declare-fun b!1444031 () Bool)

(declare-fun res!975397 () Bool)

(assert (=> b!1444031 (=> (not res!975397) (not e!813925))))

(assert (=> b!1444031 (= res!975397 e!813923)))

(declare-fun c!133837 () Bool)

(assert (=> b!1444031 (= c!133837 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444032 () Bool)

(declare-fun res!975398 () Bool)

(assert (=> b!1444032 (=> (not res!975398) (not e!813921))))

(assert (=> b!1444032 (= res!975398 (= (seekEntryOrOpen!0 (select (arr!47365 a!2862) j!93) a!2862 mask!2687) (Found!11514 j!93)))))

(declare-fun b!1444033 () Bool)

(assert (=> b!1444033 (= e!813923 (= lt!634114 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634116 lt!634115 mask!2687)))))

(declare-fun b!1444034 () Bool)

(declare-fun res!975386 () Bool)

(assert (=> b!1444034 (=> (not res!975386) (not e!813926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98161 (_ BitVec 32)) Bool)

(assert (=> b!1444034 (= res!975386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444035 () Bool)

(assert (=> b!1444035 (= e!813924 e!813927)))

(declare-fun res!975393 () Bool)

(assert (=> b!1444035 (=> (not res!975393) (not e!813927))))

(assert (=> b!1444035 (= res!975393 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47365 a!2862) j!93) mask!2687) (select (arr!47365 a!2862) j!93) a!2862 mask!2687) lt!634117))))

(assert (=> b!1444035 (= lt!634117 (Intermediate!11514 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444036 () Bool)

(assert (=> b!1444036 (= e!813925 (not true))))

(assert (=> b!1444036 e!813921))

(declare-fun res!975394 () Bool)

(assert (=> b!1444036 (=> (not res!975394) (not e!813921))))

(assert (=> b!1444036 (= res!975394 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48557 0))(
  ( (Unit!48558) )
))
(declare-fun lt!634113 () Unit!48557)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48557)

(assert (=> b!1444036 (= lt!634113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124818 res!975390) b!1444022))

(assert (= (and b!1444022 res!975391) b!1444028))

(assert (= (and b!1444028 res!975389) b!1444024))

(assert (= (and b!1444024 res!975392) b!1444034))

(assert (= (and b!1444034 res!975386) b!1444030))

(assert (= (and b!1444030 res!975387) b!1444021))

(assert (= (and b!1444021 res!975395) b!1444026))

(assert (= (and b!1444026 res!975385) b!1444035))

(assert (= (and b!1444035 res!975393) b!1444023))

(assert (= (and b!1444023 res!975384) b!1444029))

(assert (= (and b!1444029 res!975388) b!1444031))

(assert (= (and b!1444031 c!133837) b!1444033))

(assert (= (and b!1444031 (not c!133837)) b!1444025))

(assert (= (and b!1444031 res!975397) b!1444027))

(assert (= (and b!1444027 res!975396) b!1444036))

(assert (= (and b!1444036 res!975394) b!1444032))

(assert (= (and b!1444032 res!975398) b!1444020))

(declare-fun m!1333261 () Bool)

(assert (=> b!1444032 m!1333261))

(assert (=> b!1444032 m!1333261))

(declare-fun m!1333263 () Bool)

(assert (=> b!1444032 m!1333263))

(declare-fun m!1333265 () Bool)

(assert (=> b!1444036 m!1333265))

(declare-fun m!1333267 () Bool)

(assert (=> b!1444036 m!1333267))

(declare-fun m!1333269 () Bool)

(assert (=> b!1444025 m!1333269))

(declare-fun m!1333271 () Bool)

(assert (=> b!1444025 m!1333271))

(assert (=> b!1444024 m!1333261))

(assert (=> b!1444024 m!1333261))

(declare-fun m!1333273 () Bool)

(assert (=> b!1444024 m!1333273))

(declare-fun m!1333275 () Bool)

(assert (=> b!1444028 m!1333275))

(assert (=> b!1444028 m!1333275))

(declare-fun m!1333277 () Bool)

(assert (=> b!1444028 m!1333277))

(declare-fun m!1333279 () Bool)

(assert (=> b!1444033 m!1333279))

(assert (=> b!1444035 m!1333261))

(assert (=> b!1444035 m!1333261))

(declare-fun m!1333281 () Bool)

(assert (=> b!1444035 m!1333281))

(assert (=> b!1444035 m!1333281))

(assert (=> b!1444035 m!1333261))

(declare-fun m!1333283 () Bool)

(assert (=> b!1444035 m!1333283))

(declare-fun m!1333285 () Bool)

(assert (=> b!1444030 m!1333285))

(declare-fun m!1333287 () Bool)

(assert (=> b!1444034 m!1333287))

(declare-fun m!1333289 () Bool)

(assert (=> b!1444029 m!1333289))

(assert (=> b!1444029 m!1333289))

(declare-fun m!1333291 () Bool)

(assert (=> b!1444029 m!1333291))

(declare-fun m!1333293 () Bool)

(assert (=> b!1444029 m!1333293))

(declare-fun m!1333295 () Bool)

(assert (=> b!1444029 m!1333295))

(assert (=> b!1444026 m!1333293))

(declare-fun m!1333297 () Bool)

(assert (=> b!1444026 m!1333297))

(assert (=> b!1444023 m!1333261))

(assert (=> b!1444023 m!1333261))

(declare-fun m!1333299 () Bool)

(assert (=> b!1444023 m!1333299))

(declare-fun m!1333301 () Bool)

(assert (=> start!124818 m!1333301))

(declare-fun m!1333303 () Bool)

(assert (=> start!124818 m!1333303))

(declare-fun m!1333305 () Bool)

(assert (=> b!1444020 m!1333305))

(assert (=> b!1444020 m!1333261))

(check-sat (not b!1444035) (not b!1444029) (not start!124818) (not b!1444023) (not b!1444034) (not b!1444030) (not b!1444028) (not b!1444036) (not b!1444025) (not b!1444033) (not b!1444032) (not b!1444024))
(check-sat)
