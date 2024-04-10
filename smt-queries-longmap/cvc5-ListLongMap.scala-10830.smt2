; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126826 () Bool)

(assert start!126826)

(declare-fun b!1488861 () Bool)

(declare-fun res!1012420 () Bool)

(declare-fun e!834515 () Bool)

(assert (=> b!1488861 (=> (not res!1012420) (not e!834515))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99599 0))(
  ( (array!99600 (arr!48071 (Array (_ BitVec 32) (_ BitVec 64))) (size!48621 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99599)

(assert (=> b!1488861 (= res!1012420 (and (= (size!48621 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48621 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48621 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1012411 () Bool)

(assert (=> start!126826 (=> (not res!1012411) (not e!834515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126826 (= res!1012411 (validMask!0 mask!2687))))

(assert (=> start!126826 e!834515))

(assert (=> start!126826 true))

(declare-fun array_inv!37099 (array!99599) Bool)

(assert (=> start!126826 (array_inv!37099 a!2862)))

(declare-fun b!1488862 () Bool)

(declare-fun res!1012426 () Bool)

(assert (=> b!1488862 (=> (not res!1012426) (not e!834515))))

(declare-datatypes ((List!34572 0))(
  ( (Nil!34569) (Cons!34568 (h!35951 (_ BitVec 64)) (t!49266 List!34572)) )
))
(declare-fun arrayNoDuplicates!0 (array!99599 (_ BitVec 32) List!34572) Bool)

(assert (=> b!1488862 (= res!1012426 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34569))))

(declare-fun b!1488863 () Bool)

(declare-fun e!834520 () Bool)

(assert (=> b!1488863 (= e!834520 true)))

(declare-fun lt!649346 () Bool)

(declare-fun e!834519 () Bool)

(assert (=> b!1488863 (= lt!649346 e!834519)))

(declare-fun c!137753 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1488863 (= c!137753 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488864 () Bool)

(declare-fun res!1012410 () Bool)

(assert (=> b!1488864 (=> (not res!1012410) (not e!834515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99599 (_ BitVec 32)) Bool)

(assert (=> b!1488864 (= res!1012410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488865 () Bool)

(declare-fun e!834517 () Bool)

(declare-fun e!834521 () Bool)

(assert (=> b!1488865 (= e!834517 e!834521)))

(declare-fun res!1012421 () Bool)

(assert (=> b!1488865 (=> (not res!1012421) (not e!834521))))

(declare-datatypes ((SeekEntryResult!12311 0))(
  ( (MissingZero!12311 (index!51636 (_ BitVec 32))) (Found!12311 (index!51637 (_ BitVec 32))) (Intermediate!12311 (undefined!13123 Bool) (index!51638 (_ BitVec 32)) (x!133239 (_ BitVec 32))) (Undefined!12311) (MissingVacant!12311 (index!51639 (_ BitVec 32))) )
))
(declare-fun lt!649350 () SeekEntryResult!12311)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99599 (_ BitVec 32)) SeekEntryResult!12311)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488865 (= res!1012421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48071 a!2862) j!93) mask!2687) (select (arr!48071 a!2862) j!93) a!2862 mask!2687) lt!649350))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488865 (= lt!649350 (Intermediate!12311 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488866 () Bool)

(declare-fun res!1012422 () Bool)

(assert (=> b!1488866 (=> res!1012422 e!834520)))

(declare-fun lt!649349 () (_ BitVec 32))

(assert (=> b!1488866 (= res!1012422 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649349 (select (arr!48071 a!2862) j!93) a!2862 mask!2687) lt!649350)))))

(declare-fun b!1488867 () Bool)

(declare-fun res!1012418 () Bool)

(declare-fun e!834518 () Bool)

(assert (=> b!1488867 (=> (not res!1012418) (not e!834518))))

(declare-fun e!834522 () Bool)

(assert (=> b!1488867 (= res!1012418 e!834522)))

(declare-fun c!137754 () Bool)

(assert (=> b!1488867 (= c!137754 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488868 () Bool)

(declare-fun res!1012425 () Bool)

(assert (=> b!1488868 (=> (not res!1012425) (not e!834515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488868 (= res!1012425 (validKeyInArray!0 (select (arr!48071 a!2862) j!93)))))

(declare-fun b!1488869 () Bool)

(declare-fun res!1012416 () Bool)

(assert (=> b!1488869 (=> (not res!1012416) (not e!834521))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1488869 (= res!1012416 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48071 a!2862) j!93) a!2862 mask!2687) lt!649350))))

(declare-fun lt!649343 () array!99599)

(declare-fun b!1488870 () Bool)

(declare-fun lt!649344 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99599 (_ BitVec 32)) SeekEntryResult!12311)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99599 (_ BitVec 32)) SeekEntryResult!12311)

(assert (=> b!1488870 (= e!834522 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649344 lt!649343 mask!2687) (seekEntryOrOpen!0 lt!649344 lt!649343 mask!2687)))))

