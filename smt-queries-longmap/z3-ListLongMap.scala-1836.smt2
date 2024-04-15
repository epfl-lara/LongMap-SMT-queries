; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33212 () Bool)

(assert start!33212)

(declare-fun b!330279 () Bool)

(assert (=> b!330279 false))

(declare-datatypes ((Unit!10272 0))(
  ( (Unit!10273) )
))
(declare-fun e!202709 () Unit!10272)

(declare-fun Unit!10274 () Unit!10272)

(assert (=> b!330279 (= e!202709 Unit!10274)))

(declare-fun b!330280 () Bool)

(declare-fun res!182048 () Bool)

(declare-fun e!202703 () Bool)

(assert (=> b!330280 (=> (not res!182048) (not e!202703))))

(declare-datatypes ((array!16875 0))(
  ( (array!16876 (arr!7980 (Array (_ BitVec 32) (_ BitVec 64))) (size!8333 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16875)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!330280 (= res!182048 (and (= (size!8333 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8333 a!3305))))))

(declare-fun b!330281 () Bool)

(declare-fun e!202705 () Bool)

(declare-fun e!202708 () Bool)

(assert (=> b!330281 (= e!202705 e!202708)))

(declare-fun res!182050 () Bool)

(assert (=> b!330281 (=> (not res!182050) (not e!202708))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3110 0))(
  ( (MissingZero!3110 (index!14616 (_ BitVec 32))) (Found!3110 (index!14617 (_ BitVec 32))) (Intermediate!3110 (undefined!3922 Bool) (index!14618 (_ BitVec 32)) (x!32912 (_ BitVec 32))) (Undefined!3110) (MissingVacant!3110 (index!14619 (_ BitVec 32))) )
))
(declare-fun lt!158300 () SeekEntryResult!3110)

(declare-fun lt!158303 () SeekEntryResult!3110)

(assert (=> b!330281 (= res!182050 (and (= lt!158303 lt!158300) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7980 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16875 (_ BitVec 32)) SeekEntryResult!3110)

(assert (=> b!330281 (= lt!158303 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!330282 () Bool)

(declare-fun res!182049 () Bool)

(assert (=> b!330282 (=> (not res!182049) (not e!202703))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16875 (_ BitVec 32)) SeekEntryResult!3110)

(assert (=> b!330282 (= res!182049 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3110 i!1250)))))

(declare-fun b!330283 () Bool)

(assert (=> b!330283 false))

(declare-fun lt!158302 () Unit!10272)

(declare-fun e!202706 () Unit!10272)

(assert (=> b!330283 (= lt!158302 e!202706)))

(declare-fun c!51760 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330283 (= c!51760 ((_ is Intermediate!3110) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10275 () Unit!10272)

(assert (=> b!330283 (= e!202709 Unit!10275)))

(declare-fun b!330284 () Bool)

(declare-fun e!202707 () Unit!10272)

(assert (=> b!330284 (= e!202707 e!202709)))

(declare-fun c!51761 () Bool)

(assert (=> b!330284 (= c!51761 (or (= (select (arr!7980 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7980 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330285 () Bool)

(declare-fun e!202704 () Bool)

(assert (=> b!330285 (= e!202708 (not e!202704))))

(declare-fun res!182053 () Bool)

(assert (=> b!330285 (=> res!182053 e!202704)))

(assert (=> b!330285 (= res!182053 (not (= (select (arr!7980 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330285 (= index!1840 resIndex!58)))

(declare-fun lt!158301 () Unit!10272)

(assert (=> b!330285 (= lt!158301 e!202707)))

(declare-fun c!51759 () Bool)

(assert (=> b!330285 (= c!51759 (not (= resIndex!58 index!1840)))))

(declare-fun b!330286 () Bool)

(declare-fun res!182054 () Bool)

(assert (=> b!330286 (=> (not res!182054) (not e!202703))))

(declare-fun arrayContainsKey!0 (array!16875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330286 (= res!182054 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330287 () Bool)

(declare-fun Unit!10276 () Unit!10272)

(assert (=> b!330287 (= e!202706 Unit!10276)))

(assert (=> b!330287 false))

(declare-fun b!330288 () Bool)

(assert (=> b!330288 (= e!202704 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305)) mask!3777) lt!158303))))

(declare-fun b!330289 () Bool)

(declare-fun res!182052 () Bool)

(assert (=> b!330289 (=> (not res!182052) (not e!202703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330289 (= res!182052 (validKeyInArray!0 k0!2497))))

(declare-fun res!182051 () Bool)

(assert (=> start!33212 (=> (not res!182051) (not e!202703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33212 (= res!182051 (validMask!0 mask!3777))))

(assert (=> start!33212 e!202703))

(declare-fun array_inv!5952 (array!16875) Bool)

(assert (=> start!33212 (array_inv!5952 a!3305)))

(assert (=> start!33212 true))

(declare-fun b!330290 () Bool)

(assert (=> b!330290 (= e!202703 e!202705)))

(declare-fun res!182046 () Bool)

(assert (=> b!330290 (=> (not res!182046) (not e!202705))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330290 (= res!182046 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158300))))

(assert (=> b!330290 (= lt!158300 (Intermediate!3110 false resIndex!58 resX!58))))

(declare-fun b!330291 () Bool)

(declare-fun res!182047 () Bool)

(assert (=> b!330291 (=> (not res!182047) (not e!202705))))

(assert (=> b!330291 (= res!182047 (and (= (select (arr!7980 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8333 a!3305))))))

(declare-fun b!330292 () Bool)

(declare-fun Unit!10277 () Unit!10272)

(assert (=> b!330292 (= e!202706 Unit!10277)))

(declare-fun b!330293 () Bool)

(declare-fun res!182055 () Bool)

(assert (=> b!330293 (=> (not res!182055) (not e!202703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16875 (_ BitVec 32)) Bool)

(assert (=> b!330293 (= res!182055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330294 () Bool)

(declare-fun Unit!10278 () Unit!10272)

(assert (=> b!330294 (= e!202707 Unit!10278)))

(assert (= (and start!33212 res!182051) b!330280))

(assert (= (and b!330280 res!182048) b!330289))

(assert (= (and b!330289 res!182052) b!330286))

(assert (= (and b!330286 res!182054) b!330282))

(assert (= (and b!330282 res!182049) b!330293))

(assert (= (and b!330293 res!182055) b!330290))

(assert (= (and b!330290 res!182046) b!330291))

(assert (= (and b!330291 res!182047) b!330281))

(assert (= (and b!330281 res!182050) b!330285))

(assert (= (and b!330285 c!51759) b!330284))

(assert (= (and b!330285 (not c!51759)) b!330294))

(assert (= (and b!330284 c!51761) b!330279))

(assert (= (and b!330284 (not c!51761)) b!330283))

(assert (= (and b!330283 c!51760) b!330292))

(assert (= (and b!330283 (not c!51760)) b!330287))

(assert (= (and b!330285 (not res!182053)) b!330288))

(declare-fun m!335005 () Bool)

(assert (=> b!330283 m!335005))

(assert (=> b!330283 m!335005))

(declare-fun m!335007 () Bool)

(assert (=> b!330283 m!335007))

(declare-fun m!335009 () Bool)

(assert (=> b!330281 m!335009))

(declare-fun m!335011 () Bool)

(assert (=> b!330281 m!335011))

(declare-fun m!335013 () Bool)

(assert (=> b!330289 m!335013))

(declare-fun m!335015 () Bool)

(assert (=> b!330290 m!335015))

(assert (=> b!330290 m!335015))

(declare-fun m!335017 () Bool)

(assert (=> b!330290 m!335017))

(declare-fun m!335019 () Bool)

(assert (=> b!330291 m!335019))

(declare-fun m!335021 () Bool)

(assert (=> start!33212 m!335021))

(declare-fun m!335023 () Bool)

(assert (=> start!33212 m!335023))

(declare-fun m!335025 () Bool)

(assert (=> b!330286 m!335025))

(assert (=> b!330284 m!335009))

(assert (=> b!330285 m!335009))

(declare-fun m!335027 () Bool)

(assert (=> b!330288 m!335027))

(declare-fun m!335029 () Bool)

(assert (=> b!330288 m!335029))

(declare-fun m!335031 () Bool)

(assert (=> b!330282 m!335031))

(declare-fun m!335033 () Bool)

(assert (=> b!330293 m!335033))

(check-sat (not b!330282) (not b!330293) (not start!33212) (not b!330289) (not b!330290) (not b!330281) (not b!330283) (not b!330286) (not b!330288))
(check-sat)
(get-model)

(declare-fun d!70089 () Bool)

(declare-fun res!182120 () Bool)

(declare-fun e!202762 () Bool)

(assert (=> d!70089 (=> res!182120 e!202762)))

(assert (=> d!70089 (= res!182120 (= (select (arr!7980 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70089 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202762)))

(declare-fun b!330395 () Bool)

(declare-fun e!202763 () Bool)

(assert (=> b!330395 (= e!202762 e!202763)))

(declare-fun res!182121 () Bool)

(assert (=> b!330395 (=> (not res!182121) (not e!202763))))

(assert (=> b!330395 (= res!182121 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8333 a!3305)))))

(declare-fun b!330396 () Bool)

(assert (=> b!330396 (= e!202763 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70089 (not res!182120)) b!330395))

(assert (= (and b!330395 res!182121) b!330396))

(declare-fun m!335095 () Bool)

(assert (=> d!70089 m!335095))

(declare-fun m!335097 () Bool)

(assert (=> b!330396 m!335097))

(assert (=> b!330286 d!70089))

(declare-fun b!330427 () Bool)

(declare-fun e!202786 () Bool)

(declare-fun e!202787 () Bool)

(assert (=> b!330427 (= e!202786 e!202787)))

(declare-fun res!182134 () Bool)

(declare-fun lt!158342 () SeekEntryResult!3110)

(assert (=> b!330427 (= res!182134 (and ((_ is Intermediate!3110) lt!158342) (not (undefined!3922 lt!158342)) (bvslt (x!32912 lt!158342) #b01111111111111111111111111111110) (bvsge (x!32912 lt!158342) #b00000000000000000000000000000000) (bvsge (x!32912 lt!158342) x!1490)))))

(assert (=> b!330427 (=> (not res!182134) (not e!202787))))

(declare-fun d!70091 () Bool)

(assert (=> d!70091 e!202786))

(declare-fun c!51789 () Bool)

(assert (=> d!70091 (= c!51789 (and ((_ is Intermediate!3110) lt!158342) (undefined!3922 lt!158342)))))

(declare-fun e!202785 () SeekEntryResult!3110)

(assert (=> d!70091 (= lt!158342 e!202785)))

(declare-fun c!51791 () Bool)

(assert (=> d!70091 (= c!51791 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158341 () (_ BitVec 64))

(assert (=> d!70091 (= lt!158341 (select (arr!7980 a!3305) index!1840))))

(assert (=> d!70091 (validMask!0 mask!3777)))

(assert (=> d!70091 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158342)))

(declare-fun b!330428 () Bool)

(assert (=> b!330428 (and (bvsge (index!14618 lt!158342) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158342) (size!8333 a!3305)))))

(declare-fun res!182136 () Bool)

(assert (=> b!330428 (= res!182136 (= (select (arr!7980 a!3305) (index!14618 lt!158342)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202784 () Bool)

(assert (=> b!330428 (=> res!182136 e!202784)))

(declare-fun b!330429 () Bool)

(assert (=> b!330429 (= e!202786 (bvsge (x!32912 lt!158342) #b01111111111111111111111111111110))))

(declare-fun b!330430 () Bool)

(declare-fun e!202783 () SeekEntryResult!3110)

(assert (=> b!330430 (= e!202785 e!202783)))

(declare-fun c!51790 () Bool)

(assert (=> b!330430 (= c!51790 (or (= lt!158341 k0!2497) (= (bvadd lt!158341 lt!158341) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330431 () Bool)

(assert (=> b!330431 (= e!202785 (Intermediate!3110 true index!1840 x!1490))))

(declare-fun b!330432 () Bool)

(assert (=> b!330432 (= e!202783 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!330433 () Bool)

(assert (=> b!330433 (and (bvsge (index!14618 lt!158342) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158342) (size!8333 a!3305)))))

(declare-fun res!182135 () Bool)

(assert (=> b!330433 (= res!182135 (= (select (arr!7980 a!3305) (index!14618 lt!158342)) k0!2497))))

(assert (=> b!330433 (=> res!182135 e!202784)))

(assert (=> b!330433 (= e!202787 e!202784)))

(declare-fun b!330434 () Bool)

(assert (=> b!330434 (and (bvsge (index!14618 lt!158342) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158342) (size!8333 a!3305)))))

(assert (=> b!330434 (= e!202784 (= (select (arr!7980 a!3305) (index!14618 lt!158342)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330435 () Bool)

(assert (=> b!330435 (= e!202783 (Intermediate!3110 false index!1840 x!1490))))

(assert (= (and d!70091 c!51791) b!330431))

(assert (= (and d!70091 (not c!51791)) b!330430))

(assert (= (and b!330430 c!51790) b!330435))

(assert (= (and b!330430 (not c!51790)) b!330432))

(assert (= (and d!70091 c!51789) b!330429))

(assert (= (and d!70091 (not c!51789)) b!330427))

(assert (= (and b!330427 res!182134) b!330433))

(assert (= (and b!330433 (not res!182135)) b!330428))

(assert (= (and b!330428 (not res!182136)) b!330434))

(assert (=> b!330432 m!335005))

(assert (=> b!330432 m!335005))

(declare-fun m!335111 () Bool)

(assert (=> b!330432 m!335111))

(declare-fun m!335113 () Bool)

(assert (=> b!330433 m!335113))

(assert (=> b!330428 m!335113))

(assert (=> d!70091 m!335009))

(assert (=> d!70091 m!335021))

(assert (=> b!330434 m!335113))

(assert (=> b!330281 d!70091))

(declare-fun b!330512 () Bool)

(declare-fun e!202829 () SeekEntryResult!3110)

(declare-fun lt!158364 () SeekEntryResult!3110)

(assert (=> b!330512 (= e!202829 (Found!3110 (index!14618 lt!158364)))))

(declare-fun b!330513 () Bool)

(declare-fun e!202831 () SeekEntryResult!3110)

(assert (=> b!330513 (= e!202831 e!202829)))

(declare-fun lt!158363 () (_ BitVec 64))

(assert (=> b!330513 (= lt!158363 (select (arr!7980 a!3305) (index!14618 lt!158364)))))

(declare-fun c!51819 () Bool)

(assert (=> b!330513 (= c!51819 (= lt!158363 k0!2497))))

(declare-fun e!202830 () SeekEntryResult!3110)

(declare-fun b!330514 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16875 (_ BitVec 32)) SeekEntryResult!3110)

(assert (=> b!330514 (= e!202830 (seekKeyOrZeroReturnVacant!0 (x!32912 lt!158364) (index!14618 lt!158364) (index!14618 lt!158364) k0!2497 a!3305 mask!3777))))

(declare-fun d!70105 () Bool)

(declare-fun lt!158365 () SeekEntryResult!3110)

(assert (=> d!70105 (and (or ((_ is Undefined!3110) lt!158365) (not ((_ is Found!3110) lt!158365)) (and (bvsge (index!14617 lt!158365) #b00000000000000000000000000000000) (bvslt (index!14617 lt!158365) (size!8333 a!3305)))) (or ((_ is Undefined!3110) lt!158365) ((_ is Found!3110) lt!158365) (not ((_ is MissingZero!3110) lt!158365)) (and (bvsge (index!14616 lt!158365) #b00000000000000000000000000000000) (bvslt (index!14616 lt!158365) (size!8333 a!3305)))) (or ((_ is Undefined!3110) lt!158365) ((_ is Found!3110) lt!158365) ((_ is MissingZero!3110) lt!158365) (not ((_ is MissingVacant!3110) lt!158365)) (and (bvsge (index!14619 lt!158365) #b00000000000000000000000000000000) (bvslt (index!14619 lt!158365) (size!8333 a!3305)))) (or ((_ is Undefined!3110) lt!158365) (ite ((_ is Found!3110) lt!158365) (= (select (arr!7980 a!3305) (index!14617 lt!158365)) k0!2497) (ite ((_ is MissingZero!3110) lt!158365) (= (select (arr!7980 a!3305) (index!14616 lt!158365)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3110) lt!158365) (= (select (arr!7980 a!3305) (index!14619 lt!158365)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70105 (= lt!158365 e!202831)))

(declare-fun c!51820 () Bool)

(assert (=> d!70105 (= c!51820 (and ((_ is Intermediate!3110) lt!158364) (undefined!3922 lt!158364)))))

(assert (=> d!70105 (= lt!158364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70105 (validMask!0 mask!3777)))

(assert (=> d!70105 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158365)))

(declare-fun b!330511 () Bool)

(assert (=> b!330511 (= e!202831 Undefined!3110)))

(declare-fun b!330515 () Bool)

(declare-fun c!51821 () Bool)

(assert (=> b!330515 (= c!51821 (= lt!158363 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330515 (= e!202829 e!202830)))

(declare-fun b!330516 () Bool)

(assert (=> b!330516 (= e!202830 (MissingZero!3110 (index!14618 lt!158364)))))

(assert (= (and d!70105 c!51820) b!330511))

(assert (= (and d!70105 (not c!51820)) b!330513))

(assert (= (and b!330513 c!51819) b!330512))

(assert (= (and b!330513 (not c!51819)) b!330515))

(assert (= (and b!330515 c!51821) b!330516))

(assert (= (and b!330515 (not c!51821)) b!330514))

(declare-fun m!335135 () Bool)

(assert (=> b!330513 m!335135))

(declare-fun m!335137 () Bool)

(assert (=> b!330514 m!335137))

(declare-fun m!335139 () Bool)

(assert (=> d!70105 m!335139))

(declare-fun m!335143 () Bool)

(assert (=> d!70105 m!335143))

(declare-fun m!335145 () Bool)

(assert (=> d!70105 m!335145))

(assert (=> d!70105 m!335015))

(assert (=> d!70105 m!335021))

(assert (=> d!70105 m!335015))

(assert (=> d!70105 m!335017))

(assert (=> b!330282 d!70105))

(declare-fun b!330526 () Bool)

(declare-fun e!202840 () Bool)

(declare-fun e!202841 () Bool)

(assert (=> b!330526 (= e!202840 e!202841)))

(declare-fun res!182162 () Bool)

(declare-fun lt!158372 () SeekEntryResult!3110)

(assert (=> b!330526 (= res!182162 (and ((_ is Intermediate!3110) lt!158372) (not (undefined!3922 lt!158372)) (bvslt (x!32912 lt!158372) #b01111111111111111111111111111110) (bvsge (x!32912 lt!158372) #b00000000000000000000000000000000) (bvsge (x!32912 lt!158372) x!1490)))))

(assert (=> b!330526 (=> (not res!182162) (not e!202841))))

(declare-fun d!70115 () Bool)

(assert (=> d!70115 e!202840))

(declare-fun c!51825 () Bool)

(assert (=> d!70115 (= c!51825 (and ((_ is Intermediate!3110) lt!158372) (undefined!3922 lt!158372)))))

(declare-fun e!202839 () SeekEntryResult!3110)

(assert (=> d!70115 (= lt!158372 e!202839)))

(declare-fun c!51827 () Bool)

(assert (=> d!70115 (= c!51827 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158371 () (_ BitVec 64))

(assert (=> d!70115 (= lt!158371 (select (arr!7980 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305))) index!1840))))

(assert (=> d!70115 (validMask!0 mask!3777)))

(assert (=> d!70115 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305)) mask!3777) lt!158372)))

(declare-fun b!330527 () Bool)

(assert (=> b!330527 (and (bvsge (index!14618 lt!158372) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158372) (size!8333 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305)))))))

(declare-fun res!182164 () Bool)

(assert (=> b!330527 (= res!182164 (= (select (arr!7980 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305))) (index!14618 lt!158372)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202838 () Bool)

(assert (=> b!330527 (=> res!182164 e!202838)))

(declare-fun b!330528 () Bool)

(assert (=> b!330528 (= e!202840 (bvsge (x!32912 lt!158372) #b01111111111111111111111111111110))))

(declare-fun b!330529 () Bool)

(declare-fun e!202837 () SeekEntryResult!3110)

(assert (=> b!330529 (= e!202839 e!202837)))

(declare-fun c!51826 () Bool)

(assert (=> b!330529 (= c!51826 (or (= lt!158371 k0!2497) (= (bvadd lt!158371 lt!158371) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330530 () Bool)

(assert (=> b!330530 (= e!202839 (Intermediate!3110 true index!1840 x!1490))))

(declare-fun b!330531 () Bool)

(assert (=> b!330531 (= e!202837 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305)) mask!3777))))

(declare-fun b!330532 () Bool)

(assert (=> b!330532 (and (bvsge (index!14618 lt!158372) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158372) (size!8333 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305)))))))

(declare-fun res!182163 () Bool)

(assert (=> b!330532 (= res!182163 (= (select (arr!7980 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305))) (index!14618 lt!158372)) k0!2497))))

(assert (=> b!330532 (=> res!182163 e!202838)))

(assert (=> b!330532 (= e!202841 e!202838)))

(declare-fun b!330533 () Bool)

(assert (=> b!330533 (and (bvsge (index!14618 lt!158372) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158372) (size!8333 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305)))))))

(assert (=> b!330533 (= e!202838 (= (select (arr!7980 (array!16876 (store (arr!7980 a!3305) i!1250 k0!2497) (size!8333 a!3305))) (index!14618 lt!158372)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330534 () Bool)

(assert (=> b!330534 (= e!202837 (Intermediate!3110 false index!1840 x!1490))))

(assert (= (and d!70115 c!51827) b!330530))

(assert (= (and d!70115 (not c!51827)) b!330529))

(assert (= (and b!330529 c!51826) b!330534))

(assert (= (and b!330529 (not c!51826)) b!330531))

(assert (= (and d!70115 c!51825) b!330528))

(assert (= (and d!70115 (not c!51825)) b!330526))

(assert (= (and b!330526 res!182162) b!330532))

(assert (= (and b!330532 (not res!182163)) b!330527))

(assert (= (and b!330527 (not res!182164)) b!330533))

(assert (=> b!330531 m!335005))

(assert (=> b!330531 m!335005))

(declare-fun m!335151 () Bool)

(assert (=> b!330531 m!335151))

(declare-fun m!335155 () Bool)

(assert (=> b!330532 m!335155))

(assert (=> b!330527 m!335155))

(declare-fun m!335157 () Bool)

(assert (=> d!70115 m!335157))

(assert (=> d!70115 m!335021))

(assert (=> b!330533 m!335155))

(assert (=> b!330288 d!70115))

(declare-fun b!330552 () Bool)

(declare-fun e!202853 () Bool)

(declare-fun e!202855 () Bool)

(assert (=> b!330552 (= e!202853 e!202855)))

(declare-fun c!51833 () Bool)

(assert (=> b!330552 (= c!51833 (validKeyInArray!0 (select (arr!7980 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!70119 () Bool)

(declare-fun res!182172 () Bool)

(assert (=> d!70119 (=> res!182172 e!202853)))

(assert (=> d!70119 (= res!182172 (bvsge #b00000000000000000000000000000000 (size!8333 a!3305)))))

(assert (=> d!70119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202853)))

(declare-fun bm!26138 () Bool)

(declare-fun call!26141 () Bool)

(assert (=> bm!26138 (= call!26141 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!330553 () Bool)

(declare-fun e!202854 () Bool)

(assert (=> b!330553 (= e!202854 call!26141)))

(declare-fun b!330554 () Bool)

(assert (=> b!330554 (= e!202855 call!26141)))

(declare-fun b!330555 () Bool)

(assert (=> b!330555 (= e!202855 e!202854)))

(declare-fun lt!158391 () (_ BitVec 64))

(assert (=> b!330555 (= lt!158391 (select (arr!7980 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158392 () Unit!10272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16875 (_ BitVec 64) (_ BitVec 32)) Unit!10272)

(assert (=> b!330555 (= lt!158392 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158391 #b00000000000000000000000000000000))))

(assert (=> b!330555 (arrayContainsKey!0 a!3305 lt!158391 #b00000000000000000000000000000000)))

(declare-fun lt!158390 () Unit!10272)

(assert (=> b!330555 (= lt!158390 lt!158392)))

(declare-fun res!182173 () Bool)

(assert (=> b!330555 (= res!182173 (= (seekEntryOrOpen!0 (select (arr!7980 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3110 #b00000000000000000000000000000000)))))

(assert (=> b!330555 (=> (not res!182173) (not e!202854))))

(assert (= (and d!70119 (not res!182172)) b!330552))

(assert (= (and b!330552 c!51833) b!330555))

(assert (= (and b!330552 (not c!51833)) b!330554))

(assert (= (and b!330555 res!182173) b!330553))

(assert (= (or b!330553 b!330554) bm!26138))

(assert (=> b!330552 m!335095))

(assert (=> b!330552 m!335095))

(declare-fun m!335169 () Bool)

(assert (=> b!330552 m!335169))

(declare-fun m!335171 () Bool)

(assert (=> bm!26138 m!335171))

(assert (=> b!330555 m!335095))

(declare-fun m!335173 () Bool)

(assert (=> b!330555 m!335173))

(declare-fun m!335175 () Bool)

(assert (=> b!330555 m!335175))

(assert (=> b!330555 m!335095))

(declare-fun m!335177 () Bool)

(assert (=> b!330555 m!335177))

(assert (=> b!330293 d!70119))

(declare-fun b!330556 () Bool)

(declare-fun e!202859 () Bool)

(declare-fun e!202860 () Bool)

(assert (=> b!330556 (= e!202859 e!202860)))

(declare-fun res!182174 () Bool)

(declare-fun lt!158394 () SeekEntryResult!3110)

(assert (=> b!330556 (= res!182174 (and ((_ is Intermediate!3110) lt!158394) (not (undefined!3922 lt!158394)) (bvslt (x!32912 lt!158394) #b01111111111111111111111111111110) (bvsge (x!32912 lt!158394) #b00000000000000000000000000000000) (bvsge (x!32912 lt!158394) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!330556 (=> (not res!182174) (not e!202860))))

(declare-fun d!70129 () Bool)

(assert (=> d!70129 e!202859))

(declare-fun c!51834 () Bool)

(assert (=> d!70129 (= c!51834 (and ((_ is Intermediate!3110) lt!158394) (undefined!3922 lt!158394)))))

(declare-fun e!202858 () SeekEntryResult!3110)

(assert (=> d!70129 (= lt!158394 e!202858)))

(declare-fun c!51836 () Bool)

(assert (=> d!70129 (= c!51836 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!158393 () (_ BitVec 64))

(assert (=> d!70129 (= lt!158393 (select (arr!7980 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70129 (validMask!0 mask!3777)))

(assert (=> d!70129 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777) lt!158394)))

(declare-fun b!330557 () Bool)

(assert (=> b!330557 (and (bvsge (index!14618 lt!158394) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158394) (size!8333 a!3305)))))

(declare-fun res!182176 () Bool)

(assert (=> b!330557 (= res!182176 (= (select (arr!7980 a!3305) (index!14618 lt!158394)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202857 () Bool)

(assert (=> b!330557 (=> res!182176 e!202857)))

(declare-fun b!330558 () Bool)

(assert (=> b!330558 (= e!202859 (bvsge (x!32912 lt!158394) #b01111111111111111111111111111110))))

(declare-fun b!330559 () Bool)

(declare-fun e!202856 () SeekEntryResult!3110)

(assert (=> b!330559 (= e!202858 e!202856)))

(declare-fun c!51835 () Bool)

(assert (=> b!330559 (= c!51835 (or (= lt!158393 k0!2497) (= (bvadd lt!158393 lt!158393) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330560 () Bool)

(assert (=> b!330560 (= e!202858 (Intermediate!3110 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!330561 () Bool)

(assert (=> b!330561 (= e!202856 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!330562 () Bool)

(assert (=> b!330562 (and (bvsge (index!14618 lt!158394) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158394) (size!8333 a!3305)))))

(declare-fun res!182175 () Bool)

(assert (=> b!330562 (= res!182175 (= (select (arr!7980 a!3305) (index!14618 lt!158394)) k0!2497))))

(assert (=> b!330562 (=> res!182175 e!202857)))

(assert (=> b!330562 (= e!202860 e!202857)))

(declare-fun b!330563 () Bool)

(assert (=> b!330563 (and (bvsge (index!14618 lt!158394) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158394) (size!8333 a!3305)))))

(assert (=> b!330563 (= e!202857 (= (select (arr!7980 a!3305) (index!14618 lt!158394)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330564 () Bool)

(assert (=> b!330564 (= e!202856 (Intermediate!3110 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(assert (= (and d!70129 c!51836) b!330560))

(assert (= (and d!70129 (not c!51836)) b!330559))

(assert (= (and b!330559 c!51835) b!330564))

(assert (= (and b!330559 (not c!51835)) b!330561))

(assert (= (and d!70129 c!51834) b!330558))

(assert (= (and d!70129 (not c!51834)) b!330556))

(assert (= (and b!330556 res!182174) b!330562))

(assert (= (and b!330562 (not res!182175)) b!330557))

(assert (= (and b!330557 (not res!182176)) b!330563))

(assert (=> b!330561 m!335005))

(declare-fun m!335179 () Bool)

(assert (=> b!330561 m!335179))

(assert (=> b!330561 m!335179))

(declare-fun m!335181 () Bool)

(assert (=> b!330561 m!335181))

(declare-fun m!335183 () Bool)

(assert (=> b!330562 m!335183))

(assert (=> b!330557 m!335183))

(assert (=> d!70129 m!335005))

(declare-fun m!335185 () Bool)

(assert (=> d!70129 m!335185))

(assert (=> d!70129 m!335021))

(assert (=> b!330563 m!335183))

(assert (=> b!330283 d!70129))

(declare-fun d!70131 () Bool)

(declare-fun lt!158397 () (_ BitVec 32))

(assert (=> d!70131 (and (bvsge lt!158397 #b00000000000000000000000000000000) (bvslt lt!158397 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70131 (= lt!158397 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70131 (validMask!0 mask!3777)))

(assert (=> d!70131 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158397)))

(declare-fun bs!11404 () Bool)

(assert (= bs!11404 d!70131))

(declare-fun m!335187 () Bool)

(assert (=> bs!11404 m!335187))

(assert (=> bs!11404 m!335021))

(assert (=> b!330283 d!70131))

(declare-fun d!70133 () Bool)

(assert (=> d!70133 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33212 d!70133))

(declare-fun d!70145 () Bool)

(assert (=> d!70145 (= (array_inv!5952 a!3305) (bvsge (size!8333 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33212 d!70145))

(declare-fun d!70149 () Bool)

(assert (=> d!70149 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!330289 d!70149))

(declare-fun b!330622 () Bool)

(declare-fun e!202900 () Bool)

(declare-fun e!202901 () Bool)

(assert (=> b!330622 (= e!202900 e!202901)))

(declare-fun res!182198 () Bool)

(declare-fun lt!158414 () SeekEntryResult!3110)

(assert (=> b!330622 (= res!182198 (and ((_ is Intermediate!3110) lt!158414) (not (undefined!3922 lt!158414)) (bvslt (x!32912 lt!158414) #b01111111111111111111111111111110) (bvsge (x!32912 lt!158414) #b00000000000000000000000000000000) (bvsge (x!32912 lt!158414) #b00000000000000000000000000000000)))))

(assert (=> b!330622 (=> (not res!182198) (not e!202901))))

(declare-fun d!70153 () Bool)

(assert (=> d!70153 e!202900))

(declare-fun c!51855 () Bool)

(assert (=> d!70153 (= c!51855 (and ((_ is Intermediate!3110) lt!158414) (undefined!3922 lt!158414)))))

(declare-fun e!202899 () SeekEntryResult!3110)

(assert (=> d!70153 (= lt!158414 e!202899)))

(declare-fun c!51857 () Bool)

(assert (=> d!70153 (= c!51857 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158413 () (_ BitVec 64))

(assert (=> d!70153 (= lt!158413 (select (arr!7980 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70153 (validMask!0 mask!3777)))

(assert (=> d!70153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158414)))

(declare-fun b!330623 () Bool)

(assert (=> b!330623 (and (bvsge (index!14618 lt!158414) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158414) (size!8333 a!3305)))))

(declare-fun res!182200 () Bool)

(assert (=> b!330623 (= res!182200 (= (select (arr!7980 a!3305) (index!14618 lt!158414)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202898 () Bool)

(assert (=> b!330623 (=> res!182200 e!202898)))

(declare-fun b!330624 () Bool)

(assert (=> b!330624 (= e!202900 (bvsge (x!32912 lt!158414) #b01111111111111111111111111111110))))

(declare-fun b!330625 () Bool)

(declare-fun e!202897 () SeekEntryResult!3110)

(assert (=> b!330625 (= e!202899 e!202897)))

(declare-fun c!51856 () Bool)

(assert (=> b!330625 (= c!51856 (or (= lt!158413 k0!2497) (= (bvadd lt!158413 lt!158413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330626 () Bool)

(assert (=> b!330626 (= e!202899 (Intermediate!3110 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!330627 () Bool)

(assert (=> b!330627 (= e!202897 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!330628 () Bool)

(assert (=> b!330628 (and (bvsge (index!14618 lt!158414) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158414) (size!8333 a!3305)))))

(declare-fun res!182199 () Bool)

(assert (=> b!330628 (= res!182199 (= (select (arr!7980 a!3305) (index!14618 lt!158414)) k0!2497))))

(assert (=> b!330628 (=> res!182199 e!202898)))

(assert (=> b!330628 (= e!202901 e!202898)))

(declare-fun b!330629 () Bool)

(assert (=> b!330629 (and (bvsge (index!14618 lt!158414) #b00000000000000000000000000000000) (bvslt (index!14618 lt!158414) (size!8333 a!3305)))))

(assert (=> b!330629 (= e!202898 (= (select (arr!7980 a!3305) (index!14618 lt!158414)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330630 () Bool)

(assert (=> b!330630 (= e!202897 (Intermediate!3110 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!70153 c!51857) b!330626))

(assert (= (and d!70153 (not c!51857)) b!330625))

(assert (= (and b!330625 c!51856) b!330630))

(assert (= (and b!330625 (not c!51856)) b!330627))

(assert (= (and d!70153 c!51855) b!330624))

(assert (= (and d!70153 (not c!51855)) b!330622))

(assert (= (and b!330622 res!182198) b!330628))

(assert (= (and b!330628 (not res!182199)) b!330623))

(assert (= (and b!330623 (not res!182200)) b!330629))

(assert (=> b!330627 m!335015))

(declare-fun m!335219 () Bool)

(assert (=> b!330627 m!335219))

(assert (=> b!330627 m!335219))

(declare-fun m!335223 () Bool)

(assert (=> b!330627 m!335223))

(declare-fun m!335227 () Bool)

(assert (=> b!330628 m!335227))

(assert (=> b!330623 m!335227))

(assert (=> d!70153 m!335015))

(declare-fun m!335229 () Bool)

(assert (=> d!70153 m!335229))

(assert (=> d!70153 m!335021))

(assert (=> b!330629 m!335227))

(assert (=> b!330290 d!70153))

(declare-fun d!70157 () Bool)

(declare-fun lt!158426 () (_ BitVec 32))

(declare-fun lt!158425 () (_ BitVec 32))

(assert (=> d!70157 (= lt!158426 (bvmul (bvxor lt!158425 (bvlshr lt!158425 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70157 (= lt!158425 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70157 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!182202 (let ((h!5391 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32923 (bvmul (bvxor h!5391 (bvlshr h!5391 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32923 (bvlshr x!32923 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!182202 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!182202 #b00000000000000000000000000000000))))))

(assert (=> d!70157 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158426 (bvlshr lt!158426 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!330290 d!70157))

(check-sat (not d!70129) (not b!330514) (not b!330552) (not d!70091) (not d!70153) (not b!330627) (not b!330396) (not b!330561) (not b!330432) (not b!330531) (not d!70131) (not d!70115) (not b!330555) (not d!70105) (not bm!26138))
(check-sat)
