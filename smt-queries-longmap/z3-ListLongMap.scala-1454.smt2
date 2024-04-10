; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28016 () Bool)

(assert start!28016)

(declare-fun b!287412 () Bool)

(declare-fun res!149303 () Bool)

(declare-fun e!182032 () Bool)

(assert (=> b!287412 (=> (not res!149303) (not e!182032))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287412 (= res!149303 (validKeyInArray!0 k0!2524))))

(declare-fun b!287413 () Bool)

(declare-fun res!149302 () Bool)

(assert (=> b!287413 (=> (not res!149302) (not e!182032))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14420 0))(
  ( (array!14421 (arr!6840 (Array (_ BitVec 32) (_ BitVec 64))) (size!7192 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14420)

(assert (=> b!287413 (= res!149302 (and (= (size!7192 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7192 a!3312))))))

(declare-fun res!149300 () Bool)

(assert (=> start!28016 (=> (not res!149300) (not e!182032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28016 (= res!149300 (validMask!0 mask!3809))))

(assert (=> start!28016 e!182032))

(assert (=> start!28016 true))

(declare-fun array_inv!4803 (array!14420) Bool)

(assert (=> start!28016 (array_inv!4803 a!3312)))

(declare-fun b!287414 () Bool)

(declare-fun e!182033 () Bool)

(assert (=> b!287414 (= e!182032 e!182033)))

(declare-fun res!149299 () Bool)

(assert (=> b!287414 (=> (not res!149299) (not e!182033))))

(declare-datatypes ((SeekEntryResult!1989 0))(
  ( (MissingZero!1989 (index!10126 (_ BitVec 32))) (Found!1989 (index!10127 (_ BitVec 32))) (Intermediate!1989 (undefined!2801 Bool) (index!10128 (_ BitVec 32)) (x!28342 (_ BitVec 32))) (Undefined!1989) (MissingVacant!1989 (index!10129 (_ BitVec 32))) )
))
(declare-fun lt!141499 () SeekEntryResult!1989)

(assert (=> b!287414 (= res!149299 (or (= lt!141499 (MissingZero!1989 i!1256)) (= lt!141499 (MissingVacant!1989 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14420 (_ BitVec 32)) SeekEntryResult!1989)

(assert (=> b!287414 (= lt!141499 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287415 () Bool)

(declare-fun res!149304 () Bool)

(assert (=> b!287415 (=> (not res!149304) (not e!182032))))

(declare-fun arrayContainsKey!0 (array!14420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287415 (= res!149304 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287416 () Bool)

(declare-fun res!149301 () Bool)

(assert (=> b!287416 (=> (not res!149301) (not e!182033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14420 (_ BitVec 32)) Bool)

(assert (=> b!287416 (= res!149301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287417 () Bool)

(declare-fun lt!141498 () (_ BitVec 32))

(assert (=> b!287417 (= e!182033 (and (bvsge mask!3809 #b00000000000000000000000000000000) (or (bvslt lt!141498 #b00000000000000000000000000000000) (bvsge lt!141498 (bvadd #b00000000000000000000000000000001 mask!3809)))))))

(declare-fun lt!141497 () SeekEntryResult!1989)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14420 (_ BitVec 32)) SeekEntryResult!1989)

(assert (=> b!287417 (= lt!141497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141498 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287417 (= lt!141498 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28016 res!149300) b!287413))

(assert (= (and b!287413 res!149302) b!287412))

(assert (= (and b!287412 res!149303) b!287415))

(assert (= (and b!287415 res!149304) b!287414))

(assert (= (and b!287414 res!149299) b!287416))

(assert (= (and b!287416 res!149301) b!287417))

(declare-fun m!301843 () Bool)

(assert (=> b!287414 m!301843))

(declare-fun m!301845 () Bool)

(assert (=> start!28016 m!301845))

(declare-fun m!301847 () Bool)

(assert (=> start!28016 m!301847))

(declare-fun m!301849 () Bool)

(assert (=> b!287412 m!301849))

(declare-fun m!301851 () Bool)

(assert (=> b!287416 m!301851))

(declare-fun m!301853 () Bool)

(assert (=> b!287417 m!301853))

(declare-fun m!301855 () Bool)

(assert (=> b!287417 m!301855))

(declare-fun m!301857 () Bool)

(assert (=> b!287415 m!301857))

(check-sat (not b!287414) (not b!287415) (not b!287412) (not start!28016) (not b!287417) (not b!287416))
(check-sat)
(get-model)

(declare-fun d!66107 () Bool)

(assert (=> d!66107 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!287412 d!66107))

(declare-fun b!287454 () Bool)

(declare-fun e!182057 () SeekEntryResult!1989)

(declare-fun e!182055 () SeekEntryResult!1989)

(assert (=> b!287454 (= e!182057 e!182055)))

(declare-fun lt!141516 () (_ BitVec 64))

(declare-fun lt!141515 () SeekEntryResult!1989)

(assert (=> b!287454 (= lt!141516 (select (arr!6840 a!3312) (index!10128 lt!141515)))))

(declare-fun c!46623 () Bool)

(assert (=> b!287454 (= c!46623 (= lt!141516 k0!2524))))

(declare-fun b!287455 () Bool)

(declare-fun c!46622 () Bool)

(assert (=> b!287455 (= c!46622 (= lt!141516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182056 () SeekEntryResult!1989)

(assert (=> b!287455 (= e!182055 e!182056)))

(declare-fun b!287456 () Bool)

(assert (=> b!287456 (= e!182056 (MissingZero!1989 (index!10128 lt!141515)))))

(declare-fun b!287457 () Bool)

(assert (=> b!287457 (= e!182055 (Found!1989 (index!10128 lt!141515)))))

(declare-fun b!287458 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14420 (_ BitVec 32)) SeekEntryResult!1989)

(assert (=> b!287458 (= e!182056 (seekKeyOrZeroReturnVacant!0 (x!28342 lt!141515) (index!10128 lt!141515) (index!10128 lt!141515) k0!2524 a!3312 mask!3809))))

(declare-fun d!66109 () Bool)

(declare-fun lt!141517 () SeekEntryResult!1989)

(get-info :version)

(assert (=> d!66109 (and (or ((_ is Undefined!1989) lt!141517) (not ((_ is Found!1989) lt!141517)) (and (bvsge (index!10127 lt!141517) #b00000000000000000000000000000000) (bvslt (index!10127 lt!141517) (size!7192 a!3312)))) (or ((_ is Undefined!1989) lt!141517) ((_ is Found!1989) lt!141517) (not ((_ is MissingZero!1989) lt!141517)) (and (bvsge (index!10126 lt!141517) #b00000000000000000000000000000000) (bvslt (index!10126 lt!141517) (size!7192 a!3312)))) (or ((_ is Undefined!1989) lt!141517) ((_ is Found!1989) lt!141517) ((_ is MissingZero!1989) lt!141517) (not ((_ is MissingVacant!1989) lt!141517)) (and (bvsge (index!10129 lt!141517) #b00000000000000000000000000000000) (bvslt (index!10129 lt!141517) (size!7192 a!3312)))) (or ((_ is Undefined!1989) lt!141517) (ite ((_ is Found!1989) lt!141517) (= (select (arr!6840 a!3312) (index!10127 lt!141517)) k0!2524) (ite ((_ is MissingZero!1989) lt!141517) (= (select (arr!6840 a!3312) (index!10126 lt!141517)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1989) lt!141517) (= (select (arr!6840 a!3312) (index!10129 lt!141517)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66109 (= lt!141517 e!182057)))

(declare-fun c!46621 () Bool)

(assert (=> d!66109 (= c!46621 (and ((_ is Intermediate!1989) lt!141515) (undefined!2801 lt!141515)))))

(assert (=> d!66109 (= lt!141515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66109 (validMask!0 mask!3809)))

(assert (=> d!66109 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141517)))

(declare-fun b!287459 () Bool)

(assert (=> b!287459 (= e!182057 Undefined!1989)))

(assert (= (and d!66109 c!46621) b!287459))

(assert (= (and d!66109 (not c!46621)) b!287454))

(assert (= (and b!287454 c!46623) b!287457))

(assert (= (and b!287454 (not c!46623)) b!287455))

(assert (= (and b!287455 c!46622) b!287456))

(assert (= (and b!287455 (not c!46622)) b!287458))

(declare-fun m!301879 () Bool)

(assert (=> b!287454 m!301879))

(declare-fun m!301881 () Bool)

(assert (=> b!287458 m!301881))

(assert (=> d!66109 m!301855))

(declare-fun m!301883 () Bool)

(assert (=> d!66109 m!301883))

(declare-fun m!301885 () Bool)

(assert (=> d!66109 m!301885))

(assert (=> d!66109 m!301855))

(assert (=> d!66109 m!301845))

(declare-fun m!301887 () Bool)

(assert (=> d!66109 m!301887))

(declare-fun m!301889 () Bool)

(assert (=> d!66109 m!301889))

(assert (=> b!287414 d!66109))

(declare-fun d!66119 () Bool)

(declare-fun res!149333 () Bool)

(declare-fun e!182062 () Bool)

(assert (=> d!66119 (=> res!149333 e!182062)))

(assert (=> d!66119 (= res!149333 (= (select (arr!6840 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66119 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!182062)))

(declare-fun b!287464 () Bool)

(declare-fun e!182063 () Bool)

(assert (=> b!287464 (= e!182062 e!182063)))

(declare-fun res!149334 () Bool)

(assert (=> b!287464 (=> (not res!149334) (not e!182063))))

(assert (=> b!287464 (= res!149334 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7192 a!3312)))))

(declare-fun b!287465 () Bool)

(assert (=> b!287465 (= e!182063 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66119 (not res!149333)) b!287464))

(assert (= (and b!287464 res!149334) b!287465))

(declare-fun m!301891 () Bool)

(assert (=> d!66119 m!301891))

(declare-fun m!301893 () Bool)

(assert (=> b!287465 m!301893))

(assert (=> b!287415 d!66119))

(declare-fun b!287501 () Bool)

(declare-fun e!182087 () Bool)

(declare-fun e!182086 () Bool)

(assert (=> b!287501 (= e!182087 e!182086)))

(declare-fun c!46635 () Bool)

(assert (=> b!287501 (= c!46635 (validKeyInArray!0 (select (arr!6840 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!287502 () Bool)

(declare-fun e!182085 () Bool)

(assert (=> b!287502 (= e!182086 e!182085)))

(declare-fun lt!141532 () (_ BitVec 64))

(assert (=> b!287502 (= lt!141532 (select (arr!6840 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9068 0))(
  ( (Unit!9069) )
))
(declare-fun lt!141531 () Unit!9068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14420 (_ BitVec 64) (_ BitVec 32)) Unit!9068)

(assert (=> b!287502 (= lt!141531 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141532 #b00000000000000000000000000000000))))

(assert (=> b!287502 (arrayContainsKey!0 a!3312 lt!141532 #b00000000000000000000000000000000)))

(declare-fun lt!141530 () Unit!9068)

(assert (=> b!287502 (= lt!141530 lt!141531)))

(declare-fun res!149349 () Bool)

(assert (=> b!287502 (= res!149349 (= (seekEntryOrOpen!0 (select (arr!6840 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1989 #b00000000000000000000000000000000)))))

(assert (=> b!287502 (=> (not res!149349) (not e!182085))))

(declare-fun d!66121 () Bool)

(declare-fun res!149348 () Bool)

(assert (=> d!66121 (=> res!149348 e!182087)))

(assert (=> d!66121 (= res!149348 (bvsge #b00000000000000000000000000000000 (size!7192 a!3312)))))

(assert (=> d!66121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!182087)))

(declare-fun b!287503 () Bool)

(declare-fun call!25618 () Bool)

(assert (=> b!287503 (= e!182086 call!25618)))

(declare-fun b!287504 () Bool)

(assert (=> b!287504 (= e!182085 call!25618)))

(declare-fun bm!25615 () Bool)

(assert (=> bm!25615 (= call!25618 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66121 (not res!149348)) b!287501))

(assert (= (and b!287501 c!46635) b!287502))

(assert (= (and b!287501 (not c!46635)) b!287503))

(assert (= (and b!287502 res!149349) b!287504))

(assert (= (or b!287504 b!287503) bm!25615))

(assert (=> b!287501 m!301891))

(assert (=> b!287501 m!301891))

(declare-fun m!301903 () Bool)

(assert (=> b!287501 m!301903))

(assert (=> b!287502 m!301891))

(declare-fun m!301905 () Bool)

(assert (=> b!287502 m!301905))

(declare-fun m!301907 () Bool)

(assert (=> b!287502 m!301907))

(assert (=> b!287502 m!301891))

(declare-fun m!301909 () Bool)

(assert (=> b!287502 m!301909))

(declare-fun m!301911 () Bool)

(assert (=> bm!25615 m!301911))

(assert (=> b!287416 d!66121))

(declare-fun d!66125 () Bool)

(assert (=> d!66125 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28016 d!66125))

(declare-fun d!66131 () Bool)

(assert (=> d!66131 (= (array_inv!4803 a!3312) (bvsge (size!7192 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28016 d!66131))

(declare-fun b!287574 () Bool)

(declare-fun lt!141571 () SeekEntryResult!1989)

(assert (=> b!287574 (and (bvsge (index!10128 lt!141571) #b00000000000000000000000000000000) (bvslt (index!10128 lt!141571) (size!7192 a!3312)))))

(declare-fun res!149373 () Bool)

(assert (=> b!287574 (= res!149373 (= (select (arr!6840 a!3312) (index!10128 lt!141571)) k0!2524))))

(declare-fun e!182132 () Bool)

(assert (=> b!287574 (=> res!149373 e!182132)))

(declare-fun e!182131 () Bool)

(assert (=> b!287574 (= e!182131 e!182132)))

(declare-fun b!287575 () Bool)

(declare-fun e!182129 () SeekEntryResult!1989)

(assert (=> b!287575 (= e!182129 (Intermediate!1989 false lt!141498 #b00000000000000000000000000000000))))

(declare-fun b!287576 () Bool)

(declare-fun e!182130 () SeekEntryResult!1989)

(assert (=> b!287576 (= e!182130 (Intermediate!1989 true lt!141498 #b00000000000000000000000000000000))))

(declare-fun b!287577 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287577 (= e!182129 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141498 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287578 () Bool)

(assert (=> b!287578 (= e!182130 e!182129)))

(declare-fun c!46661 () Bool)

(declare-fun lt!141570 () (_ BitVec 64))

(assert (=> b!287578 (= c!46661 (or (= lt!141570 k0!2524) (= (bvadd lt!141570 lt!141570) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!287579 () Bool)

(declare-fun e!182128 () Bool)

(assert (=> b!287579 (= e!182128 e!182131)))

(declare-fun res!149375 () Bool)

(assert (=> b!287579 (= res!149375 (and ((_ is Intermediate!1989) lt!141571) (not (undefined!2801 lt!141571)) (bvslt (x!28342 lt!141571) #b01111111111111111111111111111110) (bvsge (x!28342 lt!141571) #b00000000000000000000000000000000) (bvsge (x!28342 lt!141571) #b00000000000000000000000000000000)))))

(assert (=> b!287579 (=> (not res!149375) (not e!182131))))

(declare-fun d!66133 () Bool)

(assert (=> d!66133 e!182128))

(declare-fun c!46660 () Bool)

(assert (=> d!66133 (= c!46660 (and ((_ is Intermediate!1989) lt!141571) (undefined!2801 lt!141571)))))

(assert (=> d!66133 (= lt!141571 e!182130)))

(declare-fun c!46662 () Bool)

(assert (=> d!66133 (= c!46662 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66133 (= lt!141570 (select (arr!6840 a!3312) lt!141498))))

(assert (=> d!66133 (validMask!0 mask!3809)))

(assert (=> d!66133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141498 k0!2524 a!3312 mask!3809) lt!141571)))

(declare-fun b!287580 () Bool)

(assert (=> b!287580 (and (bvsge (index!10128 lt!141571) #b00000000000000000000000000000000) (bvslt (index!10128 lt!141571) (size!7192 a!3312)))))

(assert (=> b!287580 (= e!182132 (= (select (arr!6840 a!3312) (index!10128 lt!141571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!287581 () Bool)

(assert (=> b!287581 (= e!182128 (bvsge (x!28342 lt!141571) #b01111111111111111111111111111110))))

(declare-fun b!287582 () Bool)

(assert (=> b!287582 (and (bvsge (index!10128 lt!141571) #b00000000000000000000000000000000) (bvslt (index!10128 lt!141571) (size!7192 a!3312)))))

(declare-fun res!149374 () Bool)

(assert (=> b!287582 (= res!149374 (= (select (arr!6840 a!3312) (index!10128 lt!141571)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!287582 (=> res!149374 e!182132)))

(assert (= (and d!66133 c!46662) b!287576))

(assert (= (and d!66133 (not c!46662)) b!287578))

(assert (= (and b!287578 c!46661) b!287575))

(assert (= (and b!287578 (not c!46661)) b!287577))

(assert (= (and d!66133 c!46660) b!287581))

(assert (= (and d!66133 (not c!46660)) b!287579))

(assert (= (and b!287579 res!149375) b!287574))

(assert (= (and b!287574 (not res!149373)) b!287582))

(assert (= (and b!287582 (not res!149374)) b!287580))

(declare-fun m!301931 () Bool)

(assert (=> b!287580 m!301931))

(declare-fun m!301933 () Bool)

(assert (=> b!287577 m!301933))

(assert (=> b!287577 m!301933))

(declare-fun m!301935 () Bool)

(assert (=> b!287577 m!301935))

(assert (=> b!287582 m!301931))

(declare-fun m!301937 () Bool)

(assert (=> d!66133 m!301937))

(assert (=> d!66133 m!301845))

(assert (=> b!287574 m!301931))

(assert (=> b!287417 d!66133))

(declare-fun d!66143 () Bool)

(declare-fun lt!141580 () (_ BitVec 32))

(declare-fun lt!141579 () (_ BitVec 32))

(assert (=> d!66143 (= lt!141580 (bvmul (bvxor lt!141579 (bvlshr lt!141579 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66143 (= lt!141579 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66143 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149376 (let ((h!5255 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28349 (bvmul (bvxor h!5255 (bvlshr h!5255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28349 (bvlshr x!28349 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149376 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149376 #b00000000000000000000000000000000))))))

(assert (=> d!66143 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!141580 (bvlshr lt!141580 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!287417 d!66143))

(check-sat (not b!287501) (not b!287458) (not b!287577) (not b!287502) (not d!66133) (not bm!25615) (not b!287465) (not d!66109))
(check-sat)
