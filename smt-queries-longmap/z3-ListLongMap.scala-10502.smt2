; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123650 () Bool)

(assert start!123650)

(declare-fun b!1433552 () Bool)

(declare-fun e!809137 () Bool)

(declare-fun e!809135 () Bool)

(assert (=> b!1433552 (= e!809137 e!809135)))

(declare-fun res!967219 () Bool)

(assert (=> b!1433552 (=> (not res!967219) (not e!809135))))

(declare-fun lt!631079 () (_ BitVec 64))

(declare-datatypes ((array!97565 0))(
  ( (array!97566 (arr!47088 (Array (_ BitVec 32) (_ BitVec 64))) (size!47638 (_ BitVec 32))) )
))
(declare-fun lt!631078 () array!97565)

(declare-datatypes ((SeekEntryResult!11367 0))(
  ( (MissingZero!11367 (index!47860 (_ BitVec 32))) (Found!11367 (index!47861 (_ BitVec 32))) (Intermediate!11367 (undefined!12179 Bool) (index!47862 (_ BitVec 32)) (x!129506 (_ BitVec 32))) (Undefined!11367) (MissingVacant!11367 (index!47863 (_ BitVec 32))) )
))
(declare-fun lt!631082 () SeekEntryResult!11367)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97565 (_ BitVec 32)) SeekEntryResult!11367)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433552 (= res!967219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631079 mask!2608) lt!631079 lt!631078 mask!2608) lt!631082))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433552 (= lt!631082 (Intermediate!11367 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97565)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433552 (= lt!631079 (select (store (arr!47088 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433552 (= lt!631078 (array!97566 (store (arr!47088 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47638 a!2831)))))

(declare-fun e!809134 () Bool)

(declare-fun b!1433553 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97565 (_ BitVec 32)) SeekEntryResult!11367)

(assert (=> b!1433553 (= e!809134 (= (seekEntryOrOpen!0 (select (arr!47088 a!2831) j!81) a!2831 mask!2608) (Found!11367 j!81)))))

(declare-fun b!1433554 () Bool)

(declare-fun res!967221 () Bool)

(declare-fun e!809136 () Bool)

(assert (=> b!1433554 (=> (not res!967221) (not e!809136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433554 (= res!967221 (validKeyInArray!0 (select (arr!47088 a!2831) i!982)))))

(declare-fun b!1433555 () Bool)

(declare-fun e!809138 () Bool)

(assert (=> b!1433555 (= e!809135 (not e!809138))))

(declare-fun res!967220 () Bool)

(assert (=> b!1433555 (=> res!967220 e!809138)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1433555 (= res!967220 (or (= (select (arr!47088 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47088 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47088 a!2831) index!585) (select (arr!47088 a!2831) j!81)) (= (select (store (arr!47088 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1433555 e!809134))

(declare-fun res!967222 () Bool)

(assert (=> b!1433555 (=> (not res!967222) (not e!809134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97565 (_ BitVec 32)) Bool)

(assert (=> b!1433555 (= res!967222 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48480 0))(
  ( (Unit!48481) )
))
(declare-fun lt!631081 () Unit!48480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48480)

(assert (=> b!1433555 (= lt!631081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433556 () Bool)

(declare-fun res!967218 () Bool)

(assert (=> b!1433556 (=> (not res!967218) (not e!809135))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1433556 (= res!967218 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631079 lt!631078 mask!2608) lt!631082))))

(declare-fun b!1433557 () Bool)

(declare-fun res!967223 () Bool)

(assert (=> b!1433557 (=> (not res!967223) (not e!809135))))

(declare-fun lt!631083 () SeekEntryResult!11367)

(assert (=> b!1433557 (= res!967223 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47088 a!2831) j!81) a!2831 mask!2608) lt!631083))))

(declare-fun b!1433558 () Bool)

(declare-fun res!967226 () Bool)

(assert (=> b!1433558 (=> (not res!967226) (not e!809136))))

(declare-datatypes ((List!33598 0))(
  ( (Nil!33595) (Cons!33594 (h!34920 (_ BitVec 64)) (t!48292 List!33598)) )
))
(declare-fun arrayNoDuplicates!0 (array!97565 (_ BitVec 32) List!33598) Bool)

(assert (=> b!1433558 (= res!967226 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33595))))

(declare-fun b!1433559 () Bool)

(declare-fun res!967215 () Bool)

(assert (=> b!1433559 (=> (not res!967215) (not e!809136))))

(assert (=> b!1433559 (= res!967215 (validKeyInArray!0 (select (arr!47088 a!2831) j!81)))))

(declare-fun b!1433560 () Bool)

(declare-fun res!967224 () Bool)

(assert (=> b!1433560 (=> (not res!967224) (not e!809136))))

(assert (=> b!1433560 (= res!967224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433561 () Bool)

(assert (=> b!1433561 (= e!809136 e!809137)))

(declare-fun res!967216 () Bool)

(assert (=> b!1433561 (=> (not res!967216) (not e!809137))))

(assert (=> b!1433561 (= res!967216 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47088 a!2831) j!81) mask!2608) (select (arr!47088 a!2831) j!81) a!2831 mask!2608) lt!631083))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433561 (= lt!631083 (Intermediate!11367 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433562 () Bool)

(declare-fun res!967228 () Bool)

(assert (=> b!1433562 (=> (not res!967228) (not e!809136))))

(assert (=> b!1433562 (= res!967228 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47638 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47638 a!2831))))))

(declare-fun res!967227 () Bool)

(assert (=> start!123650 (=> (not res!967227) (not e!809136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123650 (= res!967227 (validMask!0 mask!2608))))

(assert (=> start!123650 e!809136))

(assert (=> start!123650 true))

(declare-fun array_inv!36116 (array!97565) Bool)

(assert (=> start!123650 (array_inv!36116 a!2831)))

(declare-fun b!1433563 () Bool)

(declare-fun res!967225 () Bool)

(assert (=> b!1433563 (=> (not res!967225) (not e!809135))))

(assert (=> b!1433563 (= res!967225 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433564 () Bool)

(declare-fun res!967217 () Bool)

(assert (=> b!1433564 (=> (not res!967217) (not e!809136))))

(assert (=> b!1433564 (= res!967217 (and (= (size!47638 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47638 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47638 a!2831)) (not (= i!982 j!81))))))

(declare-fun lt!631080 () (_ BitVec 32))

(declare-fun b!1433565 () Bool)

(assert (=> b!1433565 (= e!809138 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (and (bvsge lt!631080 #b00000000000000000000000000000000) (bvslt lt!631080 (size!47638 a!2831)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433565 (= lt!631080 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!123650 res!967227) b!1433564))

(assert (= (and b!1433564 res!967217) b!1433554))

(assert (= (and b!1433554 res!967221) b!1433559))

(assert (= (and b!1433559 res!967215) b!1433560))

(assert (= (and b!1433560 res!967224) b!1433558))

(assert (= (and b!1433558 res!967226) b!1433562))

(assert (= (and b!1433562 res!967228) b!1433561))

(assert (= (and b!1433561 res!967216) b!1433552))

(assert (= (and b!1433552 res!967219) b!1433557))

(assert (= (and b!1433557 res!967223) b!1433556))

(assert (= (and b!1433556 res!967218) b!1433563))

(assert (= (and b!1433563 res!967225) b!1433555))

(assert (= (and b!1433555 res!967222) b!1433553))

(assert (= (and b!1433555 (not res!967220)) b!1433565))

(declare-fun m!1323275 () Bool)

(assert (=> b!1433558 m!1323275))

(declare-fun m!1323277 () Bool)

(assert (=> b!1433554 m!1323277))

(assert (=> b!1433554 m!1323277))

(declare-fun m!1323279 () Bool)

(assert (=> b!1433554 m!1323279))

(declare-fun m!1323281 () Bool)

(assert (=> b!1433552 m!1323281))

(assert (=> b!1433552 m!1323281))

(declare-fun m!1323283 () Bool)

(assert (=> b!1433552 m!1323283))

(declare-fun m!1323285 () Bool)

(assert (=> b!1433552 m!1323285))

(declare-fun m!1323287 () Bool)

(assert (=> b!1433552 m!1323287))

(declare-fun m!1323289 () Bool)

(assert (=> b!1433560 m!1323289))

(declare-fun m!1323291 () Bool)

(assert (=> b!1433557 m!1323291))

(assert (=> b!1433557 m!1323291))

(declare-fun m!1323293 () Bool)

(assert (=> b!1433557 m!1323293))

(declare-fun m!1323295 () Bool)

(assert (=> b!1433556 m!1323295))

(declare-fun m!1323297 () Bool)

(assert (=> b!1433565 m!1323297))

(assert (=> b!1433555 m!1323285))

(declare-fun m!1323299 () Bool)

(assert (=> b!1433555 m!1323299))

(declare-fun m!1323301 () Bool)

(assert (=> b!1433555 m!1323301))

(declare-fun m!1323303 () Bool)

(assert (=> b!1433555 m!1323303))

(assert (=> b!1433555 m!1323291))

(declare-fun m!1323305 () Bool)

(assert (=> b!1433555 m!1323305))

(declare-fun m!1323307 () Bool)

(assert (=> start!123650 m!1323307))

(declare-fun m!1323309 () Bool)

(assert (=> start!123650 m!1323309))

(assert (=> b!1433553 m!1323291))

(assert (=> b!1433553 m!1323291))

(declare-fun m!1323311 () Bool)

(assert (=> b!1433553 m!1323311))

(assert (=> b!1433561 m!1323291))

(assert (=> b!1433561 m!1323291))

(declare-fun m!1323313 () Bool)

(assert (=> b!1433561 m!1323313))

(assert (=> b!1433561 m!1323313))

(assert (=> b!1433561 m!1323291))

(declare-fun m!1323315 () Bool)

(assert (=> b!1433561 m!1323315))

(assert (=> b!1433559 m!1323291))

(assert (=> b!1433559 m!1323291))

(declare-fun m!1323317 () Bool)

(assert (=> b!1433559 m!1323317))

(check-sat (not b!1433560) (not b!1433553) (not b!1433557) (not b!1433561) (not b!1433565) (not b!1433555) (not b!1433559) (not b!1433552) (not b!1433556) (not b!1433554) (not b!1433558) (not start!123650))
(check-sat)
(get-model)

(declare-fun b!1433616 () Bool)

(declare-fun e!809164 () Bool)

(declare-fun e!809163 () Bool)

(assert (=> b!1433616 (= e!809164 e!809163)))

(declare-fun c!132669 () Bool)

(assert (=> b!1433616 (= c!132669 (validKeyInArray!0 (select (arr!47088 a!2831) j!81)))))

(declare-fun bm!67498 () Bool)

(declare-fun call!67501 () Bool)

(assert (=> bm!67498 (= call!67501 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433617 () Bool)

(declare-fun e!809165 () Bool)

(assert (=> b!1433617 (= e!809165 call!67501)))

(declare-fun d!154085 () Bool)

(declare-fun res!967275 () Bool)

(assert (=> d!154085 (=> res!967275 e!809164)))

(assert (=> d!154085 (= res!967275 (bvsge j!81 (size!47638 a!2831)))))

(assert (=> d!154085 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809164)))

(declare-fun b!1433618 () Bool)

(assert (=> b!1433618 (= e!809163 call!67501)))

(declare-fun b!1433619 () Bool)

(assert (=> b!1433619 (= e!809163 e!809165)))

(declare-fun lt!631108 () (_ BitVec 64))

(assert (=> b!1433619 (= lt!631108 (select (arr!47088 a!2831) j!81))))

(declare-fun lt!631109 () Unit!48480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97565 (_ BitVec 64) (_ BitVec 32)) Unit!48480)

(assert (=> b!1433619 (= lt!631109 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631108 j!81))))

(declare-fun arrayContainsKey!0 (array!97565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1433619 (arrayContainsKey!0 a!2831 lt!631108 #b00000000000000000000000000000000)))

(declare-fun lt!631110 () Unit!48480)

(assert (=> b!1433619 (= lt!631110 lt!631109)))

(declare-fun res!967276 () Bool)

(assert (=> b!1433619 (= res!967276 (= (seekEntryOrOpen!0 (select (arr!47088 a!2831) j!81) a!2831 mask!2608) (Found!11367 j!81)))))

(assert (=> b!1433619 (=> (not res!967276) (not e!809165))))

(assert (= (and d!154085 (not res!967275)) b!1433616))

(assert (= (and b!1433616 c!132669) b!1433619))

(assert (= (and b!1433616 (not c!132669)) b!1433618))

(assert (= (and b!1433619 res!967276) b!1433617))

(assert (= (or b!1433617 b!1433618) bm!67498))

(assert (=> b!1433616 m!1323291))

(assert (=> b!1433616 m!1323291))

(assert (=> b!1433616 m!1323317))

(declare-fun m!1323363 () Bool)

(assert (=> bm!67498 m!1323363))

(assert (=> b!1433619 m!1323291))

(declare-fun m!1323365 () Bool)

(assert (=> b!1433619 m!1323365))

(declare-fun m!1323367 () Bool)

(assert (=> b!1433619 m!1323367))

(assert (=> b!1433619 m!1323291))

(assert (=> b!1433619 m!1323311))

(assert (=> b!1433555 d!154085))

(declare-fun d!154087 () Bool)

(assert (=> d!154087 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631113 () Unit!48480)

(declare-fun choose!38 (array!97565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48480)

(assert (=> d!154087 (= lt!631113 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154087 (validMask!0 mask!2608)))

(assert (=> d!154087 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631113)))

(declare-fun bs!41744 () Bool)

(assert (= bs!41744 d!154087))

(assert (=> bs!41744 m!1323303))

(declare-fun m!1323369 () Bool)

(assert (=> bs!41744 m!1323369))

(assert (=> bs!41744 m!1323307))

(assert (=> b!1433555 d!154087))

(declare-fun d!154089 () Bool)

(declare-fun lt!631116 () (_ BitVec 32))

(assert (=> d!154089 (and (bvsge lt!631116 #b00000000000000000000000000000000) (bvslt lt!631116 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154089 (= lt!631116 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154089 (validMask!0 mask!2608)))

(assert (=> d!154089 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631116)))

(declare-fun bs!41745 () Bool)

(assert (= bs!41745 d!154089))

(declare-fun m!1323371 () Bool)

(assert (=> bs!41745 m!1323371))

(assert (=> bs!41745 m!1323307))

(assert (=> b!1433565 d!154089))

(declare-fun b!1433638 () Bool)

(declare-fun lt!631121 () SeekEntryResult!11367)

(assert (=> b!1433638 (and (bvsge (index!47862 lt!631121) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631121) (size!47638 lt!631078)))))

(declare-fun e!809180 () Bool)

(assert (=> b!1433638 (= e!809180 (= (select (arr!47088 lt!631078) (index!47862 lt!631121)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433639 () Bool)

(declare-fun e!809176 () SeekEntryResult!11367)

(assert (=> b!1433639 (= e!809176 (Intermediate!11367 true index!585 x!605))))

(declare-fun d!154091 () Bool)

(declare-fun e!809177 () Bool)

(assert (=> d!154091 e!809177))

(declare-fun c!132676 () Bool)

(get-info :version)

(assert (=> d!154091 (= c!132676 (and ((_ is Intermediate!11367) lt!631121) (undefined!12179 lt!631121)))))

(assert (=> d!154091 (= lt!631121 e!809176)))

(declare-fun c!132678 () Bool)

(assert (=> d!154091 (= c!132678 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631122 () (_ BitVec 64))

(assert (=> d!154091 (= lt!631122 (select (arr!47088 lt!631078) index!585))))

(assert (=> d!154091 (validMask!0 mask!2608)))

(assert (=> d!154091 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631079 lt!631078 mask!2608) lt!631121)))

(declare-fun b!1433640 () Bool)

(assert (=> b!1433640 (= e!809177 (bvsge (x!129506 lt!631121) #b01111111111111111111111111111110))))

(declare-fun b!1433641 () Bool)

(declare-fun e!809179 () SeekEntryResult!11367)

(assert (=> b!1433641 (= e!809176 e!809179)))

(declare-fun c!132677 () Bool)

(assert (=> b!1433641 (= c!132677 (or (= lt!631122 lt!631079) (= (bvadd lt!631122 lt!631122) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433642 () Bool)

(assert (=> b!1433642 (and (bvsge (index!47862 lt!631121) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631121) (size!47638 lt!631078)))))

(declare-fun res!967283 () Bool)

(assert (=> b!1433642 (= res!967283 (= (select (arr!47088 lt!631078) (index!47862 lt!631121)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433642 (=> res!967283 e!809180)))

(declare-fun b!1433643 () Bool)

(declare-fun e!809178 () Bool)

(assert (=> b!1433643 (= e!809177 e!809178)))

(declare-fun res!967284 () Bool)

(assert (=> b!1433643 (= res!967284 (and ((_ is Intermediate!11367) lt!631121) (not (undefined!12179 lt!631121)) (bvslt (x!129506 lt!631121) #b01111111111111111111111111111110) (bvsge (x!129506 lt!631121) #b00000000000000000000000000000000) (bvsge (x!129506 lt!631121) x!605)))))

(assert (=> b!1433643 (=> (not res!967284) (not e!809178))))

(declare-fun b!1433644 () Bool)

(assert (=> b!1433644 (= e!809179 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631079 lt!631078 mask!2608))))

(declare-fun b!1433645 () Bool)

(assert (=> b!1433645 (= e!809179 (Intermediate!11367 false index!585 x!605))))

(declare-fun b!1433646 () Bool)

(assert (=> b!1433646 (and (bvsge (index!47862 lt!631121) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631121) (size!47638 lt!631078)))))

(declare-fun res!967285 () Bool)

(assert (=> b!1433646 (= res!967285 (= (select (arr!47088 lt!631078) (index!47862 lt!631121)) lt!631079))))

(assert (=> b!1433646 (=> res!967285 e!809180)))

(assert (=> b!1433646 (= e!809178 e!809180)))

(assert (= (and d!154091 c!132678) b!1433639))

(assert (= (and d!154091 (not c!132678)) b!1433641))

(assert (= (and b!1433641 c!132677) b!1433645))

(assert (= (and b!1433641 (not c!132677)) b!1433644))

(assert (= (and d!154091 c!132676) b!1433640))

(assert (= (and d!154091 (not c!132676)) b!1433643))

(assert (= (and b!1433643 res!967284) b!1433646))

(assert (= (and b!1433646 (not res!967285)) b!1433642))

(assert (= (and b!1433642 (not res!967283)) b!1433638))

(declare-fun m!1323373 () Bool)

(assert (=> d!154091 m!1323373))

(assert (=> d!154091 m!1323307))

(assert (=> b!1433644 m!1323297))

(assert (=> b!1433644 m!1323297))

(declare-fun m!1323375 () Bool)

(assert (=> b!1433644 m!1323375))

(declare-fun m!1323377 () Bool)

(assert (=> b!1433642 m!1323377))

(assert (=> b!1433646 m!1323377))

(assert (=> b!1433638 m!1323377))

(assert (=> b!1433556 d!154091))

(declare-fun b!1433658 () Bool)

(declare-fun e!809189 () Bool)

(declare-fun contains!9869 (List!33598 (_ BitVec 64)) Bool)

(assert (=> b!1433658 (= e!809189 (contains!9869 Nil!33595 (select (arr!47088 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67501 () Bool)

(declare-fun call!67504 () Bool)

(declare-fun c!132681 () Bool)

(assert (=> bm!67501 (= call!67504 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132681 (Cons!33594 (select (arr!47088 a!2831) #b00000000000000000000000000000000) Nil!33595) Nil!33595)))))

(declare-fun b!1433659 () Bool)

(declare-fun e!809191 () Bool)

(declare-fun e!809190 () Bool)

(assert (=> b!1433659 (= e!809191 e!809190)))

(declare-fun res!967292 () Bool)

(assert (=> b!1433659 (=> (not res!967292) (not e!809190))))

(assert (=> b!1433659 (= res!967292 (not e!809189))))

(declare-fun res!967294 () Bool)

(assert (=> b!1433659 (=> (not res!967294) (not e!809189))))

(assert (=> b!1433659 (= res!967294 (validKeyInArray!0 (select (arr!47088 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433660 () Bool)

(declare-fun e!809192 () Bool)

(assert (=> b!1433660 (= e!809192 call!67504)))

(declare-fun b!1433661 () Bool)

(assert (=> b!1433661 (= e!809190 e!809192)))

(assert (=> b!1433661 (= c!132681 (validKeyInArray!0 (select (arr!47088 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!154095 () Bool)

(declare-fun res!967293 () Bool)

(assert (=> d!154095 (=> res!967293 e!809191)))

(assert (=> d!154095 (= res!967293 (bvsge #b00000000000000000000000000000000 (size!47638 a!2831)))))

(assert (=> d!154095 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33595) e!809191)))

(declare-fun b!1433657 () Bool)

(assert (=> b!1433657 (= e!809192 call!67504)))

(assert (= (and d!154095 (not res!967293)) b!1433659))

(assert (= (and b!1433659 res!967294) b!1433658))

(assert (= (and b!1433659 res!967292) b!1433661))

(assert (= (and b!1433661 c!132681) b!1433660))

(assert (= (and b!1433661 (not c!132681)) b!1433657))

(assert (= (or b!1433660 b!1433657) bm!67501))

(declare-fun m!1323379 () Bool)

(assert (=> b!1433658 m!1323379))

(assert (=> b!1433658 m!1323379))

(declare-fun m!1323381 () Bool)

(assert (=> b!1433658 m!1323381))

(assert (=> bm!67501 m!1323379))

(declare-fun m!1323383 () Bool)

(assert (=> bm!67501 m!1323383))

(assert (=> b!1433659 m!1323379))

(assert (=> b!1433659 m!1323379))

(declare-fun m!1323385 () Bool)

(assert (=> b!1433659 m!1323385))

(assert (=> b!1433661 m!1323379))

(assert (=> b!1433661 m!1323379))

(assert (=> b!1433661 m!1323385))

(assert (=> b!1433558 d!154095))

(declare-fun b!1433662 () Bool)

(declare-fun lt!631123 () SeekEntryResult!11367)

(assert (=> b!1433662 (and (bvsge (index!47862 lt!631123) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631123) (size!47638 a!2831)))))

(declare-fun e!809197 () Bool)

(assert (=> b!1433662 (= e!809197 (= (select (arr!47088 a!2831) (index!47862 lt!631123)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433663 () Bool)

(declare-fun e!809193 () SeekEntryResult!11367)

(assert (=> b!1433663 (= e!809193 (Intermediate!11367 true index!585 x!605))))

(declare-fun d!154099 () Bool)

(declare-fun e!809194 () Bool)

(assert (=> d!154099 e!809194))

(declare-fun c!132682 () Bool)

(assert (=> d!154099 (= c!132682 (and ((_ is Intermediate!11367) lt!631123) (undefined!12179 lt!631123)))))

(assert (=> d!154099 (= lt!631123 e!809193)))

(declare-fun c!132684 () Bool)

(assert (=> d!154099 (= c!132684 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631124 () (_ BitVec 64))

(assert (=> d!154099 (= lt!631124 (select (arr!47088 a!2831) index!585))))

(assert (=> d!154099 (validMask!0 mask!2608)))

(assert (=> d!154099 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47088 a!2831) j!81) a!2831 mask!2608) lt!631123)))

(declare-fun b!1433664 () Bool)

(assert (=> b!1433664 (= e!809194 (bvsge (x!129506 lt!631123) #b01111111111111111111111111111110))))

(declare-fun b!1433665 () Bool)

(declare-fun e!809196 () SeekEntryResult!11367)

(assert (=> b!1433665 (= e!809193 e!809196)))

(declare-fun c!132683 () Bool)

(assert (=> b!1433665 (= c!132683 (or (= lt!631124 (select (arr!47088 a!2831) j!81)) (= (bvadd lt!631124 lt!631124) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433666 () Bool)

(assert (=> b!1433666 (and (bvsge (index!47862 lt!631123) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631123) (size!47638 a!2831)))))

(declare-fun res!967295 () Bool)

(assert (=> b!1433666 (= res!967295 (= (select (arr!47088 a!2831) (index!47862 lt!631123)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433666 (=> res!967295 e!809197)))

(declare-fun b!1433667 () Bool)

(declare-fun e!809195 () Bool)

(assert (=> b!1433667 (= e!809194 e!809195)))

(declare-fun res!967296 () Bool)

(assert (=> b!1433667 (= res!967296 (and ((_ is Intermediate!11367) lt!631123) (not (undefined!12179 lt!631123)) (bvslt (x!129506 lt!631123) #b01111111111111111111111111111110) (bvsge (x!129506 lt!631123) #b00000000000000000000000000000000) (bvsge (x!129506 lt!631123) x!605)))))

(assert (=> b!1433667 (=> (not res!967296) (not e!809195))))

(declare-fun b!1433668 () Bool)

(assert (=> b!1433668 (= e!809196 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47088 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433669 () Bool)

(assert (=> b!1433669 (= e!809196 (Intermediate!11367 false index!585 x!605))))

(declare-fun b!1433670 () Bool)

(assert (=> b!1433670 (and (bvsge (index!47862 lt!631123) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631123) (size!47638 a!2831)))))

(declare-fun res!967297 () Bool)

(assert (=> b!1433670 (= res!967297 (= (select (arr!47088 a!2831) (index!47862 lt!631123)) (select (arr!47088 a!2831) j!81)))))

(assert (=> b!1433670 (=> res!967297 e!809197)))

(assert (=> b!1433670 (= e!809195 e!809197)))

(assert (= (and d!154099 c!132684) b!1433663))

(assert (= (and d!154099 (not c!132684)) b!1433665))

(assert (= (and b!1433665 c!132683) b!1433669))

(assert (= (and b!1433665 (not c!132683)) b!1433668))

(assert (= (and d!154099 c!132682) b!1433664))

(assert (= (and d!154099 (not c!132682)) b!1433667))

(assert (= (and b!1433667 res!967296) b!1433670))

(assert (= (and b!1433670 (not res!967297)) b!1433666))

(assert (= (and b!1433666 (not res!967295)) b!1433662))

(assert (=> d!154099 m!1323301))

(assert (=> d!154099 m!1323307))

(assert (=> b!1433668 m!1323297))

(assert (=> b!1433668 m!1323297))

(assert (=> b!1433668 m!1323291))

(declare-fun m!1323387 () Bool)

(assert (=> b!1433668 m!1323387))

(declare-fun m!1323389 () Bool)

(assert (=> b!1433666 m!1323389))

(assert (=> b!1433670 m!1323389))

(assert (=> b!1433662 m!1323389))

(assert (=> b!1433557 d!154099))

(declare-fun d!154101 () Bool)

(assert (=> d!154101 (= (validKeyInArray!0 (select (arr!47088 a!2831) j!81)) (and (not (= (select (arr!47088 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47088 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433559 d!154101))

(declare-fun b!1433671 () Bool)

(declare-fun e!809199 () Bool)

(declare-fun e!809198 () Bool)

(assert (=> b!1433671 (= e!809199 e!809198)))

(declare-fun c!132685 () Bool)

(assert (=> b!1433671 (= c!132685 (validKeyInArray!0 (select (arr!47088 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67502 () Bool)

(declare-fun call!67505 () Bool)

(assert (=> bm!67502 (= call!67505 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433672 () Bool)

(declare-fun e!809200 () Bool)

(assert (=> b!1433672 (= e!809200 call!67505)))

(declare-fun d!154103 () Bool)

(declare-fun res!967298 () Bool)

(assert (=> d!154103 (=> res!967298 e!809199)))

(assert (=> d!154103 (= res!967298 (bvsge #b00000000000000000000000000000000 (size!47638 a!2831)))))

(assert (=> d!154103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809199)))

(declare-fun b!1433673 () Bool)

(assert (=> b!1433673 (= e!809198 call!67505)))

(declare-fun b!1433674 () Bool)

(assert (=> b!1433674 (= e!809198 e!809200)))

(declare-fun lt!631125 () (_ BitVec 64))

(assert (=> b!1433674 (= lt!631125 (select (arr!47088 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631126 () Unit!48480)

(assert (=> b!1433674 (= lt!631126 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631125 #b00000000000000000000000000000000))))

(assert (=> b!1433674 (arrayContainsKey!0 a!2831 lt!631125 #b00000000000000000000000000000000)))

(declare-fun lt!631127 () Unit!48480)

(assert (=> b!1433674 (= lt!631127 lt!631126)))

(declare-fun res!967299 () Bool)

(assert (=> b!1433674 (= res!967299 (= (seekEntryOrOpen!0 (select (arr!47088 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11367 #b00000000000000000000000000000000)))))

(assert (=> b!1433674 (=> (not res!967299) (not e!809200))))

(assert (= (and d!154103 (not res!967298)) b!1433671))

(assert (= (and b!1433671 c!132685) b!1433674))

(assert (= (and b!1433671 (not c!132685)) b!1433673))

(assert (= (and b!1433674 res!967299) b!1433672))

(assert (= (or b!1433672 b!1433673) bm!67502))

(assert (=> b!1433671 m!1323379))

(assert (=> b!1433671 m!1323379))

(assert (=> b!1433671 m!1323385))

(declare-fun m!1323391 () Bool)

(assert (=> bm!67502 m!1323391))

(assert (=> b!1433674 m!1323379))

(declare-fun m!1323393 () Bool)

(assert (=> b!1433674 m!1323393))

(declare-fun m!1323395 () Bool)

(assert (=> b!1433674 m!1323395))

(assert (=> b!1433674 m!1323379))

(declare-fun m!1323397 () Bool)

(assert (=> b!1433674 m!1323397))

(assert (=> b!1433560 d!154103))

(declare-fun b!1433675 () Bool)

(declare-fun lt!631128 () SeekEntryResult!11367)

(assert (=> b!1433675 (and (bvsge (index!47862 lt!631128) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631128) (size!47638 a!2831)))))

(declare-fun e!809205 () Bool)

(assert (=> b!1433675 (= e!809205 (= (select (arr!47088 a!2831) (index!47862 lt!631128)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433676 () Bool)

(declare-fun e!809201 () SeekEntryResult!11367)

(assert (=> b!1433676 (= e!809201 (Intermediate!11367 true (toIndex!0 (select (arr!47088 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154105 () Bool)

(declare-fun e!809202 () Bool)

(assert (=> d!154105 e!809202))

(declare-fun c!132686 () Bool)

(assert (=> d!154105 (= c!132686 (and ((_ is Intermediate!11367) lt!631128) (undefined!12179 lt!631128)))))

(assert (=> d!154105 (= lt!631128 e!809201)))

(declare-fun c!132688 () Bool)

(assert (=> d!154105 (= c!132688 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631129 () (_ BitVec 64))

(assert (=> d!154105 (= lt!631129 (select (arr!47088 a!2831) (toIndex!0 (select (arr!47088 a!2831) j!81) mask!2608)))))

(assert (=> d!154105 (validMask!0 mask!2608)))

(assert (=> d!154105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47088 a!2831) j!81) mask!2608) (select (arr!47088 a!2831) j!81) a!2831 mask!2608) lt!631128)))

(declare-fun b!1433677 () Bool)

(assert (=> b!1433677 (= e!809202 (bvsge (x!129506 lt!631128) #b01111111111111111111111111111110))))

(declare-fun b!1433678 () Bool)

(declare-fun e!809204 () SeekEntryResult!11367)

(assert (=> b!1433678 (= e!809201 e!809204)))

(declare-fun c!132687 () Bool)

(assert (=> b!1433678 (= c!132687 (or (= lt!631129 (select (arr!47088 a!2831) j!81)) (= (bvadd lt!631129 lt!631129) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433679 () Bool)

(assert (=> b!1433679 (and (bvsge (index!47862 lt!631128) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631128) (size!47638 a!2831)))))

(declare-fun res!967300 () Bool)

(assert (=> b!1433679 (= res!967300 (= (select (arr!47088 a!2831) (index!47862 lt!631128)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433679 (=> res!967300 e!809205)))

(declare-fun b!1433680 () Bool)

(declare-fun e!809203 () Bool)

(assert (=> b!1433680 (= e!809202 e!809203)))

(declare-fun res!967301 () Bool)

(assert (=> b!1433680 (= res!967301 (and ((_ is Intermediate!11367) lt!631128) (not (undefined!12179 lt!631128)) (bvslt (x!129506 lt!631128) #b01111111111111111111111111111110) (bvsge (x!129506 lt!631128) #b00000000000000000000000000000000) (bvsge (x!129506 lt!631128) #b00000000000000000000000000000000)))))

(assert (=> b!1433680 (=> (not res!967301) (not e!809203))))

(declare-fun b!1433681 () Bool)

(assert (=> b!1433681 (= e!809204 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47088 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47088 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433682 () Bool)

(assert (=> b!1433682 (= e!809204 (Intermediate!11367 false (toIndex!0 (select (arr!47088 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433683 () Bool)

(assert (=> b!1433683 (and (bvsge (index!47862 lt!631128) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631128) (size!47638 a!2831)))))

(declare-fun res!967302 () Bool)

(assert (=> b!1433683 (= res!967302 (= (select (arr!47088 a!2831) (index!47862 lt!631128)) (select (arr!47088 a!2831) j!81)))))

(assert (=> b!1433683 (=> res!967302 e!809205)))

(assert (=> b!1433683 (= e!809203 e!809205)))

(assert (= (and d!154105 c!132688) b!1433676))

(assert (= (and d!154105 (not c!132688)) b!1433678))

(assert (= (and b!1433678 c!132687) b!1433682))

(assert (= (and b!1433678 (not c!132687)) b!1433681))

(assert (= (and d!154105 c!132686) b!1433677))

(assert (= (and d!154105 (not c!132686)) b!1433680))

(assert (= (and b!1433680 res!967301) b!1433683))

(assert (= (and b!1433683 (not res!967302)) b!1433679))

(assert (= (and b!1433679 (not res!967300)) b!1433675))

(assert (=> d!154105 m!1323313))

(declare-fun m!1323399 () Bool)

(assert (=> d!154105 m!1323399))

(assert (=> d!154105 m!1323307))

(assert (=> b!1433681 m!1323313))

(declare-fun m!1323401 () Bool)

(assert (=> b!1433681 m!1323401))

(assert (=> b!1433681 m!1323401))

(assert (=> b!1433681 m!1323291))

(declare-fun m!1323403 () Bool)

(assert (=> b!1433681 m!1323403))

(declare-fun m!1323405 () Bool)

(assert (=> b!1433679 m!1323405))

(assert (=> b!1433683 m!1323405))

(assert (=> b!1433675 m!1323405))

(assert (=> b!1433561 d!154105))

(declare-fun d!154107 () Bool)

(declare-fun lt!631139 () (_ BitVec 32))

(declare-fun lt!631138 () (_ BitVec 32))

(assert (=> d!154107 (= lt!631139 (bvmul (bvxor lt!631138 (bvlshr lt!631138 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154107 (= lt!631138 ((_ extract 31 0) (bvand (bvxor (select (arr!47088 a!2831) j!81) (bvlshr (select (arr!47088 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154107 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967303 (let ((h!34922 ((_ extract 31 0) (bvand (bvxor (select (arr!47088 a!2831) j!81) (bvlshr (select (arr!47088 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129510 (bvmul (bvxor h!34922 (bvlshr h!34922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129510 (bvlshr x!129510 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967303 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967303 #b00000000000000000000000000000000))))))

(assert (=> d!154107 (= (toIndex!0 (select (arr!47088 a!2831) j!81) mask!2608) (bvand (bvxor lt!631139 (bvlshr lt!631139 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1433561 d!154107))

(declare-fun b!1433702 () Bool)

(declare-fun lt!631140 () SeekEntryResult!11367)

(assert (=> b!1433702 (and (bvsge (index!47862 lt!631140) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631140) (size!47638 lt!631078)))))

(declare-fun e!809220 () Bool)

(assert (=> b!1433702 (= e!809220 (= (select (arr!47088 lt!631078) (index!47862 lt!631140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433703 () Bool)

(declare-fun e!809216 () SeekEntryResult!11367)

(assert (=> b!1433703 (= e!809216 (Intermediate!11367 true (toIndex!0 lt!631079 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154109 () Bool)

(declare-fun e!809217 () Bool)

(assert (=> d!154109 e!809217))

(declare-fun c!132695 () Bool)

(assert (=> d!154109 (= c!132695 (and ((_ is Intermediate!11367) lt!631140) (undefined!12179 lt!631140)))))

(assert (=> d!154109 (= lt!631140 e!809216)))

(declare-fun c!132697 () Bool)

(assert (=> d!154109 (= c!132697 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631141 () (_ BitVec 64))

(assert (=> d!154109 (= lt!631141 (select (arr!47088 lt!631078) (toIndex!0 lt!631079 mask!2608)))))

(assert (=> d!154109 (validMask!0 mask!2608)))

(assert (=> d!154109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631079 mask!2608) lt!631079 lt!631078 mask!2608) lt!631140)))

(declare-fun b!1433704 () Bool)

(assert (=> b!1433704 (= e!809217 (bvsge (x!129506 lt!631140) #b01111111111111111111111111111110))))

(declare-fun b!1433705 () Bool)

(declare-fun e!809219 () SeekEntryResult!11367)

(assert (=> b!1433705 (= e!809216 e!809219)))

(declare-fun c!132696 () Bool)

(assert (=> b!1433705 (= c!132696 (or (= lt!631141 lt!631079) (= (bvadd lt!631141 lt!631141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433706 () Bool)

(assert (=> b!1433706 (and (bvsge (index!47862 lt!631140) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631140) (size!47638 lt!631078)))))

(declare-fun res!967310 () Bool)

(assert (=> b!1433706 (= res!967310 (= (select (arr!47088 lt!631078) (index!47862 lt!631140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433706 (=> res!967310 e!809220)))

(declare-fun b!1433707 () Bool)

(declare-fun e!809218 () Bool)

(assert (=> b!1433707 (= e!809217 e!809218)))

(declare-fun res!967311 () Bool)

(assert (=> b!1433707 (= res!967311 (and ((_ is Intermediate!11367) lt!631140) (not (undefined!12179 lt!631140)) (bvslt (x!129506 lt!631140) #b01111111111111111111111111111110) (bvsge (x!129506 lt!631140) #b00000000000000000000000000000000) (bvsge (x!129506 lt!631140) #b00000000000000000000000000000000)))))

(assert (=> b!1433707 (=> (not res!967311) (not e!809218))))

(declare-fun b!1433708 () Bool)

(assert (=> b!1433708 (= e!809219 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631079 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631079 lt!631078 mask!2608))))

(declare-fun b!1433709 () Bool)

(assert (=> b!1433709 (= e!809219 (Intermediate!11367 false (toIndex!0 lt!631079 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433710 () Bool)

(assert (=> b!1433710 (and (bvsge (index!47862 lt!631140) #b00000000000000000000000000000000) (bvslt (index!47862 lt!631140) (size!47638 lt!631078)))))

(declare-fun res!967312 () Bool)

(assert (=> b!1433710 (= res!967312 (= (select (arr!47088 lt!631078) (index!47862 lt!631140)) lt!631079))))

(assert (=> b!1433710 (=> res!967312 e!809220)))

(assert (=> b!1433710 (= e!809218 e!809220)))

(assert (= (and d!154109 c!132697) b!1433703))

(assert (= (and d!154109 (not c!132697)) b!1433705))

(assert (= (and b!1433705 c!132696) b!1433709))

(assert (= (and b!1433705 (not c!132696)) b!1433708))

(assert (= (and d!154109 c!132695) b!1433704))

(assert (= (and d!154109 (not c!132695)) b!1433707))

(assert (= (and b!1433707 res!967311) b!1433710))

(assert (= (and b!1433710 (not res!967312)) b!1433706))

(assert (= (and b!1433706 (not res!967310)) b!1433702))

(assert (=> d!154109 m!1323281))

(declare-fun m!1323407 () Bool)

(assert (=> d!154109 m!1323407))

(assert (=> d!154109 m!1323307))

(assert (=> b!1433708 m!1323281))

(declare-fun m!1323409 () Bool)

(assert (=> b!1433708 m!1323409))

(assert (=> b!1433708 m!1323409))

(declare-fun m!1323411 () Bool)

(assert (=> b!1433708 m!1323411))

(declare-fun m!1323413 () Bool)

(assert (=> b!1433706 m!1323413))

(assert (=> b!1433710 m!1323413))

(assert (=> b!1433702 m!1323413))

(assert (=> b!1433552 d!154109))

(declare-fun d!154111 () Bool)

(declare-fun lt!631143 () (_ BitVec 32))

(declare-fun lt!631142 () (_ BitVec 32))

(assert (=> d!154111 (= lt!631143 (bvmul (bvxor lt!631142 (bvlshr lt!631142 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154111 (= lt!631142 ((_ extract 31 0) (bvand (bvxor lt!631079 (bvlshr lt!631079 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154111 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967303 (let ((h!34922 ((_ extract 31 0) (bvand (bvxor lt!631079 (bvlshr lt!631079 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129510 (bvmul (bvxor h!34922 (bvlshr h!34922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129510 (bvlshr x!129510 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967303 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967303 #b00000000000000000000000000000000))))))

(assert (=> d!154111 (= (toIndex!0 lt!631079 mask!2608) (bvand (bvxor lt!631143 (bvlshr lt!631143 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1433552 d!154111))

(declare-fun d!154113 () Bool)

(assert (=> d!154113 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123650 d!154113))

(declare-fun d!154119 () Bool)

(assert (=> d!154119 (= (array_inv!36116 a!2831) (bvsge (size!47638 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123650 d!154119))

(declare-fun d!154121 () Bool)

(assert (=> d!154121 (= (validKeyInArray!0 (select (arr!47088 a!2831) i!982)) (and (not (= (select (arr!47088 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47088 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433554 d!154121))

(declare-fun b!1433817 () Bool)

(declare-fun e!809286 () SeekEntryResult!11367)

(declare-fun lt!631176 () SeekEntryResult!11367)

(assert (=> b!1433817 (= e!809286 (Found!11367 (index!47862 lt!631176)))))

(declare-fun b!1433818 () Bool)

(declare-fun e!809284 () SeekEntryResult!11367)

(assert (=> b!1433818 (= e!809284 Undefined!11367)))

(declare-fun b!1433819 () Bool)

(assert (=> b!1433819 (= e!809284 e!809286)))

(declare-fun lt!631175 () (_ BitVec 64))

(assert (=> b!1433819 (= lt!631175 (select (arr!47088 a!2831) (index!47862 lt!631176)))))

(declare-fun c!132739 () Bool)

(assert (=> b!1433819 (= c!132739 (= lt!631175 (select (arr!47088 a!2831) j!81)))))

(declare-fun d!154123 () Bool)

(declare-fun lt!631174 () SeekEntryResult!11367)

(assert (=> d!154123 (and (or ((_ is Undefined!11367) lt!631174) (not ((_ is Found!11367) lt!631174)) (and (bvsge (index!47861 lt!631174) #b00000000000000000000000000000000) (bvslt (index!47861 lt!631174) (size!47638 a!2831)))) (or ((_ is Undefined!11367) lt!631174) ((_ is Found!11367) lt!631174) (not ((_ is MissingZero!11367) lt!631174)) (and (bvsge (index!47860 lt!631174) #b00000000000000000000000000000000) (bvslt (index!47860 lt!631174) (size!47638 a!2831)))) (or ((_ is Undefined!11367) lt!631174) ((_ is Found!11367) lt!631174) ((_ is MissingZero!11367) lt!631174) (not ((_ is MissingVacant!11367) lt!631174)) (and (bvsge (index!47863 lt!631174) #b00000000000000000000000000000000) (bvslt (index!47863 lt!631174) (size!47638 a!2831)))) (or ((_ is Undefined!11367) lt!631174) (ite ((_ is Found!11367) lt!631174) (= (select (arr!47088 a!2831) (index!47861 lt!631174)) (select (arr!47088 a!2831) j!81)) (ite ((_ is MissingZero!11367) lt!631174) (= (select (arr!47088 a!2831) (index!47860 lt!631174)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11367) lt!631174) (= (select (arr!47088 a!2831) (index!47863 lt!631174)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154123 (= lt!631174 e!809284)))

(declare-fun c!132737 () Bool)

(assert (=> d!154123 (= c!132737 (and ((_ is Intermediate!11367) lt!631176) (undefined!12179 lt!631176)))))

(assert (=> d!154123 (= lt!631176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47088 a!2831) j!81) mask!2608) (select (arr!47088 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154123 (validMask!0 mask!2608)))

(assert (=> d!154123 (= (seekEntryOrOpen!0 (select (arr!47088 a!2831) j!81) a!2831 mask!2608) lt!631174)))

(declare-fun b!1433816 () Bool)

(declare-fun e!809285 () SeekEntryResult!11367)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97565 (_ BitVec 32)) SeekEntryResult!11367)

(assert (=> b!1433816 (= e!809285 (seekKeyOrZeroReturnVacant!0 (x!129506 lt!631176) (index!47862 lt!631176) (index!47862 lt!631176) (select (arr!47088 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433820 () Bool)

(assert (=> b!1433820 (= e!809285 (MissingZero!11367 (index!47862 lt!631176)))))

(declare-fun b!1433821 () Bool)

(declare-fun c!132738 () Bool)

(assert (=> b!1433821 (= c!132738 (= lt!631175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433821 (= e!809286 e!809285)))

(assert (= (and d!154123 c!132737) b!1433818))

(assert (= (and d!154123 (not c!132737)) b!1433819))

(assert (= (and b!1433819 c!132739) b!1433817))

(assert (= (and b!1433819 (not c!132739)) b!1433821))

(assert (= (and b!1433821 c!132738) b!1433820))

(assert (= (and b!1433821 (not c!132738)) b!1433816))

(declare-fun m!1323457 () Bool)

(assert (=> b!1433819 m!1323457))

(assert (=> d!154123 m!1323291))

(assert (=> d!154123 m!1323313))

(declare-fun m!1323459 () Bool)

(assert (=> d!154123 m!1323459))

(assert (=> d!154123 m!1323313))

(assert (=> d!154123 m!1323291))

(assert (=> d!154123 m!1323315))

(declare-fun m!1323461 () Bool)

(assert (=> d!154123 m!1323461))

(declare-fun m!1323463 () Bool)

(assert (=> d!154123 m!1323463))

(assert (=> d!154123 m!1323307))

(assert (=> b!1433816 m!1323291))

(declare-fun m!1323465 () Bool)

(assert (=> b!1433816 m!1323465))

(assert (=> b!1433553 d!154123))

(check-sat (not b!1433671) (not b!1433644) (not b!1433619) (not b!1433816) (not bm!67502) (not b!1433659) (not d!154091) (not d!154109) (not d!154123) (not b!1433668) (not bm!67501) (not b!1433674) (not d!154105) (not d!154087) (not d!154099) (not b!1433616) (not b!1433708) (not b!1433661) (not bm!67498) (not d!154089) (not b!1433681) (not b!1433658))
(check-sat)
