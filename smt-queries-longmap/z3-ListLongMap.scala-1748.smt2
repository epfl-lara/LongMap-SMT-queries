; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31994 () Bool)

(assert start!31994)

(declare-fun res!173866 () Bool)

(declare-fun e!198296 () Bool)

(assert (=> start!31994 (=> (not res!173866) (not e!198296))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31994 (= res!173866 (validMask!0 mask!3777))))

(assert (=> start!31994 e!198296))

(assert (=> start!31994 true))

(declare-datatypes ((array!16305 0))(
  ( (array!16306 (arr!7716 (Array (_ BitVec 32) (_ BitVec 64))) (size!8069 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16305)

(declare-fun array_inv!5688 (array!16305) Bool)

(assert (=> start!31994 (array_inv!5688 a!3305)))

(declare-fun b!319333 () Bool)

(declare-fun res!173863 () Bool)

(assert (=> b!319333 (=> (not res!173863) (not e!198296))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319333 (= res!173863 (validKeyInArray!0 k0!2497))))

(declare-fun b!319334 () Bool)

(assert (=> b!319334 (= e!198296 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsgt mask!3777 #b00111111111111111111111111111111)))))

(declare-fun b!319335 () Bool)

(declare-fun res!173868 () Bool)

(assert (=> b!319335 (=> (not res!173868) (not e!198296))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2846 0))(
  ( (MissingZero!2846 (index!13560 (_ BitVec 32))) (Found!2846 (index!13561 (_ BitVec 32))) (Intermediate!2846 (undefined!3658 Bool) (index!13562 (_ BitVec 32)) (x!31851 (_ BitVec 32))) (Undefined!2846) (MissingVacant!2846 (index!13563 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16305 (_ BitVec 32)) SeekEntryResult!2846)

(assert (=> b!319335 (= res!173868 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2846 i!1250)))))

(declare-fun b!319336 () Bool)

(declare-fun res!173867 () Bool)

(assert (=> b!319336 (=> (not res!173867) (not e!198296))))

(declare-fun arrayContainsKey!0 (array!16305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319336 (= res!173867 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319337 () Bool)

(declare-fun res!173865 () Bool)

(assert (=> b!319337 (=> (not res!173865) (not e!198296))))

(assert (=> b!319337 (= res!173865 (and (= (size!8069 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8069 a!3305))))))

(declare-fun b!319338 () Bool)

(declare-fun res!173864 () Bool)

(assert (=> b!319338 (=> (not res!173864) (not e!198296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16305 (_ BitVec 32)) Bool)

(assert (=> b!319338 (= res!173864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!31994 res!173866) b!319337))

(assert (= (and b!319337 res!173865) b!319333))

(assert (= (and b!319333 res!173863) b!319336))

(assert (= (and b!319336 res!173867) b!319335))

(assert (= (and b!319335 res!173868) b!319338))

(assert (= (and b!319338 res!173864) b!319334))

(declare-fun m!327433 () Bool)

(assert (=> b!319336 m!327433))

(declare-fun m!327435 () Bool)

(assert (=> start!31994 m!327435))

(declare-fun m!327437 () Bool)

(assert (=> start!31994 m!327437))

(declare-fun m!327439 () Bool)

(assert (=> b!319338 m!327439))

(declare-fun m!327441 () Bool)

(assert (=> b!319335 m!327441))

(declare-fun m!327443 () Bool)

(assert (=> b!319333 m!327443))

(check-sat (not b!319335) (not b!319333) (not b!319338) (not start!31994) (not b!319336))
(check-sat)
(get-model)

(declare-fun d!69139 () Bool)

(assert (=> d!69139 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!31994 d!69139))

(declare-fun d!69145 () Bool)

(assert (=> d!69145 (= (array_inv!5688 a!3305) (bvsge (size!8069 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!31994 d!69145))

(declare-fun d!69147 () Bool)

(assert (=> d!69147 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319333 d!69147))

(declare-fun b!319383 () Bool)

(declare-fun e!198317 () Bool)

(declare-fun e!198316 () Bool)

(assert (=> b!319383 (= e!198317 e!198316)))

(declare-fun lt!155591 () (_ BitVec 64))

(assert (=> b!319383 (= lt!155591 (select (arr!7716 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9776 0))(
  ( (Unit!9777) )
))
(declare-fun lt!155592 () Unit!9776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16305 (_ BitVec 64) (_ BitVec 32)) Unit!9776)

(assert (=> b!319383 (= lt!155592 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155591 #b00000000000000000000000000000000))))

(assert (=> b!319383 (arrayContainsKey!0 a!3305 lt!155591 #b00000000000000000000000000000000)))

(declare-fun lt!155590 () Unit!9776)

(assert (=> b!319383 (= lt!155590 lt!155592)))

(declare-fun res!173910 () Bool)

(assert (=> b!319383 (= res!173910 (= (seekEntryOrOpen!0 (select (arr!7716 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2846 #b00000000000000000000000000000000)))))

(assert (=> b!319383 (=> (not res!173910) (not e!198316))))

(declare-fun b!319384 () Bool)

(declare-fun call!26012 () Bool)

(assert (=> b!319384 (= e!198316 call!26012)))

(declare-fun b!319385 () Bool)

(assert (=> b!319385 (= e!198317 call!26012)))

(declare-fun d!69149 () Bool)

(declare-fun res!173909 () Bool)

(declare-fun e!198315 () Bool)

(assert (=> d!69149 (=> res!173909 e!198315)))

(assert (=> d!69149 (= res!173909 (bvsge #b00000000000000000000000000000000 (size!8069 a!3305)))))

(assert (=> d!69149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198315)))

(declare-fun bm!26009 () Bool)

(assert (=> bm!26009 (= call!26012 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!319386 () Bool)

(assert (=> b!319386 (= e!198315 e!198317)))

(declare-fun c!50360 () Bool)

(assert (=> b!319386 (= c!50360 (validKeyInArray!0 (select (arr!7716 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!69149 (not res!173909)) b!319386))

(assert (= (and b!319386 c!50360) b!319383))

(assert (= (and b!319386 (not c!50360)) b!319385))

(assert (= (and b!319383 res!173910) b!319384))

(assert (= (or b!319384 b!319385) bm!26009))

(declare-fun m!327469 () Bool)

(assert (=> b!319383 m!327469))

(declare-fun m!327471 () Bool)

(assert (=> b!319383 m!327471))

(declare-fun m!327473 () Bool)

(assert (=> b!319383 m!327473))

(assert (=> b!319383 m!327469))

(declare-fun m!327475 () Bool)

(assert (=> b!319383 m!327475))

(declare-fun m!327477 () Bool)

(assert (=> bm!26009 m!327477))

(assert (=> b!319386 m!327469))

(assert (=> b!319386 m!327469))

(declare-fun m!327479 () Bool)

(assert (=> b!319386 m!327479))

(assert (=> b!319338 d!69149))

(declare-fun d!69155 () Bool)

(declare-fun res!173919 () Bool)

(declare-fun e!198334 () Bool)

(assert (=> d!69155 (=> res!173919 e!198334)))

(assert (=> d!69155 (= res!173919 (= (select (arr!7716 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69155 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198334)))

(declare-fun b!319411 () Bool)

(declare-fun e!198335 () Bool)

(assert (=> b!319411 (= e!198334 e!198335)))

(declare-fun res!173920 () Bool)

(assert (=> b!319411 (=> (not res!173920) (not e!198335))))

(assert (=> b!319411 (= res!173920 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8069 a!3305)))))

(declare-fun b!319412 () Bool)

(assert (=> b!319412 (= e!198335 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69155 (not res!173919)) b!319411))

(assert (= (and b!319411 res!173920) b!319412))

(assert (=> d!69155 m!327469))

(declare-fun m!327481 () Bool)

(assert (=> b!319412 m!327481))

(assert (=> b!319336 d!69155))

(declare-fun b!319465 () Bool)

(declare-fun e!198371 () SeekEntryResult!2846)

(declare-fun lt!155630 () SeekEntryResult!2846)

(assert (=> b!319465 (= e!198371 (MissingZero!2846 (index!13562 lt!155630)))))

(declare-fun b!319466 () Bool)

(declare-fun e!198370 () SeekEntryResult!2846)

(assert (=> b!319466 (= e!198370 (Found!2846 (index!13562 lt!155630)))))

(declare-fun b!319467 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16305 (_ BitVec 32)) SeekEntryResult!2846)

(assert (=> b!319467 (= e!198371 (seekKeyOrZeroReturnVacant!0 (x!31851 lt!155630) (index!13562 lt!155630) (index!13562 lt!155630) k0!2497 a!3305 mask!3777))))

(declare-fun d!69157 () Bool)

(declare-fun lt!155628 () SeekEntryResult!2846)

(get-info :version)

(assert (=> d!69157 (and (or ((_ is Undefined!2846) lt!155628) (not ((_ is Found!2846) lt!155628)) (and (bvsge (index!13561 lt!155628) #b00000000000000000000000000000000) (bvslt (index!13561 lt!155628) (size!8069 a!3305)))) (or ((_ is Undefined!2846) lt!155628) ((_ is Found!2846) lt!155628) (not ((_ is MissingZero!2846) lt!155628)) (and (bvsge (index!13560 lt!155628) #b00000000000000000000000000000000) (bvslt (index!13560 lt!155628) (size!8069 a!3305)))) (or ((_ is Undefined!2846) lt!155628) ((_ is Found!2846) lt!155628) ((_ is MissingZero!2846) lt!155628) (not ((_ is MissingVacant!2846) lt!155628)) (and (bvsge (index!13563 lt!155628) #b00000000000000000000000000000000) (bvslt (index!13563 lt!155628) (size!8069 a!3305)))) (or ((_ is Undefined!2846) lt!155628) (ite ((_ is Found!2846) lt!155628) (= (select (arr!7716 a!3305) (index!13561 lt!155628)) k0!2497) (ite ((_ is MissingZero!2846) lt!155628) (= (select (arr!7716 a!3305) (index!13560 lt!155628)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2846) lt!155628) (= (select (arr!7716 a!3305) (index!13563 lt!155628)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!198369 () SeekEntryResult!2846)

(assert (=> d!69157 (= lt!155628 e!198369)))

(declare-fun c!50389 () Bool)

(assert (=> d!69157 (= c!50389 (and ((_ is Intermediate!2846) lt!155630) (undefined!3658 lt!155630)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16305 (_ BitVec 32)) SeekEntryResult!2846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69157 (= lt!155630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69157 (validMask!0 mask!3777)))

(assert (=> d!69157 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!155628)))

(declare-fun b!319468 () Bool)

(assert (=> b!319468 (= e!198369 e!198370)))

(declare-fun lt!155629 () (_ BitVec 64))

(assert (=> b!319468 (= lt!155629 (select (arr!7716 a!3305) (index!13562 lt!155630)))))

(declare-fun c!50388 () Bool)

(assert (=> b!319468 (= c!50388 (= lt!155629 k0!2497))))

(declare-fun b!319469 () Bool)

(assert (=> b!319469 (= e!198369 Undefined!2846)))

(declare-fun b!319470 () Bool)

(declare-fun c!50390 () Bool)

(assert (=> b!319470 (= c!50390 (= lt!155629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!319470 (= e!198370 e!198371)))

(assert (= (and d!69157 c!50389) b!319469))

(assert (= (and d!69157 (not c!50389)) b!319468))

(assert (= (and b!319468 c!50388) b!319466))

(assert (= (and b!319468 (not c!50388)) b!319470))

(assert (= (and b!319470 c!50390) b!319465))

(assert (= (and b!319470 (not c!50390)) b!319467))

(declare-fun m!327523 () Bool)

(assert (=> b!319467 m!327523))

(declare-fun m!327525 () Bool)

(assert (=> d!69157 m!327525))

(declare-fun m!327527 () Bool)

(assert (=> d!69157 m!327527))

(declare-fun m!327529 () Bool)

(assert (=> d!69157 m!327529))

(declare-fun m!327531 () Bool)

(assert (=> d!69157 m!327531))

(assert (=> d!69157 m!327435))

(assert (=> d!69157 m!327529))

(declare-fun m!327533 () Bool)

(assert (=> d!69157 m!327533))

(declare-fun m!327535 () Bool)

(assert (=> b!319468 m!327535))

(assert (=> b!319335 d!69157))

(check-sat (not b!319412) (not b!319386) (not d!69157) (not b!319383) (not bm!26009) (not b!319467))
(check-sat)
