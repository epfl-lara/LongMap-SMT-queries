; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119524 () Bool)

(assert start!119524)

(declare-fun res!932198 () Bool)

(declare-fun e!788577 () Bool)

(assert (=> start!119524 (=> (not res!932198) (not e!788577))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119524 (= res!932198 (validMask!0 mask!2840))))

(assert (=> start!119524 e!788577))

(assert (=> start!119524 true))

(declare-datatypes ((array!95257 0))(
  ( (array!95258 (arr!45988 (Array (_ BitVec 32) (_ BitVec 64))) (size!46538 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95257)

(declare-fun array_inv!35016 (array!95257) Bool)

(assert (=> start!119524 (array_inv!35016 a!2901)))

(declare-fun b!1392619 () Bool)

(declare-fun res!932197 () Bool)

(assert (=> b!1392619 (=> (not res!932197) (not e!788577))))

(declare-datatypes ((List!32507 0))(
  ( (Nil!32504) (Cons!32503 (h!33733 (_ BitVec 64)) (t!47201 List!32507)) )
))
(declare-fun arrayNoDuplicates!0 (array!95257 (_ BitVec 32) List!32507) Bool)

(assert (=> b!1392619 (= res!932197 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32504))))

(declare-fun b!1392620 () Bool)

(declare-fun e!788578 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10305 0))(
  ( (MissingZero!10305 (index!43591 (_ BitVec 32))) (Found!10305 (index!43592 (_ BitVec 32))) (Intermediate!10305 (undefined!11117 Bool) (index!43593 (_ BitVec 32)) (x!125271 (_ BitVec 32))) (Undefined!10305) (MissingVacant!10305 (index!43594 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95257 (_ BitVec 32)) SeekEntryResult!10305)

(assert (=> b!1392620 (= e!788578 (= (seekEntryOrOpen!0 (select (arr!45988 a!2901) j!112) a!2901 mask!2840) (Found!10305 j!112)))))

(declare-fun b!1392621 () Bool)

(declare-fun res!932196 () Bool)

(assert (=> b!1392621 (=> (not res!932196) (not e!788577))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392621 (= res!932196 (and (= (size!46538 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46538 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46538 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392622 () Bool)

(declare-fun e!788576 () Bool)

(assert (=> b!1392622 (= e!788577 (not e!788576))))

(declare-fun res!932199 () Bool)

(assert (=> b!1392622 (=> res!932199 e!788576)))

(declare-fun lt!611661 () SeekEntryResult!10305)

(assert (=> b!1392622 (= res!932199 (or (not (is-Intermediate!10305 lt!611661)) (undefined!11117 lt!611661)))))

(assert (=> b!1392622 e!788578))

(declare-fun res!932193 () Bool)

(assert (=> b!1392622 (=> (not res!932193) (not e!788578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95257 (_ BitVec 32)) Bool)

(assert (=> b!1392622 (= res!932193 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46614 0))(
  ( (Unit!46615) )
))
(declare-fun lt!611660 () Unit!46614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46614)

(assert (=> b!1392622 (= lt!611660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95257 (_ BitVec 32)) SeekEntryResult!10305)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392622 (= lt!611661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45988 a!2901) j!112) mask!2840) (select (arr!45988 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392623 () Bool)

(declare-fun res!932194 () Bool)

(assert (=> b!1392623 (=> (not res!932194) (not e!788577))))

(assert (=> b!1392623 (= res!932194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392624 () Bool)

(declare-fun res!932195 () Bool)

(assert (=> b!1392624 (=> (not res!932195) (not e!788577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392624 (= res!932195 (validKeyInArray!0 (select (arr!45988 a!2901) i!1037)))))

(declare-fun b!1392625 () Bool)

(declare-fun res!932200 () Bool)

(assert (=> b!1392625 (=> (not res!932200) (not e!788577))))

(assert (=> b!1392625 (= res!932200 (validKeyInArray!0 (select (arr!45988 a!2901) j!112)))))

(declare-fun b!1392626 () Bool)

(declare-fun res!932192 () Bool)

(assert (=> b!1392626 (=> res!932192 e!788576)))

(assert (=> b!1392626 (= res!932192 (not (= lt!611661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901)) mask!2840))))))

(declare-fun b!1392627 () Bool)

(assert (=> b!1392627 (= e!788576 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (= (and start!119524 res!932198) b!1392621))

(assert (= (and b!1392621 res!932196) b!1392624))

(assert (= (and b!1392624 res!932195) b!1392625))

(assert (= (and b!1392625 res!932200) b!1392623))

(assert (= (and b!1392623 res!932194) b!1392619))

(assert (= (and b!1392619 res!932197) b!1392622))

(assert (= (and b!1392622 res!932193) b!1392620))

(assert (= (and b!1392622 (not res!932199)) b!1392626))

(assert (= (and b!1392626 (not res!932192)) b!1392627))

(declare-fun m!1278401 () Bool)

(assert (=> b!1392623 m!1278401))

(declare-fun m!1278403 () Bool)

(assert (=> b!1392620 m!1278403))

(assert (=> b!1392620 m!1278403))

(declare-fun m!1278405 () Bool)

(assert (=> b!1392620 m!1278405))

(assert (=> b!1392625 m!1278403))

(assert (=> b!1392625 m!1278403))

(declare-fun m!1278407 () Bool)

(assert (=> b!1392625 m!1278407))

(declare-fun m!1278409 () Bool)

(assert (=> b!1392619 m!1278409))

(declare-fun m!1278411 () Bool)

(assert (=> start!119524 m!1278411))

(declare-fun m!1278413 () Bool)

(assert (=> start!119524 m!1278413))

(assert (=> b!1392622 m!1278403))

(declare-fun m!1278415 () Bool)

(assert (=> b!1392622 m!1278415))

(assert (=> b!1392622 m!1278403))

(declare-fun m!1278417 () Bool)

(assert (=> b!1392622 m!1278417))

(assert (=> b!1392622 m!1278415))

(assert (=> b!1392622 m!1278403))

(declare-fun m!1278419 () Bool)

(assert (=> b!1392622 m!1278419))

(declare-fun m!1278421 () Bool)

(assert (=> b!1392622 m!1278421))

(declare-fun m!1278423 () Bool)

(assert (=> b!1392624 m!1278423))

(assert (=> b!1392624 m!1278423))

(declare-fun m!1278425 () Bool)

(assert (=> b!1392624 m!1278425))

(declare-fun m!1278427 () Bool)

(assert (=> b!1392626 m!1278427))

(declare-fun m!1278429 () Bool)

(assert (=> b!1392626 m!1278429))

(assert (=> b!1392626 m!1278429))

(declare-fun m!1278431 () Bool)

(assert (=> b!1392626 m!1278431))

(assert (=> b!1392626 m!1278431))

(assert (=> b!1392626 m!1278429))

(declare-fun m!1278433 () Bool)

(assert (=> b!1392626 m!1278433))

(push 1)

(assert (not b!1392623))

(assert (not b!1392622))

(assert (not b!1392625))

(assert (not b!1392620))

(assert (not b!1392619))

(assert (not start!119524))

(assert (not b!1392626))

(assert (not b!1392624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1392660 () Bool)

(declare-fun e!788604 () Bool)

(declare-fun call!66790 () Bool)

(assert (=> b!1392660 (= e!788604 call!66790)))

(declare-fun b!1392661 () Bool)

(declare-fun e!788605 () Bool)

(assert (=> b!1392661 (= e!788604 e!788605)))

(declare-fun lt!611689 () (_ BitVec 64))

(assert (=> b!1392661 (= lt!611689 (select (arr!45988 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611690 () Unit!46614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95257 (_ BitVec 64) (_ BitVec 32)) Unit!46614)

(assert (=> b!1392661 (= lt!611690 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611689 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392661 (arrayContainsKey!0 a!2901 lt!611689 #b00000000000000000000000000000000)))

(declare-fun lt!611691 () Unit!46614)

(assert (=> b!1392661 (= lt!611691 lt!611690)))

(declare-fun res!932217 () Bool)

(assert (=> b!1392661 (= res!932217 (= (seekEntryOrOpen!0 (select (arr!45988 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10305 #b00000000000000000000000000000000)))))

(assert (=> b!1392661 (=> (not res!932217) (not e!788605))))

(declare-fun bm!66787 () Bool)

(assert (=> bm!66787 (= call!66790 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392662 () Bool)

(declare-fun e!788606 () Bool)

(assert (=> b!1392662 (= e!788606 e!788604)))

(declare-fun c!129672 () Bool)

(assert (=> b!1392662 (= c!129672 (validKeyInArray!0 (select (arr!45988 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150509 () Bool)

(declare-fun res!932218 () Bool)

(assert (=> d!150509 (=> res!932218 e!788606)))

(assert (=> d!150509 (= res!932218 (bvsge #b00000000000000000000000000000000 (size!46538 a!2901)))))

(assert (=> d!150509 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788606)))

(declare-fun b!1392663 () Bool)

(assert (=> b!1392663 (= e!788605 call!66790)))

(assert (= (and d!150509 (not res!932218)) b!1392662))

(assert (= (and b!1392662 c!129672) b!1392661))

(assert (= (and b!1392662 (not c!129672)) b!1392660))

(assert (= (and b!1392661 res!932217) b!1392663))

(assert (= (or b!1392663 b!1392660) bm!66787))

(declare-fun m!1278455 () Bool)

(assert (=> b!1392661 m!1278455))

(declare-fun m!1278457 () Bool)

(assert (=> b!1392661 m!1278457))

(declare-fun m!1278459 () Bool)

(assert (=> b!1392661 m!1278459))

(assert (=> b!1392661 m!1278455))

(declare-fun m!1278461 () Bool)

(assert (=> b!1392661 m!1278461))

(declare-fun m!1278463 () Bool)

(assert (=> bm!66787 m!1278463))

(assert (=> b!1392662 m!1278455))

(assert (=> b!1392662 m!1278455))

(declare-fun m!1278465 () Bool)

(assert (=> b!1392662 m!1278465))

(assert (=> b!1392623 d!150509))

(declare-fun d!150513 () Bool)

(assert (=> d!150513 (= (validKeyInArray!0 (select (arr!45988 a!2901) i!1037)) (and (not (= (select (arr!45988 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45988 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392624 d!150513))

(declare-fun d!150515 () Bool)

(assert (=> d!150515 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119524 d!150515))

(declare-fun d!150517 () Bool)

(assert (=> d!150517 (= (array_inv!35016 a!2901) (bvsge (size!46538 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119524 d!150517))

(declare-fun b!1392732 () Bool)

(declare-fun e!788651 () Bool)

(declare-fun contains!9771 (List!32507 (_ BitVec 64)) Bool)

(assert (=> b!1392732 (= e!788651 (contains!9771 Nil!32504 (select (arr!45988 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66791 () Bool)

(declare-fun call!66794 () Bool)

(declare-fun c!129694 () Bool)

(assert (=> bm!66791 (= call!66794 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129694 (Cons!32503 (select (arr!45988 a!2901) #b00000000000000000000000000000000) Nil!32504) Nil!32504)))))

(declare-fun b!1392733 () Bool)

(declare-fun e!788649 () Bool)

(declare-fun e!788648 () Bool)

(assert (=> b!1392733 (= e!788649 e!788648)))

(assert (=> b!1392733 (= c!129694 (validKeyInArray!0 (select (arr!45988 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392734 () Bool)

(declare-fun e!788650 () Bool)

(assert (=> b!1392734 (= e!788650 e!788649)))

(declare-fun res!932249 () Bool)

(assert (=> b!1392734 (=> (not res!932249) (not e!788649))))

(assert (=> b!1392734 (= res!932249 (not e!788651))))

(declare-fun res!932247 () Bool)

(assert (=> b!1392734 (=> (not res!932247) (not e!788651))))

(assert (=> b!1392734 (= res!932247 (validKeyInArray!0 (select (arr!45988 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392735 () Bool)

(assert (=> b!1392735 (= e!788648 call!66794)))

(declare-fun d!150519 () Bool)

(declare-fun res!932248 () Bool)

(assert (=> d!150519 (=> res!932248 e!788650)))

(assert (=> d!150519 (= res!932248 (bvsge #b00000000000000000000000000000000 (size!46538 a!2901)))))

(assert (=> d!150519 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32504) e!788650)))

(declare-fun b!1392736 () Bool)

(assert (=> b!1392736 (= e!788648 call!66794)))

(assert (= (and d!150519 (not res!932248)) b!1392734))

(assert (= (and b!1392734 res!932247) b!1392732))

(assert (= (and b!1392734 res!932249) b!1392733))

(assert (= (and b!1392733 c!129694) b!1392736))

(assert (= (and b!1392733 (not c!129694)) b!1392735))

(assert (= (or b!1392736 b!1392735) bm!66791))

(assert (=> b!1392732 m!1278455))

(assert (=> b!1392732 m!1278455))

(declare-fun m!1278489 () Bool)

(assert (=> b!1392732 m!1278489))

(assert (=> bm!66791 m!1278455))

(declare-fun m!1278491 () Bool)

(assert (=> bm!66791 m!1278491))

(assert (=> b!1392733 m!1278455))

(assert (=> b!1392733 m!1278455))

(assert (=> b!1392733 m!1278465))

(assert (=> b!1392734 m!1278455))

(assert (=> b!1392734 m!1278455))

(assert (=> b!1392734 m!1278465))

(assert (=> b!1392619 d!150519))

(declare-fun d!150531 () Bool)

(assert (=> d!150531 (= (validKeyInArray!0 (select (arr!45988 a!2901) j!112)) (and (not (= (select (arr!45988 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45988 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392625 d!150531))

(declare-fun b!1392801 () Bool)

(declare-fun e!788695 () SeekEntryResult!10305)

(declare-fun lt!611740 () SeekEntryResult!10305)

(assert (=> b!1392801 (= e!788695 (MissingZero!10305 (index!43593 lt!611740)))))

(declare-fun b!1392802 () Bool)

(declare-fun e!788696 () SeekEntryResult!10305)

(assert (=> b!1392802 (= e!788696 Undefined!10305)))

(declare-fun b!1392803 () Bool)

(declare-fun c!129714 () Bool)

(declare-fun lt!611741 () (_ BitVec 64))

(assert (=> b!1392803 (= c!129714 (= lt!611741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788697 () SeekEntryResult!10305)

(assert (=> b!1392803 (= e!788697 e!788695)))

(declare-fun b!1392804 () Bool)

(assert (=> b!1392804 (= e!788696 e!788697)))

(assert (=> b!1392804 (= lt!611741 (select (arr!45988 a!2901) (index!43593 lt!611740)))))

(declare-fun c!129716 () Bool)

(assert (=> b!1392804 (= c!129716 (= lt!611741 (select (arr!45988 a!2901) j!112)))))

(declare-fun d!150533 () Bool)

(declare-fun lt!611739 () SeekEntryResult!10305)

(assert (=> d!150533 (and (or (is-Undefined!10305 lt!611739) (not (is-Found!10305 lt!611739)) (and (bvsge (index!43592 lt!611739) #b00000000000000000000000000000000) (bvslt (index!43592 lt!611739) (size!46538 a!2901)))) (or (is-Undefined!10305 lt!611739) (is-Found!10305 lt!611739) (not (is-MissingZero!10305 lt!611739)) (and (bvsge (index!43591 lt!611739) #b00000000000000000000000000000000) (bvslt (index!43591 lt!611739) (size!46538 a!2901)))) (or (is-Undefined!10305 lt!611739) (is-Found!10305 lt!611739) (is-MissingZero!10305 lt!611739) (not (is-MissingVacant!10305 lt!611739)) (and (bvsge (index!43594 lt!611739) #b00000000000000000000000000000000) (bvslt (index!43594 lt!611739) (size!46538 a!2901)))) (or (is-Undefined!10305 lt!611739) (ite (is-Found!10305 lt!611739) (= (select (arr!45988 a!2901) (index!43592 lt!611739)) (select (arr!45988 a!2901) j!112)) (ite (is-MissingZero!10305 lt!611739) (= (select (arr!45988 a!2901) (index!43591 lt!611739)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10305 lt!611739) (= (select (arr!45988 a!2901) (index!43594 lt!611739)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150533 (= lt!611739 e!788696)))

(declare-fun c!129715 () Bool)

(assert (=> d!150533 (= c!129715 (and (is-Intermediate!10305 lt!611740) (undefined!11117 lt!611740)))))

(assert (=> d!150533 (= lt!611740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45988 a!2901) j!112) mask!2840) (select (arr!45988 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150533 (validMask!0 mask!2840)))

(assert (=> d!150533 (= (seekEntryOrOpen!0 (select (arr!45988 a!2901) j!112) a!2901 mask!2840) lt!611739)))

(declare-fun b!1392805 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95257 (_ BitVec 32)) SeekEntryResult!10305)

(assert (=> b!1392805 (= e!788695 (seekKeyOrZeroReturnVacant!0 (x!125271 lt!611740) (index!43593 lt!611740) (index!43593 lt!611740) (select (arr!45988 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392806 () Bool)

(assert (=> b!1392806 (= e!788697 (Found!10305 (index!43593 lt!611740)))))

(assert (= (and d!150533 c!129715) b!1392802))

(assert (= (and d!150533 (not c!129715)) b!1392804))

(assert (= (and b!1392804 c!129716) b!1392806))

(assert (= (and b!1392804 (not c!129716)) b!1392803))

(assert (= (and b!1392803 c!129714) b!1392801))

(assert (= (and b!1392803 (not c!129714)) b!1392805))

(declare-fun m!1278531 () Bool)

(assert (=> b!1392804 m!1278531))

(declare-fun m!1278533 () Bool)

(assert (=> d!150533 m!1278533))

(assert (=> d!150533 m!1278411))

(assert (=> d!150533 m!1278403))

(assert (=> d!150533 m!1278415))

(declare-fun m!1278535 () Bool)

(assert (=> d!150533 m!1278535))

(assert (=> d!150533 m!1278415))

(assert (=> d!150533 m!1278403))

(assert (=> d!150533 m!1278419))

(declare-fun m!1278537 () Bool)

(assert (=> d!150533 m!1278537))

(assert (=> b!1392805 m!1278403))

(declare-fun m!1278539 () Bool)

(assert (=> b!1392805 m!1278539))

(assert (=> b!1392620 d!150533))

(declare-fun d!150553 () Bool)

(declare-fun e!788720 () Bool)

(assert (=> d!150553 e!788720))

(declare-fun c!129737 () Bool)

(declare-fun lt!611758 () SeekEntryResult!10305)

(assert (=> d!150553 (= c!129737 (and (is-Intermediate!10305 lt!611758) (undefined!11117 lt!611758)))))

(declare-fun e!788724 () SeekEntryResult!10305)

(assert (=> d!150553 (= lt!611758 e!788724)))

(declare-fun c!129736 () Bool)

(assert (=> d!150553 (= c!129736 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611759 () (_ BitVec 64))

(assert (=> d!150553 (= lt!611759 (select (arr!45988 (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901))) (toIndex!0 (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150553 (validMask!0 mask!2840)))

(assert (=> d!150553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901)) mask!2840) lt!611758)))

(declare-fun b!1392849 () Bool)

(assert (=> b!1392849 (and (bvsge (index!43593 lt!611758) #b00000000000000000000000000000000) (bvslt (index!43593 lt!611758) (size!46538 (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901)))))))

(declare-fun res!932283 () Bool)

(assert (=> b!1392849 (= res!932283 (= (select (arr!45988 (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901))) (index!43593 lt!611758)) (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!788722 () Bool)

(assert (=> b!1392849 (=> res!932283 e!788722)))

(declare-fun e!788723 () Bool)

(assert (=> b!1392849 (= e!788723 e!788722)))

(declare-fun b!1392850 () Bool)

(assert (=> b!1392850 (and (bvsge (index!43593 lt!611758) #b00000000000000000000000000000000) (bvslt (index!43593 lt!611758) (size!46538 (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901)))))))

(declare-fun res!932282 () Bool)

(assert (=> b!1392850 (= res!932282 (= (select (arr!45988 (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901))) (index!43593 lt!611758)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392850 (=> res!932282 e!788722)))

(declare-fun b!1392851 () Bool)

(assert (=> b!1392851 (= e!788724 (Intermediate!10305 true (toIndex!0 (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392852 () Bool)

(assert (=> b!1392852 (= e!788720 (bvsge (x!125271 lt!611758) #b01111111111111111111111111111110))))

(declare-fun e!788721 () SeekEntryResult!10305)

(declare-fun b!1392853 () Bool)

(assert (=> b!1392853 (= e!788721 (Intermediate!10305 false (toIndex!0 (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392854 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392854 (= e!788721 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901)) mask!2840))))

(declare-fun b!1392855 () Bool)

(assert (=> b!1392855 (= e!788724 e!788721)))

(declare-fun c!129735 () Bool)

(assert (=> b!1392855 (= c!129735 (or (= lt!611759 (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!611759 lt!611759) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392856 () Bool)

(assert (=> b!1392856 (= e!788720 e!788723)))

(declare-fun res!932284 () Bool)

(assert (=> b!1392856 (= res!932284 (and (is-Intermediate!10305 lt!611758) (not (undefined!11117 lt!611758)) (bvslt (x!125271 lt!611758) #b01111111111111111111111111111110) (bvsge (x!125271 lt!611758) #b00000000000000000000000000000000) (bvsge (x!125271 lt!611758) #b00000000000000000000000000000000)))))

(assert (=> b!1392856 (=> (not res!932284) (not e!788723))))

(declare-fun b!1392857 () Bool)

(assert (=> b!1392857 (and (bvsge (index!43593 lt!611758) #b00000000000000000000000000000000) (bvslt (index!43593 lt!611758) (size!46538 (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901)))))))

(assert (=> b!1392857 (= e!788722 (= (select (arr!45988 (array!95258 (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46538 a!2901))) (index!43593 lt!611758)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150553 c!129736) b!1392851))

(assert (= (and d!150553 (not c!129736)) b!1392855))

(assert (= (and b!1392855 c!129735) b!1392853))

(assert (= (and b!1392855 (not c!129735)) b!1392854))

(assert (= (and d!150553 c!129737) b!1392852))

(assert (= (and d!150553 (not c!129737)) b!1392856))

(assert (= (and b!1392856 res!932284) b!1392849))

(assert (= (and b!1392849 (not res!932283)) b!1392850))

(assert (= (and b!1392850 (not res!932282)) b!1392857))

(assert (=> d!150553 m!1278431))

(declare-fun m!1278541 () Bool)

(assert (=> d!150553 m!1278541))

(assert (=> d!150553 m!1278411))

(declare-fun m!1278543 () Bool)

(assert (=> b!1392850 m!1278543))

(assert (=> b!1392854 m!1278431))

(declare-fun m!1278545 () Bool)

(assert (=> b!1392854 m!1278545))

(assert (=> b!1392854 m!1278545))

(assert (=> b!1392854 m!1278429))

(declare-fun m!1278547 () Bool)

(assert (=> b!1392854 m!1278547))

(assert (=> b!1392849 m!1278543))

(assert (=> b!1392857 m!1278543))

(assert (=> b!1392626 d!150553))

(declare-fun d!150569 () Bool)

(declare-fun lt!611771 () (_ BitVec 32))

(declare-fun lt!611770 () (_ BitVec 32))

(assert (=> d!150569 (= lt!611771 (bvmul (bvxor lt!611770 (bvlshr lt!611770 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150569 (= lt!611770 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150569 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932285 (let ((h!33736 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125277 (bvmul (bvxor h!33736 (bvlshr h!33736 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125277 (bvlshr x!125277 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932285 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932285 #b00000000000000000000000000000000))))))

(assert (=> d!150569 (= (toIndex!0 (select (store (arr!45988 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611771 (bvlshr lt!611771 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392626 d!150569))

(declare-fun b!1392870 () Bool)

(declare-fun e!788731 () Bool)

(declare-fun call!66802 () Bool)

(assert (=> b!1392870 (= e!788731 call!66802)))

(declare-fun b!1392871 () Bool)

(declare-fun e!788732 () Bool)

(assert (=> b!1392871 (= e!788731 e!788732)))

(declare-fun lt!611772 () (_ BitVec 64))

(assert (=> b!1392871 (= lt!611772 (select (arr!45988 a!2901) j!112))))

(declare-fun lt!611773 () Unit!46614)

(assert (=> b!1392871 (= lt!611773 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611772 j!112))))

(assert (=> b!1392871 (arrayContainsKey!0 a!2901 lt!611772 #b00000000000000000000000000000000)))

(declare-fun lt!611774 () Unit!46614)

(assert (=> b!1392871 (= lt!611774 lt!611773)))

(declare-fun res!932286 () Bool)

(assert (=> b!1392871 (= res!932286 (= (seekEntryOrOpen!0 (select (arr!45988 a!2901) j!112) a!2901 mask!2840) (Found!10305 j!112)))))

(assert (=> b!1392871 (=> (not res!932286) (not e!788732))))

(declare-fun bm!66799 () Bool)

(assert (=> bm!66799 (= call!66802 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392872 () Bool)

(declare-fun e!788733 () Bool)

(assert (=> b!1392872 (= e!788733 e!788731)))

(declare-fun c!129744 () Bool)

(assert (=> b!1392872 (= c!129744 (validKeyInArray!0 (select (arr!45988 a!2901) j!112)))))

(declare-fun d!150571 () Bool)

(declare-fun res!932287 () Bool)

(assert (=> d!150571 (=> res!932287 e!788733)))

(assert (=> d!150571 (= res!932287 (bvsge j!112 (size!46538 a!2901)))))

(assert (=> d!150571 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788733)))

(declare-fun b!1392873 () Bool)

(assert (=> b!1392873 (= e!788732 call!66802)))

(assert (= (and d!150571 (not res!932287)) b!1392872))

(assert (= (and b!1392872 c!129744) b!1392871))

(assert (= (and b!1392872 (not c!129744)) b!1392870))

(assert (= (and b!1392871 res!932286) b!1392873))

(assert (= (or b!1392873 b!1392870) bm!66799))

(assert (=> b!1392871 m!1278403))

(declare-fun m!1278569 () Bool)

(assert (=> b!1392871 m!1278569))

(declare-fun m!1278571 () Bool)

(assert (=> b!1392871 m!1278571))

(assert (=> b!1392871 m!1278403))

(assert (=> b!1392871 m!1278405))

