; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123164 () Bool)

(assert start!123164)

(declare-fun e!806585 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97329 0))(
  ( (array!97330 (arr!46978 (Array (_ BitVec 32) (_ BitVec 64))) (size!47530 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97329)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1428201 () Bool)

(declare-datatypes ((SeekEntryResult!11284 0))(
  ( (MissingZero!11284 (index!47528 (_ BitVec 32))) (Found!11284 (index!47529 (_ BitVec 32))) (Intermediate!11284 (undefined!12096 Bool) (index!47530 (_ BitVec 32)) (x!129157 (_ BitVec 32))) (Undefined!11284) (MissingVacant!11284 (index!47531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97329 (_ BitVec 32)) SeekEntryResult!11284)

(assert (=> b!1428201 (= e!806585 (= (seekEntryOrOpen!0 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) (Found!11284 j!81)))))

(declare-fun b!1428202 () Bool)

(declare-fun res!963088 () Bool)

(declare-fun e!806587 () Bool)

(assert (=> b!1428202 (=> (not res!963088) (not e!806587))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628717 () SeekEntryResult!11284)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97329 (_ BitVec 32)) SeekEntryResult!11284)

(assert (=> b!1428202 (= res!963088 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628717))))

(declare-fun b!1428203 () Bool)

(declare-fun e!806586 () Bool)

(declare-fun e!806588 () Bool)

(assert (=> b!1428203 (= e!806586 e!806588)))

(declare-fun res!963086 () Bool)

(assert (=> b!1428203 (=> (not res!963086) (not e!806588))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428203 (= res!963086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628717))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428203 (= lt!628717 (Intermediate!11284 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428204 () Bool)

(declare-fun res!963094 () Bool)

(assert (=> b!1428204 (=> (not res!963094) (not e!806586))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428204 (= res!963094 (and (= (size!47530 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47530 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47530 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428205 () Bool)

(declare-fun res!963092 () Bool)

(assert (=> b!1428205 (=> (not res!963092) (not e!806586))))

(assert (=> b!1428205 (= res!963092 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47530 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47530 a!2831))))))

(declare-fun b!1428206 () Bool)

(declare-fun res!963091 () Bool)

(assert (=> b!1428206 (=> (not res!963091) (not e!806586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97329 (_ BitVec 32)) Bool)

(assert (=> b!1428206 (= res!963091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428207 () Bool)

(assert (=> b!1428207 (= e!806588 e!806587)))

(declare-fun res!963090 () Bool)

(assert (=> b!1428207 (=> (not res!963090) (not e!806587))))

(declare-fun lt!628718 () (_ BitVec 64))

(declare-fun lt!628719 () SeekEntryResult!11284)

(declare-fun lt!628720 () array!97329)

(assert (=> b!1428207 (= res!963090 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628718 mask!2608) lt!628718 lt!628720 mask!2608) lt!628719))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428207 (= lt!628719 (Intermediate!11284 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428207 (= lt!628718 (select (store (arr!46978 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428207 (= lt!628720 (array!97330 (store (arr!46978 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47530 a!2831)))))

(declare-fun b!1428208 () Bool)

(declare-fun res!963087 () Bool)

(assert (=> b!1428208 (=> (not res!963087) (not e!806586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428208 (= res!963087 (validKeyInArray!0 (select (arr!46978 a!2831) i!982)))))

(declare-fun b!1428209 () Bool)

(assert (=> b!1428209 (= e!806587 (not (or (= (select (arr!46978 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46978 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!46978 a!2831) index!585) (select (arr!46978 a!2831) j!81))))))))

(assert (=> b!1428209 e!806585))

(declare-fun res!963082 () Bool)

(assert (=> b!1428209 (=> (not res!963082) (not e!806585))))

(assert (=> b!1428209 (= res!963082 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48153 0))(
  ( (Unit!48154) )
))
(declare-fun lt!628721 () Unit!48153)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48153)

(assert (=> b!1428209 (= lt!628721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428210 () Bool)

(declare-fun res!963089 () Bool)

(assert (=> b!1428210 (=> (not res!963089) (not e!806586))))

(declare-datatypes ((List!33566 0))(
  ( (Nil!33563) (Cons!33562 (h!34873 (_ BitVec 64)) (t!48252 List!33566)) )
))
(declare-fun arrayNoDuplicates!0 (array!97329 (_ BitVec 32) List!33566) Bool)

(assert (=> b!1428210 (= res!963089 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33563))))

(declare-fun b!1428211 () Bool)

(declare-fun res!963084 () Bool)

(assert (=> b!1428211 (=> (not res!963084) (not e!806586))))

(assert (=> b!1428211 (= res!963084 (validKeyInArray!0 (select (arr!46978 a!2831) j!81)))))

(declare-fun res!963093 () Bool)

(assert (=> start!123164 (=> (not res!963093) (not e!806586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123164 (= res!963093 (validMask!0 mask!2608))))

(assert (=> start!123164 e!806586))

(assert (=> start!123164 true))

(declare-fun array_inv!36211 (array!97329) Bool)

(assert (=> start!123164 (array_inv!36211 a!2831)))

(declare-fun b!1428212 () Bool)

(declare-fun res!963083 () Bool)

(assert (=> b!1428212 (=> (not res!963083) (not e!806587))))

(assert (=> b!1428212 (= res!963083 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428213 () Bool)

(declare-fun res!963085 () Bool)

(assert (=> b!1428213 (=> (not res!963085) (not e!806587))))

(assert (=> b!1428213 (= res!963085 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628718 lt!628720 mask!2608) lt!628719))))

(assert (= (and start!123164 res!963093) b!1428204))

(assert (= (and b!1428204 res!963094) b!1428208))

(assert (= (and b!1428208 res!963087) b!1428211))

(assert (= (and b!1428211 res!963084) b!1428206))

(assert (= (and b!1428206 res!963091) b!1428210))

(assert (= (and b!1428210 res!963089) b!1428205))

(assert (= (and b!1428205 res!963092) b!1428203))

(assert (= (and b!1428203 res!963086) b!1428207))

(assert (= (and b!1428207 res!963090) b!1428202))

(assert (= (and b!1428202 res!963088) b!1428213))

(assert (= (and b!1428213 res!963085) b!1428212))

(assert (= (and b!1428212 res!963083) b!1428209))

(assert (= (and b!1428209 res!963082) b!1428201))

(declare-fun m!1317969 () Bool)

(assert (=> b!1428210 m!1317969))

(declare-fun m!1317971 () Bool)

(assert (=> b!1428202 m!1317971))

(assert (=> b!1428202 m!1317971))

(declare-fun m!1317973 () Bool)

(assert (=> b!1428202 m!1317973))

(declare-fun m!1317975 () Bool)

(assert (=> b!1428209 m!1317975))

(assert (=> b!1428209 m!1317971))

(declare-fun m!1317977 () Bool)

(assert (=> b!1428209 m!1317977))

(declare-fun m!1317979 () Bool)

(assert (=> b!1428209 m!1317979))

(declare-fun m!1317981 () Bool)

(assert (=> b!1428213 m!1317981))

(declare-fun m!1317983 () Bool)

(assert (=> b!1428208 m!1317983))

(assert (=> b!1428208 m!1317983))

(declare-fun m!1317985 () Bool)

(assert (=> b!1428208 m!1317985))

(assert (=> b!1428203 m!1317971))

(assert (=> b!1428203 m!1317971))

(declare-fun m!1317987 () Bool)

(assert (=> b!1428203 m!1317987))

(assert (=> b!1428203 m!1317987))

(assert (=> b!1428203 m!1317971))

(declare-fun m!1317989 () Bool)

(assert (=> b!1428203 m!1317989))

(assert (=> b!1428211 m!1317971))

(assert (=> b!1428211 m!1317971))

(declare-fun m!1317991 () Bool)

(assert (=> b!1428211 m!1317991))

(declare-fun m!1317993 () Bool)

(assert (=> b!1428207 m!1317993))

(assert (=> b!1428207 m!1317993))

(declare-fun m!1317995 () Bool)

(assert (=> b!1428207 m!1317995))

(declare-fun m!1317997 () Bool)

(assert (=> b!1428207 m!1317997))

(declare-fun m!1317999 () Bool)

(assert (=> b!1428207 m!1317999))

(declare-fun m!1318001 () Bool)

(assert (=> start!123164 m!1318001))

(declare-fun m!1318003 () Bool)

(assert (=> start!123164 m!1318003))

(assert (=> b!1428201 m!1317971))

(assert (=> b!1428201 m!1317971))

(declare-fun m!1318005 () Bool)

(assert (=> b!1428201 m!1318005))

(declare-fun m!1318007 () Bool)

(assert (=> b!1428206 m!1318007))

(check-sat (not b!1428201) (not b!1428209) (not b!1428207) (not b!1428203) (not b!1428208) (not b!1428206) (not b!1428210) (not b!1428211) (not b!1428202) (not start!123164) (not b!1428213))
(check-sat)
(get-model)

(declare-fun b!1428300 () Bool)

(declare-fun e!806625 () Bool)

(declare-fun e!806627 () Bool)

(assert (=> b!1428300 (= e!806625 e!806627)))

(declare-fun c!132055 () Bool)

(assert (=> b!1428300 (= c!132055 (validKeyInArray!0 (select (arr!46978 a!2831) j!81)))))

(declare-fun d!153331 () Bool)

(declare-fun res!963177 () Bool)

(assert (=> d!153331 (=> res!963177 e!806625)))

(assert (=> d!153331 (= res!963177 (bvsge j!81 (size!47530 a!2831)))))

(assert (=> d!153331 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806625)))

(declare-fun b!1428301 () Bool)

(declare-fun call!67367 () Bool)

(assert (=> b!1428301 (= e!806627 call!67367)))

(declare-fun b!1428302 () Bool)

(declare-fun e!806626 () Bool)

(assert (=> b!1428302 (= e!806627 e!806626)))

(declare-fun lt!628760 () (_ BitVec 64))

(assert (=> b!1428302 (= lt!628760 (select (arr!46978 a!2831) j!81))))

(declare-fun lt!628759 () Unit!48153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97329 (_ BitVec 64) (_ BitVec 32)) Unit!48153)

(assert (=> b!1428302 (= lt!628759 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628760 j!81))))

(declare-fun arrayContainsKey!0 (array!97329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1428302 (arrayContainsKey!0 a!2831 lt!628760 #b00000000000000000000000000000000)))

(declare-fun lt!628758 () Unit!48153)

(assert (=> b!1428302 (= lt!628758 lt!628759)))

(declare-fun res!963178 () Bool)

(assert (=> b!1428302 (= res!963178 (= (seekEntryOrOpen!0 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) (Found!11284 j!81)))))

(assert (=> b!1428302 (=> (not res!963178) (not e!806626))))

(declare-fun b!1428303 () Bool)

(assert (=> b!1428303 (= e!806626 call!67367)))

(declare-fun bm!67364 () Bool)

(assert (=> bm!67364 (= call!67367 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153331 (not res!963177)) b!1428300))

(assert (= (and b!1428300 c!132055) b!1428302))

(assert (= (and b!1428300 (not c!132055)) b!1428301))

(assert (= (and b!1428302 res!963178) b!1428303))

(assert (= (or b!1428303 b!1428301) bm!67364))

(assert (=> b!1428300 m!1317971))

(assert (=> b!1428300 m!1317971))

(assert (=> b!1428300 m!1317991))

(assert (=> b!1428302 m!1317971))

(declare-fun m!1318089 () Bool)

(assert (=> b!1428302 m!1318089))

(declare-fun m!1318091 () Bool)

(assert (=> b!1428302 m!1318091))

(assert (=> b!1428302 m!1317971))

(assert (=> b!1428302 m!1318005))

(declare-fun m!1318093 () Bool)

(assert (=> bm!67364 m!1318093))

(assert (=> b!1428209 d!153331))

(declare-fun d!153333 () Bool)

(assert (=> d!153333 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628763 () Unit!48153)

(declare-fun choose!38 (array!97329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48153)

(assert (=> d!153333 (= lt!628763 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153333 (validMask!0 mask!2608)))

(assert (=> d!153333 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628763)))

(declare-fun bs!41596 () Bool)

(assert (= bs!41596 d!153333))

(assert (=> bs!41596 m!1317977))

(declare-fun m!1318095 () Bool)

(assert (=> bs!41596 m!1318095))

(assert (=> bs!41596 m!1318001))

(assert (=> b!1428209 d!153333))

(declare-fun d!153335 () Bool)

(assert (=> d!153335 (= (validKeyInArray!0 (select (arr!46978 a!2831) i!982)) (and (not (= (select (arr!46978 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46978 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428208 d!153335))

(declare-fun b!1428322 () Bool)

(declare-fun lt!628768 () SeekEntryResult!11284)

(assert (=> b!1428322 (and (bvsge (index!47530 lt!628768) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628768) (size!47530 lt!628720)))))

(declare-fun e!806638 () Bool)

(assert (=> b!1428322 (= e!806638 (= (select (arr!46978 lt!628720) (index!47530 lt!628768)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428323 () Bool)

(assert (=> b!1428323 (and (bvsge (index!47530 lt!628768) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628768) (size!47530 lt!628720)))))

(declare-fun res!963185 () Bool)

(assert (=> b!1428323 (= res!963185 (= (select (arr!46978 lt!628720) (index!47530 lt!628768)) lt!628718))))

(assert (=> b!1428323 (=> res!963185 e!806638)))

(declare-fun e!806641 () Bool)

(assert (=> b!1428323 (= e!806641 e!806638)))

(declare-fun d!153337 () Bool)

(declare-fun e!806640 () Bool)

(assert (=> d!153337 e!806640))

(declare-fun c!132062 () Bool)

(get-info :version)

(assert (=> d!153337 (= c!132062 (and ((_ is Intermediate!11284) lt!628768) (undefined!12096 lt!628768)))))

(declare-fun e!806639 () SeekEntryResult!11284)

(assert (=> d!153337 (= lt!628768 e!806639)))

(declare-fun c!132064 () Bool)

(assert (=> d!153337 (= c!132064 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628769 () (_ BitVec 64))

(assert (=> d!153337 (= lt!628769 (select (arr!46978 lt!628720) (toIndex!0 lt!628718 mask!2608)))))

(assert (=> d!153337 (validMask!0 mask!2608)))

(assert (=> d!153337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628718 mask!2608) lt!628718 lt!628720 mask!2608) lt!628768)))

(declare-fun b!1428324 () Bool)

(assert (=> b!1428324 (and (bvsge (index!47530 lt!628768) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628768) (size!47530 lt!628720)))))

(declare-fun res!963187 () Bool)

(assert (=> b!1428324 (= res!963187 (= (select (arr!46978 lt!628720) (index!47530 lt!628768)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428324 (=> res!963187 e!806638)))

(declare-fun b!1428325 () Bool)

(assert (=> b!1428325 (= e!806640 e!806641)))

(declare-fun res!963186 () Bool)

(assert (=> b!1428325 (= res!963186 (and ((_ is Intermediate!11284) lt!628768) (not (undefined!12096 lt!628768)) (bvslt (x!129157 lt!628768) #b01111111111111111111111111111110) (bvsge (x!129157 lt!628768) #b00000000000000000000000000000000) (bvsge (x!129157 lt!628768) #b00000000000000000000000000000000)))))

(assert (=> b!1428325 (=> (not res!963186) (not e!806641))))

(declare-fun b!1428326 () Bool)

(declare-fun e!806642 () SeekEntryResult!11284)

(assert (=> b!1428326 (= e!806639 e!806642)))

(declare-fun c!132063 () Bool)

(assert (=> b!1428326 (= c!132063 (or (= lt!628769 lt!628718) (= (bvadd lt!628769 lt!628769) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428327 () Bool)

(assert (=> b!1428327 (= e!806639 (Intermediate!11284 true (toIndex!0 lt!628718 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428328 () Bool)

(assert (=> b!1428328 (= e!806640 (bvsge (x!129157 lt!628768) #b01111111111111111111111111111110))))

(declare-fun b!1428329 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428329 (= e!806642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628718 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628718 lt!628720 mask!2608))))

(declare-fun b!1428330 () Bool)

(assert (=> b!1428330 (= e!806642 (Intermediate!11284 false (toIndex!0 lt!628718 mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153337 c!132064) b!1428327))

(assert (= (and d!153337 (not c!132064)) b!1428326))

(assert (= (and b!1428326 c!132063) b!1428330))

(assert (= (and b!1428326 (not c!132063)) b!1428329))

(assert (= (and d!153337 c!132062) b!1428328))

(assert (= (and d!153337 (not c!132062)) b!1428325))

(assert (= (and b!1428325 res!963186) b!1428323))

(assert (= (and b!1428323 (not res!963185)) b!1428324))

(assert (= (and b!1428324 (not res!963187)) b!1428322))

(declare-fun m!1318097 () Bool)

(assert (=> b!1428323 m!1318097))

(assert (=> b!1428324 m!1318097))

(assert (=> d!153337 m!1317993))

(declare-fun m!1318099 () Bool)

(assert (=> d!153337 m!1318099))

(assert (=> d!153337 m!1318001))

(assert (=> b!1428329 m!1317993))

(declare-fun m!1318101 () Bool)

(assert (=> b!1428329 m!1318101))

(assert (=> b!1428329 m!1318101))

(declare-fun m!1318103 () Bool)

(assert (=> b!1428329 m!1318103))

(assert (=> b!1428322 m!1318097))

(assert (=> b!1428207 d!153337))

(declare-fun d!153339 () Bool)

(declare-fun lt!628775 () (_ BitVec 32))

(declare-fun lt!628774 () (_ BitVec 32))

(assert (=> d!153339 (= lt!628775 (bvmul (bvxor lt!628774 (bvlshr lt!628774 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153339 (= lt!628774 ((_ extract 31 0) (bvand (bvxor lt!628718 (bvlshr lt!628718 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153339 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963188 (let ((h!34876 ((_ extract 31 0) (bvand (bvxor lt!628718 (bvlshr lt!628718 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129161 (bvmul (bvxor h!34876 (bvlshr h!34876 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129161 (bvlshr x!129161 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963188 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963188 #b00000000000000000000000000000000))))))

(assert (=> d!153339 (= (toIndex!0 lt!628718 mask!2608) (bvand (bvxor lt!628775 (bvlshr lt!628775 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428207 d!153339))

(declare-fun b!1428331 () Bool)

(declare-fun e!806643 () Bool)

(declare-fun e!806645 () Bool)

(assert (=> b!1428331 (= e!806643 e!806645)))

(declare-fun c!132065 () Bool)

(assert (=> b!1428331 (= c!132065 (validKeyInArray!0 (select (arr!46978 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153341 () Bool)

(declare-fun res!963189 () Bool)

(assert (=> d!153341 (=> res!963189 e!806643)))

(assert (=> d!153341 (= res!963189 (bvsge #b00000000000000000000000000000000 (size!47530 a!2831)))))

(assert (=> d!153341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806643)))

(declare-fun b!1428332 () Bool)

(declare-fun call!67368 () Bool)

(assert (=> b!1428332 (= e!806645 call!67368)))

(declare-fun b!1428333 () Bool)

(declare-fun e!806644 () Bool)

(assert (=> b!1428333 (= e!806645 e!806644)))

(declare-fun lt!628778 () (_ BitVec 64))

(assert (=> b!1428333 (= lt!628778 (select (arr!46978 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628777 () Unit!48153)

(assert (=> b!1428333 (= lt!628777 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628778 #b00000000000000000000000000000000))))

(assert (=> b!1428333 (arrayContainsKey!0 a!2831 lt!628778 #b00000000000000000000000000000000)))

(declare-fun lt!628776 () Unit!48153)

(assert (=> b!1428333 (= lt!628776 lt!628777)))

(declare-fun res!963190 () Bool)

(assert (=> b!1428333 (= res!963190 (= (seekEntryOrOpen!0 (select (arr!46978 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11284 #b00000000000000000000000000000000)))))

(assert (=> b!1428333 (=> (not res!963190) (not e!806644))))

(declare-fun b!1428334 () Bool)

(assert (=> b!1428334 (= e!806644 call!67368)))

(declare-fun bm!67365 () Bool)

(assert (=> bm!67365 (= call!67368 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153341 (not res!963189)) b!1428331))

(assert (= (and b!1428331 c!132065) b!1428333))

(assert (= (and b!1428331 (not c!132065)) b!1428332))

(assert (= (and b!1428333 res!963190) b!1428334))

(assert (= (or b!1428334 b!1428332) bm!67365))

(declare-fun m!1318105 () Bool)

(assert (=> b!1428331 m!1318105))

(assert (=> b!1428331 m!1318105))

(declare-fun m!1318107 () Bool)

(assert (=> b!1428331 m!1318107))

(assert (=> b!1428333 m!1318105))

(declare-fun m!1318109 () Bool)

(assert (=> b!1428333 m!1318109))

(declare-fun m!1318111 () Bool)

(assert (=> b!1428333 m!1318111))

(assert (=> b!1428333 m!1318105))

(declare-fun m!1318113 () Bool)

(assert (=> b!1428333 m!1318113))

(declare-fun m!1318115 () Bool)

(assert (=> bm!67365 m!1318115))

(assert (=> b!1428206 d!153341))

(declare-fun b!1428335 () Bool)

(declare-fun lt!628779 () SeekEntryResult!11284)

(assert (=> b!1428335 (and (bvsge (index!47530 lt!628779) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628779) (size!47530 a!2831)))))

(declare-fun e!806646 () Bool)

(assert (=> b!1428335 (= e!806646 (= (select (arr!46978 a!2831) (index!47530 lt!628779)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428336 () Bool)

(assert (=> b!1428336 (and (bvsge (index!47530 lt!628779) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628779) (size!47530 a!2831)))))

(declare-fun res!963191 () Bool)

(assert (=> b!1428336 (= res!963191 (= (select (arr!46978 a!2831) (index!47530 lt!628779)) (select (arr!46978 a!2831) j!81)))))

(assert (=> b!1428336 (=> res!963191 e!806646)))

(declare-fun e!806649 () Bool)

(assert (=> b!1428336 (= e!806649 e!806646)))

(declare-fun d!153343 () Bool)

(declare-fun e!806648 () Bool)

(assert (=> d!153343 e!806648))

(declare-fun c!132066 () Bool)

(assert (=> d!153343 (= c!132066 (and ((_ is Intermediate!11284) lt!628779) (undefined!12096 lt!628779)))))

(declare-fun e!806647 () SeekEntryResult!11284)

(assert (=> d!153343 (= lt!628779 e!806647)))

(declare-fun c!132068 () Bool)

(assert (=> d!153343 (= c!132068 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628780 () (_ BitVec 64))

(assert (=> d!153343 (= lt!628780 (select (arr!46978 a!2831) (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608)))))

(assert (=> d!153343 (validMask!0 mask!2608)))

(assert (=> d!153343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628779)))

(declare-fun b!1428337 () Bool)

(assert (=> b!1428337 (and (bvsge (index!47530 lt!628779) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628779) (size!47530 a!2831)))))

(declare-fun res!963193 () Bool)

(assert (=> b!1428337 (= res!963193 (= (select (arr!46978 a!2831) (index!47530 lt!628779)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428337 (=> res!963193 e!806646)))

(declare-fun b!1428338 () Bool)

(assert (=> b!1428338 (= e!806648 e!806649)))

(declare-fun res!963192 () Bool)

(assert (=> b!1428338 (= res!963192 (and ((_ is Intermediate!11284) lt!628779) (not (undefined!12096 lt!628779)) (bvslt (x!129157 lt!628779) #b01111111111111111111111111111110) (bvsge (x!129157 lt!628779) #b00000000000000000000000000000000) (bvsge (x!129157 lt!628779) #b00000000000000000000000000000000)))))

(assert (=> b!1428338 (=> (not res!963192) (not e!806649))))

(declare-fun b!1428339 () Bool)

(declare-fun e!806650 () SeekEntryResult!11284)

(assert (=> b!1428339 (= e!806647 e!806650)))

(declare-fun c!132067 () Bool)

(assert (=> b!1428339 (= c!132067 (or (= lt!628780 (select (arr!46978 a!2831) j!81)) (= (bvadd lt!628780 lt!628780) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428340 () Bool)

(assert (=> b!1428340 (= e!806647 (Intermediate!11284 true (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428341 () Bool)

(assert (=> b!1428341 (= e!806648 (bvsge (x!129157 lt!628779) #b01111111111111111111111111111110))))

(declare-fun b!1428342 () Bool)

(assert (=> b!1428342 (= e!806650 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428343 () Bool)

(assert (=> b!1428343 (= e!806650 (Intermediate!11284 false (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153343 c!132068) b!1428340))

(assert (= (and d!153343 (not c!132068)) b!1428339))

(assert (= (and b!1428339 c!132067) b!1428343))

(assert (= (and b!1428339 (not c!132067)) b!1428342))

(assert (= (and d!153343 c!132066) b!1428341))

(assert (= (and d!153343 (not c!132066)) b!1428338))

(assert (= (and b!1428338 res!963192) b!1428336))

(assert (= (and b!1428336 (not res!963191)) b!1428337))

(assert (= (and b!1428337 (not res!963193)) b!1428335))

(declare-fun m!1318117 () Bool)

(assert (=> b!1428336 m!1318117))

(assert (=> b!1428337 m!1318117))

(assert (=> d!153343 m!1317987))

(declare-fun m!1318119 () Bool)

(assert (=> d!153343 m!1318119))

(assert (=> d!153343 m!1318001))

(assert (=> b!1428342 m!1317987))

(declare-fun m!1318121 () Bool)

(assert (=> b!1428342 m!1318121))

(assert (=> b!1428342 m!1318121))

(assert (=> b!1428342 m!1317971))

(declare-fun m!1318123 () Bool)

(assert (=> b!1428342 m!1318123))

(assert (=> b!1428335 m!1318117))

(assert (=> b!1428203 d!153343))

(declare-fun d!153345 () Bool)

(declare-fun lt!628782 () (_ BitVec 32))

(declare-fun lt!628781 () (_ BitVec 32))

(assert (=> d!153345 (= lt!628782 (bvmul (bvxor lt!628781 (bvlshr lt!628781 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153345 (= lt!628781 ((_ extract 31 0) (bvand (bvxor (select (arr!46978 a!2831) j!81) (bvlshr (select (arr!46978 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153345 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963188 (let ((h!34876 ((_ extract 31 0) (bvand (bvxor (select (arr!46978 a!2831) j!81) (bvlshr (select (arr!46978 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129161 (bvmul (bvxor h!34876 (bvlshr h!34876 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129161 (bvlshr x!129161 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963188 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963188 #b00000000000000000000000000000000))))))

(assert (=> d!153345 (= (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) (bvand (bvxor lt!628782 (bvlshr lt!628782 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428203 d!153345))

(declare-fun b!1428344 () Bool)

(declare-fun lt!628783 () SeekEntryResult!11284)

(assert (=> b!1428344 (and (bvsge (index!47530 lt!628783) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628783) (size!47530 lt!628720)))))

(declare-fun e!806651 () Bool)

(assert (=> b!1428344 (= e!806651 (= (select (arr!46978 lt!628720) (index!47530 lt!628783)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428345 () Bool)

(assert (=> b!1428345 (and (bvsge (index!47530 lt!628783) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628783) (size!47530 lt!628720)))))

(declare-fun res!963194 () Bool)

(assert (=> b!1428345 (= res!963194 (= (select (arr!46978 lt!628720) (index!47530 lt!628783)) lt!628718))))

(assert (=> b!1428345 (=> res!963194 e!806651)))

(declare-fun e!806654 () Bool)

(assert (=> b!1428345 (= e!806654 e!806651)))

(declare-fun d!153347 () Bool)

(declare-fun e!806653 () Bool)

(assert (=> d!153347 e!806653))

(declare-fun c!132069 () Bool)

(assert (=> d!153347 (= c!132069 (and ((_ is Intermediate!11284) lt!628783) (undefined!12096 lt!628783)))))

(declare-fun e!806652 () SeekEntryResult!11284)

(assert (=> d!153347 (= lt!628783 e!806652)))

(declare-fun c!132071 () Bool)

(assert (=> d!153347 (= c!132071 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628784 () (_ BitVec 64))

(assert (=> d!153347 (= lt!628784 (select (arr!46978 lt!628720) index!585))))

(assert (=> d!153347 (validMask!0 mask!2608)))

(assert (=> d!153347 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628718 lt!628720 mask!2608) lt!628783)))

(declare-fun b!1428346 () Bool)

(assert (=> b!1428346 (and (bvsge (index!47530 lt!628783) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628783) (size!47530 lt!628720)))))

(declare-fun res!963196 () Bool)

(assert (=> b!1428346 (= res!963196 (= (select (arr!46978 lt!628720) (index!47530 lt!628783)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428346 (=> res!963196 e!806651)))

(declare-fun b!1428347 () Bool)

(assert (=> b!1428347 (= e!806653 e!806654)))

(declare-fun res!963195 () Bool)

(assert (=> b!1428347 (= res!963195 (and ((_ is Intermediate!11284) lt!628783) (not (undefined!12096 lt!628783)) (bvslt (x!129157 lt!628783) #b01111111111111111111111111111110) (bvsge (x!129157 lt!628783) #b00000000000000000000000000000000) (bvsge (x!129157 lt!628783) x!605)))))

(assert (=> b!1428347 (=> (not res!963195) (not e!806654))))

(declare-fun b!1428348 () Bool)

(declare-fun e!806655 () SeekEntryResult!11284)

(assert (=> b!1428348 (= e!806652 e!806655)))

(declare-fun c!132070 () Bool)

(assert (=> b!1428348 (= c!132070 (or (= lt!628784 lt!628718) (= (bvadd lt!628784 lt!628784) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428349 () Bool)

(assert (=> b!1428349 (= e!806652 (Intermediate!11284 true index!585 x!605))))

(declare-fun b!1428350 () Bool)

(assert (=> b!1428350 (= e!806653 (bvsge (x!129157 lt!628783) #b01111111111111111111111111111110))))

(declare-fun b!1428351 () Bool)

(assert (=> b!1428351 (= e!806655 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628718 lt!628720 mask!2608))))

(declare-fun b!1428352 () Bool)

(assert (=> b!1428352 (= e!806655 (Intermediate!11284 false index!585 x!605))))

(assert (= (and d!153347 c!132071) b!1428349))

(assert (= (and d!153347 (not c!132071)) b!1428348))

(assert (= (and b!1428348 c!132070) b!1428352))

(assert (= (and b!1428348 (not c!132070)) b!1428351))

(assert (= (and d!153347 c!132069) b!1428350))

(assert (= (and d!153347 (not c!132069)) b!1428347))

(assert (= (and b!1428347 res!963195) b!1428345))

(assert (= (and b!1428345 (not res!963194)) b!1428346))

(assert (= (and b!1428346 (not res!963196)) b!1428344))

(declare-fun m!1318125 () Bool)

(assert (=> b!1428345 m!1318125))

(assert (=> b!1428346 m!1318125))

(declare-fun m!1318127 () Bool)

(assert (=> d!153347 m!1318127))

(assert (=> d!153347 m!1318001))

(declare-fun m!1318129 () Bool)

(assert (=> b!1428351 m!1318129))

(assert (=> b!1428351 m!1318129))

(declare-fun m!1318131 () Bool)

(assert (=> b!1428351 m!1318131))

(assert (=> b!1428344 m!1318125))

(assert (=> b!1428213 d!153347))

(declare-fun b!1428353 () Bool)

(declare-fun lt!628785 () SeekEntryResult!11284)

(assert (=> b!1428353 (and (bvsge (index!47530 lt!628785) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628785) (size!47530 a!2831)))))

(declare-fun e!806656 () Bool)

(assert (=> b!1428353 (= e!806656 (= (select (arr!46978 a!2831) (index!47530 lt!628785)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428354 () Bool)

(assert (=> b!1428354 (and (bvsge (index!47530 lt!628785) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628785) (size!47530 a!2831)))))

(declare-fun res!963197 () Bool)

(assert (=> b!1428354 (= res!963197 (= (select (arr!46978 a!2831) (index!47530 lt!628785)) (select (arr!46978 a!2831) j!81)))))

(assert (=> b!1428354 (=> res!963197 e!806656)))

(declare-fun e!806659 () Bool)

(assert (=> b!1428354 (= e!806659 e!806656)))

(declare-fun d!153349 () Bool)

(declare-fun e!806658 () Bool)

(assert (=> d!153349 e!806658))

(declare-fun c!132072 () Bool)

(assert (=> d!153349 (= c!132072 (and ((_ is Intermediate!11284) lt!628785) (undefined!12096 lt!628785)))))

(declare-fun e!806657 () SeekEntryResult!11284)

(assert (=> d!153349 (= lt!628785 e!806657)))

(declare-fun c!132074 () Bool)

(assert (=> d!153349 (= c!132074 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628786 () (_ BitVec 64))

(assert (=> d!153349 (= lt!628786 (select (arr!46978 a!2831) index!585))))

(assert (=> d!153349 (validMask!0 mask!2608)))

(assert (=> d!153349 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628785)))

(declare-fun b!1428355 () Bool)

(assert (=> b!1428355 (and (bvsge (index!47530 lt!628785) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628785) (size!47530 a!2831)))))

(declare-fun res!963199 () Bool)

(assert (=> b!1428355 (= res!963199 (= (select (arr!46978 a!2831) (index!47530 lt!628785)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428355 (=> res!963199 e!806656)))

(declare-fun b!1428356 () Bool)

(assert (=> b!1428356 (= e!806658 e!806659)))

(declare-fun res!963198 () Bool)

(assert (=> b!1428356 (= res!963198 (and ((_ is Intermediate!11284) lt!628785) (not (undefined!12096 lt!628785)) (bvslt (x!129157 lt!628785) #b01111111111111111111111111111110) (bvsge (x!129157 lt!628785) #b00000000000000000000000000000000) (bvsge (x!129157 lt!628785) x!605)))))

(assert (=> b!1428356 (=> (not res!963198) (not e!806659))))

(declare-fun b!1428357 () Bool)

(declare-fun e!806660 () SeekEntryResult!11284)

(assert (=> b!1428357 (= e!806657 e!806660)))

(declare-fun c!132073 () Bool)

(assert (=> b!1428357 (= c!132073 (or (= lt!628786 (select (arr!46978 a!2831) j!81)) (= (bvadd lt!628786 lt!628786) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428358 () Bool)

(assert (=> b!1428358 (= e!806657 (Intermediate!11284 true index!585 x!605))))

(declare-fun b!1428359 () Bool)

(assert (=> b!1428359 (= e!806658 (bvsge (x!129157 lt!628785) #b01111111111111111111111111111110))))

(declare-fun b!1428360 () Bool)

(assert (=> b!1428360 (= e!806660 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428361 () Bool)

(assert (=> b!1428361 (= e!806660 (Intermediate!11284 false index!585 x!605))))

(assert (= (and d!153349 c!132074) b!1428358))

(assert (= (and d!153349 (not c!132074)) b!1428357))

(assert (= (and b!1428357 c!132073) b!1428361))

(assert (= (and b!1428357 (not c!132073)) b!1428360))

(assert (= (and d!153349 c!132072) b!1428359))

(assert (= (and d!153349 (not c!132072)) b!1428356))

(assert (= (and b!1428356 res!963198) b!1428354))

(assert (= (and b!1428354 (not res!963197)) b!1428355))

(assert (= (and b!1428355 (not res!963199)) b!1428353))

(declare-fun m!1318133 () Bool)

(assert (=> b!1428354 m!1318133))

(assert (=> b!1428355 m!1318133))

(assert (=> d!153349 m!1317975))

(assert (=> d!153349 m!1318001))

(assert (=> b!1428360 m!1318129))

(assert (=> b!1428360 m!1318129))

(assert (=> b!1428360 m!1317971))

(declare-fun m!1318135 () Bool)

(assert (=> b!1428360 m!1318135))

(assert (=> b!1428353 m!1318133))

(assert (=> b!1428202 d!153349))

(declare-fun d!153351 () Bool)

(assert (=> d!153351 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123164 d!153351))

(declare-fun d!153353 () Bool)

(assert (=> d!153353 (= (array_inv!36211 a!2831) (bvsge (size!47530 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123164 d!153353))

(declare-fun b!1428374 () Bool)

(declare-fun e!806668 () SeekEntryResult!11284)

(declare-fun lt!628793 () SeekEntryResult!11284)

(assert (=> b!1428374 (= e!806668 (MissingZero!11284 (index!47530 lt!628793)))))

(declare-fun b!1428375 () Bool)

(declare-fun e!806669 () SeekEntryResult!11284)

(declare-fun e!806667 () SeekEntryResult!11284)

(assert (=> b!1428375 (= e!806669 e!806667)))

(declare-fun lt!628795 () (_ BitVec 64))

(assert (=> b!1428375 (= lt!628795 (select (arr!46978 a!2831) (index!47530 lt!628793)))))

(declare-fun c!132083 () Bool)

(assert (=> b!1428375 (= c!132083 (= lt!628795 (select (arr!46978 a!2831) j!81)))))

(declare-fun b!1428376 () Bool)

(declare-fun c!132082 () Bool)

(assert (=> b!1428376 (= c!132082 (= lt!628795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428376 (= e!806667 e!806668)))

(declare-fun b!1428377 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97329 (_ BitVec 32)) SeekEntryResult!11284)

(assert (=> b!1428377 (= e!806668 (seekKeyOrZeroReturnVacant!0 (x!129157 lt!628793) (index!47530 lt!628793) (index!47530 lt!628793) (select (arr!46978 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!153355 () Bool)

(declare-fun lt!628794 () SeekEntryResult!11284)

(assert (=> d!153355 (and (or ((_ is Undefined!11284) lt!628794) (not ((_ is Found!11284) lt!628794)) (and (bvsge (index!47529 lt!628794) #b00000000000000000000000000000000) (bvslt (index!47529 lt!628794) (size!47530 a!2831)))) (or ((_ is Undefined!11284) lt!628794) ((_ is Found!11284) lt!628794) (not ((_ is MissingZero!11284) lt!628794)) (and (bvsge (index!47528 lt!628794) #b00000000000000000000000000000000) (bvslt (index!47528 lt!628794) (size!47530 a!2831)))) (or ((_ is Undefined!11284) lt!628794) ((_ is Found!11284) lt!628794) ((_ is MissingZero!11284) lt!628794) (not ((_ is MissingVacant!11284) lt!628794)) (and (bvsge (index!47531 lt!628794) #b00000000000000000000000000000000) (bvslt (index!47531 lt!628794) (size!47530 a!2831)))) (or ((_ is Undefined!11284) lt!628794) (ite ((_ is Found!11284) lt!628794) (= (select (arr!46978 a!2831) (index!47529 lt!628794)) (select (arr!46978 a!2831) j!81)) (ite ((_ is MissingZero!11284) lt!628794) (= (select (arr!46978 a!2831) (index!47528 lt!628794)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11284) lt!628794) (= (select (arr!46978 a!2831) (index!47531 lt!628794)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153355 (= lt!628794 e!806669)))

(declare-fun c!132081 () Bool)

(assert (=> d!153355 (= c!132081 (and ((_ is Intermediate!11284) lt!628793) (undefined!12096 lt!628793)))))

(assert (=> d!153355 (= lt!628793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153355 (validMask!0 mask!2608)))

(assert (=> d!153355 (= (seekEntryOrOpen!0 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628794)))

(declare-fun b!1428378 () Bool)

(assert (=> b!1428378 (= e!806667 (Found!11284 (index!47530 lt!628793)))))

(declare-fun b!1428379 () Bool)

(assert (=> b!1428379 (= e!806669 Undefined!11284)))

(assert (= (and d!153355 c!132081) b!1428379))

(assert (= (and d!153355 (not c!132081)) b!1428375))

(assert (= (and b!1428375 c!132083) b!1428378))

(assert (= (and b!1428375 (not c!132083)) b!1428376))

(assert (= (and b!1428376 c!132082) b!1428374))

(assert (= (and b!1428376 (not c!132082)) b!1428377))

(declare-fun m!1318137 () Bool)

(assert (=> b!1428375 m!1318137))

(assert (=> b!1428377 m!1317971))

(declare-fun m!1318139 () Bool)

(assert (=> b!1428377 m!1318139))

(declare-fun m!1318141 () Bool)

(assert (=> d!153355 m!1318141))

(declare-fun m!1318143 () Bool)

(assert (=> d!153355 m!1318143))

(assert (=> d!153355 m!1317987))

(assert (=> d!153355 m!1317971))

(assert (=> d!153355 m!1317989))

(declare-fun m!1318145 () Bool)

(assert (=> d!153355 m!1318145))

(assert (=> d!153355 m!1317971))

(assert (=> d!153355 m!1317987))

(assert (=> d!153355 m!1318001))

(assert (=> b!1428201 d!153355))

(declare-fun d!153363 () Bool)

(assert (=> d!153363 (= (validKeyInArray!0 (select (arr!46978 a!2831) j!81)) (and (not (= (select (arr!46978 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46978 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428211 d!153363))

(declare-fun b!1428390 () Bool)

(declare-fun e!806680 () Bool)

(declare-fun contains!9816 (List!33566 (_ BitVec 64)) Bool)

(assert (=> b!1428390 (= e!806680 (contains!9816 Nil!33563 (select (arr!46978 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428391 () Bool)

(declare-fun e!806679 () Bool)

(declare-fun e!806681 () Bool)

(assert (=> b!1428391 (= e!806679 e!806681)))

(declare-fun res!963207 () Bool)

(assert (=> b!1428391 (=> (not res!963207) (not e!806681))))

(assert (=> b!1428391 (= res!963207 (not e!806680))))

(declare-fun res!963208 () Bool)

(assert (=> b!1428391 (=> (not res!963208) (not e!806680))))

(assert (=> b!1428391 (= res!963208 (validKeyInArray!0 (select (arr!46978 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428392 () Bool)

(declare-fun e!806678 () Bool)

(assert (=> b!1428392 (= e!806681 e!806678)))

(declare-fun c!132086 () Bool)

(assert (=> b!1428392 (= c!132086 (validKeyInArray!0 (select (arr!46978 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428393 () Bool)

(declare-fun call!67371 () Bool)

(assert (=> b!1428393 (= e!806678 call!67371)))

(declare-fun b!1428394 () Bool)

(assert (=> b!1428394 (= e!806678 call!67371)))

(declare-fun bm!67368 () Bool)

(assert (=> bm!67368 (= call!67371 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132086 (Cons!33562 (select (arr!46978 a!2831) #b00000000000000000000000000000000) Nil!33563) Nil!33563)))))

(declare-fun d!153365 () Bool)

(declare-fun res!963206 () Bool)

(assert (=> d!153365 (=> res!963206 e!806679)))

(assert (=> d!153365 (= res!963206 (bvsge #b00000000000000000000000000000000 (size!47530 a!2831)))))

(assert (=> d!153365 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33563) e!806679)))

(assert (= (and d!153365 (not res!963206)) b!1428391))

(assert (= (and b!1428391 res!963208) b!1428390))

(assert (= (and b!1428391 res!963207) b!1428392))

(assert (= (and b!1428392 c!132086) b!1428394))

(assert (= (and b!1428392 (not c!132086)) b!1428393))

(assert (= (or b!1428394 b!1428393) bm!67368))

(assert (=> b!1428390 m!1318105))

(assert (=> b!1428390 m!1318105))

(declare-fun m!1318147 () Bool)

(assert (=> b!1428390 m!1318147))

(assert (=> b!1428391 m!1318105))

(assert (=> b!1428391 m!1318105))

(assert (=> b!1428391 m!1318107))

(assert (=> b!1428392 m!1318105))

(assert (=> b!1428392 m!1318105))

(assert (=> b!1428392 m!1318107))

(assert (=> bm!67368 m!1318105))

(declare-fun m!1318149 () Bool)

(assert (=> bm!67368 m!1318149))

(assert (=> b!1428210 d!153365))

(check-sat (not b!1428342) (not b!1428392) (not d!153343) (not b!1428360) (not d!153337) (not d!153333) (not d!153355) (not b!1428329) (not b!1428331) (not b!1428333) (not bm!67368) (not bm!67365) (not b!1428351) (not b!1428302) (not bm!67364) (not b!1428391) (not b!1428377) (not b!1428300) (not d!153347) (not b!1428390) (not d!153349))
(check-sat)
