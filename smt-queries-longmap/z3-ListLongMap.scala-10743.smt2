; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125598 () Bool)

(assert start!125598)

(declare-fun b!1469805 () Bool)

(declare-fun res!998249 () Bool)

(declare-fun e!825116 () Bool)

(assert (=> b!1469805 (=> (not res!998249) (not e!825116))))

(declare-datatypes ((array!99046 0))(
  ( (array!99047 (arr!47811 (Array (_ BitVec 32) (_ BitVec 64))) (size!48361 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99046)

(declare-datatypes ((List!34312 0))(
  ( (Nil!34309) (Cons!34308 (h!35658 (_ BitVec 64)) (t!49006 List!34312)) )
))
(declare-fun arrayNoDuplicates!0 (array!99046 (_ BitVec 32) List!34312) Bool)

(assert (=> b!1469805 (= res!998249 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34309))))

(declare-fun e!825114 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!642677 () array!99046)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!642681 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1469806 () Bool)

(declare-datatypes ((SeekEntryResult!12051 0))(
  ( (MissingZero!12051 (index!50596 (_ BitVec 32))) (Found!12051 (index!50597 (_ BitVec 32))) (Intermediate!12051 (undefined!12863 Bool) (index!50598 (_ BitVec 32)) (x!132172 (_ BitVec 32))) (Undefined!12051) (MissingVacant!12051 (index!50599 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99046 (_ BitVec 32)) SeekEntryResult!12051)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99046 (_ BitVec 32)) SeekEntryResult!12051)

(assert (=> b!1469806 (= e!825114 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642681 lt!642677 mask!2687) (seekEntryOrOpen!0 lt!642681 lt!642677 mask!2687))))))

(declare-fun b!1469807 () Bool)

(declare-fun res!998246 () Bool)

(assert (=> b!1469807 (=> (not res!998246) (not e!825116))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469807 (= res!998246 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48361 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48361 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48361 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469808 () Bool)

(declare-fun res!998253 () Bool)

(declare-fun e!825119 () Bool)

(assert (=> b!1469808 (=> (not res!998253) (not e!825119))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!642680 () SeekEntryResult!12051)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99046 (_ BitVec 32)) SeekEntryResult!12051)

(assert (=> b!1469808 (= res!998253 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47811 a!2862) j!93) a!2862 mask!2687) lt!642680))))

(declare-fun b!1469809 () Bool)

(declare-fun res!998245 () Bool)

(assert (=> b!1469809 (=> (not res!998245) (not e!825116))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469809 (= res!998245 (validKeyInArray!0 (select (arr!47811 a!2862) i!1006)))))

(declare-fun b!1469810 () Bool)

(declare-fun res!998250 () Bool)

