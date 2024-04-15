; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119204 () Bool)

(assert start!119204)

(declare-fun b!1390479 () Bool)

(declare-fun res!930691 () Bool)

(declare-fun e!787433 () Bool)

(assert (=> b!1390479 (=> (not res!930691) (not e!787433))))

(declare-datatypes ((array!95094 0))(
  ( (array!95095 (arr!45913 (Array (_ BitVec 32) (_ BitVec 64))) (size!46465 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95094)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95094 (_ BitVec 32)) Bool)

(assert (=> b!1390479 (= res!930691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930693 () Bool)

(assert (=> start!119204 (=> (not res!930693) (not e!787433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119204 (= res!930693 (validMask!0 mask!2840))))

(assert (=> start!119204 e!787433))

(assert (=> start!119204 true))

(declare-fun array_inv!35146 (array!95094) Bool)

(assert (=> start!119204 (array_inv!35146 a!2901)))

(declare-fun b!1390480 () Bool)

(declare-fun res!930692 () Bool)

(assert (=> b!1390480 (=> (not res!930692) (not e!787433))))

(declare-datatypes ((List!32510 0))(
  ( (Nil!32507) (Cons!32506 (h!33724 (_ BitVec 64)) (t!47196 List!32510)) )
))
(declare-fun arrayNoDuplicates!0 (array!95094 (_ BitVec 32) List!32510) Bool)

(assert (=> b!1390480 (= res!930692 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32507))))

(declare-fun b!1390481 () Bool)

(declare-fun e!787431 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10256 0))(
  ( (MissingZero!10256 (index!43395 (_ BitVec 32))) (Found!10256 (index!43396 (_ BitVec 32))) (Intermediate!10256 (undefined!11068 Bool) (index!43397 (_ BitVec 32)) (x!125067 (_ BitVec 32))) (Undefined!10256) (MissingVacant!10256 (index!43398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95094 (_ BitVec 32)) SeekEntryResult!10256)

(assert (=> b!1390481 (= e!787431 (= (seekEntryOrOpen!0 (select (arr!45913 a!2901) j!112) a!2901 mask!2840) (Found!10256 j!112)))))

(declare-fun b!1390482 () Bool)

(declare-fun res!930695 () Bool)

(assert (=> b!1390482 (=> (not res!930695) (not e!787433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390482 (= res!930695 (validKeyInArray!0 (select (arr!45913 a!2901) j!112)))))

(declare-fun b!1390483 () Bool)

(declare-fun res!930694 () Bool)

(assert (=> b!1390483 (=> (not res!930694) (not e!787433))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390483 (= res!930694 (validKeyInArray!0 (select (arr!45913 a!2901) i!1037)))))

(declare-fun b!1390484 () Bool)

(declare-fun lt!610670 () SeekEntryResult!10256)

(get-info :version)

(assert (=> b!1390484 (= e!787433 (not (or (not ((_ is Intermediate!10256) lt!610670)) (undefined!11068 lt!610670) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(assert (=> b!1390484 e!787431))

(declare-fun res!930696 () Bool)

(assert (=> b!1390484 (=> (not res!930696) (not e!787431))))

(assert (=> b!1390484 (= res!930696 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46359 0))(
  ( (Unit!46360) )
))
(declare-fun lt!610669 () Unit!46359)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46359)

(assert (=> b!1390484 (= lt!610669 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95094 (_ BitVec 32)) SeekEntryResult!10256)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390484 (= lt!610670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840) (select (arr!45913 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390485 () Bool)

(declare-fun res!930697 () Bool)

(assert (=> b!1390485 (=> (not res!930697) (not e!787433))))

(assert (=> b!1390485 (= res!930697 (and (= (size!46465 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46465 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46465 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119204 res!930693) b!1390485))

(assert (= (and b!1390485 res!930697) b!1390483))

(assert (= (and b!1390483 res!930694) b!1390482))

(assert (= (and b!1390482 res!930695) b!1390479))

(assert (= (and b!1390479 res!930691) b!1390480))

(assert (= (and b!1390480 res!930692) b!1390484))

(assert (= (and b!1390484 res!930696) b!1390481))

(declare-fun m!1275901 () Bool)

(assert (=> b!1390480 m!1275901))

(declare-fun m!1275903 () Bool)

(assert (=> b!1390483 m!1275903))

(assert (=> b!1390483 m!1275903))

(declare-fun m!1275905 () Bool)

(assert (=> b!1390483 m!1275905))

(declare-fun m!1275907 () Bool)

(assert (=> b!1390479 m!1275907))

(declare-fun m!1275909 () Bool)

(assert (=> start!119204 m!1275909))

(declare-fun m!1275911 () Bool)

(assert (=> start!119204 m!1275911))

(declare-fun m!1275913 () Bool)

(assert (=> b!1390481 m!1275913))

(assert (=> b!1390481 m!1275913))

(declare-fun m!1275915 () Bool)

(assert (=> b!1390481 m!1275915))

(assert (=> b!1390482 m!1275913))

(assert (=> b!1390482 m!1275913))

(declare-fun m!1275917 () Bool)

(assert (=> b!1390482 m!1275917))

(assert (=> b!1390484 m!1275913))

(declare-fun m!1275919 () Bool)

(assert (=> b!1390484 m!1275919))

(assert (=> b!1390484 m!1275913))

(declare-fun m!1275921 () Bool)

(assert (=> b!1390484 m!1275921))

(assert (=> b!1390484 m!1275919))

(assert (=> b!1390484 m!1275913))

(declare-fun m!1275923 () Bool)

(assert (=> b!1390484 m!1275923))

(declare-fun m!1275925 () Bool)

(assert (=> b!1390484 m!1275925))

(check-sat (not b!1390482) (not b!1390484) (not start!119204) (not b!1390481) (not b!1390479) (not b!1390480) (not b!1390483))
(check-sat)
(get-model)

(declare-fun b!1390538 () Bool)

(declare-fun e!787460 () Bool)

(declare-fun e!787461 () Bool)

(assert (=> b!1390538 (= e!787460 e!787461)))

(declare-fun c!129343 () Bool)

(assert (=> b!1390538 (= c!129343 (validKeyInArray!0 (select (arr!45913 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66677 () Bool)

(declare-fun call!66680 () Bool)

(assert (=> bm!66677 (= call!66680 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129343 (Cons!32506 (select (arr!45913 a!2901) #b00000000000000000000000000000000) Nil!32507) Nil!32507)))))

(declare-fun b!1390539 () Bool)

(assert (=> b!1390539 (= e!787461 call!66680)))

(declare-fun b!1390540 () Bool)

(declare-fun e!787463 () Bool)

(declare-fun contains!9722 (List!32510 (_ BitVec 64)) Bool)

(assert (=> b!1390540 (= e!787463 (contains!9722 Nil!32507 (select (arr!45913 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150073 () Bool)

(declare-fun res!930747 () Bool)

(declare-fun e!787462 () Bool)

(assert (=> d!150073 (=> res!930747 e!787462)))

(assert (=> d!150073 (= res!930747 (bvsge #b00000000000000000000000000000000 (size!46465 a!2901)))))

(assert (=> d!150073 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32507) e!787462)))

(declare-fun b!1390541 () Bool)

(assert (=> b!1390541 (= e!787462 e!787460)))

(declare-fun res!930748 () Bool)

(assert (=> b!1390541 (=> (not res!930748) (not e!787460))))

(assert (=> b!1390541 (= res!930748 (not e!787463))))

(declare-fun res!930746 () Bool)

(assert (=> b!1390541 (=> (not res!930746) (not e!787463))))

(assert (=> b!1390541 (= res!930746 (validKeyInArray!0 (select (arr!45913 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390542 () Bool)

(assert (=> b!1390542 (= e!787461 call!66680)))

(assert (= (and d!150073 (not res!930747)) b!1390541))

(assert (= (and b!1390541 res!930746) b!1390540))

(assert (= (and b!1390541 res!930748) b!1390538))

(assert (= (and b!1390538 c!129343) b!1390539))

(assert (= (and b!1390538 (not c!129343)) b!1390542))

(assert (= (or b!1390539 b!1390542) bm!66677))

(declare-fun m!1275979 () Bool)

(assert (=> b!1390538 m!1275979))

(assert (=> b!1390538 m!1275979))

(declare-fun m!1275981 () Bool)

(assert (=> b!1390538 m!1275981))

(assert (=> bm!66677 m!1275979))

(declare-fun m!1275983 () Bool)

(assert (=> bm!66677 m!1275983))

(assert (=> b!1390540 m!1275979))

(assert (=> b!1390540 m!1275979))

(declare-fun m!1275985 () Bool)

(assert (=> b!1390540 m!1275985))

(assert (=> b!1390541 m!1275979))

(assert (=> b!1390541 m!1275979))

(assert (=> b!1390541 m!1275981))

(assert (=> b!1390480 d!150073))

(declare-fun d!150081 () Bool)

(declare-fun res!930769 () Bool)

(declare-fun e!787492 () Bool)

(assert (=> d!150081 (=> res!930769 e!787492)))

(assert (=> d!150081 (= res!930769 (bvsge j!112 (size!46465 a!2901)))))

(assert (=> d!150081 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!787492)))

(declare-fun b!1390578 () Bool)

(declare-fun e!787491 () Bool)

(assert (=> b!1390578 (= e!787492 e!787491)))

(declare-fun c!129352 () Bool)

(assert (=> b!1390578 (= c!129352 (validKeyInArray!0 (select (arr!45913 a!2901) j!112)))))

(declare-fun b!1390579 () Bool)

(declare-fun call!66689 () Bool)

(assert (=> b!1390579 (= e!787491 call!66689)))

(declare-fun b!1390580 () Bool)

(declare-fun e!787493 () Bool)

(assert (=> b!1390580 (= e!787493 call!66689)))

(declare-fun bm!66686 () Bool)

(assert (=> bm!66686 (= call!66689 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1390581 () Bool)

(assert (=> b!1390581 (= e!787491 e!787493)))

(declare-fun lt!610698 () (_ BitVec 64))

(assert (=> b!1390581 (= lt!610698 (select (arr!45913 a!2901) j!112))))

(declare-fun lt!610699 () Unit!46359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95094 (_ BitVec 64) (_ BitVec 32)) Unit!46359)

(assert (=> b!1390581 (= lt!610699 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610698 j!112))))

(declare-fun arrayContainsKey!0 (array!95094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1390581 (arrayContainsKey!0 a!2901 lt!610698 #b00000000000000000000000000000000)))

(declare-fun lt!610700 () Unit!46359)

(assert (=> b!1390581 (= lt!610700 lt!610699)))

(declare-fun res!930768 () Bool)

(assert (=> b!1390581 (= res!930768 (= (seekEntryOrOpen!0 (select (arr!45913 a!2901) j!112) a!2901 mask!2840) (Found!10256 j!112)))))

(assert (=> b!1390581 (=> (not res!930768) (not e!787493))))

(assert (= (and d!150081 (not res!930769)) b!1390578))

(assert (= (and b!1390578 c!129352) b!1390581))

(assert (= (and b!1390578 (not c!129352)) b!1390579))

(assert (= (and b!1390581 res!930768) b!1390580))

(assert (= (or b!1390580 b!1390579) bm!66686))

(assert (=> b!1390578 m!1275913))

(assert (=> b!1390578 m!1275913))

(assert (=> b!1390578 m!1275917))

(declare-fun m!1276007 () Bool)

(assert (=> bm!66686 m!1276007))

(assert (=> b!1390581 m!1275913))

(declare-fun m!1276009 () Bool)

(assert (=> b!1390581 m!1276009))

(declare-fun m!1276011 () Bool)

(assert (=> b!1390581 m!1276011))

(assert (=> b!1390581 m!1275913))

(assert (=> b!1390581 m!1275915))

(assert (=> b!1390484 d!150081))

(declare-fun d!150091 () Bool)

(assert (=> d!150091 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!610709 () Unit!46359)

(declare-fun choose!38 (array!95094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46359)

(assert (=> d!150091 (= lt!610709 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150091 (validMask!0 mask!2840)))

(assert (=> d!150091 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!610709)))

(declare-fun bs!40426 () Bool)

(assert (= bs!40426 d!150091))

(assert (=> bs!40426 m!1275925))

(declare-fun m!1276013 () Bool)

(assert (=> bs!40426 m!1276013))

(assert (=> bs!40426 m!1275909))

(assert (=> b!1390484 d!150091))

(declare-fun b!1390635 () Bool)

(declare-fun e!787534 () Bool)

(declare-fun e!787535 () Bool)

(assert (=> b!1390635 (= e!787534 e!787535)))

(declare-fun res!930797 () Bool)

(declare-fun lt!610730 () SeekEntryResult!10256)

(assert (=> b!1390635 (= res!930797 (and ((_ is Intermediate!10256) lt!610730) (not (undefined!11068 lt!610730)) (bvslt (x!125067 lt!610730) #b01111111111111111111111111111110) (bvsge (x!125067 lt!610730) #b00000000000000000000000000000000) (bvsge (x!125067 lt!610730) #b00000000000000000000000000000000)))))

(assert (=> b!1390635 (=> (not res!930797) (not e!787535))))

(declare-fun d!150093 () Bool)

(assert (=> d!150093 e!787534))

(declare-fun c!129367 () Bool)

(assert (=> d!150093 (= c!129367 (and ((_ is Intermediate!10256) lt!610730) (undefined!11068 lt!610730)))))

(declare-fun e!787531 () SeekEntryResult!10256)

(assert (=> d!150093 (= lt!610730 e!787531)))

(declare-fun c!129368 () Bool)

(assert (=> d!150093 (= c!129368 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!610729 () (_ BitVec 64))

(assert (=> d!150093 (= lt!610729 (select (arr!45913 a!2901) (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840)))))

(assert (=> d!150093 (validMask!0 mask!2840)))

(assert (=> d!150093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840) (select (arr!45913 a!2901) j!112) a!2901 mask!2840) lt!610730)))

(declare-fun b!1390636 () Bool)

(assert (=> b!1390636 (and (bvsge (index!43397 lt!610730) #b00000000000000000000000000000000) (bvslt (index!43397 lt!610730) (size!46465 a!2901)))))

(declare-fun res!930795 () Bool)

(assert (=> b!1390636 (= res!930795 (= (select (arr!45913 a!2901) (index!43397 lt!610730)) (select (arr!45913 a!2901) j!112)))))

(declare-fun e!787533 () Bool)

(assert (=> b!1390636 (=> res!930795 e!787533)))

(assert (=> b!1390636 (= e!787535 e!787533)))

(declare-fun b!1390637 () Bool)

(declare-fun e!787532 () SeekEntryResult!10256)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390637 (= e!787532 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45913 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390638 () Bool)

(assert (=> b!1390638 (and (bvsge (index!43397 lt!610730) #b00000000000000000000000000000000) (bvslt (index!43397 lt!610730) (size!46465 a!2901)))))

(assert (=> b!1390638 (= e!787533 (= (select (arr!45913 a!2901) (index!43397 lt!610730)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1390639 () Bool)

(assert (=> b!1390639 (= e!787531 e!787532)))

(declare-fun c!129369 () Bool)

(assert (=> b!1390639 (= c!129369 (or (= lt!610729 (select (arr!45913 a!2901) j!112)) (= (bvadd lt!610729 lt!610729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1390640 () Bool)

(assert (=> b!1390640 (= e!787531 (Intermediate!10256 true (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1390641 () Bool)

(assert (=> b!1390641 (= e!787532 (Intermediate!10256 false (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1390642 () Bool)

(assert (=> b!1390642 (and (bvsge (index!43397 lt!610730) #b00000000000000000000000000000000) (bvslt (index!43397 lt!610730) (size!46465 a!2901)))))

(declare-fun res!930796 () Bool)

(assert (=> b!1390642 (= res!930796 (= (select (arr!45913 a!2901) (index!43397 lt!610730)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1390642 (=> res!930796 e!787533)))

(declare-fun b!1390643 () Bool)

(assert (=> b!1390643 (= e!787534 (bvsge (x!125067 lt!610730) #b01111111111111111111111111111110))))

(assert (= (and d!150093 c!129368) b!1390640))

(assert (= (and d!150093 (not c!129368)) b!1390639))

(assert (= (and b!1390639 c!129369) b!1390641))

(assert (= (and b!1390639 (not c!129369)) b!1390637))

(assert (= (and d!150093 c!129367) b!1390643))

(assert (= (and d!150093 (not c!129367)) b!1390635))

(assert (= (and b!1390635 res!930797) b!1390636))

(assert (= (and b!1390636 (not res!930795)) b!1390642))

(assert (= (and b!1390642 (not res!930796)) b!1390638))

(declare-fun m!1276043 () Bool)

(assert (=> b!1390636 m!1276043))

(assert (=> b!1390642 m!1276043))

(assert (=> b!1390638 m!1276043))

(assert (=> b!1390637 m!1275919))

(declare-fun m!1276045 () Bool)

(assert (=> b!1390637 m!1276045))

(assert (=> b!1390637 m!1276045))

(assert (=> b!1390637 m!1275913))

(declare-fun m!1276047 () Bool)

(assert (=> b!1390637 m!1276047))

(assert (=> d!150093 m!1275919))

(declare-fun m!1276049 () Bool)

(assert (=> d!150093 m!1276049))

(assert (=> d!150093 m!1275909))

(assert (=> b!1390484 d!150093))

(declare-fun d!150111 () Bool)

(declare-fun lt!610740 () (_ BitVec 32))

(declare-fun lt!610739 () (_ BitVec 32))

(assert (=> d!150111 (= lt!610740 (bvmul (bvxor lt!610739 (bvlshr lt!610739 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150111 (= lt!610739 ((_ extract 31 0) (bvand (bvxor (select (arr!45913 a!2901) j!112) (bvlshr (select (arr!45913 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150111 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!930798 (let ((h!33727 ((_ extract 31 0) (bvand (bvxor (select (arr!45913 a!2901) j!112) (bvlshr (select (arr!45913 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125071 (bvmul (bvxor h!33727 (bvlshr h!33727 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125071 (bvlshr x!125071 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!930798 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!930798 #b00000000000000000000000000000000))))))

(assert (=> d!150111 (= (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840) (bvand (bvxor lt!610740 (bvlshr lt!610740 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1390484 d!150111))

(declare-fun d!150113 () Bool)

(declare-fun res!930806 () Bool)

(declare-fun e!787547 () Bool)

(assert (=> d!150113 (=> res!930806 e!787547)))

(assert (=> d!150113 (= res!930806 (bvsge #b00000000000000000000000000000000 (size!46465 a!2901)))))

(assert (=> d!150113 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787547)))

(declare-fun b!1390662 () Bool)

(declare-fun e!787546 () Bool)

(assert (=> b!1390662 (= e!787547 e!787546)))

(declare-fun c!129376 () Bool)

(assert (=> b!1390662 (= c!129376 (validKeyInArray!0 (select (arr!45913 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390663 () Bool)

(declare-fun call!66698 () Bool)

(assert (=> b!1390663 (= e!787546 call!66698)))

(declare-fun b!1390664 () Bool)

(declare-fun e!787548 () Bool)

(assert (=> b!1390664 (= e!787548 call!66698)))

(declare-fun bm!66695 () Bool)

(assert (=> bm!66695 (= call!66698 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1390665 () Bool)

(assert (=> b!1390665 (= e!787546 e!787548)))

(declare-fun lt!610741 () (_ BitVec 64))

(assert (=> b!1390665 (= lt!610741 (select (arr!45913 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!610742 () Unit!46359)

(assert (=> b!1390665 (= lt!610742 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610741 #b00000000000000000000000000000000))))

(assert (=> b!1390665 (arrayContainsKey!0 a!2901 lt!610741 #b00000000000000000000000000000000)))

(declare-fun lt!610743 () Unit!46359)

(assert (=> b!1390665 (= lt!610743 lt!610742)))

(declare-fun res!930805 () Bool)

(assert (=> b!1390665 (= res!930805 (= (seekEntryOrOpen!0 (select (arr!45913 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10256 #b00000000000000000000000000000000)))))

(assert (=> b!1390665 (=> (not res!930805) (not e!787548))))

(assert (= (and d!150113 (not res!930806)) b!1390662))

(assert (= (and b!1390662 c!129376) b!1390665))

(assert (= (and b!1390662 (not c!129376)) b!1390663))

(assert (= (and b!1390665 res!930805) b!1390664))

(assert (= (or b!1390664 b!1390663) bm!66695))

(assert (=> b!1390662 m!1275979))

(assert (=> b!1390662 m!1275979))

(assert (=> b!1390662 m!1275981))

(declare-fun m!1276051 () Bool)

(assert (=> bm!66695 m!1276051))

(assert (=> b!1390665 m!1275979))

(declare-fun m!1276053 () Bool)

(assert (=> b!1390665 m!1276053))

(declare-fun m!1276055 () Bool)

(assert (=> b!1390665 m!1276055))

(assert (=> b!1390665 m!1275979))

(declare-fun m!1276057 () Bool)

(assert (=> b!1390665 m!1276057))

(assert (=> b!1390479 d!150113))

(declare-fun d!150115 () Bool)

(assert (=> d!150115 (= (validKeyInArray!0 (select (arr!45913 a!2901) j!112)) (and (not (= (select (arr!45913 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45913 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390482 d!150115))

(declare-fun d!150117 () Bool)

(assert (=> d!150117 (= (validKeyInArray!0 (select (arr!45913 a!2901) i!1037)) (and (not (= (select (arr!45913 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45913 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390483 d!150117))

(declare-fun lt!610770 () SeekEntryResult!10256)

(declare-fun e!787575 () SeekEntryResult!10256)

(declare-fun b!1390714 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95094 (_ BitVec 32)) SeekEntryResult!10256)

(assert (=> b!1390714 (= e!787575 (seekKeyOrZeroReturnVacant!0 (x!125067 lt!610770) (index!43397 lt!610770) (index!43397 lt!610770) (select (arr!45913 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390715 () Bool)

(declare-fun e!787576 () SeekEntryResult!10256)

(assert (=> b!1390715 (= e!787576 Undefined!10256)))

(declare-fun b!1390716 () Bool)

(declare-fun e!787577 () SeekEntryResult!10256)

(assert (=> b!1390716 (= e!787577 (Found!10256 (index!43397 lt!610770)))))

(declare-fun b!1390717 () Bool)

(assert (=> b!1390717 (= e!787575 (MissingZero!10256 (index!43397 lt!610770)))))

(declare-fun b!1390718 () Bool)

(assert (=> b!1390718 (= e!787576 e!787577)))

(declare-fun lt!610771 () (_ BitVec 64))

(assert (=> b!1390718 (= lt!610771 (select (arr!45913 a!2901) (index!43397 lt!610770)))))

(declare-fun c!129396 () Bool)

(assert (=> b!1390718 (= c!129396 (= lt!610771 (select (arr!45913 a!2901) j!112)))))

(declare-fun d!150119 () Bool)

(declare-fun lt!610772 () SeekEntryResult!10256)

(assert (=> d!150119 (and (or ((_ is Undefined!10256) lt!610772) (not ((_ is Found!10256) lt!610772)) (and (bvsge (index!43396 lt!610772) #b00000000000000000000000000000000) (bvslt (index!43396 lt!610772) (size!46465 a!2901)))) (or ((_ is Undefined!10256) lt!610772) ((_ is Found!10256) lt!610772) (not ((_ is MissingZero!10256) lt!610772)) (and (bvsge (index!43395 lt!610772) #b00000000000000000000000000000000) (bvslt (index!43395 lt!610772) (size!46465 a!2901)))) (or ((_ is Undefined!10256) lt!610772) ((_ is Found!10256) lt!610772) ((_ is MissingZero!10256) lt!610772) (not ((_ is MissingVacant!10256) lt!610772)) (and (bvsge (index!43398 lt!610772) #b00000000000000000000000000000000) (bvslt (index!43398 lt!610772) (size!46465 a!2901)))) (or ((_ is Undefined!10256) lt!610772) (ite ((_ is Found!10256) lt!610772) (= (select (arr!45913 a!2901) (index!43396 lt!610772)) (select (arr!45913 a!2901) j!112)) (ite ((_ is MissingZero!10256) lt!610772) (= (select (arr!45913 a!2901) (index!43395 lt!610772)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10256) lt!610772) (= (select (arr!45913 a!2901) (index!43398 lt!610772)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150119 (= lt!610772 e!787576)))

(declare-fun c!129395 () Bool)

(assert (=> d!150119 (= c!129395 (and ((_ is Intermediate!10256) lt!610770) (undefined!11068 lt!610770)))))

(assert (=> d!150119 (= lt!610770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840) (select (arr!45913 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150119 (validMask!0 mask!2840)))

(assert (=> d!150119 (= (seekEntryOrOpen!0 (select (arr!45913 a!2901) j!112) a!2901 mask!2840) lt!610772)))

(declare-fun b!1390719 () Bool)

(declare-fun c!129397 () Bool)

(assert (=> b!1390719 (= c!129397 (= lt!610771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1390719 (= e!787577 e!787575)))

(assert (= (and d!150119 c!129395) b!1390715))

(assert (= (and d!150119 (not c!129395)) b!1390718))

(assert (= (and b!1390718 c!129396) b!1390716))

(assert (= (and b!1390718 (not c!129396)) b!1390719))

(assert (= (and b!1390719 c!129397) b!1390717))

(assert (= (and b!1390719 (not c!129397)) b!1390714))

(assert (=> b!1390714 m!1275913))

(declare-fun m!1276075 () Bool)

(assert (=> b!1390714 m!1276075))

(declare-fun m!1276077 () Bool)

(assert (=> b!1390718 m!1276077))

(assert (=> d!150119 m!1275909))

(assert (=> d!150119 m!1275913))

(assert (=> d!150119 m!1275919))

(declare-fun m!1276079 () Bool)

(assert (=> d!150119 m!1276079))

(declare-fun m!1276081 () Bool)

(assert (=> d!150119 m!1276081))

(assert (=> d!150119 m!1275919))

(assert (=> d!150119 m!1275913))

(assert (=> d!150119 m!1275923))

(declare-fun m!1276083 () Bool)

(assert (=> d!150119 m!1276083))

(assert (=> b!1390481 d!150119))

(declare-fun d!150133 () Bool)

(assert (=> d!150133 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119204 d!150133))

(declare-fun d!150135 () Bool)

(assert (=> d!150135 (= (array_inv!35146 a!2901) (bvsge (size!46465 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119204 d!150135))

(check-sat (not b!1390540) (not b!1390581) (not b!1390538) (not b!1390665) (not bm!66686) (not b!1390714) (not b!1390541) (not bm!66695) (not d!150119) (not b!1390637) (not d!150091) (not b!1390578) (not bm!66677) (not b!1390662) (not d!150093))
(check-sat)
