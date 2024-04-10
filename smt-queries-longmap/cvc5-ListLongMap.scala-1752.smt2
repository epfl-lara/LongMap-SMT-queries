; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32068 () Bool)

(assert start!32068)

(declare-fun b!319932 () Bool)

(declare-fun res!174246 () Bool)

(declare-fun e!198615 () Bool)

(assert (=> b!319932 (=> (not res!174246) (not e!198615))))

(declare-datatypes ((array!16342 0))(
  ( (array!16343 (arr!7733 (Array (_ BitVec 32) (_ BitVec 64))) (size!8085 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16342)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2864 0))(
  ( (MissingZero!2864 (index!13632 (_ BitVec 32))) (Found!2864 (index!13633 (_ BitVec 32))) (Intermediate!2864 (undefined!3676 Bool) (index!13634 (_ BitVec 32)) (x!31906 (_ BitVec 32))) (Undefined!2864) (MissingVacant!2864 (index!13635 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16342 (_ BitVec 32)) SeekEntryResult!2864)

(assert (=> b!319932 (= res!174246 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2864 i!1250)))))

(declare-fun b!319933 () Bool)

(declare-fun res!174244 () Bool)

(assert (=> b!319933 (=> (not res!174244) (not e!198615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16342 (_ BitVec 32)) Bool)

(assert (=> b!319933 (= res!174244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174248 () Bool)

(assert (=> start!32068 (=> (not res!174248) (not e!198615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32068 (= res!174248 (validMask!0 mask!3777))))

(assert (=> start!32068 e!198615))

(assert (=> start!32068 true))

(declare-fun array_inv!5696 (array!16342) Bool)

(assert (=> start!32068 (array_inv!5696 a!3305)))

(declare-fun b!319934 () Bool)

(declare-fun res!174245 () Bool)

(assert (=> b!319934 (=> (not res!174245) (not e!198615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319934 (= res!174245 (validKeyInArray!0 k!2497))))

(declare-fun b!319935 () Bool)

(declare-fun res!174249 () Bool)

(assert (=> b!319935 (=> (not res!174249) (not e!198615))))

(declare-fun arrayContainsKey!0 (array!16342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319935 (= res!174249 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319936 () Bool)

(declare-fun res!174247 () Bool)

(assert (=> b!319936 (=> (not res!174247) (not e!198615))))

(assert (=> b!319936 (= res!174247 (and (= (size!8085 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8085 a!3305))))))

(declare-fun b!319937 () Bool)

(declare-fun lt!155898 () (_ BitVec 32))

(assert (=> b!319937 (= e!198615 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!155898 #b00000000000000000000000000000000) (bvsge lt!155898 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319937 (= lt!155898 (toIndex!0 k!2497 mask!3777))))

(assert (= (and start!32068 res!174248) b!319936))

(assert (= (and b!319936 res!174247) b!319934))

(assert (= (and b!319934 res!174245) b!319935))

(assert (= (and b!319935 res!174249) b!319932))

(assert (= (and b!319932 res!174246) b!319933))

(assert (= (and b!319933 res!174244) b!319937))

(declare-fun m!328409 () Bool)

(assert (=> b!319932 m!328409))

(declare-fun m!328411 () Bool)

(assert (=> b!319933 m!328411))

(declare-fun m!328413 () Bool)

(assert (=> start!32068 m!328413))

(declare-fun m!328415 () Bool)

(assert (=> start!32068 m!328415))

(declare-fun m!328417 () Bool)

(assert (=> b!319937 m!328417))

(declare-fun m!328419 () Bool)

(assert (=> b!319935 m!328419))

(declare-fun m!328421 () Bool)

(assert (=> b!319934 m!328421))

(push 1)

(assert (not start!32068))

(assert (not b!319934))

(assert (not b!319932))

(assert (not b!319935))

(assert (not b!319937))

(assert (not b!319933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69391 () Bool)

(assert (=> d!69391 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319934 d!69391))

(declare-fun d!69393 () Bool)

(declare-fun res!174296 () Bool)

(declare-fun e!198639 () Bool)

(assert (=> d!69393 (=> res!174296 e!198639)))

(assert (=> d!69393 (= res!174296 (= (select (arr!7733 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69393 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!198639)))

(declare-fun b!319984 () Bool)

(declare-fun e!198640 () Bool)

(assert (=> b!319984 (= e!198639 e!198640)))

(declare-fun res!174297 () Bool)

(assert (=> b!319984 (=> (not res!174297) (not e!198640))))

(assert (=> b!319984 (= res!174297 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8085 a!3305)))))

(declare-fun b!319985 () Bool)

(assert (=> b!319985 (= e!198640 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69393 (not res!174296)) b!319984))

(assert (= (and b!319984 res!174297) b!319985))

(declare-fun m!328455 () Bool)

(assert (=> d!69393 m!328455))

(declare-fun m!328457 () Bool)

(assert (=> b!319985 m!328457))

(assert (=> b!319935 d!69393))

(declare-fun d!69397 () Bool)

(assert (=> d!69397 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32068 d!69397))

(declare-fun d!69405 () Bool)

(assert (=> d!69405 (= (array_inv!5696 a!3305) (bvsge (size!8085 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32068 d!69405))

(declare-fun d!69407 () Bool)

(declare-fun lt!155928 () (_ BitVec 32))

(declare-fun lt!155927 () (_ BitVec 32))

(assert (=> d!69407 (= lt!155928 (bvmul (bvxor lt!155927 (bvlshr lt!155927 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69407 (= lt!155927 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69407 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174308 (let ((h!5382 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31909 (bvmul (bvxor h!5382 (bvlshr h!5382 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31909 (bvlshr x!31909 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174308 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174308 #b00000000000000000000000000000000))))))

(assert (=> d!69407 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!155928 (bvlshr lt!155928 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!319937 d!69407))

(declare-fun b!320058 () Bool)

(declare-fun e!198683 () SeekEntryResult!2864)

(assert (=> b!320058 (= e!198683 Undefined!2864)))

(declare-fun b!320059 () Bool)

(declare-fun e!198685 () SeekEntryResult!2864)

(assert (=> b!320059 (= e!198683 e!198685)))

(declare-fun lt!155960 () (_ BitVec 64))

(declare-fun lt!155961 () SeekEntryResult!2864)

(assert (=> b!320059 (= lt!155960 (select (arr!7733 a!3305) (index!13634 lt!155961)))))

(declare-fun c!50499 () Bool)

(assert (=> b!320059 (= c!50499 (= lt!155960 k!2497))))

(declare-fun b!320060 () Bool)

(declare-fun c!50497 () Bool)

(assert (=> b!320060 (= c!50497 (= lt!155960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198684 () SeekEntryResult!2864)

(assert (=> b!320060 (= e!198685 e!198684)))

(declare-fun b!320061 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16342 (_ BitVec 32)) SeekEntryResult!2864)

(assert (=> b!320061 (= e!198684 (seekKeyOrZeroReturnVacant!0 (x!31906 lt!155961) (index!13634 lt!155961) (index!13634 lt!155961) k!2497 a!3305 mask!3777))))

(declare-fun b!320062 () Bool)

(assert (=> b!320062 (= e!198684 (MissingZero!2864 (index!13634 lt!155961)))))

(declare-fun b!320063 () Bool)

(assert (=> b!320063 (= e!198685 (Found!2864 (index!13634 lt!155961)))))

(declare-fun d!69411 () Bool)

(declare-fun lt!155959 () SeekEntryResult!2864)

(assert (=> d!69411 (and (or (is-Undefined!2864 lt!155959) (not (is-Found!2864 lt!155959)) (and (bvsge (index!13633 lt!155959) #b00000000000000000000000000000000) (bvslt (index!13633 lt!155959) (size!8085 a!3305)))) (or (is-Undefined!2864 lt!155959) (is-Found!2864 lt!155959) (not (is-MissingZero!2864 lt!155959)) (and (bvsge (index!13632 lt!155959) #b00000000000000000000000000000000) (bvslt (index!13632 lt!155959) (size!8085 a!3305)))) (or (is-Undefined!2864 lt!155959) (is-Found!2864 lt!155959) (is-MissingZero!2864 lt!155959) (not (is-MissingVacant!2864 lt!155959)) (and (bvsge (index!13635 lt!155959) #b00000000000000000000000000000000) (bvslt (index!13635 lt!155959) (size!8085 a!3305)))) (or (is-Undefined!2864 lt!155959) (ite (is-Found!2864 lt!155959) (= (select (arr!7733 a!3305) (index!13633 lt!155959)) k!2497) (ite (is-MissingZero!2864 lt!155959) (= (select (arr!7733 a!3305) (index!13632 lt!155959)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2864 lt!155959) (= (select (arr!7733 a!3305) (index!13635 lt!155959)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69411 (= lt!155959 e!198683)))

(declare-fun c!50498 () Bool)

(assert (=> d!69411 (= c!50498 (and (is-Intermediate!2864 lt!155961) (undefined!3676 lt!155961)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16342 (_ BitVec 32)) SeekEntryResult!2864)

(assert (=> d!69411 (= lt!155961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69411 (validMask!0 mask!3777)))

(assert (=> d!69411 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!155959)))

(assert (= (and d!69411 c!50498) b!320058))

(assert (= (and d!69411 (not c!50498)) b!320059))

(assert (= (and b!320059 c!50499) b!320063))

(assert (= (and b!320059 (not c!50499)) b!320060))

(assert (= (and b!320060 c!50497) b!320062))

(assert (= (and b!320060 (not c!50497)) b!320061))

(declare-fun m!328505 () Bool)

(assert (=> b!320059 m!328505))

(declare-fun m!328507 () Bool)

(assert (=> b!320061 m!328507))

(assert (=> d!69411 m!328417))

(declare-fun m!328509 () Bool)

(assert (=> d!69411 m!328509))

(declare-fun m!328511 () Bool)

(assert (=> d!69411 m!328511))

(declare-fun m!328513 () Bool)

(assert (=> d!69411 m!328513))

(assert (=> d!69411 m!328413))

(assert (=> d!69411 m!328417))

(declare-fun m!328515 () Bool)

(assert (=> d!69411 m!328515))

(assert (=> b!319932 d!69411))

(declare-fun b!320072 () Bool)

(declare-fun e!198694 () Bool)

(declare-fun call!26053 () Bool)

(assert (=> b!320072 (= e!198694 call!26053)))

(declare-fun b!320073 () Bool)

(declare-fun e!198692 () Bool)

(declare-fun e!198693 () Bool)

(assert (=> b!320073 (= e!198692 e!198693)))

(declare-fun c!50502 () Bool)

(assert (=> b!320073 (= c!50502 (validKeyInArray!0 (select (arr!7733 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26050 () Bool)

(assert (=> bm!26050 (= call!26053 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!320074 () Bool)

(assert (=> b!320074 (= e!198693 call!26053)))

(declare-fun b!320075 () Bool)

(assert (=> b!320075 (= e!198693 e!198694)))

(declare-fun lt!155969 () (_ BitVec 64))

(assert (=> b!320075 (= lt!155969 (select (arr!7733 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9822 0))(
  ( (Unit!9823) )
))
(declare-fun lt!155968 () Unit!9822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16342 (_ BitVec 64) (_ BitVec 32)) Unit!9822)

(assert (=> b!320075 (= lt!155968 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155969 #b00000000000000000000000000000000))))

(assert (=> b!320075 (arrayContainsKey!0 a!3305 lt!155969 #b00000000000000000000000000000000)))

(declare-fun lt!155970 () Unit!9822)

(assert (=> b!320075 (= lt!155970 lt!155968)))

(declare-fun res!174318 () Bool)

(assert (=> b!320075 (= res!174318 (= (seekEntryOrOpen!0 (select (arr!7733 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2864 #b00000000000000000000000000000000)))))

(assert (=> b!320075 (=> (not res!174318) (not e!198694))))

(declare-fun d!69421 () Bool)

(declare-fun res!174317 () Bool)

(assert (=> d!69421 (=> res!174317 e!198692)))

(assert (=> d!69421 (= res!174317 (bvsge #b00000000000000000000000000000000 (size!8085 a!3305)))))

(assert (=> d!69421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198692)))

(assert (= (and d!69421 (not res!174317)) b!320073))

(assert (= (and b!320073 c!50502) b!320075))

(assert (= (and b!320073 (not c!50502)) b!320074))

(assert (= (and b!320075 res!174318) b!320072))

(assert (= (or b!320072 b!320074) bm!26050))

(assert (=> b!320073 m!328455))

(assert (=> b!320073 m!328455))

(declare-fun m!328517 () Bool)

(assert (=> b!320073 m!328517))

(declare-fun m!328519 () Bool)

(assert (=> bm!26050 m!328519))

(assert (=> b!320075 m!328455))

(declare-fun m!328521 () Bool)

(assert (=> b!320075 m!328521))

(declare-fun m!328523 () Bool)

(assert (=> b!320075 m!328523))

(assert (=> b!320075 m!328455))

(declare-fun m!328525 () Bool)

(assert (=> b!320075 m!328525))

(assert (=> b!319933 d!69421))

(push 1)

(assert (not bm!26050))

(assert (not b!320061))

(assert (not d!69411))

(assert (not b!320075))

(assert (not b!320073))

(assert (not b!319985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

