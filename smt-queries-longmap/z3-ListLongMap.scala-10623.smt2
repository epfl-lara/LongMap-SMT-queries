; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124878 () Bool)

(assert start!124878)

(declare-fun b!1450283 () Bool)

(declare-fun res!981653 () Bool)

(declare-fun e!816673 () Bool)

(assert (=> b!1450283 (=> (not res!981653) (not e!816673))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98326 0))(
  ( (array!98327 (arr!47451 (Array (_ BitVec 32) (_ BitVec 64))) (size!48001 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98326)

(assert (=> b!1450283 (= res!981653 (and (= (size!48001 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48001 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48001 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450284 () Bool)

(declare-fun e!816671 () Bool)

(declare-fun e!816674 () Bool)

(assert (=> b!1450284 (= e!816671 e!816674)))

(declare-fun res!981640 () Bool)

(assert (=> b!1450284 (=> res!981640 e!816674)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1450284 (= res!981640 (or (and (= (select (arr!47451 a!2862) index!646) (select (store (arr!47451 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47451 a!2862) index!646) (select (arr!47451 a!2862) j!93))) (not (= (select (arr!47451 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450285 () Bool)

(declare-fun e!816666 () Bool)

(declare-fun e!816669 () Bool)

(assert (=> b!1450285 (= e!816666 e!816669)))

(declare-fun res!981654 () Bool)

(assert (=> b!1450285 (=> (not res!981654) (not e!816669))))

(declare-datatypes ((SeekEntryResult!11703 0))(
  ( (MissingZero!11703 (index!49204 (_ BitVec 32))) (Found!11703 (index!49205 (_ BitVec 32))) (Intermediate!11703 (undefined!12515 Bool) (index!49206 (_ BitVec 32)) (x!130864 (_ BitVec 32))) (Undefined!11703) (MissingVacant!11703 (index!49207 (_ BitVec 32))) )
))
(declare-fun lt!636237 () SeekEntryResult!11703)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450285 (= res!981654 (= lt!636237 (Intermediate!11703 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636231 () array!98326)

(declare-fun lt!636236 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98326 (_ BitVec 32)) SeekEntryResult!11703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450285 (= lt!636237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636236 mask!2687) lt!636236 lt!636231 mask!2687))))

(assert (=> b!1450285 (= lt!636236 (select (store (arr!47451 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450286 () Bool)

(declare-fun res!981645 () Bool)

(assert (=> b!1450286 (=> (not res!981645) (not e!816673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450286 (= res!981645 (validKeyInArray!0 (select (arr!47451 a!2862) i!1006)))))

(declare-fun b!1450287 () Bool)

(declare-fun e!816668 () Bool)

(assert (=> b!1450287 (= e!816669 (not e!816668))))

(declare-fun res!981639 () Bool)

(assert (=> b!1450287 (=> res!981639 e!816668)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1450287 (= res!981639 (or (and (= (select (arr!47451 a!2862) index!646) (select (store (arr!47451 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47451 a!2862) index!646) (select (arr!47451 a!2862) j!93))) (not (= (select (arr!47451 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47451 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450287 e!816671))

(declare-fun res!981655 () Bool)

(assert (=> b!1450287 (=> (not res!981655) (not e!816671))))

(declare-fun lt!636235 () SeekEntryResult!11703)

(declare-fun lt!636233 () SeekEntryResult!11703)

(assert (=> b!1450287 (= res!981655 (and (= lt!636233 lt!636235) (or (= (select (arr!47451 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47451 a!2862) intermediateBeforeIndex!19) (select (arr!47451 a!2862) j!93)))))))

(assert (=> b!1450287 (= lt!636235 (Found!11703 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98326 (_ BitVec 32)) SeekEntryResult!11703)

(assert (=> b!1450287 (= lt!636233 (seekEntryOrOpen!0 (select (arr!47451 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98326 (_ BitVec 32)) Bool)

(assert (=> b!1450287 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48902 0))(
  ( (Unit!48903) )
))
(declare-fun lt!636232 () Unit!48902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48902)

(assert (=> b!1450287 (= lt!636232 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450288 () Bool)

(declare-fun res!981644 () Bool)

(assert (=> b!1450288 (=> (not res!981644) (not e!816673))))

(declare-datatypes ((List!33952 0))(
  ( (Nil!33949) (Cons!33948 (h!35298 (_ BitVec 64)) (t!48646 List!33952)) )
))
(declare-fun arrayNoDuplicates!0 (array!98326 (_ BitVec 32) List!33952) Bool)

(assert (=> b!1450288 (= res!981644 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33949))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!816672 () Bool)

(declare-fun b!1450290 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98326 (_ BitVec 32)) SeekEntryResult!11703)

(assert (=> b!1450290 (= e!816672 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636236 lt!636231 mask!2687) (seekEntryOrOpen!0 lt!636236 lt!636231 mask!2687)))))

(declare-fun e!816667 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1450291 () Bool)

(assert (=> b!1450291 (= e!816667 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450292 () Bool)

(declare-fun res!981638 () Bool)

(assert (=> b!1450292 (=> res!981638 e!816668)))

(assert (=> b!1450292 (= res!981638 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47451 a!2862) j!93) a!2862 mask!2687) lt!636235)))))

(declare-fun b!1450293 () Bool)

(declare-fun res!981650 () Bool)

(assert (=> b!1450293 (=> (not res!981650) (not e!816673))))

(assert (=> b!1450293 (= res!981650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450294 () Bool)

(assert (=> b!1450294 (= e!816672 (= lt!636237 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636236 lt!636231 mask!2687)))))

(declare-fun b!1450295 () Bool)

(assert (=> b!1450295 (= e!816668 true)))

(assert (=> b!1450295 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636236 lt!636231 mask!2687) lt!636235)))

(declare-fun lt!636234 () Unit!48902)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48902)

(assert (=> b!1450295 (= lt!636234 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450296 () Bool)

(declare-fun res!981641 () Bool)

(assert (=> b!1450296 (=> (not res!981641) (not e!816673))))

(assert (=> b!1450296 (= res!981641 (validKeyInArray!0 (select (arr!47451 a!2862) j!93)))))

(declare-fun b!1450297 () Bool)

(assert (=> b!1450297 (= e!816674 e!816667)))

(declare-fun res!981643 () Bool)

(assert (=> b!1450297 (=> (not res!981643) (not e!816667))))

(assert (=> b!1450297 (= res!981643 (= lt!636233 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47451 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450298 () Bool)

(declare-fun res!981646 () Bool)

(assert (=> b!1450298 (=> (not res!981646) (not e!816673))))

(assert (=> b!1450298 (= res!981646 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48001 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48001 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48001 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!981648 () Bool)

(assert (=> start!124878 (=> (not res!981648) (not e!816673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124878 (= res!981648 (validMask!0 mask!2687))))

(assert (=> start!124878 e!816673))

(assert (=> start!124878 true))

(declare-fun array_inv!36479 (array!98326) Bool)

(assert (=> start!124878 (array_inv!36479 a!2862)))

(declare-fun b!1450289 () Bool)

(declare-fun res!981652 () Bool)

(assert (=> b!1450289 (=> (not res!981652) (not e!816669))))

(assert (=> b!1450289 (= res!981652 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450299 () Bool)

(declare-fun res!981649 () Bool)

(assert (=> b!1450299 (=> (not res!981649) (not e!816669))))

(assert (=> b!1450299 (= res!981649 e!816672)))

(declare-fun c!133833 () Bool)

(assert (=> b!1450299 (= c!133833 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450300 () Bool)

(declare-fun e!816670 () Bool)

(assert (=> b!1450300 (= e!816670 e!816666)))

(declare-fun res!981647 () Bool)

(assert (=> b!1450300 (=> (not res!981647) (not e!816666))))

(declare-fun lt!636230 () SeekEntryResult!11703)

(assert (=> b!1450300 (= res!981647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47451 a!2862) j!93) mask!2687) (select (arr!47451 a!2862) j!93) a!2862 mask!2687) lt!636230))))

(assert (=> b!1450300 (= lt!636230 (Intermediate!11703 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450301 () Bool)

(declare-fun res!981651 () Bool)

(assert (=> b!1450301 (=> (not res!981651) (not e!816666))))

(assert (=> b!1450301 (= res!981651 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47451 a!2862) j!93) a!2862 mask!2687) lt!636230))))

(declare-fun b!1450302 () Bool)

(assert (=> b!1450302 (= e!816673 e!816670)))

(declare-fun res!981642 () Bool)

(assert (=> b!1450302 (=> (not res!981642) (not e!816670))))

(assert (=> b!1450302 (= res!981642 (= (select (store (arr!47451 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450302 (= lt!636231 (array!98327 (store (arr!47451 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48001 a!2862)))))

(assert (= (and start!124878 res!981648) b!1450283))

(assert (= (and b!1450283 res!981653) b!1450286))

(assert (= (and b!1450286 res!981645) b!1450296))

(assert (= (and b!1450296 res!981641) b!1450293))

(assert (= (and b!1450293 res!981650) b!1450288))

(assert (= (and b!1450288 res!981644) b!1450298))

(assert (= (and b!1450298 res!981646) b!1450302))

(assert (= (and b!1450302 res!981642) b!1450300))

(assert (= (and b!1450300 res!981647) b!1450301))

(assert (= (and b!1450301 res!981651) b!1450285))

(assert (= (and b!1450285 res!981654) b!1450299))

(assert (= (and b!1450299 c!133833) b!1450294))

(assert (= (and b!1450299 (not c!133833)) b!1450290))

(assert (= (and b!1450299 res!981649) b!1450289))

(assert (= (and b!1450289 res!981652) b!1450287))

(assert (= (and b!1450287 res!981655) b!1450284))

(assert (= (and b!1450284 (not res!981640)) b!1450297))

(assert (= (and b!1450297 res!981643) b!1450291))

(assert (= (and b!1450287 (not res!981639)) b!1450292))

(assert (= (and b!1450292 (not res!981638)) b!1450295))

(declare-fun m!1338939 () Bool)

(assert (=> b!1450286 m!1338939))

(assert (=> b!1450286 m!1338939))

(declare-fun m!1338941 () Bool)

(assert (=> b!1450286 m!1338941))

(declare-fun m!1338943 () Bool)

(assert (=> b!1450285 m!1338943))

(assert (=> b!1450285 m!1338943))

(declare-fun m!1338945 () Bool)

(assert (=> b!1450285 m!1338945))

(declare-fun m!1338947 () Bool)

(assert (=> b!1450285 m!1338947))

(declare-fun m!1338949 () Bool)

(assert (=> b!1450285 m!1338949))

(declare-fun m!1338951 () Bool)

(assert (=> b!1450296 m!1338951))

(assert (=> b!1450296 m!1338951))

(declare-fun m!1338953 () Bool)

(assert (=> b!1450296 m!1338953))

(declare-fun m!1338955 () Bool)

(assert (=> b!1450294 m!1338955))

(assert (=> b!1450301 m!1338951))

(assert (=> b!1450301 m!1338951))

(declare-fun m!1338957 () Bool)

(assert (=> b!1450301 m!1338957))

(declare-fun m!1338959 () Bool)

(assert (=> b!1450293 m!1338959))

(assert (=> b!1450292 m!1338951))

(assert (=> b!1450292 m!1338951))

(declare-fun m!1338961 () Bool)

(assert (=> b!1450292 m!1338961))

(declare-fun m!1338963 () Bool)

(assert (=> b!1450288 m!1338963))

(assert (=> b!1450300 m!1338951))

(assert (=> b!1450300 m!1338951))

(declare-fun m!1338965 () Bool)

(assert (=> b!1450300 m!1338965))

(assert (=> b!1450300 m!1338965))

(assert (=> b!1450300 m!1338951))

(declare-fun m!1338967 () Bool)

(assert (=> b!1450300 m!1338967))

(declare-fun m!1338969 () Bool)

(assert (=> b!1450284 m!1338969))

(assert (=> b!1450284 m!1338947))

(declare-fun m!1338971 () Bool)

(assert (=> b!1450284 m!1338971))

(assert (=> b!1450284 m!1338951))

(declare-fun m!1338973 () Bool)

(assert (=> b!1450287 m!1338973))

(assert (=> b!1450287 m!1338947))

(declare-fun m!1338975 () Bool)

(assert (=> b!1450287 m!1338975))

(assert (=> b!1450287 m!1338971))

(assert (=> b!1450287 m!1338969))

(assert (=> b!1450287 m!1338951))

(declare-fun m!1338977 () Bool)

(assert (=> b!1450287 m!1338977))

(declare-fun m!1338979 () Bool)

(assert (=> b!1450287 m!1338979))

(assert (=> b!1450287 m!1338951))

(assert (=> b!1450297 m!1338951))

(assert (=> b!1450297 m!1338951))

(declare-fun m!1338981 () Bool)

(assert (=> b!1450297 m!1338981))

(declare-fun m!1338983 () Bool)

(assert (=> b!1450290 m!1338983))

(declare-fun m!1338985 () Bool)

(assert (=> b!1450290 m!1338985))

(assert (=> b!1450302 m!1338947))

(declare-fun m!1338987 () Bool)

(assert (=> b!1450302 m!1338987))

(assert (=> b!1450295 m!1338983))

(declare-fun m!1338989 () Bool)

(assert (=> b!1450295 m!1338989))

(declare-fun m!1338991 () Bool)

(assert (=> start!124878 m!1338991))

(declare-fun m!1338993 () Bool)

(assert (=> start!124878 m!1338993))

(check-sat (not b!1450290) (not b!1450287) (not b!1450294) (not b!1450297) (not b!1450292) (not b!1450286) (not b!1450301) (not b!1450300) (not b!1450285) (not b!1450295) (not b!1450288) (not b!1450293) (not b!1450296) (not start!124878))
(check-sat)
