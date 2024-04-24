; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29188 () Bool)

(assert start!29188)

(declare-fun b!296343 () Bool)

(declare-fun res!156117 () Bool)

(declare-fun e!187295 () Bool)

(assert (=> b!296343 (=> (not res!156117) (not e!187295))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14994 0))(
  ( (array!14995 (arr!7108 (Array (_ BitVec 32) (_ BitVec 64))) (size!7460 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14994)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!296343 (= res!156117 (and (= (size!7460 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7460 a!3312))))))

(declare-fun b!296344 () Bool)

(declare-fun e!187294 () Bool)

(declare-fun e!187291 () Bool)

(assert (=> b!296344 (= e!187294 e!187291)))

(declare-fun res!156120 () Bool)

(assert (=> b!296344 (=> (not res!156120) (not e!187291))))

(declare-datatypes ((SeekEntryResult!2222 0))(
  ( (MissingZero!2222 (index!11058 (_ BitVec 32))) (Found!2222 (index!11059 (_ BitVec 32))) (Intermediate!2222 (undefined!3034 Bool) (index!11060 (_ BitVec 32)) (x!29379 (_ BitVec 32))) (Undefined!2222) (MissingVacant!2222 (index!11061 (_ BitVec 32))) )
))
(declare-fun lt!147165 () SeekEntryResult!2222)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!147160 () Bool)

