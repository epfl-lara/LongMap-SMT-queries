; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33144 () Bool)

(assert start!33144)

(declare-fun b!329655 () Bool)

(declare-fun e!202484 () Bool)

(assert (=> b!329655 (= e!202484 true)))

(declare-datatypes ((Unit!10210 0))(
  ( (Unit!10211) )
))
(declare-fun lt!158301 () Unit!10210)

(declare-fun e!202485 () Unit!10210)

(assert (=> b!329655 (= lt!158301 e!202485)))

(declare-datatypes ((array!16854 0))(
  ( (array!16855 (arr!7971 (Array (_ BitVec 32) (_ BitVec 64))) (size!8323 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16854)

(declare-fun c!51633 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((SeekEntryResult!3102 0))(
  ( (MissingZero!3102 (index!14584 (_ BitVec 32))) (Found!3102 (index!14585 (_ BitVec 32))) (Intermediate!3102 (undefined!3914 Bool) (index!14586 (_ BitVec 32)) (x!32860 (_ BitVec 32))) (Undefined!3102) (MissingVacant!3102 (index!14587 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16854 (_ BitVec 32)) SeekEntryResult!3102)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329655 (= c!51633 ((_ is Intermediate!3102) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun b!329656 () Bool)

(declare-fun res!181673 () Bool)

(assert (=> b!329656 (=> (not res!181673) (not e!202484))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329656 (= res!181673 (and (= (select (arr!7971 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8323 a!3305))))))

(declare-fun b!329657 () Bool)

(declare-fun res!181680 () Bool)

(declare-fun e!202483 () Bool)

(assert (=> b!329657 (=> (not res!181680) (not e!202483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16854 (_ BitVec 32)) Bool)

(assert (=> b!329657 (= res!181680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329658 () Bool)

(declare-fun Unit!10212 () Unit!10210)

(assert (=> b!329658 (= e!202485 Unit!10212)))

(assert (=> b!329658 false))

(declare-fun b!329659 () Bool)

(declare-fun res!181679 () Bool)

(assert (=> b!329659 (=> (not res!181679) (not e!202484))))

(declare-fun lt!158300 () SeekEntryResult!3102)

(assert (=> b!329659 (= res!181679 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158300))))

(declare-fun b!329661 () Bool)

(assert (=> b!329661 (= e!202483 e!202484)))

(declare-fun res!181675 () Bool)

(assert (=> b!329661 (=> (not res!181675) (not e!202484))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329661 (= res!181675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158300))))

(assert (=> b!329661 (= lt!158300 (Intermediate!3102 false resIndex!58 resX!58))))

(declare-fun b!329662 () Bool)

(declare-fun res!181671 () Bool)

(assert (=> b!329662 (=> (not res!181671) (not e!202483))))

(declare-fun arrayContainsKey!0 (array!16854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329662 (= res!181671 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329663 () Bool)

(declare-fun res!181672 () Bool)

(assert (=> b!329663 (=> (not res!181672) (not e!202483))))

(assert (=> b!329663 (= res!181672 (and (= (size!8323 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8323 a!3305))))))

(declare-fun b!329664 () Bool)

(declare-fun res!181677 () Bool)

(assert (=> b!329664 (=> (not res!181677) (not e!202483))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16854 (_ BitVec 32)) SeekEntryResult!3102)

(assert (=> b!329664 (= res!181677 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3102 i!1250)))))

(declare-fun b!329665 () Bool)

(declare-fun Unit!10213 () Unit!10210)

(assert (=> b!329665 (= e!202485 Unit!10213)))

(declare-fun b!329666 () Bool)

(declare-fun res!181678 () Bool)

(assert (=> b!329666 (=> (not res!181678) (not e!202483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329666 (= res!181678 (validKeyInArray!0 k0!2497))))

(declare-fun res!181674 () Bool)

(assert (=> start!33144 (=> (not res!181674) (not e!202483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33144 (= res!181674 (validMask!0 mask!3777))))

(assert (=> start!33144 e!202483))

(declare-fun array_inv!5934 (array!16854) Bool)

(assert (=> start!33144 (array_inv!5934 a!3305)))

(assert (=> start!33144 true))

(declare-fun b!329660 () Bool)

(declare-fun res!181676 () Bool)

(assert (=> b!329660 (=> (not res!181676) (not e!202484))))

(assert (=> b!329660 (= res!181676 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7971 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7971 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7971 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!33144 res!181674) b!329663))

(assert (= (and b!329663 res!181672) b!329666))

(assert (= (and b!329666 res!181678) b!329662))

(assert (= (and b!329662 res!181671) b!329664))

(assert (= (and b!329664 res!181677) b!329657))

(assert (= (and b!329657 res!181680) b!329661))

(assert (= (and b!329661 res!181675) b!329656))

(assert (= (and b!329656 res!181673) b!329659))

(assert (= (and b!329659 res!181679) b!329660))

(assert (= (and b!329660 res!181676) b!329655))

(assert (= (and b!329655 c!51633) b!329665))

(assert (= (and b!329655 (not c!51633)) b!329658))

(declare-fun m!335233 () Bool)

(assert (=> b!329660 m!335233))

(declare-fun m!335235 () Bool)

(assert (=> b!329659 m!335235))

(declare-fun m!335237 () Bool)

(assert (=> b!329664 m!335237))

(declare-fun m!335239 () Bool)

(assert (=> b!329657 m!335239))

(declare-fun m!335241 () Bool)

(assert (=> b!329656 m!335241))

(declare-fun m!335243 () Bool)

(assert (=> b!329662 m!335243))

(declare-fun m!335245 () Bool)

(assert (=> b!329666 m!335245))

(declare-fun m!335247 () Bool)

(assert (=> b!329661 m!335247))

(assert (=> b!329661 m!335247))

(declare-fun m!335249 () Bool)

(assert (=> b!329661 m!335249))

(declare-fun m!335251 () Bool)

(assert (=> b!329655 m!335251))

(assert (=> b!329655 m!335251))

(declare-fun m!335253 () Bool)

(assert (=> b!329655 m!335253))

(declare-fun m!335255 () Bool)

(assert (=> start!33144 m!335255))

(declare-fun m!335257 () Bool)

(assert (=> start!33144 m!335257))

(check-sat (not b!329662) (not b!329661) (not start!33144) (not b!329657) (not b!329664) (not b!329666) (not b!329659) (not b!329655))
(check-sat)
(get-model)

(declare-fun b!329711 () Bool)

(declare-fun e!202505 () Bool)

(declare-fun call!26155 () Bool)

(assert (=> b!329711 (= e!202505 call!26155)))

(declare-fun b!329712 () Bool)

(declare-fun e!202507 () Bool)

(assert (=> b!329712 (= e!202507 e!202505)))

(declare-fun c!51639 () Bool)

(assert (=> b!329712 (= c!51639 (validKeyInArray!0 (select (arr!7971 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26152 () Bool)

(assert (=> bm!26152 (= call!26155 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun d!70219 () Bool)

(declare-fun res!181716 () Bool)

(assert (=> d!70219 (=> res!181716 e!202507)))

(assert (=> d!70219 (= res!181716 (bvsge #b00000000000000000000000000000000 (size!8323 a!3305)))))

(assert (=> d!70219 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202507)))

(declare-fun b!329713 () Bool)

(declare-fun e!202506 () Bool)

(assert (=> b!329713 (= e!202506 call!26155)))

(declare-fun b!329714 () Bool)

(assert (=> b!329714 (= e!202505 e!202506)))

(declare-fun lt!158315 () (_ BitVec 64))

(assert (=> b!329714 (= lt!158315 (select (arr!7971 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158314 () Unit!10210)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16854 (_ BitVec 64) (_ BitVec 32)) Unit!10210)

(assert (=> b!329714 (= lt!158314 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158315 #b00000000000000000000000000000000))))

(assert (=> b!329714 (arrayContainsKey!0 a!3305 lt!158315 #b00000000000000000000000000000000)))

(declare-fun lt!158316 () Unit!10210)

(assert (=> b!329714 (= lt!158316 lt!158314)))

(declare-fun res!181715 () Bool)

(assert (=> b!329714 (= res!181715 (= (seekEntryOrOpen!0 (select (arr!7971 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3102 #b00000000000000000000000000000000)))))

(assert (=> b!329714 (=> (not res!181715) (not e!202506))))

(assert (= (and d!70219 (not res!181716)) b!329712))

(assert (= (and b!329712 c!51639) b!329714))

(assert (= (and b!329712 (not c!51639)) b!329711))

(assert (= (and b!329714 res!181715) b!329713))

(assert (= (or b!329713 b!329711) bm!26152))

(declare-fun m!335285 () Bool)

(assert (=> b!329712 m!335285))

(assert (=> b!329712 m!335285))

(declare-fun m!335287 () Bool)

(assert (=> b!329712 m!335287))

(declare-fun m!335289 () Bool)

(assert (=> bm!26152 m!335289))

(assert (=> b!329714 m!335285))

(declare-fun m!335291 () Bool)

(assert (=> b!329714 m!335291))

(declare-fun m!335293 () Bool)

(assert (=> b!329714 m!335293))

(assert (=> b!329714 m!335285))

(declare-fun m!335295 () Bool)

(assert (=> b!329714 m!335295))

(assert (=> b!329657 d!70219))

(declare-fun b!329747 () Bool)

(declare-fun lt!158325 () SeekEntryResult!3102)

(assert (=> b!329747 (and (bvsge (index!14586 lt!158325) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158325) (size!8323 a!3305)))))

(declare-fun res!181731 () Bool)

(assert (=> b!329747 (= res!181731 (= (select (arr!7971 a!3305) (index!14586 lt!158325)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202530 () Bool)

(assert (=> b!329747 (=> res!181731 e!202530)))

(declare-fun b!329748 () Bool)

(declare-fun e!202529 () SeekEntryResult!3102)

(assert (=> b!329748 (= e!202529 (Intermediate!3102 false index!1840 x!1490))))

(declare-fun b!329749 () Bool)

(declare-fun e!202528 () SeekEntryResult!3102)

(assert (=> b!329749 (= e!202528 e!202529)))

(declare-fun c!51651 () Bool)

(declare-fun lt!158326 () (_ BitVec 64))

(assert (=> b!329749 (= c!51651 (or (= lt!158326 k0!2497) (= (bvadd lt!158326 lt!158326) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329750 () Bool)

(declare-fun e!202531 () Bool)

(assert (=> b!329750 (= e!202531 (bvsge (x!32860 lt!158325) #b01111111111111111111111111111110))))

(declare-fun b!329751 () Bool)

(assert (=> b!329751 (= e!202528 (Intermediate!3102 true index!1840 x!1490))))

(declare-fun d!70221 () Bool)

(assert (=> d!70221 e!202531))

(declare-fun c!51652 () Bool)

(assert (=> d!70221 (= c!51652 (and ((_ is Intermediate!3102) lt!158325) (undefined!3914 lt!158325)))))

(assert (=> d!70221 (= lt!158325 e!202528)))

(declare-fun c!51650 () Bool)

(assert (=> d!70221 (= c!51650 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70221 (= lt!158326 (select (arr!7971 a!3305) index!1840))))

(assert (=> d!70221 (validMask!0 mask!3777)))

(assert (=> d!70221 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158325)))

(declare-fun b!329752 () Bool)

(assert (=> b!329752 (and (bvsge (index!14586 lt!158325) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158325) (size!8323 a!3305)))))

(declare-fun res!181730 () Bool)

(assert (=> b!329752 (= res!181730 (= (select (arr!7971 a!3305) (index!14586 lt!158325)) k0!2497))))

(assert (=> b!329752 (=> res!181730 e!202530)))

(declare-fun e!202532 () Bool)

(assert (=> b!329752 (= e!202532 e!202530)))

(declare-fun b!329753 () Bool)

(assert (=> b!329753 (= e!202529 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329754 () Bool)

(assert (=> b!329754 (= e!202531 e!202532)))

(declare-fun res!181729 () Bool)

(assert (=> b!329754 (= res!181729 (and ((_ is Intermediate!3102) lt!158325) (not (undefined!3914 lt!158325)) (bvslt (x!32860 lt!158325) #b01111111111111111111111111111110) (bvsge (x!32860 lt!158325) #b00000000000000000000000000000000) (bvsge (x!32860 lt!158325) x!1490)))))

(assert (=> b!329754 (=> (not res!181729) (not e!202532))))

(declare-fun b!329755 () Bool)

(assert (=> b!329755 (and (bvsge (index!14586 lt!158325) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158325) (size!8323 a!3305)))))

(assert (=> b!329755 (= e!202530 (= (select (arr!7971 a!3305) (index!14586 lt!158325)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70221 c!51650) b!329751))

(assert (= (and d!70221 (not c!51650)) b!329749))

(assert (= (and b!329749 c!51651) b!329748))

(assert (= (and b!329749 (not c!51651)) b!329753))

(assert (= (and d!70221 c!51652) b!329750))

(assert (= (and d!70221 (not c!51652)) b!329754))

(assert (= (and b!329754 res!181729) b!329752))

(assert (= (and b!329752 (not res!181730)) b!329747))

(assert (= (and b!329747 (not res!181731)) b!329755))

(declare-fun m!335301 () Bool)

(assert (=> b!329755 m!335301))

(assert (=> b!329752 m!335301))

(assert (=> b!329753 m!335251))

(assert (=> b!329753 m!335251))

(declare-fun m!335303 () Bool)

(assert (=> b!329753 m!335303))

(assert (=> d!70221 m!335233))

(assert (=> d!70221 m!335255))

(assert (=> b!329747 m!335301))

(assert (=> b!329659 d!70221))

(declare-fun d!70229 () Bool)

(assert (=> d!70229 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33144 d!70229))

(declare-fun d!70239 () Bool)

(assert (=> d!70239 (= (array_inv!5934 a!3305) (bvsge (size!8323 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33144 d!70239))

(declare-fun b!329841 () Bool)

(declare-fun e!202581 () SeekEntryResult!3102)

(declare-fun e!202580 () SeekEntryResult!3102)

(assert (=> b!329841 (= e!202581 e!202580)))

(declare-fun lt!158356 () (_ BitVec 64))

(declare-fun lt!158355 () SeekEntryResult!3102)

(assert (=> b!329841 (= lt!158356 (select (arr!7971 a!3305) (index!14586 lt!158355)))))

(declare-fun c!51685 () Bool)

(assert (=> b!329841 (= c!51685 (= lt!158356 k0!2497))))

(declare-fun d!70241 () Bool)

(declare-fun lt!158357 () SeekEntryResult!3102)

(assert (=> d!70241 (and (or ((_ is Undefined!3102) lt!158357) (not ((_ is Found!3102) lt!158357)) (and (bvsge (index!14585 lt!158357) #b00000000000000000000000000000000) (bvslt (index!14585 lt!158357) (size!8323 a!3305)))) (or ((_ is Undefined!3102) lt!158357) ((_ is Found!3102) lt!158357) (not ((_ is MissingZero!3102) lt!158357)) (and (bvsge (index!14584 lt!158357) #b00000000000000000000000000000000) (bvslt (index!14584 lt!158357) (size!8323 a!3305)))) (or ((_ is Undefined!3102) lt!158357) ((_ is Found!3102) lt!158357) ((_ is MissingZero!3102) lt!158357) (not ((_ is MissingVacant!3102) lt!158357)) (and (bvsge (index!14587 lt!158357) #b00000000000000000000000000000000) (bvslt (index!14587 lt!158357) (size!8323 a!3305)))) (or ((_ is Undefined!3102) lt!158357) (ite ((_ is Found!3102) lt!158357) (= (select (arr!7971 a!3305) (index!14585 lt!158357)) k0!2497) (ite ((_ is MissingZero!3102) lt!158357) (= (select (arr!7971 a!3305) (index!14584 lt!158357)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3102) lt!158357) (= (select (arr!7971 a!3305) (index!14587 lt!158357)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70241 (= lt!158357 e!202581)))

(declare-fun c!51687 () Bool)

(assert (=> d!70241 (= c!51687 (and ((_ is Intermediate!3102) lt!158355) (undefined!3914 lt!158355)))))

(assert (=> d!70241 (= lt!158355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70241 (validMask!0 mask!3777)))

(assert (=> d!70241 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158357)))

(declare-fun b!329842 () Bool)

(assert (=> b!329842 (= e!202580 (Found!3102 (index!14586 lt!158355)))))

(declare-fun b!329843 () Bool)

(declare-fun c!51686 () Bool)

(assert (=> b!329843 (= c!51686 (= lt!158356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202579 () SeekEntryResult!3102)

(assert (=> b!329843 (= e!202580 e!202579)))

(declare-fun b!329844 () Bool)

(assert (=> b!329844 (= e!202581 Undefined!3102)))

(declare-fun b!329845 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16854 (_ BitVec 32)) SeekEntryResult!3102)

(assert (=> b!329845 (= e!202579 (seekKeyOrZeroReturnVacant!0 (x!32860 lt!158355) (index!14586 lt!158355) (index!14586 lt!158355) k0!2497 a!3305 mask!3777))))

(declare-fun b!329846 () Bool)

(assert (=> b!329846 (= e!202579 (MissingZero!3102 (index!14586 lt!158355)))))

(assert (= (and d!70241 c!51687) b!329844))

(assert (= (and d!70241 (not c!51687)) b!329841))

(assert (= (and b!329841 c!51685) b!329842))

(assert (= (and b!329841 (not c!51685)) b!329843))

(assert (= (and b!329843 c!51686) b!329846))

(assert (= (and b!329843 (not c!51686)) b!329845))

(declare-fun m!335333 () Bool)

(assert (=> b!329841 m!335333))

(declare-fun m!335335 () Bool)

(assert (=> d!70241 m!335335))

(assert (=> d!70241 m!335247))

(declare-fun m!335337 () Bool)

(assert (=> d!70241 m!335337))

(assert (=> d!70241 m!335255))

(assert (=> d!70241 m!335247))

(assert (=> d!70241 m!335249))

(declare-fun m!335339 () Bool)

(assert (=> d!70241 m!335339))

(declare-fun m!335341 () Bool)

(assert (=> b!329845 m!335341))

(assert (=> b!329664 d!70241))

(declare-fun d!70251 () Bool)

(assert (=> d!70251 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329666 d!70251))

(declare-fun b!329847 () Bool)

(declare-fun lt!158358 () SeekEntryResult!3102)

(assert (=> b!329847 (and (bvsge (index!14586 lt!158358) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158358) (size!8323 a!3305)))))

(declare-fun res!181755 () Bool)

(assert (=> b!329847 (= res!181755 (= (select (arr!7971 a!3305) (index!14586 lt!158358)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202584 () Bool)

(assert (=> b!329847 (=> res!181755 e!202584)))

(declare-fun b!329848 () Bool)

(declare-fun e!202583 () SeekEntryResult!3102)

(assert (=> b!329848 (= e!202583 (Intermediate!3102 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329849 () Bool)

(declare-fun e!202582 () SeekEntryResult!3102)

(assert (=> b!329849 (= e!202582 e!202583)))

(declare-fun c!51689 () Bool)

(declare-fun lt!158359 () (_ BitVec 64))

(assert (=> b!329849 (= c!51689 (or (= lt!158359 k0!2497) (= (bvadd lt!158359 lt!158359) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329850 () Bool)

(declare-fun e!202585 () Bool)

(assert (=> b!329850 (= e!202585 (bvsge (x!32860 lt!158358) #b01111111111111111111111111111110))))

(declare-fun b!329851 () Bool)

(assert (=> b!329851 (= e!202582 (Intermediate!3102 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun d!70253 () Bool)

(assert (=> d!70253 e!202585))

(declare-fun c!51690 () Bool)

(assert (=> d!70253 (= c!51690 (and ((_ is Intermediate!3102) lt!158358) (undefined!3914 lt!158358)))))

(assert (=> d!70253 (= lt!158358 e!202582)))

(declare-fun c!51688 () Bool)

(assert (=> d!70253 (= c!51688 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!70253 (= lt!158359 (select (arr!7971 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70253 (validMask!0 mask!3777)))

(assert (=> d!70253 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777) lt!158358)))

(declare-fun b!329852 () Bool)

(assert (=> b!329852 (and (bvsge (index!14586 lt!158358) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158358) (size!8323 a!3305)))))

(declare-fun res!181754 () Bool)

(assert (=> b!329852 (= res!181754 (= (select (arr!7971 a!3305) (index!14586 lt!158358)) k0!2497))))

(assert (=> b!329852 (=> res!181754 e!202584)))

(declare-fun e!202586 () Bool)

(assert (=> b!329852 (= e!202586 e!202584)))

(declare-fun b!329853 () Bool)

(assert (=> b!329853 (= e!202583 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329854 () Bool)

(assert (=> b!329854 (= e!202585 e!202586)))

(declare-fun res!181753 () Bool)

(assert (=> b!329854 (= res!181753 (and ((_ is Intermediate!3102) lt!158358) (not (undefined!3914 lt!158358)) (bvslt (x!32860 lt!158358) #b01111111111111111111111111111110) (bvsge (x!32860 lt!158358) #b00000000000000000000000000000000) (bvsge (x!32860 lt!158358) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329854 (=> (not res!181753) (not e!202586))))

(declare-fun b!329855 () Bool)

(assert (=> b!329855 (and (bvsge (index!14586 lt!158358) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158358) (size!8323 a!3305)))))

(assert (=> b!329855 (= e!202584 (= (select (arr!7971 a!3305) (index!14586 lt!158358)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70253 c!51688) b!329851))

(assert (= (and d!70253 (not c!51688)) b!329849))

(assert (= (and b!329849 c!51689) b!329848))

(assert (= (and b!329849 (not c!51689)) b!329853))

(assert (= (and d!70253 c!51690) b!329850))

(assert (= (and d!70253 (not c!51690)) b!329854))

(assert (= (and b!329854 res!181753) b!329852))

(assert (= (and b!329852 (not res!181754)) b!329847))

(assert (= (and b!329847 (not res!181755)) b!329855))

(declare-fun m!335343 () Bool)

(assert (=> b!329855 m!335343))

(assert (=> b!329852 m!335343))

(assert (=> b!329853 m!335251))

(declare-fun m!335345 () Bool)

(assert (=> b!329853 m!335345))

(assert (=> b!329853 m!335345))

(declare-fun m!335347 () Bool)

(assert (=> b!329853 m!335347))

(assert (=> d!70253 m!335251))

(declare-fun m!335349 () Bool)

(assert (=> d!70253 m!335349))

(assert (=> d!70253 m!335255))

(assert (=> b!329847 m!335343))

(assert (=> b!329655 d!70253))

(declare-fun d!70255 () Bool)

(declare-fun lt!158362 () (_ BitVec 32))

(assert (=> d!70255 (and (bvsge lt!158362 #b00000000000000000000000000000000) (bvslt lt!158362 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70255 (= lt!158362 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70255 (validMask!0 mask!3777)))

(assert (=> d!70255 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158362)))

(declare-fun bs!11415 () Bool)

(assert (= bs!11415 d!70255))

(declare-fun m!335351 () Bool)

(assert (=> bs!11415 m!335351))

(assert (=> bs!11415 m!335255))

(assert (=> b!329655 d!70255))

(declare-fun d!70257 () Bool)

(declare-fun res!181760 () Bool)

(declare-fun e!202591 () Bool)

(assert (=> d!70257 (=> res!181760 e!202591)))

(assert (=> d!70257 (= res!181760 (= (select (arr!7971 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70257 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202591)))

(declare-fun b!329860 () Bool)

(declare-fun e!202592 () Bool)

(assert (=> b!329860 (= e!202591 e!202592)))

(declare-fun res!181761 () Bool)

(assert (=> b!329860 (=> (not res!181761) (not e!202592))))

(assert (=> b!329860 (= res!181761 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8323 a!3305)))))

(declare-fun b!329861 () Bool)

(assert (=> b!329861 (= e!202592 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70257 (not res!181760)) b!329860))

(assert (= (and b!329860 res!181761) b!329861))

(assert (=> d!70257 m!335285))

(declare-fun m!335353 () Bool)

(assert (=> b!329861 m!335353))

(assert (=> b!329662 d!70257))

(declare-fun b!329862 () Bool)

(declare-fun lt!158363 () SeekEntryResult!3102)

(assert (=> b!329862 (and (bvsge (index!14586 lt!158363) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158363) (size!8323 a!3305)))))

(declare-fun res!181764 () Bool)

(assert (=> b!329862 (= res!181764 (= (select (arr!7971 a!3305) (index!14586 lt!158363)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202595 () Bool)

(assert (=> b!329862 (=> res!181764 e!202595)))

(declare-fun b!329863 () Bool)

(declare-fun e!202594 () SeekEntryResult!3102)

(assert (=> b!329863 (= e!202594 (Intermediate!3102 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329864 () Bool)

(declare-fun e!202593 () SeekEntryResult!3102)

(assert (=> b!329864 (= e!202593 e!202594)))

(declare-fun c!51692 () Bool)

(declare-fun lt!158364 () (_ BitVec 64))

(assert (=> b!329864 (= c!51692 (or (= lt!158364 k0!2497) (= (bvadd lt!158364 lt!158364) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329865 () Bool)

(declare-fun e!202596 () Bool)

(assert (=> b!329865 (= e!202596 (bvsge (x!32860 lt!158363) #b01111111111111111111111111111110))))

(declare-fun b!329866 () Bool)

(assert (=> b!329866 (= e!202593 (Intermediate!3102 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!70259 () Bool)

(assert (=> d!70259 e!202596))

(declare-fun c!51693 () Bool)

(assert (=> d!70259 (= c!51693 (and ((_ is Intermediate!3102) lt!158363) (undefined!3914 lt!158363)))))

(assert (=> d!70259 (= lt!158363 e!202593)))

(declare-fun c!51691 () Bool)

(assert (=> d!70259 (= c!51691 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70259 (= lt!158364 (select (arr!7971 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70259 (validMask!0 mask!3777)))

(assert (=> d!70259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158363)))

(declare-fun b!329867 () Bool)

(assert (=> b!329867 (and (bvsge (index!14586 lt!158363) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158363) (size!8323 a!3305)))))

(declare-fun res!181763 () Bool)

(assert (=> b!329867 (= res!181763 (= (select (arr!7971 a!3305) (index!14586 lt!158363)) k0!2497))))

(assert (=> b!329867 (=> res!181763 e!202595)))

(declare-fun e!202597 () Bool)

(assert (=> b!329867 (= e!202597 e!202595)))

(declare-fun b!329868 () Bool)

(assert (=> b!329868 (= e!202594 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329869 () Bool)

(assert (=> b!329869 (= e!202596 e!202597)))

(declare-fun res!181762 () Bool)

(assert (=> b!329869 (= res!181762 (and ((_ is Intermediate!3102) lt!158363) (not (undefined!3914 lt!158363)) (bvslt (x!32860 lt!158363) #b01111111111111111111111111111110) (bvsge (x!32860 lt!158363) #b00000000000000000000000000000000) (bvsge (x!32860 lt!158363) #b00000000000000000000000000000000)))))

(assert (=> b!329869 (=> (not res!181762) (not e!202597))))

(declare-fun b!329870 () Bool)

(assert (=> b!329870 (and (bvsge (index!14586 lt!158363) #b00000000000000000000000000000000) (bvslt (index!14586 lt!158363) (size!8323 a!3305)))))

(assert (=> b!329870 (= e!202595 (= (select (arr!7971 a!3305) (index!14586 lt!158363)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70259 c!51691) b!329866))

(assert (= (and d!70259 (not c!51691)) b!329864))

(assert (= (and b!329864 c!51692) b!329863))

(assert (= (and b!329864 (not c!51692)) b!329868))

(assert (= (and d!70259 c!51693) b!329865))

(assert (= (and d!70259 (not c!51693)) b!329869))

(assert (= (and b!329869 res!181762) b!329867))

(assert (= (and b!329867 (not res!181763)) b!329862))

(assert (= (and b!329862 (not res!181764)) b!329870))

(declare-fun m!335355 () Bool)

(assert (=> b!329870 m!335355))

(assert (=> b!329867 m!335355))

(assert (=> b!329868 m!335247))

(declare-fun m!335357 () Bool)

(assert (=> b!329868 m!335357))

(assert (=> b!329868 m!335357))

(declare-fun m!335359 () Bool)

(assert (=> b!329868 m!335359))

(assert (=> d!70259 m!335247))

(declare-fun m!335361 () Bool)

(assert (=> d!70259 m!335361))

(assert (=> d!70259 m!335255))

(assert (=> b!329862 m!335355))

(assert (=> b!329661 d!70259))

(declare-fun d!70263 () Bool)

(declare-fun lt!158379 () (_ BitVec 32))

(declare-fun lt!158378 () (_ BitVec 32))

(assert (=> d!70263 (= lt!158379 (bvmul (bvxor lt!158378 (bvlshr lt!158378 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70263 (= lt!158378 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70263 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181765 (let ((h!5418 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32867 (bvmul (bvxor h!5418 (bvlshr h!5418 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32867 (bvlshr x!32867 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181765 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181765 #b00000000000000000000000000000000))))))

(assert (=> d!70263 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158379 (bvlshr lt!158379 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329661 d!70263))

(check-sat (not b!329868) (not b!329845) (not d!70241) (not b!329714) (not bm!26152) (not d!70255) (not b!329753) (not d!70253) (not d!70221) (not d!70259) (not b!329712) (not b!329853) (not b!329861))
(check-sat)
