; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121016 () Bool)

(assert start!121016)

(declare-fun b!1407337 () Bool)

(declare-fun res!945275 () Bool)

(declare-fun e!796545 () Bool)

(assert (=> b!1407337 (=> (not res!945275) (not e!796545))))

(declare-datatypes ((array!96174 0))(
  ( (array!96175 (arr!46432 (Array (_ BitVec 32) (_ BitVec 64))) (size!46984 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96174)

(declare-datatypes ((List!33029 0))(
  ( (Nil!33026) (Cons!33025 (h!34285 (_ BitVec 64)) (t!47715 List!33029)) )
))
(declare-fun arrayNoDuplicates!0 (array!96174 (_ BitVec 32) List!33029) Bool)

(assert (=> b!1407337 (= res!945275 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33026))))

(declare-fun b!1407338 () Bool)

(declare-fun res!945279 () Bool)

(declare-fun e!796547 () Bool)

(assert (=> b!1407338 (=> res!945279 e!796547)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10769 0))(
  ( (MissingZero!10769 (index!45453 (_ BitVec 32))) (Found!10769 (index!45454 (_ BitVec 32))) (Intermediate!10769 (undefined!11581 Bool) (index!45455 (_ BitVec 32)) (x!127057 (_ BitVec 32))) (Undefined!10769) (MissingVacant!10769 (index!45456 (_ BitVec 32))) )
))
(declare-fun lt!619594 () SeekEntryResult!10769)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96174 (_ BitVec 32)) SeekEntryResult!10769)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407338 (= res!945279 (not (= lt!619594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901)) mask!2840))))))

(declare-fun lt!619593 () (_ BitVec 32))

(declare-fun b!1407339 () Bool)

