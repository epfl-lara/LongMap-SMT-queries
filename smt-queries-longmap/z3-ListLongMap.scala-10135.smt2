; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119516 () Bool)

(assert start!119516)

(declare-fun b!1392484 () Bool)

(declare-fun e!788516 () Bool)

(declare-fun e!788514 () Bool)

(assert (=> b!1392484 (= e!788516 (not e!788514))))

(declare-fun res!932115 () Bool)

(assert (=> b!1392484 (=> res!932115 e!788514)))

(declare-datatypes ((SeekEntryResult!10304 0))(
  ( (MissingZero!10304 (index!43587 (_ BitVec 32))) (Found!10304 (index!43588 (_ BitVec 32))) (Intermediate!10304 (undefined!11116 Bool) (index!43589 (_ BitVec 32)) (x!125267 (_ BitVec 32))) (Undefined!10304) (MissingVacant!10304 (index!43590 (_ BitVec 32))) )
))
(declare-fun lt!611459 () SeekEntryResult!10304)

(get-info :version)

(assert (=> b!1392484 (= res!932115 (or (not ((_ is Intermediate!10304) lt!611459)) (undefined!11116 lt!611459)))))

(declare-fun e!788513 () Bool)

(assert (=> b!1392484 e!788513))

(declare-fun res!932110 () Bool)

