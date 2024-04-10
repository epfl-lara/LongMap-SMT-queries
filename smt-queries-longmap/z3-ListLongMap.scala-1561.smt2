; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29658 () Bool)

(assert start!29658)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun b!299224 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun e!189010 () Bool)

(declare-datatypes ((array!15122 0))(
  ( (array!15123 (arr!7161 (Array (_ BitVec 32) (_ BitVec 64))) (size!7513 (_ BitVec 32))) )
))
(declare-fun lt!148809 () array!15122)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2310 0))(
  ( (MissingZero!2310 (index!11413 (_ BitVec 32))) (Found!2310 (index!11414 (_ BitVec 32))) (Intermediate!2310 (undefined!3122 Bool) (index!11415 (_ BitVec 32)) (x!29653 (_ BitVec 32))) (Undefined!2310) (MissingVacant!2310 (index!11416 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15122 (_ BitVec 32)) SeekEntryResult!2310)

(assert (=> b!299224 (= e!189010 (not (= (seekEntryOrOpen!0 k0!2524 lt!148809 mask!3809) (Found!2310 i!1256))))))

(declare-datatypes ((Unit!9331 0))(
  ( (Unit!9332) )
))
(declare-fun lt!148806 () Unit!9331)

(declare-fun lt!148802 () (_ BitVec 32))

(declare-fun lt!148804 () SeekEntryResult!2310)

(declare-fun a!3312 () array!15122)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15122 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9331)

(assert (=> b!299224 (= lt!148806 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148802 (index!11415 lt!148804) (x!29653 lt!148804) mask!3809))))

(assert (=> b!299224 (= (index!11415 lt!148804) i!1256)))

(declare-fun b!299225 () Bool)

(declare-fun res!157794 () Bool)

(declare-fun e!189012 () Bool)

