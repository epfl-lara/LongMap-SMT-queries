; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32012 () Bool)

(assert start!32012)

(declare-fun b!319644 () Bool)

(declare-fun e!198484 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!319644 (= e!198484 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsgt mask!3777 #b00111111111111111111111111111111)))))

(declare-fun b!319645 () Bool)

(declare-fun res!174031 () Bool)

(assert (=> b!319645 (=> (not res!174031) (not e!198484))))

(declare-datatypes ((array!16319 0))(
  ( (array!16320 (arr!7723 (Array (_ BitVec 32) (_ BitVec 64))) (size!8075 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16319)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16319 (_ BitVec 32)) Bool)

(assert (=> b!319645 (= res!174031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319646 () Bool)

(declare-fun res!174032 () Bool)

(assert (=> b!319646 (=> (not res!174032) (not e!198484))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319646 (= res!174032 (and (= (size!8075 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8075 a!3305))))))

(declare-fun b!319647 () Bool)

(declare-fun res!174029 () Bool)

(assert (=> b!319647 (=> (not res!174029) (not e!198484))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319647 (= res!174029 (validKeyInArray!0 k!2497))))

(declare-fun res!174028 () Bool)

(assert (=> start!32012 (=> (not res!174028) (not e!198484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32012 (= res!174028 (validMask!0 mask!3777))))

(assert (=> start!32012 e!198484))

(assert (=> start!32012 true))

(declare-fun array_inv!5686 (array!16319) Bool)

(assert (=> start!32012 (array_inv!5686 a!3305)))

(declare-fun b!319648 () Bool)

(declare-fun res!174030 () Bool)

(assert (=> b!319648 (=> (not res!174030) (not e!198484))))

(declare-fun arrayContainsKey!0 (array!16319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319648 (= res!174030 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319649 () Bool)

(declare-fun res!174033 () Bool)

(assert (=> b!319649 (=> (not res!174033) (not e!198484))))

(declare-datatypes ((SeekEntryResult!2854 0))(
  ( (MissingZero!2854 (index!13592 (_ BitVec 32))) (Found!2854 (index!13593 (_ BitVec 32))) (Intermediate!2854 (undefined!3666 Bool) (index!13594 (_ BitVec 32)) (x!31864 (_ BitVec 32))) (Undefined!2854) (MissingVacant!2854 (index!13595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16319 (_ BitVec 32)) SeekEntryResult!2854)

(assert (=> b!319649 (= res!174033 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2854 i!1250)))))

(assert (= (and start!32012 res!174028) b!319646))

(assert (= (and b!319646 res!174032) b!319647))

(assert (= (and b!319647 res!174029) b!319648))

(assert (= (and b!319648 res!174030) b!319649))

(assert (= (and b!319649 res!174033) b!319645))

(assert (= (and b!319645 res!174031) b!319644))

(declare-fun m!328187 () Bool)

(assert (=> b!319647 m!328187))

(declare-fun m!328189 () Bool)

(assert (=> b!319649 m!328189))

(declare-fun m!328191 () Bool)

(assert (=> b!319645 m!328191))

(declare-fun m!328193 () Bool)

(assert (=> b!319648 m!328193))

(declare-fun m!328195 () Bool)

(assert (=> start!32012 m!328195))

(declare-fun m!328197 () Bool)

(assert (=> start!32012 m!328197))

(push 1)

(assert (not b!319645))

(assert (not b!319647))

(assert (not start!32012))

(assert (not b!319649))

(assert (not b!319648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!319658 () Bool)

(declare-fun e!198492 () Bool)

(declare-fun e!198491 () Bool)

(assert (=> b!319658 (= e!198492 e!198491)))

(declare-fun c!50433 () Bool)

(assert (=> b!319658 (= c!50433 (validKeyInArray!0 (select (arr!7723 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!319659 () Bool)

(declare-fun e!198493 () Bool)

(assert (=> b!319659 (= e!198491 e!198493)))

(declare-fun lt!155823 () (_ BitVec 64))

(assert (=> b!319659 (= lt!155823 (select (arr!7723 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9812 0))(
  ( (Unit!9813) )
))
(declare-fun lt!155822 () Unit!9812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16319 (_ BitVec 64) (_ BitVec 32)) Unit!9812)

(assert (=> b!319659 (= lt!155822 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155823 #b00000000000000000000000000000000))))

(assert (=> b!319659 (arrayContainsKey!0 a!3305 lt!155823 #b00000000000000000000000000000000)))

(declare-fun lt!155821 () Unit!9812)

(assert (=> b!319659 (= lt!155821 lt!155822)))

(declare-fun res!174038 () Bool)

(assert (=> b!319659 (= res!174038 (= (seekEntryOrOpen!0 (select (arr!7723 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2854 #b00000000000000000000000000000000)))))

(assert (=> b!319659 (=> (not res!174038) (not e!198493))))

(declare-fun b!319660 () Bool)

(declare-fun call!26038 () Bool)

(assert (=> b!319660 (= e!198493 call!26038)))

(declare-fun d!69349 () Bool)

(declare-fun res!174039 () Bool)

(assert (=> d!69349 (=> res!174039 e!198492)))

(assert (=> d!69349 (= res!174039 (bvsge #b00000000000000000000000000000000 (size!8075 a!3305)))))

(assert (=> d!69349 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198492)))

(declare-fun b!319661 () Bool)

(assert (=> b!319661 (= e!198491 call!26038)))

(declare-fun bm!26035 () Bool)

(assert (=> bm!26035 (= call!26038 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69349 (not res!174039)) b!319658))

(assert (= (and b!319658 c!50433) b!319659))

(assert (= (and b!319658 (not c!50433)) b!319661))

(assert (= (and b!319659 res!174038) b!319660))

(assert (= (or b!319660 b!319661) bm!26035))

(declare-fun m!328199 () Bool)

(assert (=> b!319658 m!328199))

(assert (=> b!319658 m!328199))

(declare-fun m!328201 () Bool)

(assert (=> b!319658 m!328201))

(assert (=> b!319659 m!328199))

(declare-fun m!328203 () Bool)

(assert (=> b!319659 m!328203))

(declare-fun m!328205 () Bool)

(assert (=> b!319659 m!328205))

(assert (=> b!319659 m!328199))

(declare-fun m!328207 () Bool)

(assert (=> b!319659 m!328207))

(declare-fun m!328209 () Bool)

(assert (=> bm!26035 m!328209))

(assert (=> b!319645 d!69349))

(declare-fun d!69351 () Bool)

(assert (=> d!69351 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32012 d!69351))

(declare-fun d!69357 () Bool)

(assert (=> d!69357 (= (array_inv!5686 a!3305) (bvsge (size!8075 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32012 d!69357))

(declare-fun d!69359 () Bool)

(declare-fun res!174050 () Bool)

(declare-fun e!198522 () Bool)

(assert (=> d!69359 (=> res!174050 e!198522)))

(assert (=> d!69359 (= res!174050 (= (select (arr!7723 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69359 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!198522)))

(declare-fun b!319708 () Bool)

(declare-fun e!198523 () Bool)

(assert (=> b!319708 (= e!198522 e!198523)))

(declare-fun res!174051 () Bool)

(assert (=> b!319708 (=> (not res!174051) (not e!198523))))

(assert (=> b!319708 (= res!174051 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8075 a!3305)))))

(declare-fun b!319709 () Bool)

(assert (=> b!319709 (= e!198523 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69359 (not res!174050)) b!319708))

(assert (= (and b!319708 res!174051) b!319709))

(assert (=> d!69359 m!328199))

(declare-fun m!328243 () Bool)

(assert (=> b!319709 m!328243))

(assert (=> b!319648 d!69359))

(declare-fun d!69363 () Bool)

(assert (=> d!69363 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319647 d!69363))

(declare-fun d!69365 () Bool)

(declare-fun lt!155863 () SeekEntryResult!2854)

(assert (=> d!69365 (and (or (is-Undefined!2854 lt!155863) (not (is-Found!2854 lt!155863)) (and (bvsge (index!13593 lt!155863) #b00000000000000000000000000000000) (bvslt (index!13593 lt!155863) (size!8075 a!3305)))) (or (is-Undefined!2854 lt!155863) (is-Found!2854 lt!155863) (not (is-MissingZero!2854 lt!155863)) (and (bvsge (index!13592 lt!155863) #b00000000000000000000000000000000) (bvslt (index!13592 lt!155863) (size!8075 a!3305)))) (or (is-Undefined!2854 lt!155863) (is-Found!2854 lt!155863) (is-MissingZero!2854 lt!155863) (not (is-MissingVacant!2854 lt!155863)) (and (bvsge (index!13595 lt!155863) #b00000000000000000000000000000000) (bvslt (index!13595 lt!155863) (size!8075 a!3305)))) (or (is-Undefined!2854 lt!155863) (ite (is-Found!2854 lt!155863) (= (select (arr!7723 a!3305) (index!13593 lt!155863)) k!2497) (ite (is-MissingZero!2854 lt!155863) (= (select (arr!7723 a!3305) (index!13592 lt!155863)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2854 lt!155863) (= (select (arr!7723 a!3305) (index!13595 lt!155863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!198545 () SeekEntryResult!2854)

(assert (=> d!69365 (= lt!155863 e!198545)))

