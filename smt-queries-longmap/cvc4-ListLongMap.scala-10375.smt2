; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122122 () Bool)

(assert start!122122)

(declare-fun b!1417134 () Bool)

(declare-fun e!802034 () Bool)

(declare-datatypes ((SeekEntryResult!11019 0))(
  ( (MissingZero!11019 (index!46468 (_ BitVec 32))) (Found!11019 (index!46469 (_ BitVec 32))) (Intermediate!11019 (undefined!11831 Bool) (index!46470 (_ BitVec 32)) (x!128064 (_ BitVec 32))) (Undefined!11019) (MissingVacant!11019 (index!46471 (_ BitVec 32))) )
))
(declare-fun lt!625242 () SeekEntryResult!11019)

(assert (=> b!1417134 (= e!802034 (not (is-Intermediate!11019 lt!625242)))))

(declare-fun e!802033 () Bool)

(assert (=> b!1417134 e!802033))

(declare-fun res!953012 () Bool)

(assert (=> b!1417134 (=> (not res!953012) (not e!802033))))

(declare-datatypes ((array!96757 0))(
  ( (array!96758 (arr!46708 (Array (_ BitVec 32) (_ BitVec 64))) (size!47258 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96757)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96757 (_ BitVec 32)) Bool)

(assert (=> b!1417134 (= res!953012 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48012 0))(
  ( (Unit!48013) )
))
(declare-fun lt!625241 () Unit!48012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48012)

(assert (=> b!1417134 (= lt!625241 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96757 (_ BitVec 32)) SeekEntryResult!11019)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417134 (= lt!625242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840) (select (arr!46708 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417135 () Bool)

(declare-fun res!953013 () Bool)

(assert (=> b!1417135 (=> (not res!953013) (not e!802034))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417135 (= res!953013 (and (= (size!47258 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47258 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47258 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417136 () Bool)

(declare-fun res!953011 () Bool)

(assert (=> b!1417136 (=> (not res!953011) (not e!802034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417136 (= res!953011 (validKeyInArray!0 (select (arr!46708 a!2901) i!1037)))))

(declare-fun b!1417137 () Bool)

(declare-fun res!953015 () Bool)

(assert (=> b!1417137 (=> (not res!953015) (not e!802034))))

(assert (=> b!1417137 (= res!953015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!953014 () Bool)

(assert (=> start!122122 (=> (not res!953014) (not e!802034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122122 (= res!953014 (validMask!0 mask!2840))))

(assert (=> start!122122 e!802034))

(assert (=> start!122122 true))

(declare-fun array_inv!35736 (array!96757) Bool)

(assert (=> start!122122 (array_inv!35736 a!2901)))

(declare-fun b!1417138 () Bool)

(declare-fun res!953017 () Bool)

(assert (=> b!1417138 (=> (not res!953017) (not e!802034))))

(assert (=> b!1417138 (= res!953017 (validKeyInArray!0 (select (arr!46708 a!2901) j!112)))))

(declare-fun b!1417139 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96757 (_ BitVec 32)) SeekEntryResult!11019)

(assert (=> b!1417139 (= e!802033 (= (seekEntryOrOpen!0 (select (arr!46708 a!2901) j!112) a!2901 mask!2840) (Found!11019 j!112)))))

(declare-fun b!1417140 () Bool)

(declare-fun res!953016 () Bool)

(assert (=> b!1417140 (=> (not res!953016) (not e!802034))))

(declare-datatypes ((List!33227 0))(
  ( (Nil!33224) (Cons!33223 (h!34513 (_ BitVec 64)) (t!47921 List!33227)) )
))
(declare-fun arrayNoDuplicates!0 (array!96757 (_ BitVec 32) List!33227) Bool)

(assert (=> b!1417140 (= res!953016 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33224))))

(assert (= (and start!122122 res!953014) b!1417135))

(assert (= (and b!1417135 res!953013) b!1417136))

(assert (= (and b!1417136 res!953011) b!1417138))

(assert (= (and b!1417138 res!953017) b!1417137))

(assert (= (and b!1417137 res!953015) b!1417140))

(assert (= (and b!1417140 res!953016) b!1417134))

(assert (= (and b!1417134 res!953012) b!1417139))

(declare-fun m!1307935 () Bool)

(assert (=> b!1417136 m!1307935))

(assert (=> b!1417136 m!1307935))

(declare-fun m!1307937 () Bool)

(assert (=> b!1417136 m!1307937))

(declare-fun m!1307939 () Bool)

(assert (=> b!1417137 m!1307939))

(declare-fun m!1307941 () Bool)

(assert (=> start!122122 m!1307941))

(declare-fun m!1307943 () Bool)

(assert (=> start!122122 m!1307943))

(declare-fun m!1307945 () Bool)

(assert (=> b!1417138 m!1307945))

(assert (=> b!1417138 m!1307945))

(declare-fun m!1307947 () Bool)

(assert (=> b!1417138 m!1307947))

(assert (=> b!1417134 m!1307945))

(declare-fun m!1307949 () Bool)

(assert (=> b!1417134 m!1307949))

(assert (=> b!1417134 m!1307945))

(declare-fun m!1307951 () Bool)

(assert (=> b!1417134 m!1307951))

(assert (=> b!1417134 m!1307949))

(assert (=> b!1417134 m!1307945))

(declare-fun m!1307953 () Bool)

(assert (=> b!1417134 m!1307953))

(declare-fun m!1307955 () Bool)

(assert (=> b!1417134 m!1307955))

(assert (=> b!1417139 m!1307945))

(assert (=> b!1417139 m!1307945))

(declare-fun m!1307957 () Bool)

(assert (=> b!1417139 m!1307957))

(declare-fun m!1307959 () Bool)

(assert (=> b!1417140 m!1307959))

(push 1)

(assert (not b!1417138))

(assert (not b!1417140))

(assert (not start!122122))

(assert (not b!1417137))

(assert (not b!1417134))

(assert (not b!1417139))

(assert (not b!1417136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1417157 () Bool)

(declare-fun e!802047 () Bool)

(declare-fun call!67204 () Bool)

(assert (=> b!1417157 (= e!802047 call!67204)))

(declare-fun b!1417158 () Bool)

(declare-fun e!802046 () Bool)

(assert (=> b!1417158 (= e!802046 call!67204)))

(declare-fun b!1417159 () Bool)

(declare-fun e!802045 () Bool)

(assert (=> b!1417159 (= e!802045 e!802047)))

(declare-fun c!131548 () Bool)

(assert (=> b!1417159 (= c!131548 (validKeyInArray!0 (select (arr!46708 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417160 () Bool)

(assert (=> b!1417160 (= e!802047 e!802046)))

(declare-fun lt!625256 () (_ BitVec 64))

(assert (=> b!1417160 (= lt!625256 (select (arr!46708 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625255 () Unit!48012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96757 (_ BitVec 64) (_ BitVec 32)) Unit!48012)

(assert (=> b!1417160 (= lt!625255 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625256 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417160 (arrayContainsKey!0 a!2901 lt!625256 #b00000000000000000000000000000000)))

(declare-fun lt!625257 () Unit!48012)

(assert (=> b!1417160 (= lt!625257 lt!625255)))

(declare-fun res!953023 () Bool)

(assert (=> b!1417160 (= res!953023 (= (seekEntryOrOpen!0 (select (arr!46708 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!11019 #b00000000000000000000000000000000)))))

(assert (=> b!1417160 (=> (not res!953023) (not e!802046))))

(declare-fun d!152635 () Bool)

(declare-fun res!953022 () Bool)

(assert (=> d!152635 (=> res!953022 e!802045)))

(assert (=> d!152635 (= res!953022 (bvsge #b00000000000000000000000000000000 (size!47258 a!2901)))))

(assert (=> d!152635 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!802045)))

(declare-fun bm!67201 () Bool)

(assert (=> bm!67201 (= call!67204 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152635 (not res!953022)) b!1417159))

(assert (= (and b!1417159 c!131548) b!1417160))

(assert (= (and b!1417159 (not c!131548)) b!1417157))

(assert (= (and b!1417160 res!953023) b!1417158))

(assert (= (or b!1417158 b!1417157) bm!67201))

(declare-fun m!1307961 () Bool)

(assert (=> b!1417159 m!1307961))

(assert (=> b!1417159 m!1307961))

(declare-fun m!1307963 () Bool)

(assert (=> b!1417159 m!1307963))

(assert (=> b!1417160 m!1307961))

(declare-fun m!1307965 () Bool)

(assert (=> b!1417160 m!1307965))

(declare-fun m!1307967 () Bool)

(assert (=> b!1417160 m!1307967))

(assert (=> b!1417160 m!1307961))

(declare-fun m!1307969 () Bool)

(assert (=> b!1417160 m!1307969))

(declare-fun m!1307971 () Bool)

(assert (=> bm!67201 m!1307971))

(assert (=> b!1417137 d!152635))

(declare-fun d!152639 () Bool)

(assert (=> d!152639 (= (validKeyInArray!0 (select (arr!46708 a!2901) j!112)) (and (not (= (select (arr!46708 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46708 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417138 d!152639))

(declare-fun b!1417218 () Bool)

(declare-fun e!802088 () SeekEntryResult!11019)

(declare-fun lt!625287 () SeekEntryResult!11019)

(assert (=> b!1417218 (= e!802088 (Found!11019 (index!46470 lt!625287)))))

(declare-fun b!1417219 () Bool)

(declare-fun c!131568 () Bool)

(declare-fun lt!625286 () (_ BitVec 64))

(assert (=> b!1417219 (= c!131568 (= lt!625286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802086 () SeekEntryResult!11019)

(assert (=> b!1417219 (= e!802088 e!802086)))

(declare-fun b!1417220 () Bool)

(assert (=> b!1417220 (= e!802086 (MissingZero!11019 (index!46470 lt!625287)))))

(declare-fun b!1417221 () Bool)

(declare-fun e!802087 () SeekEntryResult!11019)

(assert (=> b!1417221 (= e!802087 e!802088)))

(assert (=> b!1417221 (= lt!625286 (select (arr!46708 a!2901) (index!46470 lt!625287)))))

(declare-fun c!131569 () Bool)

(assert (=> b!1417221 (= c!131569 (= lt!625286 (select (arr!46708 a!2901) j!112)))))

(declare-fun d!152643 () Bool)

(declare-fun lt!625285 () SeekEntryResult!11019)

(assert (=> d!152643 (and (or (is-Undefined!11019 lt!625285) (not (is-Found!11019 lt!625285)) (and (bvsge (index!46469 lt!625285) #b00000000000000000000000000000000) (bvslt (index!46469 lt!625285) (size!47258 a!2901)))) (or (is-Undefined!11019 lt!625285) (is-Found!11019 lt!625285) (not (is-MissingZero!11019 lt!625285)) (and (bvsge (index!46468 lt!625285) #b00000000000000000000000000000000) (bvslt (index!46468 lt!625285) (size!47258 a!2901)))) (or (is-Undefined!11019 lt!625285) (is-Found!11019 lt!625285) (is-MissingZero!11019 lt!625285) (not (is-MissingVacant!11019 lt!625285)) (and (bvsge (index!46471 lt!625285) #b00000000000000000000000000000000) (bvslt (index!46471 lt!625285) (size!47258 a!2901)))) (or (is-Undefined!11019 lt!625285) (ite (is-Found!11019 lt!625285) (= (select (arr!46708 a!2901) (index!46469 lt!625285)) (select (arr!46708 a!2901) j!112)) (ite (is-MissingZero!11019 lt!625285) (= (select (arr!46708 a!2901) (index!46468 lt!625285)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11019 lt!625285) (= (select (arr!46708 a!2901) (index!46471 lt!625285)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152643 (= lt!625285 e!802087)))

(declare-fun c!131570 () Bool)

(assert (=> d!152643 (= c!131570 (and (is-Intermediate!11019 lt!625287) (undefined!11831 lt!625287)))))

(assert (=> d!152643 (= lt!625287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840) (select (arr!46708 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152643 (validMask!0 mask!2840)))

(assert (=> d!152643 (= (seekEntryOrOpen!0 (select (arr!46708 a!2901) j!112) a!2901 mask!2840) lt!625285)))

(declare-fun b!1417222 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96757 (_ BitVec 32)) SeekEntryResult!11019)

(assert (=> b!1417222 (= e!802086 (seekKeyOrZeroReturnVacant!0 (x!128064 lt!625287) (index!46470 lt!625287) (index!46470 lt!625287) (select (arr!46708 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417223 () Bool)

(assert (=> b!1417223 (= e!802087 Undefined!11019)))

(assert (= (and d!152643 c!131570) b!1417223))

(assert (= (and d!152643 (not c!131570)) b!1417221))

(assert (= (and b!1417221 c!131569) b!1417218))

(assert (= (and b!1417221 (not c!131569)) b!1417219))

(assert (= (and b!1417219 c!131568) b!1417220))

(assert (= (and b!1417219 (not c!131568)) b!1417222))

(declare-fun m!1307999 () Bool)

(assert (=> b!1417221 m!1307999))

(assert (=> d!152643 m!1307949))

(assert (=> d!152643 m!1307945))

(assert (=> d!152643 m!1307953))

(assert (=> d!152643 m!1307941))

(declare-fun m!1308001 () Bool)

(assert (=> d!152643 m!1308001))

(declare-fun m!1308003 () Bool)

(assert (=> d!152643 m!1308003))

(declare-fun m!1308005 () Bool)

(assert (=> d!152643 m!1308005))

(assert (=> d!152643 m!1307945))

(assert (=> d!152643 m!1307949))

(assert (=> b!1417222 m!1307945))

(declare-fun m!1308007 () Bool)

(assert (=> b!1417222 m!1308007))

(assert (=> b!1417139 d!152643))

(declare-fun b!1417228 () Bool)

(declare-fun e!802094 () Bool)

(declare-fun call!67214 () Bool)

(assert (=> b!1417228 (= e!802094 call!67214)))

(declare-fun b!1417229 () Bool)

(declare-fun e!802093 () Bool)

(assert (=> b!1417229 (= e!802093 call!67214)))

(declare-fun b!1417230 () Bool)

(declare-fun e!802092 () Bool)

(assert (=> b!1417230 (= e!802092 e!802094)))

(declare-fun c!131572 () Bool)

(assert (=> b!1417230 (= c!131572 (validKeyInArray!0 (select (arr!46708 a!2901) j!112)))))

(declare-fun b!1417231 () Bool)

(assert (=> b!1417231 (= e!802094 e!802093)))

(declare-fun lt!625292 () (_ BitVec 64))

(assert (=> b!1417231 (= lt!625292 (select (arr!46708 a!2901) j!112))))

(declare-fun lt!625291 () Unit!48012)

(assert (=> b!1417231 (= lt!625291 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625292 j!112))))

(assert (=> b!1417231 (arrayContainsKey!0 a!2901 lt!625292 #b00000000000000000000000000000000)))

(declare-fun lt!625293 () Unit!48012)

(assert (=> b!1417231 (= lt!625293 lt!625291)))

(declare-fun res!953046 () Bool)

(assert (=> b!1417231 (= res!953046 (= (seekEntryOrOpen!0 (select (arr!46708 a!2901) j!112) a!2901 mask!2840) (Found!11019 j!112)))))

(assert (=> b!1417231 (=> (not res!953046) (not e!802093))))

(declare-fun d!152659 () Bool)

(declare-fun res!953045 () Bool)

(assert (=> d!152659 (=> res!953045 e!802092)))

(assert (=> d!152659 (= res!953045 (bvsge j!112 (size!47258 a!2901)))))

(assert (=> d!152659 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!802092)))

(declare-fun bm!67211 () Bool)

(assert (=> bm!67211 (= call!67214 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152659 (not res!953045)) b!1417230))

(assert (= (and b!1417230 c!131572) b!1417231))

(assert (= (and b!1417230 (not c!131572)) b!1417228))

(assert (= (and b!1417231 res!953046) b!1417229))

(assert (= (or b!1417229 b!1417228) bm!67211))

(assert (=> b!1417230 m!1307945))

(assert (=> b!1417230 m!1307945))

(assert (=> b!1417230 m!1307947))

(assert (=> b!1417231 m!1307945))

(declare-fun m!1308015 () Bool)

(assert (=> b!1417231 m!1308015))

(declare-fun m!1308019 () Bool)

(assert (=> b!1417231 m!1308019))

(assert (=> b!1417231 m!1307945))

(assert (=> b!1417231 m!1307957))

(declare-fun m!1308021 () Bool)

(assert (=> bm!67211 m!1308021))

(assert (=> b!1417134 d!152659))

(declare-fun d!152663 () Bool)

(assert (=> d!152663 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625296 () Unit!48012)

(declare-fun choose!38 (array!96757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48012)

(assert (=> d!152663 (= lt!625296 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152663 (validMask!0 mask!2840)))

(assert (=> d!152663 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625296)))

(declare-fun bs!41316 () Bool)

(assert (= bs!41316 d!152663))

(assert (=> bs!41316 m!1307955))

(declare-fun m!1308023 () Bool)

(assert (=> bs!41316 m!1308023))

(assert (=> bs!41316 m!1307941))

(assert (=> b!1417134 d!152663))

(declare-fun b!1417285 () Bool)

(declare-fun e!802130 () SeekEntryResult!11019)

(assert (=> b!1417285 (= e!802130 (Intermediate!11019 false (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417287 () Bool)

(declare-fun lt!625323 () SeekEntryResult!11019)

(assert (=> b!1417287 (and (bvsge (index!46470 lt!625323) #b00000000000000000000000000000000) (bvslt (index!46470 lt!625323) (size!47258 a!2901)))))

(declare-fun res!953069 () Bool)

(assert (=> b!1417287 (= res!953069 (= (select (arr!46708 a!2901) (index!46470 lt!625323)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802126 () Bool)

(assert (=> b!1417287 (=> res!953069 e!802126)))

(declare-fun b!1417288 () Bool)

(declare-fun e!802129 () SeekEntryResult!11019)

(assert (=> b!1417288 (= e!802129 e!802130)))

(declare-fun lt!625322 () (_ BitVec 64))

(declare-fun c!131590 () Bool)

(assert (=> b!1417288 (= c!131590 (or (= lt!625322 (select (arr!46708 a!2901) j!112)) (= (bvadd lt!625322 lt!625322) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1417289 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417289 (= e!802130 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46708 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417290 () Bool)

(assert (=> b!1417290 (and (bvsge (index!46470 lt!625323) #b00000000000000000000000000000000) (bvslt (index!46470 lt!625323) (size!47258 a!2901)))))

(assert (=> b!1417290 (= e!802126 (= (select (arr!46708 a!2901) (index!46470 lt!625323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1417291 () Bool)

(assert (=> b!1417291 (and (bvsge (index!46470 lt!625323) #b00000000000000000000000000000000) (bvslt (index!46470 lt!625323) (size!47258 a!2901)))))

(declare-fun res!953068 () Bool)

(assert (=> b!1417291 (= res!953068 (= (select (arr!46708 a!2901) (index!46470 lt!625323)) (select (arr!46708 a!2901) j!112)))))

(assert (=> b!1417291 (=> res!953068 e!802126)))

(declare-fun e!802127 () Bool)

(assert (=> b!1417291 (= e!802127 e!802126)))

(declare-fun d!152665 () Bool)

(declare-fun e!802128 () Bool)

(assert (=> d!152665 e!802128))

(declare-fun c!131592 () Bool)

(assert (=> d!152665 (= c!131592 (and (is-Intermediate!11019 lt!625323) (undefined!11831 lt!625323)))))

(assert (=> d!152665 (= lt!625323 e!802129)))

(declare-fun c!131591 () Bool)

(assert (=> d!152665 (= c!131591 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152665 (= lt!625322 (select (arr!46708 a!2901) (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840)))))

(assert (=> d!152665 (validMask!0 mask!2840)))

(assert (=> d!152665 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840) (select (arr!46708 a!2901) j!112) a!2901 mask!2840) lt!625323)))

(declare-fun b!1417286 () Bool)

(assert (=> b!1417286 (= e!802128 (bvsge (x!128064 lt!625323) #b01111111111111111111111111111110))))

(declare-fun b!1417292 () Bool)

(assert (=> b!1417292 (= e!802128 e!802127)))

(declare-fun res!953067 () Bool)

(assert (=> b!1417292 (= res!953067 (and (is-Intermediate!11019 lt!625323) (not (undefined!11831 lt!625323)) (bvslt (x!128064 lt!625323) #b01111111111111111111111111111110) (bvsge (x!128064 lt!625323) #b00000000000000000000000000000000) (bvsge (x!128064 lt!625323) #b00000000000000000000000000000000)))))

(assert (=> b!1417292 (=> (not res!953067) (not e!802127))))

(declare-fun b!1417293 () Bool)

(assert (=> b!1417293 (= e!802129 (Intermediate!11019 true (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!152665 c!131591) b!1417293))

(assert (= (and d!152665 (not c!131591)) b!1417288))

(assert (= (and b!1417288 c!131590) b!1417285))

(assert (= (and b!1417288 (not c!131590)) b!1417289))

(assert (= (and d!152665 c!131592) b!1417286))

(assert (= (and d!152665 (not c!131592)) b!1417292))

(assert (= (and b!1417292 res!953067) b!1417291))

(assert (= (and b!1417291 (not res!953068)) b!1417287))

(assert (= (and b!1417287 (not res!953069)) b!1417290))

(assert (=> b!1417289 m!1307949))

(declare-fun m!1308053 () Bool)

(assert (=> b!1417289 m!1308053))

(assert (=> b!1417289 m!1308053))

(assert (=> b!1417289 m!1307945))

(declare-fun m!1308055 () Bool)

(assert (=> b!1417289 m!1308055))

(declare-fun m!1308057 () Bool)

(assert (=> b!1417290 m!1308057))

(assert (=> d!152665 m!1307949))

(declare-fun m!1308059 () Bool)

(assert (=> d!152665 m!1308059))

(assert (=> d!152665 m!1307941))

(assert (=> b!1417291 m!1308057))

(assert (=> b!1417287 m!1308057))

(assert (=> b!1417134 d!152665))

(declare-fun d!152683 () Bool)

(declare-fun lt!625329 () (_ BitVec 32))

(declare-fun lt!625328 () (_ BitVec 32))

(assert (=> d!152683 (= lt!625329 (bvmul (bvxor lt!625328 (bvlshr lt!625328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152683 (= lt!625328 ((_ extract 31 0) (bvand (bvxor (select (arr!46708 a!2901) j!112) (bvlshr (select (arr!46708 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152683 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!953070 (let ((h!34515 ((_ extract 31 0) (bvand (bvxor (select (arr!46708 a!2901) j!112) (bvlshr (select (arr!46708 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128068 (bvmul (bvxor h!34515 (bvlshr h!34515 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128068 (bvlshr x!128068 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!953070 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!953070 #b00000000000000000000000000000000))))))

(assert (=> d!152683 (= (toIndex!0 (select (arr!46708 a!2901) j!112) mask!2840) (bvand (bvxor lt!625329 (bvlshr lt!625329 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1417134 d!152683))

(declare-fun b!1417343 () Bool)

(declare-fun e!802163 () Bool)

(declare-fun contains!9830 (List!33227 (_ BitVec 64)) Bool)

(assert (=> b!1417343 (= e!802163 (contains!9830 Nil!33224 (select (arr!46708 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67216 () Bool)

(declare-fun call!67219 () Bool)

(declare-fun c!131610 () Bool)

(assert (=> bm!67216 (= call!67219 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131610 (Cons!33223 (select (arr!46708 a!2901) #b00000000000000000000000000000000) Nil!33224) Nil!33224)))))

(declare-fun b!1417344 () Bool)

(declare-fun e!802162 () Bool)

(assert (=> b!1417344 (= e!802162 call!67219)))

(declare-fun b!1417345 () Bool)

(declare-fun e!802161 () Bool)

(declare-fun e!802160 () Bool)

(assert (=> b!1417345 (= e!802161 e!802160)))

(declare-fun res!953088 () Bool)

(assert (=> b!1417345 (=> (not res!953088) (not e!802160))))

(assert (=> b!1417345 (= res!953088 (not e!802163))))

(declare-fun res!953087 () Bool)

(assert (=> b!1417345 (=> (not res!953087) (not e!802163))))

(assert (=> b!1417345 (= res!953087 (validKeyInArray!0 (select (arr!46708 a!2901) #b00000000000000000000000000000000)))))