(assert (=> b!299225 (=> (not res!157794) (not e!189012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15122 (_ BitVec 32)) Bool)

(assert (=> b!299225 (= res!157794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299226 () Bool)

(declare-fun e!189009 () Bool)

(assert (=> b!299226 (= e!189009 e!189010)))

(declare-fun res!157790 () Bool)

(assert (=> b!299226 (=> (not res!157790) (not e!189010))))

(declare-fun lt!148807 () Bool)

(assert (=> b!299226 (= res!157790 (and (or lt!148807 (not (undefined!3122 lt!148804))) (not lt!148807) (= (select (arr!7161 a!3312) (index!11415 lt!148804)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!299226 (= lt!148807 (not ((_ is Intermediate!2310) lt!148804)))))

(declare-fun res!157787 () Bool)

(declare-fun e!189013 () Bool)

(assert (=> start!29658 (=> (not res!157787) (not e!189013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29658 (= res!157787 (validMask!0 mask!3809))))

(assert (=> start!29658 e!189013))

(assert (=> start!29658 true))

(declare-fun array_inv!5124 (array!15122) Bool)

(assert (=> start!29658 (array_inv!5124 a!3312)))

(declare-fun b!299227 () Bool)

(declare-fun res!157793 () Bool)

(assert (=> b!299227 (=> (not res!157793) (not e!189013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299227 (= res!157793 (validKeyInArray!0 k0!2524))))

(declare-fun b!299228 () Bool)

(declare-fun res!157791 () Bool)

(assert (=> b!299228 (=> (not res!157791) (not e!189013))))

(declare-fun arrayContainsKey!0 (array!15122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299228 (= res!157791 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299229 () Bool)

(assert (=> b!299229 (= e!189013 e!189012)))

(declare-fun res!157788 () Bool)

(assert (=> b!299229 (=> (not res!157788) (not e!189012))))

(declare-fun lt!148805 () SeekEntryResult!2310)

(declare-fun lt!148803 () Bool)

(assert (=> b!299229 (= res!157788 (or lt!148803 (= lt!148805 (MissingVacant!2310 i!1256))))))

(assert (=> b!299229 (= lt!148803 (= lt!148805 (MissingZero!2310 i!1256)))))

(assert (=> b!299229 (= lt!148805 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299230 () Bool)

(declare-fun res!157792 () Bool)

(assert (=> b!299230 (=> (not res!157792) (not e!189013))))

(assert (=> b!299230 (= res!157792 (and (= (size!7513 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7513 a!3312))))))

(declare-fun b!299231 () Bool)

(assert (=> b!299231 (= e!189012 e!189009)))

(declare-fun res!157789 () Bool)

(assert (=> b!299231 (=> (not res!157789) (not e!189009))))

(assert (=> b!299231 (= res!157789 (and (not lt!148803) (= lt!148805 (MissingVacant!2310 i!1256))))))

(declare-fun lt!148808 () SeekEntryResult!2310)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15122 (_ BitVec 32)) SeekEntryResult!2310)

(assert (=> b!299231 (= lt!148808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 lt!148809 mask!3809))))

(assert (=> b!299231 (= lt!148809 (array!15123 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7513 a!3312)))))

(assert (=> b!299231 (= lt!148804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299231 (= lt!148802 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29658 res!157787) b!299230))

(assert (= (and b!299230 res!157792) b!299227))

(assert (= (and b!299227 res!157793) b!299228))

(assert (= (and b!299228 res!157791) b!299229))

(assert (= (and b!299229 res!157788) b!299225))

(assert (= (and b!299225 res!157794) b!299231))

(assert (= (and b!299231 res!157789) b!299226))

(assert (= (and b!299226 res!157790) b!299224))

(declare-fun m!311585 () Bool)

(assert (=> b!299226 m!311585))

(declare-fun m!311587 () Bool)

(assert (=> b!299231 m!311587))

(declare-fun m!311589 () Bool)

(assert (=> b!299231 m!311589))

(declare-fun m!311591 () Bool)

(assert (=> b!299231 m!311591))

(declare-fun m!311593 () Bool)

(assert (=> b!299231 m!311593))

(declare-fun m!311595 () Bool)

(assert (=> b!299228 m!311595))

(declare-fun m!311597 () Bool)

(assert (=> b!299227 m!311597))

(declare-fun m!311599 () Bool)

(assert (=> b!299224 m!311599))

(declare-fun m!311601 () Bool)

(assert (=> b!299224 m!311601))

(declare-fun m!311603 () Bool)

(assert (=> b!299229 m!311603))

(declare-fun m!311605 () Bool)

(assert (=> b!299225 m!311605))

(declare-fun m!311607 () Bool)

(assert (=> start!29658 m!311607))

(declare-fun m!311609 () Bool)

(assert (=> start!29658 m!311609))

(check-sat (not b!299224) (not b!299229) (not start!29658) (not b!299228) (not b!299225) (not b!299231) (not b!299227))
(check-sat)
(get-model)

(declare-fun d!67531 () Bool)

(assert (=> d!67531 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299227 d!67531))

(declare-fun b!299264 () Bool)

(declare-fun e!189036 () Bool)

(declare-fun call!25804 () Bool)

(assert (=> b!299264 (= e!189036 call!25804)))

(declare-fun b!299265 () Bool)

(declare-fun e!189035 () Bool)

(assert (=> b!299265 (= e!189035 e!189036)))

(declare-fun lt!148842 () (_ BitVec 64))

(assert (=> b!299265 (= lt!148842 (select (arr!7161 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!148841 () Unit!9331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15122 (_ BitVec 64) (_ BitVec 32)) Unit!9331)

(assert (=> b!299265 (= lt!148841 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148842 #b00000000000000000000000000000000))))

(assert (=> b!299265 (arrayContainsKey!0 a!3312 lt!148842 #b00000000000000000000000000000000)))

(declare-fun lt!148840 () Unit!9331)

(assert (=> b!299265 (= lt!148840 lt!148841)))

(declare-fun res!157823 () Bool)

(assert (=> b!299265 (= res!157823 (= (seekEntryOrOpen!0 (select (arr!7161 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2310 #b00000000000000000000000000000000)))))

(assert (=> b!299265 (=> (not res!157823) (not e!189036))))

(declare-fun b!299266 () Bool)

(assert (=> b!299266 (= e!189035 call!25804)))

(declare-fun bm!25801 () Bool)

(assert (=> bm!25801 (= call!25804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299267 () Bool)

(declare-fun e!189037 () Bool)

(assert (=> b!299267 (= e!189037 e!189035)))

(declare-fun c!48309 () Bool)

(assert (=> b!299267 (= c!48309 (validKeyInArray!0 (select (arr!7161 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67533 () Bool)

(declare-fun res!157824 () Bool)

(assert (=> d!67533 (=> res!157824 e!189037)))

(assert (=> d!67533 (= res!157824 (bvsge #b00000000000000000000000000000000 (size!7513 a!3312)))))

(assert (=> d!67533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189037)))

(assert (= (and d!67533 (not res!157824)) b!299267))

(assert (= (and b!299267 c!48309) b!299265))

(assert (= (and b!299267 (not c!48309)) b!299266))

(assert (= (and b!299265 res!157823) b!299264))

(assert (= (or b!299264 b!299266) bm!25801))

(declare-fun m!311637 () Bool)

(assert (=> b!299265 m!311637))

(declare-fun m!311639 () Bool)

(assert (=> b!299265 m!311639))

(declare-fun m!311641 () Bool)

(assert (=> b!299265 m!311641))

(assert (=> b!299265 m!311637))

(declare-fun m!311643 () Bool)

(assert (=> b!299265 m!311643))

(declare-fun m!311645 () Bool)

(assert (=> bm!25801 m!311645))

(assert (=> b!299267 m!311637))

(assert (=> b!299267 m!311637))

(declare-fun m!311647 () Bool)

(assert (=> b!299267 m!311647))

(assert (=> b!299225 d!67533))

(declare-fun b!299313 () Bool)

(declare-fun lt!148853 () SeekEntryResult!2310)

(assert (=> b!299313 (and (bvsge (index!11415 lt!148853) #b00000000000000000000000000000000) (bvslt (index!11415 lt!148853) (size!7513 lt!148809)))))

(declare-fun res!157840 () Bool)

(assert (=> b!299313 (= res!157840 (= (select (arr!7161 lt!148809) (index!11415 lt!148853)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189066 () Bool)

(assert (=> b!299313 (=> res!157840 e!189066)))

(declare-fun b!299314 () Bool)

(declare-fun e!189063 () SeekEntryResult!2310)

(declare-fun e!189064 () SeekEntryResult!2310)

(assert (=> b!299314 (= e!189063 e!189064)))

(declare-fun c!48325 () Bool)

(declare-fun lt!148854 () (_ BitVec 64))

(assert (=> b!299314 (= c!48325 (or (= lt!148854 k0!2524) (= (bvadd lt!148854 lt!148854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299315 () Bool)

(assert (=> b!299315 (= e!189064 (Intermediate!2310 false lt!148802 #b00000000000000000000000000000000))))

(declare-fun b!299316 () Bool)

(assert (=> b!299316 (and (bvsge (index!11415 lt!148853) #b00000000000000000000000000000000) (bvslt (index!11415 lt!148853) (size!7513 lt!148809)))))

(assert (=> b!299316 (= e!189066 (= (select (arr!7161 lt!148809) (index!11415 lt!148853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299318 () Bool)

(declare-fun e!189067 () Bool)

(assert (=> b!299318 (= e!189067 (bvsge (x!29653 lt!148853) #b01111111111111111111111111111110))))

(declare-fun b!299319 () Bool)

(assert (=> b!299319 (and (bvsge (index!11415 lt!148853) #b00000000000000000000000000000000) (bvslt (index!11415 lt!148853) (size!7513 lt!148809)))))

(declare-fun res!157841 () Bool)

(assert (=> b!299319 (= res!157841 (= (select (arr!7161 lt!148809) (index!11415 lt!148853)) k0!2524))))

(assert (=> b!299319 (=> res!157841 e!189066)))

(declare-fun e!189065 () Bool)

(assert (=> b!299319 (= e!189065 e!189066)))

(declare-fun b!299320 () Bool)

(assert (=> b!299320 (= e!189067 e!189065)))

(declare-fun res!157842 () Bool)

(assert (=> b!299320 (= res!157842 (and ((_ is Intermediate!2310) lt!148853) (not (undefined!3122 lt!148853)) (bvslt (x!29653 lt!148853) #b01111111111111111111111111111110) (bvsge (x!29653 lt!148853) #b00000000000000000000000000000000) (bvsge (x!29653 lt!148853) #b00000000000000000000000000000000)))))

(assert (=> b!299320 (=> (not res!157842) (not e!189065))))

(declare-fun b!299321 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299321 (= e!189064 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148802 #b00000000000000000000000000000000 mask!3809) k0!2524 lt!148809 mask!3809))))

(declare-fun b!299317 () Bool)

(assert (=> b!299317 (= e!189063 (Intermediate!2310 true lt!148802 #b00000000000000000000000000000000))))

(declare-fun d!67537 () Bool)

(assert (=> d!67537 e!189067))

(declare-fun c!48326 () Bool)

(assert (=> d!67537 (= c!48326 (and ((_ is Intermediate!2310) lt!148853) (undefined!3122 lt!148853)))))

(assert (=> d!67537 (= lt!148853 e!189063)))

(declare-fun c!48327 () Bool)

(assert (=> d!67537 (= c!48327 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67537 (= lt!148854 (select (arr!7161 lt!148809) lt!148802))))

(assert (=> d!67537 (validMask!0 mask!3809)))

(assert (=> d!67537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 lt!148809 mask!3809) lt!148853)))

(assert (= (and d!67537 c!48327) b!299317))

(assert (= (and d!67537 (not c!48327)) b!299314))

(assert (= (and b!299314 c!48325) b!299315))

(assert (= (and b!299314 (not c!48325)) b!299321))

(assert (= (and d!67537 c!48326) b!299318))

(assert (= (and d!67537 (not c!48326)) b!299320))

(assert (= (and b!299320 res!157842) b!299319))

(assert (= (and b!299319 (not res!157841)) b!299313))

(assert (= (and b!299313 (not res!157840)) b!299316))

(declare-fun m!311657 () Bool)

(assert (=> b!299313 m!311657))

(declare-fun m!311659 () Bool)

(assert (=> d!67537 m!311659))

(assert (=> d!67537 m!311607))

(declare-fun m!311661 () Bool)

(assert (=> b!299321 m!311661))

(assert (=> b!299321 m!311661))

(declare-fun m!311667 () Bool)

(assert (=> b!299321 m!311667))

(assert (=> b!299319 m!311657))

(assert (=> b!299316 m!311657))

(assert (=> b!299231 d!67537))

(declare-fun b!299331 () Bool)

(declare-fun lt!148857 () SeekEntryResult!2310)

(assert (=> b!299331 (and (bvsge (index!11415 lt!148857) #b00000000000000000000000000000000) (bvslt (index!11415 lt!148857) (size!7513 a!3312)))))

(declare-fun res!157846 () Bool)

(assert (=> b!299331 (= res!157846 (= (select (arr!7161 a!3312) (index!11415 lt!148857)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189076 () Bool)

(assert (=> b!299331 (=> res!157846 e!189076)))

(declare-fun b!299332 () Bool)

(declare-fun e!189073 () SeekEntryResult!2310)

(declare-fun e!189074 () SeekEntryResult!2310)

(assert (=> b!299332 (= e!189073 e!189074)))

(declare-fun c!48331 () Bool)

(declare-fun lt!148858 () (_ BitVec 64))

(assert (=> b!299332 (= c!48331 (or (= lt!148858 k0!2524) (= (bvadd lt!148858 lt!148858) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299333 () Bool)

(assert (=> b!299333 (= e!189074 (Intermediate!2310 false lt!148802 #b00000000000000000000000000000000))))

(declare-fun b!299334 () Bool)

(assert (=> b!299334 (and (bvsge (index!11415 lt!148857) #b00000000000000000000000000000000) (bvslt (index!11415 lt!148857) (size!7513 a!3312)))))

(assert (=> b!299334 (= e!189076 (= (select (arr!7161 a!3312) (index!11415 lt!148857)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299336 () Bool)

(declare-fun e!189077 () Bool)

(assert (=> b!299336 (= e!189077 (bvsge (x!29653 lt!148857) #b01111111111111111111111111111110))))

(declare-fun b!299337 () Bool)

(assert (=> b!299337 (and (bvsge (index!11415 lt!148857) #b00000000000000000000000000000000) (bvslt (index!11415 lt!148857) (size!7513 a!3312)))))

(declare-fun res!157847 () Bool)

(assert (=> b!299337 (= res!157847 (= (select (arr!7161 a!3312) (index!11415 lt!148857)) k0!2524))))

(assert (=> b!299337 (=> res!157847 e!189076)))

(declare-fun e!189075 () Bool)

(assert (=> b!299337 (= e!189075 e!189076)))

(declare-fun b!299338 () Bool)

(assert (=> b!299338 (= e!189077 e!189075)))

(declare-fun res!157848 () Bool)

(assert (=> b!299338 (= res!157848 (and ((_ is Intermediate!2310) lt!148857) (not (undefined!3122 lt!148857)) (bvslt (x!29653 lt!148857) #b01111111111111111111111111111110) (bvsge (x!29653 lt!148857) #b00000000000000000000000000000000) (bvsge (x!29653 lt!148857) #b00000000000000000000000000000000)))))

(assert (=> b!299338 (=> (not res!157848) (not e!189075))))

(declare-fun b!299339 () Bool)

(assert (=> b!299339 (= e!189074 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148802 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299335 () Bool)

(assert (=> b!299335 (= e!189073 (Intermediate!2310 true lt!148802 #b00000000000000000000000000000000))))

(declare-fun d!67545 () Bool)

(assert (=> d!67545 e!189077))

(declare-fun c!48332 () Bool)

(assert (=> d!67545 (= c!48332 (and ((_ is Intermediate!2310) lt!148857) (undefined!3122 lt!148857)))))

(assert (=> d!67545 (= lt!148857 e!189073)))

(declare-fun c!48333 () Bool)

(assert (=> d!67545 (= c!48333 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67545 (= lt!148858 (select (arr!7161 a!3312) lt!148802))))

(assert (=> d!67545 (validMask!0 mask!3809)))

(assert (=> d!67545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 a!3312 mask!3809) lt!148857)))

(assert (= (and d!67545 c!48333) b!299335))

(assert (= (and d!67545 (not c!48333)) b!299332))

(assert (= (and b!299332 c!48331) b!299333))

(assert (= (and b!299332 (not c!48331)) b!299339))

(assert (= (and d!67545 c!48332) b!299336))

(assert (= (and d!67545 (not c!48332)) b!299338))

(assert (= (and b!299338 res!157848) b!299337))

(assert (= (and b!299337 (not res!157847)) b!299331))

(assert (= (and b!299331 (not res!157846)) b!299334))

(declare-fun m!311671 () Bool)

(assert (=> b!299331 m!311671))

(declare-fun m!311673 () Bool)

(assert (=> d!67545 m!311673))

(assert (=> d!67545 m!311607))

(assert (=> b!299339 m!311661))

(assert (=> b!299339 m!311661))

(declare-fun m!311675 () Bool)

(assert (=> b!299339 m!311675))

(assert (=> b!299337 m!311671))

(assert (=> b!299334 m!311671))

(assert (=> b!299231 d!67545))

(declare-fun d!67549 () Bool)

(declare-fun lt!148870 () (_ BitVec 32))

(declare-fun lt!148869 () (_ BitVec 32))

(assert (=> d!67549 (= lt!148870 (bvmul (bvxor lt!148869 (bvlshr lt!148869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67549 (= lt!148869 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67549 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157850 (let ((h!5314 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29658 (bvmul (bvxor h!5314 (bvlshr h!5314 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29658 (bvlshr x!29658 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157850 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157850 #b00000000000000000000000000000000))))))

(assert (=> d!67549 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148870 (bvlshr lt!148870 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299231 d!67549))

(declare-fun d!67553 () Bool)

(declare-fun lt!148891 () SeekEntryResult!2310)

(assert (=> d!67553 (and (or ((_ is Undefined!2310) lt!148891) (not ((_ is Found!2310) lt!148891)) (and (bvsge (index!11414 lt!148891) #b00000000000000000000000000000000) (bvslt (index!11414 lt!148891) (size!7513 lt!148809)))) (or ((_ is Undefined!2310) lt!148891) ((_ is Found!2310) lt!148891) (not ((_ is MissingZero!2310) lt!148891)) (and (bvsge (index!11413 lt!148891) #b00000000000000000000000000000000) (bvslt (index!11413 lt!148891) (size!7513 lt!148809)))) (or ((_ is Undefined!2310) lt!148891) ((_ is Found!2310) lt!148891) ((_ is MissingZero!2310) lt!148891) (not ((_ is MissingVacant!2310) lt!148891)) (and (bvsge (index!11416 lt!148891) #b00000000000000000000000000000000) (bvslt (index!11416 lt!148891) (size!7513 lt!148809)))) (or ((_ is Undefined!2310) lt!148891) (ite ((_ is Found!2310) lt!148891) (= (select (arr!7161 lt!148809) (index!11414 lt!148891)) k0!2524) (ite ((_ is MissingZero!2310) lt!148891) (= (select (arr!7161 lt!148809) (index!11413 lt!148891)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2310) lt!148891) (= (select (arr!7161 lt!148809) (index!11416 lt!148891)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189095 () SeekEntryResult!2310)

(assert (=> d!67553 (= lt!148891 e!189095)))

(declare-fun c!48351 () Bool)

(declare-fun lt!148892 () SeekEntryResult!2310)

(assert (=> d!67553 (= c!48351 (and ((_ is Intermediate!2310) lt!148892) (undefined!3122 lt!148892)))))

(assert (=> d!67553 (= lt!148892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 lt!148809 mask!3809))))

(assert (=> d!67553 (validMask!0 mask!3809)))

(assert (=> d!67553 (= (seekEntryOrOpen!0 k0!2524 lt!148809 mask!3809) lt!148891)))

(declare-fun b!299374 () Bool)

(declare-fun e!189096 () SeekEntryResult!2310)

(assert (=> b!299374 (= e!189095 e!189096)))

(declare-fun lt!148890 () (_ BitVec 64))

(assert (=> b!299374 (= lt!148890 (select (arr!7161 lt!148809) (index!11415 lt!148892)))))

(declare-fun c!48353 () Bool)

(assert (=> b!299374 (= c!48353 (= lt!148890 k0!2524))))

(declare-fun e!189097 () SeekEntryResult!2310)

(declare-fun b!299375 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15122 (_ BitVec 32)) SeekEntryResult!2310)

(assert (=> b!299375 (= e!189097 (seekKeyOrZeroReturnVacant!0 (x!29653 lt!148892) (index!11415 lt!148892) (index!11415 lt!148892) k0!2524 lt!148809 mask!3809))))

(declare-fun b!299376 () Bool)

(declare-fun c!48352 () Bool)

(assert (=> b!299376 (= c!48352 (= lt!148890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299376 (= e!189096 e!189097)))

(declare-fun b!299377 () Bool)

(assert (=> b!299377 (= e!189095 Undefined!2310)))

(declare-fun b!299378 () Bool)

(assert (=> b!299378 (= e!189097 (MissingZero!2310 (index!11415 lt!148892)))))

(declare-fun b!299379 () Bool)

(assert (=> b!299379 (= e!189096 (Found!2310 (index!11415 lt!148892)))))

(assert (= (and d!67553 c!48351) b!299377))

(assert (= (and d!67553 (not c!48351)) b!299374))

(assert (= (and b!299374 c!48353) b!299379))

(assert (= (and b!299374 (not c!48353)) b!299376))

(assert (= (and b!299376 c!48352) b!299378))

(assert (= (and b!299376 (not c!48352)) b!299375))

(assert (=> d!67553 m!311593))

(declare-fun m!311689 () Bool)

(assert (=> d!67553 m!311689))

(declare-fun m!311691 () Bool)

(assert (=> d!67553 m!311691))

(declare-fun m!311693 () Bool)

(assert (=> d!67553 m!311693))

(assert (=> d!67553 m!311607))

(assert (=> d!67553 m!311593))

(declare-fun m!311695 () Bool)

(assert (=> d!67553 m!311695))

(declare-fun m!311697 () Bool)

(assert (=> b!299374 m!311697))

(declare-fun m!311699 () Bool)

(assert (=> b!299375 m!311699))

(assert (=> b!299224 d!67553))

(declare-fun b!299467 () Bool)

(declare-fun e!189146 () (_ BitVec 32))

(declare-fun call!25816 () (_ BitVec 32))

(assert (=> b!299467 (= e!189146 call!25816)))

(declare-fun b!299468 () Bool)

(declare-fun e!189150 () Unit!9331)

(declare-fun Unit!9335 () Unit!9331)

(assert (=> b!299468 (= e!189150 Unit!9335)))

(declare-fun b!299469 () Bool)

(declare-fun e!189145 () Unit!9331)

(declare-fun Unit!9336 () Unit!9331)

(assert (=> b!299469 (= e!189145 Unit!9336)))

(declare-fun b!299470 () Bool)

(declare-fun e!189148 () Unit!9331)

(declare-fun Unit!9337 () Unit!9331)

(assert (=> b!299470 (= e!189148 Unit!9337)))

(declare-fun c!48392 () Bool)

(declare-fun call!25815 () SeekEntryResult!2310)

(assert (=> b!299470 (= c!48392 ((_ is Intermediate!2310) call!25815))))

(declare-fun lt!148930 () Unit!9331)

(assert (=> b!299470 (= lt!148930 e!189150)))

(assert (=> b!299470 false))

(declare-fun b!299471 () Bool)

(declare-fun Unit!9338 () Unit!9331)

(assert (=> b!299471 (= e!189148 Unit!9338)))

(assert (=> b!299471 (= call!25815 (Intermediate!2310 false lt!148802 (x!29653 lt!148804)))))

(declare-fun lt!148929 () Unit!9331)

(declare-fun Unit!9339 () Unit!9331)

(assert (=> b!299471 (= lt!148929 Unit!9339)))

(assert (=> b!299471 false))

(declare-fun c!48394 () Bool)

(declare-fun bm!25812 () Bool)

(assert (=> bm!25812 (= call!25815 (seekKeyOrZeroOrLongMinValue!0 (ite c!48394 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!189146 k0!2524 a!3312 mask!3809))))

(declare-fun c!48396 () Bool)

(assert (=> bm!25812 (= c!48396 c!48394)))

(declare-fun b!299472 () Bool)

(declare-fun e!189149 () Unit!9331)

(assert (=> b!299472 (= e!189149 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) call!25816 (index!11415 lt!148804) (x!29653 lt!148804) mask!3809))))

(declare-fun b!299473 () Bool)

(assert (=> b!299473 false))

(declare-fun Unit!9340 () Unit!9331)

(assert (=> b!299473 (= e!189150 Unit!9340)))

(declare-fun b!299475 () Bool)

(assert (=> b!299475 (= c!48394 (or (= (select (arr!7161 a!3312) lt!148802) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7161 a!3312) lt!148802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!299475 (= e!189145 e!189148)))

(declare-fun b!299476 () Bool)

(assert (=> b!299476 (= e!189146 lt!148802)))

(declare-fun d!67557 () Bool)

(declare-fun e!189147 () Bool)

(assert (=> d!67557 e!189147))

(declare-fun res!157862 () Bool)

(assert (=> d!67557 (=> (not res!157862) (not e!189147))))

(assert (=> d!67557 (= res!157862 (and (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7513 a!3312))))))

(declare-fun lt!148928 () Unit!9331)

(assert (=> d!67557 (= lt!148928 e!189149)))

(declare-fun c!48395 () Bool)

(assert (=> d!67557 (= c!48395 (= #b00000000000000000000000000000000 (x!29653 lt!148804)))))

(assert (=> d!67557 (validMask!0 mask!3809)))

(assert (=> d!67557 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148802 (index!11415 lt!148804) (x!29653 lt!148804) mask!3809) lt!148928)))

(declare-fun b!299474 () Bool)

(assert (=> b!299474 (= e!189147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 (array!15123 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7513 a!3312)) mask!3809) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 a!3312 mask!3809)))))

(declare-fun bm!25813 () Bool)

(assert (=> bm!25813 (= call!25816 (nextIndex!0 lt!148802 #b00000000000000000000000000000000 mask!3809))))

(declare-fun b!299477 () Bool)

(declare-fun Unit!9345 () Unit!9331)

(assert (=> b!299477 (= e!189149 Unit!9345)))

(declare-fun c!48393 () Bool)

(assert (=> b!299477 (= c!48393 (not (= (index!11415 lt!148804) lt!148802)))))

(declare-fun lt!148931 () Unit!9331)

(assert (=> b!299477 (= lt!148931 e!189145)))

(assert (=> b!299477 (= lt!148802 (index!11415 lt!148804))))

(declare-fun lt!148927 () Unit!9331)

(declare-fun Unit!9346 () Unit!9331)

(assert (=> b!299477 (= lt!148927 Unit!9346)))

(assert (=> b!299477 (= (select (arr!7161 a!3312) lt!148802) #b1000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!67557 c!48395) b!299477))

(assert (= (and d!67557 (not c!48395)) b!299472))

(assert (= (and b!299477 c!48393) b!299475))

(assert (= (and b!299477 (not c!48393)) b!299469))

(assert (= (and b!299475 c!48394) b!299471))

(assert (= (and b!299475 (not c!48394)) b!299470))

(assert (= (and b!299470 c!48392) b!299468))

(assert (= (and b!299470 (not c!48392)) b!299473))

(assert (= (or b!299471 b!299470) bm!25812))

(assert (= (and bm!25812 c!48396) b!299476))

(assert (= (and bm!25812 (not c!48396)) b!299467))

(assert (= (or b!299467 b!299472) bm!25813))

(assert (= (and d!67557 res!157862) b!299474))

(assert (=> b!299474 m!311589))

(declare-fun m!311719 () Bool)

(assert (=> b!299474 m!311719))

(assert (=> b!299474 m!311591))

(declare-fun m!311721 () Bool)

(assert (=> bm!25812 m!311721))

(assert (=> b!299475 m!311673))

(declare-fun m!311723 () Bool)

(assert (=> b!299472 m!311723))

(assert (=> b!299477 m!311673))

(assert (=> d!67557 m!311607))

(assert (=> bm!25813 m!311661))

(assert (=> b!299224 d!67557))

(declare-fun d!67563 () Bool)

(assert (=> d!67563 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29658 d!67563))

(declare-fun d!67575 () Bool)

(assert (=> d!67575 (= (array_inv!5124 a!3312) (bvsge (size!7513 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29658 d!67575))

(declare-fun d!67577 () Bool)

(declare-fun lt!148946 () SeekEntryResult!2310)

(assert (=> d!67577 (and (or ((_ is Undefined!2310) lt!148946) (not ((_ is Found!2310) lt!148946)) (and (bvsge (index!11414 lt!148946) #b00000000000000000000000000000000) (bvslt (index!11414 lt!148946) (size!7513 a!3312)))) (or ((_ is Undefined!2310) lt!148946) ((_ is Found!2310) lt!148946) (not ((_ is MissingZero!2310) lt!148946)) (and (bvsge (index!11413 lt!148946) #b00000000000000000000000000000000) (bvslt (index!11413 lt!148946) (size!7513 a!3312)))) (or ((_ is Undefined!2310) lt!148946) ((_ is Found!2310) lt!148946) ((_ is MissingZero!2310) lt!148946) (not ((_ is MissingVacant!2310) lt!148946)) (and (bvsge (index!11416 lt!148946) #b00000000000000000000000000000000) (bvslt (index!11416 lt!148946) (size!7513 a!3312)))) (or ((_ is Undefined!2310) lt!148946) (ite ((_ is Found!2310) lt!148946) (= (select (arr!7161 a!3312) (index!11414 lt!148946)) k0!2524) (ite ((_ is MissingZero!2310) lt!148946) (= (select (arr!7161 a!3312) (index!11413 lt!148946)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2310) lt!148946) (= (select (arr!7161 a!3312) (index!11416 lt!148946)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189170 () SeekEntryResult!2310)

(assert (=> d!67577 (= lt!148946 e!189170)))

(declare-fun c!48406 () Bool)

(declare-fun lt!148947 () SeekEntryResult!2310)

(assert (=> d!67577 (= c!48406 (and ((_ is Intermediate!2310) lt!148947) (undefined!3122 lt!148947)))))

(assert (=> d!67577 (= lt!148947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67577 (validMask!0 mask!3809)))

(assert (=> d!67577 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148946)))

(declare-fun b!299508 () Bool)

(declare-fun e!189171 () SeekEntryResult!2310)

(assert (=> b!299508 (= e!189170 e!189171)))

(declare-fun lt!148945 () (_ BitVec 64))

(assert (=> b!299508 (= lt!148945 (select (arr!7161 a!3312) (index!11415 lt!148947)))))

(declare-fun c!48408 () Bool)

(assert (=> b!299508 (= c!48408 (= lt!148945 k0!2524))))

(declare-fun b!299509 () Bool)

(declare-fun e!189172 () SeekEntryResult!2310)

(assert (=> b!299509 (= e!189172 (seekKeyOrZeroReturnVacant!0 (x!29653 lt!148947) (index!11415 lt!148947) (index!11415 lt!148947) k0!2524 a!3312 mask!3809))))

(declare-fun b!299510 () Bool)

(declare-fun c!48407 () Bool)

(assert (=> b!299510 (= c!48407 (= lt!148945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299510 (= e!189171 e!189172)))

(declare-fun b!299511 () Bool)

(assert (=> b!299511 (= e!189170 Undefined!2310)))

(declare-fun b!299512 () Bool)

(assert (=> b!299512 (= e!189172 (MissingZero!2310 (index!11415 lt!148947)))))

(declare-fun b!299513 () Bool)

(assert (=> b!299513 (= e!189171 (Found!2310 (index!11415 lt!148947)))))

(assert (= (and d!67577 c!48406) b!299511))

(assert (= (and d!67577 (not c!48406)) b!299508))

(assert (= (and b!299508 c!48408) b!299513))

(assert (= (and b!299508 (not c!48408)) b!299510))

(assert (= (and b!299510 c!48407) b!299512))

(assert (= (and b!299510 (not c!48407)) b!299509))

(assert (=> d!67577 m!311593))

(declare-fun m!311755 () Bool)

(assert (=> d!67577 m!311755))

(declare-fun m!311757 () Bool)

(assert (=> d!67577 m!311757))

(declare-fun m!311759 () Bool)

(assert (=> d!67577 m!311759))

(assert (=> d!67577 m!311607))

(assert (=> d!67577 m!311593))

(declare-fun m!311763 () Bool)

(assert (=> d!67577 m!311763))

(declare-fun m!311767 () Bool)

(assert (=> b!299508 m!311767))

(declare-fun m!311769 () Bool)

(assert (=> b!299509 m!311769))

(assert (=> b!299229 d!67577))

(declare-fun d!67581 () Bool)

(declare-fun res!157880 () Bool)

(declare-fun e!189180 () Bool)

(assert (=> d!67581 (=> res!157880 e!189180)))

(assert (=> d!67581 (= res!157880 (= (select (arr!7161 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67581 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189180)))

(declare-fun b!299524 () Bool)

(declare-fun e!189181 () Bool)

(assert (=> b!299524 (= e!189180 e!189181)))

(declare-fun res!157881 () Bool)

(assert (=> b!299524 (=> (not res!157881) (not e!189181))))

(assert (=> b!299524 (= res!157881 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7513 a!3312)))))

(declare-fun b!299525 () Bool)

(assert (=> b!299525 (= e!189181 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67581 (not res!157880)) b!299524))

(assert (= (and b!299524 res!157881) b!299525))

(assert (=> d!67581 m!311637))

(declare-fun m!311779 () Bool)

(assert (=> b!299525 m!311779))

(assert (=> b!299228 d!67581))

(check-sat (not b!299265) (not b!299509) (not b!299375) (not d!67557) (not b!299267) (not bm!25812) (not b!299339) (not b!299474) (not b!299321) (not d!67577) (not b!299472) (not b!299525) (not d!67553) (not d!67545) (not bm!25801) (not bm!25813) (not d!67537))
(check-sat)
