; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119048 () Bool)

(assert start!119048)

(declare-fun b!1389280 () Bool)

(declare-fun res!929479 () Bool)

(declare-fun e!786953 () Bool)

(assert (=> b!1389280 (=> (not res!929479) (not e!786953))))

(declare-datatypes ((array!95018 0))(
  ( (array!95019 (arr!45876 (Array (_ BitVec 32) (_ BitVec 64))) (size!46426 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95018)

(declare-datatypes ((List!32395 0))(
  ( (Nil!32392) (Cons!32391 (h!33606 (_ BitVec 64)) (t!47089 List!32395)) )
))
(declare-fun arrayNoDuplicates!0 (array!95018 (_ BitVec 32) List!32395) Bool)

(assert (=> b!1389280 (= res!929479 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32392))))

(declare-fun b!1389281 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!610509 () (_ BitVec 32))

(assert (=> b!1389281 (= e!786953 (and (bvsge mask!2840 #b00000000000000000000000000000000) (or (bvslt lt!610509 #b00000000000000000000000000000000) (bvsge lt!610509 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389281 (= lt!610509 (toIndex!0 (select (arr!45876 a!2901) j!112) mask!2840))))

(declare-fun b!1389282 () Bool)

(declare-fun res!929476 () Bool)

(assert (=> b!1389282 (=> (not res!929476) (not e!786953))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389282 (= res!929476 (and (= (size!46426 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46426 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46426 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389283 () Bool)

(declare-fun res!929477 () Bool)

(assert (=> b!1389283 (=> (not res!929477) (not e!786953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389283 (= res!929477 (validKeyInArray!0 (select (arr!45876 a!2901) i!1037)))))

(declare-fun res!929478 () Bool)

(assert (=> start!119048 (=> (not res!929478) (not e!786953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119048 (= res!929478 (validMask!0 mask!2840))))

(assert (=> start!119048 e!786953))

(assert (=> start!119048 true))

(declare-fun array_inv!34904 (array!95018) Bool)

(assert (=> start!119048 (array_inv!34904 a!2901)))

(declare-fun b!1389284 () Bool)

(declare-fun res!929474 () Bool)

(assert (=> b!1389284 (=> (not res!929474) (not e!786953))))

(assert (=> b!1389284 (= res!929474 (validKeyInArray!0 (select (arr!45876 a!2901) j!112)))))

(declare-fun b!1389285 () Bool)

(declare-fun res!929475 () Bool)

(assert (=> b!1389285 (=> (not res!929475) (not e!786953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95018 (_ BitVec 32)) Bool)

(assert (=> b!1389285 (= res!929475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119048 res!929478) b!1389282))

(assert (= (and b!1389282 res!929476) b!1389283))

(assert (= (and b!1389283 res!929477) b!1389284))

(assert (= (and b!1389284 res!929474) b!1389285))

(assert (= (and b!1389285 res!929475) b!1389280))

(assert (= (and b!1389280 res!929479) b!1389281))

(declare-fun m!1274955 () Bool)

(assert (=> b!1389281 m!1274955))

(assert (=> b!1389281 m!1274955))

(declare-fun m!1274957 () Bool)

(assert (=> b!1389281 m!1274957))

(declare-fun m!1274959 () Bool)

(assert (=> b!1389280 m!1274959))

(declare-fun m!1274961 () Bool)

(assert (=> b!1389283 m!1274961))

(assert (=> b!1389283 m!1274961))

(declare-fun m!1274963 () Bool)

(assert (=> b!1389283 m!1274963))

(declare-fun m!1274965 () Bool)

(assert (=> b!1389285 m!1274965))

(declare-fun m!1274967 () Bool)

(assert (=> start!119048 m!1274967))

(declare-fun m!1274969 () Bool)

(assert (=> start!119048 m!1274969))

(assert (=> b!1389284 m!1274955))

(assert (=> b!1389284 m!1274955))

(declare-fun m!1274971 () Bool)

(assert (=> b!1389284 m!1274971))

(check-sat (not b!1389285) (not b!1389280) (not b!1389283) (not b!1389284) (not start!119048) (not b!1389281))
(check-sat)
(get-model)

(declare-fun d!150115 () Bool)

(assert (=> d!150115 (= (validKeyInArray!0 (select (arr!45876 a!2901) j!112)) (and (not (= (select (arr!45876 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45876 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389284 d!150115))

(declare-fun d!150117 () Bool)

(assert (=> d!150117 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119048 d!150117))

(declare-fun d!150125 () Bool)

(assert (=> d!150125 (= (array_inv!34904 a!2901) (bvsge (size!46426 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119048 d!150125))

(declare-fun d!150127 () Bool)

(assert (=> d!150127 (= (validKeyInArray!0 (select (arr!45876 a!2901) i!1037)) (and (not (= (select (arr!45876 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45876 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389283 d!150127))

(declare-fun d!150129 () Bool)

(declare-fun lt!610524 () (_ BitVec 32))

(declare-fun lt!610523 () (_ BitVec 32))

(assert (=> d!150129 (= lt!610524 (bvmul (bvxor lt!610523 (bvlshr lt!610523 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150129 (= lt!610523 ((_ extract 31 0) (bvand (bvxor (select (arr!45876 a!2901) j!112) (bvlshr (select (arr!45876 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150129 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!929498 (let ((h!33608 ((_ extract 31 0) (bvand (bvxor (select (arr!45876 a!2901) j!112) (bvlshr (select (arr!45876 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124841 (bvmul (bvxor h!33608 (bvlshr h!33608 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124841 (bvlshr x!124841 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!929498 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!929498 #b00000000000000000000000000000000))))))

(assert (=> d!150129 (= (toIndex!0 (select (arr!45876 a!2901) j!112) mask!2840) (bvand (bvxor lt!610524 (bvlshr lt!610524 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1389281 d!150129))

(declare-fun bm!66685 () Bool)

(declare-fun call!66688 () Bool)

(assert (=> bm!66685 (= call!66688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1389339 () Bool)

(declare-fun e!786988 () Bool)

(assert (=> b!1389339 (= e!786988 call!66688)))

(declare-fun b!1389340 () Bool)

(declare-fun e!786989 () Bool)

(assert (=> b!1389340 (= e!786988 e!786989)))

(declare-fun lt!610534 () (_ BitVec 64))

(assert (=> b!1389340 (= lt!610534 (select (arr!45876 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46430 0))(
  ( (Unit!46431) )
))
(declare-fun lt!610535 () Unit!46430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95018 (_ BitVec 64) (_ BitVec 32)) Unit!46430)

(assert (=> b!1389340 (= lt!610535 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610534 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389340 (arrayContainsKey!0 a!2901 lt!610534 #b00000000000000000000000000000000)))

(declare-fun lt!610536 () Unit!46430)

(assert (=> b!1389340 (= lt!610536 lt!610535)))

(declare-fun res!929518 () Bool)

(declare-datatypes ((SeekEntryResult!10198 0))(
  ( (MissingZero!10198 (index!43163 (_ BitVec 32))) (Found!10198 (index!43164 (_ BitVec 32))) (Intermediate!10198 (undefined!11010 Bool) (index!43165 (_ BitVec 32)) (x!124844 (_ BitVec 32))) (Undefined!10198) (MissingVacant!10198 (index!43166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95018 (_ BitVec 32)) SeekEntryResult!10198)

(assert (=> b!1389340 (= res!929518 (= (seekEntryOrOpen!0 (select (arr!45876 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10198 #b00000000000000000000000000000000)))))

(assert (=> b!1389340 (=> (not res!929518) (not e!786989))))

(declare-fun b!1389341 () Bool)

(declare-fun e!786987 () Bool)

(assert (=> b!1389341 (= e!786987 e!786988)))

(declare-fun c!129354 () Bool)

(assert (=> b!1389341 (= c!129354 (validKeyInArray!0 (select (arr!45876 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389342 () Bool)

(assert (=> b!1389342 (= e!786989 call!66688)))

(declare-fun d!150131 () Bool)

(declare-fun res!929519 () Bool)

(assert (=> d!150131 (=> res!929519 e!786987)))

(assert (=> d!150131 (= res!929519 (bvsge #b00000000000000000000000000000000 (size!46426 a!2901)))))

(assert (=> d!150131 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786987)))

(assert (= (and d!150131 (not res!929519)) b!1389341))

(assert (= (and b!1389341 c!129354) b!1389340))

(assert (= (and b!1389341 (not c!129354)) b!1389339))

(assert (= (and b!1389340 res!929518) b!1389342))

(assert (= (or b!1389342 b!1389339) bm!66685))

(declare-fun m!1275011 () Bool)

(assert (=> bm!66685 m!1275011))

(declare-fun m!1275013 () Bool)

(assert (=> b!1389340 m!1275013))

(declare-fun m!1275015 () Bool)

(assert (=> b!1389340 m!1275015))

(declare-fun m!1275017 () Bool)

(assert (=> b!1389340 m!1275017))

(assert (=> b!1389340 m!1275013))

(declare-fun m!1275019 () Bool)

(assert (=> b!1389340 m!1275019))

(assert (=> b!1389341 m!1275013))

(assert (=> b!1389341 m!1275013))

(declare-fun m!1275021 () Bool)

(assert (=> b!1389341 m!1275021))

(assert (=> b!1389285 d!150131))

(declare-fun b!1389353 () Bool)

(declare-fun e!787000 () Bool)

(declare-fun e!786998 () Bool)

(assert (=> b!1389353 (= e!787000 e!786998)))

(declare-fun c!129357 () Bool)

(assert (=> b!1389353 (= c!129357 (validKeyInArray!0 (select (arr!45876 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389354 () Bool)

(declare-fun call!66691 () Bool)

(assert (=> b!1389354 (= e!786998 call!66691)))

(declare-fun b!1389355 () Bool)

(declare-fun e!786999 () Bool)

(assert (=> b!1389355 (= e!786999 e!787000)))

(declare-fun res!929527 () Bool)

(assert (=> b!1389355 (=> (not res!929527) (not e!787000))))

(declare-fun e!787001 () Bool)

(assert (=> b!1389355 (= res!929527 (not e!787001))))

(declare-fun res!929529 () Bool)

(assert (=> b!1389355 (=> (not res!929529) (not e!787001))))

(assert (=> b!1389355 (= res!929529 (validKeyInArray!0 (select (arr!45876 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389356 () Bool)

(assert (=> b!1389356 (= e!786998 call!66691)))

(declare-fun b!1389357 () Bool)

(declare-fun contains!9760 (List!32395 (_ BitVec 64)) Bool)

(assert (=> b!1389357 (= e!787001 (contains!9760 Nil!32392 (select (arr!45876 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150137 () Bool)

(declare-fun res!929528 () Bool)

(assert (=> d!150137 (=> res!929528 e!786999)))

(assert (=> d!150137 (= res!929528 (bvsge #b00000000000000000000000000000000 (size!46426 a!2901)))))

(assert (=> d!150137 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32392) e!786999)))

(declare-fun bm!66688 () Bool)

(assert (=> bm!66688 (= call!66691 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129357 (Cons!32391 (select (arr!45876 a!2901) #b00000000000000000000000000000000) Nil!32392) Nil!32392)))))

(assert (= (and d!150137 (not res!929528)) b!1389355))

(assert (= (and b!1389355 res!929529) b!1389357))

(assert (= (and b!1389355 res!929527) b!1389353))

(assert (= (and b!1389353 c!129357) b!1389356))

(assert (= (and b!1389353 (not c!129357)) b!1389354))

(assert (= (or b!1389356 b!1389354) bm!66688))

(assert (=> b!1389353 m!1275013))

(assert (=> b!1389353 m!1275013))

(assert (=> b!1389353 m!1275021))

(assert (=> b!1389355 m!1275013))

(assert (=> b!1389355 m!1275013))

(assert (=> b!1389355 m!1275021))

(assert (=> b!1389357 m!1275013))

(assert (=> b!1389357 m!1275013))

(declare-fun m!1275023 () Bool)

(assert (=> b!1389357 m!1275023))

(assert (=> bm!66688 m!1275013))

(declare-fun m!1275025 () Bool)

(assert (=> bm!66688 m!1275025))

(assert (=> b!1389280 d!150137))

(check-sat (not b!1389355) (not bm!66688) (not bm!66685) (not b!1389340) (not b!1389341) (not b!1389353) (not b!1389357))
(check-sat)
