; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121022 () Bool)

(assert start!121022)

(declare-fun b!1407445 () Bool)

(declare-fun res!945336 () Bool)

(declare-fun e!796595 () Bool)

(assert (=> b!1407445 (=> (not res!945336) (not e!796595))))

(declare-datatypes ((array!96227 0))(
  ( (array!96228 (arr!46458 (Array (_ BitVec 32) (_ BitVec 64))) (size!47008 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96227)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407445 (= res!945336 (validKeyInArray!0 (select (arr!46458 a!2901) j!112)))))

(declare-fun b!1407446 () Bool)

(declare-fun res!945334 () Bool)

(assert (=> b!1407446 (=> (not res!945334) (not e!796595))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407446 (= res!945334 (validKeyInArray!0 (select (arr!46458 a!2901) i!1037)))))

(declare-fun b!1407447 () Bool)

(declare-fun res!945340 () Bool)

(assert (=> b!1407447 (=> (not res!945340) (not e!796595))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1407447 (= res!945340 (and (= (size!47008 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47008 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47008 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407448 () Bool)

(declare-fun res!945338 () Bool)

(assert (=> b!1407448 (=> (not res!945338) (not e!796595))))

(declare-datatypes ((List!32977 0))(
  ( (Nil!32974) (Cons!32973 (h!34233 (_ BitVec 64)) (t!47671 List!32977)) )
))
(declare-fun arrayNoDuplicates!0 (array!96227 (_ BitVec 32) List!32977) Bool)

(assert (=> b!1407448 (= res!945338 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32974))))

(declare-fun b!1407449 () Bool)

(declare-fun e!796597 () Bool)

(declare-datatypes ((SeekEntryResult!10769 0))(
  ( (MissingZero!10769 (index!45453 (_ BitVec 32))) (Found!10769 (index!45454 (_ BitVec 32))) (Intermediate!10769 (undefined!11581 Bool) (index!45455 (_ BitVec 32)) (x!127060 (_ BitVec 32))) (Undefined!10769) (MissingVacant!10769 (index!45456 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96227 (_ BitVec 32)) SeekEntryResult!10769)

(assert (=> b!1407449 (= e!796597 (= (seekEntryOrOpen!0 (select (arr!46458 a!2901) j!112) a!2901 mask!2840) (Found!10769 j!112)))))

(declare-fun lt!619794 () (_ BitVec 32))

(declare-fun b!1407450 () Bool)

(declare-fun e!796596 () Bool)

(declare-fun lt!619793 () SeekEntryResult!10769)

(assert (=> b!1407450 (= e!796596 (or (bvslt (x!127060 lt!619793) #b00000000000000000000000000000000) (bvsgt (x!127060 lt!619793) #b01111111111111111111111111111110) (bvslt lt!619794 #b00000000000000000000000000000000) (bvsge lt!619794 (size!47008 a!2901)) (and (bvsge (index!45455 lt!619793) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619793) (size!47008 a!2901)))))))

(declare-fun b!1407451 () Bool)

(assert (=> b!1407451 (= e!796595 (not e!796596))))

(declare-fun res!945332 () Bool)

(assert (=> b!1407451 (=> res!945332 e!796596)))

(get-info :version)

(assert (=> b!1407451 (= res!945332 (or (not ((_ is Intermediate!10769) lt!619793)) (undefined!11581 lt!619793)))))

(assert (=> b!1407451 e!796597))

(declare-fun res!945339 () Bool)

(assert (=> b!1407451 (=> (not res!945339) (not e!796597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96227 (_ BitVec 32)) Bool)

(assert (=> b!1407451 (= res!945339 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47512 0))(
  ( (Unit!47513) )
))
(declare-fun lt!619792 () Unit!47512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47512)

(assert (=> b!1407451 (= lt!619792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96227 (_ BitVec 32)) SeekEntryResult!10769)

(assert (=> b!1407451 (= lt!619793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619794 (select (arr!46458 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407451 (= lt!619794 (toIndex!0 (select (arr!46458 a!2901) j!112) mask!2840))))

(declare-fun b!1407452 () Bool)

(declare-fun res!945337 () Bool)

(assert (=> b!1407452 (=> (not res!945337) (not e!796595))))

(assert (=> b!1407452 (= res!945337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!945335 () Bool)

(assert (=> start!121022 (=> (not res!945335) (not e!796595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121022 (= res!945335 (validMask!0 mask!2840))))

(assert (=> start!121022 e!796595))

(assert (=> start!121022 true))

(declare-fun array_inv!35486 (array!96227) Bool)

(assert (=> start!121022 (array_inv!35486 a!2901)))

(declare-fun b!1407453 () Bool)

(declare-fun res!945333 () Bool)

(assert (=> b!1407453 (=> res!945333 e!796596)))

(assert (=> b!1407453 (= res!945333 (not (= lt!619793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901)) mask!2840))))))

(assert (= (and start!121022 res!945335) b!1407447))

(assert (= (and b!1407447 res!945340) b!1407446))

(assert (= (and b!1407446 res!945334) b!1407445))

(assert (= (and b!1407445 res!945336) b!1407452))

(assert (= (and b!1407452 res!945337) b!1407448))

(assert (= (and b!1407448 res!945338) b!1407451))

(assert (= (and b!1407451 res!945339) b!1407449))

(assert (= (and b!1407451 (not res!945332)) b!1407453))

(assert (= (and b!1407453 (not res!945333)) b!1407450))

(declare-fun m!1296559 () Bool)

(assert (=> b!1407445 m!1296559))

(assert (=> b!1407445 m!1296559))

(declare-fun m!1296561 () Bool)

(assert (=> b!1407445 m!1296561))

(declare-fun m!1296563 () Bool)

(assert (=> b!1407453 m!1296563))

(declare-fun m!1296565 () Bool)

(assert (=> b!1407453 m!1296565))

(assert (=> b!1407453 m!1296565))

(declare-fun m!1296567 () Bool)

(assert (=> b!1407453 m!1296567))

(assert (=> b!1407453 m!1296567))

(assert (=> b!1407453 m!1296565))

(declare-fun m!1296569 () Bool)

(assert (=> b!1407453 m!1296569))

(assert (=> b!1407449 m!1296559))

(assert (=> b!1407449 m!1296559))

(declare-fun m!1296571 () Bool)

(assert (=> b!1407449 m!1296571))

(declare-fun m!1296573 () Bool)

(assert (=> b!1407448 m!1296573))

(declare-fun m!1296575 () Bool)

(assert (=> b!1407446 m!1296575))

(assert (=> b!1407446 m!1296575))

(declare-fun m!1296577 () Bool)

(assert (=> b!1407446 m!1296577))

(assert (=> b!1407451 m!1296559))

(declare-fun m!1296579 () Bool)

(assert (=> b!1407451 m!1296579))

(assert (=> b!1407451 m!1296559))

(declare-fun m!1296581 () Bool)

(assert (=> b!1407451 m!1296581))

(assert (=> b!1407451 m!1296559))

(declare-fun m!1296583 () Bool)

(assert (=> b!1407451 m!1296583))

(declare-fun m!1296585 () Bool)

(assert (=> b!1407451 m!1296585))

(declare-fun m!1296587 () Bool)

(assert (=> b!1407452 m!1296587))

(declare-fun m!1296589 () Bool)

(assert (=> start!121022 m!1296589))

(declare-fun m!1296591 () Bool)

(assert (=> start!121022 m!1296591))

(check-sat (not start!121022) (not b!1407452) (not b!1407449) (not b!1407445) (not b!1407448) (not b!1407446) (not b!1407451) (not b!1407453))
(check-sat)
(get-model)

(declare-fun b!1407493 () Bool)

(declare-fun c!130530 () Bool)

(declare-fun lt!619812 () (_ BitVec 64))

(assert (=> b!1407493 (= c!130530 (= lt!619812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796619 () SeekEntryResult!10769)

(declare-fun e!796618 () SeekEntryResult!10769)

(assert (=> b!1407493 (= e!796619 e!796618)))

(declare-fun b!1407494 () Bool)

(declare-fun lt!619811 () SeekEntryResult!10769)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96227 (_ BitVec 32)) SeekEntryResult!10769)

(assert (=> b!1407494 (= e!796618 (seekKeyOrZeroReturnVacant!0 (x!127060 lt!619811) (index!45455 lt!619811) (index!45455 lt!619811) (select (arr!46458 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407495 () Bool)

(assert (=> b!1407495 (= e!796619 (Found!10769 (index!45455 lt!619811)))))

(declare-fun b!1407496 () Bool)

(declare-fun e!796617 () SeekEntryResult!10769)

(assert (=> b!1407496 (= e!796617 e!796619)))

(assert (=> b!1407496 (= lt!619812 (select (arr!46458 a!2901) (index!45455 lt!619811)))))

(declare-fun c!130528 () Bool)

(assert (=> b!1407496 (= c!130528 (= lt!619812 (select (arr!46458 a!2901) j!112)))))

(declare-fun d!151595 () Bool)

(declare-fun lt!619810 () SeekEntryResult!10769)

(assert (=> d!151595 (and (or ((_ is Undefined!10769) lt!619810) (not ((_ is Found!10769) lt!619810)) (and (bvsge (index!45454 lt!619810) #b00000000000000000000000000000000) (bvslt (index!45454 lt!619810) (size!47008 a!2901)))) (or ((_ is Undefined!10769) lt!619810) ((_ is Found!10769) lt!619810) (not ((_ is MissingZero!10769) lt!619810)) (and (bvsge (index!45453 lt!619810) #b00000000000000000000000000000000) (bvslt (index!45453 lt!619810) (size!47008 a!2901)))) (or ((_ is Undefined!10769) lt!619810) ((_ is Found!10769) lt!619810) ((_ is MissingZero!10769) lt!619810) (not ((_ is MissingVacant!10769) lt!619810)) (and (bvsge (index!45456 lt!619810) #b00000000000000000000000000000000) (bvslt (index!45456 lt!619810) (size!47008 a!2901)))) (or ((_ is Undefined!10769) lt!619810) (ite ((_ is Found!10769) lt!619810) (= (select (arr!46458 a!2901) (index!45454 lt!619810)) (select (arr!46458 a!2901) j!112)) (ite ((_ is MissingZero!10769) lt!619810) (= (select (arr!46458 a!2901) (index!45453 lt!619810)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10769) lt!619810) (= (select (arr!46458 a!2901) (index!45456 lt!619810)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151595 (= lt!619810 e!796617)))

(declare-fun c!130529 () Bool)

(assert (=> d!151595 (= c!130529 (and ((_ is Intermediate!10769) lt!619811) (undefined!11581 lt!619811)))))

(assert (=> d!151595 (= lt!619811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46458 a!2901) j!112) mask!2840) (select (arr!46458 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151595 (validMask!0 mask!2840)))

(assert (=> d!151595 (= (seekEntryOrOpen!0 (select (arr!46458 a!2901) j!112) a!2901 mask!2840) lt!619810)))

(declare-fun b!1407497 () Bool)

(assert (=> b!1407497 (= e!796617 Undefined!10769)))

(declare-fun b!1407498 () Bool)

(assert (=> b!1407498 (= e!796618 (MissingZero!10769 (index!45455 lt!619811)))))

(assert (= (and d!151595 c!130529) b!1407497))

(assert (= (and d!151595 (not c!130529)) b!1407496))

(assert (= (and b!1407496 c!130528) b!1407495))

(assert (= (and b!1407496 (not c!130528)) b!1407493))

(assert (= (and b!1407493 c!130530) b!1407498))

(assert (= (and b!1407493 (not c!130530)) b!1407494))

(assert (=> b!1407494 m!1296559))

(declare-fun m!1296627 () Bool)

(assert (=> b!1407494 m!1296627))

(declare-fun m!1296629 () Bool)

(assert (=> b!1407496 m!1296629))

(assert (=> d!151595 m!1296579))

(assert (=> d!151595 m!1296559))

(declare-fun m!1296631 () Bool)

(assert (=> d!151595 m!1296631))

(assert (=> d!151595 m!1296559))

(assert (=> d!151595 m!1296579))

(declare-fun m!1296633 () Bool)

(assert (=> d!151595 m!1296633))

(assert (=> d!151595 m!1296589))

(declare-fun m!1296635 () Bool)

(assert (=> d!151595 m!1296635))

(declare-fun m!1296637 () Bool)

(assert (=> d!151595 m!1296637))

(assert (=> b!1407449 d!151595))

(declare-fun b!1407525 () Bool)

(declare-fun e!796638 () Bool)

(declare-fun call!66994 () Bool)

(assert (=> b!1407525 (= e!796638 call!66994)))

(declare-fun b!1407526 () Bool)

(declare-fun e!796636 () Bool)

(declare-fun e!796637 () Bool)

(assert (=> b!1407526 (= e!796636 e!796637)))

(declare-fun c!130539 () Bool)

(assert (=> b!1407526 (= c!130539 (validKeyInArray!0 (select (arr!46458 a!2901) j!112)))))

(declare-fun bm!66991 () Bool)

(assert (=> bm!66991 (= call!66994 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151599 () Bool)

(declare-fun res!945379 () Bool)

(assert (=> d!151599 (=> res!945379 e!796636)))

(assert (=> d!151599 (= res!945379 (bvsge j!112 (size!47008 a!2901)))))

(assert (=> d!151599 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796636)))

(declare-fun b!1407527 () Bool)

(assert (=> b!1407527 (= e!796637 call!66994)))

(declare-fun b!1407528 () Bool)

(assert (=> b!1407528 (= e!796637 e!796638)))

(declare-fun lt!619823 () (_ BitVec 64))

(assert (=> b!1407528 (= lt!619823 (select (arr!46458 a!2901) j!112))))

(declare-fun lt!619825 () Unit!47512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96227 (_ BitVec 64) (_ BitVec 32)) Unit!47512)

(assert (=> b!1407528 (= lt!619825 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619823 j!112))))

(declare-fun arrayContainsKey!0 (array!96227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1407528 (arrayContainsKey!0 a!2901 lt!619823 #b00000000000000000000000000000000)))

(declare-fun lt!619824 () Unit!47512)

(assert (=> b!1407528 (= lt!619824 lt!619825)))

(declare-fun res!945378 () Bool)

(assert (=> b!1407528 (= res!945378 (= (seekEntryOrOpen!0 (select (arr!46458 a!2901) j!112) a!2901 mask!2840) (Found!10769 j!112)))))

(assert (=> b!1407528 (=> (not res!945378) (not e!796638))))

(assert (= (and d!151599 (not res!945379)) b!1407526))

(assert (= (and b!1407526 c!130539) b!1407528))

(assert (= (and b!1407526 (not c!130539)) b!1407527))

(assert (= (and b!1407528 res!945378) b!1407525))

(assert (= (or b!1407525 b!1407527) bm!66991))

(assert (=> b!1407526 m!1296559))

(assert (=> b!1407526 m!1296559))

(assert (=> b!1407526 m!1296561))

(declare-fun m!1296639 () Bool)

(assert (=> bm!66991 m!1296639))

(assert (=> b!1407528 m!1296559))

(declare-fun m!1296641 () Bool)

(assert (=> b!1407528 m!1296641))

(declare-fun m!1296643 () Bool)

(assert (=> b!1407528 m!1296643))

(assert (=> b!1407528 m!1296559))

(assert (=> b!1407528 m!1296571))

(assert (=> b!1407451 d!151599))

(declare-fun d!151603 () Bool)

(assert (=> d!151603 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619830 () Unit!47512)

(declare-fun choose!38 (array!96227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47512)

(assert (=> d!151603 (= lt!619830 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151603 (validMask!0 mask!2840)))

(assert (=> d!151603 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619830)))

(declare-fun bs!41021 () Bool)

(assert (= bs!41021 d!151603))

(assert (=> bs!41021 m!1296585))

(declare-fun m!1296653 () Bool)

(assert (=> bs!41021 m!1296653))

(assert (=> bs!41021 m!1296589))

(assert (=> b!1407451 d!151603))

(declare-fun b!1407601 () Bool)

(declare-fun e!796686 () SeekEntryResult!10769)

(assert (=> b!1407601 (= e!796686 (Intermediate!10769 true lt!619794 #b00000000000000000000000000000000))))

(declare-fun b!1407602 () Bool)

(declare-fun lt!619860 () SeekEntryResult!10769)

(assert (=> b!1407602 (and (bvsge (index!45455 lt!619860) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619860) (size!47008 a!2901)))))

(declare-fun e!796688 () Bool)

(assert (=> b!1407602 (= e!796688 (= (select (arr!46458 a!2901) (index!45455 lt!619860)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151607 () Bool)

(declare-fun e!796684 () Bool)

(assert (=> d!151607 e!796684))

(declare-fun c!130565 () Bool)

(assert (=> d!151607 (= c!130565 (and ((_ is Intermediate!10769) lt!619860) (undefined!11581 lt!619860)))))

(assert (=> d!151607 (= lt!619860 e!796686)))

(declare-fun c!130566 () Bool)

(assert (=> d!151607 (= c!130566 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619859 () (_ BitVec 64))

(assert (=> d!151607 (= lt!619859 (select (arr!46458 a!2901) lt!619794))))

(assert (=> d!151607 (validMask!0 mask!2840)))

(assert (=> d!151607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619794 (select (arr!46458 a!2901) j!112) a!2901 mask!2840) lt!619860)))

(declare-fun b!1407603 () Bool)

(assert (=> b!1407603 (= e!796684 (bvsge (x!127060 lt!619860) #b01111111111111111111111111111110))))

(declare-fun b!1407604 () Bool)

(declare-fun e!796687 () SeekEntryResult!10769)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407604 (= e!796687 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!619794 #b00000000000000000000000000000000 mask!2840) (select (arr!46458 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407605 () Bool)

(assert (=> b!1407605 (= e!796687 (Intermediate!10769 false lt!619794 #b00000000000000000000000000000000))))

(declare-fun b!1407606 () Bool)

(assert (=> b!1407606 (and (bvsge (index!45455 lt!619860) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619860) (size!47008 a!2901)))))

(declare-fun res!945405 () Bool)

(assert (=> b!1407606 (= res!945405 (= (select (arr!46458 a!2901) (index!45455 lt!619860)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407606 (=> res!945405 e!796688)))

(declare-fun b!1407607 () Bool)

(assert (=> b!1407607 (and (bvsge (index!45455 lt!619860) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619860) (size!47008 a!2901)))))

(declare-fun res!945407 () Bool)

(assert (=> b!1407607 (= res!945407 (= (select (arr!46458 a!2901) (index!45455 lt!619860)) (select (arr!46458 a!2901) j!112)))))

(assert (=> b!1407607 (=> res!945407 e!796688)))

(declare-fun e!796685 () Bool)

(assert (=> b!1407607 (= e!796685 e!796688)))

(declare-fun b!1407608 () Bool)

(assert (=> b!1407608 (= e!796684 e!796685)))

(declare-fun res!945406 () Bool)

(assert (=> b!1407608 (= res!945406 (and ((_ is Intermediate!10769) lt!619860) (not (undefined!11581 lt!619860)) (bvslt (x!127060 lt!619860) #b01111111111111111111111111111110) (bvsge (x!127060 lt!619860) #b00000000000000000000000000000000) (bvsge (x!127060 lt!619860) #b00000000000000000000000000000000)))))

(assert (=> b!1407608 (=> (not res!945406) (not e!796685))))

(declare-fun b!1407609 () Bool)

(assert (=> b!1407609 (= e!796686 e!796687)))

(declare-fun c!130564 () Bool)

(assert (=> b!1407609 (= c!130564 (or (= lt!619859 (select (arr!46458 a!2901) j!112)) (= (bvadd lt!619859 lt!619859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151607 c!130566) b!1407601))

(assert (= (and d!151607 (not c!130566)) b!1407609))

(assert (= (and b!1407609 c!130564) b!1407605))

(assert (= (and b!1407609 (not c!130564)) b!1407604))

(assert (= (and d!151607 c!130565) b!1407603))

(assert (= (and d!151607 (not c!130565)) b!1407608))

(assert (= (and b!1407608 res!945406) b!1407607))

(assert (= (and b!1407607 (not res!945407)) b!1407606))

(assert (= (and b!1407606 (not res!945405)) b!1407602))

(declare-fun m!1296681 () Bool)

(assert (=> b!1407606 m!1296681))

(declare-fun m!1296683 () Bool)

(assert (=> d!151607 m!1296683))

(assert (=> d!151607 m!1296589))

(declare-fun m!1296685 () Bool)

(assert (=> b!1407604 m!1296685))

(assert (=> b!1407604 m!1296685))

(assert (=> b!1407604 m!1296559))

(declare-fun m!1296687 () Bool)

(assert (=> b!1407604 m!1296687))

(assert (=> b!1407607 m!1296681))

(assert (=> b!1407602 m!1296681))

(assert (=> b!1407451 d!151607))

(declare-fun d!151625 () Bool)

(declare-fun lt!619879 () (_ BitVec 32))

(declare-fun lt!619878 () (_ BitVec 32))

(assert (=> d!151625 (= lt!619879 (bvmul (bvxor lt!619878 (bvlshr lt!619878 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151625 (= lt!619878 ((_ extract 31 0) (bvand (bvxor (select (arr!46458 a!2901) j!112) (bvlshr (select (arr!46458 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151625 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945408 (let ((h!34236 ((_ extract 31 0) (bvand (bvxor (select (arr!46458 a!2901) j!112) (bvlshr (select (arr!46458 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127065 (bvmul (bvxor h!34236 (bvlshr h!34236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127065 (bvlshr x!127065 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945408 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945408 #b00000000000000000000000000000000))))))

(assert (=> d!151625 (= (toIndex!0 (select (arr!46458 a!2901) j!112) mask!2840) (bvand (bvxor lt!619879 (bvlshr lt!619879 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407451 d!151625))

(declare-fun d!151633 () Bool)

(assert (=> d!151633 (= (validKeyInArray!0 (select (arr!46458 a!2901) j!112)) (and (not (= (select (arr!46458 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46458 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407445 d!151633))

(declare-fun b!1407627 () Bool)

(declare-fun e!796702 () Bool)

(declare-fun call!67003 () Bool)

(assert (=> b!1407627 (= e!796702 call!67003)))

(declare-fun b!1407628 () Bool)

(declare-fun e!796700 () Bool)

(declare-fun e!796701 () Bool)

(assert (=> b!1407628 (= e!796700 e!796701)))

(declare-fun c!130572 () Bool)

(assert (=> b!1407628 (= c!130572 (validKeyInArray!0 (select (arr!46458 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67000 () Bool)

(assert (=> bm!67000 (= call!67003 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151635 () Bool)

(declare-fun res!945417 () Bool)

(assert (=> d!151635 (=> res!945417 e!796700)))

(assert (=> d!151635 (= res!945417 (bvsge #b00000000000000000000000000000000 (size!47008 a!2901)))))

(assert (=> d!151635 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796700)))

(declare-fun b!1407629 () Bool)

(assert (=> b!1407629 (= e!796701 call!67003)))

(declare-fun b!1407630 () Bool)

(assert (=> b!1407630 (= e!796701 e!796702)))

(declare-fun lt!619880 () (_ BitVec 64))

(assert (=> b!1407630 (= lt!619880 (select (arr!46458 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619882 () Unit!47512)

(assert (=> b!1407630 (= lt!619882 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619880 #b00000000000000000000000000000000))))

(assert (=> b!1407630 (arrayContainsKey!0 a!2901 lt!619880 #b00000000000000000000000000000000)))

(declare-fun lt!619881 () Unit!47512)

(assert (=> b!1407630 (= lt!619881 lt!619882)))

(declare-fun res!945416 () Bool)

(assert (=> b!1407630 (= res!945416 (= (seekEntryOrOpen!0 (select (arr!46458 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10769 #b00000000000000000000000000000000)))))

(assert (=> b!1407630 (=> (not res!945416) (not e!796702))))

(assert (= (and d!151635 (not res!945417)) b!1407628))

(assert (= (and b!1407628 c!130572) b!1407630))

(assert (= (and b!1407628 (not c!130572)) b!1407629))

(assert (= (and b!1407630 res!945416) b!1407627))

(assert (= (or b!1407627 b!1407629) bm!67000))

(declare-fun m!1296699 () Bool)

(assert (=> b!1407628 m!1296699))

(assert (=> b!1407628 m!1296699))

(declare-fun m!1296701 () Bool)

(assert (=> b!1407628 m!1296701))

(declare-fun m!1296703 () Bool)

(assert (=> bm!67000 m!1296703))

(assert (=> b!1407630 m!1296699))

(declare-fun m!1296705 () Bool)

(assert (=> b!1407630 m!1296705))

(declare-fun m!1296707 () Bool)

(assert (=> b!1407630 m!1296707))

(assert (=> b!1407630 m!1296699))

(declare-fun m!1296709 () Bool)

(assert (=> b!1407630 m!1296709))

(assert (=> b!1407452 d!151635))

(declare-fun d!151637 () Bool)

(assert (=> d!151637 (= (validKeyInArray!0 (select (arr!46458 a!2901) i!1037)) (and (not (= (select (arr!46458 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46458 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407446 d!151637))

(declare-fun d!151639 () Bool)

(declare-fun res!945428 () Bool)

(declare-fun e!796717 () Bool)

(assert (=> d!151639 (=> res!945428 e!796717)))

(assert (=> d!151639 (= res!945428 (bvsge #b00000000000000000000000000000000 (size!47008 a!2901)))))

(assert (=> d!151639 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32974) e!796717)))

(declare-fun bm!67005 () Bool)

(declare-fun call!67008 () Bool)

(declare-fun c!130577 () Bool)

(assert (=> bm!67005 (= call!67008 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130577 (Cons!32973 (select (arr!46458 a!2901) #b00000000000000000000000000000000) Nil!32974) Nil!32974)))))

(declare-fun b!1407649 () Bool)

(declare-fun e!796718 () Bool)

(assert (=> b!1407649 (= e!796717 e!796718)))

(declare-fun res!945429 () Bool)

(assert (=> b!1407649 (=> (not res!945429) (not e!796718))))

(declare-fun e!796719 () Bool)

(assert (=> b!1407649 (= res!945429 (not e!796719))))

(declare-fun res!945430 () Bool)

(assert (=> b!1407649 (=> (not res!945430) (not e!796719))))

(assert (=> b!1407649 (= res!945430 (validKeyInArray!0 (select (arr!46458 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407650 () Bool)

(declare-fun contains!9801 (List!32977 (_ BitVec 64)) Bool)

(assert (=> b!1407650 (= e!796719 (contains!9801 Nil!32974 (select (arr!46458 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407651 () Bool)

(declare-fun e!796720 () Bool)

(assert (=> b!1407651 (= e!796718 e!796720)))

(assert (=> b!1407651 (= c!130577 (validKeyInArray!0 (select (arr!46458 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407652 () Bool)

(assert (=> b!1407652 (= e!796720 call!67008)))

(declare-fun b!1407653 () Bool)

(assert (=> b!1407653 (= e!796720 call!67008)))

(assert (= (and d!151639 (not res!945428)) b!1407649))

(assert (= (and b!1407649 res!945430) b!1407650))

(assert (= (and b!1407649 res!945429) b!1407651))

(assert (= (and b!1407651 c!130577) b!1407652))

(assert (= (and b!1407651 (not c!130577)) b!1407653))

(assert (= (or b!1407652 b!1407653) bm!67005))

(assert (=> bm!67005 m!1296699))

(declare-fun m!1296731 () Bool)

(assert (=> bm!67005 m!1296731))

(assert (=> b!1407649 m!1296699))

(assert (=> b!1407649 m!1296699))

(assert (=> b!1407649 m!1296701))

(assert (=> b!1407650 m!1296699))

(assert (=> b!1407650 m!1296699))

(declare-fun m!1296733 () Bool)

(assert (=> b!1407650 m!1296733))

(assert (=> b!1407651 m!1296699))

(assert (=> b!1407651 m!1296699))

(assert (=> b!1407651 m!1296701))

(assert (=> b!1407448 d!151639))

(declare-fun d!151647 () Bool)

(assert (=> d!151647 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121022 d!151647))

(declare-fun d!151649 () Bool)

(assert (=> d!151649 (= (array_inv!35486 a!2901) (bvsge (size!47008 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121022 d!151649))

(declare-fun b!1407672 () Bool)

(declare-fun e!796732 () SeekEntryResult!10769)

(assert (=> b!1407672 (= e!796732 (Intermediate!10769 true (toIndex!0 (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407673 () Bool)

(declare-fun lt!619902 () SeekEntryResult!10769)

(assert (=> b!1407673 (and (bvsge (index!45455 lt!619902) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619902) (size!47008 (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901)))))))

(declare-fun e!796734 () Bool)

(assert (=> b!1407673 (= e!796734 (= (select (arr!46458 (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901))) (index!45455 lt!619902)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151651 () Bool)

(declare-fun e!796730 () Bool)

(assert (=> d!151651 e!796730))

(declare-fun c!130588 () Bool)

(assert (=> d!151651 (= c!130588 (and ((_ is Intermediate!10769) lt!619902) (undefined!11581 lt!619902)))))

(assert (=> d!151651 (= lt!619902 e!796732)))

(declare-fun c!130589 () Bool)

(assert (=> d!151651 (= c!130589 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619901 () (_ BitVec 64))

(assert (=> d!151651 (= lt!619901 (select (arr!46458 (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901))) (toIndex!0 (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151651 (validMask!0 mask!2840)))

(assert (=> d!151651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901)) mask!2840) lt!619902)))

(declare-fun b!1407674 () Bool)

(assert (=> b!1407674 (= e!796730 (bvsge (x!127060 lt!619902) #b01111111111111111111111111111110))))

(declare-fun b!1407675 () Bool)

(declare-fun e!796733 () SeekEntryResult!10769)

(assert (=> b!1407675 (= e!796733 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901)) mask!2840))))

(declare-fun b!1407676 () Bool)

(assert (=> b!1407676 (= e!796733 (Intermediate!10769 false (toIndex!0 (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407677 () Bool)

(assert (=> b!1407677 (and (bvsge (index!45455 lt!619902) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619902) (size!47008 (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901)))))))

(declare-fun res!945431 () Bool)

(assert (=> b!1407677 (= res!945431 (= (select (arr!46458 (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901))) (index!45455 lt!619902)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407677 (=> res!945431 e!796734)))

(declare-fun b!1407678 () Bool)

(assert (=> b!1407678 (and (bvsge (index!45455 lt!619902) #b00000000000000000000000000000000) (bvslt (index!45455 lt!619902) (size!47008 (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901)))))))

(declare-fun res!945433 () Bool)

(assert (=> b!1407678 (= res!945433 (= (select (arr!46458 (array!96228 (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47008 a!2901))) (index!45455 lt!619902)) (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407678 (=> res!945433 e!796734)))

(declare-fun e!796731 () Bool)

(assert (=> b!1407678 (= e!796731 e!796734)))

(declare-fun b!1407679 () Bool)

(assert (=> b!1407679 (= e!796730 e!796731)))

(declare-fun res!945432 () Bool)

(assert (=> b!1407679 (= res!945432 (and ((_ is Intermediate!10769) lt!619902) (not (undefined!11581 lt!619902)) (bvslt (x!127060 lt!619902) #b01111111111111111111111111111110) (bvsge (x!127060 lt!619902) #b00000000000000000000000000000000) (bvsge (x!127060 lt!619902) #b00000000000000000000000000000000)))))

(assert (=> b!1407679 (=> (not res!945432) (not e!796731))))

(declare-fun b!1407680 () Bool)

(assert (=> b!1407680 (= e!796732 e!796733)))

(declare-fun c!130587 () Bool)

(assert (=> b!1407680 (= c!130587 (or (= lt!619901 (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619901 lt!619901) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151651 c!130589) b!1407672))

(assert (= (and d!151651 (not c!130589)) b!1407680))

(assert (= (and b!1407680 c!130587) b!1407676))

(assert (= (and b!1407680 (not c!130587)) b!1407675))

(assert (= (and d!151651 c!130588) b!1407674))

(assert (= (and d!151651 (not c!130588)) b!1407679))

(assert (= (and b!1407679 res!945432) b!1407678))

(assert (= (and b!1407678 (not res!945433)) b!1407677))

(assert (= (and b!1407677 (not res!945431)) b!1407673))

(declare-fun m!1296747 () Bool)

(assert (=> b!1407677 m!1296747))

(assert (=> d!151651 m!1296567))

(declare-fun m!1296749 () Bool)

(assert (=> d!151651 m!1296749))

(assert (=> d!151651 m!1296589))

(assert (=> b!1407675 m!1296567))

(declare-fun m!1296751 () Bool)

(assert (=> b!1407675 m!1296751))

(assert (=> b!1407675 m!1296751))

(assert (=> b!1407675 m!1296565))

(declare-fun m!1296753 () Bool)

(assert (=> b!1407675 m!1296753))

(assert (=> b!1407678 m!1296747))

(assert (=> b!1407673 m!1296747))

(assert (=> b!1407453 d!151651))

(declare-fun d!151655 () Bool)

(declare-fun lt!619904 () (_ BitVec 32))

(declare-fun lt!619903 () (_ BitVec 32))

(assert (=> d!151655 (= lt!619904 (bvmul (bvxor lt!619903 (bvlshr lt!619903 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151655 (= lt!619903 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151655 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945408 (let ((h!34236 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127065 (bvmul (bvxor h!34236 (bvlshr h!34236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127065 (bvlshr x!127065 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945408 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945408 #b00000000000000000000000000000000))))))

(assert (=> d!151655 (= (toIndex!0 (select (store (arr!46458 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619904 (bvlshr lt!619904 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407453 d!151655))

(check-sat (not b!1407494) (not b!1407528) (not bm!67005) (not d!151651) (not d!151595) (not b!1407649) (not b!1407651) (not d!151603) (not bm!66991) (not b!1407604) (not bm!67000) (not b!1407526) (not b!1407628) (not b!1407675) (not b!1407630) (not d!151607) (not b!1407650))
(check-sat)
