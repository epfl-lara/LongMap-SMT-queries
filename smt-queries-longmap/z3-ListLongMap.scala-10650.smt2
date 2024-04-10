; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125040 () Bool)

(assert start!125040)

(declare-fun b!1454964 () Bool)

(declare-fun e!818770 () Bool)

(declare-fun e!818763 () Bool)

(assert (=> b!1454964 (= e!818770 e!818763)))

(declare-fun res!985727 () Bool)

(assert (=> b!1454964 (=> (not res!985727) (not e!818763))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98488 0))(
  ( (array!98489 (arr!47532 (Array (_ BitVec 32) (_ BitVec 64))) (size!48082 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98488)

(assert (=> b!1454964 (= res!985727 (= (select (store (arr!47532 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637782 () array!98488)

(assert (=> b!1454964 (= lt!637782 (array!98489 (store (arr!47532 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48082 a!2862)))))

(declare-fun b!1454965 () Bool)

(declare-fun res!985728 () Bool)

(declare-fun e!818766 () Bool)

(assert (=> b!1454965 (=> res!985728 e!818766)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637784 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11784 0))(
  ( (MissingZero!11784 (index!49528 (_ BitVec 32))) (Found!11784 (index!49529 (_ BitVec 32))) (Intermediate!11784 (undefined!12596 Bool) (index!49530 (_ BitVec 32)) (x!131161 (_ BitVec 32))) (Undefined!11784) (MissingVacant!11784 (index!49531 (_ BitVec 32))) )
))
(declare-fun lt!637785 () SeekEntryResult!11784)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98488 (_ BitVec 32)) SeekEntryResult!11784)

(assert (=> b!1454965 (= res!985728 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637784 (select (arr!47532 a!2862) j!93) a!2862 mask!2687) lt!637785)))))

(declare-fun b!1454967 () Bool)

(declare-fun e!818762 () Bool)

(assert (=> b!1454967 (= e!818763 e!818762)))

(declare-fun res!985722 () Bool)

(assert (=> b!1454967 (=> (not res!985722) (not e!818762))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454967 (= res!985722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47532 a!2862) j!93) mask!2687) (select (arr!47532 a!2862) j!93) a!2862 mask!2687) lt!637785))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454967 (= lt!637785 (Intermediate!11784 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!818767 () Bool)

(declare-fun b!1454968 () Bool)

(assert (=> b!1454968 (= e!818767 (and (or (= (select (arr!47532 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47532 a!2862) intermediateBeforeIndex!19) (select (arr!47532 a!2862) j!93))) (let ((bdg!53110 (select (store (arr!47532 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47532 a!2862) index!646) bdg!53110) (= (select (arr!47532 a!2862) index!646) (select (arr!47532 a!2862) j!93))) (= (select (arr!47532 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53110 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454969 () Bool)

(declare-fun res!985720 () Bool)

(assert (=> b!1454969 (=> (not res!985720) (not e!818767))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98488 (_ BitVec 32)) SeekEntryResult!11784)

(assert (=> b!1454969 (= res!985720 (= (seekEntryOrOpen!0 (select (arr!47532 a!2862) j!93) a!2862 mask!2687) (Found!11784 j!93)))))

(declare-fun b!1454970 () Bool)

(declare-fun res!985726 () Bool)

(assert (=> b!1454970 (=> (not res!985726) (not e!818770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98488 (_ BitVec 32)) Bool)

(assert (=> b!1454970 (= res!985726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454971 () Bool)

(declare-fun e!818765 () Bool)

(declare-fun e!818769 () Bool)

(assert (=> b!1454971 (= e!818765 (not e!818769))))

(declare-fun res!985718 () Bool)

(assert (=> b!1454971 (=> res!985718 e!818769)))

(assert (=> b!1454971 (= res!985718 (or (and (= (select (arr!47532 a!2862) index!646) (select (store (arr!47532 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47532 a!2862) index!646) (select (arr!47532 a!2862) j!93))) (= (select (arr!47532 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454971 e!818767))

(declare-fun res!985730 () Bool)

(assert (=> b!1454971 (=> (not res!985730) (not e!818767))))

(assert (=> b!1454971 (= res!985730 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49064 0))(
  ( (Unit!49065) )
))
(declare-fun lt!637780 () Unit!49064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49064)

(assert (=> b!1454971 (= lt!637780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!818768 () Bool)

(declare-fun lt!637779 () (_ BitVec 64))

(declare-fun b!1454972 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98488 (_ BitVec 32)) SeekEntryResult!11784)

(assert (=> b!1454972 (= e!818768 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637779 lt!637782 mask!2687) (seekEntryOrOpen!0 lt!637779 lt!637782 mask!2687)))))

(declare-fun b!1454973 () Bool)

(declare-fun res!985725 () Bool)

(assert (=> b!1454973 (=> (not res!985725) (not e!818770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454973 (= res!985725 (validKeyInArray!0 (select (arr!47532 a!2862) j!93)))))

(declare-fun b!1454974 () Bool)

(declare-fun res!985729 () Bool)

(assert (=> b!1454974 (=> (not res!985729) (not e!818765))))

(assert (=> b!1454974 (= res!985729 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454975 () Bool)

(assert (=> b!1454975 (= e!818762 e!818765)))

(declare-fun res!985719 () Bool)

(assert (=> b!1454975 (=> (not res!985719) (not e!818765))))

(declare-fun lt!637781 () SeekEntryResult!11784)

(assert (=> b!1454975 (= res!985719 (= lt!637781 (Intermediate!11784 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454975 (= lt!637781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637779 mask!2687) lt!637779 lt!637782 mask!2687))))

(assert (=> b!1454975 (= lt!637779 (select (store (arr!47532 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454976 () Bool)

(declare-fun e!818771 () Bool)

(assert (=> b!1454976 (= e!818771 (not (= lt!637781 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637784 lt!637779 lt!637782 mask!2687))))))

(declare-fun b!1454977 () Bool)

(assert (=> b!1454977 (= e!818766 true)))

(declare-fun lt!637783 () Bool)

(assert (=> b!1454977 (= lt!637783 e!818771)))

(declare-fun c!134136 () Bool)

(assert (=> b!1454977 (= c!134136 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454978 () Bool)

(declare-fun res!985732 () Bool)

(assert (=> b!1454978 (=> (not res!985732) (not e!818765))))

(assert (=> b!1454978 (= res!985732 e!818768)))

(declare-fun c!134135 () Bool)

(assert (=> b!1454978 (= c!134135 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454966 () Bool)

(assert (=> b!1454966 (= e!818768 (= lt!637781 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637779 lt!637782 mask!2687)))))

(declare-fun res!985723 () Bool)

(assert (=> start!125040 (=> (not res!985723) (not e!818770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125040 (= res!985723 (validMask!0 mask!2687))))

(assert (=> start!125040 e!818770))

(assert (=> start!125040 true))

(declare-fun array_inv!36560 (array!98488) Bool)

(assert (=> start!125040 (array_inv!36560 a!2862)))

(declare-fun b!1454979 () Bool)

(declare-fun res!985715 () Bool)

(assert (=> b!1454979 (=> (not res!985715) (not e!818762))))

(assert (=> b!1454979 (= res!985715 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47532 a!2862) j!93) a!2862 mask!2687) lt!637785))))

(declare-fun b!1454980 () Bool)

(declare-fun res!985731 () Bool)

(assert (=> b!1454980 (=> (not res!985731) (not e!818770))))

(assert (=> b!1454980 (= res!985731 (and (= (size!48082 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48082 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48082 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454981 () Bool)

(assert (=> b!1454981 (= e!818769 e!818766)))

(declare-fun res!985716 () Bool)

(assert (=> b!1454981 (=> res!985716 e!818766)))

(assert (=> b!1454981 (= res!985716 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637784 #b00000000000000000000000000000000) (bvsge lt!637784 (size!48082 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454981 (= lt!637784 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637778 () SeekEntryResult!11784)

(assert (=> b!1454981 (= lt!637778 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637779 lt!637782 mask!2687))))

(assert (=> b!1454981 (= lt!637778 (seekEntryOrOpen!0 lt!637779 lt!637782 mask!2687))))

(declare-fun b!1454982 () Bool)

(declare-fun res!985721 () Bool)

(assert (=> b!1454982 (=> (not res!985721) (not e!818770))))

(assert (=> b!1454982 (= res!985721 (validKeyInArray!0 (select (arr!47532 a!2862) i!1006)))))

(declare-fun b!1454983 () Bool)

(declare-fun res!985717 () Bool)

(assert (=> b!1454983 (=> (not res!985717) (not e!818770))))

(declare-datatypes ((List!34033 0))(
  ( (Nil!34030) (Cons!34029 (h!35379 (_ BitVec 64)) (t!48727 List!34033)) )
))
(declare-fun arrayNoDuplicates!0 (array!98488 (_ BitVec 32) List!34033) Bool)

(assert (=> b!1454983 (= res!985717 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34030))))

(declare-fun b!1454984 () Bool)

(assert (=> b!1454984 (= e!818771 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637784 intermediateAfterIndex!19 lt!637779 lt!637782 mask!2687) lt!637778)))))

(declare-fun b!1454985 () Bool)

(declare-fun res!985724 () Bool)

(assert (=> b!1454985 (=> (not res!985724) (not e!818770))))

(assert (=> b!1454985 (= res!985724 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48082 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48082 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48082 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125040 res!985723) b!1454980))

(assert (= (and b!1454980 res!985731) b!1454982))

(assert (= (and b!1454982 res!985721) b!1454973))

(assert (= (and b!1454973 res!985725) b!1454970))

(assert (= (and b!1454970 res!985726) b!1454983))

(assert (= (and b!1454983 res!985717) b!1454985))

(assert (= (and b!1454985 res!985724) b!1454964))

(assert (= (and b!1454964 res!985727) b!1454967))

(assert (= (and b!1454967 res!985722) b!1454979))

(assert (= (and b!1454979 res!985715) b!1454975))

(assert (= (and b!1454975 res!985719) b!1454978))

(assert (= (and b!1454978 c!134135) b!1454966))

(assert (= (and b!1454978 (not c!134135)) b!1454972))

(assert (= (and b!1454978 res!985732) b!1454974))

(assert (= (and b!1454974 res!985729) b!1454971))

(assert (= (and b!1454971 res!985730) b!1454969))

(assert (= (and b!1454969 res!985720) b!1454968))

(assert (= (and b!1454971 (not res!985718)) b!1454981))

(assert (= (and b!1454981 (not res!985716)) b!1454965))

(assert (= (and b!1454965 (not res!985728)) b!1454977))

(assert (= (and b!1454977 c!134136) b!1454976))

(assert (= (and b!1454977 (not c!134136)) b!1454984))

(declare-fun m!1343243 () Bool)

(assert (=> b!1454979 m!1343243))

(assert (=> b!1454979 m!1343243))

(declare-fun m!1343245 () Bool)

(assert (=> b!1454979 m!1343245))

(declare-fun m!1343247 () Bool)

(assert (=> b!1454975 m!1343247))

(assert (=> b!1454975 m!1343247))

(declare-fun m!1343249 () Bool)

(assert (=> b!1454975 m!1343249))

(declare-fun m!1343251 () Bool)

(assert (=> b!1454975 m!1343251))

(declare-fun m!1343253 () Bool)

(assert (=> b!1454975 m!1343253))

(declare-fun m!1343255 () Bool)

(assert (=> b!1454966 m!1343255))

(assert (=> b!1454968 m!1343251))

(declare-fun m!1343257 () Bool)

(assert (=> b!1454968 m!1343257))

(declare-fun m!1343259 () Bool)

(assert (=> b!1454968 m!1343259))

(declare-fun m!1343261 () Bool)

(assert (=> b!1454968 m!1343261))

(assert (=> b!1454968 m!1343243))

(declare-fun m!1343263 () Bool)

(assert (=> b!1454982 m!1343263))

(assert (=> b!1454982 m!1343263))

(declare-fun m!1343265 () Bool)

(assert (=> b!1454982 m!1343265))

(declare-fun m!1343267 () Bool)

(assert (=> b!1454971 m!1343267))

(assert (=> b!1454971 m!1343251))

(assert (=> b!1454971 m!1343259))

(assert (=> b!1454971 m!1343261))

(declare-fun m!1343269 () Bool)

(assert (=> b!1454971 m!1343269))

(assert (=> b!1454971 m!1343243))

(declare-fun m!1343271 () Bool)

(assert (=> b!1454983 m!1343271))

(assert (=> b!1454965 m!1343243))

(assert (=> b!1454965 m!1343243))

(declare-fun m!1343273 () Bool)

(assert (=> b!1454965 m!1343273))

(assert (=> b!1454969 m!1343243))

(assert (=> b!1454969 m!1343243))

(declare-fun m!1343275 () Bool)

(assert (=> b!1454969 m!1343275))

(declare-fun m!1343277 () Bool)

(assert (=> b!1454970 m!1343277))

(declare-fun m!1343279 () Bool)

(assert (=> b!1454981 m!1343279))

(declare-fun m!1343281 () Bool)

(assert (=> b!1454981 m!1343281))

(declare-fun m!1343283 () Bool)

(assert (=> b!1454981 m!1343283))

(declare-fun m!1343285 () Bool)

(assert (=> b!1454976 m!1343285))

(assert (=> b!1454972 m!1343281))

(assert (=> b!1454972 m!1343283))

(assert (=> b!1454964 m!1343251))

(declare-fun m!1343287 () Bool)

(assert (=> b!1454964 m!1343287))

(assert (=> b!1454967 m!1343243))

(assert (=> b!1454967 m!1343243))

(declare-fun m!1343289 () Bool)

(assert (=> b!1454967 m!1343289))

(assert (=> b!1454967 m!1343289))

(assert (=> b!1454967 m!1343243))

(declare-fun m!1343291 () Bool)

(assert (=> b!1454967 m!1343291))

(declare-fun m!1343293 () Bool)

(assert (=> b!1454984 m!1343293))

(assert (=> b!1454973 m!1343243))

(assert (=> b!1454973 m!1343243))

(declare-fun m!1343295 () Bool)

(assert (=> b!1454973 m!1343295))

(declare-fun m!1343297 () Bool)

(assert (=> start!125040 m!1343297))

(declare-fun m!1343299 () Bool)

(assert (=> start!125040 m!1343299))

(check-sat (not b!1454984) (not b!1454969) (not b!1454970) (not start!125040) (not b!1454976) (not b!1454983) (not b!1454975) (not b!1454979) (not b!1454965) (not b!1454981) (not b!1454967) (not b!1454982) (not b!1454973) (not b!1454971) (not b!1454966) (not b!1454972))
(check-sat)
