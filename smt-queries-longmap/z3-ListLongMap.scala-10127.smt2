; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119366 () Bool)

(assert start!119366)

(declare-fun res!931411 () Bool)

(declare-fun e!787983 () Bool)

(assert (=> start!119366 (=> (not res!931411) (not e!787983))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119366 (= res!931411 (validMask!0 mask!2840))))

(assert (=> start!119366 e!787983))

(assert (=> start!119366 true))

(declare-datatypes ((array!95201 0))(
  ( (array!95202 (arr!45963 (Array (_ BitVec 32) (_ BitVec 64))) (size!46513 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95201)

(declare-fun array_inv!34991 (array!95201) Bool)

(assert (=> start!119366 (array_inv!34991 a!2901)))

(declare-fun b!1391541 () Bool)

(declare-fun res!931408 () Bool)

(assert (=> b!1391541 (=> (not res!931408) (not e!787983))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391541 (= res!931408 (and (= (size!46513 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46513 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46513 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391542 () Bool)

(declare-datatypes ((SeekEntryResult!10280 0))(
  ( (MissingZero!10280 (index!43491 (_ BitVec 32))) (Found!10280 (index!43492 (_ BitVec 32))) (Intermediate!10280 (undefined!11092 Bool) (index!43493 (_ BitVec 32)) (x!125170 (_ BitVec 32))) (Undefined!10280) (MissingVacant!10280 (index!43494 (_ BitVec 32))) )
))
(declare-fun lt!611235 () SeekEntryResult!10280)

(get-info :version)

(assert (=> b!1391542 (= e!787983 (not (or (not ((_ is Intermediate!10280) lt!611235)) (undefined!11092 lt!611235) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(declare-fun e!787984 () Bool)

(assert (=> b!1391542 e!787984))

(declare-fun res!931410 () Bool)

(assert (=> b!1391542 (=> (not res!931410) (not e!787984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95201 (_ BitVec 32)) Bool)

(assert (=> b!1391542 (= res!931410 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46564 0))(
  ( (Unit!46565) )
))
(declare-fun lt!611234 () Unit!46564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46564)

(assert (=> b!1391542 (= lt!611234 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95201 (_ BitVec 32)) SeekEntryResult!10280)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391542 (= lt!611235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840) (select (arr!45963 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391543 () Bool)

(declare-fun res!931409 () Bool)

(assert (=> b!1391543 (=> (not res!931409) (not e!787983))))

(assert (=> b!1391543 (= res!931409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391544 () Bool)

(declare-fun res!931412 () Bool)

(assert (=> b!1391544 (=> (not res!931412) (not e!787983))))

(declare-datatypes ((List!32482 0))(
  ( (Nil!32479) (Cons!32478 (h!33702 (_ BitVec 64)) (t!47176 List!32482)) )
))
(declare-fun arrayNoDuplicates!0 (array!95201 (_ BitVec 32) List!32482) Bool)

(assert (=> b!1391544 (= res!931412 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32479))))

(declare-fun b!1391545 () Bool)

(declare-fun res!931413 () Bool)

(assert (=> b!1391545 (=> (not res!931413) (not e!787983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391545 (= res!931413 (validKeyInArray!0 (select (arr!45963 a!2901) j!112)))))

(declare-fun b!1391546 () Bool)

(declare-fun res!931414 () Bool)

(assert (=> b!1391546 (=> (not res!931414) (not e!787983))))

(assert (=> b!1391546 (= res!931414 (validKeyInArray!0 (select (arr!45963 a!2901) i!1037)))))

(declare-fun b!1391547 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95201 (_ BitVec 32)) SeekEntryResult!10280)

(assert (=> b!1391547 (= e!787984 (= (seekEntryOrOpen!0 (select (arr!45963 a!2901) j!112) a!2901 mask!2840) (Found!10280 j!112)))))

(assert (= (and start!119366 res!931411) b!1391541))

(assert (= (and b!1391541 res!931408) b!1391546))

(assert (= (and b!1391546 res!931414) b!1391545))

(assert (= (and b!1391545 res!931413) b!1391543))

(assert (= (and b!1391543 res!931409) b!1391544))

(assert (= (and b!1391544 res!931412) b!1391542))

(assert (= (and b!1391542 res!931410) b!1391547))

(declare-fun m!1277345 () Bool)

(assert (=> b!1391544 m!1277345))

(declare-fun m!1277347 () Bool)

(assert (=> b!1391545 m!1277347))

(assert (=> b!1391545 m!1277347))

(declare-fun m!1277349 () Bool)

(assert (=> b!1391545 m!1277349))

(declare-fun m!1277351 () Bool)

(assert (=> b!1391543 m!1277351))

(declare-fun m!1277353 () Bool)

(assert (=> b!1391546 m!1277353))

(assert (=> b!1391546 m!1277353))

(declare-fun m!1277355 () Bool)

(assert (=> b!1391546 m!1277355))

(declare-fun m!1277357 () Bool)

(assert (=> start!119366 m!1277357))

(declare-fun m!1277359 () Bool)

(assert (=> start!119366 m!1277359))

(assert (=> b!1391547 m!1277347))

(assert (=> b!1391547 m!1277347))

(declare-fun m!1277361 () Bool)

(assert (=> b!1391547 m!1277361))

(assert (=> b!1391542 m!1277347))

(declare-fun m!1277363 () Bool)

(assert (=> b!1391542 m!1277363))

(assert (=> b!1391542 m!1277347))

(declare-fun m!1277365 () Bool)

(assert (=> b!1391542 m!1277365))

(assert (=> b!1391542 m!1277363))

(assert (=> b!1391542 m!1277347))

(declare-fun m!1277367 () Bool)

(assert (=> b!1391542 m!1277367))

(declare-fun m!1277369 () Bool)

(assert (=> b!1391542 m!1277369))

(check-sat (not b!1391543) (not b!1391542) (not b!1391545) (not b!1391546) (not b!1391547) (not start!119366) (not b!1391544))
(check-sat)
(get-model)

(declare-fun d!150347 () Bool)

(assert (=> d!150347 (= (validKeyInArray!0 (select (arr!45963 a!2901) j!112)) (and (not (= (select (arr!45963 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45963 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391545 d!150347))

(declare-fun bm!66739 () Bool)

(declare-fun call!66742 () Bool)

(declare-fun c!129516 () Bool)

(assert (=> bm!66739 (= call!66742 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129516 (Cons!32478 (select (arr!45963 a!2901) #b00000000000000000000000000000000) Nil!32479) Nil!32479)))))

(declare-fun b!1391579 () Bool)

(declare-fun e!788004 () Bool)

(assert (=> b!1391579 (= e!788004 call!66742)))

(declare-fun b!1391580 () Bool)

(declare-fun e!788003 () Bool)

(declare-fun e!788005 () Bool)

(assert (=> b!1391580 (= e!788003 e!788005)))

(declare-fun res!931444 () Bool)

(assert (=> b!1391580 (=> (not res!931444) (not e!788005))))

(declare-fun e!788006 () Bool)

(assert (=> b!1391580 (= res!931444 (not e!788006))))

(declare-fun res!931442 () Bool)

(assert (=> b!1391580 (=> (not res!931442) (not e!788006))))

(assert (=> b!1391580 (= res!931442 (validKeyInArray!0 (select (arr!45963 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150349 () Bool)

(declare-fun res!931443 () Bool)

(assert (=> d!150349 (=> res!931443 e!788003)))

(assert (=> d!150349 (= res!931443 (bvsge #b00000000000000000000000000000000 (size!46513 a!2901)))))

(assert (=> d!150349 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32479) e!788003)))

(declare-fun b!1391581 () Bool)

(assert (=> b!1391581 (= e!788005 e!788004)))

(assert (=> b!1391581 (= c!129516 (validKeyInArray!0 (select (arr!45963 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391582 () Bool)

(assert (=> b!1391582 (= e!788004 call!66742)))

(declare-fun b!1391583 () Bool)

(declare-fun contains!9767 (List!32482 (_ BitVec 64)) Bool)

(assert (=> b!1391583 (= e!788006 (contains!9767 Nil!32479 (select (arr!45963 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150349 (not res!931443)) b!1391580))

(assert (= (and b!1391580 res!931442) b!1391583))

(assert (= (and b!1391580 res!931444) b!1391581))

(assert (= (and b!1391581 c!129516) b!1391579))

(assert (= (and b!1391581 (not c!129516)) b!1391582))

(assert (= (or b!1391579 b!1391582) bm!66739))

(declare-fun m!1277397 () Bool)

(assert (=> bm!66739 m!1277397))

(declare-fun m!1277399 () Bool)

(assert (=> bm!66739 m!1277399))

(assert (=> b!1391580 m!1277397))

(assert (=> b!1391580 m!1277397))

(declare-fun m!1277401 () Bool)

(assert (=> b!1391580 m!1277401))

(assert (=> b!1391581 m!1277397))

(assert (=> b!1391581 m!1277397))

(assert (=> b!1391581 m!1277401))

(assert (=> b!1391583 m!1277397))

(assert (=> b!1391583 m!1277397))

(declare-fun m!1277403 () Bool)

(assert (=> b!1391583 m!1277403))

(assert (=> b!1391544 d!150349))

(declare-fun b!1391592 () Bool)

(declare-fun e!788015 () Bool)

(declare-fun e!788013 () Bool)

(assert (=> b!1391592 (= e!788015 e!788013)))

(declare-fun lt!611250 () (_ BitVec 64))

(assert (=> b!1391592 (= lt!611250 (select (arr!45963 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611249 () Unit!46564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95201 (_ BitVec 64) (_ BitVec 32)) Unit!46564)

(assert (=> b!1391592 (= lt!611249 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611250 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1391592 (arrayContainsKey!0 a!2901 lt!611250 #b00000000000000000000000000000000)))

(declare-fun lt!611248 () Unit!46564)

(assert (=> b!1391592 (= lt!611248 lt!611249)))

(declare-fun res!931449 () Bool)

(assert (=> b!1391592 (= res!931449 (= (seekEntryOrOpen!0 (select (arr!45963 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10280 #b00000000000000000000000000000000)))))

(assert (=> b!1391592 (=> (not res!931449) (not e!788013))))

(declare-fun bm!66742 () Bool)

(declare-fun call!66745 () Bool)

(assert (=> bm!66742 (= call!66745 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391593 () Bool)

(declare-fun e!788014 () Bool)

(assert (=> b!1391593 (= e!788014 e!788015)))

(declare-fun c!129519 () Bool)

(assert (=> b!1391593 (= c!129519 (validKeyInArray!0 (select (arr!45963 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150357 () Bool)

(declare-fun res!931450 () Bool)

(assert (=> d!150357 (=> res!931450 e!788014)))

(assert (=> d!150357 (= res!931450 (bvsge #b00000000000000000000000000000000 (size!46513 a!2901)))))

(assert (=> d!150357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788014)))

(declare-fun b!1391594 () Bool)

(assert (=> b!1391594 (= e!788013 call!66745)))

(declare-fun b!1391595 () Bool)

(assert (=> b!1391595 (= e!788015 call!66745)))

(assert (= (and d!150357 (not res!931450)) b!1391593))

(assert (= (and b!1391593 c!129519) b!1391592))

(assert (= (and b!1391593 (not c!129519)) b!1391595))

(assert (= (and b!1391592 res!931449) b!1391594))

(assert (= (or b!1391594 b!1391595) bm!66742))

(assert (=> b!1391592 m!1277397))

(declare-fun m!1277405 () Bool)

(assert (=> b!1391592 m!1277405))

(declare-fun m!1277407 () Bool)

(assert (=> b!1391592 m!1277407))

(assert (=> b!1391592 m!1277397))

(declare-fun m!1277409 () Bool)

(assert (=> b!1391592 m!1277409))

(declare-fun m!1277411 () Bool)

(assert (=> bm!66742 m!1277411))

(assert (=> b!1391593 m!1277397))

(assert (=> b!1391593 m!1277397))

(assert (=> b!1391593 m!1277401))

(assert (=> b!1391543 d!150357))

(declare-fun d!150359 () Bool)

(assert (=> d!150359 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119366 d!150359))

(declare-fun d!150361 () Bool)

(assert (=> d!150361 (= (array_inv!34991 a!2901) (bvsge (size!46513 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119366 d!150361))

(declare-fun d!150363 () Bool)

(declare-fun lt!611283 () SeekEntryResult!10280)

(assert (=> d!150363 (and (or ((_ is Undefined!10280) lt!611283) (not ((_ is Found!10280) lt!611283)) (and (bvsge (index!43492 lt!611283) #b00000000000000000000000000000000) (bvslt (index!43492 lt!611283) (size!46513 a!2901)))) (or ((_ is Undefined!10280) lt!611283) ((_ is Found!10280) lt!611283) (not ((_ is MissingZero!10280) lt!611283)) (and (bvsge (index!43491 lt!611283) #b00000000000000000000000000000000) (bvslt (index!43491 lt!611283) (size!46513 a!2901)))) (or ((_ is Undefined!10280) lt!611283) ((_ is Found!10280) lt!611283) ((_ is MissingZero!10280) lt!611283) (not ((_ is MissingVacant!10280) lt!611283)) (and (bvsge (index!43494 lt!611283) #b00000000000000000000000000000000) (bvslt (index!43494 lt!611283) (size!46513 a!2901)))) (or ((_ is Undefined!10280) lt!611283) (ite ((_ is Found!10280) lt!611283) (= (select (arr!45963 a!2901) (index!43492 lt!611283)) (select (arr!45963 a!2901) j!112)) (ite ((_ is MissingZero!10280) lt!611283) (= (select (arr!45963 a!2901) (index!43491 lt!611283)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10280) lt!611283) (= (select (arr!45963 a!2901) (index!43494 lt!611283)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!788047 () SeekEntryResult!10280)

(assert (=> d!150363 (= lt!611283 e!788047)))

(declare-fun c!129546 () Bool)

(declare-fun lt!611281 () SeekEntryResult!10280)

(assert (=> d!150363 (= c!129546 (and ((_ is Intermediate!10280) lt!611281) (undefined!11092 lt!611281)))))

(assert (=> d!150363 (= lt!611281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840) (select (arr!45963 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150363 (validMask!0 mask!2840)))

(assert (=> d!150363 (= (seekEntryOrOpen!0 (select (arr!45963 a!2901) j!112) a!2901 mask!2840) lt!611283)))

(declare-fun b!1391652 () Bool)

(declare-fun e!788046 () SeekEntryResult!10280)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95201 (_ BitVec 32)) SeekEntryResult!10280)

(assert (=> b!1391652 (= e!788046 (seekKeyOrZeroReturnVacant!0 (x!125170 lt!611281) (index!43493 lt!611281) (index!43493 lt!611281) (select (arr!45963 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391653 () Bool)

(declare-fun c!129547 () Bool)

(declare-fun lt!611282 () (_ BitVec 64))

(assert (=> b!1391653 (= c!129547 (= lt!611282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788048 () SeekEntryResult!10280)

(assert (=> b!1391653 (= e!788048 e!788046)))

(declare-fun b!1391654 () Bool)

(assert (=> b!1391654 (= e!788046 (MissingZero!10280 (index!43493 lt!611281)))))

(declare-fun b!1391655 () Bool)

(assert (=> b!1391655 (= e!788047 e!788048)))

(assert (=> b!1391655 (= lt!611282 (select (arr!45963 a!2901) (index!43493 lt!611281)))))

(declare-fun c!129548 () Bool)

(assert (=> b!1391655 (= c!129548 (= lt!611282 (select (arr!45963 a!2901) j!112)))))

(declare-fun b!1391656 () Bool)

(assert (=> b!1391656 (= e!788047 Undefined!10280)))

(declare-fun b!1391657 () Bool)

(assert (=> b!1391657 (= e!788048 (Found!10280 (index!43493 lt!611281)))))

(assert (= (and d!150363 c!129546) b!1391656))

(assert (= (and d!150363 (not c!129546)) b!1391655))

(assert (= (and b!1391655 c!129548) b!1391657))

(assert (= (and b!1391655 (not c!129548)) b!1391653))

(assert (= (and b!1391653 c!129547) b!1391654))

(assert (= (and b!1391653 (not c!129547)) b!1391652))

(assert (=> d!150363 m!1277347))

(assert (=> d!150363 m!1277363))

(assert (=> d!150363 m!1277363))

(assert (=> d!150363 m!1277347))

(assert (=> d!150363 m!1277367))

(declare-fun m!1277433 () Bool)

(assert (=> d!150363 m!1277433))

(assert (=> d!150363 m!1277357))

(declare-fun m!1277435 () Bool)

(assert (=> d!150363 m!1277435))

(declare-fun m!1277437 () Bool)

(assert (=> d!150363 m!1277437))

(assert (=> b!1391652 m!1277347))

(declare-fun m!1277439 () Bool)

(assert (=> b!1391652 m!1277439))

(declare-fun m!1277441 () Bool)

(assert (=> b!1391655 m!1277441))

(assert (=> b!1391547 d!150363))

(declare-fun b!1391662 () Bool)

(declare-fun e!788054 () Bool)

(declare-fun e!788052 () Bool)

(assert (=> b!1391662 (= e!788054 e!788052)))

(declare-fun lt!611289 () (_ BitVec 64))

(assert (=> b!1391662 (= lt!611289 (select (arr!45963 a!2901) j!112))))

(declare-fun lt!611288 () Unit!46564)

(assert (=> b!1391662 (= lt!611288 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611289 j!112))))

(assert (=> b!1391662 (arrayContainsKey!0 a!2901 lt!611289 #b00000000000000000000000000000000)))

(declare-fun lt!611287 () Unit!46564)

(assert (=> b!1391662 (= lt!611287 lt!611288)))

(declare-fun res!931457 () Bool)

(assert (=> b!1391662 (= res!931457 (= (seekEntryOrOpen!0 (select (arr!45963 a!2901) j!112) a!2901 mask!2840) (Found!10280 j!112)))))

(assert (=> b!1391662 (=> (not res!931457) (not e!788052))))

(declare-fun call!66749 () Bool)

(declare-fun bm!66746 () Bool)

(assert (=> bm!66746 (= call!66749 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391663 () Bool)

(declare-fun e!788053 () Bool)

(assert (=> b!1391663 (= e!788053 e!788054)))

(declare-fun c!129550 () Bool)

(assert (=> b!1391663 (= c!129550 (validKeyInArray!0 (select (arr!45963 a!2901) j!112)))))

(declare-fun d!150371 () Bool)

(declare-fun res!931458 () Bool)

(assert (=> d!150371 (=> res!931458 e!788053)))

(assert (=> d!150371 (= res!931458 (bvsge j!112 (size!46513 a!2901)))))

(assert (=> d!150371 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788053)))

(declare-fun b!1391664 () Bool)

(assert (=> b!1391664 (= e!788052 call!66749)))

(declare-fun b!1391665 () Bool)

(assert (=> b!1391665 (= e!788054 call!66749)))

(assert (= (and d!150371 (not res!931458)) b!1391663))

(assert (= (and b!1391663 c!129550) b!1391662))

(assert (= (and b!1391663 (not c!129550)) b!1391665))

(assert (= (and b!1391662 res!931457) b!1391664))

(assert (= (or b!1391664 b!1391665) bm!66746))

(assert (=> b!1391662 m!1277347))

(declare-fun m!1277443 () Bool)

(assert (=> b!1391662 m!1277443))

(declare-fun m!1277445 () Bool)

(assert (=> b!1391662 m!1277445))

(assert (=> b!1391662 m!1277347))

(assert (=> b!1391662 m!1277361))

(declare-fun m!1277447 () Bool)

(assert (=> bm!66746 m!1277447))

(assert (=> b!1391663 m!1277347))

(assert (=> b!1391663 m!1277347))

(assert (=> b!1391663 m!1277349))

(assert (=> b!1391542 d!150371))

(declare-fun d!150373 () Bool)

(assert (=> d!150373 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611298 () Unit!46564)

(declare-fun choose!38 (array!95201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46564)

(assert (=> d!150373 (= lt!611298 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150373 (validMask!0 mask!2840)))

(assert (=> d!150373 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611298)))

(declare-fun bs!40484 () Bool)

(assert (= bs!40484 d!150373))

(assert (=> bs!40484 m!1277369))

(declare-fun m!1277455 () Bool)

(assert (=> bs!40484 m!1277455))

(assert (=> bs!40484 m!1277357))

(assert (=> b!1391542 d!150373))

(declare-fun d!150377 () Bool)

(declare-fun e!788080 () Bool)

(assert (=> d!150377 e!788080))

(declare-fun c!129563 () Bool)

(declare-fun lt!611316 () SeekEntryResult!10280)

(assert (=> d!150377 (= c!129563 (and ((_ is Intermediate!10280) lt!611316) (undefined!11092 lt!611316)))))

(declare-fun e!788081 () SeekEntryResult!10280)

(assert (=> d!150377 (= lt!611316 e!788081)))

(declare-fun c!129562 () Bool)

(assert (=> d!150377 (= c!129562 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611315 () (_ BitVec 64))

(assert (=> d!150377 (= lt!611315 (select (arr!45963 a!2901) (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840)))))

(assert (=> d!150377 (validMask!0 mask!2840)))

(assert (=> d!150377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840) (select (arr!45963 a!2901) j!112) a!2901 mask!2840) lt!611316)))

(declare-fun b!1391700 () Bool)

(assert (=> b!1391700 (and (bvsge (index!43493 lt!611316) #b00000000000000000000000000000000) (bvslt (index!43493 lt!611316) (size!46513 a!2901)))))

(declare-fun res!931473 () Bool)

(assert (=> b!1391700 (= res!931473 (= (select (arr!45963 a!2901) (index!43493 lt!611316)) (select (arr!45963 a!2901) j!112)))))

(declare-fun e!788078 () Bool)

(assert (=> b!1391700 (=> res!931473 e!788078)))

(declare-fun e!788077 () Bool)

(assert (=> b!1391700 (= e!788077 e!788078)))

(declare-fun b!1391701 () Bool)

(assert (=> b!1391701 (= e!788080 (bvsge (x!125170 lt!611316) #b01111111111111111111111111111110))))

(declare-fun b!1391702 () Bool)

(declare-fun e!788079 () SeekEntryResult!10280)

(assert (=> b!1391702 (= e!788081 e!788079)))

(declare-fun c!129561 () Bool)

(assert (=> b!1391702 (= c!129561 (or (= lt!611315 (select (arr!45963 a!2901) j!112)) (= (bvadd lt!611315 lt!611315) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1391703 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391703 (= e!788079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45963 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391704 () Bool)

(assert (=> b!1391704 (= e!788080 e!788077)))

(declare-fun res!931474 () Bool)

(assert (=> b!1391704 (= res!931474 (and ((_ is Intermediate!10280) lt!611316) (not (undefined!11092 lt!611316)) (bvslt (x!125170 lt!611316) #b01111111111111111111111111111110) (bvsge (x!125170 lt!611316) #b00000000000000000000000000000000) (bvsge (x!125170 lt!611316) #b00000000000000000000000000000000)))))

(assert (=> b!1391704 (=> (not res!931474) (not e!788077))))

(declare-fun b!1391705 () Bool)

(assert (=> b!1391705 (and (bvsge (index!43493 lt!611316) #b00000000000000000000000000000000) (bvslt (index!43493 lt!611316) (size!46513 a!2901)))))

(declare-fun res!931475 () Bool)

(assert (=> b!1391705 (= res!931475 (= (select (arr!45963 a!2901) (index!43493 lt!611316)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391705 (=> res!931475 e!788078)))

(declare-fun b!1391706 () Bool)

(assert (=> b!1391706 (= e!788079 (Intermediate!10280 false (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1391707 () Bool)

(assert (=> b!1391707 (= e!788081 (Intermediate!10280 true (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1391708 () Bool)

(assert (=> b!1391708 (and (bvsge (index!43493 lt!611316) #b00000000000000000000000000000000) (bvslt (index!43493 lt!611316) (size!46513 a!2901)))))

(assert (=> b!1391708 (= e!788078 (= (select (arr!45963 a!2901) (index!43493 lt!611316)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150377 c!129562) b!1391707))

(assert (= (and d!150377 (not c!129562)) b!1391702))

(assert (= (and b!1391702 c!129561) b!1391706))

(assert (= (and b!1391702 (not c!129561)) b!1391703))

(assert (= (and d!150377 c!129563) b!1391701))

(assert (= (and d!150377 (not c!129563)) b!1391704))

(assert (= (and b!1391704 res!931474) b!1391700))

(assert (= (and b!1391700 (not res!931473)) b!1391705))

(assert (= (and b!1391705 (not res!931475)) b!1391708))

(declare-fun m!1277479 () Bool)

(assert (=> b!1391705 m!1277479))

(assert (=> d!150377 m!1277363))

(declare-fun m!1277481 () Bool)

(assert (=> d!150377 m!1277481))

(assert (=> d!150377 m!1277357))

(assert (=> b!1391700 m!1277479))

(assert (=> b!1391703 m!1277363))

(declare-fun m!1277483 () Bool)

(assert (=> b!1391703 m!1277483))

(assert (=> b!1391703 m!1277483))

(assert (=> b!1391703 m!1277347))

(declare-fun m!1277485 () Bool)

(assert (=> b!1391703 m!1277485))

(assert (=> b!1391708 m!1277479))

(assert (=> b!1391542 d!150377))

(declare-fun d!150387 () Bool)

(declare-fun lt!611326 () (_ BitVec 32))

(declare-fun lt!611325 () (_ BitVec 32))

(assert (=> d!150387 (= lt!611326 (bvmul (bvxor lt!611325 (bvlshr lt!611325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150387 (= lt!611325 ((_ extract 31 0) (bvand (bvxor (select (arr!45963 a!2901) j!112) (bvlshr (select (arr!45963 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150387 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931476 (let ((h!33704 ((_ extract 31 0) (bvand (bvxor (select (arr!45963 a!2901) j!112) (bvlshr (select (arr!45963 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125173 (bvmul (bvxor h!33704 (bvlshr h!33704 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125173 (bvlshr x!125173 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931476 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931476 #b00000000000000000000000000000000))))))

(assert (=> d!150387 (= (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840) (bvand (bvxor lt!611326 (bvlshr lt!611326 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1391542 d!150387))

(declare-fun d!150389 () Bool)

(assert (=> d!150389 (= (validKeyInArray!0 (select (arr!45963 a!2901) i!1037)) (and (not (= (select (arr!45963 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45963 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391546 d!150389))

(check-sat (not b!1391583) (not b!1391592) (not b!1391652) (not d!150373) (not b!1391703) (not d!150377) (not b!1391663) (not bm!66739) (not bm!66742) (not b!1391581) (not bm!66746) (not d!150363) (not b!1391593) (not b!1391580) (not b!1391662))
(check-sat)
