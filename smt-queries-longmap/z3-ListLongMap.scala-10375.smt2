; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122306 () Bool)

(assert start!122306)

(declare-fun b!1418232 () Bool)

(declare-fun res!953429 () Bool)

(declare-fun e!802752 () Bool)

(assert (=> b!1418232 (=> (not res!953429) (not e!802752))))

(declare-datatypes ((array!96863 0))(
  ( (array!96864 (arr!46759 (Array (_ BitVec 32) (_ BitVec 64))) (size!47310 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96863)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418232 (= res!953429 (validKeyInArray!0 (select (arr!46759 a!2901) j!112)))))

(declare-fun b!1418233 () Bool)

(declare-fun res!953425 () Bool)

(assert (=> b!1418233 (=> (not res!953425) (not e!802752))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1418233 (= res!953425 (validKeyInArray!0 (select (arr!46759 a!2901) i!1037)))))

(declare-fun b!1418234 () Bool)

(declare-fun res!953431 () Bool)

(assert (=> b!1418234 (=> (not res!953431) (not e!802752))))

(declare-datatypes ((List!33265 0))(
  ( (Nil!33262) (Cons!33261 (h!34559 (_ BitVec 64)) (t!47951 List!33265)) )
))
(declare-fun arrayNoDuplicates!0 (array!96863 (_ BitVec 32) List!33265) Bool)

(assert (=> b!1418234 (= res!953431 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33262))))

(declare-fun e!802753 () Bool)

(declare-fun b!1418235 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10973 0))(
  ( (MissingZero!10973 (index!46284 (_ BitVec 32))) (Found!10973 (index!46285 (_ BitVec 32))) (Intermediate!10973 (undefined!11785 Bool) (index!46286 (_ BitVec 32)) (x!128037 (_ BitVec 32))) (Undefined!10973) (MissingVacant!10973 (index!46287 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96863 (_ BitVec 32)) SeekEntryResult!10973)

(assert (=> b!1418235 (= e!802753 (= (seekEntryOrOpen!0 (select (arr!46759 a!2901) j!112) a!2901 mask!2840) (Found!10973 j!112)))))

(declare-fun b!1418236 () Bool)

(declare-fun res!953427 () Bool)

(assert (=> b!1418236 (=> (not res!953427) (not e!802752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96863 (_ BitVec 32)) Bool)

(assert (=> b!1418236 (= res!953427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1418237 () Bool)

(declare-fun res!953428 () Bool)

(assert (=> b!1418237 (=> (not res!953428) (not e!802752))))

(assert (=> b!1418237 (= res!953428 (and (= (size!47310 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47310 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47310 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418238 () Bool)

(declare-fun lt!625628 () SeekEntryResult!10973)

(get-info :version)

(assert (=> b!1418238 (= e!802752 (not ((_ is Intermediate!10973) lt!625628)))))

(assert (=> b!1418238 e!802753))

(declare-fun res!953430 () Bool)

(assert (=> b!1418238 (=> (not res!953430) (not e!802753))))

(assert (=> b!1418238 (= res!953430 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47947 0))(
  ( (Unit!47948) )
))
(declare-fun lt!625627 () Unit!47947)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47947)

(assert (=> b!1418238 (= lt!625627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96863 (_ BitVec 32)) SeekEntryResult!10973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418238 (= lt!625628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46759 a!2901) j!112) mask!2840) (select (arr!46759 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!953426 () Bool)

(assert (=> start!122306 (=> (not res!953426) (not e!802752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122306 (= res!953426 (validMask!0 mask!2840))))

(assert (=> start!122306 e!802752))

(assert (=> start!122306 true))

(declare-fun array_inv!36040 (array!96863) Bool)

(assert (=> start!122306 (array_inv!36040 a!2901)))

(assert (= (and start!122306 res!953426) b!1418237))

(assert (= (and b!1418237 res!953428) b!1418233))

(assert (= (and b!1418233 res!953425) b!1418232))

(assert (= (and b!1418232 res!953429) b!1418236))

(assert (= (and b!1418236 res!953427) b!1418234))

(assert (= (and b!1418234 res!953431) b!1418238))

(assert (= (and b!1418238 res!953430) b!1418235))

(declare-fun m!1309255 () Bool)

(assert (=> b!1418234 m!1309255))

(declare-fun m!1309257 () Bool)

(assert (=> start!122306 m!1309257))

(declare-fun m!1309259 () Bool)

(assert (=> start!122306 m!1309259))

(declare-fun m!1309261 () Bool)

(assert (=> b!1418235 m!1309261))

(assert (=> b!1418235 m!1309261))

(declare-fun m!1309263 () Bool)

(assert (=> b!1418235 m!1309263))

(declare-fun m!1309265 () Bool)

(assert (=> b!1418233 m!1309265))

(assert (=> b!1418233 m!1309265))

(declare-fun m!1309267 () Bool)

(assert (=> b!1418233 m!1309267))

(assert (=> b!1418238 m!1309261))

(declare-fun m!1309269 () Bool)

(assert (=> b!1418238 m!1309269))

(assert (=> b!1418238 m!1309261))

(declare-fun m!1309271 () Bool)

(assert (=> b!1418238 m!1309271))

(assert (=> b!1418238 m!1309269))

(assert (=> b!1418238 m!1309261))

(declare-fun m!1309273 () Bool)

(assert (=> b!1418238 m!1309273))

(declare-fun m!1309275 () Bool)

(assert (=> b!1418238 m!1309275))

(assert (=> b!1418232 m!1309261))

(assert (=> b!1418232 m!1309261))

(declare-fun m!1309277 () Bool)

(assert (=> b!1418232 m!1309277))

(declare-fun m!1309279 () Bool)

(assert (=> b!1418236 m!1309279))

(check-sat (not b!1418235) (not b!1418236) (not start!122306) (not b!1418232) (not b!1418234) (not b!1418233) (not b!1418238))
(check-sat)
(get-model)

(declare-fun b!1418324 () Bool)

(declare-fun c!131906 () Bool)

(declare-fun lt!625661 () (_ BitVec 64))

(assert (=> b!1418324 (= c!131906 (= lt!625661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802805 () SeekEntryResult!10973)

(declare-fun e!802804 () SeekEntryResult!10973)

(assert (=> b!1418324 (= e!802805 e!802804)))

(declare-fun b!1418325 () Bool)

(declare-fun lt!625660 () SeekEntryResult!10973)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96863 (_ BitVec 32)) SeekEntryResult!10973)

(assert (=> b!1418325 (= e!802804 (seekKeyOrZeroReturnVacant!0 (x!128037 lt!625660) (index!46286 lt!625660) (index!46286 lt!625660) (select (arr!46759 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1418326 () Bool)

(assert (=> b!1418326 (= e!802805 (Found!10973 (index!46286 lt!625660)))))

(declare-fun b!1418327 () Bool)

(declare-fun e!802803 () SeekEntryResult!10973)

(assert (=> b!1418327 (= e!802803 Undefined!10973)))

(declare-fun b!1418328 () Bool)

(assert (=> b!1418328 (= e!802803 e!802805)))

(assert (=> b!1418328 (= lt!625661 (select (arr!46759 a!2901) (index!46286 lt!625660)))))

(declare-fun c!131904 () Bool)

(assert (=> b!1418328 (= c!131904 (= lt!625661 (select (arr!46759 a!2901) j!112)))))

(declare-fun d!152975 () Bool)

(declare-fun lt!625659 () SeekEntryResult!10973)

(assert (=> d!152975 (and (or ((_ is Undefined!10973) lt!625659) (not ((_ is Found!10973) lt!625659)) (and (bvsge (index!46285 lt!625659) #b00000000000000000000000000000000) (bvslt (index!46285 lt!625659) (size!47310 a!2901)))) (or ((_ is Undefined!10973) lt!625659) ((_ is Found!10973) lt!625659) (not ((_ is MissingZero!10973) lt!625659)) (and (bvsge (index!46284 lt!625659) #b00000000000000000000000000000000) (bvslt (index!46284 lt!625659) (size!47310 a!2901)))) (or ((_ is Undefined!10973) lt!625659) ((_ is Found!10973) lt!625659) ((_ is MissingZero!10973) lt!625659) (not ((_ is MissingVacant!10973) lt!625659)) (and (bvsge (index!46287 lt!625659) #b00000000000000000000000000000000) (bvslt (index!46287 lt!625659) (size!47310 a!2901)))) (or ((_ is Undefined!10973) lt!625659) (ite ((_ is Found!10973) lt!625659) (= (select (arr!46759 a!2901) (index!46285 lt!625659)) (select (arr!46759 a!2901) j!112)) (ite ((_ is MissingZero!10973) lt!625659) (= (select (arr!46759 a!2901) (index!46284 lt!625659)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10973) lt!625659) (= (select (arr!46759 a!2901) (index!46287 lt!625659)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152975 (= lt!625659 e!802803)))

(declare-fun c!131905 () Bool)

(assert (=> d!152975 (= c!131905 (and ((_ is Intermediate!10973) lt!625660) (undefined!11785 lt!625660)))))

(assert (=> d!152975 (= lt!625660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46759 a!2901) j!112) mask!2840) (select (arr!46759 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152975 (validMask!0 mask!2840)))

(assert (=> d!152975 (= (seekEntryOrOpen!0 (select (arr!46759 a!2901) j!112) a!2901 mask!2840) lt!625659)))

(declare-fun b!1418329 () Bool)

(assert (=> b!1418329 (= e!802804 (MissingZero!10973 (index!46286 lt!625660)))))

(assert (= (and d!152975 c!131905) b!1418327))

(assert (= (and d!152975 (not c!131905)) b!1418328))

(assert (= (and b!1418328 c!131904) b!1418326))

(assert (= (and b!1418328 (not c!131904)) b!1418324))

(assert (= (and b!1418324 c!131906) b!1418329))

(assert (= (and b!1418324 (not c!131906)) b!1418325))

(assert (=> b!1418325 m!1309261))

(declare-fun m!1309359 () Bool)

(assert (=> b!1418325 m!1309359))

(declare-fun m!1309361 () Bool)

(assert (=> b!1418328 m!1309361))

(declare-fun m!1309363 () Bool)

(assert (=> d!152975 m!1309363))

(declare-fun m!1309365 () Bool)

(assert (=> d!152975 m!1309365))

(assert (=> d!152975 m!1309261))

(assert (=> d!152975 m!1309269))

(declare-fun m!1309367 () Bool)

(assert (=> d!152975 m!1309367))

(assert (=> d!152975 m!1309269))

(assert (=> d!152975 m!1309261))

(assert (=> d!152975 m!1309273))

(assert (=> d!152975 m!1309257))

(assert (=> b!1418235 d!152975))

(declare-fun d!152993 () Bool)

(assert (=> d!152993 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122306 d!152993))

(declare-fun d!153001 () Bool)

(assert (=> d!153001 (= (array_inv!36040 a!2901) (bvsge (size!47310 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122306 d!153001))

(declare-fun b!1418370 () Bool)

(declare-fun e!802836 () Bool)

(declare-fun call!67273 () Bool)

(assert (=> b!1418370 (= e!802836 call!67273)))

(declare-fun b!1418371 () Bool)

(declare-fun e!802833 () Bool)

(declare-fun e!802834 () Bool)

(assert (=> b!1418371 (= e!802833 e!802834)))

(declare-fun res!953510 () Bool)

(assert (=> b!1418371 (=> (not res!953510) (not e!802834))))

(declare-fun e!802835 () Bool)

(assert (=> b!1418371 (= res!953510 (not e!802835))))

(declare-fun res!953509 () Bool)

(assert (=> b!1418371 (=> (not res!953509) (not e!802835))))

(assert (=> b!1418371 (= res!953509 (validKeyInArray!0 (select (arr!46759 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1418372 () Bool)

(declare-fun contains!9872 (List!33265 (_ BitVec 64)) Bool)

(assert (=> b!1418372 (= e!802835 (contains!9872 Nil!33262 (select (arr!46759 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1418373 () Bool)

(assert (=> b!1418373 (= e!802836 call!67273)))

(declare-fun bm!67270 () Bool)

(declare-fun c!131918 () Bool)

(assert (=> bm!67270 (= call!67273 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131918 (Cons!33261 (select (arr!46759 a!2901) #b00000000000000000000000000000000) Nil!33262) Nil!33262)))))

(declare-fun b!1418374 () Bool)

(assert (=> b!1418374 (= e!802834 e!802836)))

(assert (=> b!1418374 (= c!131918 (validKeyInArray!0 (select (arr!46759 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!153003 () Bool)

(declare-fun res!953511 () Bool)

(assert (=> d!153003 (=> res!953511 e!802833)))

(assert (=> d!153003 (= res!953511 (bvsge #b00000000000000000000000000000000 (size!47310 a!2901)))))

(assert (=> d!153003 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33262) e!802833)))

(assert (= (and d!153003 (not res!953511)) b!1418371))

(assert (= (and b!1418371 res!953509) b!1418372))

(assert (= (and b!1418371 res!953510) b!1418374))

(assert (= (and b!1418374 c!131918) b!1418370))

(assert (= (and b!1418374 (not c!131918)) b!1418373))

(assert (= (or b!1418370 b!1418373) bm!67270))

(declare-fun m!1309379 () Bool)

(assert (=> b!1418371 m!1309379))

(assert (=> b!1418371 m!1309379))

(declare-fun m!1309381 () Bool)

(assert (=> b!1418371 m!1309381))

(assert (=> b!1418372 m!1309379))

(assert (=> b!1418372 m!1309379))

(declare-fun m!1309383 () Bool)

(assert (=> b!1418372 m!1309383))

(assert (=> bm!67270 m!1309379))

(declare-fun m!1309385 () Bool)

(assert (=> bm!67270 m!1309385))

(assert (=> b!1418374 m!1309379))

(assert (=> b!1418374 m!1309379))

(assert (=> b!1418374 m!1309381))

(assert (=> b!1418234 d!153003))

(declare-fun b!1418410 () Bool)

(declare-fun e!802858 () Bool)

(declare-fun e!802859 () Bool)

(assert (=> b!1418410 (= e!802858 e!802859)))

(declare-fun c!131930 () Bool)

(assert (=> b!1418410 (= c!131930 (validKeyInArray!0 (select (arr!46759 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1418411 () Bool)

(declare-fun e!802860 () Bool)

(assert (=> b!1418411 (= e!802859 e!802860)))

(declare-fun lt!625699 () (_ BitVec 64))

(assert (=> b!1418411 (= lt!625699 (select (arr!46759 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625701 () Unit!47947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96863 (_ BitVec 64) (_ BitVec 32)) Unit!47947)

(assert (=> b!1418411 (= lt!625701 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625699 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418411 (arrayContainsKey!0 a!2901 lt!625699 #b00000000000000000000000000000000)))

(declare-fun lt!625700 () Unit!47947)

(assert (=> b!1418411 (= lt!625700 lt!625701)))

(declare-fun res!953526 () Bool)

(assert (=> b!1418411 (= res!953526 (= (seekEntryOrOpen!0 (select (arr!46759 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10973 #b00000000000000000000000000000000)))))

(assert (=> b!1418411 (=> (not res!953526) (not e!802860))))

(declare-fun d!153005 () Bool)

(declare-fun res!953527 () Bool)

(assert (=> d!153005 (=> res!953527 e!802858)))

(assert (=> d!153005 (= res!953527 (bvsge #b00000000000000000000000000000000 (size!47310 a!2901)))))

(assert (=> d!153005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!802858)))

(declare-fun bm!67273 () Bool)

(declare-fun call!67276 () Bool)

(assert (=> bm!67273 (= call!67276 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1418412 () Bool)

(assert (=> b!1418412 (= e!802860 call!67276)))

(declare-fun b!1418413 () Bool)

(assert (=> b!1418413 (= e!802859 call!67276)))

(assert (= (and d!153005 (not res!953527)) b!1418410))

(assert (= (and b!1418410 c!131930) b!1418411))

(assert (= (and b!1418410 (not c!131930)) b!1418413))

(assert (= (and b!1418411 res!953526) b!1418412))

(assert (= (or b!1418412 b!1418413) bm!67273))

(assert (=> b!1418410 m!1309379))

(assert (=> b!1418410 m!1309379))

(assert (=> b!1418410 m!1309381))

(assert (=> b!1418411 m!1309379))

(declare-fun m!1309395 () Bool)

(assert (=> b!1418411 m!1309395))

(declare-fun m!1309397 () Bool)

(assert (=> b!1418411 m!1309397))

(assert (=> b!1418411 m!1309379))

(declare-fun m!1309399 () Bool)

(assert (=> b!1418411 m!1309399))

(declare-fun m!1309401 () Bool)

(assert (=> bm!67273 m!1309401))

(assert (=> b!1418236 d!153005))

(declare-fun d!153011 () Bool)

(assert (=> d!153011 (= (validKeyInArray!0 (select (arr!46759 a!2901) j!112)) (and (not (= (select (arr!46759 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46759 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418232 d!153011))

(declare-fun d!153013 () Bool)

(assert (=> d!153013 (= (validKeyInArray!0 (select (arr!46759 a!2901) i!1037)) (and (not (= (select (arr!46759 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46759 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418233 d!153013))

(declare-fun b!1418423 () Bool)

(declare-fun e!802866 () Bool)

(declare-fun e!802867 () Bool)

(assert (=> b!1418423 (= e!802866 e!802867)))

(declare-fun c!131934 () Bool)

(assert (=> b!1418423 (= c!131934 (validKeyInArray!0 (select (arr!46759 a!2901) j!112)))))

(declare-fun b!1418424 () Bool)

(declare-fun e!802868 () Bool)

(assert (=> b!1418424 (= e!802867 e!802868)))

(declare-fun lt!625704 () (_ BitVec 64))

(assert (=> b!1418424 (= lt!625704 (select (arr!46759 a!2901) j!112))))

(declare-fun lt!625706 () Unit!47947)

(assert (=> b!1418424 (= lt!625706 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625704 j!112))))

(assert (=> b!1418424 (arrayContainsKey!0 a!2901 lt!625704 #b00000000000000000000000000000000)))

(declare-fun lt!625705 () Unit!47947)

(assert (=> b!1418424 (= lt!625705 lt!625706)))

(declare-fun res!953531 () Bool)

(assert (=> b!1418424 (= res!953531 (= (seekEntryOrOpen!0 (select (arr!46759 a!2901) j!112) a!2901 mask!2840) (Found!10973 j!112)))))

(assert (=> b!1418424 (=> (not res!953531) (not e!802868))))

(declare-fun d!153015 () Bool)

(declare-fun res!953532 () Bool)

(assert (=> d!153015 (=> res!953532 e!802866)))

(assert (=> d!153015 (= res!953532 (bvsge j!112 (size!47310 a!2901)))))

(assert (=> d!153015 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!802866)))

(declare-fun call!67277 () Bool)

(declare-fun bm!67274 () Bool)

(assert (=> bm!67274 (= call!67277 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1418425 () Bool)

(assert (=> b!1418425 (= e!802868 call!67277)))

(declare-fun b!1418426 () Bool)

(assert (=> b!1418426 (= e!802867 call!67277)))

(assert (= (and d!153015 (not res!953532)) b!1418423))

(assert (= (and b!1418423 c!131934) b!1418424))

(assert (= (and b!1418423 (not c!131934)) b!1418426))

(assert (= (and b!1418424 res!953531) b!1418425))

(assert (= (or b!1418425 b!1418426) bm!67274))

(assert (=> b!1418423 m!1309261))

(assert (=> b!1418423 m!1309261))

(assert (=> b!1418423 m!1309277))

(assert (=> b!1418424 m!1309261))

(declare-fun m!1309403 () Bool)

(assert (=> b!1418424 m!1309403))

(declare-fun m!1309405 () Bool)

(assert (=> b!1418424 m!1309405))

(assert (=> b!1418424 m!1309261))

(assert (=> b!1418424 m!1309263))

(declare-fun m!1309407 () Bool)

(assert (=> bm!67274 m!1309407))

(assert (=> b!1418238 d!153015))

(declare-fun d!153017 () Bool)

(assert (=> d!153017 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625713 () Unit!47947)

(declare-fun choose!38 (array!96863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47947)

(assert (=> d!153017 (= lt!625713 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!153017 (validMask!0 mask!2840)))

(assert (=> d!153017 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625713)))

(declare-fun bs!41322 () Bool)

(assert (= bs!41322 d!153017))

(assert (=> bs!41322 m!1309275))

(declare-fun m!1309421 () Bool)

(assert (=> bs!41322 m!1309421))

(assert (=> bs!41322 m!1309257))

(assert (=> b!1418238 d!153017))

(declare-fun b!1418472 () Bool)

(declare-fun e!802897 () SeekEntryResult!10973)

(assert (=> b!1418472 (= e!802897 (Intermediate!10973 false (toIndex!0 (select (arr!46759 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1418473 () Bool)

(declare-fun lt!625726 () SeekEntryResult!10973)

(assert (=> b!1418473 (and (bvsge (index!46286 lt!625726) #b00000000000000000000000000000000) (bvslt (index!46286 lt!625726) (size!47310 a!2901)))))

(declare-fun res!953551 () Bool)

(assert (=> b!1418473 (= res!953551 (= (select (arr!46759 a!2901) (index!46286 lt!625726)) (select (arr!46759 a!2901) j!112)))))

(declare-fun e!802899 () Bool)

(assert (=> b!1418473 (=> res!953551 e!802899)))

(declare-fun e!802901 () Bool)

(assert (=> b!1418473 (= e!802901 e!802899)))

(declare-fun b!1418474 () Bool)

(declare-fun e!802900 () SeekEntryResult!10973)

(assert (=> b!1418474 (= e!802900 e!802897)))

(declare-fun c!131952 () Bool)

(declare-fun lt!625727 () (_ BitVec 64))

(assert (=> b!1418474 (= c!131952 (or (= lt!625727 (select (arr!46759 a!2901) j!112)) (= (bvadd lt!625727 lt!625727) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1418475 () Bool)

(assert (=> b!1418475 (and (bvsge (index!46286 lt!625726) #b00000000000000000000000000000000) (bvslt (index!46286 lt!625726) (size!47310 a!2901)))))

(assert (=> b!1418475 (= e!802899 (= (select (arr!46759 a!2901) (index!46286 lt!625726)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153023 () Bool)

(declare-fun e!802898 () Bool)

(assert (=> d!153023 e!802898))

(declare-fun c!131951 () Bool)

(assert (=> d!153023 (= c!131951 (and ((_ is Intermediate!10973) lt!625726) (undefined!11785 lt!625726)))))

(assert (=> d!153023 (= lt!625726 e!802900)))

(declare-fun c!131950 () Bool)

(assert (=> d!153023 (= c!131950 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153023 (= lt!625727 (select (arr!46759 a!2901) (toIndex!0 (select (arr!46759 a!2901) j!112) mask!2840)))))

(assert (=> d!153023 (validMask!0 mask!2840)))

(assert (=> d!153023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46759 a!2901) j!112) mask!2840) (select (arr!46759 a!2901) j!112) a!2901 mask!2840) lt!625726)))

(declare-fun b!1418476 () Bool)

(assert (=> b!1418476 (= e!802898 e!802901)))

(declare-fun res!953549 () Bool)

(assert (=> b!1418476 (= res!953549 (and ((_ is Intermediate!10973) lt!625726) (not (undefined!11785 lt!625726)) (bvslt (x!128037 lt!625726) #b01111111111111111111111111111110) (bvsge (x!128037 lt!625726) #b00000000000000000000000000000000) (bvsge (x!128037 lt!625726) #b00000000000000000000000000000000)))))

(assert (=> b!1418476 (=> (not res!953549) (not e!802901))))

(declare-fun b!1418477 () Bool)

(assert (=> b!1418477 (= e!802898 (bvsge (x!128037 lt!625726) #b01111111111111111111111111111110))))

(declare-fun b!1418478 () Bool)

(assert (=> b!1418478 (and (bvsge (index!46286 lt!625726) #b00000000000000000000000000000000) (bvslt (index!46286 lt!625726) (size!47310 a!2901)))))

(declare-fun res!953550 () Bool)

(assert (=> b!1418478 (= res!953550 (= (select (arr!46759 a!2901) (index!46286 lt!625726)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1418478 (=> res!953550 e!802899)))

(declare-fun b!1418479 () Bool)

(assert (=> b!1418479 (= e!802900 (Intermediate!10973 true (toIndex!0 (select (arr!46759 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1418480 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418480 (= e!802897 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46759 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46759 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!153023 c!131950) b!1418479))

(assert (= (and d!153023 (not c!131950)) b!1418474))

(assert (= (and b!1418474 c!131952) b!1418472))

(assert (= (and b!1418474 (not c!131952)) b!1418480))

(assert (= (and d!153023 c!131951) b!1418477))

(assert (= (and d!153023 (not c!131951)) b!1418476))

(assert (= (and b!1418476 res!953549) b!1418473))

(assert (= (and b!1418473 (not res!953551)) b!1418478))

(assert (= (and b!1418478 (not res!953550)) b!1418475))

(assert (=> b!1418480 m!1309269))

(declare-fun m!1309425 () Bool)

(assert (=> b!1418480 m!1309425))

(assert (=> b!1418480 m!1309425))

(assert (=> b!1418480 m!1309261))

(declare-fun m!1309429 () Bool)

(assert (=> b!1418480 m!1309429))

(declare-fun m!1309431 () Bool)

(assert (=> b!1418475 m!1309431))

(assert (=> d!153023 m!1309269))

(declare-fun m!1309435 () Bool)

(assert (=> d!153023 m!1309435))

(assert (=> d!153023 m!1309257))

(assert (=> b!1418473 m!1309431))

(assert (=> b!1418478 m!1309431))

(assert (=> b!1418238 d!153023))

(declare-fun d!153033 () Bool)

(declare-fun lt!625745 () (_ BitVec 32))

(declare-fun lt!625744 () (_ BitVec 32))

(assert (=> d!153033 (= lt!625745 (bvmul (bvxor lt!625744 (bvlshr lt!625744 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153033 (= lt!625744 ((_ extract 31 0) (bvand (bvxor (select (arr!46759 a!2901) j!112) (bvlshr (select (arr!46759 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153033 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!953554 (let ((h!34564 ((_ extract 31 0) (bvand (bvxor (select (arr!46759 a!2901) j!112) (bvlshr (select (arr!46759 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128045 (bvmul (bvxor h!34564 (bvlshr h!34564 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128045 (bvlshr x!128045 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!953554 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!953554 #b00000000000000000000000000000000))))))

(assert (=> d!153033 (= (toIndex!0 (select (arr!46759 a!2901) j!112) mask!2840) (bvand (bvxor lt!625745 (bvlshr lt!625745 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1418238 d!153033))

(check-sat (not bm!67274) (not b!1418423) (not b!1418424) (not b!1418410) (not b!1418374) (not b!1418325) (not bm!67270) (not d!153023) (not b!1418411) (not d!152975) (not b!1418372) (not bm!67273) (not b!1418371) (not d!153017) (not b!1418480))
(check-sat)