(assert (=> b!296344 (= res!156120 (and (or lt!147160 (not (undefined!3034 lt!147165))) (or lt!147160 (not (= (select (arr!7108 a!3312) (index!11060 lt!147165)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147160 (not (= (select (arr!7108 a!3312) (index!11060 lt!147165)) k0!2524))) (not lt!147160)))))

(get-info :version)

(assert (=> b!296344 (= lt!147160 (not ((_ is Intermediate!2222) lt!147165)))))

(declare-fun b!296345 () Bool)

(declare-fun res!156116 () Bool)

(assert (=> b!296345 (=> (not res!156116) (not e!187295))))

(declare-fun arrayContainsKey!0 (array!14994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296345 (= res!156116 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296346 () Bool)

(declare-fun e!187293 () Bool)

(assert (=> b!296346 (= e!187295 e!187293)))

(declare-fun res!156113 () Bool)

(assert (=> b!296346 (=> (not res!156113) (not e!187293))))

(declare-fun lt!147163 () Bool)

(declare-fun lt!147162 () SeekEntryResult!2222)

(assert (=> b!296346 (= res!156113 (or lt!147163 (= lt!147162 (MissingVacant!2222 i!1256))))))

(assert (=> b!296346 (= lt!147163 (= lt!147162 (MissingZero!2222 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14994 (_ BitVec 32)) SeekEntryResult!2222)

(assert (=> b!296346 (= lt!147162 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296347 () Bool)

(declare-fun res!156114 () Bool)

(assert (=> b!296347 (=> (not res!156114) (not e!187293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14994 (_ BitVec 32)) Bool)

(assert (=> b!296347 (= res!156114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296348 () Bool)

(assert (=> b!296348 (= e!187293 e!187294)))

(declare-fun res!156115 () Bool)

(assert (=> b!296348 (=> (not res!156115) (not e!187294))))

(assert (=> b!296348 (= res!156115 lt!147163)))

(declare-fun lt!147161 () SeekEntryResult!2222)

(declare-fun lt!147164 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14994 (_ BitVec 32)) SeekEntryResult!2222)

(assert (=> b!296348 (= lt!147161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147164 k0!2524 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312)) mask!3809))))

(assert (=> b!296348 (= lt!147165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147164 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296348 (= lt!147164 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296349 () Bool)

(declare-fun res!156119 () Bool)

(assert (=> b!296349 (=> (not res!156119) (not e!187295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296349 (= res!156119 (validKeyInArray!0 k0!2524))))

(declare-fun res!156118 () Bool)

(assert (=> start!29188 (=> (not res!156118) (not e!187295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29188 (= res!156118 (validMask!0 mask!3809))))

(assert (=> start!29188 e!187295))

(assert (=> start!29188 true))

(declare-fun array_inv!5058 (array!14994) Bool)

(assert (=> start!29188 (array_inv!5058 a!3312)))

(declare-fun b!296350 () Bool)

(assert (=> b!296350 (= e!187291 (not (or (not (= lt!147165 (Intermediate!2222 false (index!11060 lt!147165) (x!29379 lt!147165)))) (bvsle #b00000000000000000000000000000000 (x!29379 lt!147165)))))))

(assert (=> b!296350 (and (= (select (arr!7108 a!3312) (index!11060 lt!147165)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11060 lt!147165) i!1256))))

(assert (= (and start!29188 res!156118) b!296343))

(assert (= (and b!296343 res!156117) b!296349))

(assert (= (and b!296349 res!156119) b!296345))

(assert (= (and b!296345 res!156116) b!296346))

(assert (= (and b!296346 res!156113) b!296347))

(assert (= (and b!296347 res!156114) b!296348))

(assert (= (and b!296348 res!156115) b!296344))

(assert (= (and b!296344 res!156120) b!296350))

(declare-fun m!309545 () Bool)

(assert (=> b!296348 m!309545))

(declare-fun m!309547 () Bool)

(assert (=> b!296348 m!309547))

(declare-fun m!309549 () Bool)

(assert (=> b!296348 m!309549))

(declare-fun m!309551 () Bool)

(assert (=> b!296348 m!309551))

(declare-fun m!309553 () Bool)

(assert (=> b!296345 m!309553))

(declare-fun m!309555 () Bool)

(assert (=> b!296346 m!309555))

(declare-fun m!309557 () Bool)

(assert (=> b!296349 m!309557))

(declare-fun m!309559 () Bool)

(assert (=> start!29188 m!309559))

(declare-fun m!309561 () Bool)

(assert (=> start!29188 m!309561))

(declare-fun m!309563 () Bool)

(assert (=> b!296350 m!309563))

(declare-fun m!309565 () Bool)

(assert (=> b!296347 m!309565))

(assert (=> b!296344 m!309563))

(check-sat (not b!296345) (not b!296348) (not b!296346) (not b!296349) (not start!29188) (not b!296347))
(check-sat)
(get-model)

(declare-fun d!67109 () Bool)

(declare-fun lt!147208 () SeekEntryResult!2222)

(assert (=> d!67109 (and (or ((_ is Undefined!2222) lt!147208) (not ((_ is Found!2222) lt!147208)) (and (bvsge (index!11059 lt!147208) #b00000000000000000000000000000000) (bvslt (index!11059 lt!147208) (size!7460 a!3312)))) (or ((_ is Undefined!2222) lt!147208) ((_ is Found!2222) lt!147208) (not ((_ is MissingZero!2222) lt!147208)) (and (bvsge (index!11058 lt!147208) #b00000000000000000000000000000000) (bvslt (index!11058 lt!147208) (size!7460 a!3312)))) (or ((_ is Undefined!2222) lt!147208) ((_ is Found!2222) lt!147208) ((_ is MissingZero!2222) lt!147208) (not ((_ is MissingVacant!2222) lt!147208)) (and (bvsge (index!11061 lt!147208) #b00000000000000000000000000000000) (bvslt (index!11061 lt!147208) (size!7460 a!3312)))) (or ((_ is Undefined!2222) lt!147208) (ite ((_ is Found!2222) lt!147208) (= (select (arr!7108 a!3312) (index!11059 lt!147208)) k0!2524) (ite ((_ is MissingZero!2222) lt!147208) (= (select (arr!7108 a!3312) (index!11058 lt!147208)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2222) lt!147208) (= (select (arr!7108 a!3312) (index!11061 lt!147208)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!187332 () SeekEntryResult!2222)

(assert (=> d!67109 (= lt!147208 e!187332)))

(declare-fun c!47699 () Bool)

(declare-fun lt!147209 () SeekEntryResult!2222)

(assert (=> d!67109 (= c!47699 (and ((_ is Intermediate!2222) lt!147209) (undefined!3034 lt!147209)))))

(assert (=> d!67109 (= lt!147209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67109 (validMask!0 mask!3809)))

(assert (=> d!67109 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147208)))

(declare-fun b!296411 () Bool)

(declare-fun e!187334 () SeekEntryResult!2222)

(assert (=> b!296411 (= e!187332 e!187334)))

(declare-fun lt!147210 () (_ BitVec 64))

(assert (=> b!296411 (= lt!147210 (select (arr!7108 a!3312) (index!11060 lt!147209)))))

(declare-fun c!47700 () Bool)

(assert (=> b!296411 (= c!47700 (= lt!147210 k0!2524))))

(declare-fun b!296412 () Bool)

(assert (=> b!296412 (= e!187332 Undefined!2222)))

(declare-fun b!296413 () Bool)

(declare-fun c!47701 () Bool)

(assert (=> b!296413 (= c!47701 (= lt!147210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187333 () SeekEntryResult!2222)

(assert (=> b!296413 (= e!187334 e!187333)))

(declare-fun b!296414 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14994 (_ BitVec 32)) SeekEntryResult!2222)

(assert (=> b!296414 (= e!187333 (seekKeyOrZeroReturnVacant!0 (x!29379 lt!147209) (index!11060 lt!147209) (index!11060 lt!147209) k0!2524 a!3312 mask!3809))))

(declare-fun b!296415 () Bool)

(assert (=> b!296415 (= e!187334 (Found!2222 (index!11060 lt!147209)))))

(declare-fun b!296416 () Bool)

(assert (=> b!296416 (= e!187333 (MissingZero!2222 (index!11060 lt!147209)))))

(assert (= (and d!67109 c!47699) b!296412))

(assert (= (and d!67109 (not c!47699)) b!296411))

(assert (= (and b!296411 c!47700) b!296415))

(assert (= (and b!296411 (not c!47700)) b!296413))

(assert (= (and b!296413 c!47701) b!296416))

(assert (= (and b!296413 (not c!47701)) b!296414))

(assert (=> d!67109 m!309551))

(declare-fun m!309611 () Bool)

(assert (=> d!67109 m!309611))

(declare-fun m!309613 () Bool)

(assert (=> d!67109 m!309613))

(declare-fun m!309615 () Bool)

(assert (=> d!67109 m!309615))

(declare-fun m!309617 () Bool)

(assert (=> d!67109 m!309617))

(assert (=> d!67109 m!309551))

(assert (=> d!67109 m!309559))

(declare-fun m!309619 () Bool)

(assert (=> b!296411 m!309619))

(declare-fun m!309621 () Bool)

(assert (=> b!296414 m!309621))

(assert (=> b!296346 d!67109))

(declare-fun d!67113 () Bool)

(declare-fun res!156173 () Bool)

(declare-fun e!187339 () Bool)

(assert (=> d!67113 (=> res!156173 e!187339)))

(assert (=> d!67113 (= res!156173 (= (select (arr!7108 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67113 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!187339)))

(declare-fun b!296421 () Bool)

(declare-fun e!187340 () Bool)

(assert (=> b!296421 (= e!187339 e!187340)))

(declare-fun res!156174 () Bool)

(assert (=> b!296421 (=> (not res!156174) (not e!187340))))

(assert (=> b!296421 (= res!156174 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7460 a!3312)))))

(declare-fun b!296422 () Bool)

(assert (=> b!296422 (= e!187340 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67113 (not res!156173)) b!296421))

(assert (= (and b!296421 res!156174) b!296422))

(declare-fun m!309623 () Bool)

(assert (=> d!67113 m!309623))

(declare-fun m!309625 () Bool)

(assert (=> b!296422 m!309625))

(assert (=> b!296345 d!67113))

(declare-fun b!296474 () Bool)

(declare-fun e!187372 () SeekEntryResult!2222)

(assert (=> b!296474 (= e!187372 (Intermediate!2222 false lt!147164 #b00000000000000000000000000000000))))

(declare-fun b!296475 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296475 (= e!187372 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312)) mask!3809))))

(declare-fun lt!147221 () SeekEntryResult!2222)

(declare-fun b!296476 () Bool)

(assert (=> b!296476 (and (bvsge (index!11060 lt!147221) #b00000000000000000000000000000000) (bvslt (index!11060 lt!147221) (size!7460 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312)))))))

(declare-fun res!156196 () Bool)

(assert (=> b!296476 (= res!156196 (= (select (arr!7108 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312))) (index!11060 lt!147221)) k0!2524))))

(declare-fun e!187376 () Bool)

(assert (=> b!296476 (=> res!156196 e!187376)))

(declare-fun e!187373 () Bool)

(assert (=> b!296476 (= e!187373 e!187376)))

(declare-fun b!296477 () Bool)

(assert (=> b!296477 (and (bvsge (index!11060 lt!147221) #b00000000000000000000000000000000) (bvslt (index!11060 lt!147221) (size!7460 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312)))))))

(assert (=> b!296477 (= e!187376 (= (select (arr!7108 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312))) (index!11060 lt!147221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296478 () Bool)

(declare-fun e!187375 () Bool)

(assert (=> b!296478 (= e!187375 (bvsge (x!29379 lt!147221) #b01111111111111111111111111111110))))

(declare-fun b!296479 () Bool)

(declare-fun e!187374 () SeekEntryResult!2222)

(assert (=> b!296479 (= e!187374 (Intermediate!2222 true lt!147164 #b00000000000000000000000000000000))))

(declare-fun b!296480 () Bool)

(assert (=> b!296480 (= e!187374 e!187372)))

(declare-fun c!47718 () Bool)

(declare-fun lt!147222 () (_ BitVec 64))

(assert (=> b!296480 (= c!47718 (or (= lt!147222 k0!2524) (= (bvadd lt!147222 lt!147222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296481 () Bool)

(assert (=> b!296481 (and (bvsge (index!11060 lt!147221) #b00000000000000000000000000000000) (bvslt (index!11060 lt!147221) (size!7460 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312)))))))

(declare-fun res!156197 () Bool)

(assert (=> b!296481 (= res!156197 (= (select (arr!7108 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312))) (index!11060 lt!147221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296481 (=> res!156197 e!187376)))

(declare-fun b!296482 () Bool)

(assert (=> b!296482 (= e!187375 e!187373)))

(declare-fun res!156198 () Bool)

(assert (=> b!296482 (= res!156198 (and ((_ is Intermediate!2222) lt!147221) (not (undefined!3034 lt!147221)) (bvslt (x!29379 lt!147221) #b01111111111111111111111111111110) (bvsge (x!29379 lt!147221) #b00000000000000000000000000000000) (bvsge (x!29379 lt!147221) #b00000000000000000000000000000000)))))

(assert (=> b!296482 (=> (not res!156198) (not e!187373))))

(declare-fun d!67115 () Bool)

(assert (=> d!67115 e!187375))

(declare-fun c!47717 () Bool)

(assert (=> d!67115 (= c!47717 (and ((_ is Intermediate!2222) lt!147221) (undefined!3034 lt!147221)))))

(assert (=> d!67115 (= lt!147221 e!187374)))

(declare-fun c!47719 () Bool)

(assert (=> d!67115 (= c!47719 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67115 (= lt!147222 (select (arr!7108 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312))) lt!147164))))

(assert (=> d!67115 (validMask!0 mask!3809)))

(assert (=> d!67115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147164 k0!2524 (array!14995 (store (arr!7108 a!3312) i!1256 k0!2524) (size!7460 a!3312)) mask!3809) lt!147221)))

(assert (= (and d!67115 c!47719) b!296479))

(assert (= (and d!67115 (not c!47719)) b!296480))

(assert (= (and b!296480 c!47718) b!296474))

(assert (= (and b!296480 (not c!47718)) b!296475))

(assert (= (and d!67115 c!47717) b!296478))

(assert (= (and d!67115 (not c!47717)) b!296482))

(assert (= (and b!296482 res!156198) b!296476))

(assert (= (and b!296476 (not res!156196)) b!296481))

(assert (= (and b!296481 (not res!156197)) b!296477))

(declare-fun m!309633 () Bool)

(assert (=> b!296476 m!309633))

(assert (=> b!296477 m!309633))

(declare-fun m!309637 () Bool)

(assert (=> b!296475 m!309637))

(assert (=> b!296475 m!309637))

(declare-fun m!309641 () Bool)

(assert (=> b!296475 m!309641))

(assert (=> b!296481 m!309633))

(declare-fun m!309645 () Bool)

(assert (=> d!67115 m!309645))

(assert (=> d!67115 m!309559))

(assert (=> b!296348 d!67115))

(declare-fun b!296500 () Bool)

(declare-fun e!187386 () SeekEntryResult!2222)

(assert (=> b!296500 (= e!187386 (Intermediate!2222 false lt!147164 #b00000000000000000000000000000000))))

(declare-fun b!296501 () Bool)

(assert (=> b!296501 (= e!187386 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!296502 () Bool)

(declare-fun lt!147229 () SeekEntryResult!2222)

(assert (=> b!296502 (and (bvsge (index!11060 lt!147229) #b00000000000000000000000000000000) (bvslt (index!11060 lt!147229) (size!7460 a!3312)))))

(declare-fun res!156202 () Bool)

(assert (=> b!296502 (= res!156202 (= (select (arr!7108 a!3312) (index!11060 lt!147229)) k0!2524))))

(declare-fun e!187390 () Bool)

(assert (=> b!296502 (=> res!156202 e!187390)))

(declare-fun e!187387 () Bool)

(assert (=> b!296502 (= e!187387 e!187390)))

(declare-fun b!296503 () Bool)

(assert (=> b!296503 (and (bvsge (index!11060 lt!147229) #b00000000000000000000000000000000) (bvslt (index!11060 lt!147229) (size!7460 a!3312)))))

(assert (=> b!296503 (= e!187390 (= (select (arr!7108 a!3312) (index!11060 lt!147229)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296504 () Bool)

(declare-fun e!187389 () Bool)

(assert (=> b!296504 (= e!187389 (bvsge (x!29379 lt!147229) #b01111111111111111111111111111110))))

(declare-fun b!296505 () Bool)

(declare-fun e!187388 () SeekEntryResult!2222)

(assert (=> b!296505 (= e!187388 (Intermediate!2222 true lt!147164 #b00000000000000000000000000000000))))

(declare-fun b!296506 () Bool)

(assert (=> b!296506 (= e!187388 e!187386)))

(declare-fun c!47728 () Bool)

(declare-fun lt!147230 () (_ BitVec 64))

(assert (=> b!296506 (= c!47728 (or (= lt!147230 k0!2524) (= (bvadd lt!147230 lt!147230) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296507 () Bool)

(assert (=> b!296507 (and (bvsge (index!11060 lt!147229) #b00000000000000000000000000000000) (bvslt (index!11060 lt!147229) (size!7460 a!3312)))))

(declare-fun res!156203 () Bool)

(assert (=> b!296507 (= res!156203 (= (select (arr!7108 a!3312) (index!11060 lt!147229)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296507 (=> res!156203 e!187390)))

(declare-fun b!296508 () Bool)

(assert (=> b!296508 (= e!187389 e!187387)))

(declare-fun res!156204 () Bool)

(assert (=> b!296508 (= res!156204 (and ((_ is Intermediate!2222) lt!147229) (not (undefined!3034 lt!147229)) (bvslt (x!29379 lt!147229) #b01111111111111111111111111111110) (bvsge (x!29379 lt!147229) #b00000000000000000000000000000000) (bvsge (x!29379 lt!147229) #b00000000000000000000000000000000)))))

(assert (=> b!296508 (=> (not res!156204) (not e!187387))))

(declare-fun d!67123 () Bool)

(assert (=> d!67123 e!187389))

(declare-fun c!47727 () Bool)

(assert (=> d!67123 (= c!47727 (and ((_ is Intermediate!2222) lt!147229) (undefined!3034 lt!147229)))))

(assert (=> d!67123 (= lt!147229 e!187388)))

(declare-fun c!47729 () Bool)

(assert (=> d!67123 (= c!47729 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67123 (= lt!147230 (select (arr!7108 a!3312) lt!147164))))

(assert (=> d!67123 (validMask!0 mask!3809)))

(assert (=> d!67123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147164 k0!2524 a!3312 mask!3809) lt!147229)))

(assert (= (and d!67123 c!47729) b!296505))

(assert (= (and d!67123 (not c!47729)) b!296506))

(assert (= (and b!296506 c!47728) b!296500))

(assert (= (and b!296506 (not c!47728)) b!296501))

(assert (= (and d!67123 c!47727) b!296504))

(assert (= (and d!67123 (not c!47727)) b!296508))

(assert (= (and b!296508 res!156204) b!296502))

(assert (= (and b!296502 (not res!156202)) b!296507))

(assert (= (and b!296507 (not res!156203)) b!296503))

(declare-fun m!309647 () Bool)

(assert (=> b!296502 m!309647))

(assert (=> b!296503 m!309647))

(assert (=> b!296501 m!309637))

(assert (=> b!296501 m!309637))

(declare-fun m!309653 () Bool)

(assert (=> b!296501 m!309653))

(assert (=> b!296507 m!309647))

(declare-fun m!309657 () Bool)

(assert (=> d!67123 m!309657))

(assert (=> d!67123 m!309559))

(assert (=> b!296348 d!67123))

(declare-fun d!67127 () Bool)

(declare-fun lt!147241 () (_ BitVec 32))

(declare-fun lt!147239 () (_ BitVec 32))

(assert (=> d!67127 (= lt!147241 (bvmul (bvxor lt!147239 (bvlshr lt!147239 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67127 (= lt!147239 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67127 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156206 (let ((h!5205 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29386 (bvmul (bvxor h!5205 (bvlshr h!5205 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29386 (bvlshr x!29386 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156206 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156206 #b00000000000000000000000000000000))))))

(assert (=> d!67127 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!147241 (bvlshr lt!147241 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296348 d!67127))

(declare-fun d!67130 () Bool)

(assert (=> d!67130 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296349 d!67130))

(declare-fun d!67135 () Bool)

(assert (=> d!67135 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29188 d!67135))

(declare-fun d!67147 () Bool)

(assert (=> d!67147 (= (array_inv!5058 a!3312) (bvsge (size!7460 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29188 d!67147))

(declare-fun b!296559 () Bool)

(declare-fun e!187425 () Bool)

(declare-fun e!187426 () Bool)

(assert (=> b!296559 (= e!187425 e!187426)))

(declare-fun lt!147267 () (_ BitVec 64))

(assert (=> b!296559 (= lt!147267 (select (arr!7108 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9188 0))(
  ( (Unit!9189) )
))
(declare-fun lt!147266 () Unit!9188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14994 (_ BitVec 64) (_ BitVec 32)) Unit!9188)

(assert (=> b!296559 (= lt!147266 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147267 #b00000000000000000000000000000000))))

(assert (=> b!296559 (arrayContainsKey!0 a!3312 lt!147267 #b00000000000000000000000000000000)))

(declare-fun lt!147265 () Unit!9188)

(assert (=> b!296559 (= lt!147265 lt!147266)))

(declare-fun res!156235 () Bool)

(assert (=> b!296559 (= res!156235 (= (seekEntryOrOpen!0 (select (arr!7108 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2222 #b00000000000000000000000000000000)))))

(assert (=> b!296559 (=> (not res!156235) (not e!187426))))

(declare-fun b!296560 () Bool)

(declare-fun call!25726 () Bool)

(assert (=> b!296560 (= e!187426 call!25726)))

(declare-fun b!296561 () Bool)

(declare-fun e!187427 () Bool)

(assert (=> b!296561 (= e!187427 e!187425)))

(declare-fun c!47742 () Bool)

(assert (=> b!296561 (= c!47742 (validKeyInArray!0 (select (arr!7108 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67149 () Bool)

(declare-fun res!156234 () Bool)

(assert (=> d!67149 (=> res!156234 e!187427)))

(assert (=> d!67149 (= res!156234 (bvsge #b00000000000000000000000000000000 (size!7460 a!3312)))))

(assert (=> d!67149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187427)))

(declare-fun bm!25723 () Bool)

(assert (=> bm!25723 (= call!25726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!296562 () Bool)

(assert (=> b!296562 (= e!187425 call!25726)))

(assert (= (and d!67149 (not res!156234)) b!296561))

(assert (= (and b!296561 c!47742) b!296559))

(assert (= (and b!296561 (not c!47742)) b!296562))

(assert (= (and b!296559 res!156235) b!296560))

(assert (= (or b!296560 b!296562) bm!25723))

(assert (=> b!296559 m!309623))

(declare-fun m!309677 () Bool)

(assert (=> b!296559 m!309677))

(declare-fun m!309679 () Bool)

(assert (=> b!296559 m!309679))

(assert (=> b!296559 m!309623))

(declare-fun m!309681 () Bool)

(assert (=> b!296559 m!309681))

(assert (=> b!296561 m!309623))

(assert (=> b!296561 m!309623))

(declare-fun m!309683 () Bool)

(assert (=> b!296561 m!309683))

(declare-fun m!309685 () Bool)

(assert (=> bm!25723 m!309685))

(assert (=> b!296347 d!67149))

(check-sat (not b!296475) (not b!296559) (not b!296501) (not b!296422) (not d!67109) (not d!67123) (not b!296414) (not d!67115) (not bm!25723) (not b!296561))
(check-sat)
