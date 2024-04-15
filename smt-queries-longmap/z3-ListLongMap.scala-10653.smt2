; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125026 () Bool)

(assert start!125026)

(declare-fun b!1455297 () Bool)

(declare-fun res!986082 () Bool)

(declare-fun e!818891 () Bool)

(assert (=> b!1455297 (=> (not res!986082) (not e!818891))))

(declare-datatypes ((array!98452 0))(
  ( (array!98453 (arr!47515 (Array (_ BitVec 32) (_ BitVec 64))) (size!48067 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98452)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98452 (_ BitVec 32)) Bool)

(assert (=> b!1455297 (= res!986082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455298 () Bool)

(declare-fun e!818889 () Bool)

(declare-fun e!818888 () Bool)

(assert (=> b!1455298 (= e!818889 (not e!818888))))

(declare-fun res!986070 () Bool)

(assert (=> b!1455298 (=> res!986070 e!818888)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455298 (= res!986070 (or (and (= (select (arr!47515 a!2862) index!646) (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47515 a!2862) index!646) (select (arr!47515 a!2862) j!93))) (= (select (arr!47515 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818890 () Bool)

(assert (=> b!1455298 e!818890))

(declare-fun res!986074 () Bool)

(assert (=> b!1455298 (=> (not res!986074) (not e!818890))))

(assert (=> b!1455298 (= res!986074 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48921 0))(
  ( (Unit!48922) )
))
(declare-fun lt!637743 () Unit!48921)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48921)

(assert (=> b!1455298 (= lt!637743 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455299 () Bool)

(declare-fun res!986078 () Bool)

(assert (=> b!1455299 (=> (not res!986078) (not e!818889))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455299 (= res!986078 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455300 () Bool)

(declare-fun res!986080 () Bool)

(assert (=> b!1455300 (=> (not res!986080) (not e!818889))))

(declare-fun e!818887 () Bool)

(assert (=> b!1455300 (= res!986080 e!818887)))

(declare-fun c!134127 () Bool)

(assert (=> b!1455300 (= c!134127 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455301 () Bool)

(declare-fun res!986073 () Bool)

(assert (=> b!1455301 (=> (not res!986073) (not e!818891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455301 (= res!986073 (validKeyInArray!0 (select (arr!47515 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1455302 () Bool)

(assert (=> b!1455302 (= e!818890 (and (or (= (select (arr!47515 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47515 a!2862) intermediateBeforeIndex!19) (select (arr!47515 a!2862) j!93))) (let ((bdg!53161 (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47515 a!2862) index!646) bdg!53161) (= (select (arr!47515 a!2862) index!646) (select (arr!47515 a!2862) j!93))) (= (select (arr!47515 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53161 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455303 () Bool)

(declare-fun e!818886 () Bool)

(assert (=> b!1455303 (= e!818891 e!818886)))

(declare-fun res!986081 () Bool)

(assert (=> b!1455303 (=> (not res!986081) (not e!818886))))

(assert (=> b!1455303 (= res!986081 (= (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637736 () array!98452)

(assert (=> b!1455303 (= lt!637736 (array!98453 (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48067 a!2862)))))

(declare-fun b!1455304 () Bool)

(declare-fun e!818895 () Bool)

(assert (=> b!1455304 (= e!818886 e!818895)))

(declare-fun res!986079 () Bool)

(assert (=> b!1455304 (=> (not res!986079) (not e!818895))))

(declare-datatypes ((SeekEntryResult!11792 0))(
  ( (MissingZero!11792 (index!49560 (_ BitVec 32))) (Found!11792 (index!49561 (_ BitVec 32))) (Intermediate!11792 (undefined!12604 Bool) (index!49562 (_ BitVec 32)) (x!131188 (_ BitVec 32))) (Undefined!11792) (MissingVacant!11792 (index!49563 (_ BitVec 32))) )
))
(declare-fun lt!637740 () SeekEntryResult!11792)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98452 (_ BitVec 32)) SeekEntryResult!11792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455304 (= res!986079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47515 a!2862) j!93) mask!2687) (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!637740))))

(assert (=> b!1455304 (= lt!637740 (Intermediate!11792 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455305 () Bool)

(declare-fun res!986083 () Bool)

(assert (=> b!1455305 (=> (not res!986083) (not e!818891))))

(assert (=> b!1455305 (= res!986083 (validKeyInArray!0 (select (arr!47515 a!2862) i!1006)))))

(declare-fun b!1455306 () Bool)

(declare-fun res!986086 () Bool)

(assert (=> b!1455306 (=> (not res!986086) (not e!818891))))

(assert (=> b!1455306 (= res!986086 (and (= (size!48067 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48067 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48067 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!818894 () Bool)

(declare-fun lt!637738 () (_ BitVec 64))

(declare-fun lt!637737 () SeekEntryResult!11792)

(declare-fun lt!637739 () (_ BitVec 32))

(declare-fun b!1455308 () Bool)

(assert (=> b!1455308 (= e!818894 (not (= lt!637737 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637739 lt!637738 lt!637736 mask!2687))))))

(declare-fun b!1455309 () Bool)

(declare-fun res!986076 () Bool)

(assert (=> b!1455309 (=> (not res!986076) (not e!818891))))

(assert (=> b!1455309 (= res!986076 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48067 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48067 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48067 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455310 () Bool)

(declare-fun res!986071 () Bool)

(declare-fun e!818892 () Bool)

(assert (=> b!1455310 (=> res!986071 e!818892)))

(assert (=> b!1455310 (= res!986071 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637739 (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!637740)))))

(declare-fun b!1455311 () Bool)

(declare-fun res!986069 () Bool)

(assert (=> b!1455311 (=> (not res!986069) (not e!818895))))

(assert (=> b!1455311 (= res!986069 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!637740))))

(declare-fun b!1455312 () Bool)

(assert (=> b!1455312 (= e!818887 (= lt!637737 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637738 lt!637736 mask!2687)))))

(declare-fun b!1455313 () Bool)

(assert (=> b!1455313 (= e!818892 true)))

(declare-fun lt!637742 () Bool)

(assert (=> b!1455313 (= lt!637742 e!818894)))

(declare-fun c!134128 () Bool)

(assert (=> b!1455313 (= c!134128 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455314 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98452 (_ BitVec 32)) SeekEntryResult!11792)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98452 (_ BitVec 32)) SeekEntryResult!11792)

(assert (=> b!1455314 (= e!818887 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637738 lt!637736 mask!2687) (seekEntryOrOpen!0 lt!637738 lt!637736 mask!2687)))))

(declare-fun b!1455315 () Bool)

(declare-fun lt!637741 () SeekEntryResult!11792)

(assert (=> b!1455315 (= e!818894 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637739 intermediateAfterIndex!19 lt!637738 lt!637736 mask!2687) lt!637741)))))

(declare-fun b!1455316 () Bool)

(declare-fun res!986085 () Bool)

(assert (=> b!1455316 (=> (not res!986085) (not e!818890))))

(assert (=> b!1455316 (= res!986085 (= (seekEntryOrOpen!0 (select (arr!47515 a!2862) j!93) a!2862 mask!2687) (Found!11792 j!93)))))

(declare-fun b!1455317 () Bool)

(assert (=> b!1455317 (= e!818895 e!818889)))

(declare-fun res!986072 () Bool)

(assert (=> b!1455317 (=> (not res!986072) (not e!818889))))

(assert (=> b!1455317 (= res!986072 (= lt!637737 (Intermediate!11792 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1455317 (= lt!637737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637738 mask!2687) lt!637738 lt!637736 mask!2687))))

(assert (=> b!1455317 (= lt!637738 (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455318 () Bool)

(declare-fun res!986084 () Bool)

(assert (=> b!1455318 (=> (not res!986084) (not e!818891))))

(declare-datatypes ((List!34094 0))(
  ( (Nil!34091) (Cons!34090 (h!35440 (_ BitVec 64)) (t!48780 List!34094)) )
))
(declare-fun arrayNoDuplicates!0 (array!98452 (_ BitVec 32) List!34094) Bool)

(assert (=> b!1455318 (= res!986084 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34091))))

(declare-fun b!1455307 () Bool)

(assert (=> b!1455307 (= e!818888 e!818892)))

(declare-fun res!986075 () Bool)

(assert (=> b!1455307 (=> res!986075 e!818892)))

(assert (=> b!1455307 (= res!986075 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637739 #b00000000000000000000000000000000) (bvsge lt!637739 (size!48067 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455307 (= lt!637739 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455307 (= lt!637741 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637738 lt!637736 mask!2687))))

(assert (=> b!1455307 (= lt!637741 (seekEntryOrOpen!0 lt!637738 lt!637736 mask!2687))))

(declare-fun res!986077 () Bool)

(assert (=> start!125026 (=> (not res!986077) (not e!818891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125026 (= res!986077 (validMask!0 mask!2687))))

(assert (=> start!125026 e!818891))

(assert (=> start!125026 true))

(declare-fun array_inv!36748 (array!98452) Bool)

(assert (=> start!125026 (array_inv!36748 a!2862)))

(assert (= (and start!125026 res!986077) b!1455306))

(assert (= (and b!1455306 res!986086) b!1455305))

(assert (= (and b!1455305 res!986083) b!1455301))

(assert (= (and b!1455301 res!986073) b!1455297))

(assert (= (and b!1455297 res!986082) b!1455318))

(assert (= (and b!1455318 res!986084) b!1455309))

(assert (= (and b!1455309 res!986076) b!1455303))

(assert (= (and b!1455303 res!986081) b!1455304))

(assert (= (and b!1455304 res!986079) b!1455311))

(assert (= (and b!1455311 res!986069) b!1455317))

(assert (= (and b!1455317 res!986072) b!1455300))

(assert (= (and b!1455300 c!134127) b!1455312))

(assert (= (and b!1455300 (not c!134127)) b!1455314))

(assert (= (and b!1455300 res!986080) b!1455299))

(assert (= (and b!1455299 res!986078) b!1455298))

(assert (= (and b!1455298 res!986074) b!1455316))

(assert (= (and b!1455316 res!986085) b!1455302))

(assert (= (and b!1455298 (not res!986070)) b!1455307))

(assert (= (and b!1455307 (not res!986075)) b!1455310))

(assert (= (and b!1455310 (not res!986071)) b!1455313))

(assert (= (and b!1455313 c!134128) b!1455308))

(assert (= (and b!1455313 (not c!134128)) b!1455315))

(declare-fun m!1343031 () Bool)

(assert (=> b!1455298 m!1343031))

(declare-fun m!1343033 () Bool)

(assert (=> b!1455298 m!1343033))

(declare-fun m!1343035 () Bool)

(assert (=> b!1455298 m!1343035))

(declare-fun m!1343037 () Bool)

(assert (=> b!1455298 m!1343037))

(declare-fun m!1343039 () Bool)

(assert (=> b!1455298 m!1343039))

(declare-fun m!1343041 () Bool)

(assert (=> b!1455298 m!1343041))

(assert (=> b!1455301 m!1343041))

(assert (=> b!1455301 m!1343041))

(declare-fun m!1343043 () Bool)

(assert (=> b!1455301 m!1343043))

(assert (=> b!1455311 m!1343041))

(assert (=> b!1455311 m!1343041))

(declare-fun m!1343045 () Bool)

(assert (=> b!1455311 m!1343045))

(declare-fun m!1343047 () Bool)

(assert (=> b!1455305 m!1343047))

(assert (=> b!1455305 m!1343047))

(declare-fun m!1343049 () Bool)

(assert (=> b!1455305 m!1343049))

(assert (=> b!1455303 m!1343033))

(declare-fun m!1343051 () Bool)

(assert (=> b!1455303 m!1343051))

(declare-fun m!1343053 () Bool)

(assert (=> b!1455312 m!1343053))

(assert (=> b!1455304 m!1343041))

(assert (=> b!1455304 m!1343041))

(declare-fun m!1343055 () Bool)

(assert (=> b!1455304 m!1343055))

(assert (=> b!1455304 m!1343055))

(assert (=> b!1455304 m!1343041))

(declare-fun m!1343057 () Bool)

(assert (=> b!1455304 m!1343057))

(declare-fun m!1343059 () Bool)

(assert (=> b!1455315 m!1343059))

(declare-fun m!1343061 () Bool)

(assert (=> b!1455314 m!1343061))

(declare-fun m!1343063 () Bool)

(assert (=> b!1455314 m!1343063))

(declare-fun m!1343065 () Bool)

(assert (=> start!125026 m!1343065))

(declare-fun m!1343067 () Bool)

(assert (=> start!125026 m!1343067))

(declare-fun m!1343069 () Bool)

(assert (=> b!1455307 m!1343069))

(assert (=> b!1455307 m!1343061))

(assert (=> b!1455307 m!1343063))

(declare-fun m!1343071 () Bool)

(assert (=> b!1455317 m!1343071))

(assert (=> b!1455317 m!1343071))

(declare-fun m!1343073 () Bool)

(assert (=> b!1455317 m!1343073))

(assert (=> b!1455317 m!1343033))

(declare-fun m!1343075 () Bool)

(assert (=> b!1455317 m!1343075))

(declare-fun m!1343077 () Bool)

(assert (=> b!1455318 m!1343077))

(assert (=> b!1455316 m!1343041))

(assert (=> b!1455316 m!1343041))

(declare-fun m!1343079 () Bool)

(assert (=> b!1455316 m!1343079))

(assert (=> b!1455302 m!1343033))

(declare-fun m!1343081 () Bool)

(assert (=> b!1455302 m!1343081))

(assert (=> b!1455302 m!1343035))

(assert (=> b!1455302 m!1343037))

(assert (=> b!1455302 m!1343041))

(declare-fun m!1343083 () Bool)

(assert (=> b!1455297 m!1343083))

(declare-fun m!1343085 () Bool)

(assert (=> b!1455308 m!1343085))

(assert (=> b!1455310 m!1343041))

(assert (=> b!1455310 m!1343041))

(declare-fun m!1343087 () Bool)

(assert (=> b!1455310 m!1343087))

(check-sat (not b!1455316) (not b!1455310) (not b!1455301) (not b!1455305) (not b!1455311) (not start!125026) (not b!1455312) (not b!1455307) (not b!1455317) (not b!1455315) (not b!1455314) (not b!1455297) (not b!1455304) (not b!1455318) (not b!1455308) (not b!1455298))
(check-sat)
