; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126516 () Bool)

(assert start!126516)

(declare-fun res!1005938 () Bool)

(declare-fun e!830908 () Bool)

(assert (=> start!126516 (=> (not res!1005938) (not e!830908))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126516 (= res!1005938 (validMask!0 mask!2687))))

(assert (=> start!126516 e!830908))

(assert (=> start!126516 true))

(declare-datatypes ((array!99460 0))(
  ( (array!99461 (arr!48004 (Array (_ BitVec 32) (_ BitVec 64))) (size!48555 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99460)

(declare-fun array_inv!37285 (array!99460) Bool)

(assert (=> start!126516 (array_inv!37285 a!2862)))

(declare-fun b!1481127 () Bool)

(declare-fun e!830904 () Bool)

(assert (=> b!1481127 (= e!830908 e!830904)))

(declare-fun res!1005945 () Bool)

(assert (=> b!1481127 (=> (not res!1005945) (not e!830904))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481127 (= res!1005945 (= (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646657 () array!99460)

(assert (=> b!1481127 (= lt!646657 (array!99461 (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48555 a!2862)))))

(declare-fun lt!646658 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1481128 () Bool)

(declare-fun e!830909 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12141 0))(
  ( (MissingZero!12141 (index!50956 (_ BitVec 32))) (Found!12141 (index!50957 (_ BitVec 32))) (Intermediate!12141 (undefined!12953 Bool) (index!50958 (_ BitVec 32)) (x!132725 (_ BitVec 32))) (Undefined!12141) (MissingVacant!12141 (index!50959 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12141)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12141)

(assert (=> b!1481128 (= e!830909 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646658 lt!646657 mask!2687) (seekEntryOrOpen!0 lt!646658 lt!646657 mask!2687)))))

(declare-fun b!1481129 () Bool)

(declare-fun e!830905 () Bool)

(declare-fun e!830907 () Bool)

(assert (=> b!1481129 (= e!830905 e!830907)))

(declare-fun res!1005937 () Bool)

(assert (=> b!1481129 (=> (not res!1005937) (not e!830907))))

(declare-fun lt!646655 () SeekEntryResult!12141)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481129 (= res!1005937 (= lt!646655 (Intermediate!12141 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481129 (= lt!646655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646658 mask!2687) lt!646658 lt!646657 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1481129 (= lt!646658 (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481130 () Bool)

(declare-fun res!1005953 () Bool)

(assert (=> b!1481130 (=> (not res!1005953) (not e!830908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481130 (= res!1005953 (validKeyInArray!0 (select (arr!48004 a!2862) j!93)))))

(declare-fun b!1481131 () Bool)

(declare-fun res!1005943 () Bool)

(assert (=> b!1481131 (=> (not res!1005943) (not e!830908))))

(assert (=> b!1481131 (= res!1005943 (and (= (size!48555 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48555 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48555 a!2862)) (not (= i!1006 j!93))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1481132 () Bool)

(declare-fun e!830906 () Bool)

(assert (=> b!1481132 (= e!830906 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1481133 () Bool)

(declare-fun res!1005941 () Bool)

(assert (=> b!1481133 (=> (not res!1005941) (not e!830908))))

(declare-datatypes ((List!34492 0))(
  ( (Nil!34489) (Cons!34488 (h!35870 (_ BitVec 64)) (t!49178 List!34492)) )
))
(declare-fun arrayNoDuplicates!0 (array!99460 (_ BitVec 32) List!34492) Bool)

(assert (=> b!1481133 (= res!1005941 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34489))))

(declare-fun b!1481134 () Bool)

(declare-fun res!1005942 () Bool)

(assert (=> b!1481134 (=> (not res!1005942) (not e!830907))))

(assert (=> b!1481134 (= res!1005942 e!830909)))

(declare-fun c!137125 () Bool)

(assert (=> b!1481134 (= c!137125 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481135 () Bool)

(declare-fun e!830910 () Bool)

(assert (=> b!1481135 (= e!830907 (not e!830910))))

(declare-fun res!1005939 () Bool)

(assert (=> b!1481135 (=> res!1005939 e!830910)))

(assert (=> b!1481135 (= res!1005939 (or (and (= (select (arr!48004 a!2862) index!646) (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48004 a!2862) index!646) (select (arr!48004 a!2862) j!93))) (not (= (select (arr!48004 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48004 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830902 () Bool)

(assert (=> b!1481135 e!830902))

(declare-fun res!1005948 () Bool)

(assert (=> b!1481135 (=> (not res!1005948) (not e!830902))))

(declare-fun lt!646653 () SeekEntryResult!12141)

(declare-fun lt!646656 () SeekEntryResult!12141)

(assert (=> b!1481135 (= res!1005948 (and (= lt!646656 lt!646653) (or (= (select (arr!48004 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48004 a!2862) intermediateBeforeIndex!19) (select (arr!48004 a!2862) j!93)))))))

(assert (=> b!1481135 (= lt!646653 (Found!12141 j!93))))

(assert (=> b!1481135 (= lt!646656 (seekEntryOrOpen!0 (select (arr!48004 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99460 (_ BitVec 32)) Bool)

(assert (=> b!1481135 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49655 0))(
  ( (Unit!49656) )
))
(declare-fun lt!646654 () Unit!49655)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49655)

(assert (=> b!1481135 (= lt!646654 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481136 () Bool)

(assert (=> b!1481136 (= e!830904 e!830905)))

(declare-fun res!1005952 () Bool)

(assert (=> b!1481136 (=> (not res!1005952) (not e!830905))))

(declare-fun lt!646660 () SeekEntryResult!12141)

(assert (=> b!1481136 (= res!1005952 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48004 a!2862) j!93) mask!2687) (select (arr!48004 a!2862) j!93) a!2862 mask!2687) lt!646660))))

(assert (=> b!1481136 (= lt!646660 (Intermediate!12141 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481137 () Bool)

(declare-fun res!1005950 () Bool)

(assert (=> b!1481137 (=> (not res!1005950) (not e!830908))))

(assert (=> b!1481137 (= res!1005950 (validKeyInArray!0 (select (arr!48004 a!2862) i!1006)))))

(declare-fun b!1481138 () Bool)

(declare-fun e!830903 () Bool)

(assert (=> b!1481138 (= e!830902 e!830903)))

(declare-fun res!1005949 () Bool)

(assert (=> b!1481138 (=> res!1005949 e!830903)))

(assert (=> b!1481138 (= res!1005949 (or (and (= (select (arr!48004 a!2862) index!646) (select (store (arr!48004 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48004 a!2862) index!646) (select (arr!48004 a!2862) j!93))) (not (= (select (arr!48004 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1481139 () Bool)

(declare-fun res!1005936 () Bool)

(assert (=> b!1481139 (=> (not res!1005936) (not e!830908))))

(assert (=> b!1481139 (= res!1005936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481140 () Bool)

(declare-fun res!1005946 () Bool)

(assert (=> b!1481140 (=> (not res!1005946) (not e!830908))))

(assert (=> b!1481140 (= res!1005946 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48555 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48555 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48555 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481141 () Bool)

(declare-fun res!1005944 () Bool)

(assert (=> b!1481141 (=> (not res!1005944) (not e!830907))))

(assert (=> b!1481141 (= res!1005944 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481142 () Bool)

(assert (=> b!1481142 (= e!830909 (= lt!646655 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646658 lt!646657 mask!2687)))))

(declare-fun b!1481143 () Bool)

(assert (=> b!1481143 (= e!830903 e!830906)))

(declare-fun res!1005947 () Bool)

(assert (=> b!1481143 (=> (not res!1005947) (not e!830906))))

(assert (=> b!1481143 (= res!1005947 (= lt!646656 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!48004 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1481144 () Bool)

(assert (=> b!1481144 (= e!830910 true)))

(assert (=> b!1481144 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646658 lt!646657 mask!2687) lt!646653)))

(declare-fun lt!646659 () Unit!49655)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49655)

(assert (=> b!1481144 (= lt!646659 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1481145 () Bool)

(declare-fun res!1005940 () Bool)

(assert (=> b!1481145 (=> (not res!1005940) (not e!830905))))

(assert (=> b!1481145 (= res!1005940 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48004 a!2862) j!93) a!2862 mask!2687) lt!646660))))

(declare-fun b!1481146 () Bool)

(declare-fun res!1005951 () Bool)

(assert (=> b!1481146 (=> res!1005951 e!830910)))

(assert (=> b!1481146 (= res!1005951 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!48004 a!2862) j!93) a!2862 mask!2687) lt!646653)))))

(assert (= (and start!126516 res!1005938) b!1481131))

(assert (= (and b!1481131 res!1005943) b!1481137))

(assert (= (and b!1481137 res!1005950) b!1481130))

(assert (= (and b!1481130 res!1005953) b!1481139))

(assert (= (and b!1481139 res!1005936) b!1481133))

(assert (= (and b!1481133 res!1005941) b!1481140))

(assert (= (and b!1481140 res!1005946) b!1481127))

(assert (= (and b!1481127 res!1005945) b!1481136))

(assert (= (and b!1481136 res!1005952) b!1481145))

(assert (= (and b!1481145 res!1005940) b!1481129))

(assert (= (and b!1481129 res!1005937) b!1481134))

(assert (= (and b!1481134 c!137125) b!1481142))

(assert (= (and b!1481134 (not c!137125)) b!1481128))

(assert (= (and b!1481134 res!1005942) b!1481141))

(assert (= (and b!1481141 res!1005944) b!1481135))

(assert (= (and b!1481135 res!1005948) b!1481138))

(assert (= (and b!1481138 (not res!1005949)) b!1481143))

(assert (= (and b!1481143 res!1005947) b!1481132))

(assert (= (and b!1481135 (not res!1005939)) b!1481146))

(assert (= (and b!1481146 (not res!1005951)) b!1481144))

(declare-fun m!1366975 () Bool)

(assert (=> b!1481139 m!1366975))

(declare-fun m!1366977 () Bool)

(assert (=> b!1481146 m!1366977))

(assert (=> b!1481146 m!1366977))

(declare-fun m!1366979 () Bool)

(assert (=> b!1481146 m!1366979))

(declare-fun m!1366981 () Bool)

(assert (=> b!1481129 m!1366981))

(assert (=> b!1481129 m!1366981))

(declare-fun m!1366983 () Bool)

(assert (=> b!1481129 m!1366983))

(declare-fun m!1366985 () Bool)

(assert (=> b!1481129 m!1366985))

(declare-fun m!1366987 () Bool)

(assert (=> b!1481129 m!1366987))

(declare-fun m!1366989 () Bool)

(assert (=> b!1481144 m!1366989))

(declare-fun m!1366991 () Bool)

(assert (=> b!1481144 m!1366991))

(assert (=> b!1481130 m!1366977))

(assert (=> b!1481130 m!1366977))

(declare-fun m!1366993 () Bool)

(assert (=> b!1481130 m!1366993))

(assert (=> b!1481145 m!1366977))

(assert (=> b!1481145 m!1366977))

(declare-fun m!1366995 () Bool)

(assert (=> b!1481145 m!1366995))

(assert (=> b!1481127 m!1366985))

(declare-fun m!1366997 () Bool)

(assert (=> b!1481127 m!1366997))

(assert (=> b!1481136 m!1366977))

(assert (=> b!1481136 m!1366977))

(declare-fun m!1366999 () Bool)

(assert (=> b!1481136 m!1366999))

(assert (=> b!1481136 m!1366999))

(assert (=> b!1481136 m!1366977))

(declare-fun m!1367001 () Bool)

(assert (=> b!1481136 m!1367001))

(declare-fun m!1367003 () Bool)

(assert (=> b!1481133 m!1367003))

(assert (=> b!1481143 m!1366977))

(assert (=> b!1481143 m!1366977))

(declare-fun m!1367005 () Bool)

(assert (=> b!1481143 m!1367005))

(assert (=> b!1481128 m!1366989))

(declare-fun m!1367007 () Bool)

(assert (=> b!1481128 m!1367007))

(declare-fun m!1367009 () Bool)

(assert (=> start!126516 m!1367009))

(declare-fun m!1367011 () Bool)

(assert (=> start!126516 m!1367011))

(declare-fun m!1367013 () Bool)

(assert (=> b!1481135 m!1367013))

(assert (=> b!1481135 m!1366985))

(declare-fun m!1367015 () Bool)

(assert (=> b!1481135 m!1367015))

(declare-fun m!1367017 () Bool)

(assert (=> b!1481135 m!1367017))

(declare-fun m!1367019 () Bool)

(assert (=> b!1481135 m!1367019))

(assert (=> b!1481135 m!1366977))

(declare-fun m!1367021 () Bool)

(assert (=> b!1481135 m!1367021))

(declare-fun m!1367023 () Bool)

(assert (=> b!1481135 m!1367023))

(assert (=> b!1481135 m!1366977))

(declare-fun m!1367025 () Bool)

(assert (=> b!1481137 m!1367025))

(assert (=> b!1481137 m!1367025))

(declare-fun m!1367027 () Bool)

(assert (=> b!1481137 m!1367027))

(declare-fun m!1367029 () Bool)

(assert (=> b!1481142 m!1367029))

(assert (=> b!1481138 m!1367019))

(assert (=> b!1481138 m!1366985))

(assert (=> b!1481138 m!1367017))

(assert (=> b!1481138 m!1366977))

(check-sat (not b!1481143) (not b!1481136) (not b!1481130) (not b!1481142) (not b!1481146) (not b!1481133) (not b!1481139) (not b!1481129) (not b!1481128) (not b!1481145) (not b!1481135) (not start!126516) (not b!1481137) (not b!1481144))
(check-sat)