(assert (=> b!1407339 (= e!796547 (or (bvslt (x!127057 lt!619594) #b00000000000000000000000000000000) (bvsgt (x!127057 lt!619594) #b01111111111111111111111111111110) (bvslt lt!619593 #b00000000000000000000000000000000) (bvsge lt!619593 (size!46984 a!2901)) (and (bvsge (index!45455 lt!619594) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619594) (size!46984 a!2901)))))))

(declare-fun b!1407340 () Bool)

(declare-fun res!945277 () Bool)

(assert (=> b!1407340 (=> (not res!945277) (not e!796545))))

(assert (=> b!1407340 (= res!945277 (and (= (size!46984 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46984 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46984 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407342 () Bool)

(declare-fun res!945282 () Bool)

(assert (=> b!1407342 (=> (not res!945282) (not e!796545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96174 (_ BitVec 32)) Bool)

(assert (=> b!1407342 (= res!945282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!796544 () Bool)

(declare-fun b!1407343 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96174 (_ BitVec 32)) SeekEntryResult!10769)

(assert (=> b!1407343 (= e!796544 (= (seekEntryOrOpen!0 (select (arr!46432 a!2901) j!112) a!2901 mask!2840) (Found!10769 j!112)))))

(declare-fun b!1407344 () Bool)

(declare-fun res!945281 () Bool)

(assert (=> b!1407344 (=> (not res!945281) (not e!796545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407344 (= res!945281 (validKeyInArray!0 (select (arr!46432 a!2901) i!1037)))))

(declare-fun b!1407345 () Bool)

(declare-fun res!945276 () Bool)

(assert (=> b!1407345 (=> (not res!945276) (not e!796545))))

(assert (=> b!1407345 (= res!945276 (validKeyInArray!0 (select (arr!46432 a!2901) j!112)))))

(declare-fun res!945283 () Bool)

(assert (=> start!121016 (=> (not res!945283) (not e!796545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121016 (= res!945283 (validMask!0 mask!2840))))

(assert (=> start!121016 e!796545))

(assert (=> start!121016 true))

(declare-fun array_inv!35665 (array!96174) Bool)

(assert (=> start!121016 (array_inv!35665 a!2901)))

(declare-fun b!1407341 () Bool)

(assert (=> b!1407341 (= e!796545 (not e!796547))))

(declare-fun res!945278 () Bool)

(assert (=> b!1407341 (=> res!945278 e!796547)))

(get-info :version)

(assert (=> b!1407341 (= res!945278 (or (not ((_ is Intermediate!10769) lt!619594)) (undefined!11581 lt!619594)))))

(assert (=> b!1407341 e!796544))

(declare-fun res!945280 () Bool)

(assert (=> b!1407341 (=> (not res!945280) (not e!796544))))

(assert (=> b!1407341 (= res!945280 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47355 0))(
  ( (Unit!47356) )
))
(declare-fun lt!619595 () Unit!47355)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47355)

(assert (=> b!1407341 (= lt!619595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407341 (= lt!619594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619593 (select (arr!46432 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1407341 (= lt!619593 (toIndex!0 (select (arr!46432 a!2901) j!112) mask!2840))))

(assert (= (and start!121016 res!945283) b!1407340))

(assert (= (and b!1407340 res!945277) b!1407344))

(assert (= (and b!1407344 res!945281) b!1407345))

(assert (= (and b!1407345 res!945276) b!1407342))

(assert (= (and b!1407342 res!945282) b!1407337))

(assert (= (and b!1407337 res!945275) b!1407341))

(assert (= (and b!1407341 res!945280) b!1407343))

(assert (= (and b!1407341 (not res!945278)) b!1407338))

(assert (= (and b!1407338 (not res!945279)) b!1407339))

(declare-fun m!1295989 () Bool)

(assert (=> b!1407344 m!1295989))

(assert (=> b!1407344 m!1295989))

(declare-fun m!1295991 () Bool)

(assert (=> b!1407344 m!1295991))

(declare-fun m!1295993 () Bool)

(assert (=> b!1407342 m!1295993))

(declare-fun m!1295995 () Bool)

(assert (=> b!1407337 m!1295995))

(declare-fun m!1295997 () Bool)

(assert (=> b!1407345 m!1295997))

(assert (=> b!1407345 m!1295997))

(declare-fun m!1295999 () Bool)

(assert (=> b!1407345 m!1295999))

(assert (=> b!1407341 m!1295997))

(declare-fun m!1296001 () Bool)

(assert (=> b!1407341 m!1296001))

(assert (=> b!1407341 m!1295997))

(declare-fun m!1296003 () Bool)

(assert (=> b!1407341 m!1296003))

(assert (=> b!1407341 m!1295997))

(declare-fun m!1296005 () Bool)

(assert (=> b!1407341 m!1296005))

(declare-fun m!1296007 () Bool)

(assert (=> b!1407341 m!1296007))

(declare-fun m!1296009 () Bool)

(assert (=> start!121016 m!1296009))

(declare-fun m!1296011 () Bool)

(assert (=> start!121016 m!1296011))

(declare-fun m!1296013 () Bool)

(assert (=> b!1407338 m!1296013))

(declare-fun m!1296015 () Bool)

(assert (=> b!1407338 m!1296015))

(assert (=> b!1407338 m!1296015))

(declare-fun m!1296017 () Bool)

(assert (=> b!1407338 m!1296017))

(assert (=> b!1407338 m!1296017))

(assert (=> b!1407338 m!1296015))

(declare-fun m!1296019 () Bool)

(assert (=> b!1407338 m!1296019))

(assert (=> b!1407343 m!1295997))

(assert (=> b!1407343 m!1295997))

(declare-fun m!1296021 () Bool)

(assert (=> b!1407343 m!1296021))

(check-sat (not start!121016) (not b!1407344) (not b!1407341) (not b!1407343) (not b!1407342) (not b!1407345) (not b!1407337) (not b!1407338))
(check-sat)
(get-model)

(declare-fun b!1407409 () Bool)

(declare-fun e!796579 () Bool)

(declare-fun e!796578 () Bool)

(assert (=> b!1407409 (= e!796579 e!796578)))

(declare-fun c!130501 () Bool)

(assert (=> b!1407409 (= c!130501 (validKeyInArray!0 (select (arr!46432 a!2901) j!112)))))

(declare-fun call!66974 () Bool)

(declare-fun bm!66971 () Bool)

(assert (=> bm!66971 (= call!66974 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407410 () Bool)

(declare-fun e!796580 () Bool)

(assert (=> b!1407410 (= e!796580 call!66974)))

(declare-fun b!1407411 () Bool)

(assert (=> b!1407411 (= e!796578 e!796580)))

(declare-fun lt!619621 () (_ BitVec 64))

(assert (=> b!1407411 (= lt!619621 (select (arr!46432 a!2901) j!112))))

(declare-fun lt!619620 () Unit!47355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96174 (_ BitVec 64) (_ BitVec 32)) Unit!47355)

(assert (=> b!1407411 (= lt!619620 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619621 j!112))))

(declare-fun arrayContainsKey!0 (array!96174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1407411 (arrayContainsKey!0 a!2901 lt!619621 #b00000000000000000000000000000000)))

(declare-fun lt!619622 () Unit!47355)

(assert (=> b!1407411 (= lt!619622 lt!619620)))

(declare-fun res!945342 () Bool)

(assert (=> b!1407411 (= res!945342 (= (seekEntryOrOpen!0 (select (arr!46432 a!2901) j!112) a!2901 mask!2840) (Found!10769 j!112)))))

(assert (=> b!1407411 (=> (not res!945342) (not e!796580))))

(declare-fun b!1407408 () Bool)

(assert (=> b!1407408 (= e!796578 call!66974)))

(declare-fun d!151469 () Bool)

(declare-fun res!945343 () Bool)

(assert (=> d!151469 (=> res!945343 e!796579)))

(assert (=> d!151469 (= res!945343 (bvsge j!112 (size!46984 a!2901)))))

(assert (=> d!151469 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796579)))

(assert (= (and d!151469 (not res!945343)) b!1407409))

(assert (= (and b!1407409 c!130501) b!1407411))

(assert (= (and b!1407409 (not c!130501)) b!1407408))

(assert (= (and b!1407411 res!945342) b!1407410))

(assert (= (or b!1407410 b!1407408) bm!66971))

(assert (=> b!1407409 m!1295997))

(assert (=> b!1407409 m!1295997))

(assert (=> b!1407409 m!1295999))

(declare-fun m!1296091 () Bool)

(assert (=> bm!66971 m!1296091))

(assert (=> b!1407411 m!1295997))

(declare-fun m!1296093 () Bool)

(assert (=> b!1407411 m!1296093))

(declare-fun m!1296095 () Bool)

(assert (=> b!1407411 m!1296095))

(assert (=> b!1407411 m!1295997))

(assert (=> b!1407411 m!1296021))

(assert (=> b!1407341 d!151469))

(declare-fun d!151471 () Bool)

(assert (=> d!151471 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619625 () Unit!47355)

(declare-fun choose!38 (array!96174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47355)

(assert (=> d!151471 (= lt!619625 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151471 (validMask!0 mask!2840)))

(assert (=> d!151471 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619625)))

(declare-fun bs!40993 () Bool)

(assert (= bs!40993 d!151471))

(assert (=> bs!40993 m!1296007))

(declare-fun m!1296097 () Bool)

(assert (=> bs!40993 m!1296097))

(assert (=> bs!40993 m!1296009))

(assert (=> b!1407341 d!151471))

(declare-fun d!151475 () Bool)

(declare-fun e!796604 () Bool)

(assert (=> d!151475 e!796604))

(declare-fun c!130515 () Bool)

(declare-fun lt!619635 () SeekEntryResult!10769)

(assert (=> d!151475 (= c!130515 (and ((_ is Intermediate!10769) lt!619635) (undefined!11581 lt!619635)))))

(declare-fun e!796601 () SeekEntryResult!10769)

(assert (=> d!151475 (= lt!619635 e!796601)))

(declare-fun c!130516 () Bool)

(assert (=> d!151475 (= c!130516 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619634 () (_ BitVec 64))

(assert (=> d!151475 (= lt!619634 (select (arr!46432 a!2901) lt!619593))))

(assert (=> d!151475 (validMask!0 mask!2840)))

(assert (=> d!151475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619593 (select (arr!46432 a!2901) j!112) a!2901 mask!2840) lt!619635)))

(declare-fun b!1407448 () Bool)

(declare-fun e!796603 () SeekEntryResult!10769)

(assert (=> b!1407448 (= e!796603 (Intermediate!10769 false lt!619593 #b00000000000000000000000000000000))))

(declare-fun b!1407449 () Bool)

(assert (=> b!1407449 (and (bvsge (index!45455 lt!619635) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619635) (size!46984 a!2901)))))

(declare-fun e!796602 () Bool)

(assert (=> b!1407449 (= e!796602 (= (select (arr!46432 a!2901) (index!45455 lt!619635)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407450 () Bool)

(assert (=> b!1407450 (= e!796601 e!796603)))

(declare-fun c!130514 () Bool)

(assert (=> b!1407450 (= c!130514 (or (= lt!619634 (select (arr!46432 a!2901) j!112)) (= (bvadd lt!619634 lt!619634) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407451 () Bool)

(assert (=> b!1407451 (= e!796604 (bvsge (x!127057 lt!619635) #b01111111111111111111111111111110))))

(declare-fun b!1407452 () Bool)

(assert (=> b!1407452 (= e!796601 (Intermediate!10769 true lt!619593 #b00000000000000000000000000000000))))

(declare-fun b!1407453 () Bool)

(assert (=> b!1407453 (and (bvsge (index!45455 lt!619635) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619635) (size!46984 a!2901)))))

(declare-fun res!945356 () Bool)

(assert (=> b!1407453 (= res!945356 (= (select (arr!46432 a!2901) (index!45455 lt!619635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407453 (=> res!945356 e!796602)))

(declare-fun b!1407454 () Bool)

(assert (=> b!1407454 (and (bvsge (index!45455 lt!619635) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619635) (size!46984 a!2901)))))

(declare-fun res!945357 () Bool)

(assert (=> b!1407454 (= res!945357 (= (select (arr!46432 a!2901) (index!45455 lt!619635)) (select (arr!46432 a!2901) j!112)))))

(assert (=> b!1407454 (=> res!945357 e!796602)))

(declare-fun e!796605 () Bool)

(assert (=> b!1407454 (= e!796605 e!796602)))

(declare-fun b!1407455 () Bool)

(assert (=> b!1407455 (= e!796604 e!796605)))

(declare-fun res!945358 () Bool)

(assert (=> b!1407455 (= res!945358 (and ((_ is Intermediate!10769) lt!619635) (not (undefined!11581 lt!619635)) (bvslt (x!127057 lt!619635) #b01111111111111111111111111111110) (bvsge (x!127057 lt!619635) #b00000000000000000000000000000000) (bvsge (x!127057 lt!619635) #b00000000000000000000000000000000)))))

(assert (=> b!1407455 (=> (not res!945358) (not e!796605))))

(declare-fun b!1407456 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407456 (= e!796603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!619593 #b00000000000000000000000000000000 mask!2840) (select (arr!46432 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151475 c!130516) b!1407452))

(assert (= (and d!151475 (not c!130516)) b!1407450))

(assert (= (and b!1407450 c!130514) b!1407448))

(assert (= (and b!1407450 (not c!130514)) b!1407456))

(assert (= (and d!151475 c!130515) b!1407451))

(assert (= (and d!151475 (not c!130515)) b!1407455))

(assert (= (and b!1407455 res!945358) b!1407454))

(assert (= (and b!1407454 (not res!945357)) b!1407453))

(assert (= (and b!1407453 (not res!945356)) b!1407449))

(declare-fun m!1296099 () Bool)

(assert (=> b!1407456 m!1296099))

(assert (=> b!1407456 m!1296099))

(assert (=> b!1407456 m!1295997))

(declare-fun m!1296101 () Bool)

(assert (=> b!1407456 m!1296101))

(declare-fun m!1296103 () Bool)

(assert (=> b!1407449 m!1296103))

(assert (=> b!1407454 m!1296103))

(assert (=> b!1407453 m!1296103))

(declare-fun m!1296107 () Bool)

(assert (=> d!151475 m!1296107))

(assert (=> d!151475 m!1296009))

(assert (=> b!1407341 d!151475))

(declare-fun d!151481 () Bool)

(declare-fun lt!619647 () (_ BitVec 32))

(declare-fun lt!619646 () (_ BitVec 32))

(assert (=> d!151481 (= lt!619647 (bvmul (bvxor lt!619646 (bvlshr lt!619646 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151481 (= lt!619646 ((_ extract 31 0) (bvand (bvxor (select (arr!46432 a!2901) j!112) (bvlshr (select (arr!46432 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151481 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945362 (let ((h!34288 ((_ extract 31 0) (bvand (bvxor (select (arr!46432 a!2901) j!112) (bvlshr (select (arr!46432 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127062 (bvmul (bvxor h!34288 (bvlshr h!34288 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127062 (bvlshr x!127062 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945362 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945362 #b00000000000000000000000000000000))))))

(assert (=> d!151481 (= (toIndex!0 (select (arr!46432 a!2901) j!112) mask!2840) (bvand (bvxor lt!619647 (bvlshr lt!619647 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407341 d!151481))

(declare-fun b!1407482 () Bool)

(declare-fun e!796623 () Bool)

(declare-fun e!796626 () Bool)

(assert (=> b!1407482 (= e!796623 e!796626)))

(declare-fun res!945372 () Bool)

(assert (=> b!1407482 (=> (not res!945372) (not e!796626))))

(declare-fun e!796625 () Bool)

(assert (=> b!1407482 (= res!945372 (not e!796625))))

(declare-fun res!945374 () Bool)

(assert (=> b!1407482 (=> (not res!945374) (not e!796625))))

(assert (=> b!1407482 (= res!945374 (validKeyInArray!0 (select (arr!46432 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151487 () Bool)

(declare-fun res!945373 () Bool)

(assert (=> d!151487 (=> res!945373 e!796623)))

(assert (=> d!151487 (= res!945373 (bvsge #b00000000000000000000000000000000 (size!46984 a!2901)))))

(assert (=> d!151487 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33026) e!796623)))

(declare-fun bm!66974 () Bool)

(declare-fun call!66977 () Bool)

(declare-fun c!130524 () Bool)

(assert (=> bm!66974 (= call!66977 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130524 (Cons!33025 (select (arr!46432 a!2901) #b00000000000000000000000000000000) Nil!33026) Nil!33026)))))

(declare-fun b!1407483 () Bool)

(declare-fun contains!9762 (List!33029 (_ BitVec 64)) Bool)

(assert (=> b!1407483 (= e!796625 (contains!9762 Nil!33026 (select (arr!46432 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407484 () Bool)

(declare-fun e!796624 () Bool)

(assert (=> b!1407484 (= e!796626 e!796624)))

(assert (=> b!1407484 (= c!130524 (validKeyInArray!0 (select (arr!46432 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407485 () Bool)

(assert (=> b!1407485 (= e!796624 call!66977)))

(declare-fun b!1407486 () Bool)

(assert (=> b!1407486 (= e!796624 call!66977)))

(assert (= (and d!151487 (not res!945373)) b!1407482))

(assert (= (and b!1407482 res!945374) b!1407483))

(assert (= (and b!1407482 res!945372) b!1407484))

(assert (= (and b!1407484 c!130524) b!1407485))

(assert (= (and b!1407484 (not c!130524)) b!1407486))

(assert (= (or b!1407485 b!1407486) bm!66974))

(declare-fun m!1296115 () Bool)

(assert (=> b!1407482 m!1296115))

(assert (=> b!1407482 m!1296115))

(declare-fun m!1296117 () Bool)

(assert (=> b!1407482 m!1296117))

(assert (=> bm!66974 m!1296115))

(declare-fun m!1296119 () Bool)

(assert (=> bm!66974 m!1296119))

(assert (=> b!1407483 m!1296115))

(assert (=> b!1407483 m!1296115))

(declare-fun m!1296121 () Bool)

(assert (=> b!1407483 m!1296121))

(assert (=> b!1407484 m!1296115))

(assert (=> b!1407484 m!1296115))

(assert (=> b!1407484 m!1296117))

(assert (=> b!1407337 d!151487))

(declare-fun b!1407490 () Bool)

(declare-fun e!796630 () Bool)

(declare-fun e!796629 () Bool)

(assert (=> b!1407490 (= e!796630 e!796629)))

(declare-fun c!130525 () Bool)

(assert (=> b!1407490 (= c!130525 (validKeyInArray!0 (select (arr!46432 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66977 () Bool)

(declare-fun call!66980 () Bool)

(assert (=> bm!66977 (= call!66980 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407491 () Bool)

(declare-fun e!796631 () Bool)

(assert (=> b!1407491 (= e!796631 call!66980)))

(declare-fun b!1407492 () Bool)

(assert (=> b!1407492 (= e!796629 e!796631)))

(declare-fun lt!619657 () (_ BitVec 64))

(assert (=> b!1407492 (= lt!619657 (select (arr!46432 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619656 () Unit!47355)

(assert (=> b!1407492 (= lt!619656 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619657 #b00000000000000000000000000000000))))

(assert (=> b!1407492 (arrayContainsKey!0 a!2901 lt!619657 #b00000000000000000000000000000000)))

(declare-fun lt!619658 () Unit!47355)

(assert (=> b!1407492 (= lt!619658 lt!619656)))

(declare-fun res!945377 () Bool)

(assert (=> b!1407492 (= res!945377 (= (seekEntryOrOpen!0 (select (arr!46432 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10769 #b00000000000000000000000000000000)))))

(assert (=> b!1407492 (=> (not res!945377) (not e!796631))))

(declare-fun b!1407489 () Bool)

(assert (=> b!1407489 (= e!796629 call!66980)))

(declare-fun d!151491 () Bool)

(declare-fun res!945378 () Bool)

(assert (=> d!151491 (=> res!945378 e!796630)))

(assert (=> d!151491 (= res!945378 (bvsge #b00000000000000000000000000000000 (size!46984 a!2901)))))

(assert (=> d!151491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796630)))

(assert (= (and d!151491 (not res!945378)) b!1407490))

(assert (= (and b!1407490 c!130525) b!1407492))

(assert (= (and b!1407490 (not c!130525)) b!1407489))

(assert (= (and b!1407492 res!945377) b!1407491))

(assert (= (or b!1407491 b!1407489) bm!66977))

(assert (=> b!1407490 m!1296115))

(assert (=> b!1407490 m!1296115))

(assert (=> b!1407490 m!1296117))

(declare-fun m!1296123 () Bool)

(assert (=> bm!66977 m!1296123))

(assert (=> b!1407492 m!1296115))

(declare-fun m!1296125 () Bool)

(assert (=> b!1407492 m!1296125))

(declare-fun m!1296127 () Bool)

(assert (=> b!1407492 m!1296127))

(assert (=> b!1407492 m!1296115))

(declare-fun m!1296129 () Bool)

(assert (=> b!1407492 m!1296129))

(assert (=> b!1407342 d!151491))

(declare-fun d!151493 () Bool)

(declare-fun e!796635 () Bool)

(assert (=> d!151493 e!796635))

(declare-fun c!130527 () Bool)

(declare-fun lt!619660 () SeekEntryResult!10769)

(assert (=> d!151493 (= c!130527 (and ((_ is Intermediate!10769) lt!619660) (undefined!11581 lt!619660)))))

(declare-fun e!796632 () SeekEntryResult!10769)

(assert (=> d!151493 (= lt!619660 e!796632)))

(declare-fun c!130528 () Bool)

(assert (=> d!151493 (= c!130528 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619659 () (_ BitVec 64))

(assert (=> d!151493 (= lt!619659 (select (arr!46432 (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901))) (toIndex!0 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151493 (validMask!0 mask!2840)))

(assert (=> d!151493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901)) mask!2840) lt!619660)))

(declare-fun e!796634 () SeekEntryResult!10769)

(declare-fun b!1407493 () Bool)

(assert (=> b!1407493 (= e!796634 (Intermediate!10769 false (toIndex!0 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407494 () Bool)

(assert (=> b!1407494 (and (bvsge (index!45455 lt!619660) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619660) (size!46984 (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901)))))))

(declare-fun e!796633 () Bool)

(assert (=> b!1407494 (= e!796633 (= (select (arr!46432 (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901))) (index!45455 lt!619660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407495 () Bool)

(assert (=> b!1407495 (= e!796632 e!796634)))

(declare-fun c!130526 () Bool)

(assert (=> b!1407495 (= c!130526 (or (= lt!619659 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619659 lt!619659) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407496 () Bool)

(assert (=> b!1407496 (= e!796635 (bvsge (x!127057 lt!619660) #b01111111111111111111111111111110))))

(declare-fun b!1407497 () Bool)

(assert (=> b!1407497 (= e!796632 (Intermediate!10769 true (toIndex!0 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407498 () Bool)

(assert (=> b!1407498 (and (bvsge (index!45455 lt!619660) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619660) (size!46984 (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901)))))))

(declare-fun res!945379 () Bool)

(assert (=> b!1407498 (= res!945379 (= (select (arr!46432 (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901))) (index!45455 lt!619660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407498 (=> res!945379 e!796633)))

(declare-fun b!1407499 () Bool)

(assert (=> b!1407499 (and (bvsge (index!45455 lt!619660) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619660) (size!46984 (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901)))))))

(declare-fun res!945380 () Bool)

(assert (=> b!1407499 (= res!945380 (= (select (arr!46432 (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901))) (index!45455 lt!619660)) (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407499 (=> res!945380 e!796633)))

(declare-fun e!796636 () Bool)

(assert (=> b!1407499 (= e!796636 e!796633)))

(declare-fun b!1407500 () Bool)

(assert (=> b!1407500 (= e!796635 e!796636)))

(declare-fun res!945381 () Bool)

(assert (=> b!1407500 (= res!945381 (and ((_ is Intermediate!10769) lt!619660) (not (undefined!11581 lt!619660)) (bvslt (x!127057 lt!619660) #b01111111111111111111111111111110) (bvsge (x!127057 lt!619660) #b00000000000000000000000000000000) (bvsge (x!127057 lt!619660) #b00000000000000000000000000000000)))))

(assert (=> b!1407500 (=> (not res!945381) (not e!796636))))

(declare-fun b!1407501 () Bool)

(assert (=> b!1407501 (= e!796634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96175 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901)) mask!2840))))

(assert (= (and d!151493 c!130528) b!1407497))

(assert (= (and d!151493 (not c!130528)) b!1407495))

(assert (= (and b!1407495 c!130526) b!1407493))

(assert (= (and b!1407495 (not c!130526)) b!1407501))

(assert (= (and d!151493 c!130527) b!1407496))

(assert (= (and d!151493 (not c!130527)) b!1407500))

(assert (= (and b!1407500 res!945381) b!1407499))

(assert (= (and b!1407499 (not res!945380)) b!1407498))

(assert (= (and b!1407498 (not res!945379)) b!1407494))

(assert (=> b!1407501 m!1296017))

(declare-fun m!1296131 () Bool)

(assert (=> b!1407501 m!1296131))

(assert (=> b!1407501 m!1296131))

(assert (=> b!1407501 m!1296015))

(declare-fun m!1296133 () Bool)

(assert (=> b!1407501 m!1296133))

(declare-fun m!1296135 () Bool)

(assert (=> b!1407494 m!1296135))

(assert (=> b!1407499 m!1296135))

(assert (=> b!1407498 m!1296135))

(assert (=> d!151493 m!1296017))

(declare-fun m!1296137 () Bool)

(assert (=> d!151493 m!1296137))

(assert (=> d!151493 m!1296009))

(assert (=> b!1407338 d!151493))

(declare-fun d!151495 () Bool)

(declare-fun lt!619665 () (_ BitVec 32))

(declare-fun lt!619664 () (_ BitVec 32))

(assert (=> d!151495 (= lt!619665 (bvmul (bvxor lt!619664 (bvlshr lt!619664 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151495 (= lt!619664 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151495 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945362 (let ((h!34288 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127062 (bvmul (bvxor h!34288 (bvlshr h!34288 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127062 (bvlshr x!127062 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945362 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945362 #b00000000000000000000000000000000))))))

(assert (=> d!151495 (= (toIndex!0 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619665 (bvlshr lt!619665 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407338 d!151495))

(declare-fun d!151497 () Bool)

(declare-fun lt!619703 () SeekEntryResult!10769)

(assert (=> d!151497 (and (or ((_ is Undefined!10769) lt!619703) (not ((_ is Found!10769) lt!619703)) (and (bvsge (index!45454 lt!619703) #b00000000000000000000000000000000) (bvslt (index!45454 lt!619703) (size!46984 a!2901)))) (or ((_ is Undefined!10769) lt!619703) ((_ is Found!10769) lt!619703) (not ((_ is MissingZero!10769) lt!619703)) (and (bvsge (index!45453 lt!619703) #b00000000000000000000000000000000) (bvslt (index!45453 lt!619703) (size!46984 a!2901)))) (or ((_ is Undefined!10769) lt!619703) ((_ is Found!10769) lt!619703) ((_ is MissingZero!10769) lt!619703) (not ((_ is MissingVacant!10769) lt!619703)) (and (bvsge (index!45456 lt!619703) #b00000000000000000000000000000000) (bvslt (index!45456 lt!619703) (size!46984 a!2901)))) (or ((_ is Undefined!10769) lt!619703) (ite ((_ is Found!10769) lt!619703) (= (select (arr!46432 a!2901) (index!45454 lt!619703)) (select (arr!46432 a!2901) j!112)) (ite ((_ is MissingZero!10769) lt!619703) (= (select (arr!46432 a!2901) (index!45453 lt!619703)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10769) lt!619703) (= (select (arr!46432 a!2901) (index!45456 lt!619703)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!796677 () SeekEntryResult!10769)

(assert (=> d!151497 (= lt!619703 e!796677)))

(declare-fun c!130554 () Bool)

(declare-fun lt!619704 () SeekEntryResult!10769)

(assert (=> d!151497 (= c!130554 (and ((_ is Intermediate!10769) lt!619704) (undefined!11581 lt!619704)))))

(assert (=> d!151497 (= lt!619704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46432 a!2901) j!112) mask!2840) (select (arr!46432 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151497 (validMask!0 mask!2840)))

(assert (=> d!151497 (= (seekEntryOrOpen!0 (select (arr!46432 a!2901) j!112) a!2901 mask!2840) lt!619703)))

(declare-fun e!796675 () SeekEntryResult!10769)

(declare-fun b!1407565 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96174 (_ BitVec 32)) SeekEntryResult!10769)

(assert (=> b!1407565 (= e!796675 (seekKeyOrZeroReturnVacant!0 (x!127057 lt!619704) (index!45455 lt!619704) (index!45455 lt!619704) (select (arr!46432 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407566 () Bool)

(assert (=> b!1407566 (= e!796677 Undefined!10769)))

(declare-fun b!1407567 () Bool)

(assert (=> b!1407567 (= e!796675 (MissingZero!10769 (index!45455 lt!619704)))))

(declare-fun b!1407568 () Bool)

(declare-fun c!130553 () Bool)

(declare-fun lt!619705 () (_ BitVec 64))

(assert (=> b!1407568 (= c!130553 (= lt!619705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796676 () SeekEntryResult!10769)

(assert (=> b!1407568 (= e!796676 e!796675)))

(declare-fun b!1407569 () Bool)

(assert (=> b!1407569 (= e!796677 e!796676)))

(assert (=> b!1407569 (= lt!619705 (select (arr!46432 a!2901) (index!45455 lt!619704)))))

(declare-fun c!130555 () Bool)

(assert (=> b!1407569 (= c!130555 (= lt!619705 (select (arr!46432 a!2901) j!112)))))

(declare-fun b!1407570 () Bool)

(assert (=> b!1407570 (= e!796676 (Found!10769 (index!45455 lt!619704)))))

(assert (= (and d!151497 c!130554) b!1407566))

(assert (= (and d!151497 (not c!130554)) b!1407569))

(assert (= (and b!1407569 c!130555) b!1407570))

(assert (= (and b!1407569 (not c!130555)) b!1407568))

(assert (= (and b!1407568 c!130553) b!1407567))

(assert (= (and b!1407568 (not c!130553)) b!1407565))

(assert (=> d!151497 m!1295997))

(assert (=> d!151497 m!1296003))

(assert (=> d!151497 m!1296009))

(declare-fun m!1296197 () Bool)

(assert (=> d!151497 m!1296197))

(declare-fun m!1296199 () Bool)

(assert (=> d!151497 m!1296199))

(declare-fun m!1296201 () Bool)

(assert (=> d!151497 m!1296201))

(assert (=> d!151497 m!1296003))

(assert (=> d!151497 m!1295997))

(declare-fun m!1296203 () Bool)

(assert (=> d!151497 m!1296203))

(assert (=> b!1407565 m!1295997))

(declare-fun m!1296205 () Bool)

(assert (=> b!1407565 m!1296205))

(declare-fun m!1296207 () Bool)

(assert (=> b!1407569 m!1296207))

(assert (=> b!1407343 d!151497))

(declare-fun d!151521 () Bool)

(assert (=> d!151521 (= (validKeyInArray!0 (select (arr!46432 a!2901) j!112)) (and (not (= (select (arr!46432 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46432 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407345 d!151521))

(declare-fun d!151523 () Bool)

(assert (=> d!151523 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121016 d!151523))

(declare-fun d!151529 () Bool)

(assert (=> d!151529 (= (array_inv!35665 a!2901) (bvsge (size!46984 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121016 d!151529))

(declare-fun d!151531 () Bool)

(assert (=> d!151531 (= (validKeyInArray!0 (select (arr!46432 a!2901) i!1037)) (and (not (= (select (arr!46432 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46432 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407344 d!151531))

(check-sat (not b!1407482) (not b!1407492) (not b!1407501) (not bm!66971) (not d!151493) (not b!1407490) (not d!151475) (not d!151471) (not bm!66974) (not d!151497) (not b!1407483) (not bm!66977) (not b!1407484) (not b!1407409) (not b!1407456) (not b!1407565) (not b!1407411))
(check-sat)
