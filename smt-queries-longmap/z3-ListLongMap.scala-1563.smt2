; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29752 () Bool)

(assert start!29752)

(declare-fun b!299596 () Bool)

(declare-fun res!157919 () Bool)

(declare-fun e!189213 () Bool)

(assert (=> b!299596 (=> (not res!157919) (not e!189213))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15127 0))(
  ( (array!15128 (arr!7161 (Array (_ BitVec 32) (_ BitVec 64))) (size!7514 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15127)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!299596 (= res!157919 (and (= (size!7514 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7514 a!3312))))))

(declare-fun b!299598 () Bool)

(declare-fun res!157920 () Bool)

(declare-fun e!189215 () Bool)

(assert (=> b!299598 (=> (not res!157920) (not e!189215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15127 (_ BitVec 32)) Bool)

(assert (=> b!299598 (= res!157920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299599 () Bool)

(assert (=> b!299599 (= e!189213 e!189215)))

(declare-fun res!157917 () Bool)

(assert (=> b!299599 (=> (not res!157917) (not e!189215))))

(declare-datatypes ((SeekEntryResult!2309 0))(
  ( (MissingZero!2309 (index!11412 (_ BitVec 32))) (Found!2309 (index!11413 (_ BitVec 32))) (Intermediate!2309 (undefined!3121 Bool) (index!11414 (_ BitVec 32)) (x!29678 (_ BitVec 32))) (Undefined!2309) (MissingVacant!2309 (index!11415 (_ BitVec 32))) )
))
(declare-fun lt!148904 () SeekEntryResult!2309)

(declare-fun lt!148901 () Bool)

(assert (=> b!299599 (= res!157917 (or lt!148901 (= lt!148904 (MissingVacant!2309 i!1256))))))

(assert (=> b!299599 (= lt!148901 (= lt!148904 (MissingZero!2309 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15127 (_ BitVec 32)) SeekEntryResult!2309)

(assert (=> b!299599 (= lt!148904 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299600 () Bool)

(declare-fun lt!148902 () SeekEntryResult!2309)

(get-info :version)

(assert (=> b!299600 (= e!189215 (and (not lt!148901) (= lt!148904 (MissingVacant!2309 i!1256)) (let ((bdg!6452 (not ((_ is Intermediate!2309) lt!148902)))) (and (or bdg!6452 (not (undefined!3121 lt!148902))) (or bdg!6452 (not (= (select (arr!7161 a!3312) (index!11414 lt!148902)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6452) (= (select (arr!7161 a!3312) (index!11414 lt!148902)) k0!2524)))))))

(declare-fun lt!148900 () SeekEntryResult!2309)

(declare-fun lt!148903 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15127 (_ BitVec 32)) SeekEntryResult!2309)

(assert (=> b!299600 (= lt!148900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148903 k0!2524 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312)) mask!3809))))

(assert (=> b!299600 (= lt!148902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148903 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299600 (= lt!148903 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!299601 () Bool)

(declare-fun res!157918 () Bool)

(assert (=> b!299601 (=> (not res!157918) (not e!189213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299601 (= res!157918 (validKeyInArray!0 k0!2524))))

(declare-fun res!157916 () Bool)

(assert (=> start!29752 (=> (not res!157916) (not e!189213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29752 (= res!157916 (validMask!0 mask!3809))))

(assert (=> start!29752 e!189213))

(assert (=> start!29752 true))

(declare-fun array_inv!5133 (array!15127) Bool)

(assert (=> start!29752 (array_inv!5133 a!3312)))

(declare-fun b!299597 () Bool)

(declare-fun res!157915 () Bool)

(assert (=> b!299597 (=> (not res!157915) (not e!189213))))

(declare-fun arrayContainsKey!0 (array!15127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299597 (= res!157915 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29752 res!157916) b!299596))

(assert (= (and b!299596 res!157919) b!299601))

(assert (= (and b!299601 res!157918) b!299597))

(assert (= (and b!299597 res!157915) b!299599))

(assert (= (and b!299599 res!157917) b!299598))

(assert (= (and b!299598 res!157920) b!299600))

(declare-fun m!311257 () Bool)

(assert (=> start!29752 m!311257))

(declare-fun m!311259 () Bool)

(assert (=> start!29752 m!311259))

(declare-fun m!311261 () Bool)

(assert (=> b!299598 m!311261))

(declare-fun m!311263 () Bool)

(assert (=> b!299600 m!311263))

(declare-fun m!311265 () Bool)

(assert (=> b!299600 m!311265))

(declare-fun m!311267 () Bool)

(assert (=> b!299600 m!311267))

(declare-fun m!311269 () Bool)

(assert (=> b!299600 m!311269))

(declare-fun m!311271 () Bool)

(assert (=> b!299600 m!311271))

(declare-fun m!311273 () Bool)

(assert (=> b!299601 m!311273))

(declare-fun m!311275 () Bool)

(assert (=> b!299599 m!311275))

(declare-fun m!311277 () Bool)

(assert (=> b!299597 m!311277))

(check-sat (not b!299601) (not b!299598) (not start!29752) (not b!299600) (not b!299597) (not b!299599))
(check-sat)
(get-model)

(declare-fun b!299658 () Bool)

(declare-fun e!189248 () SeekEntryResult!2309)

(declare-fun e!189247 () SeekEntryResult!2309)

(assert (=> b!299658 (= e!189248 e!189247)))

(declare-fun c!48438 () Bool)

(declare-fun lt!148940 () (_ BitVec 64))

(assert (=> b!299658 (= c!48438 (or (= lt!148940 k0!2524) (= (bvadd lt!148940 lt!148940) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299659 () Bool)

(assert (=> b!299659 (= e!189247 (Intermediate!2309 false lt!148903 #b00000000000000000000000000000000))))

(declare-fun lt!148939 () SeekEntryResult!2309)

(declare-fun b!299660 () Bool)

(assert (=> b!299660 (and (bvsge (index!11414 lt!148939) #b00000000000000000000000000000000) (bvslt (index!11414 lt!148939) (size!7514 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312)))))))

(declare-fun e!189246 () Bool)

(assert (=> b!299660 (= e!189246 (= (select (arr!7161 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312))) (index!11414 lt!148939)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299661 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299661 (= e!189247 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148903 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312)) mask!3809))))

(declare-fun b!299662 () Bool)

(assert (=> b!299662 (= e!189248 (Intermediate!2309 true lt!148903 #b00000000000000000000000000000000))))

(declare-fun b!299664 () Bool)

(declare-fun e!189250 () Bool)

(declare-fun e!189249 () Bool)

(assert (=> b!299664 (= e!189250 e!189249)))

(declare-fun res!157967 () Bool)

(assert (=> b!299664 (= res!157967 (and ((_ is Intermediate!2309) lt!148939) (not (undefined!3121 lt!148939)) (bvslt (x!29678 lt!148939) #b01111111111111111111111111111110) (bvsge (x!29678 lt!148939) #b00000000000000000000000000000000) (bvsge (x!29678 lt!148939) #b00000000000000000000000000000000)))))

(assert (=> b!299664 (=> (not res!157967) (not e!189249))))

(declare-fun b!299665 () Bool)

(assert (=> b!299665 (and (bvsge (index!11414 lt!148939) #b00000000000000000000000000000000) (bvslt (index!11414 lt!148939) (size!7514 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312)))))))

(declare-fun res!157966 () Bool)

(assert (=> b!299665 (= res!157966 (= (select (arr!7161 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312))) (index!11414 lt!148939)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299665 (=> res!157966 e!189246)))

(declare-fun b!299666 () Bool)

(assert (=> b!299666 (and (bvsge (index!11414 lt!148939) #b00000000000000000000000000000000) (bvslt (index!11414 lt!148939) (size!7514 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312)))))))

(declare-fun res!157965 () Bool)

(assert (=> b!299666 (= res!157965 (= (select (arr!7161 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312))) (index!11414 lt!148939)) k0!2524))))

(assert (=> b!299666 (=> res!157965 e!189246)))

(assert (=> b!299666 (= e!189249 e!189246)))

(declare-fun d!67445 () Bool)

(assert (=> d!67445 e!189250))

(declare-fun c!48440 () Bool)

(assert (=> d!67445 (= c!48440 (and ((_ is Intermediate!2309) lt!148939) (undefined!3121 lt!148939)))))

(assert (=> d!67445 (= lt!148939 e!189248)))

(declare-fun c!48439 () Bool)

(assert (=> d!67445 (= c!48439 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67445 (= lt!148940 (select (arr!7161 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312))) lt!148903))))

(assert (=> d!67445 (validMask!0 mask!3809)))

(assert (=> d!67445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148903 k0!2524 (array!15128 (store (arr!7161 a!3312) i!1256 k0!2524) (size!7514 a!3312)) mask!3809) lt!148939)))

(declare-fun b!299663 () Bool)

(assert (=> b!299663 (= e!189250 (bvsge (x!29678 lt!148939) #b01111111111111111111111111111110))))

(assert (= (and d!67445 c!48439) b!299662))

(assert (= (and d!67445 (not c!48439)) b!299658))

(assert (= (and b!299658 c!48438) b!299659))

(assert (= (and b!299658 (not c!48438)) b!299661))

(assert (= (and d!67445 c!48440) b!299663))

(assert (= (and d!67445 (not c!48440)) b!299664))

(assert (= (and b!299664 res!157967) b!299666))

(assert (= (and b!299666 (not res!157965)) b!299665))

(assert (= (and b!299665 (not res!157966)) b!299660))

(declare-fun m!311323 () Bool)

(assert (=> b!299660 m!311323))

(declare-fun m!311325 () Bool)

(assert (=> b!299661 m!311325))

(assert (=> b!299661 m!311325))

(declare-fun m!311327 () Bool)

(assert (=> b!299661 m!311327))

(declare-fun m!311329 () Bool)

(assert (=> d!67445 m!311329))

(assert (=> d!67445 m!311257))

(assert (=> b!299666 m!311323))

(assert (=> b!299665 m!311323))

(assert (=> b!299600 d!67445))

(declare-fun b!299671 () Bool)

(declare-fun e!189257 () SeekEntryResult!2309)

(declare-fun e!189256 () SeekEntryResult!2309)

(assert (=> b!299671 (= e!189257 e!189256)))

(declare-fun c!48441 () Bool)

(declare-fun lt!148942 () (_ BitVec 64))

(assert (=> b!299671 (= c!48441 (or (= lt!148942 k0!2524) (= (bvadd lt!148942 lt!148942) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299672 () Bool)

(assert (=> b!299672 (= e!189256 (Intermediate!2309 false lt!148903 #b00000000000000000000000000000000))))

(declare-fun b!299673 () Bool)

(declare-fun lt!148941 () SeekEntryResult!2309)

(assert (=> b!299673 (and (bvsge (index!11414 lt!148941) #b00000000000000000000000000000000) (bvslt (index!11414 lt!148941) (size!7514 a!3312)))))

(declare-fun e!189255 () Bool)

(assert (=> b!299673 (= e!189255 (= (select (arr!7161 a!3312) (index!11414 lt!148941)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299674 () Bool)

(assert (=> b!299674 (= e!189256 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148903 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299675 () Bool)

(assert (=> b!299675 (= e!189257 (Intermediate!2309 true lt!148903 #b00000000000000000000000000000000))))

(declare-fun b!299677 () Bool)

(declare-fun e!189259 () Bool)

(declare-fun e!189258 () Bool)

(assert (=> b!299677 (= e!189259 e!189258)))

(declare-fun res!157974 () Bool)

(assert (=> b!299677 (= res!157974 (and ((_ is Intermediate!2309) lt!148941) (not (undefined!3121 lt!148941)) (bvslt (x!29678 lt!148941) #b01111111111111111111111111111110) (bvsge (x!29678 lt!148941) #b00000000000000000000000000000000) (bvsge (x!29678 lt!148941) #b00000000000000000000000000000000)))))

(assert (=> b!299677 (=> (not res!157974) (not e!189258))))

(declare-fun b!299678 () Bool)

(assert (=> b!299678 (and (bvsge (index!11414 lt!148941) #b00000000000000000000000000000000) (bvslt (index!11414 lt!148941) (size!7514 a!3312)))))

(declare-fun res!157973 () Bool)

(assert (=> b!299678 (= res!157973 (= (select (arr!7161 a!3312) (index!11414 lt!148941)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299678 (=> res!157973 e!189255)))

(declare-fun b!299679 () Bool)

(assert (=> b!299679 (and (bvsge (index!11414 lt!148941) #b00000000000000000000000000000000) (bvslt (index!11414 lt!148941) (size!7514 a!3312)))))

(declare-fun res!157972 () Bool)

(assert (=> b!299679 (= res!157972 (= (select (arr!7161 a!3312) (index!11414 lt!148941)) k0!2524))))

(assert (=> b!299679 (=> res!157972 e!189255)))

(assert (=> b!299679 (= e!189258 e!189255)))

(declare-fun d!67451 () Bool)

(assert (=> d!67451 e!189259))

(declare-fun c!48443 () Bool)

(assert (=> d!67451 (= c!48443 (and ((_ is Intermediate!2309) lt!148941) (undefined!3121 lt!148941)))))

(assert (=> d!67451 (= lt!148941 e!189257)))

(declare-fun c!48442 () Bool)

(assert (=> d!67451 (= c!48442 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67451 (= lt!148942 (select (arr!7161 a!3312) lt!148903))))

(assert (=> d!67451 (validMask!0 mask!3809)))

(assert (=> d!67451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148903 k0!2524 a!3312 mask!3809) lt!148941)))

(declare-fun b!299676 () Bool)

(assert (=> b!299676 (= e!189259 (bvsge (x!29678 lt!148941) #b01111111111111111111111111111110))))

(assert (= (and d!67451 c!48442) b!299675))

(assert (= (and d!67451 (not c!48442)) b!299671))

(assert (= (and b!299671 c!48441) b!299672))

(assert (= (and b!299671 (not c!48441)) b!299674))

(assert (= (and d!67451 c!48443) b!299676))

(assert (= (and d!67451 (not c!48443)) b!299677))

(assert (= (and b!299677 res!157974) b!299679))

(assert (= (and b!299679 (not res!157972)) b!299678))

(assert (= (and b!299678 (not res!157973)) b!299673))

(declare-fun m!311335 () Bool)

(assert (=> b!299673 m!311335))

(assert (=> b!299674 m!311325))

(assert (=> b!299674 m!311325))

(declare-fun m!311337 () Bool)

(assert (=> b!299674 m!311337))

(declare-fun m!311339 () Bool)

(assert (=> d!67451 m!311339))

(assert (=> d!67451 m!311257))

(assert (=> b!299679 m!311335))

(assert (=> b!299678 m!311335))

(assert (=> b!299600 d!67451))

(declare-fun d!67455 () Bool)

(declare-fun lt!148948 () (_ BitVec 32))

(declare-fun lt!148947 () (_ BitVec 32))

(assert (=> d!67455 (= lt!148948 (bvmul (bvxor lt!148947 (bvlshr lt!148947 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67455 (= lt!148947 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67455 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157975 (let ((h!5287 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29682 (bvmul (bvxor h!5287 (bvlshr h!5287 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29682 (bvlshr x!29682 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157975 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157975 #b00000000000000000000000000000000))))))

(assert (=> d!67455 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148948 (bvlshr lt!148948 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299600 d!67455))

(declare-fun d!67457 () Bool)

(assert (=> d!67457 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29752 d!67457))

(declare-fun d!67461 () Bool)

(assert (=> d!67461 (= (array_inv!5133 a!3312) (bvsge (size!7514 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29752 d!67461))

(declare-fun b!299755 () Bool)

(declare-fun c!48472 () Bool)

(declare-fun lt!148988 () (_ BitVec 64))

(assert (=> b!299755 (= c!48472 (= lt!148988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189309 () SeekEntryResult!2309)

(declare-fun e!189307 () SeekEntryResult!2309)

(assert (=> b!299755 (= e!189309 e!189307)))

(declare-fun b!299756 () Bool)

(declare-fun lt!148986 () SeekEntryResult!2309)

(assert (=> b!299756 (= e!189307 (MissingZero!2309 (index!11414 lt!148986)))))

(declare-fun b!299757 () Bool)

(declare-fun e!189308 () SeekEntryResult!2309)

(assert (=> b!299757 (= e!189308 Undefined!2309)))

(declare-fun b!299758 () Bool)

(assert (=> b!299758 (= e!189308 e!189309)))

(assert (=> b!299758 (= lt!148988 (select (arr!7161 a!3312) (index!11414 lt!148986)))))

(declare-fun c!48471 () Bool)

(assert (=> b!299758 (= c!48471 (= lt!148988 k0!2524))))

(declare-fun b!299759 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15127 (_ BitVec 32)) SeekEntryResult!2309)

(assert (=> b!299759 (= e!189307 (seekKeyOrZeroReturnVacant!0 (x!29678 lt!148986) (index!11414 lt!148986) (index!11414 lt!148986) k0!2524 a!3312 mask!3809))))

(declare-fun d!67463 () Bool)

(declare-fun lt!148987 () SeekEntryResult!2309)

(assert (=> d!67463 (and (or ((_ is Undefined!2309) lt!148987) (not ((_ is Found!2309) lt!148987)) (and (bvsge (index!11413 lt!148987) #b00000000000000000000000000000000) (bvslt (index!11413 lt!148987) (size!7514 a!3312)))) (or ((_ is Undefined!2309) lt!148987) ((_ is Found!2309) lt!148987) (not ((_ is MissingZero!2309) lt!148987)) (and (bvsge (index!11412 lt!148987) #b00000000000000000000000000000000) (bvslt (index!11412 lt!148987) (size!7514 a!3312)))) (or ((_ is Undefined!2309) lt!148987) ((_ is Found!2309) lt!148987) ((_ is MissingZero!2309) lt!148987) (not ((_ is MissingVacant!2309) lt!148987)) (and (bvsge (index!11415 lt!148987) #b00000000000000000000000000000000) (bvslt (index!11415 lt!148987) (size!7514 a!3312)))) (or ((_ is Undefined!2309) lt!148987) (ite ((_ is Found!2309) lt!148987) (= (select (arr!7161 a!3312) (index!11413 lt!148987)) k0!2524) (ite ((_ is MissingZero!2309) lt!148987) (= (select (arr!7161 a!3312) (index!11412 lt!148987)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2309) lt!148987) (= (select (arr!7161 a!3312) (index!11415 lt!148987)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67463 (= lt!148987 e!189308)))

(declare-fun c!48473 () Bool)

(assert (=> d!67463 (= c!48473 (and ((_ is Intermediate!2309) lt!148986) (undefined!3121 lt!148986)))))

(assert (=> d!67463 (= lt!148986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67463 (validMask!0 mask!3809)))

(assert (=> d!67463 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148987)))

(declare-fun b!299754 () Bool)

(assert (=> b!299754 (= e!189309 (Found!2309 (index!11414 lt!148986)))))

(assert (= (and d!67463 c!48473) b!299757))

(assert (= (and d!67463 (not c!48473)) b!299758))

(assert (= (and b!299758 c!48471) b!299754))

(assert (= (and b!299758 (not c!48471)) b!299755))

(assert (= (and b!299755 c!48472) b!299756))

(assert (= (and b!299755 (not c!48472)) b!299759))

(declare-fun m!311377 () Bool)

(assert (=> b!299758 m!311377))

(declare-fun m!311379 () Bool)

(assert (=> b!299759 m!311379))

(declare-fun m!311381 () Bool)

(assert (=> d!67463 m!311381))

(declare-fun m!311383 () Bool)

(assert (=> d!67463 m!311383))

(assert (=> d!67463 m!311271))

(declare-fun m!311385 () Bool)

(assert (=> d!67463 m!311385))

(declare-fun m!311387 () Bool)

(assert (=> d!67463 m!311387))

(assert (=> d!67463 m!311271))

(assert (=> d!67463 m!311257))

(assert (=> b!299599 d!67463))

(declare-fun d!67477 () Bool)

(declare-fun res!158004 () Bool)

(declare-fun e!189316 () Bool)

(assert (=> d!67477 (=> res!158004 e!189316)))

(assert (=> d!67477 (= res!158004 (= (select (arr!7161 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67477 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189316)))

(declare-fun b!299768 () Bool)

(declare-fun e!189317 () Bool)

(assert (=> b!299768 (= e!189316 e!189317)))

(declare-fun res!158005 () Bool)

(assert (=> b!299768 (=> (not res!158005) (not e!189317))))

(assert (=> b!299768 (= res!158005 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7514 a!3312)))))

(declare-fun b!299769 () Bool)

(assert (=> b!299769 (= e!189317 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67477 (not res!158004)) b!299768))

(assert (= (and b!299768 res!158005) b!299769))

(declare-fun m!311389 () Bool)

(assert (=> d!67477 m!311389))

(declare-fun m!311391 () Bool)

(assert (=> b!299769 m!311391))

(assert (=> b!299597 d!67477))

(declare-fun d!67479 () Bool)

(declare-fun res!158017 () Bool)

(declare-fun e!189335 () Bool)

(assert (=> d!67479 (=> res!158017 e!189335)))

(assert (=> d!67479 (= res!158017 (bvsge #b00000000000000000000000000000000 (size!7514 a!3312)))))

(assert (=> d!67479 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189335)))

(declare-fun bm!25817 () Bool)

(declare-fun call!25820 () Bool)

(assert (=> bm!25817 (= call!25820 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299796 () Bool)

(declare-fun e!189336 () Bool)

(assert (=> b!299796 (= e!189335 e!189336)))

(declare-fun c!48482 () Bool)

(assert (=> b!299796 (= c!48482 (validKeyInArray!0 (select (arr!7161 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!299797 () Bool)

(declare-fun e!189334 () Bool)

(assert (=> b!299797 (= e!189336 e!189334)))

(declare-fun lt!149007 () (_ BitVec 64))

(assert (=> b!299797 (= lt!149007 (select (arr!7161 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9321 0))(
  ( (Unit!9322) )
))
(declare-fun lt!149005 () Unit!9321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15127 (_ BitVec 64) (_ BitVec 32)) Unit!9321)

(assert (=> b!299797 (= lt!149005 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149007 #b00000000000000000000000000000000))))

(assert (=> b!299797 (arrayContainsKey!0 a!3312 lt!149007 #b00000000000000000000000000000000)))

(declare-fun lt!149006 () Unit!9321)

(assert (=> b!299797 (= lt!149006 lt!149005)))

(declare-fun res!158018 () Bool)

(assert (=> b!299797 (= res!158018 (= (seekEntryOrOpen!0 (select (arr!7161 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2309 #b00000000000000000000000000000000)))))

(assert (=> b!299797 (=> (not res!158018) (not e!189334))))

(declare-fun b!299798 () Bool)

(assert (=> b!299798 (= e!189336 call!25820)))

(declare-fun b!299799 () Bool)

(assert (=> b!299799 (= e!189334 call!25820)))

(assert (= (and d!67479 (not res!158017)) b!299796))

(assert (= (and b!299796 c!48482) b!299797))

(assert (= (and b!299796 (not c!48482)) b!299798))

(assert (= (and b!299797 res!158018) b!299799))

(assert (= (or b!299799 b!299798) bm!25817))

(declare-fun m!311407 () Bool)

(assert (=> bm!25817 m!311407))

(assert (=> b!299796 m!311389))

(assert (=> b!299796 m!311389))

(declare-fun m!311409 () Bool)

(assert (=> b!299796 m!311409))

(assert (=> b!299797 m!311389))

(declare-fun m!311411 () Bool)

(assert (=> b!299797 m!311411))

(declare-fun m!311413 () Bool)

(assert (=> b!299797 m!311413))

(assert (=> b!299797 m!311389))

(declare-fun m!311415 () Bool)

(assert (=> b!299797 m!311415))

(assert (=> b!299598 d!67479))

(declare-fun d!67493 () Bool)

(assert (=> d!67493 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299601 d!67493))

(check-sat (not b!299759) (not bm!25817) (not d!67451) (not b!299661) (not b!299797) (not b!299796) (not d!67463) (not b!299674) (not b!299769) (not d!67445))
(check-sat)
