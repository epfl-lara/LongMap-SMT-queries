; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121544 () Bool)

(assert start!121544)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96518 0))(
  ( (array!96519 (arr!46597 (Array (_ BitVec 32) (_ BitVec 64))) (size!47148 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96518)

(declare-fun e!798843 () Bool)

(declare-fun b!1411472 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10811 0))(
  ( (MissingZero!10811 (index!45621 (_ BitVec 32))) (Found!10811 (index!45622 (_ BitVec 32))) (Intermediate!10811 (undefined!11623 Bool) (index!45623 (_ BitVec 32)) (x!127371 (_ BitVec 32))) (Undefined!10811) (MissingVacant!10811 (index!45624 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96518 (_ BitVec 32)) SeekEntryResult!10811)

(assert (=> b!1411472 (= e!798843 (= (seekEntryOrOpen!0 (select (arr!46597 a!2901) j!112) a!2901 mask!2840) (Found!10811 j!112)))))

(declare-fun b!1411473 () Bool)

(declare-fun e!798844 () Bool)

(declare-fun e!798842 () Bool)

(assert (=> b!1411473 (= e!798844 (not e!798842))))

(declare-fun res!948184 () Bool)

(assert (=> b!1411473 (=> res!948184 e!798842)))

(declare-fun lt!621516 () SeekEntryResult!10811)

(get-info :version)

(assert (=> b!1411473 (= res!948184 (or (not ((_ is Intermediate!10811) lt!621516)) (undefined!11623 lt!621516)))))

(assert (=> b!1411473 e!798843))

(declare-fun res!948180 () Bool)

(assert (=> b!1411473 (=> (not res!948180) (not e!798843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96518 (_ BitVec 32)) Bool)

(assert (=> b!1411473 (= res!948180 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47623 0))(
  ( (Unit!47624) )
))
(declare-fun lt!621517 () Unit!47623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47623)

(assert (=> b!1411473 (= lt!621517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621515 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96518 (_ BitVec 32)) SeekEntryResult!10811)

(assert (=> b!1411473 (= lt!621516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621515 (select (arr!46597 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411473 (= lt!621515 (toIndex!0 (select (arr!46597 a!2901) j!112) mask!2840))))

(declare-fun b!1411474 () Bool)

(declare-fun lt!621518 () SeekEntryResult!10811)

(assert (=> b!1411474 (= e!798842 (or (= lt!621516 lt!621518) (not ((_ is Intermediate!10811) lt!621518)) (bvslt (x!127371 lt!621516) #b00000000000000000000000000000000) (bvsgt (x!127371 lt!621516) #b01111111111111111111111111111110) (bvslt lt!621515 #b00000000000000000000000000000000) (bvsge lt!621515 (size!47148 a!2901)) (and (bvsge (index!45623 lt!621516) #b00000000000000000000000000000000) (bvslt (index!45623 lt!621516) (size!47148 a!2901)))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1411474 (= lt!621518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901)) mask!2840))))

(declare-fun b!1411475 () Bool)

(declare-fun res!948186 () Bool)

(assert (=> b!1411475 (=> (not res!948186) (not e!798844))))

(assert (=> b!1411475 (= res!948186 (and (= (size!47148 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47148 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47148 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411476 () Bool)

(declare-fun res!948182 () Bool)

(assert (=> b!1411476 (=> (not res!948182) (not e!798844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411476 (= res!948182 (validKeyInArray!0 (select (arr!46597 a!2901) i!1037)))))

(declare-fun b!1411478 () Bool)

(declare-fun res!948187 () Bool)

(assert (=> b!1411478 (=> (not res!948187) (not e!798844))))

(declare-datatypes ((List!33103 0))(
  ( (Nil!33100) (Cons!33099 (h!34376 (_ BitVec 64)) (t!47789 List!33103)) )
))
(declare-fun arrayNoDuplicates!0 (array!96518 (_ BitVec 32) List!33103) Bool)

(assert (=> b!1411478 (= res!948187 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33100))))

(declare-fun b!1411479 () Bool)

(declare-fun res!948183 () Bool)

(assert (=> b!1411479 (=> (not res!948183) (not e!798844))))

(assert (=> b!1411479 (= res!948183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411477 () Bool)

(declare-fun res!948185 () Bool)

(assert (=> b!1411477 (=> (not res!948185) (not e!798844))))

(assert (=> b!1411477 (= res!948185 (validKeyInArray!0 (select (arr!46597 a!2901) j!112)))))

(declare-fun res!948181 () Bool)

(assert (=> start!121544 (=> (not res!948181) (not e!798844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121544 (= res!948181 (validMask!0 mask!2840))))

(assert (=> start!121544 e!798844))

(assert (=> start!121544 true))

(declare-fun array_inv!35878 (array!96518) Bool)

(assert (=> start!121544 (array_inv!35878 a!2901)))

(assert (= (and start!121544 res!948181) b!1411475))

(assert (= (and b!1411475 res!948186) b!1411476))

(assert (= (and b!1411476 res!948182) b!1411477))

(assert (= (and b!1411477 res!948185) b!1411479))

(assert (= (and b!1411479 res!948183) b!1411478))

(assert (= (and b!1411478 res!948187) b!1411473))

(assert (= (and b!1411473 res!948180) b!1411472))

(assert (= (and b!1411473 (not res!948184)) b!1411474))

(declare-fun m!1301377 () Bool)

(assert (=> b!1411476 m!1301377))

(assert (=> b!1411476 m!1301377))

(declare-fun m!1301379 () Bool)

(assert (=> b!1411476 m!1301379))

(declare-fun m!1301381 () Bool)

(assert (=> b!1411472 m!1301381))

(assert (=> b!1411472 m!1301381))

(declare-fun m!1301383 () Bool)

(assert (=> b!1411472 m!1301383))

(declare-fun m!1301385 () Bool)

(assert (=> b!1411474 m!1301385))

(declare-fun m!1301387 () Bool)

(assert (=> b!1411474 m!1301387))

(assert (=> b!1411474 m!1301387))

(declare-fun m!1301389 () Bool)

(assert (=> b!1411474 m!1301389))

(assert (=> b!1411474 m!1301389))

(assert (=> b!1411474 m!1301387))

(declare-fun m!1301391 () Bool)

(assert (=> b!1411474 m!1301391))

(assert (=> b!1411477 m!1301381))

(assert (=> b!1411477 m!1301381))

(declare-fun m!1301393 () Bool)

(assert (=> b!1411477 m!1301393))

(declare-fun m!1301395 () Bool)

(assert (=> start!121544 m!1301395))

(declare-fun m!1301397 () Bool)

(assert (=> start!121544 m!1301397))

(assert (=> b!1411473 m!1301381))

(declare-fun m!1301399 () Bool)

(assert (=> b!1411473 m!1301399))

(declare-fun m!1301401 () Bool)

(assert (=> b!1411473 m!1301401))

(declare-fun m!1301403 () Bool)

(assert (=> b!1411473 m!1301403))

(assert (=> b!1411473 m!1301381))

(declare-fun m!1301405 () Bool)

(assert (=> b!1411473 m!1301405))

(assert (=> b!1411473 m!1301381))

(declare-fun m!1301407 () Bool)

(assert (=> b!1411479 m!1301407))

(declare-fun m!1301409 () Bool)

(assert (=> b!1411478 m!1301409))

(check-sat (not b!1411472) (not b!1411479) (not b!1411478) (not b!1411474) (not b!1411476) (not b!1411477) (not b!1411473) (not start!121544))
(check-sat)
(get-model)

(declare-fun d!152231 () Bool)

(declare-fun res!948241 () Bool)

(declare-fun e!798876 () Bool)

(assert (=> d!152231 (=> res!948241 e!798876)))

(assert (=> d!152231 (= res!948241 (bvsge #b00000000000000000000000000000000 (size!47148 a!2901)))))

(assert (=> d!152231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798876)))

(declare-fun b!1411536 () Bool)

(declare-fun e!798877 () Bool)

(declare-fun call!67116 () Bool)

(assert (=> b!1411536 (= e!798877 call!67116)))

(declare-fun b!1411537 () Bool)

(assert (=> b!1411537 (= e!798876 e!798877)))

(declare-fun c!131125 () Bool)

(assert (=> b!1411537 (= c!131125 (validKeyInArray!0 (select (arr!46597 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411538 () Bool)

(declare-fun e!798878 () Bool)

(assert (=> b!1411538 (= e!798877 e!798878)))

(declare-fun lt!621551 () (_ BitVec 64))

(assert (=> b!1411538 (= lt!621551 (select (arr!46597 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621549 () Unit!47623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96518 (_ BitVec 64) (_ BitVec 32)) Unit!47623)

(assert (=> b!1411538 (= lt!621549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621551 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1411538 (arrayContainsKey!0 a!2901 lt!621551 #b00000000000000000000000000000000)))

(declare-fun lt!621550 () Unit!47623)

(assert (=> b!1411538 (= lt!621550 lt!621549)))

(declare-fun res!948240 () Bool)

(assert (=> b!1411538 (= res!948240 (= (seekEntryOrOpen!0 (select (arr!46597 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10811 #b00000000000000000000000000000000)))))

(assert (=> b!1411538 (=> (not res!948240) (not e!798878))))

(declare-fun b!1411539 () Bool)

(assert (=> b!1411539 (= e!798878 call!67116)))

(declare-fun bm!67113 () Bool)

(assert (=> bm!67113 (= call!67116 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152231 (not res!948241)) b!1411537))

(assert (= (and b!1411537 c!131125) b!1411538))

(assert (= (and b!1411537 (not c!131125)) b!1411536))

(assert (= (and b!1411538 res!948240) b!1411539))

(assert (= (or b!1411539 b!1411536) bm!67113))

(declare-fun m!1301479 () Bool)

(assert (=> b!1411537 m!1301479))

(assert (=> b!1411537 m!1301479))

(declare-fun m!1301481 () Bool)

(assert (=> b!1411537 m!1301481))

(assert (=> b!1411538 m!1301479))

(declare-fun m!1301483 () Bool)

(assert (=> b!1411538 m!1301483))

(declare-fun m!1301485 () Bool)

(assert (=> b!1411538 m!1301485))

(assert (=> b!1411538 m!1301479))

(declare-fun m!1301487 () Bool)

(assert (=> b!1411538 m!1301487))

(declare-fun m!1301489 () Bool)

(assert (=> bm!67113 m!1301489))

(assert (=> b!1411479 d!152231))

(declare-fun d!152233 () Bool)

(declare-fun res!948243 () Bool)

(declare-fun e!798879 () Bool)

(assert (=> d!152233 (=> res!948243 e!798879)))

(assert (=> d!152233 (= res!948243 (bvsge j!112 (size!47148 a!2901)))))

(assert (=> d!152233 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798879)))

(declare-fun b!1411540 () Bool)

(declare-fun e!798880 () Bool)

(declare-fun call!67117 () Bool)

(assert (=> b!1411540 (= e!798880 call!67117)))

(declare-fun b!1411541 () Bool)

(assert (=> b!1411541 (= e!798879 e!798880)))

(declare-fun c!131126 () Bool)

(assert (=> b!1411541 (= c!131126 (validKeyInArray!0 (select (arr!46597 a!2901) j!112)))))

(declare-fun b!1411542 () Bool)

(declare-fun e!798881 () Bool)

(assert (=> b!1411542 (= e!798880 e!798881)))

(declare-fun lt!621554 () (_ BitVec 64))

(assert (=> b!1411542 (= lt!621554 (select (arr!46597 a!2901) j!112))))

(declare-fun lt!621552 () Unit!47623)

(assert (=> b!1411542 (= lt!621552 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621554 j!112))))

(assert (=> b!1411542 (arrayContainsKey!0 a!2901 lt!621554 #b00000000000000000000000000000000)))

(declare-fun lt!621553 () Unit!47623)

(assert (=> b!1411542 (= lt!621553 lt!621552)))

(declare-fun res!948242 () Bool)

(assert (=> b!1411542 (= res!948242 (= (seekEntryOrOpen!0 (select (arr!46597 a!2901) j!112) a!2901 mask!2840) (Found!10811 j!112)))))

(assert (=> b!1411542 (=> (not res!948242) (not e!798881))))

(declare-fun b!1411543 () Bool)

(assert (=> b!1411543 (= e!798881 call!67117)))

(declare-fun bm!67114 () Bool)

(assert (=> bm!67114 (= call!67117 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152233 (not res!948243)) b!1411541))

(assert (= (and b!1411541 c!131126) b!1411542))

(assert (= (and b!1411541 (not c!131126)) b!1411540))

(assert (= (and b!1411542 res!948242) b!1411543))

(assert (= (or b!1411543 b!1411540) bm!67114))

(assert (=> b!1411541 m!1301381))

(assert (=> b!1411541 m!1301381))

(assert (=> b!1411541 m!1301393))

(assert (=> b!1411542 m!1301381))

(declare-fun m!1301491 () Bool)

(assert (=> b!1411542 m!1301491))

(declare-fun m!1301493 () Bool)

(assert (=> b!1411542 m!1301493))

(assert (=> b!1411542 m!1301381))

(assert (=> b!1411542 m!1301383))

(declare-fun m!1301495 () Bool)

(assert (=> bm!67114 m!1301495))

(assert (=> b!1411473 d!152233))

(declare-fun d!152235 () Bool)

(assert (=> d!152235 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621557 () Unit!47623)

(declare-fun choose!38 (array!96518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47623)

(assert (=> d!152235 (= lt!621557 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152235 (validMask!0 mask!2840)))

(assert (=> d!152235 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621557)))

(declare-fun bs!41122 () Bool)

(assert (= bs!41122 d!152235))

(assert (=> bs!41122 m!1301403))

(declare-fun m!1301497 () Bool)

(assert (=> bs!41122 m!1301497))

(assert (=> bs!41122 m!1301395))

(assert (=> b!1411473 d!152235))

(declare-fun b!1411589 () Bool)

(declare-fun e!798912 () SeekEntryResult!10811)

(assert (=> b!1411589 (= e!798912 (Intermediate!10811 true lt!621515 #b00000000000000000000000000000000))))

(declare-fun b!1411590 () Bool)

(declare-fun lt!621568 () SeekEntryResult!10811)

(assert (=> b!1411590 (and (bvsge (index!45623 lt!621568) #b00000000000000000000000000000000) (bvslt (index!45623 lt!621568) (size!47148 a!2901)))))

(declare-fun res!948260 () Bool)

(assert (=> b!1411590 (= res!948260 (= (select (arr!46597 a!2901) (index!45623 lt!621568)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798910 () Bool)

(assert (=> b!1411590 (=> res!948260 e!798910)))

(declare-fun b!1411591 () Bool)

(declare-fun e!798913 () Bool)

(assert (=> b!1411591 (= e!798913 (bvsge (x!127371 lt!621568) #b01111111111111111111111111111110))))

(declare-fun b!1411592 () Bool)

(declare-fun e!798914 () Bool)

(assert (=> b!1411592 (= e!798913 e!798914)))

(declare-fun res!948261 () Bool)

(assert (=> b!1411592 (= res!948261 (and ((_ is Intermediate!10811) lt!621568) (not (undefined!11623 lt!621568)) (bvslt (x!127371 lt!621568) #b01111111111111111111111111111110) (bvsge (x!127371 lt!621568) #b00000000000000000000000000000000) (bvsge (x!127371 lt!621568) #b00000000000000000000000000000000)))))

(assert (=> b!1411592 (=> (not res!948261) (not e!798914))))

(declare-fun b!1411593 () Bool)

(assert (=> b!1411593 (and (bvsge (index!45623 lt!621568) #b00000000000000000000000000000000) (bvslt (index!45623 lt!621568) (size!47148 a!2901)))))

(assert (=> b!1411593 (= e!798910 (= (select (arr!46597 a!2901) (index!45623 lt!621568)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152239 () Bool)

(assert (=> d!152239 e!798913))

(declare-fun c!131143 () Bool)

(assert (=> d!152239 (= c!131143 (and ((_ is Intermediate!10811) lt!621568) (undefined!11623 lt!621568)))))

(assert (=> d!152239 (= lt!621568 e!798912)))

(declare-fun c!131144 () Bool)

(assert (=> d!152239 (= c!131144 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621569 () (_ BitVec 64))

(assert (=> d!152239 (= lt!621569 (select (arr!46597 a!2901) lt!621515))))

(assert (=> d!152239 (validMask!0 mask!2840)))

(assert (=> d!152239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621515 (select (arr!46597 a!2901) j!112) a!2901 mask!2840) lt!621568)))

(declare-fun b!1411594 () Bool)

(declare-fun e!798911 () SeekEntryResult!10811)

(assert (=> b!1411594 (= e!798912 e!798911)))

(declare-fun c!131142 () Bool)

(assert (=> b!1411594 (= c!131142 (or (= lt!621569 (select (arr!46597 a!2901) j!112)) (= (bvadd lt!621569 lt!621569) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1411595 () Bool)

(assert (=> b!1411595 (= e!798911 (Intermediate!10811 false lt!621515 #b00000000000000000000000000000000))))

(declare-fun b!1411596 () Bool)

(assert (=> b!1411596 (and (bvsge (index!45623 lt!621568) #b00000000000000000000000000000000) (bvslt (index!45623 lt!621568) (size!47148 a!2901)))))

(declare-fun res!948259 () Bool)

(assert (=> b!1411596 (= res!948259 (= (select (arr!46597 a!2901) (index!45623 lt!621568)) (select (arr!46597 a!2901) j!112)))))

(assert (=> b!1411596 (=> res!948259 e!798910)))

(assert (=> b!1411596 (= e!798914 e!798910)))

(declare-fun b!1411597 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411597 (= e!798911 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!621515 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46597 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152239 c!131144) b!1411589))

(assert (= (and d!152239 (not c!131144)) b!1411594))

(assert (= (and b!1411594 c!131142) b!1411595))

(assert (= (and b!1411594 (not c!131142)) b!1411597))

(assert (= (and d!152239 c!131143) b!1411591))

(assert (= (and d!152239 (not c!131143)) b!1411592))

(assert (= (and b!1411592 res!948261) b!1411596))

(assert (= (and b!1411596 (not res!948259)) b!1411590))

(assert (= (and b!1411590 (not res!948260)) b!1411593))

(declare-fun m!1301507 () Bool)

(assert (=> b!1411593 m!1301507))

(declare-fun m!1301509 () Bool)

(assert (=> d!152239 m!1301509))

(assert (=> d!152239 m!1301395))

(assert (=> b!1411590 m!1301507))

(assert (=> b!1411596 m!1301507))

(declare-fun m!1301511 () Bool)

(assert (=> b!1411597 m!1301511))

(assert (=> b!1411597 m!1301511))

(assert (=> b!1411597 m!1301381))

(declare-fun m!1301513 () Bool)

(assert (=> b!1411597 m!1301513))

(assert (=> b!1411473 d!152239))

(declare-fun d!152251 () Bool)

(declare-fun lt!621578 () (_ BitVec 32))

(declare-fun lt!621577 () (_ BitVec 32))

(assert (=> d!152251 (= lt!621578 (bvmul (bvxor lt!621577 (bvlshr lt!621577 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152251 (= lt!621577 ((_ extract 31 0) (bvand (bvxor (select (arr!46597 a!2901) j!112) (bvlshr (select (arr!46597 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152251 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!948262 (let ((h!34379 ((_ extract 31 0) (bvand (bvxor (select (arr!46597 a!2901) j!112) (bvlshr (select (arr!46597 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127375 (bvmul (bvxor h!34379 (bvlshr h!34379 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127375 (bvlshr x!127375 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!948262 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!948262 #b00000000000000000000000000000000))))))

(assert (=> d!152251 (= (toIndex!0 (select (arr!46597 a!2901) j!112) mask!2840) (bvand (bvxor lt!621578 (bvlshr lt!621578 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411473 d!152251))

(declare-fun b!1411614 () Bool)

(declare-fun e!798928 () Bool)

(declare-fun contains!9851 (List!33103 (_ BitVec 64)) Bool)

(assert (=> b!1411614 (= e!798928 (contains!9851 Nil!33100 (select (arr!46597 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411615 () Bool)

(declare-fun e!798927 () Bool)

(declare-fun e!798926 () Bool)

(assert (=> b!1411615 (= e!798927 e!798926)))

(declare-fun c!131150 () Bool)

(assert (=> b!1411615 (= c!131150 (validKeyInArray!0 (select (arr!46597 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411616 () Bool)

(declare-fun call!67123 () Bool)

(assert (=> b!1411616 (= e!798926 call!67123)))

(declare-fun bm!67120 () Bool)

(assert (=> bm!67120 (= call!67123 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131150 (Cons!33099 (select (arr!46597 a!2901) #b00000000000000000000000000000000) Nil!33100) Nil!33100)))))

(declare-fun b!1411618 () Bool)

(assert (=> b!1411618 (= e!798926 call!67123)))

(declare-fun d!152255 () Bool)

(declare-fun res!948269 () Bool)

(declare-fun e!798929 () Bool)

(assert (=> d!152255 (=> res!948269 e!798929)))

(assert (=> d!152255 (= res!948269 (bvsge #b00000000000000000000000000000000 (size!47148 a!2901)))))

(assert (=> d!152255 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33100) e!798929)))

(declare-fun b!1411617 () Bool)

(assert (=> b!1411617 (= e!798929 e!798927)))

(declare-fun res!948271 () Bool)

(assert (=> b!1411617 (=> (not res!948271) (not e!798927))))

(assert (=> b!1411617 (= res!948271 (not e!798928))))

(declare-fun res!948270 () Bool)

(assert (=> b!1411617 (=> (not res!948270) (not e!798928))))

(assert (=> b!1411617 (= res!948270 (validKeyInArray!0 (select (arr!46597 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152255 (not res!948269)) b!1411617))

(assert (= (and b!1411617 res!948270) b!1411614))

(assert (= (and b!1411617 res!948271) b!1411615))

(assert (= (and b!1411615 c!131150) b!1411616))

(assert (= (and b!1411615 (not c!131150)) b!1411618))

(assert (= (or b!1411616 b!1411618) bm!67120))

(assert (=> b!1411614 m!1301479))

(assert (=> b!1411614 m!1301479))

(declare-fun m!1301527 () Bool)

(assert (=> b!1411614 m!1301527))

(assert (=> b!1411615 m!1301479))

(assert (=> b!1411615 m!1301479))

(assert (=> b!1411615 m!1301481))

(assert (=> bm!67120 m!1301479))

(declare-fun m!1301529 () Bool)

(assert (=> bm!67120 m!1301529))

(assert (=> b!1411617 m!1301479))

(assert (=> b!1411617 m!1301479))

(assert (=> b!1411617 m!1301481))

(assert (=> b!1411478 d!152255))

(declare-fun b!1411627 () Bool)

(declare-fun e!798936 () SeekEntryResult!10811)

(assert (=> b!1411627 (= e!798936 (Intermediate!10811 true (toIndex!0 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411628 () Bool)

(declare-fun lt!621585 () SeekEntryResult!10811)

(assert (=> b!1411628 (and (bvsge (index!45623 lt!621585) #b00000000000000000000000000000000) (bvslt (index!45623 lt!621585) (size!47148 (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901)))))))

(declare-fun res!948273 () Bool)

(assert (=> b!1411628 (= res!948273 (= (select (arr!46597 (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901))) (index!45623 lt!621585)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798934 () Bool)

(assert (=> b!1411628 (=> res!948273 e!798934)))

(declare-fun b!1411629 () Bool)

(declare-fun e!798937 () Bool)

(assert (=> b!1411629 (= e!798937 (bvsge (x!127371 lt!621585) #b01111111111111111111111111111110))))

(declare-fun b!1411630 () Bool)

(declare-fun e!798938 () Bool)

(assert (=> b!1411630 (= e!798937 e!798938)))

(declare-fun res!948274 () Bool)

(assert (=> b!1411630 (= res!948274 (and ((_ is Intermediate!10811) lt!621585) (not (undefined!11623 lt!621585)) (bvslt (x!127371 lt!621585) #b01111111111111111111111111111110) (bvsge (x!127371 lt!621585) #b00000000000000000000000000000000) (bvsge (x!127371 lt!621585) #b00000000000000000000000000000000)))))

(assert (=> b!1411630 (=> (not res!948274) (not e!798938))))

(declare-fun b!1411631 () Bool)

(assert (=> b!1411631 (and (bvsge (index!45623 lt!621585) #b00000000000000000000000000000000) (bvslt (index!45623 lt!621585) (size!47148 (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901)))))))

(assert (=> b!1411631 (= e!798934 (= (select (arr!46597 (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901))) (index!45623 lt!621585)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152261 () Bool)

(assert (=> d!152261 e!798937))

(declare-fun c!131156 () Bool)

(assert (=> d!152261 (= c!131156 (and ((_ is Intermediate!10811) lt!621585) (undefined!11623 lt!621585)))))

(assert (=> d!152261 (= lt!621585 e!798936)))

(declare-fun c!131157 () Bool)

(assert (=> d!152261 (= c!131157 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621586 () (_ BitVec 64))

(assert (=> d!152261 (= lt!621586 (select (arr!46597 (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901))) (toIndex!0 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!152261 (validMask!0 mask!2840)))

(assert (=> d!152261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901)) mask!2840) lt!621585)))

(declare-fun b!1411632 () Bool)

(declare-fun e!798935 () SeekEntryResult!10811)

(assert (=> b!1411632 (= e!798936 e!798935)))

(declare-fun c!131155 () Bool)

(assert (=> b!1411632 (= c!131155 (or (= lt!621586 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621586 lt!621586) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1411633 () Bool)

(assert (=> b!1411633 (= e!798935 (Intermediate!10811 false (toIndex!0 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411634 () Bool)

(assert (=> b!1411634 (and (bvsge (index!45623 lt!621585) #b00000000000000000000000000000000) (bvslt (index!45623 lt!621585) (size!47148 (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901)))))))

(declare-fun res!948272 () Bool)

(assert (=> b!1411634 (= res!948272 (= (select (arr!46597 (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901))) (index!45623 lt!621585)) (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1411634 (=> res!948272 e!798934)))

(assert (=> b!1411634 (= e!798938 e!798934)))

(declare-fun b!1411635 () Bool)

(assert (=> b!1411635 (= e!798935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96519 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901)) mask!2840))))

(assert (= (and d!152261 c!131157) b!1411627))

(assert (= (and d!152261 (not c!131157)) b!1411632))

(assert (= (and b!1411632 c!131155) b!1411633))

(assert (= (and b!1411632 (not c!131155)) b!1411635))

(assert (= (and d!152261 c!131156) b!1411629))

(assert (= (and d!152261 (not c!131156)) b!1411630))

(assert (= (and b!1411630 res!948274) b!1411634))

(assert (= (and b!1411634 (not res!948272)) b!1411628))

(assert (= (and b!1411628 (not res!948273)) b!1411631))

(declare-fun m!1301531 () Bool)

(assert (=> b!1411631 m!1301531))

(assert (=> d!152261 m!1301389))

(declare-fun m!1301533 () Bool)

(assert (=> d!152261 m!1301533))

(assert (=> d!152261 m!1301395))

(assert (=> b!1411628 m!1301531))

(assert (=> b!1411634 m!1301531))

(assert (=> b!1411635 m!1301389))

(declare-fun m!1301535 () Bool)

(assert (=> b!1411635 m!1301535))

(assert (=> b!1411635 m!1301535))

(assert (=> b!1411635 m!1301387))

(declare-fun m!1301537 () Bool)

(assert (=> b!1411635 m!1301537))

(assert (=> b!1411474 d!152261))

(declare-fun d!152265 () Bool)

(declare-fun lt!621588 () (_ BitVec 32))

(declare-fun lt!621587 () (_ BitVec 32))

(assert (=> d!152265 (= lt!621588 (bvmul (bvxor lt!621587 (bvlshr lt!621587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152265 (= lt!621587 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152265 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!948262 (let ((h!34379 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127375 (bvmul (bvxor h!34379 (bvlshr h!34379 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127375 (bvlshr x!127375 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!948262 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!948262 #b00000000000000000000000000000000))))))

(assert (=> d!152265 (= (toIndex!0 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621588 (bvlshr lt!621588 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411474 d!152265))

(declare-fun d!152267 () Bool)

(assert (=> d!152267 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121544 d!152267))

(declare-fun d!152271 () Bool)

(assert (=> d!152271 (= (array_inv!35878 a!2901) (bvsge (size!47148 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121544 d!152271))

(declare-fun d!152273 () Bool)

(assert (=> d!152273 (= (validKeyInArray!0 (select (arr!46597 a!2901) i!1037)) (and (not (= (select (arr!46597 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46597 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411476 d!152273))

(declare-fun b!1411703 () Bool)

(declare-fun e!798979 () SeekEntryResult!10811)

(declare-fun e!798980 () SeekEntryResult!10811)

(assert (=> b!1411703 (= e!798979 e!798980)))

(declare-fun lt!621628 () (_ BitVec 64))

(declare-fun lt!621630 () SeekEntryResult!10811)

(assert (=> b!1411703 (= lt!621628 (select (arr!46597 a!2901) (index!45623 lt!621630)))))

(declare-fun c!131184 () Bool)

(assert (=> b!1411703 (= c!131184 (= lt!621628 (select (arr!46597 a!2901) j!112)))))

(declare-fun b!1411704 () Bool)

(declare-fun c!131185 () Bool)

(assert (=> b!1411704 (= c!131185 (= lt!621628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798978 () SeekEntryResult!10811)

(assert (=> b!1411704 (= e!798980 e!798978)))

(declare-fun d!152275 () Bool)

(declare-fun lt!621629 () SeekEntryResult!10811)

(assert (=> d!152275 (and (or ((_ is Undefined!10811) lt!621629) (not ((_ is Found!10811) lt!621629)) (and (bvsge (index!45622 lt!621629) #b00000000000000000000000000000000) (bvslt (index!45622 lt!621629) (size!47148 a!2901)))) (or ((_ is Undefined!10811) lt!621629) ((_ is Found!10811) lt!621629) (not ((_ is MissingZero!10811) lt!621629)) (and (bvsge (index!45621 lt!621629) #b00000000000000000000000000000000) (bvslt (index!45621 lt!621629) (size!47148 a!2901)))) (or ((_ is Undefined!10811) lt!621629) ((_ is Found!10811) lt!621629) ((_ is MissingZero!10811) lt!621629) (not ((_ is MissingVacant!10811) lt!621629)) (and (bvsge (index!45624 lt!621629) #b00000000000000000000000000000000) (bvslt (index!45624 lt!621629) (size!47148 a!2901)))) (or ((_ is Undefined!10811) lt!621629) (ite ((_ is Found!10811) lt!621629) (= (select (arr!46597 a!2901) (index!45622 lt!621629)) (select (arr!46597 a!2901) j!112)) (ite ((_ is MissingZero!10811) lt!621629) (= (select (arr!46597 a!2901) (index!45621 lt!621629)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10811) lt!621629) (= (select (arr!46597 a!2901) (index!45624 lt!621629)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152275 (= lt!621629 e!798979)))

(declare-fun c!131183 () Bool)

(assert (=> d!152275 (= c!131183 (and ((_ is Intermediate!10811) lt!621630) (undefined!11623 lt!621630)))))

(assert (=> d!152275 (= lt!621630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46597 a!2901) j!112) mask!2840) (select (arr!46597 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152275 (validMask!0 mask!2840)))

(assert (=> d!152275 (= (seekEntryOrOpen!0 (select (arr!46597 a!2901) j!112) a!2901 mask!2840) lt!621629)))

(declare-fun b!1411705 () Bool)

(assert (=> b!1411705 (= e!798980 (Found!10811 (index!45623 lt!621630)))))

(declare-fun b!1411706 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96518 (_ BitVec 32)) SeekEntryResult!10811)

(assert (=> b!1411706 (= e!798978 (seekKeyOrZeroReturnVacant!0 (x!127371 lt!621630) (index!45623 lt!621630) (index!45623 lt!621630) (select (arr!46597 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1411707 () Bool)

(assert (=> b!1411707 (= e!798978 (MissingZero!10811 (index!45623 lt!621630)))))

(declare-fun b!1411708 () Bool)

(assert (=> b!1411708 (= e!798979 Undefined!10811)))

(assert (= (and d!152275 c!131183) b!1411708))

(assert (= (and d!152275 (not c!131183)) b!1411703))

(assert (= (and b!1411703 c!131184) b!1411705))

(assert (= (and b!1411703 (not c!131184)) b!1411704))

(assert (= (and b!1411704 c!131185) b!1411707))

(assert (= (and b!1411704 (not c!131185)) b!1411706))

(declare-fun m!1301567 () Bool)

(assert (=> b!1411703 m!1301567))

(declare-fun m!1301569 () Bool)

(assert (=> d!152275 m!1301569))

(assert (=> d!152275 m!1301395))

(assert (=> d!152275 m!1301381))

(assert (=> d!152275 m!1301399))

(assert (=> d!152275 m!1301399))

(assert (=> d!152275 m!1301381))

(declare-fun m!1301571 () Bool)

(assert (=> d!152275 m!1301571))

(declare-fun m!1301573 () Bool)

(assert (=> d!152275 m!1301573))

(declare-fun m!1301575 () Bool)

(assert (=> d!152275 m!1301575))

(assert (=> b!1411706 m!1301381))

(declare-fun m!1301577 () Bool)

(assert (=> b!1411706 m!1301577))

(assert (=> b!1411472 d!152275))

(declare-fun d!152285 () Bool)

(assert (=> d!152285 (= (validKeyInArray!0 (select (arr!46597 a!2901) j!112)) (and (not (= (select (arr!46597 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46597 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411477 d!152285))

(check-sat (not b!1411541) (not bm!67113) (not d!152239) (not b!1411542) (not bm!67120) (not b!1411617) (not b!1411614) (not d!152275) (not bm!67114) (not b!1411537) (not b!1411615) (not b!1411706) (not b!1411635) (not b!1411597) (not d!152235) (not d!152261) (not b!1411538))
(check-sat)
