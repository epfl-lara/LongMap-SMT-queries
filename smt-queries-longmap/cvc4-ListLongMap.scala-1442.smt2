; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27820 () Bool)

(assert start!27820)

(declare-fun b!286377 () Bool)

(declare-fun res!148529 () Bool)

(declare-fun e!181457 () Bool)

(assert (=> b!286377 (=> (not res!148529) (not e!181457))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14341 0))(
  ( (array!14342 (arr!6805 (Array (_ BitVec 32) (_ BitVec 64))) (size!7157 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14341)

(assert (=> b!286377 (= res!148529 (and (= (size!7157 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7157 a!3312))))))

(declare-fun res!148530 () Bool)

(assert (=> start!27820 (=> (not res!148530) (not e!181457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27820 (= res!148530 (validMask!0 mask!3809))))

(assert (=> start!27820 e!181457))

(assert (=> start!27820 true))

(declare-fun array_inv!4768 (array!14341) Bool)

(assert (=> start!27820 (array_inv!4768 a!3312)))

(declare-fun b!286378 () Bool)

(declare-fun e!181455 () Bool)

(assert (=> b!286378 (= e!181457 e!181455)))

(declare-fun res!148532 () Bool)

(assert (=> b!286378 (=> (not res!148532) (not e!181455))))

(declare-datatypes ((SeekEntryResult!1954 0))(
  ( (MissingZero!1954 (index!9986 (_ BitVec 32))) (Found!1954 (index!9987 (_ BitVec 32))) (Intermediate!1954 (undefined!2766 Bool) (index!9988 (_ BitVec 32)) (x!28202 (_ BitVec 32))) (Undefined!1954) (MissingVacant!1954 (index!9989 (_ BitVec 32))) )
))
(declare-fun lt!141067 () SeekEntryResult!1954)

(assert (=> b!286378 (= res!148532 (or (= lt!141067 (MissingZero!1954 i!1256)) (= lt!141067 (MissingVacant!1954 i!1256))))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14341 (_ BitVec 32)) SeekEntryResult!1954)

(assert (=> b!286378 (= lt!141067 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286379 () Bool)

(assert (=> b!286379 (= e!181455 (and (bvsge mask!3809 #b00000000000000000000000000000000) (bvsgt mask!3809 #b00111111111111111111111111111111)))))

(declare-fun b!286380 () Bool)

(declare-fun res!148531 () Bool)

(assert (=> b!286380 (=> (not res!148531) (not e!181457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286380 (= res!148531 (validKeyInArray!0 k!2524))))

(declare-fun b!286381 () Bool)

(declare-fun res!148528 () Bool)

(assert (=> b!286381 (=> (not res!148528) (not e!181457))))

(declare-fun arrayContainsKey!0 (array!14341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286381 (= res!148528 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286382 () Bool)

(declare-fun res!148533 () Bool)

(assert (=> b!286382 (=> (not res!148533) (not e!181455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14341 (_ BitVec 32)) Bool)

(assert (=> b!286382 (= res!148533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!27820 res!148530) b!286377))

(assert (= (and b!286377 res!148529) b!286380))

(assert (= (and b!286380 res!148531) b!286381))

(assert (= (and b!286381 res!148528) b!286378))

(assert (= (and b!286378 res!148532) b!286382))

(assert (= (and b!286382 res!148533) b!286379))

(declare-fun m!301065 () Bool)

(assert (=> b!286382 m!301065))

(declare-fun m!301067 () Bool)

(assert (=> b!286378 m!301067))

(declare-fun m!301069 () Bool)

(assert (=> b!286381 m!301069))

(declare-fun m!301071 () Bool)

(assert (=> b!286380 m!301071))

(declare-fun m!301073 () Bool)

(assert (=> start!27820 m!301073))

(declare-fun m!301075 () Bool)

(assert (=> start!27820 m!301075))

(push 1)

(assert (not b!286381))

(assert (not b!286378))

(assert (not start!27820))

(assert (not b!286382))

(assert (not b!286380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65959 () Bool)

(declare-fun lt!141089 () SeekEntryResult!1954)

(assert (=> d!65959 (and (or (is-Undefined!1954 lt!141089) (not (is-Found!1954 lt!141089)) (and (bvsge (index!9987 lt!141089) #b00000000000000000000000000000000) (bvslt (index!9987 lt!141089) (size!7157 a!3312)))) (or (is-Undefined!1954 lt!141089) (is-Found!1954 lt!141089) (not (is-MissingZero!1954 lt!141089)) (and (bvsge (index!9986 lt!141089) #b00000000000000000000000000000000) (bvslt (index!9986 lt!141089) (size!7157 a!3312)))) (or (is-Undefined!1954 lt!141089) (is-Found!1954 lt!141089) (is-MissingZero!1954 lt!141089) (not (is-MissingVacant!1954 lt!141089)) (and (bvsge (index!9989 lt!141089) #b00000000000000000000000000000000) (bvslt (index!9989 lt!141089) (size!7157 a!3312)))) (or (is-Undefined!1954 lt!141089) (ite (is-Found!1954 lt!141089) (= (select (arr!6805 a!3312) (index!9987 lt!141089)) k!2524) (ite (is-MissingZero!1954 lt!141089) (= (select (arr!6805 a!3312) (index!9986 lt!141089)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1954 lt!141089) (= (select (arr!6805 a!3312) (index!9989 lt!141089)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!181486 () SeekEntryResult!1954)

(assert (=> d!65959 (= lt!141089 e!181486)))

(declare-fun c!46495 () Bool)

(declare-fun lt!141090 () SeekEntryResult!1954)

(assert (=> d!65959 (= c!46495 (and (is-Intermediate!1954 lt!141090) (undefined!2766 lt!141090)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14341 (_ BitVec 32)) SeekEntryResult!1954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65959 (= lt!141090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!65959 (validMask!0 mask!3809)))

(assert (=> d!65959 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141089)))

(declare-fun b!286425 () Bool)

(declare-fun e!181487 () SeekEntryResult!1954)

(assert (=> b!286425 (= e!181487 (Found!1954 (index!9988 lt!141090)))))

(declare-fun b!286426 () Bool)

(declare-fun e!181485 () SeekEntryResult!1954)

(assert (=> b!286426 (= e!181485 (MissingZero!1954 (index!9988 lt!141090)))))

(declare-fun b!286427 () Bool)

(assert (=> b!286427 (= e!181486 e!181487)))

(declare-fun lt!141091 () (_ BitVec 64))

(assert (=> b!286427 (= lt!141091 (select (arr!6805 a!3312) (index!9988 lt!141090)))))

(declare-fun c!46497 () Bool)

(assert (=> b!286427 (= c!46497 (= lt!141091 k!2524))))

(declare-fun b!286428 () Bool)

(assert (=> b!286428 (= e!181486 Undefined!1954)))

(declare-fun b!286429 () Bool)

(declare-fun c!46496 () Bool)

(assert (=> b!286429 (= c!46496 (= lt!141091 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!286429 (= e!181487 e!181485)))

(declare-fun b!286430 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14341 (_ BitVec 32)) SeekEntryResult!1954)

(assert (=> b!286430 (= e!181485 (seekKeyOrZeroReturnVacant!0 (x!28202 lt!141090) (index!9988 lt!141090) (index!9988 lt!141090) k!2524 a!3312 mask!3809))))

(assert (= (and d!65959 c!46495) b!286428))

(assert (= (and d!65959 (not c!46495)) b!286427))

(assert (= (and b!286427 c!46497) b!286425))

(assert (= (and b!286427 (not c!46497)) b!286429))

(assert (= (and b!286429 c!46496) b!286426))

(assert (= (and b!286429 (not c!46496)) b!286430))

(declare-fun m!301089 () Bool)

(assert (=> d!65959 m!301089))

(declare-fun m!301093 () Bool)

(assert (=> d!65959 m!301093))

(assert (=> d!65959 m!301073))

(declare-fun m!301095 () Bool)

(assert (=> d!65959 m!301095))

(assert (=> d!65959 m!301095))

(declare-fun m!301097 () Bool)

(assert (=> d!65959 m!301097))

(declare-fun m!301099 () Bool)

(assert (=> d!65959 m!301099))

(declare-fun m!301101 () Bool)

(assert (=> b!286427 m!301101))

(declare-fun m!301103 () Bool)

(assert (=> b!286430 m!301103))

(assert (=> b!286378 d!65959))

(declare-fun b!286445 () Bool)

(declare-fun e!181497 () Bool)

(declare-fun call!25594 () Bool)

(assert (=> b!286445 (= e!181497 call!25594)))

(declare-fun d!65969 () Bool)

(declare-fun res!148551 () Bool)

(declare-fun e!181498 () Bool)

(assert (=> d!65969 (=> res!148551 e!181498)))

(assert (=> d!65969 (= res!148551 (bvsge #b00000000000000000000000000000000 (size!7157 a!3312)))))

(assert (=> d!65969 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181498)))

(declare-fun b!286446 () Bool)

(assert (=> b!286446 (= e!181498 e!181497)))

(declare-fun c!46503 () Bool)

(assert (=> b!286446 (= c!46503 (validKeyInArray!0 (select (arr!6805 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!286447 () Bool)

(declare-fun e!181499 () Bool)

(assert (=> b!286447 (= e!181499 call!25594)))

(declare-fun bm!25591 () Bool)

(assert (=> bm!25591 (= call!25594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!286448 () Bool)

(assert (=> b!286448 (= e!181497 e!181499)))

(declare-fun lt!141101 () (_ BitVec 64))

(assert (=> b!286448 (= lt!141101 (select (arr!6805 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9052 0))(
  ( (Unit!9053) )
))
(declare-fun lt!141102 () Unit!9052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14341 (_ BitVec 64) (_ BitVec 32)) Unit!9052)

(assert (=> b!286448 (= lt!141102 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141101 #b00000000000000000000000000000000))))

(assert (=> b!286448 (arrayContainsKey!0 a!3312 lt!141101 #b00000000000000000000000000000000)))

(declare-fun lt!141103 () Unit!9052)

(assert (=> b!286448 (= lt!141103 lt!141102)))

(declare-fun res!148550 () Bool)

(assert (=> b!286448 (= res!148550 (= (seekEntryOrOpen!0 (select (arr!6805 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1954 #b00000000000000000000000000000000)))))

(assert (=> b!286448 (=> (not res!148550) (not e!181499))))

(assert (= (and d!65969 (not res!148551)) b!286446))

(assert (= (and b!286446 c!46503) b!286448))

(assert (= (and b!286446 (not c!46503)) b!286445))

(assert (= (and b!286448 res!148550) b!286447))

(assert (= (or b!286447 b!286445) bm!25591))

(declare-fun m!301119 () Bool)

(assert (=> b!286446 m!301119))

(assert (=> b!286446 m!301119))

(declare-fun m!301121 () Bool)

(assert (=> b!286446 m!301121))

(declare-fun m!301123 () Bool)

(assert (=> bm!25591 m!301123))

(assert (=> b!286448 m!301119))

(declare-fun m!301125 () Bool)

(assert (=> b!286448 m!301125))

(declare-fun m!301127 () Bool)

(assert (=> b!286448 m!301127))

(assert (=> b!286448 m!301119))

(declare-fun m!301129 () Bool)

(assert (=> b!286448 m!301129))

(assert (=> b!286382 d!65969))

(declare-fun d!65973 () Bool)

(assert (=> d!65973 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27820 d!65973))

(declare-fun d!65979 () Bool)

(assert (=> d!65979 (= (array_inv!4768 a!3312) (bvsge (size!7157 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27820 d!65979))

(declare-fun d!65981 () Bool)

(declare-fun res!148562 () Bool)

(declare-fun e!181519 () Bool)

(assert (=> d!65981 (=> res!148562 e!181519)))

(assert (=> d!65981 (= res!148562 (= (select (arr!6805 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!65981 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!181519)))

(declare-fun b!286477 () Bool)

(declare-fun e!181520 () Bool)

(assert (=> b!286477 (= e!181519 e!181520)))

(declare-fun res!148563 () Bool)

(assert (=> b!286477 (=> (not res!148563) (not e!181520))))

(assert (=> b!286477 (= res!148563 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7157 a!3312)))))

(declare-fun b!286478 () Bool)

(assert (=> b!286478 (= e!181520 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

