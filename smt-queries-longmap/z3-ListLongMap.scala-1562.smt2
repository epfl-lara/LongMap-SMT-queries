; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29698 () Bool)

(assert start!29698)

(declare-fun b!299548 () Bool)

(declare-fun e!189197 () Bool)

(declare-fun e!189196 () Bool)

(assert (=> b!299548 (= e!189197 e!189196)))

(declare-fun res!157917 () Bool)

(assert (=> b!299548 (=> (not res!157917) (not e!189196))))

(declare-datatypes ((SeekEntryResult!2276 0))(
  ( (MissingZero!2276 (index!11280 (_ BitVec 32))) (Found!2276 (index!11281 (_ BitVec 32))) (Intermediate!2276 (undefined!3088 Bool) (index!11282 (_ BitVec 32)) (x!29633 (_ BitVec 32))) (Undefined!2276) (MissingVacant!2276 (index!11283 (_ BitVec 32))) )
))
(declare-fun lt!149016 () SeekEntryResult!2276)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!149015 () Bool)

(assert (=> b!299548 (= res!157917 (or lt!149015 (= lt!149016 (MissingVacant!2276 i!1256))))))

(assert (=> b!299548 (= lt!149015 (= lt!149016 (MissingZero!2276 i!1256)))))

(declare-datatypes ((array!15126 0))(
  ( (array!15127 (arr!7162 (Array (_ BitVec 32) (_ BitVec 64))) (size!7514 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15126)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15126 (_ BitVec 32)) SeekEntryResult!2276)

(assert (=> b!299548 (= lt!149016 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299549 () Bool)

(declare-fun res!157914 () Bool)

(assert (=> b!299549 (=> (not res!157914) (not e!189197))))

(assert (=> b!299549 (= res!157914 (and (= (size!7514 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7514 a!3312))))))

(declare-fun b!299550 () Bool)

(declare-fun res!157916 () Bool)

(assert (=> b!299550 (=> (not res!157916) (not e!189197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299550 (= res!157916 (validKeyInArray!0 k0!2524))))

(declare-fun b!299551 () Bool)

(declare-fun res!157913 () Bool)

(assert (=> b!299551 (=> (not res!157913) (not e!189197))))

(declare-fun arrayContainsKey!0 (array!15126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299551 (= res!157913 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun lt!149013 () SeekEntryResult!2276)

(declare-fun b!299552 () Bool)

(get-info :version)

(assert (=> b!299552 (= e!189196 (and (not lt!149015) (= lt!149016 (MissingVacant!2276 i!1256)) (let ((bdg!6446 (not ((_ is Intermediate!2276) lt!149013)))) (and (or bdg!6446 (not (undefined!3088 lt!149013))) (or bdg!6446 (not (= (select (arr!7162 a!3312) (index!11282 lt!149013)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6446) (or (bvslt (index!11282 lt!149013) #b00000000000000000000000000000000) (bvsge (index!11282 lt!149013) (size!7514 a!3312)))))))))

(declare-fun lt!149014 () SeekEntryResult!2276)

(declare-fun lt!149012 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15126 (_ BitVec 32)) SeekEntryResult!2276)

(assert (=> b!299552 (= lt!149014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149012 k0!2524 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312)) mask!3809))))

(assert (=> b!299552 (= lt!149013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149012 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299552 (= lt!149012 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!157912 () Bool)

(assert (=> start!29698 (=> (not res!157912) (not e!189197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29698 (= res!157912 (validMask!0 mask!3809))))

(assert (=> start!29698 e!189197))

(assert (=> start!29698 true))

(declare-fun array_inv!5112 (array!15126) Bool)

(assert (=> start!29698 (array_inv!5112 a!3312)))

(declare-fun b!299553 () Bool)

(declare-fun res!157915 () Bool)

(assert (=> b!299553 (=> (not res!157915) (not e!189196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15126 (_ BitVec 32)) Bool)

(assert (=> b!299553 (= res!157915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29698 res!157912) b!299549))

(assert (= (and b!299549 res!157914) b!299550))

(assert (= (and b!299550 res!157916) b!299551))

(assert (= (and b!299551 res!157913) b!299548))

(assert (= (and b!299548 res!157917) b!299553))

(assert (= (and b!299553 res!157915) b!299552))

(declare-fun m!311913 () Bool)

(assert (=> start!29698 m!311913))

(declare-fun m!311915 () Bool)

(assert (=> start!29698 m!311915))

(declare-fun m!311917 () Bool)

(assert (=> b!299548 m!311917))

(declare-fun m!311919 () Bool)

(assert (=> b!299550 m!311919))

(declare-fun m!311921 () Bool)

(assert (=> b!299551 m!311921))

(declare-fun m!311923 () Bool)

(assert (=> b!299553 m!311923))

(declare-fun m!311925 () Bool)

(assert (=> b!299552 m!311925))

(declare-fun m!311927 () Bool)

(assert (=> b!299552 m!311927))

(declare-fun m!311929 () Bool)

(assert (=> b!299552 m!311929))

(declare-fun m!311931 () Bool)

(assert (=> b!299552 m!311931))

(declare-fun m!311933 () Bool)

(assert (=> b!299552 m!311933))

(check-sat (not b!299552) (not start!29698) (not b!299551) (not b!299553) (not b!299550) (not b!299548))
(check-sat)
(get-model)

(declare-fun d!67623 () Bool)

(assert (=> d!67623 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299550 d!67623))

(declare-fun d!67625 () Bool)

(declare-fun lt!149053 () SeekEntryResult!2276)

(assert (=> d!67625 (and (or ((_ is Undefined!2276) lt!149053) (not ((_ is Found!2276) lt!149053)) (and (bvsge (index!11281 lt!149053) #b00000000000000000000000000000000) (bvslt (index!11281 lt!149053) (size!7514 a!3312)))) (or ((_ is Undefined!2276) lt!149053) ((_ is Found!2276) lt!149053) (not ((_ is MissingZero!2276) lt!149053)) (and (bvsge (index!11280 lt!149053) #b00000000000000000000000000000000) (bvslt (index!11280 lt!149053) (size!7514 a!3312)))) (or ((_ is Undefined!2276) lt!149053) ((_ is Found!2276) lt!149053) ((_ is MissingZero!2276) lt!149053) (not ((_ is MissingVacant!2276) lt!149053)) (and (bvsge (index!11283 lt!149053) #b00000000000000000000000000000000) (bvslt (index!11283 lt!149053) (size!7514 a!3312)))) (or ((_ is Undefined!2276) lt!149053) (ite ((_ is Found!2276) lt!149053) (= (select (arr!7162 a!3312) (index!11281 lt!149053)) k0!2524) (ite ((_ is MissingZero!2276) lt!149053) (= (select (arr!7162 a!3312) (index!11280 lt!149053)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2276) lt!149053) (= (select (arr!7162 a!3312) (index!11283 lt!149053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189223 () SeekEntryResult!2276)

(assert (=> d!67625 (= lt!149053 e!189223)))

(declare-fun c!48416 () Bool)

(declare-fun lt!149054 () SeekEntryResult!2276)

(assert (=> d!67625 (= c!48416 (and ((_ is Intermediate!2276) lt!149054) (undefined!3088 lt!149054)))))

(assert (=> d!67625 (= lt!149054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67625 (validMask!0 mask!3809)))

(assert (=> d!67625 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149053)))

(declare-fun b!299602 () Bool)

(declare-fun e!189225 () SeekEntryResult!2276)

(assert (=> b!299602 (= e!189223 e!189225)))

(declare-fun lt!149055 () (_ BitVec 64))

(assert (=> b!299602 (= lt!149055 (select (arr!7162 a!3312) (index!11282 lt!149054)))))

(declare-fun c!48414 () Bool)

(assert (=> b!299602 (= c!48414 (= lt!149055 k0!2524))))

(declare-fun b!299603 () Bool)

(assert (=> b!299603 (= e!189223 Undefined!2276)))

(declare-fun b!299604 () Bool)

(declare-fun e!189224 () SeekEntryResult!2276)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15126 (_ BitVec 32)) SeekEntryResult!2276)

(assert (=> b!299604 (= e!189224 (seekKeyOrZeroReturnVacant!0 (x!29633 lt!149054) (index!11282 lt!149054) (index!11282 lt!149054) k0!2524 a!3312 mask!3809))))

(declare-fun b!299605 () Bool)

(assert (=> b!299605 (= e!189225 (Found!2276 (index!11282 lt!149054)))))

(declare-fun b!299606 () Bool)

(assert (=> b!299606 (= e!189224 (MissingZero!2276 (index!11282 lt!149054)))))

(declare-fun b!299607 () Bool)

(declare-fun c!48415 () Bool)

(assert (=> b!299607 (= c!48415 (= lt!149055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299607 (= e!189225 e!189224)))

(assert (= (and d!67625 c!48416) b!299603))

(assert (= (and d!67625 (not c!48416)) b!299602))

(assert (= (and b!299602 c!48414) b!299605))

(assert (= (and b!299602 (not c!48414)) b!299607))

(assert (= (and b!299607 c!48415) b!299606))

(assert (= (and b!299607 (not c!48415)) b!299604))

(declare-fun m!311979 () Bool)

(assert (=> d!67625 m!311979))

(assert (=> d!67625 m!311913))

(declare-fun m!311981 () Bool)

(assert (=> d!67625 m!311981))

(assert (=> d!67625 m!311931))

(assert (=> d!67625 m!311931))

(declare-fun m!311983 () Bool)

(assert (=> d!67625 m!311983))

(declare-fun m!311985 () Bool)

(assert (=> d!67625 m!311985))

(declare-fun m!311987 () Bool)

(assert (=> b!299602 m!311987))

(declare-fun m!311989 () Bool)

(assert (=> b!299604 m!311989))

(assert (=> b!299548 d!67625))

(declare-fun b!299630 () Bool)

(declare-fun e!189246 () Bool)

(declare-fun call!25817 () Bool)

(assert (=> b!299630 (= e!189246 call!25817)))

(declare-fun bm!25814 () Bool)

(assert (=> bm!25814 (= call!25817 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299631 () Bool)

(declare-fun e!189244 () Bool)

(assert (=> b!299631 (= e!189244 e!189246)))

(declare-fun c!48421 () Bool)

(assert (=> b!299631 (= c!48421 (validKeyInArray!0 (select (arr!7162 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!299632 () Bool)

(declare-fun e!189245 () Bool)

(assert (=> b!299632 (= e!189246 e!189245)))

(declare-fun lt!149070 () (_ BitVec 64))

(assert (=> b!299632 (= lt!149070 (select (arr!7162 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9313 0))(
  ( (Unit!9314) )
))
(declare-fun lt!149068 () Unit!9313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15126 (_ BitVec 64) (_ BitVec 32)) Unit!9313)

(assert (=> b!299632 (= lt!149068 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149070 #b00000000000000000000000000000000))))

(assert (=> b!299632 (arrayContainsKey!0 a!3312 lt!149070 #b00000000000000000000000000000000)))

(declare-fun lt!149069 () Unit!9313)

(assert (=> b!299632 (= lt!149069 lt!149068)))

(declare-fun res!157968 () Bool)

(assert (=> b!299632 (= res!157968 (= (seekEntryOrOpen!0 (select (arr!7162 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2276 #b00000000000000000000000000000000)))))

(assert (=> b!299632 (=> (not res!157968) (not e!189245))))

(declare-fun d!67629 () Bool)

(declare-fun res!157969 () Bool)

(assert (=> d!67629 (=> res!157969 e!189244)))

(assert (=> d!67629 (= res!157969 (bvsge #b00000000000000000000000000000000 (size!7514 a!3312)))))

(assert (=> d!67629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189244)))

(declare-fun b!299633 () Bool)

(assert (=> b!299633 (= e!189245 call!25817)))

(assert (= (and d!67629 (not res!157969)) b!299631))

(assert (= (and b!299631 c!48421) b!299632))

(assert (= (and b!299631 (not c!48421)) b!299630))

(assert (= (and b!299632 res!157968) b!299633))

(assert (= (or b!299633 b!299630) bm!25814))

(declare-fun m!311995 () Bool)

(assert (=> bm!25814 m!311995))

(declare-fun m!311997 () Bool)

(assert (=> b!299631 m!311997))

(assert (=> b!299631 m!311997))

(declare-fun m!311999 () Bool)

(assert (=> b!299631 m!311999))

(assert (=> b!299632 m!311997))

(declare-fun m!312001 () Bool)

(assert (=> b!299632 m!312001))

(declare-fun m!312003 () Bool)

(assert (=> b!299632 m!312003))

(assert (=> b!299632 m!311997))

(declare-fun m!312005 () Bool)

(assert (=> b!299632 m!312005))

(assert (=> b!299553 d!67629))

(declare-fun b!299676 () Bool)

(declare-fun e!189273 () SeekEntryResult!2276)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299676 (= e!189273 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149012 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312)) mask!3809))))

(declare-fun lt!149090 () SeekEntryResult!2276)

(declare-fun b!299677 () Bool)

(assert (=> b!299677 (and (bvsge (index!11282 lt!149090) #b00000000000000000000000000000000) (bvslt (index!11282 lt!149090) (size!7514 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312)))))))

(declare-fun res!157983 () Bool)

(assert (=> b!299677 (= res!157983 (= (select (arr!7162 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312))) (index!11282 lt!149090)) k0!2524))))

(declare-fun e!189275 () Bool)

(assert (=> b!299677 (=> res!157983 e!189275)))

(declare-fun e!189272 () Bool)

(assert (=> b!299677 (= e!189272 e!189275)))

(declare-fun b!299678 () Bool)

(declare-fun e!189276 () SeekEntryResult!2276)

(assert (=> b!299678 (= e!189276 e!189273)))

(declare-fun c!48439 () Bool)

(declare-fun lt!149091 () (_ BitVec 64))

(assert (=> b!299678 (= c!48439 (or (= lt!149091 k0!2524) (= (bvadd lt!149091 lt!149091) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299679 () Bool)

(declare-fun e!189274 () Bool)

(assert (=> b!299679 (= e!189274 (bvsge (x!29633 lt!149090) #b01111111111111111111111111111110))))

(declare-fun b!299680 () Bool)

(assert (=> b!299680 (= e!189273 (Intermediate!2276 false lt!149012 #b00000000000000000000000000000000))))

(declare-fun d!67633 () Bool)

(assert (=> d!67633 e!189274))

(declare-fun c!48437 () Bool)

(assert (=> d!67633 (= c!48437 (and ((_ is Intermediate!2276) lt!149090) (undefined!3088 lt!149090)))))

(assert (=> d!67633 (= lt!149090 e!189276)))

(declare-fun c!48438 () Bool)

(assert (=> d!67633 (= c!48438 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67633 (= lt!149091 (select (arr!7162 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312))) lt!149012))))

(assert (=> d!67633 (validMask!0 mask!3809)))

(assert (=> d!67633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149012 k0!2524 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312)) mask!3809) lt!149090)))

(declare-fun b!299681 () Bool)

(assert (=> b!299681 (and (bvsge (index!11282 lt!149090) #b00000000000000000000000000000000) (bvslt (index!11282 lt!149090) (size!7514 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312)))))))

(declare-fun res!157982 () Bool)

(assert (=> b!299681 (= res!157982 (= (select (arr!7162 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312))) (index!11282 lt!149090)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299681 (=> res!157982 e!189275)))

(declare-fun b!299682 () Bool)

(assert (=> b!299682 (= e!189274 e!189272)))

(declare-fun res!157984 () Bool)

(assert (=> b!299682 (= res!157984 (and ((_ is Intermediate!2276) lt!149090) (not (undefined!3088 lt!149090)) (bvslt (x!29633 lt!149090) #b01111111111111111111111111111110) (bvsge (x!29633 lt!149090) #b00000000000000000000000000000000) (bvsge (x!29633 lt!149090) #b00000000000000000000000000000000)))))

(assert (=> b!299682 (=> (not res!157984) (not e!189272))))

(declare-fun b!299683 () Bool)

(assert (=> b!299683 (= e!189276 (Intermediate!2276 true lt!149012 #b00000000000000000000000000000000))))

(declare-fun b!299684 () Bool)

(assert (=> b!299684 (and (bvsge (index!11282 lt!149090) #b00000000000000000000000000000000) (bvslt (index!11282 lt!149090) (size!7514 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312)))))))

(assert (=> b!299684 (= e!189275 (= (select (arr!7162 (array!15127 (store (arr!7162 a!3312) i!1256 k0!2524) (size!7514 a!3312))) (index!11282 lt!149090)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67633 c!48438) b!299683))

(assert (= (and d!67633 (not c!48438)) b!299678))

(assert (= (and b!299678 c!48439) b!299680))

(assert (= (and b!299678 (not c!48439)) b!299676))

(assert (= (and d!67633 c!48437) b!299679))

(assert (= (and d!67633 (not c!48437)) b!299682))

(assert (= (and b!299682 res!157984) b!299677))

(assert (= (and b!299677 (not res!157983)) b!299681))

(assert (= (and b!299681 (not res!157982)) b!299684))

(declare-fun m!312017 () Bool)

(assert (=> b!299681 m!312017))

(assert (=> b!299684 m!312017))

(declare-fun m!312019 () Bool)

(assert (=> d!67633 m!312019))

(assert (=> d!67633 m!311913))

(assert (=> b!299677 m!312017))

(declare-fun m!312021 () Bool)

(assert (=> b!299676 m!312021))

(assert (=> b!299676 m!312021))

(declare-fun m!312023 () Bool)

(assert (=> b!299676 m!312023))

(assert (=> b!299552 d!67633))

(declare-fun e!189278 () SeekEntryResult!2276)

(declare-fun b!299685 () Bool)

(assert (=> b!299685 (= e!189278 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149012 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299686 () Bool)

(declare-fun lt!149092 () SeekEntryResult!2276)

(assert (=> b!299686 (and (bvsge (index!11282 lt!149092) #b00000000000000000000000000000000) (bvslt (index!11282 lt!149092) (size!7514 a!3312)))))

(declare-fun res!157986 () Bool)

(assert (=> b!299686 (= res!157986 (= (select (arr!7162 a!3312) (index!11282 lt!149092)) k0!2524))))

(declare-fun e!189280 () Bool)

(assert (=> b!299686 (=> res!157986 e!189280)))

(declare-fun e!189277 () Bool)

(assert (=> b!299686 (= e!189277 e!189280)))

(declare-fun b!299687 () Bool)

(declare-fun e!189281 () SeekEntryResult!2276)

(assert (=> b!299687 (= e!189281 e!189278)))

(declare-fun c!48442 () Bool)

(declare-fun lt!149093 () (_ BitVec 64))

(assert (=> b!299687 (= c!48442 (or (= lt!149093 k0!2524) (= (bvadd lt!149093 lt!149093) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299688 () Bool)

(declare-fun e!189279 () Bool)

(assert (=> b!299688 (= e!189279 (bvsge (x!29633 lt!149092) #b01111111111111111111111111111110))))

(declare-fun b!299689 () Bool)

(assert (=> b!299689 (= e!189278 (Intermediate!2276 false lt!149012 #b00000000000000000000000000000000))))

(declare-fun d!67641 () Bool)

(assert (=> d!67641 e!189279))

(declare-fun c!48440 () Bool)

(assert (=> d!67641 (= c!48440 (and ((_ is Intermediate!2276) lt!149092) (undefined!3088 lt!149092)))))

(assert (=> d!67641 (= lt!149092 e!189281)))

(declare-fun c!48441 () Bool)

(assert (=> d!67641 (= c!48441 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67641 (= lt!149093 (select (arr!7162 a!3312) lt!149012))))

(assert (=> d!67641 (validMask!0 mask!3809)))

(assert (=> d!67641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149012 k0!2524 a!3312 mask!3809) lt!149092)))

(declare-fun b!299690 () Bool)

(assert (=> b!299690 (and (bvsge (index!11282 lt!149092) #b00000000000000000000000000000000) (bvslt (index!11282 lt!149092) (size!7514 a!3312)))))

(declare-fun res!157985 () Bool)

(assert (=> b!299690 (= res!157985 (= (select (arr!7162 a!3312) (index!11282 lt!149092)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299690 (=> res!157985 e!189280)))

(declare-fun b!299691 () Bool)

(assert (=> b!299691 (= e!189279 e!189277)))

(declare-fun res!157987 () Bool)

(assert (=> b!299691 (= res!157987 (and ((_ is Intermediate!2276) lt!149092) (not (undefined!3088 lt!149092)) (bvslt (x!29633 lt!149092) #b01111111111111111111111111111110) (bvsge (x!29633 lt!149092) #b00000000000000000000000000000000) (bvsge (x!29633 lt!149092) #b00000000000000000000000000000000)))))

(assert (=> b!299691 (=> (not res!157987) (not e!189277))))

(declare-fun b!299692 () Bool)

(assert (=> b!299692 (= e!189281 (Intermediate!2276 true lt!149012 #b00000000000000000000000000000000))))

(declare-fun b!299693 () Bool)

(assert (=> b!299693 (and (bvsge (index!11282 lt!149092) #b00000000000000000000000000000000) (bvslt (index!11282 lt!149092) (size!7514 a!3312)))))

(assert (=> b!299693 (= e!189280 (= (select (arr!7162 a!3312) (index!11282 lt!149092)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67641 c!48441) b!299692))

(assert (= (and d!67641 (not c!48441)) b!299687))

(assert (= (and b!299687 c!48442) b!299689))

(assert (= (and b!299687 (not c!48442)) b!299685))

(assert (= (and d!67641 c!48440) b!299688))

(assert (= (and d!67641 (not c!48440)) b!299691))

(assert (= (and b!299691 res!157987) b!299686))

(assert (= (and b!299686 (not res!157986)) b!299690))

(assert (= (and b!299690 (not res!157985)) b!299693))

(declare-fun m!312025 () Bool)

(assert (=> b!299690 m!312025))

(assert (=> b!299693 m!312025))

(declare-fun m!312027 () Bool)

(assert (=> d!67641 m!312027))

(assert (=> d!67641 m!311913))

(assert (=> b!299686 m!312025))

(assert (=> b!299685 m!312021))

(assert (=> b!299685 m!312021))

(declare-fun m!312029 () Bool)

(assert (=> b!299685 m!312029))

(assert (=> b!299552 d!67641))

(declare-fun d!67643 () Bool)

(declare-fun lt!149105 () (_ BitVec 32))

(declare-fun lt!149104 () (_ BitVec 32))

(assert (=> d!67643 (= lt!149105 (bvmul (bvxor lt!149104 (bvlshr lt!149104 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67643 (= lt!149104 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67643 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157990 (let ((h!5228 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29637 (bvmul (bvxor h!5228 (bvlshr h!5228 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29637 (bvlshr x!29637 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157990 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157990 #b00000000000000000000000000000000))))))

(assert (=> d!67643 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149105 (bvlshr lt!149105 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299552 d!67643))

(declare-fun d!67649 () Bool)

(assert (=> d!67649 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29698 d!67649))

(declare-fun d!67651 () Bool)

(assert (=> d!67651 (= (array_inv!5112 a!3312) (bvsge (size!7514 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29698 d!67651))

(declare-fun d!67653 () Bool)

(declare-fun res!158001 () Bool)

(declare-fun e!189302 () Bool)

(assert (=> d!67653 (=> res!158001 e!189302)))

(assert (=> d!67653 (= res!158001 (= (select (arr!7162 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67653 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189302)))

(declare-fun b!299726 () Bool)

(declare-fun e!189303 () Bool)

(assert (=> b!299726 (= e!189302 e!189303)))

(declare-fun res!158002 () Bool)

(assert (=> b!299726 (=> (not res!158002) (not e!189303))))

(assert (=> b!299726 (= res!158002 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7514 a!3312)))))

(declare-fun b!299727 () Bool)

(assert (=> b!299727 (= e!189303 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67653 (not res!158001)) b!299726))

(assert (= (and b!299726 res!158002) b!299727))

(assert (=> d!67653 m!311997))

(declare-fun m!312055 () Bool)

(assert (=> b!299727 m!312055))

(assert (=> b!299551 d!67653))

(check-sat (not bm!25814) (not b!299631) (not b!299632) (not b!299676) (not d!67641) (not b!299727) (not d!67625) (not b!299604) (not d!67633) (not b!299685))
(check-sat)