(assert (=> b!1392484 (=> (not res!932110) (not e!788513))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95202 0))(
  ( (array!95203 (arr!45961 (Array (_ BitVec 32) (_ BitVec 64))) (size!46513 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95202)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95202 (_ BitVec 32)) Bool)

(assert (=> b!1392484 (= res!932110 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46455 0))(
  ( (Unit!46456) )
))
(declare-fun lt!611458 () Unit!46455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46455)

(assert (=> b!1392484 (= lt!611458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95202 (_ BitVec 32)) SeekEntryResult!10304)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392484 (= lt!611459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840) (select (arr!45961 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932116 () Bool)

(assert (=> start!119516 (=> (not res!932116) (not e!788516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119516 (= res!932116 (validMask!0 mask!2840))))

(assert (=> start!119516 e!788516))

(assert (=> start!119516 true))

(declare-fun array_inv!35194 (array!95202) Bool)

(assert (=> start!119516 (array_inv!35194 a!2901)))

(declare-fun b!1392485 () Bool)

(declare-fun res!932108 () Bool)

(assert (=> b!1392485 (=> (not res!932108) (not e!788516))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392485 (= res!932108 (validKeyInArray!0 (select (arr!45961 a!2901) i!1037)))))

(declare-fun b!1392486 () Bool)

(assert (=> b!1392486 (= e!788514 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1392487 () Bool)

(declare-fun res!932109 () Bool)

(assert (=> b!1392487 (=> (not res!932109) (not e!788516))))

(assert (=> b!1392487 (= res!932109 (and (= (size!46513 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46513 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46513 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392488 () Bool)

(declare-fun res!932113 () Bool)

(assert (=> b!1392488 (=> (not res!932113) (not e!788516))))

(declare-datatypes ((List!32558 0))(
  ( (Nil!32555) (Cons!32554 (h!33784 (_ BitVec 64)) (t!47244 List!32558)) )
))
(declare-fun arrayNoDuplicates!0 (array!95202 (_ BitVec 32) List!32558) Bool)

(assert (=> b!1392488 (= res!932113 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32555))))

(declare-fun b!1392489 () Bool)

(declare-fun res!932114 () Bool)

(assert (=> b!1392489 (=> (not res!932114) (not e!788516))))

(assert (=> b!1392489 (= res!932114 (validKeyInArray!0 (select (arr!45961 a!2901) j!112)))))

(declare-fun b!1392490 () Bool)

(declare-fun res!932112 () Bool)

(assert (=> b!1392490 (=> (not res!932112) (not e!788516))))

(assert (=> b!1392490 (= res!932112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392491 () Bool)

(declare-fun res!932111 () Bool)

(assert (=> b!1392491 (=> res!932111 e!788514)))

(assert (=> b!1392491 (= res!932111 (not (= lt!611459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901)) mask!2840))))))

(declare-fun b!1392492 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95202 (_ BitVec 32)) SeekEntryResult!10304)

(assert (=> b!1392492 (= e!788513 (= (seekEntryOrOpen!0 (select (arr!45961 a!2901) j!112) a!2901 mask!2840) (Found!10304 j!112)))))

(assert (= (and start!119516 res!932116) b!1392487))

(assert (= (and b!1392487 res!932109) b!1392485))

(assert (= (and b!1392485 res!932108) b!1392489))

(assert (= (and b!1392489 res!932114) b!1392490))

(assert (= (and b!1392490 res!932112) b!1392488))

(assert (= (and b!1392488 res!932113) b!1392484))

(assert (= (and b!1392484 res!932110) b!1392492))

(assert (= (and b!1392484 (not res!932115)) b!1392491))

(assert (= (and b!1392491 (not res!932111)) b!1392486))

(declare-fun m!1277797 () Bool)

(assert (=> b!1392489 m!1277797))

(assert (=> b!1392489 m!1277797))

(declare-fun m!1277799 () Bool)

(assert (=> b!1392489 m!1277799))

(assert (=> b!1392484 m!1277797))

(declare-fun m!1277801 () Bool)

(assert (=> b!1392484 m!1277801))

(assert (=> b!1392484 m!1277797))

(declare-fun m!1277803 () Bool)

(assert (=> b!1392484 m!1277803))

(assert (=> b!1392484 m!1277801))

(assert (=> b!1392484 m!1277797))

(declare-fun m!1277805 () Bool)

(assert (=> b!1392484 m!1277805))

(declare-fun m!1277807 () Bool)

(assert (=> b!1392484 m!1277807))

(declare-fun m!1277809 () Bool)

(assert (=> b!1392491 m!1277809))

(declare-fun m!1277811 () Bool)

(assert (=> b!1392491 m!1277811))

(assert (=> b!1392491 m!1277811))

(declare-fun m!1277813 () Bool)

(assert (=> b!1392491 m!1277813))

(assert (=> b!1392491 m!1277813))

(assert (=> b!1392491 m!1277811))

(declare-fun m!1277815 () Bool)

(assert (=> b!1392491 m!1277815))

(declare-fun m!1277817 () Bool)

(assert (=> b!1392490 m!1277817))

(declare-fun m!1277819 () Bool)

(assert (=> b!1392485 m!1277819))

(assert (=> b!1392485 m!1277819))

(declare-fun m!1277821 () Bool)

(assert (=> b!1392485 m!1277821))

(assert (=> b!1392492 m!1277797))

(assert (=> b!1392492 m!1277797))

(declare-fun m!1277823 () Bool)

(assert (=> b!1392492 m!1277823))

(declare-fun m!1277825 () Bool)

(assert (=> b!1392488 m!1277825))

(declare-fun m!1277827 () Bool)

(assert (=> start!119516 m!1277827))

(declare-fun m!1277829 () Bool)

(assert (=> start!119516 m!1277829))

(check-sat (not b!1392484) (not b!1392492) (not b!1392490) (not b!1392485) (not b!1392491) (not b!1392489) (not start!119516) (not b!1392488))
(check-sat)
(get-model)

(declare-fun d!150375 () Bool)

(declare-fun res!932178 () Bool)

(declare-fun e!788551 () Bool)

(assert (=> d!150375 (=> res!932178 e!788551)))

(assert (=> d!150375 (= res!932178 (bvsge #b00000000000000000000000000000000 (size!46513 a!2901)))))

(assert (=> d!150375 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32555) e!788551)))

(declare-fun b!1392557 () Bool)

(declare-fun e!788552 () Bool)

(assert (=> b!1392557 (= e!788551 e!788552)))

(declare-fun res!932177 () Bool)

(assert (=> b!1392557 (=> (not res!932177) (not e!788552))))

(declare-fun e!788549 () Bool)

(assert (=> b!1392557 (= res!932177 (not e!788549))))

(declare-fun res!932179 () Bool)

(assert (=> b!1392557 (=> (not res!932179) (not e!788549))))

(assert (=> b!1392557 (= res!932179 (validKeyInArray!0 (select (arr!45961 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392558 () Bool)

(declare-fun contains!9734 (List!32558 (_ BitVec 64)) Bool)

(assert (=> b!1392558 (= e!788549 (contains!9734 Nil!32555 (select (arr!45961 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392559 () Bool)

(declare-fun e!788550 () Bool)

(declare-fun call!66764 () Bool)

(assert (=> b!1392559 (= e!788550 call!66764)))

(declare-fun b!1392560 () Bool)

(assert (=> b!1392560 (= e!788552 e!788550)))

(declare-fun c!129643 () Bool)

(assert (=> b!1392560 (= c!129643 (validKeyInArray!0 (select (arr!45961 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66761 () Bool)

(assert (=> bm!66761 (= call!66764 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129643 (Cons!32554 (select (arr!45961 a!2901) #b00000000000000000000000000000000) Nil!32555) Nil!32555)))))

(declare-fun b!1392561 () Bool)

(assert (=> b!1392561 (= e!788550 call!66764)))

(assert (= (and d!150375 (not res!932178)) b!1392557))

(assert (= (and b!1392557 res!932179) b!1392558))

(assert (= (and b!1392557 res!932177) b!1392560))

(assert (= (and b!1392560 c!129643) b!1392559))

(assert (= (and b!1392560 (not c!129643)) b!1392561))

(assert (= (or b!1392559 b!1392561) bm!66761))

(declare-fun m!1277899 () Bool)

(assert (=> b!1392557 m!1277899))

(assert (=> b!1392557 m!1277899))

(declare-fun m!1277901 () Bool)

(assert (=> b!1392557 m!1277901))

(assert (=> b!1392558 m!1277899))

(assert (=> b!1392558 m!1277899))

(declare-fun m!1277903 () Bool)

(assert (=> b!1392558 m!1277903))

(assert (=> b!1392560 m!1277899))

(assert (=> b!1392560 m!1277899))

(assert (=> b!1392560 m!1277901))

(assert (=> bm!66761 m!1277899))

(declare-fun m!1277905 () Bool)

(assert (=> bm!66761 m!1277905))

(assert (=> b!1392488 d!150375))

(declare-fun d!150377 () Bool)

(assert (=> d!150377 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119516 d!150377))

(declare-fun d!150383 () Bool)

(assert (=> d!150383 (= (array_inv!35194 a!2901) (bvsge (size!46513 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119516 d!150383))

(declare-fun call!66770 () Bool)

(declare-fun bm!66767 () Bool)

(assert (=> bm!66767 (= call!66770 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392582 () Bool)

(declare-fun e!788569 () Bool)

(declare-fun e!788568 () Bool)

(assert (=> b!1392582 (= e!788569 e!788568)))

(declare-fun c!129649 () Bool)

(assert (=> b!1392582 (= c!129649 (validKeyInArray!0 (select (arr!45961 a!2901) j!112)))))

(declare-fun b!1392583 () Bool)

(declare-fun e!788570 () Bool)

(assert (=> b!1392583 (= e!788570 call!66770)))

(declare-fun b!1392584 () Bool)

(assert (=> b!1392584 (= e!788568 call!66770)))

(declare-fun d!150385 () Bool)

(declare-fun res!932191 () Bool)

(assert (=> d!150385 (=> res!932191 e!788569)))

(assert (=> d!150385 (= res!932191 (bvsge j!112 (size!46513 a!2901)))))

(assert (=> d!150385 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788569)))

(declare-fun b!1392585 () Bool)

(assert (=> b!1392585 (= e!788568 e!788570)))

(declare-fun lt!611492 () (_ BitVec 64))

(assert (=> b!1392585 (= lt!611492 (select (arr!45961 a!2901) j!112))))

(declare-fun lt!611490 () Unit!46455)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95202 (_ BitVec 64) (_ BitVec 32)) Unit!46455)

(assert (=> b!1392585 (= lt!611490 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611492 j!112))))

(declare-fun arrayContainsKey!0 (array!95202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392585 (arrayContainsKey!0 a!2901 lt!611492 #b00000000000000000000000000000000)))

(declare-fun lt!611491 () Unit!46455)

(assert (=> b!1392585 (= lt!611491 lt!611490)))

(declare-fun res!932190 () Bool)

(assert (=> b!1392585 (= res!932190 (= (seekEntryOrOpen!0 (select (arr!45961 a!2901) j!112) a!2901 mask!2840) (Found!10304 j!112)))))

(assert (=> b!1392585 (=> (not res!932190) (not e!788570))))

(assert (= (and d!150385 (not res!932191)) b!1392582))

(assert (= (and b!1392582 c!129649) b!1392585))

(assert (= (and b!1392582 (not c!129649)) b!1392584))

(assert (= (and b!1392585 res!932190) b!1392583))

(assert (= (or b!1392583 b!1392584) bm!66767))

(declare-fun m!1277915 () Bool)

(assert (=> bm!66767 m!1277915))

(assert (=> b!1392582 m!1277797))

(assert (=> b!1392582 m!1277797))

(assert (=> b!1392582 m!1277799))

(assert (=> b!1392585 m!1277797))

(declare-fun m!1277917 () Bool)

(assert (=> b!1392585 m!1277917))

(declare-fun m!1277919 () Bool)

(assert (=> b!1392585 m!1277919))

(assert (=> b!1392585 m!1277797))

(assert (=> b!1392585 m!1277823))

(assert (=> b!1392484 d!150385))

(declare-fun d!150395 () Bool)

(assert (=> d!150395 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611495 () Unit!46455)

(declare-fun choose!38 (array!95202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46455)

(assert (=> d!150395 (= lt!611495 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150395 (validMask!0 mask!2840)))

(assert (=> d!150395 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611495)))

(declare-fun bs!40487 () Bool)

(assert (= bs!40487 d!150395))

(assert (=> bs!40487 m!1277807))

(declare-fun m!1277921 () Bool)

(assert (=> bs!40487 m!1277921))

(assert (=> bs!40487 m!1277827))

(assert (=> b!1392484 d!150395))

(declare-fun b!1392649 () Bool)

(declare-fun e!788606 () SeekEntryResult!10304)

(assert (=> b!1392649 (= e!788606 (Intermediate!10304 true (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392650 () Bool)

(declare-fun e!788609 () SeekEntryResult!10304)

(assert (=> b!1392650 (= e!788606 e!788609)))

(declare-fun c!129674 () Bool)

(declare-fun lt!611522 () (_ BitVec 64))

(assert (=> b!1392650 (= c!129674 (or (= lt!611522 (select (arr!45961 a!2901) j!112)) (= (bvadd lt!611522 lt!611522) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392651 () Bool)

(declare-fun e!788607 () Bool)

(declare-fun lt!611521 () SeekEntryResult!10304)

(assert (=> b!1392651 (= e!788607 (bvsge (x!125267 lt!611521) #b01111111111111111111111111111110))))

(declare-fun b!1392652 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392652 (= e!788609 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45961 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392653 () Bool)

(assert (=> b!1392653 (and (bvsge (index!43589 lt!611521) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611521) (size!46513 a!2901)))))

(declare-fun e!788608 () Bool)

(assert (=> b!1392653 (= e!788608 (= (select (arr!45961 a!2901) (index!43589 lt!611521)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392654 () Bool)

(assert (=> b!1392654 (= e!788609 (Intermediate!10304 false (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392655 () Bool)

(assert (=> b!1392655 (and (bvsge (index!43589 lt!611521) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611521) (size!46513 a!2901)))))

(declare-fun res!932208 () Bool)

(assert (=> b!1392655 (= res!932208 (= (select (arr!45961 a!2901) (index!43589 lt!611521)) (select (arr!45961 a!2901) j!112)))))

(assert (=> b!1392655 (=> res!932208 e!788608)))

(declare-fun e!788605 () Bool)

(assert (=> b!1392655 (= e!788605 e!788608)))

(declare-fun d!150397 () Bool)

(assert (=> d!150397 e!788607))

(declare-fun c!129676 () Bool)

(assert (=> d!150397 (= c!129676 (and ((_ is Intermediate!10304) lt!611521) (undefined!11116 lt!611521)))))

(assert (=> d!150397 (= lt!611521 e!788606)))

(declare-fun c!129675 () Bool)

(assert (=> d!150397 (= c!129675 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150397 (= lt!611522 (select (arr!45961 a!2901) (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840)))))

(assert (=> d!150397 (validMask!0 mask!2840)))

(assert (=> d!150397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840) (select (arr!45961 a!2901) j!112) a!2901 mask!2840) lt!611521)))

(declare-fun b!1392656 () Bool)

(assert (=> b!1392656 (and (bvsge (index!43589 lt!611521) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611521) (size!46513 a!2901)))))

(declare-fun res!932209 () Bool)

(assert (=> b!1392656 (= res!932209 (= (select (arr!45961 a!2901) (index!43589 lt!611521)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392656 (=> res!932209 e!788608)))

(declare-fun b!1392657 () Bool)

(assert (=> b!1392657 (= e!788607 e!788605)))

(declare-fun res!932210 () Bool)

(assert (=> b!1392657 (= res!932210 (and ((_ is Intermediate!10304) lt!611521) (not (undefined!11116 lt!611521)) (bvslt (x!125267 lt!611521) #b01111111111111111111111111111110) (bvsge (x!125267 lt!611521) #b00000000000000000000000000000000) (bvsge (x!125267 lt!611521) #b00000000000000000000000000000000)))))

(assert (=> b!1392657 (=> (not res!932210) (not e!788605))))

(assert (= (and d!150397 c!129675) b!1392649))

(assert (= (and d!150397 (not c!129675)) b!1392650))

(assert (= (and b!1392650 c!129674) b!1392654))

(assert (= (and b!1392650 (not c!129674)) b!1392652))

(assert (= (and d!150397 c!129676) b!1392651))

(assert (= (and d!150397 (not c!129676)) b!1392657))

(assert (= (and b!1392657 res!932210) b!1392655))

(assert (= (and b!1392655 (not res!932208)) b!1392656))

(assert (= (and b!1392656 (not res!932209)) b!1392653))

(declare-fun m!1277941 () Bool)

(assert (=> b!1392655 m!1277941))

(assert (=> d!150397 m!1277801))

(declare-fun m!1277943 () Bool)

(assert (=> d!150397 m!1277943))

(assert (=> d!150397 m!1277827))

(assert (=> b!1392656 m!1277941))

(assert (=> b!1392652 m!1277801))

(declare-fun m!1277945 () Bool)

(assert (=> b!1392652 m!1277945))

(assert (=> b!1392652 m!1277945))

(assert (=> b!1392652 m!1277797))

(declare-fun m!1277947 () Bool)

(assert (=> b!1392652 m!1277947))

(assert (=> b!1392653 m!1277941))

(assert (=> b!1392484 d!150397))

(declare-fun d!150409 () Bool)

(declare-fun lt!611531 () (_ BitVec 32))

(declare-fun lt!611530 () (_ BitVec 32))

(assert (=> d!150409 (= lt!611531 (bvmul (bvxor lt!611530 (bvlshr lt!611530 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150409 (= lt!611530 ((_ extract 31 0) (bvand (bvxor (select (arr!45961 a!2901) j!112) (bvlshr (select (arr!45961 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150409 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932217 (let ((h!33788 ((_ extract 31 0) (bvand (bvxor (select (arr!45961 a!2901) j!112) (bvlshr (select (arr!45961 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125273 (bvmul (bvxor h!33788 (bvlshr h!33788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125273 (bvlshr x!125273 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932217 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932217 #b00000000000000000000000000000000))))))

(assert (=> d!150409 (= (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840) (bvand (bvxor lt!611531 (bvlshr lt!611531 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392484 d!150409))

(declare-fun d!150415 () Bool)

(assert (=> d!150415 (= (validKeyInArray!0 (select (arr!45961 a!2901) j!112)) (and (not (= (select (arr!45961 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45961 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392489 d!150415))

(declare-fun bm!66772 () Bool)

(declare-fun call!66775 () Bool)

(assert (=> bm!66772 (= call!66775 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392686 () Bool)

(declare-fun e!788631 () Bool)

(declare-fun e!788630 () Bool)

(assert (=> b!1392686 (= e!788631 e!788630)))

(declare-fun c!129684 () Bool)

(assert (=> b!1392686 (= c!129684 (validKeyInArray!0 (select (arr!45961 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392687 () Bool)

(declare-fun e!788632 () Bool)

(assert (=> b!1392687 (= e!788632 call!66775)))

(declare-fun b!1392688 () Bool)

(assert (=> b!1392688 (= e!788630 call!66775)))

(declare-fun d!150417 () Bool)

(declare-fun res!932227 () Bool)

(assert (=> d!150417 (=> res!932227 e!788631)))

(assert (=> d!150417 (= res!932227 (bvsge #b00000000000000000000000000000000 (size!46513 a!2901)))))

(assert (=> d!150417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788631)))

(declare-fun b!1392689 () Bool)

(assert (=> b!1392689 (= e!788630 e!788632)))

(declare-fun lt!611536 () (_ BitVec 64))

(assert (=> b!1392689 (= lt!611536 (select (arr!45961 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611534 () Unit!46455)

(assert (=> b!1392689 (= lt!611534 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611536 #b00000000000000000000000000000000))))

(assert (=> b!1392689 (arrayContainsKey!0 a!2901 lt!611536 #b00000000000000000000000000000000)))

(declare-fun lt!611535 () Unit!46455)

(assert (=> b!1392689 (= lt!611535 lt!611534)))

(declare-fun res!932226 () Bool)

(assert (=> b!1392689 (= res!932226 (= (seekEntryOrOpen!0 (select (arr!45961 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10304 #b00000000000000000000000000000000)))))

(assert (=> b!1392689 (=> (not res!932226) (not e!788632))))

(assert (= (and d!150417 (not res!932227)) b!1392686))

(assert (= (and b!1392686 c!129684) b!1392689))

(assert (= (and b!1392686 (not c!129684)) b!1392688))

(assert (= (and b!1392689 res!932226) b!1392687))

(assert (= (or b!1392687 b!1392688) bm!66772))

(declare-fun m!1277973 () Bool)

(assert (=> bm!66772 m!1277973))

(assert (=> b!1392686 m!1277899))

(assert (=> b!1392686 m!1277899))

(assert (=> b!1392686 m!1277901))

(assert (=> b!1392689 m!1277899))

(declare-fun m!1277975 () Bool)

(assert (=> b!1392689 m!1277975))

(declare-fun m!1277977 () Bool)

(assert (=> b!1392689 m!1277977))

(assert (=> b!1392689 m!1277899))

(declare-fun m!1277979 () Bool)

(assert (=> b!1392689 m!1277979))

(assert (=> b!1392490 d!150417))

(declare-fun d!150423 () Bool)

(assert (=> d!150423 (= (validKeyInArray!0 (select (arr!45961 a!2901) i!1037)) (and (not (= (select (arr!45961 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45961 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392485 d!150423))

(declare-fun b!1392698 () Bool)

(declare-fun e!788638 () SeekEntryResult!10304)

(assert (=> b!1392698 (= e!788638 (Intermediate!10304 true (toIndex!0 (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392699 () Bool)

(declare-fun e!788641 () SeekEntryResult!10304)

(assert (=> b!1392699 (= e!788638 e!788641)))

(declare-fun c!129689 () Bool)

(declare-fun lt!611544 () (_ BitVec 64))

(assert (=> b!1392699 (= c!129689 (or (= lt!611544 (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!611544 lt!611544) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392700 () Bool)

(declare-fun e!788639 () Bool)

(declare-fun lt!611543 () SeekEntryResult!10304)

(assert (=> b!1392700 (= e!788639 (bvsge (x!125267 lt!611543) #b01111111111111111111111111111110))))

(declare-fun b!1392701 () Bool)

(assert (=> b!1392701 (= e!788641 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901)) mask!2840))))

(declare-fun b!1392702 () Bool)

(assert (=> b!1392702 (and (bvsge (index!43589 lt!611543) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611543) (size!46513 (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901)))))))

(declare-fun e!788640 () Bool)

(assert (=> b!1392702 (= e!788640 (= (select (arr!45961 (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901))) (index!43589 lt!611543)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392703 () Bool)

(assert (=> b!1392703 (= e!788641 (Intermediate!10304 false (toIndex!0 (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392704 () Bool)

(assert (=> b!1392704 (and (bvsge (index!43589 lt!611543) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611543) (size!46513 (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901)))))))

(declare-fun res!932228 () Bool)

(assert (=> b!1392704 (= res!932228 (= (select (arr!45961 (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901))) (index!43589 lt!611543)) (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1392704 (=> res!932228 e!788640)))

(declare-fun e!788637 () Bool)

(assert (=> b!1392704 (= e!788637 e!788640)))

(declare-fun d!150425 () Bool)

(assert (=> d!150425 e!788639))

(declare-fun c!129691 () Bool)

(assert (=> d!150425 (= c!129691 (and ((_ is Intermediate!10304) lt!611543) (undefined!11116 lt!611543)))))

(assert (=> d!150425 (= lt!611543 e!788638)))

(declare-fun c!129690 () Bool)

(assert (=> d!150425 (= c!129690 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150425 (= lt!611544 (select (arr!45961 (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901))) (toIndex!0 (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150425 (validMask!0 mask!2840)))

(assert (=> d!150425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901)) mask!2840) lt!611543)))

(declare-fun b!1392705 () Bool)

(assert (=> b!1392705 (and (bvsge (index!43589 lt!611543) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611543) (size!46513 (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901)))))))

(declare-fun res!932229 () Bool)

(assert (=> b!1392705 (= res!932229 (= (select (arr!45961 (array!95203 (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46513 a!2901))) (index!43589 lt!611543)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392705 (=> res!932229 e!788640)))

(declare-fun b!1392706 () Bool)

(assert (=> b!1392706 (= e!788639 e!788637)))

(declare-fun res!932230 () Bool)

(assert (=> b!1392706 (= res!932230 (and ((_ is Intermediate!10304) lt!611543) (not (undefined!11116 lt!611543)) (bvslt (x!125267 lt!611543) #b01111111111111111111111111111110) (bvsge (x!125267 lt!611543) #b00000000000000000000000000000000) (bvsge (x!125267 lt!611543) #b00000000000000000000000000000000)))))

(assert (=> b!1392706 (=> (not res!932230) (not e!788637))))

(assert (= (and d!150425 c!129690) b!1392698))

(assert (= (and d!150425 (not c!129690)) b!1392699))

(assert (= (and b!1392699 c!129689) b!1392703))

(assert (= (and b!1392699 (not c!129689)) b!1392701))

(assert (= (and d!150425 c!129691) b!1392700))

(assert (= (and d!150425 (not c!129691)) b!1392706))

(assert (= (and b!1392706 res!932230) b!1392704))

(assert (= (and b!1392704 (not res!932228)) b!1392705))

(assert (= (and b!1392705 (not res!932229)) b!1392702))

(declare-fun m!1277981 () Bool)

(assert (=> b!1392704 m!1277981))

(assert (=> d!150425 m!1277813))

(declare-fun m!1277983 () Bool)

(assert (=> d!150425 m!1277983))

(assert (=> d!150425 m!1277827))

(assert (=> b!1392705 m!1277981))

(assert (=> b!1392701 m!1277813))

(declare-fun m!1277985 () Bool)

(assert (=> b!1392701 m!1277985))

(assert (=> b!1392701 m!1277985))

(assert (=> b!1392701 m!1277811))

(declare-fun m!1277987 () Bool)

(assert (=> b!1392701 m!1277987))

(assert (=> b!1392702 m!1277981))

(assert (=> b!1392491 d!150425))

(declare-fun d!150429 () Bool)

(declare-fun lt!611546 () (_ BitVec 32))

(declare-fun lt!611545 () (_ BitVec 32))

(assert (=> d!150429 (= lt!611546 (bvmul (bvxor lt!611545 (bvlshr lt!611545 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150429 (= lt!611545 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150429 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932217 (let ((h!33788 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125273 (bvmul (bvxor h!33788 (bvlshr h!33788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125273 (bvlshr x!125273 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932217 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932217 #b00000000000000000000000000000000))))))

(assert (=> d!150429 (= (toIndex!0 (select (store (arr!45961 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611546 (bvlshr lt!611546 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392491 d!150429))

(declare-fun b!1392750 () Bool)

(declare-fun c!129706 () Bool)

(declare-fun lt!611570 () (_ BitVec 64))

(assert (=> b!1392750 (= c!129706 (= lt!611570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788669 () SeekEntryResult!10304)

(declare-fun e!788668 () SeekEntryResult!10304)

(assert (=> b!1392750 (= e!788669 e!788668)))

(declare-fun b!1392751 () Bool)

(declare-fun lt!611571 () SeekEntryResult!10304)

(assert (=> b!1392751 (= e!788668 (MissingZero!10304 (index!43589 lt!611571)))))

(declare-fun b!1392752 () Bool)

(declare-fun e!788670 () SeekEntryResult!10304)

(assert (=> b!1392752 (= e!788670 Undefined!10304)))

(declare-fun d!150431 () Bool)

(declare-fun lt!611572 () SeekEntryResult!10304)

(assert (=> d!150431 (and (or ((_ is Undefined!10304) lt!611572) (not ((_ is Found!10304) lt!611572)) (and (bvsge (index!43588 lt!611572) #b00000000000000000000000000000000) (bvslt (index!43588 lt!611572) (size!46513 a!2901)))) (or ((_ is Undefined!10304) lt!611572) ((_ is Found!10304) lt!611572) (not ((_ is MissingZero!10304) lt!611572)) (and (bvsge (index!43587 lt!611572) #b00000000000000000000000000000000) (bvslt (index!43587 lt!611572) (size!46513 a!2901)))) (or ((_ is Undefined!10304) lt!611572) ((_ is Found!10304) lt!611572) ((_ is MissingZero!10304) lt!611572) (not ((_ is MissingVacant!10304) lt!611572)) (and (bvsge (index!43590 lt!611572) #b00000000000000000000000000000000) (bvslt (index!43590 lt!611572) (size!46513 a!2901)))) (or ((_ is Undefined!10304) lt!611572) (ite ((_ is Found!10304) lt!611572) (= (select (arr!45961 a!2901) (index!43588 lt!611572)) (select (arr!45961 a!2901) j!112)) (ite ((_ is MissingZero!10304) lt!611572) (= (select (arr!45961 a!2901) (index!43587 lt!611572)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10304) lt!611572) (= (select (arr!45961 a!2901) (index!43590 lt!611572)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150431 (= lt!611572 e!788670)))

(declare-fun c!129707 () Bool)

(assert (=> d!150431 (= c!129707 (and ((_ is Intermediate!10304) lt!611571) (undefined!11116 lt!611571)))))

(assert (=> d!150431 (= lt!611571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45961 a!2901) j!112) mask!2840) (select (arr!45961 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150431 (validMask!0 mask!2840)))

(assert (=> d!150431 (= (seekEntryOrOpen!0 (select (arr!45961 a!2901) j!112) a!2901 mask!2840) lt!611572)))

(declare-fun b!1392753 () Bool)

(assert (=> b!1392753 (= e!788670 e!788669)))

(assert (=> b!1392753 (= lt!611570 (select (arr!45961 a!2901) (index!43589 lt!611571)))))

(declare-fun c!129708 () Bool)

(assert (=> b!1392753 (= c!129708 (= lt!611570 (select (arr!45961 a!2901) j!112)))))

(declare-fun b!1392754 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95202 (_ BitVec 32)) SeekEntryResult!10304)

(assert (=> b!1392754 (= e!788668 (seekKeyOrZeroReturnVacant!0 (x!125267 lt!611571) (index!43589 lt!611571) (index!43589 lt!611571) (select (arr!45961 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392755 () Bool)

(assert (=> b!1392755 (= e!788669 (Found!10304 (index!43589 lt!611571)))))

(assert (= (and d!150431 c!129707) b!1392752))

(assert (= (and d!150431 (not c!129707)) b!1392753))

(assert (= (and b!1392753 c!129708) b!1392755))

(assert (= (and b!1392753 (not c!129708)) b!1392750))

(assert (= (and b!1392750 c!129706) b!1392751))

(assert (= (and b!1392750 (not c!129706)) b!1392754))

(assert (=> d!150431 m!1277797))

(assert (=> d!150431 m!1277801))

(declare-fun m!1278003 () Bool)

(assert (=> d!150431 m!1278003))

(assert (=> d!150431 m!1277801))

(assert (=> d!150431 m!1277797))

(assert (=> d!150431 m!1277805))

(declare-fun m!1278005 () Bool)

(assert (=> d!150431 m!1278005))

(assert (=> d!150431 m!1277827))

(declare-fun m!1278007 () Bool)

(assert (=> d!150431 m!1278007))

(declare-fun m!1278009 () Bool)

(assert (=> b!1392753 m!1278009))

(assert (=> b!1392754 m!1277797))

(declare-fun m!1278011 () Bool)

(assert (=> b!1392754 m!1278011))

(assert (=> b!1392492 d!150431))

(check-sat (not d!150425) (not b!1392701) (not b!1392585) (not d!150431) (not bm!66761) (not b!1392582) (not b!1392652) (not b!1392558) (not d!150395) (not b!1392557) (not b!1392689) (not b!1392560) (not bm!66772) (not d!150397) (not b!1392686) (not b!1392754) (not bm!66767))
(check-sat)