(assert (=> b!1469810 (=> (not res!998250) (not e!825116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99046 (_ BitVec 32)) Bool)

(assert (=> b!1469810 (= res!998250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!998252 () Bool)

(assert (=> start!125598 (=> (not res!998252) (not e!825116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125598 (= res!998252 (validMask!0 mask!2687))))

(assert (=> start!125598 e!825116))

(assert (=> start!125598 true))

(declare-fun array_inv!36839 (array!99046) Bool)

(assert (=> start!125598 (array_inv!36839 a!2862)))

(declare-fun b!1469811 () Bool)

(declare-fun res!998247 () Bool)

(assert (=> b!1469811 (=> (not res!998247) (not e!825116))))

(assert (=> b!1469811 (= res!998247 (validKeyInArray!0 (select (arr!47811 a!2862) j!93)))))

(declare-fun b!1469812 () Bool)

(declare-fun e!825118 () Bool)

(assert (=> b!1469812 (= e!825116 e!825118)))

(declare-fun res!998251 () Bool)

(assert (=> b!1469812 (=> (not res!998251) (not e!825118))))

(assert (=> b!1469812 (= res!998251 (= (select (store (arr!47811 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469812 (= lt!642677 (array!99047 (store (arr!47811 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48361 a!2862)))))

(declare-fun b!1469813 () Bool)

(declare-fun e!825115 () Bool)

(assert (=> b!1469813 (= e!825119 e!825115)))

(declare-fun res!998254 () Bool)

(assert (=> b!1469813 (=> (not res!998254) (not e!825115))))

(declare-fun lt!642678 () SeekEntryResult!12051)

(assert (=> b!1469813 (= res!998254 (= lt!642678 (Intermediate!12051 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469813 (= lt!642678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642681 mask!2687) lt!642681 lt!642677 mask!2687))))

(assert (=> b!1469813 (= lt!642681 (select (store (arr!47811 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469814 () Bool)

(assert (=> b!1469814 (= e!825118 e!825119)))

(declare-fun res!998244 () Bool)

(assert (=> b!1469814 (=> (not res!998244) (not e!825119))))

(assert (=> b!1469814 (= res!998244 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47811 a!2862) j!93) mask!2687) (select (arr!47811 a!2862) j!93) a!2862 mask!2687) lt!642680))))

(assert (=> b!1469814 (= lt!642680 (Intermediate!12051 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469815 () Bool)

(assert (=> b!1469815 (= e!825115 false)))

(declare-fun lt!642679 () Bool)

(assert (=> b!1469815 (= lt!642679 e!825114)))

(declare-fun c!135291 () Bool)

(assert (=> b!1469815 (= c!135291 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469816 () Bool)

(declare-fun res!998248 () Bool)

(assert (=> b!1469816 (=> (not res!998248) (not e!825116))))

(assert (=> b!1469816 (= res!998248 (and (= (size!48361 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48361 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48361 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469817 () Bool)

(assert (=> b!1469817 (= e!825114 (not (= lt!642678 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642681 lt!642677 mask!2687))))))

(assert (= (and start!125598 res!998252) b!1469816))

(assert (= (and b!1469816 res!998248) b!1469809))

(assert (= (and b!1469809 res!998245) b!1469811))

(assert (= (and b!1469811 res!998247) b!1469810))

(assert (= (and b!1469810 res!998250) b!1469805))

(assert (= (and b!1469805 res!998249) b!1469807))

(assert (= (and b!1469807 res!998246) b!1469812))

(assert (= (and b!1469812 res!998251) b!1469814))

(assert (= (and b!1469814 res!998244) b!1469808))

(assert (= (and b!1469808 res!998253) b!1469813))

(assert (= (and b!1469813 res!998254) b!1469815))

(assert (= (and b!1469815 c!135291) b!1469817))

(assert (= (and b!1469815 (not c!135291)) b!1469806))

(declare-fun m!1356957 () Bool)

(assert (=> b!1469817 m!1356957))

(declare-fun m!1356959 () Bool)

(assert (=> b!1469809 m!1356959))

(assert (=> b!1469809 m!1356959))

(declare-fun m!1356961 () Bool)

(assert (=> b!1469809 m!1356961))

(declare-fun m!1356963 () Bool)

(assert (=> start!125598 m!1356963))

(declare-fun m!1356965 () Bool)

(assert (=> start!125598 m!1356965))

(declare-fun m!1356967 () Bool)

(assert (=> b!1469808 m!1356967))

(assert (=> b!1469808 m!1356967))

(declare-fun m!1356969 () Bool)

(assert (=> b!1469808 m!1356969))

(declare-fun m!1356971 () Bool)

(assert (=> b!1469810 m!1356971))

(assert (=> b!1469811 m!1356967))

(assert (=> b!1469811 m!1356967))

(declare-fun m!1356973 () Bool)

(assert (=> b!1469811 m!1356973))

(declare-fun m!1356975 () Bool)

(assert (=> b!1469812 m!1356975))

(declare-fun m!1356977 () Bool)

(assert (=> b!1469812 m!1356977))

(assert (=> b!1469814 m!1356967))

(assert (=> b!1469814 m!1356967))

(declare-fun m!1356979 () Bool)

(assert (=> b!1469814 m!1356979))

(assert (=> b!1469814 m!1356979))

(assert (=> b!1469814 m!1356967))

(declare-fun m!1356981 () Bool)

(assert (=> b!1469814 m!1356981))

(declare-fun m!1356983 () Bool)

(assert (=> b!1469806 m!1356983))

(declare-fun m!1356985 () Bool)

(assert (=> b!1469806 m!1356985))

(declare-fun m!1356987 () Bool)

(assert (=> b!1469813 m!1356987))

(assert (=> b!1469813 m!1356987))

(declare-fun m!1356989 () Bool)

(assert (=> b!1469813 m!1356989))

(assert (=> b!1469813 m!1356975))

(declare-fun m!1356991 () Bool)

(assert (=> b!1469813 m!1356991))

(declare-fun m!1356993 () Bool)

(assert (=> b!1469805 m!1356993))

(check-sat (not b!1469805) (not b!1469806) (not b!1469811) (not start!125598) (not b!1469810) (not b!1469809) (not b!1469808) (not b!1469813) (not b!1469814) (not b!1469817))
(check-sat)
