; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122118 () Bool)

(assert start!122118)

(declare-fun b!1417092 () Bool)

(declare-fun res!952975 () Bool)

(declare-fun e!802016 () Bool)

(assert (=> b!1417092 (=> (not res!952975) (not e!802016))))

(declare-datatypes ((array!96753 0))(
  ( (array!96754 (arr!46706 (Array (_ BitVec 32) (_ BitVec 64))) (size!47256 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96753)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417092 (= res!952975 (validKeyInArray!0 (select (arr!46706 a!2901) j!112)))))

(declare-fun res!952974 () Bool)

(assert (=> start!122118 (=> (not res!952974) (not e!802016))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122118 (= res!952974 (validMask!0 mask!2840))))

(assert (=> start!122118 e!802016))

(assert (=> start!122118 true))

(declare-fun array_inv!35734 (array!96753) Bool)

(assert (=> start!122118 (array_inv!35734 a!2901)))

(declare-fun b!1417093 () Bool)

(declare-fun res!952970 () Bool)

(assert (=> b!1417093 (=> (not res!952970) (not e!802016))))

(declare-datatypes ((List!33225 0))(
  ( (Nil!33222) (Cons!33221 (h!34511 (_ BitVec 64)) (t!47919 List!33225)) )
))
(declare-fun arrayNoDuplicates!0 (array!96753 (_ BitVec 32) List!33225) Bool)

(assert (=> b!1417093 (= res!952970 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33222))))

(declare-fun b!1417094 () Bool)

(declare-fun res!952971 () Bool)

(assert (=> b!1417094 (=> (not res!952971) (not e!802016))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417094 (= res!952971 (validKeyInArray!0 (select (arr!46706 a!2901) i!1037)))))

(declare-fun b!1417095 () Bool)

(declare-datatypes ((SeekEntryResult!11017 0))(
  ( (MissingZero!11017 (index!46460 (_ BitVec 32))) (Found!11017 (index!46461 (_ BitVec 32))) (Intermediate!11017 (undefined!11829 Bool) (index!46462 (_ BitVec 32)) (x!128062 (_ BitVec 32))) (Undefined!11017) (MissingVacant!11017 (index!46463 (_ BitVec 32))) )
))
(declare-fun lt!625229 () SeekEntryResult!11017)

(assert (=> b!1417095 (= e!802016 (not (is-Intermediate!11017 lt!625229)))))

(declare-fun e!802014 () Bool)

(assert (=> b!1417095 e!802014))

(declare-fun res!952972 () Bool)

(assert (=> b!1417095 (=> (not res!952972) (not e!802014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96753 (_ BitVec 32)) Bool)

(assert (=> b!1417095 (= res!952972 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48008 0))(
  ( (Unit!48009) )
))
(declare-fun lt!625230 () Unit!48008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48008)

(assert (=> b!1417095 (= lt!625230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96753 (_ BitVec 32)) SeekEntryResult!11017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417095 (= lt!625229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46706 a!2901) j!112) mask!2840) (select (arr!46706 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417096 () Bool)

(declare-fun res!952973 () Bool)

(assert (=> b!1417096 (=> (not res!952973) (not e!802016))))

(assert (=> b!1417096 (= res!952973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417097 () Bool)

(declare-fun res!952969 () Bool)

(assert (=> b!1417097 (=> (not res!952969) (not e!802016))))

(assert (=> b!1417097 (= res!952969 (and (= (size!47256 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47256 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47256 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417098 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96753 (_ BitVec 32)) SeekEntryResult!11017)

(assert (=> b!1417098 (= e!802014 (= (seekEntryOrOpen!0 (select (arr!46706 a!2901) j!112) a!2901 mask!2840) (Found!11017 j!112)))))

(assert (= (and start!122118 res!952974) b!1417097))

(assert (= (and b!1417097 res!952969) b!1417094))

(assert (= (and b!1417094 res!952971) b!1417092))

(assert (= (and b!1417092 res!952975) b!1417096))

(assert (= (and b!1417096 res!952973) b!1417093))

(assert (= (and b!1417093 res!952970) b!1417095))

(assert (= (and b!1417095 res!952972) b!1417098))

(declare-fun m!1307883 () Bool)

(assert (=> b!1417098 m!1307883))

(assert (=> b!1417098 m!1307883))

(declare-fun m!1307885 () Bool)

(assert (=> b!1417098 m!1307885))

(assert (=> b!1417095 m!1307883))

(declare-fun m!1307887 () Bool)

(assert (=> b!1417095 m!1307887))

(assert (=> b!1417095 m!1307883))

(declare-fun m!1307889 () Bool)

(assert (=> b!1417095 m!1307889))

(assert (=> b!1417095 m!1307887))

(assert (=> b!1417095 m!1307883))

(declare-fun m!1307891 () Bool)

(assert (=> b!1417095 m!1307891))

(declare-fun m!1307893 () Bool)

(assert (=> b!1417095 m!1307893))

(declare-fun m!1307895 () Bool)

(assert (=> b!1417093 m!1307895))

(declare-fun m!1307897 () Bool)

(assert (=> start!122118 m!1307897))

(declare-fun m!1307899 () Bool)

(assert (=> start!122118 m!1307899))

(declare-fun m!1307901 () Bool)

(assert (=> b!1417094 m!1307901))

(assert (=> b!1417094 m!1307901))

(declare-fun m!1307903 () Bool)

(assert (=> b!1417094 m!1307903))

(assert (=> b!1417092 m!1307883))

(assert (=> b!1417092 m!1307883))

(declare-fun m!1307905 () Bool)

(assert (=> b!1417092 m!1307905))

(declare-fun m!1307907 () Bool)

(assert (=> b!1417096 m!1307907))

(push 1)

(assert (not b!1417096))

(assert (not b!1417093))

(assert (not b!1417092))

(assert (not start!122118))

(assert (not b!1417098))

(assert (not b!1417094))

(assert (not b!1417095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152633 () Bool)

(assert (=> d!152633 (= (validKeyInArray!0 (select (arr!46706 a!2901) i!1037)) (and (not (= (select (arr!46706 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46706 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417094 d!152633))

(declare-fun d!152637 () Bool)

(assert (=> d!152637 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122118 d!152637))

(declare-fun d!152641 () Bool)

(assert (=> d!152641 (= (array_inv!35734 a!2901) (bvsge (size!47256 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122118 d!152641))

(declare-fun d!152645 () Bool)

(declare-fun res!953035 () Bool)

(declare-fun e!802069 () Bool)

(assert (=> d!152645 (=> res!953035 e!802069)))

(assert (=> d!152645 (= res!953035 (bvsge j!112 (size!47256 a!2901)))))

(assert (=> d!152645 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!802069)))

(declare-fun call!67209 () Bool)

(declare-fun bm!67206 () Bool)

(assert (=> bm!67206 (= call!67209 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1417189 () Bool)

(declare-fun e!802067 () Bool)

(assert (=> b!1417189 (= e!802067 call!67209)))

(declare-fun b!1417190 () Bool)

(declare-fun e!802068 () Bool)

(assert (=> b!1417190 (= e!802069 e!802068)))

(declare-fun c!131558 () Bool)

(assert (=> b!1417190 (= c!131558 (validKeyInArray!0 (select (arr!46706 a!2901) j!112)))))

(declare-fun b!1417191 () Bool)

(assert (=> b!1417191 (= e!802068 call!67209)))

(declare-fun b!1417192 () Bool)

(assert (=> b!1417192 (= e!802068 e!802067)))

(declare-fun lt!625267 () (_ BitVec 64))

(assert (=> b!1417192 (= lt!625267 (select (arr!46706 a!2901) j!112))))

(declare-fun lt!625269 () Unit!48008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96753 (_ BitVec 64) (_ BitVec 32)) Unit!48008)

(assert (=> b!1417192 (= lt!625269 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625267 j!112))))

(declare-fun arrayContainsKey!0 (array!96753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417192 (arrayContainsKey!0 a!2901 lt!625267 #b00000000000000000000000000000000)))

(declare-fun lt!625268 () Unit!48008)

(assert (=> b!1417192 (= lt!625268 lt!625269)))

(declare-fun res!953034 () Bool)

(assert (=> b!1417192 (= res!953034 (= (seekEntryOrOpen!0 (select (arr!46706 a!2901) j!112) a!2901 mask!2840) (Found!11017 j!112)))))

(assert (=> b!1417192 (=> (not res!953034) (not e!802067))))

(assert (= (and d!152645 (not res!953035)) b!1417190))

(assert (= (and b!1417190 c!131558) b!1417192))

(assert (= (and b!1417190 (not c!131558)) b!1417191))

(assert (= (and b!1417192 res!953034) b!1417189))

(assert (= (or b!1417189 b!1417191) bm!67206))

(declare-fun m!1307983 () Bool)

(assert (=> bm!67206 m!1307983))

(assert (=> b!1417190 m!1307883))

(assert (=> b!1417190 m!1307883))

(assert (=> b!1417190 m!1307905))

(assert (=> b!1417192 m!1307883))

(declare-fun m!1307985 () Bool)

(assert (=> b!1417192 m!1307985))

(declare-fun m!1307987 () Bool)

(assert (=> b!1417192 m!1307987))

(assert (=> b!1417192 m!1307883))

(assert (=> b!1417192 m!1307885))

(assert (=> b!1417095 d!152645))

(declare-fun d!152653 () Bool)

(assert (=> d!152653 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625272 () Unit!48008)

(declare-fun choose!38 (array!96753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48008)

(assert (=> d!152653 (= lt!625272 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152653 (validMask!0 mask!2840)))

(assert (=> d!152653 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625272)))

(declare-fun bs!41315 () Bool)

(assert (= bs!41315 d!152653))

(assert (=> bs!41315 m!1307893))

(declare-fun m!1307997 () Bool)

(assert (=> bs!41315 m!1307997))

(assert (=> bs!41315 m!1307897))

(assert (=> b!1417095 d!152653))

(declare-fun b!1417254 () Bool)

(declare-fun lt!625304 () SeekEntryResult!11017)

(assert (=> b!1417254 (and (bvsge (index!46462 lt!625304) #b00000000000000000000000000000000) (bvslt (index!46462 lt!625304) (size!47256 a!2901)))))

(declare-fun e!802112 () Bool)

(assert (=> b!1417254 (= e!802112 (= (select (arr!46706 a!2901) (index!46462 lt!625304)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1417255 () Bool)

(declare-fun e!802111 () SeekEntryResult!11017)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417255 (= e!802111 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46706 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46706 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417256 () Bool)

(declare-fun e!802108 () Bool)

(assert (=> b!1417256 (= e!802108 (bvsge (x!128062 lt!625304) #b01111111111111111111111111111110))))

(declare-fun b!1417257 () Bool)

(assert (=> b!1417257 (and (bvsge (index!46462 lt!625304) #b00000000000000000000000000000000) (bvslt (index!46462 lt!625304) (size!47256 a!2901)))))

(declare-fun res!953055 () Bool)

(assert (=> b!1417257 (= res!953055 (= (select (arr!46706 a!2901) (index!46462 lt!625304)) (select (arr!46706 a!2901) j!112)))))

(assert (=> b!1417257 (=> res!953055 e!802112)))

(declare-fun e!802110 () Bool)

(assert (=> b!1417257 (= e!802110 e!802112)))

(declare-fun b!1417259 () Bool)

(assert (=> b!1417259 (= e!802111 (Intermediate!11017 false (toIndex!0 (select (arr!46706 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417260 () Bool)

(declare-fun e!802109 () SeekEntryResult!11017)

(assert (=> b!1417260 (= e!802109 e!802111)))

(declare-fun lt!625305 () (_ BitVec 64))

(declare-fun c!131582 () Bool)

(assert (=> b!1417260 (= c!131582 (or (= lt!625305 (select (arr!46706 a!2901) j!112)) (= (bvadd lt!625305 lt!625305) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1417261 () Bool)

(assert (=> b!1417261 (= e!802109 (Intermediate!11017 true (toIndex!0 (select (arr!46706 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417262 () Bool)

(assert (=> b!1417262 (and (bvsge (index!46462 lt!625304) #b00000000000000000000000000000000) (bvslt (index!46462 lt!625304) (size!47256 a!2901)))))

(declare-fun res!953056 () Bool)

(assert (=> b!1417262 (= res!953056 (= (select (arr!46706 a!2901) (index!46462 lt!625304)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1417262 (=> res!953056 e!802112)))

(declare-fun b!1417258 () Bool)

(assert (=> b!1417258 (= e!802108 e!802110)))

(declare-fun res!953057 () Bool)

(assert (=> b!1417258 (= res!953057 (and (is-Intermediate!11017 lt!625304) (not (undefined!11829 lt!625304)) (bvslt (x!128062 lt!625304) #b01111111111111111111111111111110) (bvsge (x!128062 lt!625304) #b00000000000000000000000000000000) (bvsge (x!128062 lt!625304) #b00000000000000000000000000000000)))))

(assert (=> b!1417258 (=> (not res!953057) (not e!802110))))

(declare-fun d!152657 () Bool)

(assert (=> d!152657 e!802108))

(declare-fun c!131581 () Bool)

(assert (=> d!152657 (= c!131581 (and (is-Intermediate!11017 lt!625304) (undefined!11829 lt!625304)))))

(assert (=> d!152657 (= lt!625304 e!802109)))

(declare-fun c!131580 () Bool)

(assert (=> d!152657 (= c!131580 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152657 (= lt!625305 (select (arr!46706 a!2901) (toIndex!0 (select (arr!46706 a!2901) j!112) mask!2840)))))

(assert (=> d!152657 (validMask!0 mask!2840)))

(assert (=> d!152657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46706 a!2901) j!112) mask!2840) (select (arr!46706 a!2901) j!112) a!2901 mask!2840) lt!625304)))

(assert (= (and d!152657 c!131580) b!1417261))

(assert (= (and d!152657 (not c!131580)) b!1417260))

(assert (= (and b!1417260 c!131582) b!1417259))

(assert (= (and b!1417260 (not c!131582)) b!1417255))

(assert (= (and d!152657 c!131581) b!1417256))

(assert (= (and d!152657 (not c!131581)) b!1417258))

(assert (= (and b!1417258 res!953057) b!1417257))

(assert (= (and b!1417257 (not res!953055)) b!1417262))

(assert (= (and b!1417262 (not res!953056)) b!1417254))

(assert (=> b!1417255 m!1307887))

(declare-fun m!1308031 () Bool)

(assert (=> b!1417255 m!1308031))

(assert (=> b!1417255 m!1308031))

(assert (=> b!1417255 m!1307883))

(declare-fun m!1308033 () Bool)

(assert (=> b!1417255 m!1308033))

(assert (=> d!152657 m!1307887))

(declare-fun m!1308035 () Bool)

(assert (=> d!152657 m!1308035))

(assert (=> d!152657 m!1307897))

(declare-fun m!1308037 () Bool)

(assert (=> b!1417262 m!1308037))

(assert (=> b!1417254 m!1308037))

(assert (=> b!1417257 m!1308037))

(assert (=> b!1417095 d!152657))

(declare-fun d!152673 () Bool)

(declare-fun lt!625318 () (_ BitVec 32))

(declare-fun lt!625317 () (_ BitVec 32))

(assert (=> d!152673 (= lt!625318 (bvmul (bvxor lt!625317 (bvlshr lt!625317 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152673 (= lt!625317 ((_ extract 31 0) (bvand (bvxor (select (arr!46706 a!2901) j!112) (bvlshr (select (arr!46706 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152673 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!953058 (let ((h!34514 ((_ extract 31 0) (bvand (bvxor (select (arr!46706 a!2901) j!112) (bvlshr (select (arr!46706 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128066 (bvmul (bvxor h!34514 (bvlshr h!34514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128066 (bvlshr x!128066 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!953058 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!953058 #b00000000000000000000000000000000))))))

(assert (=> d!152673 (= (toIndex!0 (select (arr!46706 a!2901) j!112) mask!2840) (bvand (bvxor lt!625318 (bvlshr lt!625318 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1417095 d!152673))

(declare-fun d!152677 () Bool)

(declare-fun res!953060 () Bool)

(declare-fun e!802119 () Bool)

(assert (=> d!152677 (=> res!953060 e!802119)))

(assert (=> d!152677 (= res!953060 (bvsge #b00000000000000000000000000000000 (size!47256 a!2901)))))

(assert (=> d!152677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!802119)))

(declare-fun bm!67213 () Bool)

(declare-fun call!67216 () Bool)

(assert (=> bm!67213 (= call!67216 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1417271 () Bool)

(declare-fun e!802117 () Bool)

(assert (=> b!1417271 (= e!802117 call!67216)))

(declare-fun b!1417272 () Bool)

(declare-fun e!802118 () Bool)

(assert (=> b!1417272 (= e!802119 e!802118)))

(declare-fun c!131587 () Bool)

(assert (=> b!1417272 (= c!131587 (validKeyInArray!0 (select (arr!46706 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417273 () Bool)

(assert (=> b!1417273 (= e!802118 call!67216)))

(declare-fun b!1417274 () Bool)

(assert (=> b!1417274 (= e!802118 e!802117)))

(declare-fun lt!625319 () (_ BitVec 64))

(assert (=> b!1417274 (= lt!625319 (select (arr!46706 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625321 () Unit!48008)

(assert (=> b!1417274 (= lt!625321 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625319 #b00000000000000000000000000000000))))

(assert (=> b!1417274 (arrayContainsKey!0 a!2901 lt!625319 #b00000000000000000000000000000000)))

(declare-fun lt!625320 () Unit!48008)

(assert (=> b!1417274 (= lt!625320 lt!625321)))

(declare-fun res!953059 () Bool)

(assert (=> b!1417274 (= res!953059 (= (seekEntryOrOpen!0 (select (arr!46706 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!11017 #b00000000000000000000000000000000)))))

(assert (=> b!1417274 (=> (not res!953059) (not e!802117))))

(assert (= (and d!152677 (not res!953060)) b!1417272))

(assert (= (and b!1417272 c!131587) b!1417274))

(assert (= (and b!1417272 (not c!131587)) b!1417273))

(assert (= (and b!1417274 res!953059) b!1417271))

(assert (= (or b!1417271 b!1417273) bm!67213))

(declare-fun m!1308041 () Bool)

(assert (=> bm!67213 m!1308041))

(declare-fun m!1308043 () Bool)

(assert (=> b!1417272 m!1308043))

(assert (=> b!1417272 m!1308043))

(declare-fun m!1308045 () Bool)

(assert (=> b!1417272 m!1308045))

(assert (=> b!1417274 m!1308043))

(declare-fun m!1308047 () Bool)

(assert (=> b!1417274 m!1308047))

(declare-fun m!1308049 () Bool)

(assert (=> b!1417274 m!1308049))

(assert (=> b!1417274 m!1308043))

(declare-fun m!1308051 () Bool)

(assert (=> b!1417274 m!1308051))

(assert (=> b!1417096 d!152677))

(declare-fun d!152679 () Bool)

(assert (=> d!152679 (= (validKeyInArray!0 (select (arr!46706 a!2901) j!112)) (and (not (= (select (arr!46706 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46706 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417092 d!152679))

(declare-fun d!152681 () Bool)

(declare-fun lt!625342 () SeekEntryResult!11017)

(assert (=> d!152681 (and (or (is-Undefined!11017 lt!625342) (not (is-Found!11017 lt!625342)) (and (bvsge (index!46461 lt!625342) #b00000000000000000000000000000000) (bvslt (index!46461 lt!625342) (size!47256 a!2901)))) (or (is-Undefined!11017 lt!625342) (is-Found!11017 lt!625342) (not (is-MissingZero!11017 lt!625342)) (and (bvsge (index!46460 lt!625342) #b00000000000000000000000000000000) (bvslt (index!46460 lt!625342) (size!47256 a!2901)))) (or (is-Undefined!11017 lt!625342) (is-Found!11017 lt!625342) (is-MissingZero!11017 lt!625342) (not (is-MissingVacant!11017 lt!625342)) (and (bvsge (index!46463 lt!625342) #b00000000000000000000000000000000) (bvslt (index!46463 lt!625342) (size!47256 a!2901)))) (or (is-Undefined!11017 lt!625342) (ite (is-Found!11017 lt!625342) (= (select (arr!46706 a!2901) (index!46461 lt!625342)) (select (arr!46706 a!2901) j!112)) (ite (is-MissingZero!11017 lt!625342) (= (select (arr!46706 a!2901) (index!46460 lt!625342)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11017 lt!625342) (= (select (arr!46706 a!2901) (index!46463 lt!625342)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!802165 () SeekEntryResult!11017)

(assert (=> d!152681 (= lt!625342 e!802165)))

(declare-fun c!131611 () Bool)

(declare-fun lt!625344 () SeekEntryResult!11017)

(assert (=> d!152681 (= c!131611 (and (is-Intermediate!11017 lt!625344) (undefined!11829 lt!625344)))))

(assert (=> d!152681 (= lt!625344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46706 a!2901) j!112) mask!2840) (select (arr!46706 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152681 (validMask!0 mask!2840)))

(assert (=> d!152681 (= (seekEntryOrOpen!0 (select (arr!46706 a!2901) j!112) a!2901 mask!2840) lt!625342)))

(declare-fun b!1417348 () Bool)

(declare-fun e!802164 () SeekEntryResult!11017)

(assert (=> b!1417348 (= e!802164 (MissingZero!11017 (index!46462 lt!625344)))))

(declare-fun b!1417349 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96753 (_ BitVec 32)) SeekEntryResult!11017)

(assert (=> b!1417349 (= e!802164 (seekKeyOrZeroReturnVacant!0 (x!128062 lt!625344) (index!46462 lt!625344) (index!46462 lt!625344) (select (arr!46706 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417350 () Bool)

(declare-fun e!802166 () SeekEntryResult!11017)

(assert (=> b!1417350 (= e!802165 e!802166)))

(declare-fun lt!625343 () (_ BitVec 64))

(assert (=> b!1417350 (= lt!625343 (select (arr!46706 a!2901) (index!46462 lt!625344)))))

(declare-fun c!131613 () Bool)

(assert (=> b!1417350 (= c!131613 (= lt!625343 (select (arr!46706 a!2901) j!112)))))

(declare-fun b!1417351 () Bool)

(assert (=> b!1417351 (= e!802165 Undefined!11017)))

(declare-fun b!1417352 () Bool)

(assert (=> b!1417352 (= e!802166 (Found!11017 (index!46462 lt!625344)))))

(declare-fun b!1417353 () Bool)

(declare-fun c!131612 () Bool)

(assert (=> b!1417353 (= c!131612 (= lt!625343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1417353 (= e!802166 e!802164)))

(assert (= (and d!152681 c!131611) b!1417351))

(assert (= (and d!152681 (not c!131611)) b!1417350))

(assert (= (and b!1417350 c!131613) b!1417352))

(assert (= (and b!1417350 (not c!131613)) b!1417353))

(assert (= (and b!1417353 c!131612) b!1417348))

(assert (= (and b!1417353 (not c!131612)) b!1417349))

(declare-fun m!1308073 () Bool)

(assert (=> d!152681 m!1308073))

(assert (=> d!152681 m!1307897))

(declare-fun m!1308075 () Bool)

(assert (=> d!152681 m!1308075))

(assert (=> d!152681 m!1307883))

(assert (=> d!152681 m!1307887))

(assert (=> d!152681 m!1307887))

(assert (=> d!152681 m!1307883))

(assert (=> d!152681 m!1307891))

(declare-fun m!1308077 () Bool)

(assert (=> d!152681 m!1308077))

(assert (=> b!1417349 m!1307883))

(declare-fun m!1308079 () Bool)

(assert (=> b!1417349 m!1308079))

(declare-fun m!1308081 () Bool)

(assert (=> b!1417350 m!1308081))

(assert (=> b!1417098 d!152681))

(declare-fun d!152693 () Bool)

(declare-fun res!953097 () Bool)

(declare-fun e!802178 () Bool)

(assert (=> d!152693 (=> res!953097 e!802178)))

(assert (=> d!152693 (= res!953097 (bvsge #b00000000000000000000000000000000 (size!47256 a!2901)))))

(assert (=> d!152693 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33222) e!802178)))

(declare-fun b!1417364 () Bool)

(declare-fun e!802177 () Bool)

(declare-fun contains!9829 (List!33225 (_ BitVec 64)) Bool)

(assert (=> b!1417364 (= e!802177 (contains!9829 Nil!33222 (select (arr!46706 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67219 () Bool)

(declare-fun call!67222 () Bool)

(declare-fun c!131616 () Bool)

(assert (=> bm!67219 (= call!67222 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131616 (Cons!33221 (select (arr!46706 a!2901) #b00000000000000000000000000000000) Nil!33222) Nil!33222)))))

(declare-fun b!1417365 () Bool)

(declare-fun e!802176 () Bool)

(declare-fun e!802175 () Bool)

(assert (=> b!1417365 (= e!802176 e!802175)))

(assert (=> b!1417365 (= c!131616 (validKeyInArray!0 (select (arr!46706 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417366 () Bool)

(assert (=> b!1417366 (= e!802175 call!67222)))

(declare-fun b!1417367 () Bool)

(assert (=> b!1417367 (= e!802178 e!802176)))

(declare-fun res!953098 () Bool)

(assert (=> b!1417367 (=> (not res!953098) (not e!802176))))

(assert (=> b!1417367 (= res!953098 (not e!802177))))

(declare-fun res!953096 () Bool)

(assert (=> b!1417367 (=> (not res!953096) (not e!802177))))

(assert (=> b!1417367 (= res!953096 (validKeyInArray!0 (select (arr!46706 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417368 () Bool)

(assert (=> b!1417368 (= e!802175 call!67222)))

(assert (= (and d!152693 (not res!953097)) b!1417367))

(assert (= (and b!1417367 res!953096) b!1417364))

(assert (= (and b!1417367 res!953098) b!1417365))

(assert (= (and b!1417365 c!131616) b!1417366))

(assert (= (and b!1417365 (not c!131616)) b!1417368))

(assert (= (or b!1417366 b!1417368) bm!67219))

(assert (=> b!1417364 m!1308043))

(assert (=> b!1417364 m!1308043))

(declare-fun m!1308083 () Bool)

(assert (=> b!1417364 m!1308083))

(assert (=> bm!67219 m!1308043))

(declare-fun m!1308085 () Bool)

(assert (=> bm!67219 m!1308085))

(assert (=> b!1417365 m!1308043))

(assert (=> b!1417365 m!1308043))

(assert (=> b!1417365 m!1308045))

(assert (=> b!1417367 m!1308043))

(assert (=> b!1417367 m!1308043))

(assert (=> b!1417367 m!1308045))

(assert (=> b!1417093 d!152693))

(push 1)