(declare-fun b!1488871 () Bool)

(declare-fun e!834524 () Bool)

(assert (=> b!1488871 (= e!834524 e!834520)))

(declare-fun res!1012414 () Bool)

(assert (=> b!1488871 (=> res!1012414 e!834520)))

(assert (=> b!1488871 (= res!1012414 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649349 #b00000000000000000000000000000000) (bvsge lt!649349 (size!48621 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488871 (= lt!649349 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649345 () SeekEntryResult!12311)

(assert (=> b!1488871 (= lt!649345 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649344 lt!649343 mask!2687))))

(assert (=> b!1488871 (= lt!649345 (seekEntryOrOpen!0 lt!649344 lt!649343 mask!2687))))

(declare-fun lt!649348 () SeekEntryResult!12311)

(declare-fun b!1488872 () Bool)

(assert (=> b!1488872 (= e!834522 (= lt!649348 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649344 lt!649343 mask!2687)))))

(declare-fun b!1488873 () Bool)

(declare-fun e!834516 () Bool)

(assert (=> b!1488873 (= e!834516 (and (or (= (select (arr!48071 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48071 a!2862) intermediateBeforeIndex!19) (select (arr!48071 a!2862) j!93))) (let ((bdg!54671 (select (store (arr!48071 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48071 a!2862) index!646) bdg!54671) (= (select (arr!48071 a!2862) index!646) (select (arr!48071 a!2862) j!93))) (= (select (arr!48071 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54671 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488874 () Bool)

(declare-fun res!1012412 () Bool)

(assert (=> b!1488874 (=> (not res!1012412) (not e!834515))))

(assert (=> b!1488874 (= res!1012412 (validKeyInArray!0 (select (arr!48071 a!2862) i!1006)))))

(declare-fun b!1488875 () Bool)

(assert (=> b!1488875 (= e!834518 (not e!834524))))

(declare-fun res!1012417 () Bool)

(assert (=> b!1488875 (=> res!1012417 e!834524)))

(assert (=> b!1488875 (= res!1012417 (or (and (= (select (arr!48071 a!2862) index!646) (select (store (arr!48071 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48071 a!2862) index!646) (select (arr!48071 a!2862) j!93))) (= (select (arr!48071 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488875 e!834516))

(declare-fun res!1012413 () Bool)

(assert (=> b!1488875 (=> (not res!1012413) (not e!834516))))

(assert (=> b!1488875 (= res!1012413 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49962 0))(
  ( (Unit!49963) )
))
(declare-fun lt!649347 () Unit!49962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49962)

(assert (=> b!1488875 (= lt!649347 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488876 () Bool)

(assert (=> b!1488876 (= e!834519 (not (= lt!649348 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649349 lt!649344 lt!649343 mask!2687))))))

(declare-fun b!1488877 () Bool)

(assert (=> b!1488877 (= e!834521 e!834518)))

(declare-fun res!1012415 () Bool)

(assert (=> b!1488877 (=> (not res!1012415) (not e!834518))))

(assert (=> b!1488877 (= res!1012415 (= lt!649348 (Intermediate!12311 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1488877 (= lt!649348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649344 mask!2687) lt!649344 lt!649343 mask!2687))))

(assert (=> b!1488877 (= lt!649344 (select (store (arr!48071 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488878 () Bool)

(assert (=> b!1488878 (= e!834515 e!834517)))

(declare-fun res!1012419 () Bool)

(assert (=> b!1488878 (=> (not res!1012419) (not e!834517))))

(assert (=> b!1488878 (= res!1012419 (= (select (store (arr!48071 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488878 (= lt!649343 (array!99600 (store (arr!48071 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48621 a!2862)))))

(declare-fun b!1488879 () Bool)

(assert (=> b!1488879 (= e!834519 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649349 intermediateAfterIndex!19 lt!649344 lt!649343 mask!2687) lt!649345)))))

(declare-fun b!1488880 () Bool)

(declare-fun res!1012424 () Bool)

(assert (=> b!1488880 (=> (not res!1012424) (not e!834515))))

(assert (=> b!1488880 (= res!1012424 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48621 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48621 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48621 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488881 () Bool)

(declare-fun res!1012423 () Bool)

(assert (=> b!1488881 (=> (not res!1012423) (not e!834518))))

(assert (=> b!1488881 (= res!1012423 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488882 () Bool)

(declare-fun res!1012409 () Bool)

(assert (=> b!1488882 (=> (not res!1012409) (not e!834516))))

(assert (=> b!1488882 (= res!1012409 (= (seekEntryOrOpen!0 (select (arr!48071 a!2862) j!93) a!2862 mask!2687) (Found!12311 j!93)))))

(assert (= (and start!126826 res!1012411) b!1488861))

(assert (= (and b!1488861 res!1012420) b!1488874))

(assert (= (and b!1488874 res!1012412) b!1488868))

(assert (= (and b!1488868 res!1012425) b!1488864))

(assert (= (and b!1488864 res!1012410) b!1488862))

(assert (= (and b!1488862 res!1012426) b!1488880))

(assert (= (and b!1488880 res!1012424) b!1488878))

(assert (= (and b!1488878 res!1012419) b!1488865))

(assert (= (and b!1488865 res!1012421) b!1488869))

(assert (= (and b!1488869 res!1012416) b!1488877))

(assert (= (and b!1488877 res!1012415) b!1488867))

(assert (= (and b!1488867 c!137754) b!1488872))

(assert (= (and b!1488867 (not c!137754)) b!1488870))

(assert (= (and b!1488867 res!1012418) b!1488881))

(assert (= (and b!1488881 res!1012423) b!1488875))

(assert (= (and b!1488875 res!1012413) b!1488882))

(assert (= (and b!1488882 res!1012409) b!1488873))

(assert (= (and b!1488875 (not res!1012417)) b!1488871))

(assert (= (and b!1488871 (not res!1012414)) b!1488866))

(assert (= (and b!1488866 (not res!1012422)) b!1488863))

(assert (= (and b!1488863 c!137753) b!1488876))

(assert (= (and b!1488863 (not c!137753)) b!1488879))

(declare-fun m!1373167 () Bool)

(assert (=> b!1488879 m!1373167))

(declare-fun m!1373169 () Bool)

(assert (=> b!1488873 m!1373169))

(declare-fun m!1373171 () Bool)

(assert (=> b!1488873 m!1373171))

(declare-fun m!1373173 () Bool)

(assert (=> b!1488873 m!1373173))

(declare-fun m!1373175 () Bool)

(assert (=> b!1488873 m!1373175))

(declare-fun m!1373177 () Bool)

(assert (=> b!1488873 m!1373177))

(assert (=> b!1488865 m!1373177))

(assert (=> b!1488865 m!1373177))

(declare-fun m!1373179 () Bool)

(assert (=> b!1488865 m!1373179))

(assert (=> b!1488865 m!1373179))

(assert (=> b!1488865 m!1373177))

(declare-fun m!1373181 () Bool)

(assert (=> b!1488865 m!1373181))

(assert (=> b!1488878 m!1373169))

(declare-fun m!1373183 () Bool)

(assert (=> b!1488878 m!1373183))

(declare-fun m!1373185 () Bool)

(assert (=> b!1488877 m!1373185))

(assert (=> b!1488877 m!1373185))

(declare-fun m!1373187 () Bool)

(assert (=> b!1488877 m!1373187))

(assert (=> b!1488877 m!1373169))

(declare-fun m!1373189 () Bool)

(assert (=> b!1488877 m!1373189))

(declare-fun m!1373191 () Bool)

(assert (=> b!1488870 m!1373191))

(declare-fun m!1373193 () Bool)

(assert (=> b!1488870 m!1373193))

(declare-fun m!1373195 () Bool)

(assert (=> b!1488871 m!1373195))

(assert (=> b!1488871 m!1373191))

(assert (=> b!1488871 m!1373193))

(declare-fun m!1373197 () Bool)

(assert (=> b!1488862 m!1373197))

(declare-fun m!1373199 () Bool)

(assert (=> b!1488872 m!1373199))

(declare-fun m!1373201 () Bool)

(assert (=> b!1488875 m!1373201))

(assert (=> b!1488875 m!1373169))

(assert (=> b!1488875 m!1373173))

(assert (=> b!1488875 m!1373175))

(declare-fun m!1373203 () Bool)

(assert (=> b!1488875 m!1373203))

(assert (=> b!1488875 m!1373177))

(assert (=> b!1488868 m!1373177))

(assert (=> b!1488868 m!1373177))

(declare-fun m!1373205 () Bool)

(assert (=> b!1488868 m!1373205))

(declare-fun m!1373207 () Bool)

(assert (=> start!126826 m!1373207))

(declare-fun m!1373209 () Bool)

(assert (=> start!126826 m!1373209))

(assert (=> b!1488882 m!1373177))

(assert (=> b!1488882 m!1373177))

(declare-fun m!1373211 () Bool)

(assert (=> b!1488882 m!1373211))

(declare-fun m!1373213 () Bool)

(assert (=> b!1488874 m!1373213))

(assert (=> b!1488874 m!1373213))

(declare-fun m!1373215 () Bool)

(assert (=> b!1488874 m!1373215))

(assert (=> b!1488869 m!1373177))

(assert (=> b!1488869 m!1373177))

(declare-fun m!1373217 () Bool)

(assert (=> b!1488869 m!1373217))

(declare-fun m!1373219 () Bool)

(assert (=> b!1488864 m!1373219))

(assert (=> b!1488866 m!1373177))

(assert (=> b!1488866 m!1373177))

(declare-fun m!1373221 () Bool)

(assert (=> b!1488866 m!1373221))

(declare-fun m!1373223 () Bool)

(assert (=> b!1488876 m!1373223))

(push 1)

