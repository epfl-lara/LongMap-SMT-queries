; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29068 () Bool)

(assert start!29068)

(declare-fun b!295263 () Bool)

(declare-fun res!155179 () Bool)

(declare-fun e!186620 () Bool)

(assert (=> b!295263 (=> (not res!155179) (not e!186620))))

(declare-datatypes ((array!14919 0))(
  ( (array!14920 (arr!7072 (Array (_ BitVec 32) (_ BitVec 64))) (size!7424 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14919)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295263 (= res!155179 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295264 () Bool)

(declare-fun e!186622 () Bool)

(assert (=> b!295264 (= e!186620 e!186622)))

(declare-fun res!155177 () Bool)

(assert (=> b!295264 (=> (not res!155177) (not e!186622))))

(declare-datatypes ((SeekEntryResult!2186 0))(
  ( (MissingZero!2186 (index!10914 (_ BitVec 32))) (Found!2186 (index!10915 (_ BitVec 32))) (Intermediate!2186 (undefined!2998 Bool) (index!10916 (_ BitVec 32)) (x!29241 (_ BitVec 32))) (Undefined!2186) (MissingVacant!2186 (index!10917 (_ BitVec 32))) )
))
(declare-fun lt!146419 () SeekEntryResult!2186)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146416 () Bool)

(assert (=> b!295264 (= res!155177 (or lt!146416 (= lt!146419 (MissingVacant!2186 i!1256))))))

(assert (=> b!295264 (= lt!146416 (= lt!146419 (MissingZero!2186 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14919 (_ BitVec 32)) SeekEntryResult!2186)

(assert (=> b!295264 (= lt!146419 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295265 () Bool)

(declare-fun e!186621 () Bool)

(declare-fun lt!146418 () SeekEntryResult!2186)

(assert (=> b!295265 (= e!186621 (not (= (index!10916 lt!146418) i!1256)))))

(assert (=> b!295265 (= (select (arr!7072 a!3312) (index!10916 lt!146418)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!295266 () Bool)

(declare-fun e!186623 () Bool)

(assert (=> b!295266 (= e!186623 e!186621)))

(declare-fun res!155181 () Bool)

(assert (=> b!295266 (=> (not res!155181) (not e!186621))))

(declare-fun lt!146421 () Bool)

(assert (=> b!295266 (= res!155181 (and (or lt!146421 (not (undefined!2998 lt!146418))) (or lt!146421 (not (= (select (arr!7072 a!3312) (index!10916 lt!146418)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146421 (not (= (select (arr!7072 a!3312) (index!10916 lt!146418)) k0!2524))) (not lt!146421)))))

(get-info :version)

(assert (=> b!295266 (= lt!146421 (not ((_ is Intermediate!2186) lt!146418)))))

(declare-fun b!295267 () Bool)

(declare-fun res!155174 () Bool)

(assert (=> b!295267 (=> (not res!155174) (not e!186620))))

(assert (=> b!295267 (= res!155174 (and (= (size!7424 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7424 a!3312))))))

(declare-fun b!295268 () Bool)

(declare-fun res!155180 () Bool)

(assert (=> b!295268 (=> (not res!155180) (not e!186620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295268 (= res!155180 (validKeyInArray!0 k0!2524))))

(declare-fun b!295269 () Bool)

(declare-fun res!155175 () Bool)

(assert (=> b!295269 (=> (not res!155175) (not e!186622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14919 (_ BitVec 32)) Bool)

(assert (=> b!295269 (= res!155175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155178 () Bool)

(assert (=> start!29068 (=> (not res!155178) (not e!186620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29068 (= res!155178 (validMask!0 mask!3809))))

(assert (=> start!29068 e!186620))

(assert (=> start!29068 true))

(declare-fun array_inv!5022 (array!14919) Bool)

(assert (=> start!29068 (array_inv!5022 a!3312)))

(declare-fun b!295270 () Bool)

(assert (=> b!295270 (= e!186622 e!186623)))

(declare-fun res!155176 () Bool)

(assert (=> b!295270 (=> (not res!155176) (not e!186623))))

(assert (=> b!295270 (= res!155176 lt!146416)))

(declare-fun lt!146420 () SeekEntryResult!2186)

(declare-fun lt!146417 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14919 (_ BitVec 32)) SeekEntryResult!2186)

(assert (=> b!295270 (= lt!146420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146417 k0!2524 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312)) mask!3809))))

(assert (=> b!295270 (= lt!146418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146417 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295270 (= lt!146417 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29068 res!155178) b!295267))

(assert (= (and b!295267 res!155174) b!295268))

(assert (= (and b!295268 res!155180) b!295263))

(assert (= (and b!295263 res!155179) b!295264))

(assert (= (and b!295264 res!155177) b!295269))

(assert (= (and b!295269 res!155175) b!295270))

(assert (= (and b!295270 res!155176) b!295266))

(assert (= (and b!295266 res!155181) b!295265))

(declare-fun m!308633 () Bool)

(assert (=> start!29068 m!308633))

(declare-fun m!308635 () Bool)

(assert (=> start!29068 m!308635))

(declare-fun m!308637 () Bool)

(assert (=> b!295269 m!308637))

(declare-fun m!308639 () Bool)

(assert (=> b!295263 m!308639))

(declare-fun m!308641 () Bool)

(assert (=> b!295270 m!308641))

(declare-fun m!308643 () Bool)

(assert (=> b!295270 m!308643))

(declare-fun m!308645 () Bool)

(assert (=> b!295270 m!308645))

(declare-fun m!308647 () Bool)

(assert (=> b!295270 m!308647))

(declare-fun m!308649 () Bool)

(assert (=> b!295265 m!308649))

(declare-fun m!308651 () Bool)

(assert (=> b!295264 m!308651))

(assert (=> b!295266 m!308649))

(declare-fun m!308653 () Bool)

(assert (=> b!295268 m!308653))

(check-sat (not start!29068) (not b!295269) (not b!295263) (not b!295270) (not b!295268) (not b!295264))
(check-sat)
(get-model)

(declare-fun d!67031 () Bool)

(assert (=> d!67031 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!295268 d!67031))

(declare-fun d!67033 () Bool)

(declare-fun res!155234 () Bool)

(declare-fun e!186658 () Bool)

(assert (=> d!67033 (=> res!155234 e!186658)))

(assert (=> d!67033 (= res!155234 (= (select (arr!7072 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67033 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186658)))

(declare-fun b!295323 () Bool)

(declare-fun e!186659 () Bool)

(assert (=> b!295323 (= e!186658 e!186659)))

(declare-fun res!155235 () Bool)

(assert (=> b!295323 (=> (not res!155235) (not e!186659))))

(assert (=> b!295323 (= res!155235 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7424 a!3312)))))

(declare-fun b!295324 () Bool)

(assert (=> b!295324 (= e!186659 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67033 (not res!155234)) b!295323))

(assert (= (and b!295323 res!155235) b!295324))

(declare-fun m!308699 () Bool)

(assert (=> d!67033 m!308699))

(declare-fun m!308701 () Bool)

(assert (=> b!295324 m!308701))

(assert (=> b!295263 d!67033))

(declare-fun d!67035 () Bool)

(assert (=> d!67035 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29068 d!67035))

(declare-fun d!67037 () Bool)

(assert (=> d!67037 (= (array_inv!5022 a!3312) (bvsge (size!7424 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29068 d!67037))

(declare-fun b!295333 () Bool)

(declare-fun e!186666 () Bool)

(declare-fun e!186667 () Bool)

(assert (=> b!295333 (= e!186666 e!186667)))

(declare-fun c!47623 () Bool)

(assert (=> b!295333 (= c!47623 (validKeyInArray!0 (select (arr!7072 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25714 () Bool)

(declare-fun call!25717 () Bool)

(assert (=> bm!25714 (= call!25717 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!295334 () Bool)

(assert (=> b!295334 (= e!186667 call!25717)))

(declare-fun b!295335 () Bool)

(declare-fun e!186668 () Bool)

(assert (=> b!295335 (= e!186667 e!186668)))

(declare-fun lt!146466 () (_ BitVec 64))

(assert (=> b!295335 (= lt!146466 (select (arr!7072 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9184 0))(
  ( (Unit!9185) )
))
(declare-fun lt!146464 () Unit!9184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14919 (_ BitVec 64) (_ BitVec 32)) Unit!9184)

(assert (=> b!295335 (= lt!146464 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146466 #b00000000000000000000000000000000))))

(assert (=> b!295335 (arrayContainsKey!0 a!3312 lt!146466 #b00000000000000000000000000000000)))

(declare-fun lt!146465 () Unit!9184)

(assert (=> b!295335 (= lt!146465 lt!146464)))

(declare-fun res!155241 () Bool)

(assert (=> b!295335 (= res!155241 (= (seekEntryOrOpen!0 (select (arr!7072 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2186 #b00000000000000000000000000000000)))))

(assert (=> b!295335 (=> (not res!155241) (not e!186668))))

(declare-fun d!67039 () Bool)

(declare-fun res!155240 () Bool)

(assert (=> d!67039 (=> res!155240 e!186666)))

(assert (=> d!67039 (= res!155240 (bvsge #b00000000000000000000000000000000 (size!7424 a!3312)))))

(assert (=> d!67039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186666)))

(declare-fun b!295336 () Bool)

(assert (=> b!295336 (= e!186668 call!25717)))

(assert (= (and d!67039 (not res!155240)) b!295333))

(assert (= (and b!295333 c!47623) b!295335))

(assert (= (and b!295333 (not c!47623)) b!295334))

(assert (= (and b!295335 res!155241) b!295336))

(assert (= (or b!295336 b!295334) bm!25714))

(assert (=> b!295333 m!308699))

(assert (=> b!295333 m!308699))

(declare-fun m!308703 () Bool)

(assert (=> b!295333 m!308703))

(declare-fun m!308705 () Bool)

(assert (=> bm!25714 m!308705))

(assert (=> b!295335 m!308699))

(declare-fun m!308707 () Bool)

(assert (=> b!295335 m!308707))

(declare-fun m!308709 () Bool)

(assert (=> b!295335 m!308709))

(assert (=> b!295335 m!308699))

(declare-fun m!308711 () Bool)

(assert (=> b!295335 m!308711))

(assert (=> b!295269 d!67039))

(declare-fun b!295385 () Bool)

(declare-fun e!186697 () SeekEntryResult!2186)

(declare-fun e!186698 () SeekEntryResult!2186)

(assert (=> b!295385 (= e!186697 e!186698)))

(declare-fun lt!146490 () (_ BitVec 64))

(declare-fun lt!146488 () SeekEntryResult!2186)

(assert (=> b!295385 (= lt!146490 (select (arr!7072 a!3312) (index!10916 lt!146488)))))

(declare-fun c!47645 () Bool)

(assert (=> b!295385 (= c!47645 (= lt!146490 k0!2524))))

(declare-fun b!295386 () Bool)

(assert (=> b!295386 (= e!186698 (Found!2186 (index!10916 lt!146488)))))

(declare-fun e!186696 () SeekEntryResult!2186)

(declare-fun b!295387 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14919 (_ BitVec 32)) SeekEntryResult!2186)

(assert (=> b!295387 (= e!186696 (seekKeyOrZeroReturnVacant!0 (x!29241 lt!146488) (index!10916 lt!146488) (index!10916 lt!146488) k0!2524 a!3312 mask!3809))))

(declare-fun b!295388 () Bool)

(assert (=> b!295388 (= e!186696 (MissingZero!2186 (index!10916 lt!146488)))))

(declare-fun b!295389 () Bool)

(declare-fun c!47646 () Bool)

(assert (=> b!295389 (= c!47646 (= lt!146490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295389 (= e!186698 e!186696)))

(declare-fun b!295390 () Bool)

(assert (=> b!295390 (= e!186697 Undefined!2186)))

(declare-fun d!67047 () Bool)

(declare-fun lt!146489 () SeekEntryResult!2186)

(assert (=> d!67047 (and (or ((_ is Undefined!2186) lt!146489) (not ((_ is Found!2186) lt!146489)) (and (bvsge (index!10915 lt!146489) #b00000000000000000000000000000000) (bvslt (index!10915 lt!146489) (size!7424 a!3312)))) (or ((_ is Undefined!2186) lt!146489) ((_ is Found!2186) lt!146489) (not ((_ is MissingZero!2186) lt!146489)) (and (bvsge (index!10914 lt!146489) #b00000000000000000000000000000000) (bvslt (index!10914 lt!146489) (size!7424 a!3312)))) (or ((_ is Undefined!2186) lt!146489) ((_ is Found!2186) lt!146489) ((_ is MissingZero!2186) lt!146489) (not ((_ is MissingVacant!2186) lt!146489)) (and (bvsge (index!10917 lt!146489) #b00000000000000000000000000000000) (bvslt (index!10917 lt!146489) (size!7424 a!3312)))) (or ((_ is Undefined!2186) lt!146489) (ite ((_ is Found!2186) lt!146489) (= (select (arr!7072 a!3312) (index!10915 lt!146489)) k0!2524) (ite ((_ is MissingZero!2186) lt!146489) (= (select (arr!7072 a!3312) (index!10914 lt!146489)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2186) lt!146489) (= (select (arr!7072 a!3312) (index!10917 lt!146489)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67047 (= lt!146489 e!186697)))

(declare-fun c!47647 () Bool)

(assert (=> d!67047 (= c!47647 (and ((_ is Intermediate!2186) lt!146488) (undefined!2998 lt!146488)))))

(assert (=> d!67047 (= lt!146488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67047 (validMask!0 mask!3809)))

(assert (=> d!67047 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146489)))

(assert (= (and d!67047 c!47647) b!295390))

(assert (= (and d!67047 (not c!47647)) b!295385))

(assert (= (and b!295385 c!47645) b!295386))

(assert (= (and b!295385 (not c!47645)) b!295389))

(assert (= (and b!295389 c!47646) b!295388))

(assert (= (and b!295389 (not c!47646)) b!295387))

(declare-fun m!308729 () Bool)

(assert (=> b!295385 m!308729))

(declare-fun m!308731 () Bool)

(assert (=> b!295387 m!308731))

(assert (=> d!67047 m!308647))

(declare-fun m!308733 () Bool)

(assert (=> d!67047 m!308733))

(declare-fun m!308735 () Bool)

(assert (=> d!67047 m!308735))

(declare-fun m!308737 () Bool)

(assert (=> d!67047 m!308737))

(assert (=> d!67047 m!308633))

(assert (=> d!67047 m!308647))

(declare-fun m!308739 () Bool)

(assert (=> d!67047 m!308739))

(assert (=> b!295264 d!67047))

(declare-fun b!295433 () Bool)

(declare-fun e!186728 () SeekEntryResult!2186)

(declare-fun e!186730 () SeekEntryResult!2186)

(assert (=> b!295433 (= e!186728 e!186730)))

(declare-fun c!47662 () Bool)

(declare-fun lt!146507 () (_ BitVec 64))

(assert (=> b!295433 (= c!47662 (or (= lt!146507 k0!2524) (= (bvadd lt!146507 lt!146507) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67053 () Bool)

(declare-fun e!186727 () Bool)

(assert (=> d!67053 e!186727))

(declare-fun c!47661 () Bool)

(declare-fun lt!146508 () SeekEntryResult!2186)

(assert (=> d!67053 (= c!47661 (and ((_ is Intermediate!2186) lt!146508) (undefined!2998 lt!146508)))))

(assert (=> d!67053 (= lt!146508 e!186728)))

(declare-fun c!47660 () Bool)

(assert (=> d!67053 (= c!47660 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67053 (= lt!146507 (select (arr!7072 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312))) lt!146417))))

(assert (=> d!67053 (validMask!0 mask!3809)))

(assert (=> d!67053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146417 k0!2524 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312)) mask!3809) lt!146508)))

(declare-fun b!295434 () Bool)

(declare-fun e!186731 () Bool)

(assert (=> b!295434 (= e!186727 e!186731)))

(declare-fun res!155267 () Bool)

(assert (=> b!295434 (= res!155267 (and ((_ is Intermediate!2186) lt!146508) (not (undefined!2998 lt!146508)) (bvslt (x!29241 lt!146508) #b01111111111111111111111111111110) (bvsge (x!29241 lt!146508) #b00000000000000000000000000000000) (bvsge (x!29241 lt!146508) #b00000000000000000000000000000000)))))

(assert (=> b!295434 (=> (not res!155267) (not e!186731))))

(declare-fun b!295435 () Bool)

(assert (=> b!295435 (= e!186727 (bvsge (x!29241 lt!146508) #b01111111111111111111111111111110))))

(declare-fun b!295436 () Bool)

(assert (=> b!295436 (= e!186730 (Intermediate!2186 false lt!146417 #b00000000000000000000000000000000))))

(declare-fun b!295437 () Bool)

(assert (=> b!295437 (= e!186728 (Intermediate!2186 true lt!146417 #b00000000000000000000000000000000))))

(declare-fun b!295438 () Bool)

(assert (=> b!295438 (and (bvsge (index!10916 lt!146508) #b00000000000000000000000000000000) (bvslt (index!10916 lt!146508) (size!7424 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312)))))))

(declare-fun res!155266 () Bool)

(assert (=> b!295438 (= res!155266 (= (select (arr!7072 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312))) (index!10916 lt!146508)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186729 () Bool)

(assert (=> b!295438 (=> res!155266 e!186729)))

(declare-fun b!295439 () Bool)

(assert (=> b!295439 (and (bvsge (index!10916 lt!146508) #b00000000000000000000000000000000) (bvslt (index!10916 lt!146508) (size!7424 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312)))))))

(declare-fun res!155268 () Bool)

(assert (=> b!295439 (= res!155268 (= (select (arr!7072 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312))) (index!10916 lt!146508)) k0!2524))))

(assert (=> b!295439 (=> res!155268 e!186729)))

(assert (=> b!295439 (= e!186731 e!186729)))

(declare-fun b!295440 () Bool)

(assert (=> b!295440 (and (bvsge (index!10916 lt!146508) #b00000000000000000000000000000000) (bvslt (index!10916 lt!146508) (size!7424 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312)))))))

(assert (=> b!295440 (= e!186729 (= (select (arr!7072 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312))) (index!10916 lt!146508)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295441 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295441 (= e!186730 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146417 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14920 (store (arr!7072 a!3312) i!1256 k0!2524) (size!7424 a!3312)) mask!3809))))

(assert (= (and d!67053 c!47660) b!295437))

(assert (= (and d!67053 (not c!47660)) b!295433))

(assert (= (and b!295433 c!47662) b!295436))

(assert (= (and b!295433 (not c!47662)) b!295441))

(assert (= (and d!67053 c!47661) b!295435))

(assert (= (and d!67053 (not c!47661)) b!295434))

(assert (= (and b!295434 res!155267) b!295439))

(assert (= (and b!295439 (not res!155268)) b!295438))

(assert (= (and b!295438 (not res!155266)) b!295440))

(declare-fun m!308767 () Bool)

(assert (=> b!295440 m!308767))

(declare-fun m!308769 () Bool)

(assert (=> b!295441 m!308769))

(assert (=> b!295441 m!308769))

(declare-fun m!308771 () Bool)

(assert (=> b!295441 m!308771))

(declare-fun m!308773 () Bool)

(assert (=> d!67053 m!308773))

(assert (=> d!67053 m!308633))

(assert (=> b!295438 m!308767))

(assert (=> b!295439 m!308767))

(assert (=> b!295270 d!67053))

(declare-fun b!295442 () Bool)

(declare-fun e!186733 () SeekEntryResult!2186)

(declare-fun e!186735 () SeekEntryResult!2186)

(assert (=> b!295442 (= e!186733 e!186735)))

(declare-fun c!47665 () Bool)

(declare-fun lt!146509 () (_ BitVec 64))

(assert (=> b!295442 (= c!47665 (or (= lt!146509 k0!2524) (= (bvadd lt!146509 lt!146509) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67069 () Bool)

(declare-fun e!186732 () Bool)

(assert (=> d!67069 e!186732))

(declare-fun c!47664 () Bool)

(declare-fun lt!146510 () SeekEntryResult!2186)

(assert (=> d!67069 (= c!47664 (and ((_ is Intermediate!2186) lt!146510) (undefined!2998 lt!146510)))))

(assert (=> d!67069 (= lt!146510 e!186733)))

(declare-fun c!47663 () Bool)

(assert (=> d!67069 (= c!47663 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67069 (= lt!146509 (select (arr!7072 a!3312) lt!146417))))

(assert (=> d!67069 (validMask!0 mask!3809)))

(assert (=> d!67069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146417 k0!2524 a!3312 mask!3809) lt!146510)))

(declare-fun b!295443 () Bool)

(declare-fun e!186736 () Bool)

(assert (=> b!295443 (= e!186732 e!186736)))

(declare-fun res!155270 () Bool)

(assert (=> b!295443 (= res!155270 (and ((_ is Intermediate!2186) lt!146510) (not (undefined!2998 lt!146510)) (bvslt (x!29241 lt!146510) #b01111111111111111111111111111110) (bvsge (x!29241 lt!146510) #b00000000000000000000000000000000) (bvsge (x!29241 lt!146510) #b00000000000000000000000000000000)))))

(assert (=> b!295443 (=> (not res!155270) (not e!186736))))

(declare-fun b!295444 () Bool)

(assert (=> b!295444 (= e!186732 (bvsge (x!29241 lt!146510) #b01111111111111111111111111111110))))

(declare-fun b!295445 () Bool)

(assert (=> b!295445 (= e!186735 (Intermediate!2186 false lt!146417 #b00000000000000000000000000000000))))

(declare-fun b!295446 () Bool)

(assert (=> b!295446 (= e!186733 (Intermediate!2186 true lt!146417 #b00000000000000000000000000000000))))

(declare-fun b!295447 () Bool)

(assert (=> b!295447 (and (bvsge (index!10916 lt!146510) #b00000000000000000000000000000000) (bvslt (index!10916 lt!146510) (size!7424 a!3312)))))

(declare-fun res!155269 () Bool)

(assert (=> b!295447 (= res!155269 (= (select (arr!7072 a!3312) (index!10916 lt!146510)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186734 () Bool)

(assert (=> b!295447 (=> res!155269 e!186734)))

(declare-fun b!295448 () Bool)

(assert (=> b!295448 (and (bvsge (index!10916 lt!146510) #b00000000000000000000000000000000) (bvslt (index!10916 lt!146510) (size!7424 a!3312)))))

(declare-fun res!155271 () Bool)

(assert (=> b!295448 (= res!155271 (= (select (arr!7072 a!3312) (index!10916 lt!146510)) k0!2524))))

(assert (=> b!295448 (=> res!155271 e!186734)))

(assert (=> b!295448 (= e!186736 e!186734)))

(declare-fun b!295449 () Bool)

(assert (=> b!295449 (and (bvsge (index!10916 lt!146510) #b00000000000000000000000000000000) (bvslt (index!10916 lt!146510) (size!7424 a!3312)))))

(assert (=> b!295449 (= e!186734 (= (select (arr!7072 a!3312) (index!10916 lt!146510)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295450 () Bool)

(assert (=> b!295450 (= e!186735 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146417 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67069 c!47663) b!295446))

(assert (= (and d!67069 (not c!47663)) b!295442))

(assert (= (and b!295442 c!47665) b!295445))

(assert (= (and b!295442 (not c!47665)) b!295450))

(assert (= (and d!67069 c!47664) b!295444))

(assert (= (and d!67069 (not c!47664)) b!295443))

(assert (= (and b!295443 res!155270) b!295448))

(assert (= (and b!295448 (not res!155271)) b!295447))

(assert (= (and b!295447 (not res!155269)) b!295449))

(declare-fun m!308775 () Bool)

(assert (=> b!295449 m!308775))

(assert (=> b!295450 m!308769))

(assert (=> b!295450 m!308769))

(declare-fun m!308777 () Bool)

(assert (=> b!295450 m!308777))

(declare-fun m!308779 () Bool)

(assert (=> d!67069 m!308779))

(assert (=> d!67069 m!308633))

(assert (=> b!295447 m!308775))

(assert (=> b!295448 m!308775))

(assert (=> b!295270 d!67069))

(declare-fun d!67071 () Bool)

(declare-fun lt!146516 () (_ BitVec 32))

(declare-fun lt!146515 () (_ BitVec 32))

(assert (=> d!67071 (= lt!146516 (bvmul (bvxor lt!146515 (bvlshr lt!146515 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67071 (= lt!146515 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67071 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155272 (let ((h!5201 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29245 (bvmul (bvxor h!5201 (bvlshr h!5201 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29245 (bvlshr x!29245 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155272 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155272 #b00000000000000000000000000000000))))))

(assert (=> d!67071 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146516 (bvlshr lt!146516 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!295270 d!67071))

(check-sat (not d!67053) (not b!295324) (not b!295387) (not b!295441) (not d!67047) (not bm!25714) (not d!67069) (not b!295450) (not b!295333) (not b!295335))
(check-sat)
