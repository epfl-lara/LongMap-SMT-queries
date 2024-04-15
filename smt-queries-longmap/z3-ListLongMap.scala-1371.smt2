; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26972 () Bool)

(assert start!26972)

(declare-fun b!279099 () Bool)

(declare-fun res!142408 () Bool)

(declare-fun e!177941 () Bool)

(assert (=> b!279099 (=> (not res!142408) (not e!177941))))

(declare-datatypes ((List!4366 0))(
  ( (Nil!4363) (Cons!4362 (h!5032 (_ BitVec 64)) (t!9439 List!4366)) )
))
(declare-fun noDuplicate!154 (List!4366) Bool)

(assert (=> b!279099 (= res!142408 (noDuplicate!154 Nil!4363))))

(declare-fun b!279100 () Bool)

(declare-fun res!142405 () Bool)

(assert (=> b!279100 (=> (not res!142405) (not e!177941))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279100 (= res!142405 (not (= startIndex!26 i!1267)))))

(declare-fun b!279102 () Bool)

(declare-fun res!142407 () Bool)

(declare-fun e!177940 () Bool)

(assert (=> b!279102 (=> (not res!142407) (not e!177940))))

(declare-datatypes ((array!13881 0))(
  ( (array!13882 (arr!6585 (Array (_ BitVec 32) (_ BitVec 64))) (size!6938 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13881)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279102 (= res!142407 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279103 () Bool)

(declare-fun res!142410 () Bool)

(assert (=> b!279103 (=> (not res!142410) (not e!177940))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!279103 (= res!142410 (and (= (size!6938 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6938 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6938 a!3325))))))

(declare-fun b!279104 () Bool)

(declare-fun res!142402 () Bool)

(assert (=> b!279104 (=> (not res!142402) (not e!177941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13881 (_ BitVec 32)) Bool)

(assert (=> b!279104 (= res!142402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279105 () Bool)

(declare-fun res!142411 () Bool)

(assert (=> b!279105 (=> (not res!142411) (not e!177941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279105 (= res!142411 (validKeyInArray!0 (select (arr!6585 a!3325) startIndex!26)))))

(declare-fun b!279106 () Bool)

(declare-fun e!177942 () Bool)

(declare-fun contains!1945 (List!4366 (_ BitVec 64)) Bool)

(assert (=> b!279106 (= e!177942 (contains!1945 Nil!4363 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279107 () Bool)

(declare-fun res!142401 () Bool)

(assert (=> b!279107 (=> (not res!142401) (not e!177940))))

(assert (=> b!279107 (= res!142401 (validKeyInArray!0 k0!2581))))

(declare-fun b!279108 () Bool)

(declare-fun res!142404 () Bool)

(assert (=> b!279108 (=> (not res!142404) (not e!177941))))

(assert (=> b!279108 (= res!142404 (and (bvslt (size!6938 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6938 a!3325))))))

(declare-fun res!142400 () Bool)

(assert (=> start!26972 (=> (not res!142400) (not e!177940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26972 (= res!142400 (validMask!0 mask!3868))))

(assert (=> start!26972 e!177940))

(declare-fun array_inv!4557 (array!13881) Bool)

(assert (=> start!26972 (array_inv!4557 a!3325)))

(assert (=> start!26972 true))

(declare-fun b!279101 () Bool)

(declare-fun res!142409 () Bool)

(assert (=> b!279101 (=> (not res!142409) (not e!177940))))

(declare-fun arrayNoDuplicates!0 (array!13881 (_ BitVec 32) List!4366) Bool)

(assert (=> b!279101 (= res!142409 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4363))))

(declare-fun b!279109 () Bool)

(assert (=> b!279109 (= e!177940 e!177941)))

(declare-fun res!142406 () Bool)

(assert (=> b!279109 (=> (not res!142406) (not e!177941))))

(declare-datatypes ((SeekEntryResult!1742 0))(
  ( (MissingZero!1742 (index!9138 (_ BitVec 32))) (Found!1742 (index!9139 (_ BitVec 32))) (Intermediate!1742 (undefined!2554 Bool) (index!9140 (_ BitVec 32)) (x!27403 (_ BitVec 32))) (Undefined!1742) (MissingVacant!1742 (index!9141 (_ BitVec 32))) )
))
(declare-fun lt!138402 () SeekEntryResult!1742)

(assert (=> b!279109 (= res!142406 (or (= lt!138402 (MissingZero!1742 i!1267)) (= lt!138402 (MissingVacant!1742 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13881 (_ BitVec 32)) SeekEntryResult!1742)

(assert (=> b!279109 (= lt!138402 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279110 () Bool)

(assert (=> b!279110 (= e!177941 e!177942)))

(declare-fun res!142403 () Bool)

(assert (=> b!279110 (=> res!142403 e!177942)))

(assert (=> b!279110 (= res!142403 (contains!1945 Nil!4363 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!26972 res!142400) b!279103))

(assert (= (and b!279103 res!142410) b!279107))

(assert (= (and b!279107 res!142401) b!279101))

(assert (= (and b!279101 res!142409) b!279102))

(assert (= (and b!279102 res!142407) b!279109))

(assert (= (and b!279109 res!142406) b!279104))

(assert (= (and b!279104 res!142402) b!279100))

(assert (= (and b!279100 res!142405) b!279105))

(assert (= (and b!279105 res!142411) b!279108))

(assert (= (and b!279108 res!142404) b!279099))

(assert (= (and b!279099 res!142408) b!279110))

(assert (= (and b!279110 (not res!142403)) b!279106))

(declare-fun m!293459 () Bool)

(assert (=> b!279099 m!293459))

(declare-fun m!293461 () Bool)

(assert (=> b!279110 m!293461))

(declare-fun m!293463 () Bool)

(assert (=> b!279101 m!293463))

(declare-fun m!293465 () Bool)

(assert (=> b!279102 m!293465))

(declare-fun m!293467 () Bool)

(assert (=> b!279107 m!293467))

(declare-fun m!293469 () Bool)

(assert (=> b!279104 m!293469))

(declare-fun m!293471 () Bool)

(assert (=> b!279105 m!293471))

(assert (=> b!279105 m!293471))

(declare-fun m!293473 () Bool)

(assert (=> b!279105 m!293473))

(declare-fun m!293475 () Bool)

(assert (=> start!26972 m!293475))

(declare-fun m!293477 () Bool)

(assert (=> start!26972 m!293477))

(declare-fun m!293479 () Bool)

(assert (=> b!279109 m!293479))

(declare-fun m!293481 () Bool)

(assert (=> b!279106 m!293481))

(check-sat (not b!279101) (not b!279105) (not b!279102) (not b!279107) (not b!279104) (not b!279110) (not b!279109) (not b!279106) (not b!279099) (not start!26972))
(check-sat)
(get-model)

(declare-fun d!64889 () Bool)

(assert (=> d!64889 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26972 d!64889))

(declare-fun d!64891 () Bool)

(assert (=> d!64891 (= (array_inv!4557 a!3325) (bvsge (size!6938 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26972 d!64891))

(declare-fun b!279233 () Bool)

(declare-fun e!178005 () SeekEntryResult!1742)

(assert (=> b!279233 (= e!178005 Undefined!1742)))

(declare-fun d!64895 () Bool)

(declare-fun lt!138420 () SeekEntryResult!1742)

(get-info :version)

(assert (=> d!64895 (and (or ((_ is Undefined!1742) lt!138420) (not ((_ is Found!1742) lt!138420)) (and (bvsge (index!9139 lt!138420) #b00000000000000000000000000000000) (bvslt (index!9139 lt!138420) (size!6938 a!3325)))) (or ((_ is Undefined!1742) lt!138420) ((_ is Found!1742) lt!138420) (not ((_ is MissingZero!1742) lt!138420)) (and (bvsge (index!9138 lt!138420) #b00000000000000000000000000000000) (bvslt (index!9138 lt!138420) (size!6938 a!3325)))) (or ((_ is Undefined!1742) lt!138420) ((_ is Found!1742) lt!138420) ((_ is MissingZero!1742) lt!138420) (not ((_ is MissingVacant!1742) lt!138420)) (and (bvsge (index!9141 lt!138420) #b00000000000000000000000000000000) (bvslt (index!9141 lt!138420) (size!6938 a!3325)))) (or ((_ is Undefined!1742) lt!138420) (ite ((_ is Found!1742) lt!138420) (= (select (arr!6585 a!3325) (index!9139 lt!138420)) k0!2581) (ite ((_ is MissingZero!1742) lt!138420) (= (select (arr!6585 a!3325) (index!9138 lt!138420)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1742) lt!138420) (= (select (arr!6585 a!3325) (index!9141 lt!138420)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64895 (= lt!138420 e!178005)))

(declare-fun c!45915 () Bool)

(declare-fun lt!138421 () SeekEntryResult!1742)

(assert (=> d!64895 (= c!45915 (and ((_ is Intermediate!1742) lt!138421) (undefined!2554 lt!138421)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13881 (_ BitVec 32)) SeekEntryResult!1742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64895 (= lt!138421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!64895 (validMask!0 mask!3868)))

(assert (=> d!64895 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138420)))

(declare-fun b!279234 () Bool)

(declare-fun c!45916 () Bool)

(declare-fun lt!138419 () (_ BitVec 64))

(assert (=> b!279234 (= c!45916 (= lt!138419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178007 () SeekEntryResult!1742)

(declare-fun e!178006 () SeekEntryResult!1742)

(assert (=> b!279234 (= e!178007 e!178006)))

(declare-fun b!279235 () Bool)

(assert (=> b!279235 (= e!178007 (Found!1742 (index!9140 lt!138421)))))

(declare-fun b!279236 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13881 (_ BitVec 32)) SeekEntryResult!1742)

(assert (=> b!279236 (= e!178006 (seekKeyOrZeroReturnVacant!0 (x!27403 lt!138421) (index!9140 lt!138421) (index!9140 lt!138421) k0!2581 a!3325 mask!3868))))

(declare-fun b!279237 () Bool)

(assert (=> b!279237 (= e!178005 e!178007)))

(assert (=> b!279237 (= lt!138419 (select (arr!6585 a!3325) (index!9140 lt!138421)))))

(declare-fun c!45914 () Bool)

(assert (=> b!279237 (= c!45914 (= lt!138419 k0!2581))))

(declare-fun b!279238 () Bool)

(assert (=> b!279238 (= e!178006 (MissingZero!1742 (index!9140 lt!138421)))))

(assert (= (and d!64895 c!45915) b!279233))

(assert (= (and d!64895 (not c!45915)) b!279237))

(assert (= (and b!279237 c!45914) b!279235))

(assert (= (and b!279237 (not c!45914)) b!279234))

(assert (= (and b!279234 c!45916) b!279238))

(assert (= (and b!279234 (not c!45916)) b!279236))

(declare-fun m!293557 () Bool)

(assert (=> d!64895 m!293557))

(declare-fun m!293559 () Bool)

(assert (=> d!64895 m!293559))

(declare-fun m!293561 () Bool)

(assert (=> d!64895 m!293561))

(assert (=> d!64895 m!293557))

(declare-fun m!293563 () Bool)

(assert (=> d!64895 m!293563))

(declare-fun m!293565 () Bool)

(assert (=> d!64895 m!293565))

(assert (=> d!64895 m!293475))

(declare-fun m!293567 () Bool)

(assert (=> b!279236 m!293567))

(declare-fun m!293569 () Bool)

(assert (=> b!279237 m!293569))

(assert (=> b!279109 d!64895))

(declare-fun d!64909 () Bool)

(declare-fun res!142514 () Bool)

(declare-fun e!178018 () Bool)

(assert (=> d!64909 (=> res!142514 e!178018)))

(assert (=> d!64909 (= res!142514 ((_ is Nil!4363) Nil!4363))))

(assert (=> d!64909 (= (noDuplicate!154 Nil!4363) e!178018)))

(declare-fun b!279255 () Bool)

(declare-fun e!178019 () Bool)

(assert (=> b!279255 (= e!178018 e!178019)))

(declare-fun res!142515 () Bool)

(assert (=> b!279255 (=> (not res!142515) (not e!178019))))

(assert (=> b!279255 (= res!142515 (not (contains!1945 (t!9439 Nil!4363) (h!5032 Nil!4363))))))

(declare-fun b!279256 () Bool)

(assert (=> b!279256 (= e!178019 (noDuplicate!154 (t!9439 Nil!4363)))))

(assert (= (and d!64909 (not res!142514)) b!279255))

(assert (= (and b!279255 res!142515) b!279256))

(declare-fun m!293571 () Bool)

(assert (=> b!279255 m!293571))

(declare-fun m!293573 () Bool)

(assert (=> b!279256 m!293573))

(assert (=> b!279099 d!64909))

(declare-fun b!279289 () Bool)

(declare-fun e!178043 () Bool)

(declare-fun call!25408 () Bool)

(assert (=> b!279289 (= e!178043 call!25408)))

(declare-fun bm!25405 () Bool)

(assert (=> bm!25405 (= call!25408 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!279291 () Bool)

(declare-fun e!178041 () Bool)

(assert (=> b!279291 (= e!178043 e!178041)))

(declare-fun lt!138447 () (_ BitVec 64))

(assert (=> b!279291 (= lt!138447 (select (arr!6585 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8764 0))(
  ( (Unit!8765) )
))
(declare-fun lt!138448 () Unit!8764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13881 (_ BitVec 64) (_ BitVec 32)) Unit!8764)

(assert (=> b!279291 (= lt!138448 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138447 #b00000000000000000000000000000000))))

(assert (=> b!279291 (arrayContainsKey!0 a!3325 lt!138447 #b00000000000000000000000000000000)))

(declare-fun lt!138446 () Unit!8764)

(assert (=> b!279291 (= lt!138446 lt!138448)))

(declare-fun res!142527 () Bool)

(assert (=> b!279291 (= res!142527 (= (seekEntryOrOpen!0 (select (arr!6585 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1742 #b00000000000000000000000000000000)))))

(assert (=> b!279291 (=> (not res!142527) (not e!178041))))

(declare-fun b!279292 () Bool)

(declare-fun e!178042 () Bool)

(assert (=> b!279292 (= e!178042 e!178043)))

(declare-fun c!45934 () Bool)

(assert (=> b!279292 (= c!45934 (validKeyInArray!0 (select (arr!6585 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279290 () Bool)

(assert (=> b!279290 (= e!178041 call!25408)))

(declare-fun d!64911 () Bool)

(declare-fun res!142526 () Bool)

(assert (=> d!64911 (=> res!142526 e!178042)))

(assert (=> d!64911 (= res!142526 (bvsge #b00000000000000000000000000000000 (size!6938 a!3325)))))

(assert (=> d!64911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178042)))

(assert (= (and d!64911 (not res!142526)) b!279292))

(assert (= (and b!279292 c!45934) b!279291))

(assert (= (and b!279292 (not c!45934)) b!279289))

(assert (= (and b!279291 res!142527) b!279290))

(assert (= (or b!279290 b!279289) bm!25405))

(declare-fun m!293595 () Bool)

(assert (=> bm!25405 m!293595))

(declare-fun m!293597 () Bool)

(assert (=> b!279291 m!293597))

(declare-fun m!293599 () Bool)

(assert (=> b!279291 m!293599))

(declare-fun m!293601 () Bool)

(assert (=> b!279291 m!293601))

(assert (=> b!279291 m!293597))

(declare-fun m!293603 () Bool)

(assert (=> b!279291 m!293603))

(assert (=> b!279292 m!293597))

(assert (=> b!279292 m!293597))

(declare-fun m!293605 () Bool)

(assert (=> b!279292 m!293605))

(assert (=> b!279104 d!64911))

(declare-fun d!64917 () Bool)

(assert (=> d!64917 (= (validKeyInArray!0 (select (arr!6585 a!3325) startIndex!26)) (and (not (= (select (arr!6585 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6585 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279105 d!64917))

(declare-fun d!64919 () Bool)

(declare-fun lt!138454 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!187 (List!4366) (InoxSet (_ BitVec 64)))

(assert (=> d!64919 (= lt!138454 (select (content!187 Nil!4363) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178051 () Bool)

(assert (=> d!64919 (= lt!138454 e!178051)))

(declare-fun res!142532 () Bool)

(assert (=> d!64919 (=> (not res!142532) (not e!178051))))

(assert (=> d!64919 (= res!142532 ((_ is Cons!4362) Nil!4363))))

(assert (=> d!64919 (= (contains!1945 Nil!4363 #b0000000000000000000000000000000000000000000000000000000000000000) lt!138454)))

(declare-fun b!279303 () Bool)

(declare-fun e!178052 () Bool)

(assert (=> b!279303 (= e!178051 e!178052)))

(declare-fun res!142533 () Bool)

(assert (=> b!279303 (=> res!142533 e!178052)))

(assert (=> b!279303 (= res!142533 (= (h!5032 Nil!4363) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279304 () Bool)

(assert (=> b!279304 (= e!178052 (contains!1945 (t!9439 Nil!4363) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64919 res!142532) b!279303))

(assert (= (and b!279303 (not res!142533)) b!279304))

(declare-fun m!293621 () Bool)

(assert (=> d!64919 m!293621))

(declare-fun m!293623 () Bool)

(assert (=> d!64919 m!293623))

(declare-fun m!293625 () Bool)

(assert (=> b!279304 m!293625))

(assert (=> b!279110 d!64919))

(declare-fun d!64923 () Bool)

(declare-fun res!142549 () Bool)

(declare-fun e!178072 () Bool)

(assert (=> d!64923 (=> res!142549 e!178072)))

(assert (=> d!64923 (= res!142549 (bvsge #b00000000000000000000000000000000 (size!6938 a!3325)))))

(assert (=> d!64923 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4363) e!178072)))

(declare-fun bm!25410 () Bool)

(declare-fun call!25413 () Bool)

(declare-fun c!45942 () Bool)

(assert (=> bm!25410 (= call!25413 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45942 (Cons!4362 (select (arr!6585 a!3325) #b00000000000000000000000000000000) Nil!4363) Nil!4363)))))

(declare-fun b!279327 () Bool)

(declare-fun e!178074 () Bool)

(declare-fun e!178073 () Bool)

(assert (=> b!279327 (= e!178074 e!178073)))

(assert (=> b!279327 (= c!45942 (validKeyInArray!0 (select (arr!6585 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279328 () Bool)

(assert (=> b!279328 (= e!178073 call!25413)))

(declare-fun b!279329 () Bool)

(assert (=> b!279329 (= e!178073 call!25413)))

(declare-fun b!279330 () Bool)

(assert (=> b!279330 (= e!178072 e!178074)))

(declare-fun res!142548 () Bool)

(assert (=> b!279330 (=> (not res!142548) (not e!178074))))

(declare-fun e!178071 () Bool)

(assert (=> b!279330 (= res!142548 (not e!178071))))

(declare-fun res!142550 () Bool)

(assert (=> b!279330 (=> (not res!142550) (not e!178071))))

(assert (=> b!279330 (= res!142550 (validKeyInArray!0 (select (arr!6585 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279331 () Bool)

(assert (=> b!279331 (= e!178071 (contains!1945 Nil!4363 (select (arr!6585 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64923 (not res!142549)) b!279330))

(assert (= (and b!279330 res!142550) b!279331))

(assert (= (and b!279330 res!142548) b!279327))

(assert (= (and b!279327 c!45942) b!279329))

(assert (= (and b!279327 (not c!45942)) b!279328))

(assert (= (or b!279329 b!279328) bm!25410))

(assert (=> bm!25410 m!293597))

(declare-fun m!293631 () Bool)

(assert (=> bm!25410 m!293631))

(assert (=> b!279327 m!293597))

(assert (=> b!279327 m!293597))

(assert (=> b!279327 m!293605))

(assert (=> b!279330 m!293597))

(assert (=> b!279330 m!293597))

(assert (=> b!279330 m!293605))

(assert (=> b!279331 m!293597))

(assert (=> b!279331 m!293597))

(declare-fun m!293635 () Bool)

(assert (=> b!279331 m!293635))

(assert (=> b!279101 d!64923))

(declare-fun d!64931 () Bool)

(declare-fun lt!138464 () Bool)

(assert (=> d!64931 (= lt!138464 (select (content!187 Nil!4363) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178080 () Bool)

(assert (=> d!64931 (= lt!138464 e!178080)))

(declare-fun res!142555 () Bool)

(assert (=> d!64931 (=> (not res!142555) (not e!178080))))

(assert (=> d!64931 (= res!142555 ((_ is Cons!4362) Nil!4363))))

(assert (=> d!64931 (= (contains!1945 Nil!4363 #b1000000000000000000000000000000000000000000000000000000000000000) lt!138464)))

(declare-fun b!279338 () Bool)

(declare-fun e!178081 () Bool)

(assert (=> b!279338 (= e!178080 e!178081)))

(declare-fun res!142556 () Bool)

(assert (=> b!279338 (=> res!142556 e!178081)))

(assert (=> b!279338 (= res!142556 (= (h!5032 Nil!4363) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279339 () Bool)

(assert (=> b!279339 (= e!178081 (contains!1945 (t!9439 Nil!4363) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64931 res!142555) b!279338))

(assert (= (and b!279338 (not res!142556)) b!279339))

(assert (=> d!64931 m!293621))

(declare-fun m!293643 () Bool)

(assert (=> d!64931 m!293643))

(declare-fun m!293645 () Bool)

(assert (=> b!279339 m!293645))

(assert (=> b!279106 d!64931))

(declare-fun d!64935 () Bool)

(assert (=> d!64935 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279107 d!64935))

(declare-fun d!64937 () Bool)

(declare-fun res!142573 () Bool)

(declare-fun e!178098 () Bool)

(assert (=> d!64937 (=> res!142573 e!178098)))

(assert (=> d!64937 (= res!142573 (= (select (arr!6585 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!64937 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!178098)))

(declare-fun b!279356 () Bool)

(declare-fun e!178099 () Bool)

(assert (=> b!279356 (= e!178098 e!178099)))

(declare-fun res!142574 () Bool)

(assert (=> b!279356 (=> (not res!142574) (not e!178099))))

(assert (=> b!279356 (= res!142574 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6938 a!3325)))))

(declare-fun b!279357 () Bool)

(assert (=> b!279357 (= e!178099 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64937 (not res!142573)) b!279356))

(assert (= (and b!279356 res!142574) b!279357))

(assert (=> d!64937 m!293597))

(declare-fun m!293651 () Bool)

(assert (=> b!279357 m!293651))

(assert (=> b!279102 d!64937))

(check-sat (not b!279330) (not b!279357) (not b!279339) (not b!279291) (not b!279236) (not bm!25405) (not b!279256) (not d!64895) (not bm!25410) (not b!279292) (not b!279331) (not b!279304) (not b!279327) (not b!279255) (not d!64931) (not d!64919))
(check-sat)
