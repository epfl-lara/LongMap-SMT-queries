; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31994 () Bool)

(assert start!31994)

(declare-fun res!173991 () Bool)

(declare-fun e!198437 () Bool)

(assert (=> start!31994 (=> (not res!173991) (not e!198437))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31994 (= res!173991 (validMask!0 mask!3777))))

(assert (=> start!31994 e!198437))

(assert (=> start!31994 true))

(declare-datatypes ((array!16314 0))(
  ( (array!16315 (arr!7720 (Array (_ BitVec 32) (_ BitVec 64))) (size!8072 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16314)

(declare-fun array_inv!5670 (array!16314) Bool)

(assert (=> start!31994 (array_inv!5670 a!3305)))

(declare-fun b!319555 () Bool)

(assert (=> b!319555 (= e!198437 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsgt mask!3777 #b00111111111111111111111111111111)))))

(declare-fun b!319556 () Bool)

(declare-fun res!173993 () Bool)

(assert (=> b!319556 (=> (not res!173993) (not e!198437))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319556 (= res!173993 (and (= (size!8072 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8072 a!3305))))))

(declare-fun b!319557 () Bool)

(declare-fun res!173992 () Bool)

(assert (=> b!319557 (=> (not res!173992) (not e!198437))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2816 0))(
  ( (MissingZero!2816 (index!13440 (_ BitVec 32))) (Found!2816 (index!13441 (_ BitVec 32))) (Intermediate!2816 (undefined!3628 Bool) (index!13442 (_ BitVec 32)) (x!31823 (_ BitVec 32))) (Undefined!2816) (MissingVacant!2816 (index!13443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16314 (_ BitVec 32)) SeekEntryResult!2816)

(assert (=> b!319557 (= res!173992 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2816 i!1250)))))

(declare-fun b!319558 () Bool)

(declare-fun res!173989 () Bool)

(assert (=> b!319558 (=> (not res!173989) (not e!198437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319558 (= res!173989 (validKeyInArray!0 k0!2497))))

(declare-fun b!319559 () Bool)

(declare-fun res!173990 () Bool)

(assert (=> b!319559 (=> (not res!173990) (not e!198437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16314 (_ BitVec 32)) Bool)

(assert (=> b!319559 (= res!173990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319560 () Bool)

(declare-fun res!173994 () Bool)

(assert (=> b!319560 (=> (not res!173994) (not e!198437))))

(declare-fun arrayContainsKey!0 (array!16314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319560 (= res!173994 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!31994 res!173991) b!319556))

(assert (= (and b!319556 res!173993) b!319558))

(assert (= (and b!319558 res!173989) b!319560))

(assert (= (and b!319560 res!173994) b!319557))

(assert (= (and b!319557 res!173992) b!319559))

(assert (= (and b!319559 res!173990) b!319555))

(declare-fun m!328339 () Bool)

(assert (=> b!319557 m!328339))

(declare-fun m!328341 () Bool)

(assert (=> b!319558 m!328341))

(declare-fun m!328343 () Bool)

(assert (=> b!319559 m!328343))

(declare-fun m!328345 () Bool)

(assert (=> b!319560 m!328345))

(declare-fun m!328347 () Bool)

(assert (=> start!31994 m!328347))

(declare-fun m!328349 () Bool)

(assert (=> start!31994 m!328349))

(check-sat (not b!319557) (not b!319558) (not start!31994) (not b!319560) (not b!319559))
(check-sat)
(get-model)

(declare-fun d!69373 () Bool)

(assert (=> d!69373 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!31994 d!69373))

(declare-fun d!69381 () Bool)

(assert (=> d!69381 (= (array_inv!5670 a!3305) (bvsge (size!8072 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!31994 d!69381))

(declare-fun b!319623 () Bool)

(declare-fun e!198472 () Bool)

(declare-fun e!198473 () Bool)

(assert (=> b!319623 (= e!198472 e!198473)))

(declare-fun lt!155848 () (_ BitVec 64))

(assert (=> b!319623 (= lt!155848 (select (arr!7720 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9774 0))(
  ( (Unit!9775) )
))
(declare-fun lt!155849 () Unit!9774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16314 (_ BitVec 64) (_ BitVec 32)) Unit!9774)

(assert (=> b!319623 (= lt!155849 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155848 #b00000000000000000000000000000000))))

(assert (=> b!319623 (arrayContainsKey!0 a!3305 lt!155848 #b00000000000000000000000000000000)))

(declare-fun lt!155850 () Unit!9774)

(assert (=> b!319623 (= lt!155850 lt!155849)))

(declare-fun res!174047 () Bool)

(assert (=> b!319623 (= res!174047 (= (seekEntryOrOpen!0 (select (arr!7720 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2816 #b00000000000000000000000000000000)))))

(assert (=> b!319623 (=> (not res!174047) (not e!198473))))

(declare-fun b!319624 () Bool)

(declare-fun e!198474 () Bool)

(assert (=> b!319624 (= e!198474 e!198472)))

(declare-fun c!50411 () Bool)

(assert (=> b!319624 (= c!50411 (validKeyInArray!0 (select (arr!7720 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!319625 () Bool)

(declare-fun call!26027 () Bool)

(assert (=> b!319625 (= e!198473 call!26027)))

(declare-fun b!319626 () Bool)

(assert (=> b!319626 (= e!198472 call!26027)))

(declare-fun d!69383 () Bool)

(declare-fun res!174048 () Bool)

(assert (=> d!69383 (=> res!174048 e!198474)))

(assert (=> d!69383 (= res!174048 (bvsge #b00000000000000000000000000000000 (size!8072 a!3305)))))

(assert (=> d!69383 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198474)))

(declare-fun bm!26024 () Bool)

(assert (=> bm!26024 (= call!26027 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69383 (not res!174048)) b!319624))

(assert (= (and b!319624 c!50411) b!319623))

(assert (= (and b!319624 (not c!50411)) b!319626))

(assert (= (and b!319623 res!174047) b!319625))

(assert (= (or b!319625 b!319626) bm!26024))

(declare-fun m!328391 () Bool)

(assert (=> b!319623 m!328391))

(declare-fun m!328393 () Bool)

(assert (=> b!319623 m!328393))

(declare-fun m!328395 () Bool)

(assert (=> b!319623 m!328395))

(assert (=> b!319623 m!328391))

(declare-fun m!328397 () Bool)

(assert (=> b!319623 m!328397))

(assert (=> b!319624 m!328391))

(assert (=> b!319624 m!328391))

(declare-fun m!328399 () Bool)

(assert (=> b!319624 m!328399))

(declare-fun m!328401 () Bool)

(assert (=> bm!26024 m!328401))

(assert (=> b!319559 d!69383))

(declare-fun d!69393 () Bool)

(declare-fun res!174053 () Bool)

(declare-fun e!198479 () Bool)

(assert (=> d!69393 (=> res!174053 e!198479)))

(assert (=> d!69393 (= res!174053 (= (select (arr!7720 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69393 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198479)))

(declare-fun b!319631 () Bool)

(declare-fun e!198480 () Bool)

(assert (=> b!319631 (= e!198479 e!198480)))

(declare-fun res!174054 () Bool)

(assert (=> b!319631 (=> (not res!174054) (not e!198480))))

(assert (=> b!319631 (= res!174054 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8072 a!3305)))))

(declare-fun b!319632 () Bool)

(assert (=> b!319632 (= e!198480 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69393 (not res!174053)) b!319631))

(assert (= (and b!319631 res!174054) b!319632))

(assert (=> d!69393 m!328391))

(declare-fun m!328403 () Bool)

(assert (=> b!319632 m!328403))

(assert (=> b!319560 d!69393))

(declare-fun d!69395 () Bool)

(assert (=> d!69395 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319558 d!69395))

(declare-fun b!319681 () Bool)

(declare-fun e!198513 () SeekEntryResult!2816)

(declare-fun lt!155876 () SeekEntryResult!2816)

(assert (=> b!319681 (= e!198513 (MissingZero!2816 (index!13442 lt!155876)))))

(declare-fun d!69397 () Bool)

(declare-fun lt!155877 () SeekEntryResult!2816)

(get-info :version)

(assert (=> d!69397 (and (or ((_ is Undefined!2816) lt!155877) (not ((_ is Found!2816) lt!155877)) (and (bvsge (index!13441 lt!155877) #b00000000000000000000000000000000) (bvslt (index!13441 lt!155877) (size!8072 a!3305)))) (or ((_ is Undefined!2816) lt!155877) ((_ is Found!2816) lt!155877) (not ((_ is MissingZero!2816) lt!155877)) (and (bvsge (index!13440 lt!155877) #b00000000000000000000000000000000) (bvslt (index!13440 lt!155877) (size!8072 a!3305)))) (or ((_ is Undefined!2816) lt!155877) ((_ is Found!2816) lt!155877) ((_ is MissingZero!2816) lt!155877) (not ((_ is MissingVacant!2816) lt!155877)) (and (bvsge (index!13443 lt!155877) #b00000000000000000000000000000000) (bvslt (index!13443 lt!155877) (size!8072 a!3305)))) (or ((_ is Undefined!2816) lt!155877) (ite ((_ is Found!2816) lt!155877) (= (select (arr!7720 a!3305) (index!13441 lt!155877)) k0!2497) (ite ((_ is MissingZero!2816) lt!155877) (= (select (arr!7720 a!3305) (index!13440 lt!155877)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2816) lt!155877) (= (select (arr!7720 a!3305) (index!13443 lt!155877)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!198512 () SeekEntryResult!2816)

(assert (=> d!69397 (= lt!155877 e!198512)))

(declare-fun c!50431 () Bool)

(assert (=> d!69397 (= c!50431 (and ((_ is Intermediate!2816) lt!155876) (undefined!3628 lt!155876)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16314 (_ BitVec 32)) SeekEntryResult!2816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69397 (= lt!155876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69397 (validMask!0 mask!3777)))

(assert (=> d!69397 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!155877)))

(declare-fun b!319682 () Bool)

(assert (=> b!319682 (= e!198512 Undefined!2816)))

(declare-fun b!319683 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16314 (_ BitVec 32)) SeekEntryResult!2816)

(assert (=> b!319683 (= e!198513 (seekKeyOrZeroReturnVacant!0 (x!31823 lt!155876) (index!13442 lt!155876) (index!13442 lt!155876) k0!2497 a!3305 mask!3777))))

(declare-fun b!319684 () Bool)

(declare-fun e!198511 () SeekEntryResult!2816)

(assert (=> b!319684 (= e!198511 (Found!2816 (index!13442 lt!155876)))))

(declare-fun b!319685 () Bool)

(declare-fun c!50432 () Bool)

(declare-fun lt!155875 () (_ BitVec 64))

(assert (=> b!319685 (= c!50432 (= lt!155875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!319685 (= e!198511 e!198513)))

(declare-fun b!319686 () Bool)

(assert (=> b!319686 (= e!198512 e!198511)))

(assert (=> b!319686 (= lt!155875 (select (arr!7720 a!3305) (index!13442 lt!155876)))))

(declare-fun c!50430 () Bool)

(assert (=> b!319686 (= c!50430 (= lt!155875 k0!2497))))

(assert (= (and d!69397 c!50431) b!319682))

(assert (= (and d!69397 (not c!50431)) b!319686))

(assert (= (and b!319686 c!50430) b!319684))

(assert (= (and b!319686 (not c!50430)) b!319685))

(assert (= (and b!319685 c!50432) b!319681))

(assert (= (and b!319685 (not c!50432)) b!319683))

(declare-fun m!328431 () Bool)

(assert (=> d!69397 m!328431))

(declare-fun m!328433 () Bool)

(assert (=> d!69397 m!328433))

(declare-fun m!328435 () Bool)

(assert (=> d!69397 m!328435))

(assert (=> d!69397 m!328433))

(declare-fun m!328437 () Bool)

(assert (=> d!69397 m!328437))

(assert (=> d!69397 m!328347))

(declare-fun m!328439 () Bool)

(assert (=> d!69397 m!328439))

(declare-fun m!328441 () Bool)

(assert (=> b!319683 m!328441))

(declare-fun m!328443 () Bool)

(assert (=> b!319686 m!328443))

(assert (=> b!319557 d!69397))

(check-sat (not d!69397) (not bm!26024) (not b!319632) (not b!319683) (not b!319623) (not b!319624))
(check-sat)
