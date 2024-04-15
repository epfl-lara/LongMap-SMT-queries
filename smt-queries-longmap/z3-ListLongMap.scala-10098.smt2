; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119042 () Bool)

(assert start!119042)

(declare-fun b!1389181 () Bool)

(declare-fun res!929427 () Bool)

(declare-fun e!786908 () Bool)

(assert (=> b!1389181 (=> (not res!929427) (not e!786908))))

(declare-datatypes ((array!94965 0))(
  ( (array!94966 (arr!45850 (Array (_ BitVec 32) (_ BitVec 64))) (size!46402 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94965)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94965 (_ BitVec 32)) Bool)

(assert (=> b!1389181 (= res!929427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389182 () Bool)

(declare-fun res!929429 () Bool)

(assert (=> b!1389182 (=> (not res!929429) (not e!786908))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389182 (= res!929429 (and (= (size!46402 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46402 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46402 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389183 () Bool)

(declare-fun res!929428 () Bool)

(assert (=> b!1389183 (=> (not res!929428) (not e!786908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389183 (= res!929428 (validKeyInArray!0 (select (arr!45850 a!2901) i!1037)))))

(declare-fun b!1389184 () Bool)

(declare-fun res!929426 () Bool)

(assert (=> b!1389184 (=> (not res!929426) (not e!786908))))

(declare-datatypes ((List!32447 0))(
  ( (Nil!32444) (Cons!32443 (h!33658 (_ BitVec 64)) (t!47133 List!32447)) )
))
(declare-fun arrayNoDuplicates!0 (array!94965 (_ BitVec 32) List!32447) Bool)

(assert (=> b!1389184 (= res!929426 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32444))))

(declare-fun b!1389185 () Bool)

(declare-fun lt!610316 () (_ BitVec 32))

(assert (=> b!1389185 (= e!786908 (and (bvsge mask!2840 #b00000000000000000000000000000000) (or (bvslt lt!610316 #b00000000000000000000000000000000) (bvsge lt!610316 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389185 (= lt!610316 (toIndex!0 (select (arr!45850 a!2901) j!112) mask!2840))))

(declare-fun res!929431 () Bool)

(assert (=> start!119042 (=> (not res!929431) (not e!786908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119042 (= res!929431 (validMask!0 mask!2840))))

(assert (=> start!119042 e!786908))

(assert (=> start!119042 true))

(declare-fun array_inv!35083 (array!94965) Bool)

(assert (=> start!119042 (array_inv!35083 a!2901)))

(declare-fun b!1389186 () Bool)

(declare-fun res!929430 () Bool)

(assert (=> b!1389186 (=> (not res!929430) (not e!786908))))

(assert (=> b!1389186 (= res!929430 (validKeyInArray!0 (select (arr!45850 a!2901) j!112)))))

(assert (= (and start!119042 res!929431) b!1389182))

(assert (= (and b!1389182 res!929429) b!1389183))

(assert (= (and b!1389183 res!929428) b!1389186))

(assert (= (and b!1389186 res!929430) b!1389181))

(assert (= (and b!1389181 res!929427) b!1389184))

(assert (= (and b!1389184 res!929426) b!1389185))

(declare-fun m!1274401 () Bool)

(assert (=> b!1389185 m!1274401))

(assert (=> b!1389185 m!1274401))

(declare-fun m!1274403 () Bool)

(assert (=> b!1389185 m!1274403))

(declare-fun m!1274405 () Bool)

(assert (=> b!1389184 m!1274405))

(declare-fun m!1274407 () Bool)

(assert (=> b!1389181 m!1274407))

(assert (=> b!1389186 m!1274401))

(assert (=> b!1389186 m!1274401))

(declare-fun m!1274409 () Bool)

(assert (=> b!1389186 m!1274409))

(declare-fun m!1274411 () Bool)

(assert (=> start!119042 m!1274411))

(declare-fun m!1274413 () Bool)

(assert (=> start!119042 m!1274413))

(declare-fun m!1274415 () Bool)

(assert (=> b!1389183 m!1274415))

(assert (=> b!1389183 m!1274415))

(declare-fun m!1274417 () Bool)

(assert (=> b!1389183 m!1274417))

(check-sat (not b!1389181) (not b!1389183) (not b!1389186) (not b!1389184) (not start!119042) (not b!1389185))
(check-sat)
(get-model)

(declare-fun d!149989 () Bool)

(declare-fun lt!610328 () (_ BitVec 32))

(declare-fun lt!610327 () (_ BitVec 32))

(assert (=> d!149989 (= lt!610328 (bvmul (bvxor lt!610327 (bvlshr lt!610327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149989 (= lt!610327 ((_ extract 31 0) (bvand (bvxor (select (arr!45850 a!2901) j!112) (bvlshr (select (arr!45850 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149989 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!929468 (let ((h!33661 ((_ extract 31 0) (bvand (bvxor (select (arr!45850 a!2901) j!112) (bvlshr (select (arr!45850 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124839 (bvmul (bvxor h!33661 (bvlshr h!33661 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124839 (bvlshr x!124839 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!929468 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!929468 #b00000000000000000000000000000000))))))

(assert (=> d!149989 (= (toIndex!0 (select (arr!45850 a!2901) j!112) mask!2840) (bvand (bvxor lt!610328 (bvlshr lt!610328 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1389185 d!149989))

(declare-fun d!149991 () Bool)

(assert (=> d!149991 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119042 d!149991))

(declare-fun d!150001 () Bool)

(assert (=> d!150001 (= (array_inv!35083 a!2901) (bvsge (size!46402 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119042 d!150001))

(declare-fun b!1389267 () Bool)

(declare-fun e!786958 () Bool)

(declare-fun contains!9719 (List!32447 (_ BitVec 64)) Bool)

(assert (=> b!1389267 (= e!786958 (contains!9719 Nil!32444 (select (arr!45850 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389268 () Bool)

(declare-fun e!786955 () Bool)

(declare-fun call!66670 () Bool)

(assert (=> b!1389268 (= e!786955 call!66670)))

(declare-fun b!1389269 () Bool)

(declare-fun e!786957 () Bool)

(declare-fun e!786956 () Bool)

(assert (=> b!1389269 (= e!786957 e!786956)))

(declare-fun res!929494 () Bool)

(assert (=> b!1389269 (=> (not res!929494) (not e!786956))))

(assert (=> b!1389269 (= res!929494 (not e!786958))))

(declare-fun res!929495 () Bool)

(assert (=> b!1389269 (=> (not res!929495) (not e!786958))))

(assert (=> b!1389269 (= res!929495 (validKeyInArray!0 (select (arr!45850 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150003 () Bool)

(declare-fun res!929493 () Bool)

(assert (=> d!150003 (=> res!929493 e!786957)))

(assert (=> d!150003 (= res!929493 (bvsge #b00000000000000000000000000000000 (size!46402 a!2901)))))

(assert (=> d!150003 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32444) e!786957)))

(declare-fun bm!66667 () Bool)

(declare-fun c!129333 () Bool)

(assert (=> bm!66667 (= call!66670 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129333 (Cons!32443 (select (arr!45850 a!2901) #b00000000000000000000000000000000) Nil!32444) Nil!32444)))))

(declare-fun b!1389270 () Bool)

(assert (=> b!1389270 (= e!786955 call!66670)))

(declare-fun b!1389271 () Bool)

(assert (=> b!1389271 (= e!786956 e!786955)))

(assert (=> b!1389271 (= c!129333 (validKeyInArray!0 (select (arr!45850 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150003 (not res!929493)) b!1389269))

(assert (= (and b!1389269 res!929495) b!1389267))

(assert (= (and b!1389269 res!929494) b!1389271))

(assert (= (and b!1389271 c!129333) b!1389268))

(assert (= (and b!1389271 (not c!129333)) b!1389270))

(assert (= (or b!1389268 b!1389270) bm!66667))

(declare-fun m!1274479 () Bool)

(assert (=> b!1389267 m!1274479))

(assert (=> b!1389267 m!1274479))

(declare-fun m!1274481 () Bool)

(assert (=> b!1389267 m!1274481))

(assert (=> b!1389269 m!1274479))

(assert (=> b!1389269 m!1274479))

(declare-fun m!1274483 () Bool)

(assert (=> b!1389269 m!1274483))

(assert (=> bm!66667 m!1274479))

(declare-fun m!1274485 () Bool)

(assert (=> bm!66667 m!1274485))

(assert (=> b!1389271 m!1274479))

(assert (=> b!1389271 m!1274479))

(assert (=> b!1389271 m!1274483))

(assert (=> b!1389184 d!150003))

(declare-fun d!150009 () Bool)

(assert (=> d!150009 (= (validKeyInArray!0 (select (arr!45850 a!2901) i!1037)) (and (not (= (select (arr!45850 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45850 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389183 d!150009))

(declare-fun b!1389285 () Bool)

(declare-fun e!786970 () Bool)

(declare-fun e!786971 () Bool)

(assert (=> b!1389285 (= e!786970 e!786971)))

(declare-fun c!129337 () Bool)

(assert (=> b!1389285 (= c!129337 (validKeyInArray!0 (select (arr!45850 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389286 () Bool)

(declare-fun call!66674 () Bool)

(assert (=> b!1389286 (= e!786971 call!66674)))

(declare-fun b!1389287 () Bool)

(declare-fun e!786969 () Bool)

(assert (=> b!1389287 (= e!786969 call!66674)))

(declare-fun d!150011 () Bool)

(declare-fun res!929504 () Bool)

(assert (=> d!150011 (=> res!929504 e!786970)))

(assert (=> d!150011 (= res!929504 (bvsge #b00000000000000000000000000000000 (size!46402 a!2901)))))

(assert (=> d!150011 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786970)))

(declare-fun b!1389288 () Bool)

(assert (=> b!1389288 (= e!786971 e!786969)))

(declare-fun lt!610355 () (_ BitVec 64))

(assert (=> b!1389288 (= lt!610355 (select (arr!45850 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46279 0))(
  ( (Unit!46280) )
))
(declare-fun lt!610353 () Unit!46279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94965 (_ BitVec 64) (_ BitVec 32)) Unit!46279)

(assert (=> b!1389288 (= lt!610353 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610355 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389288 (arrayContainsKey!0 a!2901 lt!610355 #b00000000000000000000000000000000)))

(declare-fun lt!610354 () Unit!46279)

(assert (=> b!1389288 (= lt!610354 lt!610353)))

(declare-fun res!929503 () Bool)

(declare-datatypes ((SeekEntryResult!10201 0))(
  ( (MissingZero!10201 (index!43175 (_ BitVec 32))) (Found!10201 (index!43176 (_ BitVec 32))) (Intermediate!10201 (undefined!11013 Bool) (index!43177 (_ BitVec 32)) (x!124844 (_ BitVec 32))) (Undefined!10201) (MissingVacant!10201 (index!43178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94965 (_ BitVec 32)) SeekEntryResult!10201)

(assert (=> b!1389288 (= res!929503 (= (seekEntryOrOpen!0 (select (arr!45850 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10201 #b00000000000000000000000000000000)))))

(assert (=> b!1389288 (=> (not res!929503) (not e!786969))))

(declare-fun bm!66671 () Bool)

(assert (=> bm!66671 (= call!66674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!150011 (not res!929504)) b!1389285))

(assert (= (and b!1389285 c!129337) b!1389288))

(assert (= (and b!1389285 (not c!129337)) b!1389286))

(assert (= (and b!1389288 res!929503) b!1389287))

(assert (= (or b!1389287 b!1389286) bm!66671))

(assert (=> b!1389285 m!1274479))

(assert (=> b!1389285 m!1274479))

(assert (=> b!1389285 m!1274483))

(assert (=> b!1389288 m!1274479))

(declare-fun m!1274491 () Bool)

(assert (=> b!1389288 m!1274491))

(declare-fun m!1274493 () Bool)

(assert (=> b!1389288 m!1274493))

(assert (=> b!1389288 m!1274479))

(declare-fun m!1274495 () Bool)

(assert (=> b!1389288 m!1274495))

(declare-fun m!1274497 () Bool)

(assert (=> bm!66671 m!1274497))

(assert (=> b!1389181 d!150011))

(declare-fun d!150021 () Bool)

(assert (=> d!150021 (= (validKeyInArray!0 (select (arr!45850 a!2901) j!112)) (and (not (= (select (arr!45850 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45850 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389186 d!150021))

(check-sat (not b!1389285) (not b!1389288) (not bm!66671) (not b!1389271) (not b!1389267) (not bm!66667) (not b!1389269))
(check-sat)
