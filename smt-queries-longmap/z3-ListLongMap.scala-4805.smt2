; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65958 () Bool)

(assert start!65958)

(declare-fun b!760277 () Bool)

(declare-fun e!423817 () Bool)

(declare-fun e!423811 () Bool)

(assert (=> b!760277 (= e!423817 e!423811)))

(declare-fun res!514439 () Bool)

(assert (=> b!760277 (=> (not res!514439) (not e!423811))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42068 0))(
  ( (array!42069 (arr!20146 (Array (_ BitVec 32) (_ BitVec 64))) (size!20567 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42068)

(declare-datatypes ((SeekEntryResult!7746 0))(
  ( (MissingZero!7746 (index!33352 (_ BitVec 32))) (Found!7746 (index!33353 (_ BitVec 32))) (Intermediate!7746 (undefined!8558 Bool) (index!33354 (_ BitVec 32)) (x!64241 (_ BitVec 32))) (Undefined!7746) (MissingVacant!7746 (index!33355 (_ BitVec 32))) )
))
(declare-fun lt!338750 () SeekEntryResult!7746)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42068 (_ BitVec 32)) SeekEntryResult!7746)

(assert (=> b!760277 (= res!514439 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338750))))

(assert (=> b!760277 (= lt!338750 (Found!7746 j!159))))

(declare-fun b!760278 () Bool)

(declare-fun res!514440 () Bool)

(declare-fun e!423814 () Bool)

(assert (=> b!760278 (=> (not res!514440) (not e!423814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42068 (_ BitVec 32)) Bool)

(assert (=> b!760278 (= res!514440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!760279 () Bool)

(declare-fun res!514441 () Bool)

(declare-fun e!423812 () Bool)

(assert (=> b!760279 (=> (not res!514441) (not e!423812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760279 (= res!514441 (validKeyInArray!0 (select (arr!20146 a!3186) j!159)))))

(declare-fun e!423813 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!760280 () Bool)

(declare-fun lt!338747 () SeekEntryResult!7746)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42068 (_ BitVec 32)) SeekEntryResult!7746)

(assert (=> b!760280 (= e!423813 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338747))))

(declare-fun b!760281 () Bool)

(declare-fun e!423815 () Bool)

(declare-fun e!423818 () Bool)

(assert (=> b!760281 (= e!423815 e!423818)))

(declare-fun res!514437 () Bool)

(assert (=> b!760281 (=> (not res!514437) (not e!423818))))

(declare-fun lt!338748 () SeekEntryResult!7746)

(declare-fun lt!338745 () SeekEntryResult!7746)

(assert (=> b!760281 (= res!514437 (= lt!338748 lt!338745))))

(declare-fun lt!338743 () (_ BitVec 64))

(declare-fun lt!338746 () array!42068)

(assert (=> b!760281 (= lt!338745 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338743 lt!338746 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760281 (= lt!338748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338743 mask!3328) lt!338743 lt!338746 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!760281 (= lt!338743 (select (store (arr!20146 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!760281 (= lt!338746 (array!42069 (store (arr!20146 a!3186) i!1173 k0!2102) (size!20567 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!760282 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42068 (_ BitVec 32)) SeekEntryResult!7746)

(assert (=> b!760282 (= e!423811 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338750))))

(declare-fun b!760283 () Bool)

(declare-fun res!514451 () Bool)

(assert (=> b!760283 (=> (not res!514451) (not e!423814))))

(declare-datatypes ((List!14148 0))(
  ( (Nil!14145) (Cons!14144 (h!15219 (_ BitVec 64)) (t!20463 List!14148)) )
))
(declare-fun arrayNoDuplicates!0 (array!42068 (_ BitVec 32) List!14148) Bool)

(assert (=> b!760283 (= res!514451 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14145))))

(declare-fun b!760284 () Bool)

(declare-fun res!514442 () Bool)

(assert (=> b!760284 (=> (not res!514442) (not e!423812))))

(assert (=> b!760284 (= res!514442 (and (= (size!20567 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20567 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20567 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!760285 () Bool)

(declare-fun res!514444 () Bool)

(assert (=> b!760285 (=> (not res!514444) (not e!423814))))

(assert (=> b!760285 (= res!514444 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20567 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20567 a!3186))))))

(declare-fun b!760287 () Bool)

(assert (=> b!760287 (= e!423813 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) (Found!7746 j!159)))))

(declare-fun b!760288 () Bool)

(declare-fun res!514443 () Bool)

(assert (=> b!760288 (=> (not res!514443) (not e!423815))))

(assert (=> b!760288 (= res!514443 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20146 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760289 () Bool)

(declare-fun res!514448 () Bool)

(assert (=> b!760289 (=> (not res!514448) (not e!423812))))

(assert (=> b!760289 (= res!514448 (validKeyInArray!0 k0!2102))))

(declare-fun b!760290 () Bool)

(declare-fun res!514450 () Bool)

(assert (=> b!760290 (=> (not res!514450) (not e!423812))))

(declare-fun arrayContainsKey!0 (array!42068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!760290 (= res!514450 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!760291 () Bool)

(assert (=> b!760291 (= e!423814 e!423815)))

(declare-fun res!514445 () Bool)

(assert (=> b!760291 (=> (not res!514445) (not e!423815))))

(assert (=> b!760291 (= res!514445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338747))))

(assert (=> b!760291 (= lt!338747 (Intermediate!7746 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!760292 () Bool)

(assert (=> b!760292 (= e!423812 e!423814)))

(declare-fun res!514449 () Bool)

(assert (=> b!760292 (=> (not res!514449) (not e!423814))))

(declare-fun lt!338749 () SeekEntryResult!7746)

(assert (=> b!760292 (= res!514449 (or (= lt!338749 (MissingZero!7746 i!1173)) (= lt!338749 (MissingVacant!7746 i!1173))))))

(assert (=> b!760292 (= lt!338749 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!760293 () Bool)

(get-info :version)

(assert (=> b!760293 (= e!423818 (not (or (not ((_ is Intermediate!7746) lt!338745)) (not (= x!1131 (x!64241 lt!338745))) (= index!1321 (index!33354 lt!338745)))))))

(assert (=> b!760293 e!423817))

(declare-fun res!514438 () Bool)

(assert (=> b!760293 (=> (not res!514438) (not e!423817))))

(assert (=> b!760293 (= res!514438 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26332 0))(
  ( (Unit!26333) )
))
(declare-fun lt!338744 () Unit!26332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26332)

(assert (=> b!760293 (= lt!338744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!760286 () Bool)

(declare-fun res!514446 () Bool)

(assert (=> b!760286 (=> (not res!514446) (not e!423815))))

(assert (=> b!760286 (= res!514446 e!423813)))

(declare-fun c!83302 () Bool)

(assert (=> b!760286 (= c!83302 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!514447 () Bool)

(assert (=> start!65958 (=> (not res!514447) (not e!423812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65958 (= res!514447 (validMask!0 mask!3328))))

(assert (=> start!65958 e!423812))

(assert (=> start!65958 true))

(declare-fun array_inv!15942 (array!42068) Bool)

(assert (=> start!65958 (array_inv!15942 a!3186)))

(assert (= (and start!65958 res!514447) b!760284))

(assert (= (and b!760284 res!514442) b!760279))

(assert (= (and b!760279 res!514441) b!760289))

(assert (= (and b!760289 res!514448) b!760290))

(assert (= (and b!760290 res!514450) b!760292))

(assert (= (and b!760292 res!514449) b!760278))

(assert (= (and b!760278 res!514440) b!760283))

(assert (= (and b!760283 res!514451) b!760285))

(assert (= (and b!760285 res!514444) b!760291))

(assert (= (and b!760291 res!514445) b!760288))

(assert (= (and b!760288 res!514443) b!760286))

(assert (= (and b!760286 c!83302) b!760280))

(assert (= (and b!760286 (not c!83302)) b!760287))

(assert (= (and b!760286 res!514446) b!760281))

(assert (= (and b!760281 res!514437) b!760293))

(assert (= (and b!760293 res!514438) b!760277))

(assert (= (and b!760277 res!514439) b!760282))

(declare-fun m!707459 () Bool)

(assert (=> b!760289 m!707459))

(declare-fun m!707461 () Bool)

(assert (=> b!760292 m!707461))

(declare-fun m!707463 () Bool)

(assert (=> b!760277 m!707463))

(assert (=> b!760277 m!707463))

(declare-fun m!707465 () Bool)

(assert (=> b!760277 m!707465))

(assert (=> b!760279 m!707463))

(assert (=> b!760279 m!707463))

(declare-fun m!707467 () Bool)

(assert (=> b!760279 m!707467))

(assert (=> b!760291 m!707463))

(assert (=> b!760291 m!707463))

(declare-fun m!707469 () Bool)

(assert (=> b!760291 m!707469))

(assert (=> b!760291 m!707469))

(assert (=> b!760291 m!707463))

(declare-fun m!707471 () Bool)

(assert (=> b!760291 m!707471))

(assert (=> b!760287 m!707463))

(assert (=> b!760287 m!707463))

(declare-fun m!707473 () Bool)

(assert (=> b!760287 m!707473))

(assert (=> b!760282 m!707463))

(assert (=> b!760282 m!707463))

(declare-fun m!707475 () Bool)

(assert (=> b!760282 m!707475))

(declare-fun m!707477 () Bool)

(assert (=> b!760281 m!707477))

(declare-fun m!707479 () Bool)

(assert (=> b!760281 m!707479))

(declare-fun m!707481 () Bool)

(assert (=> b!760281 m!707481))

(assert (=> b!760281 m!707479))

(declare-fun m!707483 () Bool)

(assert (=> b!760281 m!707483))

(declare-fun m!707485 () Bool)

(assert (=> b!760281 m!707485))

(declare-fun m!707487 () Bool)

(assert (=> b!760283 m!707487))

(declare-fun m!707489 () Bool)

(assert (=> start!65958 m!707489))

(declare-fun m!707491 () Bool)

(assert (=> start!65958 m!707491))

(assert (=> b!760280 m!707463))

(assert (=> b!760280 m!707463))

(declare-fun m!707493 () Bool)

(assert (=> b!760280 m!707493))

(declare-fun m!707495 () Bool)

(assert (=> b!760290 m!707495))

(declare-fun m!707497 () Bool)

(assert (=> b!760293 m!707497))

(declare-fun m!707499 () Bool)

(assert (=> b!760293 m!707499))

(declare-fun m!707501 () Bool)

(assert (=> b!760278 m!707501))

(declare-fun m!707503 () Bool)

(assert (=> b!760288 m!707503))

(check-sat (not b!760283) (not b!760277) (not start!65958) (not b!760280) (not b!760279) (not b!760289) (not b!760291) (not b!760287) (not b!760282) (not b!760290) (not b!760281) (not b!760278) (not b!760292) (not b!760293))
(check-sat)
(get-model)

(declare-fun b!760357 () Bool)

(declare-fun c!83312 () Bool)

(declare-fun lt!338779 () (_ BitVec 64))

(assert (=> b!760357 (= c!83312 (= lt!338779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423849 () SeekEntryResult!7746)

(declare-fun e!423851 () SeekEntryResult!7746)

(assert (=> b!760357 (= e!423849 e!423851)))

(declare-fun b!760358 () Bool)

(declare-fun e!423850 () SeekEntryResult!7746)

(assert (=> b!760358 (= e!423850 Undefined!7746)))

(declare-fun d!100487 () Bool)

(declare-fun lt!338780 () SeekEntryResult!7746)

(assert (=> d!100487 (and (or ((_ is Undefined!7746) lt!338780) (not ((_ is Found!7746) lt!338780)) (and (bvsge (index!33353 lt!338780) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338780) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338780) ((_ is Found!7746) lt!338780) (not ((_ is MissingVacant!7746) lt!338780)) (not (= (index!33355 lt!338780) resIntermediateIndex!5)) (and (bvsge (index!33355 lt!338780) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338780) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338780) (ite ((_ is Found!7746) lt!338780) (= (select (arr!20146 a!3186) (index!33353 lt!338780)) (select (arr!20146 a!3186) j!159)) (and ((_ is MissingVacant!7746) lt!338780) (= (index!33355 lt!338780) resIntermediateIndex!5) (= (select (arr!20146 a!3186) (index!33355 lt!338780)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100487 (= lt!338780 e!423850)))

(declare-fun c!83314 () Bool)

(assert (=> d!100487 (= c!83314 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100487 (= lt!338779 (select (arr!20146 a!3186) index!1321))))

(assert (=> d!100487 (validMask!0 mask!3328)))

(assert (=> d!100487 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338780)))

(declare-fun b!760359 () Bool)

(assert (=> b!760359 (= e!423851 (MissingVacant!7746 resIntermediateIndex!5))))

(declare-fun b!760360 () Bool)

(assert (=> b!760360 (= e!423849 (Found!7746 index!1321))))

(declare-fun b!760361 () Bool)

(assert (=> b!760361 (= e!423850 e!423849)))

(declare-fun c!83313 () Bool)

(assert (=> b!760361 (= c!83313 (= lt!338779 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!760362 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760362 (= e!423851 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100487 c!83314) b!760358))

(assert (= (and d!100487 (not c!83314)) b!760361))

(assert (= (and b!760361 c!83313) b!760360))

(assert (= (and b!760361 (not c!83313)) b!760357))

(assert (= (and b!760357 c!83312) b!760359))

(assert (= (and b!760357 (not c!83312)) b!760362))

(declare-fun m!707551 () Bool)

(assert (=> d!100487 m!707551))

(declare-fun m!707553 () Bool)

(assert (=> d!100487 m!707553))

(declare-fun m!707555 () Bool)

(assert (=> d!100487 m!707555))

(assert (=> d!100487 m!707489))

(declare-fun m!707557 () Bool)

(assert (=> b!760362 m!707557))

(assert (=> b!760362 m!707557))

(assert (=> b!760362 m!707463))

(declare-fun m!707559 () Bool)

(assert (=> b!760362 m!707559))

(assert (=> b!760287 d!100487))

(declare-fun d!100489 () Bool)

(assert (=> d!100489 (= (validKeyInArray!0 (select (arr!20146 a!3186) j!159)) (and (not (= (select (arr!20146 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20146 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760279 d!100489))

(declare-fun b!760371 () Bool)

(declare-fun e!423859 () Bool)

(declare-fun e!423860 () Bool)

(assert (=> b!760371 (= e!423859 e!423860)))

(declare-fun c!83317 () Bool)

(assert (=> b!760371 (= c!83317 (validKeyInArray!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760372 () Bool)

(declare-fun e!423858 () Bool)

(assert (=> b!760372 (= e!423860 e!423858)))

(declare-fun lt!338787 () (_ BitVec 64))

(assert (=> b!760372 (= lt!338787 (select (arr!20146 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!338789 () Unit!26332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42068 (_ BitVec 64) (_ BitVec 32)) Unit!26332)

(assert (=> b!760372 (= lt!338789 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338787 #b00000000000000000000000000000000))))

(assert (=> b!760372 (arrayContainsKey!0 a!3186 lt!338787 #b00000000000000000000000000000000)))

(declare-fun lt!338788 () Unit!26332)

(assert (=> b!760372 (= lt!338788 lt!338789)))

(declare-fun res!514502 () Bool)

(assert (=> b!760372 (= res!514502 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7746 #b00000000000000000000000000000000)))))

(assert (=> b!760372 (=> (not res!514502) (not e!423858))))

(declare-fun d!100491 () Bool)

(declare-fun res!514501 () Bool)

(assert (=> d!100491 (=> res!514501 e!423859)))

(assert (=> d!100491 (= res!514501 (bvsge #b00000000000000000000000000000000 (size!20567 a!3186)))))

(assert (=> d!100491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!423859)))

(declare-fun bm!34932 () Bool)

(declare-fun call!34935 () Bool)

(assert (=> bm!34932 (= call!34935 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760373 () Bool)

(assert (=> b!760373 (= e!423858 call!34935)))

(declare-fun b!760374 () Bool)

(assert (=> b!760374 (= e!423860 call!34935)))

(assert (= (and d!100491 (not res!514501)) b!760371))

(assert (= (and b!760371 c!83317) b!760372))

(assert (= (and b!760371 (not c!83317)) b!760374))

(assert (= (and b!760372 res!514502) b!760373))

(assert (= (or b!760373 b!760374) bm!34932))

(declare-fun m!707561 () Bool)

(assert (=> b!760371 m!707561))

(assert (=> b!760371 m!707561))

(declare-fun m!707563 () Bool)

(assert (=> b!760371 m!707563))

(assert (=> b!760372 m!707561))

(declare-fun m!707565 () Bool)

(assert (=> b!760372 m!707565))

(declare-fun m!707567 () Bool)

(assert (=> b!760372 m!707567))

(assert (=> b!760372 m!707561))

(declare-fun m!707569 () Bool)

(assert (=> b!760372 m!707569))

(declare-fun m!707571 () Bool)

(assert (=> bm!34932 m!707571))

(assert (=> b!760278 d!100491))

(declare-fun d!100493 () Bool)

(assert (=> d!100493 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760289 d!100493))

(declare-fun b!760405 () Bool)

(declare-fun c!83331 () Bool)

(declare-fun lt!338802 () (_ BitVec 64))

(assert (=> b!760405 (= c!83331 (= lt!338802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423877 () SeekEntryResult!7746)

(declare-fun e!423879 () SeekEntryResult!7746)

(assert (=> b!760405 (= e!423877 e!423879)))

(declare-fun b!760406 () Bool)

(declare-fun lt!338801 () SeekEntryResult!7746)

(assert (=> b!760406 (= e!423879 (MissingZero!7746 (index!33354 lt!338801)))))

(declare-fun d!100495 () Bool)

(declare-fun lt!338800 () SeekEntryResult!7746)

(assert (=> d!100495 (and (or ((_ is Undefined!7746) lt!338800) (not ((_ is Found!7746) lt!338800)) (and (bvsge (index!33353 lt!338800) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338800) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338800) ((_ is Found!7746) lt!338800) (not ((_ is MissingZero!7746) lt!338800)) (and (bvsge (index!33352 lt!338800) #b00000000000000000000000000000000) (bvslt (index!33352 lt!338800) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338800) ((_ is Found!7746) lt!338800) ((_ is MissingZero!7746) lt!338800) (not ((_ is MissingVacant!7746) lt!338800)) (and (bvsge (index!33355 lt!338800) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338800) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338800) (ite ((_ is Found!7746) lt!338800) (= (select (arr!20146 a!3186) (index!33353 lt!338800)) (select (arr!20146 a!3186) j!159)) (ite ((_ is MissingZero!7746) lt!338800) (= (select (arr!20146 a!3186) (index!33352 lt!338800)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7746) lt!338800) (= (select (arr!20146 a!3186) (index!33355 lt!338800)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!423878 () SeekEntryResult!7746)

(assert (=> d!100495 (= lt!338800 e!423878)))

(declare-fun c!83332 () Bool)

(assert (=> d!100495 (= c!83332 (and ((_ is Intermediate!7746) lt!338801) (undefined!8558 lt!338801)))))

(assert (=> d!100495 (= lt!338801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100495 (validMask!0 mask!3328)))

(assert (=> d!100495 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338800)))

(declare-fun b!760407 () Bool)

(assert (=> b!760407 (= e!423878 e!423877)))

(assert (=> b!760407 (= lt!338802 (select (arr!20146 a!3186) (index!33354 lt!338801)))))

(declare-fun c!83330 () Bool)

(assert (=> b!760407 (= c!83330 (= lt!338802 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!760408 () Bool)

(assert (=> b!760408 (= e!423879 (seekKeyOrZeroReturnVacant!0 (x!64241 lt!338801) (index!33354 lt!338801) (index!33354 lt!338801) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760409 () Bool)

(assert (=> b!760409 (= e!423877 (Found!7746 (index!33354 lt!338801)))))

(declare-fun b!760410 () Bool)

(assert (=> b!760410 (= e!423878 Undefined!7746)))

(assert (= (and d!100495 c!83332) b!760410))

(assert (= (and d!100495 (not c!83332)) b!760407))

(assert (= (and b!760407 c!83330) b!760409))

(assert (= (and b!760407 (not c!83330)) b!760405))

(assert (= (and b!760405 c!83331) b!760406))

(assert (= (and b!760405 (not c!83331)) b!760408))

(declare-fun m!707573 () Bool)

(assert (=> d!100495 m!707573))

(assert (=> d!100495 m!707469))

(assert (=> d!100495 m!707463))

(assert (=> d!100495 m!707471))

(assert (=> d!100495 m!707463))

(assert (=> d!100495 m!707469))

(assert (=> d!100495 m!707489))

(declare-fun m!707575 () Bool)

(assert (=> d!100495 m!707575))

(declare-fun m!707577 () Bool)

(assert (=> d!100495 m!707577))

(declare-fun m!707579 () Bool)

(assert (=> b!760407 m!707579))

(assert (=> b!760408 m!707463))

(declare-fun m!707581 () Bool)

(assert (=> b!760408 m!707581))

(assert (=> b!760277 d!100495))

(declare-fun b!760411 () Bool)

(declare-fun c!83334 () Bool)

(declare-fun lt!338805 () (_ BitVec 64))

(assert (=> b!760411 (= c!83334 (= lt!338805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423880 () SeekEntryResult!7746)

(declare-fun e!423882 () SeekEntryResult!7746)

(assert (=> b!760411 (= e!423880 e!423882)))

(declare-fun b!760412 () Bool)

(declare-fun lt!338804 () SeekEntryResult!7746)

(assert (=> b!760412 (= e!423882 (MissingZero!7746 (index!33354 lt!338804)))))

(declare-fun d!100501 () Bool)

(declare-fun lt!338803 () SeekEntryResult!7746)

(assert (=> d!100501 (and (or ((_ is Undefined!7746) lt!338803) (not ((_ is Found!7746) lt!338803)) (and (bvsge (index!33353 lt!338803) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338803) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338803) ((_ is Found!7746) lt!338803) (not ((_ is MissingZero!7746) lt!338803)) (and (bvsge (index!33352 lt!338803) #b00000000000000000000000000000000) (bvslt (index!33352 lt!338803) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338803) ((_ is Found!7746) lt!338803) ((_ is MissingZero!7746) lt!338803) (not ((_ is MissingVacant!7746) lt!338803)) (and (bvsge (index!33355 lt!338803) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338803) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338803) (ite ((_ is Found!7746) lt!338803) (= (select (arr!20146 a!3186) (index!33353 lt!338803)) k0!2102) (ite ((_ is MissingZero!7746) lt!338803) (= (select (arr!20146 a!3186) (index!33352 lt!338803)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7746) lt!338803) (= (select (arr!20146 a!3186) (index!33355 lt!338803)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!423881 () SeekEntryResult!7746)

(assert (=> d!100501 (= lt!338803 e!423881)))

(declare-fun c!83335 () Bool)

(assert (=> d!100501 (= c!83335 (and ((_ is Intermediate!7746) lt!338804) (undefined!8558 lt!338804)))))

(assert (=> d!100501 (= lt!338804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100501 (validMask!0 mask!3328)))

(assert (=> d!100501 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!338803)))

(declare-fun b!760413 () Bool)

(assert (=> b!760413 (= e!423881 e!423880)))

(assert (=> b!760413 (= lt!338805 (select (arr!20146 a!3186) (index!33354 lt!338804)))))

(declare-fun c!83333 () Bool)

(assert (=> b!760413 (= c!83333 (= lt!338805 k0!2102))))

(declare-fun b!760414 () Bool)

(assert (=> b!760414 (= e!423882 (seekKeyOrZeroReturnVacant!0 (x!64241 lt!338804) (index!33354 lt!338804) (index!33354 lt!338804) k0!2102 a!3186 mask!3328))))

(declare-fun b!760415 () Bool)

(assert (=> b!760415 (= e!423880 (Found!7746 (index!33354 lt!338804)))))

(declare-fun b!760416 () Bool)

(assert (=> b!760416 (= e!423881 Undefined!7746)))

(assert (= (and d!100501 c!83335) b!760416))

(assert (= (and d!100501 (not c!83335)) b!760413))

(assert (= (and b!760413 c!83333) b!760415))

(assert (= (and b!760413 (not c!83333)) b!760411))

(assert (= (and b!760411 c!83334) b!760412))

(assert (= (and b!760411 (not c!83334)) b!760414))

(declare-fun m!707583 () Bool)

(assert (=> d!100501 m!707583))

(declare-fun m!707585 () Bool)

(assert (=> d!100501 m!707585))

(declare-fun m!707587 () Bool)

(assert (=> d!100501 m!707587))

(assert (=> d!100501 m!707585))

(assert (=> d!100501 m!707489))

(declare-fun m!707589 () Bool)

(assert (=> d!100501 m!707589))

(declare-fun m!707591 () Bool)

(assert (=> d!100501 m!707591))

(declare-fun m!707593 () Bool)

(assert (=> b!760413 m!707593))

(declare-fun m!707595 () Bool)

(assert (=> b!760414 m!707595))

(assert (=> b!760292 d!100501))

(declare-fun b!760495 () Bool)

(declare-fun lt!338833 () SeekEntryResult!7746)

(assert (=> b!760495 (and (bvsge (index!33354 lt!338833) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338833) (size!20567 lt!338746)))))

(declare-fun res!514534 () Bool)

(assert (=> b!760495 (= res!514534 (= (select (arr!20146 lt!338746) (index!33354 lt!338833)) lt!338743))))

(declare-fun e!423932 () Bool)

(assert (=> b!760495 (=> res!514534 e!423932)))

(declare-fun e!423929 () Bool)

(assert (=> b!760495 (= e!423929 e!423932)))

(declare-fun d!100503 () Bool)

(declare-fun e!423930 () Bool)

(assert (=> d!100503 e!423930))

(declare-fun c!83365 () Bool)

(assert (=> d!100503 (= c!83365 (and ((_ is Intermediate!7746) lt!338833) (undefined!8558 lt!338833)))))

(declare-fun e!423931 () SeekEntryResult!7746)

(assert (=> d!100503 (= lt!338833 e!423931)))

(declare-fun c!83363 () Bool)

(assert (=> d!100503 (= c!83363 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338834 () (_ BitVec 64))

(assert (=> d!100503 (= lt!338834 (select (arr!20146 lt!338746) index!1321))))

(assert (=> d!100503 (validMask!0 mask!3328)))

(assert (=> d!100503 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338743 lt!338746 mask!3328) lt!338833)))

(declare-fun b!760496 () Bool)

(assert (=> b!760496 (= e!423930 e!423929)))

(declare-fun res!514536 () Bool)

(assert (=> b!760496 (= res!514536 (and ((_ is Intermediate!7746) lt!338833) (not (undefined!8558 lt!338833)) (bvslt (x!64241 lt!338833) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338833) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338833) x!1131)))))

(assert (=> b!760496 (=> (not res!514536) (not e!423929))))

(declare-fun b!760497 () Bool)

(assert (=> b!760497 (and (bvsge (index!33354 lt!338833) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338833) (size!20567 lt!338746)))))

(declare-fun res!514535 () Bool)

(assert (=> b!760497 (= res!514535 (= (select (arr!20146 lt!338746) (index!33354 lt!338833)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760497 (=> res!514535 e!423932)))

(declare-fun b!760498 () Bool)

(assert (=> b!760498 (= e!423930 (bvsge (x!64241 lt!338833) #b01111111111111111111111111111110))))

(declare-fun b!760499 () Bool)

(declare-fun e!423933 () SeekEntryResult!7746)

(assert (=> b!760499 (= e!423933 (Intermediate!7746 false index!1321 x!1131))))

(declare-fun b!760500 () Bool)

(assert (=> b!760500 (and (bvsge (index!33354 lt!338833) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338833) (size!20567 lt!338746)))))

(assert (=> b!760500 (= e!423932 (= (select (arr!20146 lt!338746) (index!33354 lt!338833)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760501 () Bool)

(assert (=> b!760501 (= e!423931 (Intermediate!7746 true index!1321 x!1131))))

(declare-fun b!760502 () Bool)

(assert (=> b!760502 (= e!423931 e!423933)))

(declare-fun c!83364 () Bool)

(assert (=> b!760502 (= c!83364 (or (= lt!338834 lt!338743) (= (bvadd lt!338834 lt!338834) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760503 () Bool)

(assert (=> b!760503 (= e!423933 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338743 lt!338746 mask!3328))))

(assert (= (and d!100503 c!83363) b!760501))

(assert (= (and d!100503 (not c!83363)) b!760502))

(assert (= (and b!760502 c!83364) b!760499))

(assert (= (and b!760502 (not c!83364)) b!760503))

(assert (= (and d!100503 c!83365) b!760498))

(assert (= (and d!100503 (not c!83365)) b!760496))

(assert (= (and b!760496 res!514536) b!760495))

(assert (= (and b!760495 (not res!514534)) b!760497))

(assert (= (and b!760497 (not res!514535)) b!760500))

(assert (=> b!760503 m!707557))

(assert (=> b!760503 m!707557))

(declare-fun m!707643 () Bool)

(assert (=> b!760503 m!707643))

(declare-fun m!707645 () Bool)

(assert (=> b!760500 m!707645))

(assert (=> b!760495 m!707645))

(assert (=> b!760497 m!707645))

(declare-fun m!707647 () Bool)

(assert (=> d!100503 m!707647))

(assert (=> d!100503 m!707489))

(assert (=> b!760281 d!100503))

(declare-fun b!760504 () Bool)

(declare-fun lt!338835 () SeekEntryResult!7746)

(assert (=> b!760504 (and (bvsge (index!33354 lt!338835) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338835) (size!20567 lt!338746)))))

(declare-fun res!514537 () Bool)

(assert (=> b!760504 (= res!514537 (= (select (arr!20146 lt!338746) (index!33354 lt!338835)) lt!338743))))

(declare-fun e!423937 () Bool)

(assert (=> b!760504 (=> res!514537 e!423937)))

(declare-fun e!423934 () Bool)

(assert (=> b!760504 (= e!423934 e!423937)))

(declare-fun d!100519 () Bool)

(declare-fun e!423935 () Bool)

(assert (=> d!100519 e!423935))

(declare-fun c!83368 () Bool)

(assert (=> d!100519 (= c!83368 (and ((_ is Intermediate!7746) lt!338835) (undefined!8558 lt!338835)))))

(declare-fun e!423936 () SeekEntryResult!7746)

(assert (=> d!100519 (= lt!338835 e!423936)))

(declare-fun c!83366 () Bool)

(assert (=> d!100519 (= c!83366 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338836 () (_ BitVec 64))

(assert (=> d!100519 (= lt!338836 (select (arr!20146 lt!338746) (toIndex!0 lt!338743 mask!3328)))))

(assert (=> d!100519 (validMask!0 mask!3328)))

(assert (=> d!100519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338743 mask!3328) lt!338743 lt!338746 mask!3328) lt!338835)))

(declare-fun b!760505 () Bool)

(assert (=> b!760505 (= e!423935 e!423934)))

(declare-fun res!514539 () Bool)

(assert (=> b!760505 (= res!514539 (and ((_ is Intermediate!7746) lt!338835) (not (undefined!8558 lt!338835)) (bvslt (x!64241 lt!338835) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338835) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338835) #b00000000000000000000000000000000)))))

(assert (=> b!760505 (=> (not res!514539) (not e!423934))))

(declare-fun b!760506 () Bool)

(assert (=> b!760506 (and (bvsge (index!33354 lt!338835) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338835) (size!20567 lt!338746)))))

(declare-fun res!514538 () Bool)

(assert (=> b!760506 (= res!514538 (= (select (arr!20146 lt!338746) (index!33354 lt!338835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760506 (=> res!514538 e!423937)))

(declare-fun b!760507 () Bool)

(assert (=> b!760507 (= e!423935 (bvsge (x!64241 lt!338835) #b01111111111111111111111111111110))))

(declare-fun b!760508 () Bool)

(declare-fun e!423938 () SeekEntryResult!7746)

(assert (=> b!760508 (= e!423938 (Intermediate!7746 false (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760509 () Bool)

(assert (=> b!760509 (and (bvsge (index!33354 lt!338835) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338835) (size!20567 lt!338746)))))

(assert (=> b!760509 (= e!423937 (= (select (arr!20146 lt!338746) (index!33354 lt!338835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760510 () Bool)

(assert (=> b!760510 (= e!423936 (Intermediate!7746 true (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760511 () Bool)

(assert (=> b!760511 (= e!423936 e!423938)))

(declare-fun c!83367 () Bool)

(assert (=> b!760511 (= c!83367 (or (= lt!338836 lt!338743) (= (bvadd lt!338836 lt!338836) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760512 () Bool)

(assert (=> b!760512 (= e!423938 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338743 lt!338746 mask!3328))))

(assert (= (and d!100519 c!83366) b!760510))

(assert (= (and d!100519 (not c!83366)) b!760511))

(assert (= (and b!760511 c!83367) b!760508))

(assert (= (and b!760511 (not c!83367)) b!760512))

(assert (= (and d!100519 c!83368) b!760507))

(assert (= (and d!100519 (not c!83368)) b!760505))

(assert (= (and b!760505 res!514539) b!760504))

(assert (= (and b!760504 (not res!514537)) b!760506))

(assert (= (and b!760506 (not res!514538)) b!760509))

(assert (=> b!760512 m!707479))

(declare-fun m!707649 () Bool)

(assert (=> b!760512 m!707649))

(assert (=> b!760512 m!707649))

(declare-fun m!707651 () Bool)

(assert (=> b!760512 m!707651))

(declare-fun m!707653 () Bool)

(assert (=> b!760509 m!707653))

(assert (=> b!760504 m!707653))

(assert (=> b!760506 m!707653))

(assert (=> d!100519 m!707479))

(declare-fun m!707655 () Bool)

(assert (=> d!100519 m!707655))

(assert (=> d!100519 m!707489))

(assert (=> b!760281 d!100519))

(declare-fun d!100521 () Bool)

(declare-fun lt!338846 () (_ BitVec 32))

(declare-fun lt!338845 () (_ BitVec 32))

(assert (=> d!100521 (= lt!338846 (bvmul (bvxor lt!338845 (bvlshr lt!338845 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100521 (= lt!338845 ((_ extract 31 0) (bvand (bvxor lt!338743 (bvlshr lt!338743 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100521 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514540 (let ((h!15222 ((_ extract 31 0) (bvand (bvxor lt!338743 (bvlshr lt!338743 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64247 (bvmul (bvxor h!15222 (bvlshr h!15222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64247 (bvlshr x!64247 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514540 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514540 #b00000000000000000000000000000000))))))

(assert (=> d!100521 (= (toIndex!0 lt!338743 mask!3328) (bvand (bvxor lt!338846 (bvlshr lt!338846 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760281 d!100521))

(declare-fun b!760531 () Bool)

(declare-fun lt!338847 () SeekEntryResult!7746)

(assert (=> b!760531 (and (bvsge (index!33354 lt!338847) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338847) (size!20567 a!3186)))))

(declare-fun res!514547 () Bool)

(assert (=> b!760531 (= res!514547 (= (select (arr!20146 a!3186) (index!33354 lt!338847)) (select (arr!20146 a!3186) j!159)))))

(declare-fun e!423952 () Bool)

(assert (=> b!760531 (=> res!514547 e!423952)))

(declare-fun e!423949 () Bool)

(assert (=> b!760531 (= e!423949 e!423952)))

(declare-fun d!100523 () Bool)

(declare-fun e!423950 () Bool)

(assert (=> d!100523 e!423950))

(declare-fun c!83377 () Bool)

(assert (=> d!100523 (= c!83377 (and ((_ is Intermediate!7746) lt!338847) (undefined!8558 lt!338847)))))

(declare-fun e!423951 () SeekEntryResult!7746)

(assert (=> d!100523 (= lt!338847 e!423951)))

(declare-fun c!83375 () Bool)

(assert (=> d!100523 (= c!83375 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338848 () (_ BitVec 64))

(assert (=> d!100523 (= lt!338848 (select (arr!20146 a!3186) index!1321))))

(assert (=> d!100523 (validMask!0 mask!3328)))

(assert (=> d!100523 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338847)))

(declare-fun b!760532 () Bool)

(assert (=> b!760532 (= e!423950 e!423949)))

(declare-fun res!514549 () Bool)

(assert (=> b!760532 (= res!514549 (and ((_ is Intermediate!7746) lt!338847) (not (undefined!8558 lt!338847)) (bvslt (x!64241 lt!338847) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338847) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338847) x!1131)))))

(assert (=> b!760532 (=> (not res!514549) (not e!423949))))

(declare-fun b!760533 () Bool)

(assert (=> b!760533 (and (bvsge (index!33354 lt!338847) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338847) (size!20567 a!3186)))))

(declare-fun res!514548 () Bool)

(assert (=> b!760533 (= res!514548 (= (select (arr!20146 a!3186) (index!33354 lt!338847)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760533 (=> res!514548 e!423952)))

(declare-fun b!760534 () Bool)

(assert (=> b!760534 (= e!423950 (bvsge (x!64241 lt!338847) #b01111111111111111111111111111110))))

(declare-fun b!760535 () Bool)

(declare-fun e!423953 () SeekEntryResult!7746)

(assert (=> b!760535 (= e!423953 (Intermediate!7746 false index!1321 x!1131))))

(declare-fun b!760536 () Bool)

(assert (=> b!760536 (and (bvsge (index!33354 lt!338847) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338847) (size!20567 a!3186)))))

(assert (=> b!760536 (= e!423952 (= (select (arr!20146 a!3186) (index!33354 lt!338847)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760537 () Bool)

(assert (=> b!760537 (= e!423951 (Intermediate!7746 true index!1321 x!1131))))

(declare-fun b!760538 () Bool)

(assert (=> b!760538 (= e!423951 e!423953)))

(declare-fun c!83376 () Bool)

(assert (=> b!760538 (= c!83376 (or (= lt!338848 (select (arr!20146 a!3186) j!159)) (= (bvadd lt!338848 lt!338848) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760539 () Bool)

(assert (=> b!760539 (= e!423953 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100523 c!83375) b!760537))

(assert (= (and d!100523 (not c!83375)) b!760538))

(assert (= (and b!760538 c!83376) b!760535))

(assert (= (and b!760538 (not c!83376)) b!760539))

(assert (= (and d!100523 c!83377) b!760534))

(assert (= (and d!100523 (not c!83377)) b!760532))

(assert (= (and b!760532 res!514549) b!760531))

(assert (= (and b!760531 (not res!514547)) b!760533))

(assert (= (and b!760533 (not res!514548)) b!760536))

(assert (=> b!760539 m!707557))

(assert (=> b!760539 m!707557))

(assert (=> b!760539 m!707463))

(declare-fun m!707657 () Bool)

(assert (=> b!760539 m!707657))

(declare-fun m!707659 () Bool)

(assert (=> b!760536 m!707659))

(assert (=> b!760531 m!707659))

(assert (=> b!760533 m!707659))

(assert (=> d!100523 m!707555))

(assert (=> d!100523 m!707489))

(assert (=> b!760280 d!100523))

(declare-fun b!760552 () Bool)

(declare-fun lt!338853 () SeekEntryResult!7746)

(assert (=> b!760552 (and (bvsge (index!33354 lt!338853) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338853) (size!20567 a!3186)))))

(declare-fun res!514550 () Bool)

(assert (=> b!760552 (= res!514550 (= (select (arr!20146 a!3186) (index!33354 lt!338853)) (select (arr!20146 a!3186) j!159)))))

(declare-fun e!423961 () Bool)

(assert (=> b!760552 (=> res!514550 e!423961)))

(declare-fun e!423958 () Bool)

(assert (=> b!760552 (= e!423958 e!423961)))

(declare-fun d!100525 () Bool)

(declare-fun e!423959 () Bool)

(assert (=> d!100525 e!423959))

(declare-fun c!83384 () Bool)

(assert (=> d!100525 (= c!83384 (and ((_ is Intermediate!7746) lt!338853) (undefined!8558 lt!338853)))))

(declare-fun e!423960 () SeekEntryResult!7746)

(assert (=> d!100525 (= lt!338853 e!423960)))

(declare-fun c!83382 () Bool)

(assert (=> d!100525 (= c!83382 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338854 () (_ BitVec 64))

(assert (=> d!100525 (= lt!338854 (select (arr!20146 a!3186) (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328)))))

(assert (=> d!100525 (validMask!0 mask!3328)))

(assert (=> d!100525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338853)))

(declare-fun b!760553 () Bool)

(assert (=> b!760553 (= e!423959 e!423958)))

(declare-fun res!514552 () Bool)

(assert (=> b!760553 (= res!514552 (and ((_ is Intermediate!7746) lt!338853) (not (undefined!8558 lt!338853)) (bvslt (x!64241 lt!338853) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338853) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338853) #b00000000000000000000000000000000)))))

(assert (=> b!760553 (=> (not res!514552) (not e!423958))))

(declare-fun b!760554 () Bool)

(assert (=> b!760554 (and (bvsge (index!33354 lt!338853) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338853) (size!20567 a!3186)))))

(declare-fun res!514551 () Bool)

(assert (=> b!760554 (= res!514551 (= (select (arr!20146 a!3186) (index!33354 lt!338853)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760554 (=> res!514551 e!423961)))

(declare-fun b!760555 () Bool)

(assert (=> b!760555 (= e!423959 (bvsge (x!64241 lt!338853) #b01111111111111111111111111111110))))

(declare-fun e!423963 () SeekEntryResult!7746)

(declare-fun b!760556 () Bool)

(assert (=> b!760556 (= e!423963 (Intermediate!7746 false (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760557 () Bool)

(assert (=> b!760557 (and (bvsge (index!33354 lt!338853) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338853) (size!20567 a!3186)))))

(assert (=> b!760557 (= e!423961 (= (select (arr!20146 a!3186) (index!33354 lt!338853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760558 () Bool)

(assert (=> b!760558 (= e!423960 (Intermediate!7746 true (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760559 () Bool)

(assert (=> b!760559 (= e!423960 e!423963)))

(declare-fun c!83383 () Bool)

(assert (=> b!760559 (= c!83383 (or (= lt!338854 (select (arr!20146 a!3186) j!159)) (= (bvadd lt!338854 lt!338854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760560 () Bool)

(assert (=> b!760560 (= e!423963 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100525 c!83382) b!760558))

(assert (= (and d!100525 (not c!83382)) b!760559))

(assert (= (and b!760559 c!83383) b!760556))

(assert (= (and b!760559 (not c!83383)) b!760560))

(assert (= (and d!100525 c!83384) b!760555))

(assert (= (and d!100525 (not c!83384)) b!760553))

(assert (= (and b!760553 res!514552) b!760552))

(assert (= (and b!760552 (not res!514550)) b!760554))

(assert (= (and b!760554 (not res!514551)) b!760557))

(assert (=> b!760560 m!707469))

(declare-fun m!707661 () Bool)

(assert (=> b!760560 m!707661))

(assert (=> b!760560 m!707661))

(assert (=> b!760560 m!707463))

(declare-fun m!707663 () Bool)

(assert (=> b!760560 m!707663))

(declare-fun m!707665 () Bool)

(assert (=> b!760557 m!707665))

(assert (=> b!760552 m!707665))

(assert (=> b!760554 m!707665))

(assert (=> d!100525 m!707469))

(declare-fun m!707667 () Bool)

(assert (=> d!100525 m!707667))

(assert (=> d!100525 m!707489))

(assert (=> b!760291 d!100525))

(declare-fun d!100527 () Bool)

(declare-fun lt!338856 () (_ BitVec 32))

(declare-fun lt!338855 () (_ BitVec 32))

(assert (=> d!100527 (= lt!338856 (bvmul (bvxor lt!338855 (bvlshr lt!338855 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100527 (= lt!338855 ((_ extract 31 0) (bvand (bvxor (select (arr!20146 a!3186) j!159) (bvlshr (select (arr!20146 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100527 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514540 (let ((h!15222 ((_ extract 31 0) (bvand (bvxor (select (arr!20146 a!3186) j!159) (bvlshr (select (arr!20146 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64247 (bvmul (bvxor h!15222 (bvlshr h!15222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64247 (bvlshr x!64247 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514540 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514540 #b00000000000000000000000000000000))))))

(assert (=> d!100527 (= (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (bvand (bvxor lt!338856 (bvlshr lt!338856 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760291 d!100527))

(declare-fun d!100529 () Bool)

(declare-fun res!514563 () Bool)

(declare-fun e!423982 () Bool)

(assert (=> d!100529 (=> res!514563 e!423982)))

(assert (=> d!100529 (= res!514563 (= (select (arr!20146 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100529 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!423982)))

(declare-fun b!760589 () Bool)

(declare-fun e!423983 () Bool)

(assert (=> b!760589 (= e!423982 e!423983)))

(declare-fun res!514564 () Bool)

(assert (=> b!760589 (=> (not res!514564) (not e!423983))))

(assert (=> b!760589 (= res!514564 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20567 a!3186)))))

(declare-fun b!760590 () Bool)

(assert (=> b!760590 (= e!423983 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100529 (not res!514563)) b!760589))

(assert (= (and b!760589 res!514564) b!760590))

(assert (=> d!100529 m!707561))

(declare-fun m!707685 () Bool)

(assert (=> b!760590 m!707685))

(assert (=> b!760290 d!100529))

(declare-fun d!100535 () Bool)

(assert (=> d!100535 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65958 d!100535))

(declare-fun d!100551 () Bool)

(assert (=> d!100551 (= (array_inv!15942 a!3186) (bvsge (size!20567 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65958 d!100551))

(declare-fun b!760641 () Bool)

(declare-fun e!424019 () Bool)

(declare-fun e!424020 () Bool)

(assert (=> b!760641 (= e!424019 e!424020)))

(declare-fun c!83411 () Bool)

(assert (=> b!760641 (= c!83411 (validKeyInArray!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34940 () Bool)

(declare-fun call!34943 () Bool)

(assert (=> bm!34940 (= call!34943 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83411 (Cons!14144 (select (arr!20146 a!3186) #b00000000000000000000000000000000) Nil!14145) Nil!14145)))))

(declare-fun b!760642 () Bool)

(assert (=> b!760642 (= e!424020 call!34943)))

(declare-fun d!100555 () Bool)

(declare-fun res!514586 () Bool)

(declare-fun e!424017 () Bool)

(assert (=> d!100555 (=> res!514586 e!424017)))

(assert (=> d!100555 (= res!514586 (bvsge #b00000000000000000000000000000000 (size!20567 a!3186)))))

(assert (=> d!100555 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14145) e!424017)))

(declare-fun b!760643 () Bool)

(assert (=> b!760643 (= e!424017 e!424019)))

(declare-fun res!514588 () Bool)

(assert (=> b!760643 (=> (not res!514588) (not e!424019))))

(declare-fun e!424018 () Bool)

(assert (=> b!760643 (= res!514588 (not e!424018))))

(declare-fun res!514587 () Bool)

(assert (=> b!760643 (=> (not res!514587) (not e!424018))))

(assert (=> b!760643 (= res!514587 (validKeyInArray!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760644 () Bool)

(assert (=> b!760644 (= e!424020 call!34943)))

(declare-fun b!760645 () Bool)

(declare-fun contains!4067 (List!14148 (_ BitVec 64)) Bool)

(assert (=> b!760645 (= e!424018 (contains!4067 Nil!14145 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100555 (not res!514586)) b!760643))

(assert (= (and b!760643 res!514587) b!760645))

(assert (= (and b!760643 res!514588) b!760641))

(assert (= (and b!760641 c!83411) b!760642))

(assert (= (and b!760641 (not c!83411)) b!760644))

(assert (= (or b!760642 b!760644) bm!34940))

(assert (=> b!760641 m!707561))

(assert (=> b!760641 m!707561))

(assert (=> b!760641 m!707563))

(assert (=> bm!34940 m!707561))

(declare-fun m!707719 () Bool)

(assert (=> bm!34940 m!707719))

(assert (=> b!760643 m!707561))

(assert (=> b!760643 m!707561))

(assert (=> b!760643 m!707563))

(assert (=> b!760645 m!707561))

(assert (=> b!760645 m!707561))

(declare-fun m!707721 () Bool)

(assert (=> b!760645 m!707721))

(assert (=> b!760283 d!100555))

(declare-fun b!760646 () Bool)

(declare-fun c!83412 () Bool)

(declare-fun lt!338890 () (_ BitVec 64))

(assert (=> b!760646 (= c!83412 (= lt!338890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424021 () SeekEntryResult!7746)

(declare-fun e!424023 () SeekEntryResult!7746)

(assert (=> b!760646 (= e!424021 e!424023)))

(declare-fun b!760647 () Bool)

(declare-fun e!424022 () SeekEntryResult!7746)

(assert (=> b!760647 (= e!424022 Undefined!7746)))

(declare-fun lt!338891 () SeekEntryResult!7746)

(declare-fun d!100559 () Bool)

(assert (=> d!100559 (and (or ((_ is Undefined!7746) lt!338891) (not ((_ is Found!7746) lt!338891)) (and (bvsge (index!33353 lt!338891) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338891) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338891) ((_ is Found!7746) lt!338891) (not ((_ is MissingVacant!7746) lt!338891)) (not (= (index!33355 lt!338891) resIntermediateIndex!5)) (and (bvsge (index!33355 lt!338891) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338891) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338891) (ite ((_ is Found!7746) lt!338891) (= (select (arr!20146 a!3186) (index!33353 lt!338891)) (select (arr!20146 a!3186) j!159)) (and ((_ is MissingVacant!7746) lt!338891) (= (index!33355 lt!338891) resIntermediateIndex!5) (= (select (arr!20146 a!3186) (index!33355 lt!338891)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100559 (= lt!338891 e!424022)))

(declare-fun c!83414 () Bool)

(assert (=> d!100559 (= c!83414 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100559 (= lt!338890 (select (arr!20146 a!3186) resIntermediateIndex!5))))

(assert (=> d!100559 (validMask!0 mask!3328)))

(assert (=> d!100559 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338891)))

(declare-fun b!760648 () Bool)

(assert (=> b!760648 (= e!424023 (MissingVacant!7746 resIntermediateIndex!5))))

(declare-fun b!760649 () Bool)

(assert (=> b!760649 (= e!424021 (Found!7746 resIntermediateIndex!5))))

(declare-fun b!760650 () Bool)

(assert (=> b!760650 (= e!424022 e!424021)))

(declare-fun c!83413 () Bool)

(assert (=> b!760650 (= c!83413 (= lt!338890 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!760651 () Bool)

(assert (=> b!760651 (= e!424023 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100559 c!83414) b!760647))

(assert (= (and d!100559 (not c!83414)) b!760650))

(assert (= (and b!760650 c!83413) b!760649))

(assert (= (and b!760650 (not c!83413)) b!760646))

(assert (= (and b!760646 c!83412) b!760648))

(assert (= (and b!760646 (not c!83412)) b!760651))

(declare-fun m!707725 () Bool)

(assert (=> d!100559 m!707725))

(declare-fun m!707727 () Bool)

(assert (=> d!100559 m!707727))

(assert (=> d!100559 m!707503))

(assert (=> d!100559 m!707489))

(declare-fun m!707733 () Bool)

(assert (=> b!760651 m!707733))

(assert (=> b!760651 m!707733))

(assert (=> b!760651 m!707463))

(declare-fun m!707735 () Bool)

(assert (=> b!760651 m!707735))

(assert (=> b!760282 d!100559))

(declare-fun b!760656 () Bool)

(declare-fun e!424028 () Bool)

(declare-fun e!424029 () Bool)

(assert (=> b!760656 (= e!424028 e!424029)))

(declare-fun c!83416 () Bool)

(assert (=> b!760656 (= c!83416 (validKeyInArray!0 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!760657 () Bool)

(declare-fun e!424027 () Bool)

(assert (=> b!760657 (= e!424029 e!424027)))

(declare-fun lt!338895 () (_ BitVec 64))

(assert (=> b!760657 (= lt!338895 (select (arr!20146 a!3186) j!159))))

(declare-fun lt!338897 () Unit!26332)

(assert (=> b!760657 (= lt!338897 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338895 j!159))))

(assert (=> b!760657 (arrayContainsKey!0 a!3186 lt!338895 #b00000000000000000000000000000000)))

(declare-fun lt!338896 () Unit!26332)

(assert (=> b!760657 (= lt!338896 lt!338897)))

(declare-fun res!514592 () Bool)

(assert (=> b!760657 (= res!514592 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) (Found!7746 j!159)))))

(assert (=> b!760657 (=> (not res!514592) (not e!424027))))

(declare-fun d!100563 () Bool)

(declare-fun res!514591 () Bool)

(assert (=> d!100563 (=> res!514591 e!424028)))

(assert (=> d!100563 (= res!514591 (bvsge j!159 (size!20567 a!3186)))))

(assert (=> d!100563 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424028)))

(declare-fun bm!34944 () Bool)

(declare-fun call!34947 () Bool)

(assert (=> bm!34944 (= call!34947 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760658 () Bool)

(assert (=> b!760658 (= e!424027 call!34947)))

(declare-fun b!760659 () Bool)

(assert (=> b!760659 (= e!424029 call!34947)))

(assert (= (and d!100563 (not res!514591)) b!760656))

(assert (= (and b!760656 c!83416) b!760657))

(assert (= (and b!760656 (not c!83416)) b!760659))

(assert (= (and b!760657 res!514592) b!760658))

(assert (= (or b!760658 b!760659) bm!34944))

(assert (=> b!760656 m!707463))

(assert (=> b!760656 m!707463))

(assert (=> b!760656 m!707467))

(assert (=> b!760657 m!707463))

(declare-fun m!707737 () Bool)

(assert (=> b!760657 m!707737))

(declare-fun m!707739 () Bool)

(assert (=> b!760657 m!707739))

(assert (=> b!760657 m!707463))

(assert (=> b!760657 m!707465))

(declare-fun m!707741 () Bool)

(assert (=> bm!34944 m!707741))

(assert (=> b!760293 d!100563))

(declare-fun d!100565 () Bool)

(assert (=> d!100565 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338911 () Unit!26332)

(declare-fun choose!38 (array!42068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26332)

(assert (=> d!100565 (= lt!338911 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100565 (validMask!0 mask!3328)))

(assert (=> d!100565 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!338911)))

(declare-fun bs!21386 () Bool)

(assert (= bs!21386 d!100565))

(assert (=> bs!21386 m!707497))

(declare-fun m!707759 () Bool)

(assert (=> bs!21386 m!707759))

(assert (=> bs!21386 m!707489))

(assert (=> b!760293 d!100565))

(check-sat (not b!760560) (not b!760371) (not b!760645) (not d!100559) (not d!100519) (not b!760590) (not b!760512) (not d!100525) (not d!100501) (not b!760372) (not b!760641) (not b!760656) (not d!100495) (not d!100523) (not b!760503) (not b!760539) (not b!760651) (not bm!34932) (not b!760643) (not b!760408) (not b!760414) (not bm!34940) (not b!760657) (not d!100503) (not b!760362) (not d!100565) (not bm!34944) (not d!100487))
(check-sat)
(get-model)

(declare-fun d!100601 () Bool)

(assert (=> d!100601 (= (validKeyInArray!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000)) (and (not (= (select (arr!20146 a!3186) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20146 a!3186) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760643 d!100601))

(assert (=> d!100487 d!100535))

(declare-fun b!760762 () Bool)

(declare-fun lt!338940 () SeekEntryResult!7746)

(assert (=> b!760762 (and (bvsge (index!33354 lt!338940) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338940) (size!20567 a!3186)))))

(declare-fun res!514623 () Bool)

(assert (=> b!760762 (= res!514623 (= (select (arr!20146 a!3186) (index!33354 lt!338940)) k0!2102))))

(declare-fun e!424098 () Bool)

(assert (=> b!760762 (=> res!514623 e!424098)))

(declare-fun e!424095 () Bool)

(assert (=> b!760762 (= e!424095 e!424098)))

(declare-fun d!100603 () Bool)

(declare-fun e!424096 () Bool)

(assert (=> d!100603 e!424096))

(declare-fun c!83455 () Bool)

(assert (=> d!100603 (= c!83455 (and ((_ is Intermediate!7746) lt!338940) (undefined!8558 lt!338940)))))

(declare-fun e!424097 () SeekEntryResult!7746)

(assert (=> d!100603 (= lt!338940 e!424097)))

(declare-fun c!83453 () Bool)

(assert (=> d!100603 (= c!83453 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338941 () (_ BitVec 64))

(assert (=> d!100603 (= lt!338941 (select (arr!20146 a!3186) (toIndex!0 k0!2102 mask!3328)))))

(assert (=> d!100603 (validMask!0 mask!3328)))

(assert (=> d!100603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328) lt!338940)))

(declare-fun b!760763 () Bool)

(assert (=> b!760763 (= e!424096 e!424095)))

(declare-fun res!514625 () Bool)

(assert (=> b!760763 (= res!514625 (and ((_ is Intermediate!7746) lt!338940) (not (undefined!8558 lt!338940)) (bvslt (x!64241 lt!338940) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338940) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338940) #b00000000000000000000000000000000)))))

(assert (=> b!760763 (=> (not res!514625) (not e!424095))))

(declare-fun b!760764 () Bool)

(assert (=> b!760764 (and (bvsge (index!33354 lt!338940) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338940) (size!20567 a!3186)))))

(declare-fun res!514624 () Bool)

(assert (=> b!760764 (= res!514624 (= (select (arr!20146 a!3186) (index!33354 lt!338940)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760764 (=> res!514624 e!424098)))

(declare-fun b!760765 () Bool)

(assert (=> b!760765 (= e!424096 (bvsge (x!64241 lt!338940) #b01111111111111111111111111111110))))

(declare-fun b!760766 () Bool)

(declare-fun e!424099 () SeekEntryResult!7746)

(assert (=> b!760766 (= e!424099 (Intermediate!7746 false (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760767 () Bool)

(assert (=> b!760767 (and (bvsge (index!33354 lt!338940) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338940) (size!20567 a!3186)))))

(assert (=> b!760767 (= e!424098 (= (select (arr!20146 a!3186) (index!33354 lt!338940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760768 () Bool)

(assert (=> b!760768 (= e!424097 (Intermediate!7746 true (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760769 () Bool)

(assert (=> b!760769 (= e!424097 e!424099)))

(declare-fun c!83454 () Bool)

(assert (=> b!760769 (= c!83454 (or (= lt!338941 k0!2102) (= (bvadd lt!338941 lt!338941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760770 () Bool)

(assert (=> b!760770 (= e!424099 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (= (and d!100603 c!83453) b!760768))

(assert (= (and d!100603 (not c!83453)) b!760769))

(assert (= (and b!760769 c!83454) b!760766))

(assert (= (and b!760769 (not c!83454)) b!760770))

(assert (= (and d!100603 c!83455) b!760765))

(assert (= (and d!100603 (not c!83455)) b!760763))

(assert (= (and b!760763 res!514625) b!760762))

(assert (= (and b!760762 (not res!514623)) b!760764))

(assert (= (and b!760764 (not res!514624)) b!760767))

(assert (=> b!760770 m!707585))

(declare-fun m!707833 () Bool)

(assert (=> b!760770 m!707833))

(assert (=> b!760770 m!707833))

(declare-fun m!707835 () Bool)

(assert (=> b!760770 m!707835))

(declare-fun m!707837 () Bool)

(assert (=> b!760767 m!707837))

(assert (=> b!760762 m!707837))

(assert (=> b!760764 m!707837))

(assert (=> d!100603 m!707585))

(declare-fun m!707839 () Bool)

(assert (=> d!100603 m!707839))

(assert (=> d!100603 m!707489))

(assert (=> d!100501 d!100603))

(declare-fun d!100605 () Bool)

(declare-fun lt!338943 () (_ BitVec 32))

(declare-fun lt!338942 () (_ BitVec 32))

(assert (=> d!100605 (= lt!338943 (bvmul (bvxor lt!338942 (bvlshr lt!338942 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100605 (= lt!338942 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100605 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514540 (let ((h!15222 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64247 (bvmul (bvxor h!15222 (bvlshr h!15222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64247 (bvlshr x!64247 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514540 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514540 #b00000000000000000000000000000000))))))

(assert (=> d!100605 (= (toIndex!0 k0!2102 mask!3328) (bvand (bvxor lt!338943 (bvlshr lt!338943 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> d!100501 d!100605))

(assert (=> d!100501 d!100535))

(declare-fun d!100607 () Bool)

(declare-fun lt!338946 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!379 (List!14148) (InoxSet (_ BitVec 64)))

(assert (=> d!100607 (= lt!338946 (select (content!379 Nil!14145) (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun e!424105 () Bool)

(assert (=> d!100607 (= lt!338946 e!424105)))

(declare-fun res!514631 () Bool)

(assert (=> d!100607 (=> (not res!514631) (not e!424105))))

(assert (=> d!100607 (= res!514631 ((_ is Cons!14144) Nil!14145))))

(assert (=> d!100607 (= (contains!4067 Nil!14145 (select (arr!20146 a!3186) #b00000000000000000000000000000000)) lt!338946)))

(declare-fun b!760775 () Bool)

(declare-fun e!424104 () Bool)

(assert (=> b!760775 (= e!424105 e!424104)))

(declare-fun res!514630 () Bool)

(assert (=> b!760775 (=> res!514630 e!424104)))

(assert (=> b!760775 (= res!514630 (= (h!15219 Nil!14145) (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760776 () Bool)

(assert (=> b!760776 (= e!424104 (contains!4067 (t!20463 Nil!14145) (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100607 res!514631) b!760775))

(assert (= (and b!760775 (not res!514630)) b!760776))

(declare-fun m!707841 () Bool)

(assert (=> d!100607 m!707841))

(assert (=> d!100607 m!707561))

(declare-fun m!707843 () Bool)

(assert (=> d!100607 m!707843))

(assert (=> b!760776 m!707561))

(declare-fun m!707845 () Bool)

(assert (=> b!760776 m!707845))

(assert (=> b!760645 d!100607))

(assert (=> b!760656 d!100489))

(declare-fun b!760777 () Bool)

(declare-fun c!83456 () Bool)

(declare-fun lt!338947 () (_ BitVec 64))

(assert (=> b!760777 (= c!83456 (= lt!338947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424106 () SeekEntryResult!7746)

(declare-fun e!424108 () SeekEntryResult!7746)

(assert (=> b!760777 (= e!424106 e!424108)))

(declare-fun b!760778 () Bool)

(declare-fun e!424107 () SeekEntryResult!7746)

(assert (=> b!760778 (= e!424107 Undefined!7746)))

(declare-fun d!100609 () Bool)

(declare-fun lt!338948 () SeekEntryResult!7746)

(assert (=> d!100609 (and (or ((_ is Undefined!7746) lt!338948) (not ((_ is Found!7746) lt!338948)) (and (bvsge (index!33353 lt!338948) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338948) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338948) ((_ is Found!7746) lt!338948) (not ((_ is MissingVacant!7746) lt!338948)) (not (= (index!33355 lt!338948) resIntermediateIndex!5)) (and (bvsge (index!33355 lt!338948) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338948) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338948) (ite ((_ is Found!7746) lt!338948) (= (select (arr!20146 a!3186) (index!33353 lt!338948)) (select (arr!20146 a!3186) j!159)) (and ((_ is MissingVacant!7746) lt!338948) (= (index!33355 lt!338948) resIntermediateIndex!5) (= (select (arr!20146 a!3186) (index!33355 lt!338948)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100609 (= lt!338948 e!424107)))

(declare-fun c!83458 () Bool)

(assert (=> d!100609 (= c!83458 (bvsge (bvadd resIntermediateX!5 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100609 (= lt!338947 (select (arr!20146 a!3186) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(assert (=> d!100609 (validMask!0 mask!3328)))

(assert (=> d!100609 (= (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338948)))

(declare-fun b!760779 () Bool)

(assert (=> b!760779 (= e!424108 (MissingVacant!7746 resIntermediateIndex!5))))

(declare-fun b!760780 () Bool)

(assert (=> b!760780 (= e!424106 (Found!7746 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(declare-fun b!760781 () Bool)

(assert (=> b!760781 (= e!424107 e!424106)))

(declare-fun c!83457 () Bool)

(assert (=> b!760781 (= c!83457 (= lt!338947 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!760782 () Bool)

(assert (=> b!760782 (= e!424108 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100609 c!83458) b!760778))

(assert (= (and d!100609 (not c!83458)) b!760781))

(assert (= (and b!760781 c!83457) b!760780))

(assert (= (and b!760781 (not c!83457)) b!760777))

(assert (= (and b!760777 c!83456) b!760779))

(assert (= (and b!760777 (not c!83456)) b!760782))

(declare-fun m!707847 () Bool)

(assert (=> d!100609 m!707847))

(declare-fun m!707849 () Bool)

(assert (=> d!100609 m!707849))

(assert (=> d!100609 m!707733))

(declare-fun m!707851 () Bool)

(assert (=> d!100609 m!707851))

(assert (=> d!100609 m!707489))

(assert (=> b!760782 m!707733))

(declare-fun m!707853 () Bool)

(assert (=> b!760782 m!707853))

(assert (=> b!760782 m!707853))

(assert (=> b!760782 m!707463))

(declare-fun m!707855 () Bool)

(assert (=> b!760782 m!707855))

(assert (=> b!760651 d!100609))

(declare-fun d!100611 () Bool)

(declare-fun lt!338951 () (_ BitVec 32))

(assert (=> d!100611 (and (bvsge lt!338951 #b00000000000000000000000000000000) (bvslt lt!338951 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!100611 (= lt!338951 (choose!52 resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(assert (=> d!100611 (validMask!0 mask!3328)))

(assert (=> d!100611 (= (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) lt!338951)))

(declare-fun bs!21388 () Bool)

(assert (= bs!21388 d!100611))

(declare-fun m!707857 () Bool)

(assert (=> bs!21388 m!707857))

(assert (=> bs!21388 m!707489))

(assert (=> b!760651 d!100611))

(declare-fun b!760783 () Bool)

(declare-fun e!424110 () Bool)

(declare-fun e!424111 () Bool)

(assert (=> b!760783 (= e!424110 e!424111)))

(declare-fun c!83459 () Bool)

(assert (=> b!760783 (= c!83459 (validKeyInArray!0 (select (arr!20146 a!3186) (bvadd j!159 #b00000000000000000000000000000001))))))

(declare-fun b!760784 () Bool)

(declare-fun e!424109 () Bool)

(assert (=> b!760784 (= e!424111 e!424109)))

(declare-fun lt!338952 () (_ BitVec 64))

(assert (=> b!760784 (= lt!338952 (select (arr!20146 a!3186) (bvadd j!159 #b00000000000000000000000000000001)))))

(declare-fun lt!338954 () Unit!26332)

(assert (=> b!760784 (= lt!338954 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338952 (bvadd j!159 #b00000000000000000000000000000001)))))

(assert (=> b!760784 (arrayContainsKey!0 a!3186 lt!338952 #b00000000000000000000000000000000)))

(declare-fun lt!338953 () Unit!26332)

(assert (=> b!760784 (= lt!338953 lt!338954)))

(declare-fun res!514633 () Bool)

(assert (=> b!760784 (= res!514633 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) (bvadd j!159 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7746 (bvadd j!159 #b00000000000000000000000000000001))))))

(assert (=> b!760784 (=> (not res!514633) (not e!424109))))

(declare-fun d!100613 () Bool)

(declare-fun res!514632 () Bool)

(assert (=> d!100613 (=> res!514632 e!424110)))

(assert (=> d!100613 (= res!514632 (bvsge (bvadd j!159 #b00000000000000000000000000000001) (size!20567 a!3186)))))

(assert (=> d!100613 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328) e!424110)))

(declare-fun call!34954 () Bool)

(declare-fun bm!34951 () Bool)

(assert (=> bm!34951 (= call!34954 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760785 () Bool)

(assert (=> b!760785 (= e!424109 call!34954)))

(declare-fun b!760786 () Bool)

(assert (=> b!760786 (= e!424111 call!34954)))

(assert (= (and d!100613 (not res!514632)) b!760783))

(assert (= (and b!760783 c!83459) b!760784))

(assert (= (and b!760783 (not c!83459)) b!760786))

(assert (= (and b!760784 res!514633) b!760785))

(assert (= (or b!760785 b!760786) bm!34951))

(declare-fun m!707859 () Bool)

(assert (=> b!760783 m!707859))

(assert (=> b!760783 m!707859))

(declare-fun m!707861 () Bool)

(assert (=> b!760783 m!707861))

(assert (=> b!760784 m!707859))

(declare-fun m!707863 () Bool)

(assert (=> b!760784 m!707863))

(declare-fun m!707865 () Bool)

(assert (=> b!760784 m!707865))

(assert (=> b!760784 m!707859))

(declare-fun m!707867 () Bool)

(assert (=> b!760784 m!707867))

(declare-fun m!707869 () Bool)

(assert (=> bm!34951 m!707869))

(assert (=> bm!34944 d!100613))

(declare-fun b!760787 () Bool)

(declare-fun lt!338955 () SeekEntryResult!7746)

(assert (=> b!760787 (and (bvsge (index!33354 lt!338955) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338955) (size!20567 a!3186)))))

(declare-fun res!514634 () Bool)

(assert (=> b!760787 (= res!514634 (= (select (arr!20146 a!3186) (index!33354 lt!338955)) (select (arr!20146 a!3186) j!159)))))

(declare-fun e!424115 () Bool)

(assert (=> b!760787 (=> res!514634 e!424115)))

(declare-fun e!424112 () Bool)

(assert (=> b!760787 (= e!424112 e!424115)))

(declare-fun d!100615 () Bool)

(declare-fun e!424113 () Bool)

(assert (=> d!100615 e!424113))

(declare-fun c!83462 () Bool)

(assert (=> d!100615 (= c!83462 (and ((_ is Intermediate!7746) lt!338955) (undefined!8558 lt!338955)))))

(declare-fun e!424114 () SeekEntryResult!7746)

(assert (=> d!100615 (= lt!338955 e!424114)))

(declare-fun c!83460 () Bool)

(assert (=> d!100615 (= c!83460 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!338956 () (_ BitVec 64))

(assert (=> d!100615 (= lt!338956 (select (arr!20146 a!3186) (nextIndex!0 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!100615 (validMask!0 mask!3328)))

(assert (=> d!100615 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338955)))

(declare-fun b!760788 () Bool)

(assert (=> b!760788 (= e!424113 e!424112)))

(declare-fun res!514636 () Bool)

(assert (=> b!760788 (= res!514636 (and ((_ is Intermediate!7746) lt!338955) (not (undefined!8558 lt!338955)) (bvslt (x!64241 lt!338955) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338955) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338955) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760788 (=> (not res!514636) (not e!424112))))

(declare-fun b!760789 () Bool)

(assert (=> b!760789 (and (bvsge (index!33354 lt!338955) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338955) (size!20567 a!3186)))))

(declare-fun res!514635 () Bool)

(assert (=> b!760789 (= res!514635 (= (select (arr!20146 a!3186) (index!33354 lt!338955)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760789 (=> res!514635 e!424115)))

(declare-fun b!760790 () Bool)

(assert (=> b!760790 (= e!424113 (bvsge (x!64241 lt!338955) #b01111111111111111111111111111110))))

(declare-fun b!760791 () Bool)

(declare-fun e!424116 () SeekEntryResult!7746)

(assert (=> b!760791 (= e!424116 (Intermediate!7746 false (nextIndex!0 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760792 () Bool)

(assert (=> b!760792 (and (bvsge (index!33354 lt!338955) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338955) (size!20567 a!3186)))))

(assert (=> b!760792 (= e!424115 (= (select (arr!20146 a!3186) (index!33354 lt!338955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760793 () Bool)

(assert (=> b!760793 (= e!424114 (Intermediate!7746 true (nextIndex!0 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760794 () Bool)

(assert (=> b!760794 (= e!424114 e!424116)))

(declare-fun c!83461 () Bool)

(assert (=> b!760794 (= c!83461 (or (= lt!338956 (select (arr!20146 a!3186) j!159)) (= (bvadd lt!338956 lt!338956) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760795 () Bool)

(assert (=> b!760795 (= e!424116 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100615 c!83460) b!760793))

(assert (= (and d!100615 (not c!83460)) b!760794))

(assert (= (and b!760794 c!83461) b!760791))

(assert (= (and b!760794 (not c!83461)) b!760795))

(assert (= (and d!100615 c!83462) b!760790))

(assert (= (and d!100615 (not c!83462)) b!760788))

(assert (= (and b!760788 res!514636) b!760787))

(assert (= (and b!760787 (not res!514634)) b!760789))

(assert (= (and b!760789 (not res!514635)) b!760792))

(assert (=> b!760795 m!707661))

(declare-fun m!707871 () Bool)

(assert (=> b!760795 m!707871))

(assert (=> b!760795 m!707871))

(assert (=> b!760795 m!707463))

(declare-fun m!707873 () Bool)

(assert (=> b!760795 m!707873))

(declare-fun m!707875 () Bool)

(assert (=> b!760792 m!707875))

(assert (=> b!760787 m!707875))

(assert (=> b!760789 m!707875))

(assert (=> d!100615 m!707661))

(declare-fun m!707877 () Bool)

(assert (=> d!100615 m!707877))

(assert (=> d!100615 m!707489))

(assert (=> b!760560 d!100615))

(declare-fun d!100617 () Bool)

(declare-fun lt!338957 () (_ BitVec 32))

(assert (=> d!100617 (and (bvsge lt!338957 #b00000000000000000000000000000000) (bvslt lt!338957 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100617 (= lt!338957 (choose!52 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!100617 (validMask!0 mask!3328)))

(assert (=> d!100617 (= (nextIndex!0 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338957)))

(declare-fun bs!21389 () Bool)

(assert (= bs!21389 d!100617))

(assert (=> bs!21389 m!707469))

(declare-fun m!707879 () Bool)

(assert (=> bs!21389 m!707879))

(assert (=> bs!21389 m!707489))

(assert (=> b!760560 d!100617))

(declare-fun b!760796 () Bool)

(declare-fun lt!338958 () SeekEntryResult!7746)

(assert (=> b!760796 (and (bvsge (index!33354 lt!338958) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338958) (size!20567 a!3186)))))

(declare-fun res!514637 () Bool)

(assert (=> b!760796 (= res!514637 (= (select (arr!20146 a!3186) (index!33354 lt!338958)) (select (arr!20146 a!3186) j!159)))))

(declare-fun e!424120 () Bool)

(assert (=> b!760796 (=> res!514637 e!424120)))

(declare-fun e!424117 () Bool)

(assert (=> b!760796 (= e!424117 e!424120)))

(declare-fun d!100619 () Bool)

(declare-fun e!424118 () Bool)

(assert (=> d!100619 e!424118))

(declare-fun c!83465 () Bool)

(assert (=> d!100619 (= c!83465 (and ((_ is Intermediate!7746) lt!338958) (undefined!8558 lt!338958)))))

(declare-fun e!424119 () SeekEntryResult!7746)

(assert (=> d!100619 (= lt!338958 e!424119)))

(declare-fun c!83463 () Bool)

(assert (=> d!100619 (= c!83463 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!338959 () (_ BitVec 64))

(assert (=> d!100619 (= lt!338959 (select (arr!20146 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!100619 (validMask!0 mask!3328)))

(assert (=> d!100619 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338958)))

(declare-fun b!760797 () Bool)

(assert (=> b!760797 (= e!424118 e!424117)))

(declare-fun res!514639 () Bool)

(assert (=> b!760797 (= res!514639 (and ((_ is Intermediate!7746) lt!338958) (not (undefined!8558 lt!338958)) (bvslt (x!64241 lt!338958) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338958) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338958) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!760797 (=> (not res!514639) (not e!424117))))

(declare-fun b!760798 () Bool)

(assert (=> b!760798 (and (bvsge (index!33354 lt!338958) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338958) (size!20567 a!3186)))))

(declare-fun res!514638 () Bool)

(assert (=> b!760798 (= res!514638 (= (select (arr!20146 a!3186) (index!33354 lt!338958)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760798 (=> res!514638 e!424120)))

(declare-fun b!760799 () Bool)

(assert (=> b!760799 (= e!424118 (bvsge (x!64241 lt!338958) #b01111111111111111111111111111110))))

(declare-fun b!760800 () Bool)

(declare-fun e!424121 () SeekEntryResult!7746)

(assert (=> b!760800 (= e!424121 (Intermediate!7746 false (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!760801 () Bool)

(assert (=> b!760801 (and (bvsge (index!33354 lt!338958) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338958) (size!20567 a!3186)))))

(assert (=> b!760801 (= e!424120 (= (select (arr!20146 a!3186) (index!33354 lt!338958)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760802 () Bool)

(assert (=> b!760802 (= e!424119 (Intermediate!7746 true (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!760803 () Bool)

(assert (=> b!760803 (= e!424119 e!424121)))

(declare-fun c!83464 () Bool)

(assert (=> b!760803 (= c!83464 (or (= lt!338959 (select (arr!20146 a!3186) j!159)) (= (bvadd lt!338959 lt!338959) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760804 () Bool)

(assert (=> b!760804 (= e!424121 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100619 c!83463) b!760802))

(assert (= (and d!100619 (not c!83463)) b!760803))

(assert (= (and b!760803 c!83464) b!760800))

(assert (= (and b!760803 (not c!83464)) b!760804))

(assert (= (and d!100619 c!83465) b!760799))

(assert (= (and d!100619 (not c!83465)) b!760797))

(assert (= (and b!760797 res!514639) b!760796))

(assert (= (and b!760796 (not res!514637)) b!760798))

(assert (= (and b!760798 (not res!514638)) b!760801))

(assert (=> b!760804 m!707557))

(declare-fun m!707881 () Bool)

(assert (=> b!760804 m!707881))

(assert (=> b!760804 m!707881))

(assert (=> b!760804 m!707463))

(declare-fun m!707883 () Bool)

(assert (=> b!760804 m!707883))

(declare-fun m!707885 () Bool)

(assert (=> b!760801 m!707885))

(assert (=> b!760796 m!707885))

(assert (=> b!760798 m!707885))

(assert (=> d!100619 m!707557))

(declare-fun m!707887 () Bool)

(assert (=> d!100619 m!707887))

(assert (=> d!100619 m!707489))

(assert (=> b!760539 d!100619))

(declare-fun d!100621 () Bool)

(declare-fun lt!338960 () (_ BitVec 32))

(assert (=> d!100621 (and (bvsge lt!338960 #b00000000000000000000000000000000) (bvslt lt!338960 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100621 (= lt!338960 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!100621 (validMask!0 mask!3328)))

(assert (=> d!100621 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!338960)))

(declare-fun bs!21390 () Bool)

(assert (= bs!21390 d!100621))

(declare-fun m!707889 () Bool)

(assert (=> bs!21390 m!707889))

(assert (=> bs!21390 m!707489))

(assert (=> b!760539 d!100621))

(declare-fun b!760805 () Bool)

(declare-fun lt!338961 () SeekEntryResult!7746)

(assert (=> b!760805 (and (bvsge (index!33354 lt!338961) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338961) (size!20567 lt!338746)))))

(declare-fun res!514640 () Bool)

(assert (=> b!760805 (= res!514640 (= (select (arr!20146 lt!338746) (index!33354 lt!338961)) lt!338743))))

(declare-fun e!424125 () Bool)

(assert (=> b!760805 (=> res!514640 e!424125)))

(declare-fun e!424122 () Bool)

(assert (=> b!760805 (= e!424122 e!424125)))

(declare-fun d!100623 () Bool)

(declare-fun e!424123 () Bool)

(assert (=> d!100623 e!424123))

(declare-fun c!83468 () Bool)

(assert (=> d!100623 (= c!83468 (and ((_ is Intermediate!7746) lt!338961) (undefined!8558 lt!338961)))))

(declare-fun e!424124 () SeekEntryResult!7746)

(assert (=> d!100623 (= lt!338961 e!424124)))

(declare-fun c!83466 () Bool)

(assert (=> d!100623 (= c!83466 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!338962 () (_ BitVec 64))

(assert (=> d!100623 (= lt!338962 (select (arr!20146 lt!338746) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!100623 (validMask!0 mask!3328)))

(assert (=> d!100623 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338743 lt!338746 mask!3328) lt!338961)))

(declare-fun b!760806 () Bool)

(assert (=> b!760806 (= e!424123 e!424122)))

(declare-fun res!514642 () Bool)

(assert (=> b!760806 (= res!514642 (and ((_ is Intermediate!7746) lt!338961) (not (undefined!8558 lt!338961)) (bvslt (x!64241 lt!338961) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338961) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338961) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!760806 (=> (not res!514642) (not e!424122))))

(declare-fun b!760807 () Bool)

(assert (=> b!760807 (and (bvsge (index!33354 lt!338961) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338961) (size!20567 lt!338746)))))

(declare-fun res!514641 () Bool)

(assert (=> b!760807 (= res!514641 (= (select (arr!20146 lt!338746) (index!33354 lt!338961)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760807 (=> res!514641 e!424125)))

(declare-fun b!760808 () Bool)

(assert (=> b!760808 (= e!424123 (bvsge (x!64241 lt!338961) #b01111111111111111111111111111110))))

(declare-fun e!424126 () SeekEntryResult!7746)

(declare-fun b!760809 () Bool)

(assert (=> b!760809 (= e!424126 (Intermediate!7746 false (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!760810 () Bool)

(assert (=> b!760810 (and (bvsge (index!33354 lt!338961) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338961) (size!20567 lt!338746)))))

(assert (=> b!760810 (= e!424125 (= (select (arr!20146 lt!338746) (index!33354 lt!338961)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760811 () Bool)

(assert (=> b!760811 (= e!424124 (Intermediate!7746 true (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!760812 () Bool)

(assert (=> b!760812 (= e!424124 e!424126)))

(declare-fun c!83467 () Bool)

(assert (=> b!760812 (= c!83467 (or (= lt!338962 lt!338743) (= (bvadd lt!338962 lt!338962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760813 () Bool)

(assert (=> b!760813 (= e!424126 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!338743 lt!338746 mask!3328))))

(assert (= (and d!100623 c!83466) b!760811))

(assert (= (and d!100623 (not c!83466)) b!760812))

(assert (= (and b!760812 c!83467) b!760809))

(assert (= (and b!760812 (not c!83467)) b!760813))

(assert (= (and d!100623 c!83468) b!760808))

(assert (= (and d!100623 (not c!83468)) b!760806))

(assert (= (and b!760806 res!514642) b!760805))

(assert (= (and b!760805 (not res!514640)) b!760807))

(assert (= (and b!760807 (not res!514641)) b!760810))

(assert (=> b!760813 m!707557))

(assert (=> b!760813 m!707881))

(assert (=> b!760813 m!707881))

(declare-fun m!707891 () Bool)

(assert (=> b!760813 m!707891))

(declare-fun m!707893 () Bool)

(assert (=> b!760810 m!707893))

(assert (=> b!760805 m!707893))

(assert (=> b!760807 m!707893))

(assert (=> d!100623 m!707557))

(declare-fun m!707895 () Bool)

(assert (=> d!100623 m!707895))

(assert (=> d!100623 m!707489))

(assert (=> b!760503 d!100623))

(assert (=> b!760503 d!100621))

(assert (=> b!760371 d!100601))

(declare-fun d!100625 () Bool)

(assert (=> d!100625 (arrayContainsKey!0 a!3186 lt!338895 #b00000000000000000000000000000000)))

(declare-fun lt!338965 () Unit!26332)

(declare-fun choose!13 (array!42068 (_ BitVec 64) (_ BitVec 32)) Unit!26332)

(assert (=> d!100625 (= lt!338965 (choose!13 a!3186 lt!338895 j!159))))

(assert (=> d!100625 (bvsge j!159 #b00000000000000000000000000000000)))

(assert (=> d!100625 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338895 j!159) lt!338965)))

(declare-fun bs!21391 () Bool)

(assert (= bs!21391 d!100625))

(assert (=> bs!21391 m!707739))

(declare-fun m!707897 () Bool)

(assert (=> bs!21391 m!707897))

(assert (=> b!760657 d!100625))

(declare-fun d!100627 () Bool)

(declare-fun res!514643 () Bool)

(declare-fun e!424127 () Bool)

(assert (=> d!100627 (=> res!514643 e!424127)))

(assert (=> d!100627 (= res!514643 (= (select (arr!20146 a!3186) #b00000000000000000000000000000000) lt!338895))))

(assert (=> d!100627 (= (arrayContainsKey!0 a!3186 lt!338895 #b00000000000000000000000000000000) e!424127)))

(declare-fun b!760814 () Bool)

(declare-fun e!424128 () Bool)

(assert (=> b!760814 (= e!424127 e!424128)))

(declare-fun res!514644 () Bool)

(assert (=> b!760814 (=> (not res!514644) (not e!424128))))

(assert (=> b!760814 (= res!514644 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20567 a!3186)))))

(declare-fun b!760815 () Bool)

(assert (=> b!760815 (= e!424128 (arrayContainsKey!0 a!3186 lt!338895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100627 (not res!514643)) b!760814))

(assert (= (and b!760814 res!514644) b!760815))

(assert (=> d!100627 m!707561))

(declare-fun m!707899 () Bool)

(assert (=> b!760815 m!707899))

(assert (=> b!760657 d!100627))

(assert (=> b!760657 d!100495))

(assert (=> d!100523 d!100535))

(assert (=> d!100495 d!100525))

(assert (=> d!100495 d!100527))

(assert (=> d!100495 d!100535))

(declare-fun b!760816 () Bool)

(declare-fun e!424130 () Bool)

(declare-fun e!424131 () Bool)

(assert (=> b!760816 (= e!424130 e!424131)))

(declare-fun c!83469 () Bool)

(assert (=> b!760816 (= c!83469 (validKeyInArray!0 (select (arr!20146 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!760817 () Bool)

(declare-fun e!424129 () Bool)

(assert (=> b!760817 (= e!424131 e!424129)))

(declare-fun lt!338966 () (_ BitVec 64))

(assert (=> b!760817 (= lt!338966 (select (arr!20146 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!338968 () Unit!26332)

(assert (=> b!760817 (= lt!338968 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338966 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!760817 (arrayContainsKey!0 a!3186 lt!338966 #b00000000000000000000000000000000)))

(declare-fun lt!338967 () Unit!26332)

(assert (=> b!760817 (= lt!338967 lt!338968)))

(declare-fun res!514646 () Bool)

(assert (=> b!760817 (= res!514646 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7746 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760817 (=> (not res!514646) (not e!424129))))

(declare-fun d!100629 () Bool)

(declare-fun res!514645 () Bool)

(assert (=> d!100629 (=> res!514645 e!424130)))

(assert (=> d!100629 (= res!514645 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20567 a!3186)))))

(assert (=> d!100629 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328) e!424130)))

(declare-fun bm!34952 () Bool)

(declare-fun call!34955 () Bool)

(assert (=> bm!34952 (= call!34955 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760818 () Bool)

(assert (=> b!760818 (= e!424129 call!34955)))

(declare-fun b!760819 () Bool)

(assert (=> b!760819 (= e!424131 call!34955)))

(assert (= (and d!100629 (not res!514645)) b!760816))

(assert (= (and b!760816 c!83469) b!760817))

(assert (= (and b!760816 (not c!83469)) b!760819))

(assert (= (and b!760817 res!514646) b!760818))

(assert (= (or b!760818 b!760819) bm!34952))

(declare-fun m!707901 () Bool)

(assert (=> b!760816 m!707901))

(assert (=> b!760816 m!707901))

(declare-fun m!707903 () Bool)

(assert (=> b!760816 m!707903))

(assert (=> b!760817 m!707901))

(declare-fun m!707905 () Bool)

(assert (=> b!760817 m!707905))

(declare-fun m!707907 () Bool)

(assert (=> b!760817 m!707907))

(assert (=> b!760817 m!707901))

(declare-fun m!707909 () Bool)

(assert (=> b!760817 m!707909))

(declare-fun m!707911 () Bool)

(assert (=> bm!34952 m!707911))

(assert (=> bm!34932 d!100629))

(assert (=> d!100565 d!100563))

(declare-fun d!100631 () Bool)

(assert (=> d!100631 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(assert (=> d!100631 true))

(declare-fun _$72!107 () Unit!26332)

(assert (=> d!100631 (= (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) _$72!107)))

(declare-fun bs!21392 () Bool)

(assert (= bs!21392 d!100631))

(assert (=> bs!21392 m!707497))

(assert (=> d!100565 d!100631))

(assert (=> d!100565 d!100535))

(declare-fun b!760820 () Bool)

(declare-fun c!83470 () Bool)

(declare-fun lt!338969 () (_ BitVec 64))

(assert (=> b!760820 (= c!83470 (= lt!338969 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424132 () SeekEntryResult!7746)

(declare-fun e!424134 () SeekEntryResult!7746)

(assert (=> b!760820 (= e!424132 e!424134)))

(declare-fun b!760821 () Bool)

(declare-fun e!424133 () SeekEntryResult!7746)

(assert (=> b!760821 (= e!424133 Undefined!7746)))

(declare-fun d!100633 () Bool)

(declare-fun lt!338970 () SeekEntryResult!7746)

(assert (=> d!100633 (and (or ((_ is Undefined!7746) lt!338970) (not ((_ is Found!7746) lt!338970)) (and (bvsge (index!33353 lt!338970) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338970) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338970) ((_ is Found!7746) lt!338970) (not ((_ is MissingVacant!7746) lt!338970)) (not (= (index!33355 lt!338970) (index!33354 lt!338801))) (and (bvsge (index!33355 lt!338970) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338970) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338970) (ite ((_ is Found!7746) lt!338970) (= (select (arr!20146 a!3186) (index!33353 lt!338970)) (select (arr!20146 a!3186) j!159)) (and ((_ is MissingVacant!7746) lt!338970) (= (index!33355 lt!338970) (index!33354 lt!338801)) (= (select (arr!20146 a!3186) (index!33355 lt!338970)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100633 (= lt!338970 e!424133)))

(declare-fun c!83472 () Bool)

(assert (=> d!100633 (= c!83472 (bvsge (x!64241 lt!338801) #b01111111111111111111111111111110))))

(assert (=> d!100633 (= lt!338969 (select (arr!20146 a!3186) (index!33354 lt!338801)))))

(assert (=> d!100633 (validMask!0 mask!3328)))

(assert (=> d!100633 (= (seekKeyOrZeroReturnVacant!0 (x!64241 lt!338801) (index!33354 lt!338801) (index!33354 lt!338801) (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338970)))

(declare-fun b!760822 () Bool)

(assert (=> b!760822 (= e!424134 (MissingVacant!7746 (index!33354 lt!338801)))))

(declare-fun b!760823 () Bool)

(assert (=> b!760823 (= e!424132 (Found!7746 (index!33354 lt!338801)))))

(declare-fun b!760824 () Bool)

(assert (=> b!760824 (= e!424133 e!424132)))

(declare-fun c!83471 () Bool)

(assert (=> b!760824 (= c!83471 (= lt!338969 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!760825 () Bool)

(assert (=> b!760825 (= e!424134 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64241 lt!338801) #b00000000000000000000000000000001) (nextIndex!0 (index!33354 lt!338801) (x!64241 lt!338801) mask!3328) (index!33354 lt!338801) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100633 c!83472) b!760821))

(assert (= (and d!100633 (not c!83472)) b!760824))

(assert (= (and b!760824 c!83471) b!760823))

(assert (= (and b!760824 (not c!83471)) b!760820))

(assert (= (and b!760820 c!83470) b!760822))

(assert (= (and b!760820 (not c!83470)) b!760825))

(declare-fun m!707913 () Bool)

(assert (=> d!100633 m!707913))

(declare-fun m!707915 () Bool)

(assert (=> d!100633 m!707915))

(assert (=> d!100633 m!707579))

(assert (=> d!100633 m!707489))

(declare-fun m!707917 () Bool)

(assert (=> b!760825 m!707917))

(assert (=> b!760825 m!707917))

(assert (=> b!760825 m!707463))

(declare-fun m!707919 () Bool)

(assert (=> b!760825 m!707919))

(assert (=> b!760408 d!100633))

(declare-fun d!100635 () Bool)

(assert (=> d!100635 (arrayContainsKey!0 a!3186 lt!338787 #b00000000000000000000000000000000)))

(declare-fun lt!338971 () Unit!26332)

(assert (=> d!100635 (= lt!338971 (choose!13 a!3186 lt!338787 #b00000000000000000000000000000000))))

(assert (=> d!100635 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!100635 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338787 #b00000000000000000000000000000000) lt!338971)))

(declare-fun bs!21393 () Bool)

(assert (= bs!21393 d!100635))

(assert (=> bs!21393 m!707567))

(declare-fun m!707921 () Bool)

(assert (=> bs!21393 m!707921))

(assert (=> b!760372 d!100635))

(declare-fun d!100637 () Bool)

(declare-fun res!514647 () Bool)

(declare-fun e!424135 () Bool)

(assert (=> d!100637 (=> res!514647 e!424135)))

(assert (=> d!100637 (= res!514647 (= (select (arr!20146 a!3186) #b00000000000000000000000000000000) lt!338787))))

(assert (=> d!100637 (= (arrayContainsKey!0 a!3186 lt!338787 #b00000000000000000000000000000000) e!424135)))

(declare-fun b!760826 () Bool)

(declare-fun e!424136 () Bool)

(assert (=> b!760826 (= e!424135 e!424136)))

(declare-fun res!514648 () Bool)

(assert (=> b!760826 (=> (not res!514648) (not e!424136))))

(assert (=> b!760826 (= res!514648 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20567 a!3186)))))

(declare-fun b!760827 () Bool)

(assert (=> b!760827 (= e!424136 (arrayContainsKey!0 a!3186 lt!338787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100637 (not res!514647)) b!760826))

(assert (= (and b!760826 res!514648) b!760827))

(assert (=> d!100637 m!707561))

(declare-fun m!707923 () Bool)

(assert (=> b!760827 m!707923))

(assert (=> b!760372 d!100637))

(declare-fun b!760828 () Bool)

(declare-fun c!83474 () Bool)

(declare-fun lt!338974 () (_ BitVec 64))

(assert (=> b!760828 (= c!83474 (= lt!338974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424137 () SeekEntryResult!7746)

(declare-fun e!424139 () SeekEntryResult!7746)

(assert (=> b!760828 (= e!424137 e!424139)))

(declare-fun b!760829 () Bool)

(declare-fun lt!338973 () SeekEntryResult!7746)

(assert (=> b!760829 (= e!424139 (MissingZero!7746 (index!33354 lt!338973)))))

(declare-fun d!100639 () Bool)

(declare-fun lt!338972 () SeekEntryResult!7746)

(assert (=> d!100639 (and (or ((_ is Undefined!7746) lt!338972) (not ((_ is Found!7746) lt!338972)) (and (bvsge (index!33353 lt!338972) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338972) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338972) ((_ is Found!7746) lt!338972) (not ((_ is MissingZero!7746) lt!338972)) (and (bvsge (index!33352 lt!338972) #b00000000000000000000000000000000) (bvslt (index!33352 lt!338972) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338972) ((_ is Found!7746) lt!338972) ((_ is MissingZero!7746) lt!338972) (not ((_ is MissingVacant!7746) lt!338972)) (and (bvsge (index!33355 lt!338972) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338972) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338972) (ite ((_ is Found!7746) lt!338972) (= (select (arr!20146 a!3186) (index!33353 lt!338972)) (select (arr!20146 a!3186) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!7746) lt!338972) (= (select (arr!20146 a!3186) (index!33352 lt!338972)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7746) lt!338972) (= (select (arr!20146 a!3186) (index!33355 lt!338972)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!424138 () SeekEntryResult!7746)

(assert (=> d!100639 (= lt!338972 e!424138)))

(declare-fun c!83475 () Bool)

(assert (=> d!100639 (= c!83475 (and ((_ is Intermediate!7746) lt!338973) (undefined!8558 lt!338973)))))

(assert (=> d!100639 (= lt!338973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000) mask!3328) (select (arr!20146 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(assert (=> d!100639 (validMask!0 mask!3328)))

(assert (=> d!100639 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) lt!338972)))

(declare-fun b!760830 () Bool)

(assert (=> b!760830 (= e!424138 e!424137)))

(assert (=> b!760830 (= lt!338974 (select (arr!20146 a!3186) (index!33354 lt!338973)))))

(declare-fun c!83473 () Bool)

(assert (=> b!760830 (= c!83473 (= lt!338974 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760831 () Bool)

(assert (=> b!760831 (= e!424139 (seekKeyOrZeroReturnVacant!0 (x!64241 lt!338973) (index!33354 lt!338973) (index!33354 lt!338973) (select (arr!20146 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(declare-fun b!760832 () Bool)

(assert (=> b!760832 (= e!424137 (Found!7746 (index!33354 lt!338973)))))

(declare-fun b!760833 () Bool)

(assert (=> b!760833 (= e!424138 Undefined!7746)))

(assert (= (and d!100639 c!83475) b!760833))

(assert (= (and d!100639 (not c!83475)) b!760830))

(assert (= (and b!760830 c!83473) b!760832))

(assert (= (and b!760830 (not c!83473)) b!760828))

(assert (= (and b!760828 c!83474) b!760829))

(assert (= (and b!760828 (not c!83474)) b!760831))

(declare-fun m!707925 () Bool)

(assert (=> d!100639 m!707925))

(declare-fun m!707927 () Bool)

(assert (=> d!100639 m!707927))

(assert (=> d!100639 m!707561))

(declare-fun m!707929 () Bool)

(assert (=> d!100639 m!707929))

(assert (=> d!100639 m!707561))

(assert (=> d!100639 m!707927))

(assert (=> d!100639 m!707489))

(declare-fun m!707931 () Bool)

(assert (=> d!100639 m!707931))

(declare-fun m!707933 () Bool)

(assert (=> d!100639 m!707933))

(declare-fun m!707935 () Bool)

(assert (=> b!760830 m!707935))

(assert (=> b!760831 m!707561))

(declare-fun m!707937 () Bool)

(assert (=> b!760831 m!707937))

(assert (=> b!760372 d!100639))

(declare-fun b!760834 () Bool)

(declare-fun c!83476 () Bool)

(declare-fun lt!338975 () (_ BitVec 64))

(assert (=> b!760834 (= c!83476 (= lt!338975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424140 () SeekEntryResult!7746)

(declare-fun e!424142 () SeekEntryResult!7746)

(assert (=> b!760834 (= e!424140 e!424142)))

(declare-fun b!760835 () Bool)

(declare-fun e!424141 () SeekEntryResult!7746)

(assert (=> b!760835 (= e!424141 Undefined!7746)))

(declare-fun d!100641 () Bool)

(declare-fun lt!338976 () SeekEntryResult!7746)

(assert (=> d!100641 (and (or ((_ is Undefined!7746) lt!338976) (not ((_ is Found!7746) lt!338976)) (and (bvsge (index!33353 lt!338976) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338976) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338976) ((_ is Found!7746) lt!338976) (not ((_ is MissingVacant!7746) lt!338976)) (not (= (index!33355 lt!338976) resIntermediateIndex!5)) (and (bvsge (index!33355 lt!338976) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338976) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338976) (ite ((_ is Found!7746) lt!338976) (= (select (arr!20146 a!3186) (index!33353 lt!338976)) (select (arr!20146 a!3186) j!159)) (and ((_ is MissingVacant!7746) lt!338976) (= (index!33355 lt!338976) resIntermediateIndex!5) (= (select (arr!20146 a!3186) (index!33355 lt!338976)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100641 (= lt!338976 e!424141)))

(declare-fun c!83478 () Bool)

(assert (=> d!100641 (= c!83478 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100641 (= lt!338975 (select (arr!20146 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!100641 (validMask!0 mask!3328)))

(assert (=> d!100641 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!338976)))

(declare-fun b!760836 () Bool)

(assert (=> b!760836 (= e!424142 (MissingVacant!7746 resIntermediateIndex!5))))

(declare-fun b!760837 () Bool)

(assert (=> b!760837 (= e!424140 (Found!7746 (nextIndex!0 index!1321 x!1131 mask!3328)))))

(declare-fun b!760838 () Bool)

(assert (=> b!760838 (= e!424141 e!424140)))

(declare-fun c!83477 () Bool)

(assert (=> b!760838 (= c!83477 (= lt!338975 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!760839 () Bool)

(assert (=> b!760839 (= e!424142 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100641 c!83478) b!760835))

(assert (= (and d!100641 (not c!83478)) b!760838))

(assert (= (and b!760838 c!83477) b!760837))

(assert (= (and b!760838 (not c!83477)) b!760834))

(assert (= (and b!760834 c!83476) b!760836))

(assert (= (and b!760834 (not c!83476)) b!760839))

(declare-fun m!707939 () Bool)

(assert (=> d!100641 m!707939))

(declare-fun m!707941 () Bool)

(assert (=> d!100641 m!707941))

(assert (=> d!100641 m!707557))

(assert (=> d!100641 m!707887))

(assert (=> d!100641 m!707489))

(assert (=> b!760839 m!707557))

(assert (=> b!760839 m!707881))

(assert (=> b!760839 m!707881))

(assert (=> b!760839 m!707463))

(declare-fun m!707943 () Bool)

(assert (=> b!760839 m!707943))

(assert (=> b!760362 d!100641))

(assert (=> b!760362 d!100621))

(assert (=> d!100559 d!100535))

(assert (=> d!100503 d!100535))

(assert (=> d!100525 d!100535))

(declare-fun d!100643 () Bool)

(declare-fun res!514649 () Bool)

(declare-fun e!424143 () Bool)

(assert (=> d!100643 (=> res!514649 e!424143)))

(assert (=> d!100643 (= res!514649 (= (select (arr!20146 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2102))))

(assert (=> d!100643 (= (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!424143)))

(declare-fun b!760840 () Bool)

(declare-fun e!424144 () Bool)

(assert (=> b!760840 (= e!424143 e!424144)))

(declare-fun res!514650 () Bool)

(assert (=> b!760840 (=> (not res!514650) (not e!424144))))

(assert (=> b!760840 (= res!514650 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!20567 a!3186)))))

(declare-fun b!760841 () Bool)

(assert (=> b!760841 (= e!424144 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!100643 (not res!514649)) b!760840))

(assert (= (and b!760840 res!514650) b!760841))

(assert (=> d!100643 m!707901))

(declare-fun m!707945 () Bool)

(assert (=> b!760841 m!707945))

(assert (=> b!760590 d!100643))

(assert (=> d!100519 d!100535))

(declare-fun b!760842 () Bool)

(declare-fun lt!338977 () SeekEntryResult!7746)

(assert (=> b!760842 (and (bvsge (index!33354 lt!338977) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338977) (size!20567 lt!338746)))))

(declare-fun res!514651 () Bool)

(assert (=> b!760842 (= res!514651 (= (select (arr!20146 lt!338746) (index!33354 lt!338977)) lt!338743))))

(declare-fun e!424148 () Bool)

(assert (=> b!760842 (=> res!514651 e!424148)))

(declare-fun e!424145 () Bool)

(assert (=> b!760842 (= e!424145 e!424148)))

(declare-fun d!100645 () Bool)

(declare-fun e!424146 () Bool)

(assert (=> d!100645 e!424146))

(declare-fun c!83481 () Bool)

(assert (=> d!100645 (= c!83481 (and ((_ is Intermediate!7746) lt!338977) (undefined!8558 lt!338977)))))

(declare-fun e!424147 () SeekEntryResult!7746)

(assert (=> d!100645 (= lt!338977 e!424147)))

(declare-fun c!83479 () Bool)

(assert (=> d!100645 (= c!83479 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!338978 () (_ BitVec 64))

(assert (=> d!100645 (= lt!338978 (select (arr!20146 lt!338746) (nextIndex!0 (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!100645 (validMask!0 mask!3328)))

(assert (=> d!100645 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338743 lt!338746 mask!3328) lt!338977)))

(declare-fun b!760843 () Bool)

(assert (=> b!760843 (= e!424146 e!424145)))

(declare-fun res!514653 () Bool)

(assert (=> b!760843 (= res!514653 (and ((_ is Intermediate!7746) lt!338977) (not (undefined!8558 lt!338977)) (bvslt (x!64241 lt!338977) #b01111111111111111111111111111110) (bvsge (x!64241 lt!338977) #b00000000000000000000000000000000) (bvsge (x!64241 lt!338977) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760843 (=> (not res!514653) (not e!424145))))

(declare-fun b!760844 () Bool)

(assert (=> b!760844 (and (bvsge (index!33354 lt!338977) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338977) (size!20567 lt!338746)))))

(declare-fun res!514652 () Bool)

(assert (=> b!760844 (= res!514652 (= (select (arr!20146 lt!338746) (index!33354 lt!338977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760844 (=> res!514652 e!424148)))

(declare-fun b!760845 () Bool)

(assert (=> b!760845 (= e!424146 (bvsge (x!64241 lt!338977) #b01111111111111111111111111111110))))

(declare-fun b!760846 () Bool)

(declare-fun e!424149 () SeekEntryResult!7746)

(assert (=> b!760846 (= e!424149 (Intermediate!7746 false (nextIndex!0 (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760847 () Bool)

(assert (=> b!760847 (and (bvsge (index!33354 lt!338977) #b00000000000000000000000000000000) (bvslt (index!33354 lt!338977) (size!20567 lt!338746)))))

(assert (=> b!760847 (= e!424148 (= (select (arr!20146 lt!338746) (index!33354 lt!338977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760848 () Bool)

(assert (=> b!760848 (= e!424147 (Intermediate!7746 true (nextIndex!0 (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760849 () Bool)

(assert (=> b!760849 (= e!424147 e!424149)))

(declare-fun c!83480 () Bool)

(assert (=> b!760849 (= c!83480 (or (= lt!338978 lt!338743) (= (bvadd lt!338978 lt!338978) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760850 () Bool)

(assert (=> b!760850 (= e!424149 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!338743 lt!338746 mask!3328))))

(assert (= (and d!100645 c!83479) b!760848))

(assert (= (and d!100645 (not c!83479)) b!760849))

(assert (= (and b!760849 c!83480) b!760846))

(assert (= (and b!760849 (not c!83480)) b!760850))

(assert (= (and d!100645 c!83481) b!760845))

(assert (= (and d!100645 (not c!83481)) b!760843))

(assert (= (and b!760843 res!514653) b!760842))

(assert (= (and b!760842 (not res!514651)) b!760844))

(assert (= (and b!760844 (not res!514652)) b!760847))

(assert (=> b!760850 m!707649))

(declare-fun m!707947 () Bool)

(assert (=> b!760850 m!707947))

(assert (=> b!760850 m!707947))

(declare-fun m!707949 () Bool)

(assert (=> b!760850 m!707949))

(declare-fun m!707951 () Bool)

(assert (=> b!760847 m!707951))

(assert (=> b!760842 m!707951))

(assert (=> b!760844 m!707951))

(assert (=> d!100645 m!707649))

(declare-fun m!707953 () Bool)

(assert (=> d!100645 m!707953))

(assert (=> d!100645 m!707489))

(assert (=> b!760512 d!100645))

(declare-fun d!100647 () Bool)

(declare-fun lt!338979 () (_ BitVec 32))

(assert (=> d!100647 (and (bvsge lt!338979 #b00000000000000000000000000000000) (bvslt lt!338979 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100647 (= lt!338979 (choose!52 (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!100647 (validMask!0 mask!3328)))

(assert (=> d!100647 (= (nextIndex!0 (toIndex!0 lt!338743 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338979)))

(declare-fun bs!21394 () Bool)

(assert (= bs!21394 d!100647))

(assert (=> bs!21394 m!707479))

(declare-fun m!707955 () Bool)

(assert (=> bs!21394 m!707955))

(assert (=> bs!21394 m!707489))

(assert (=> b!760512 d!100647))

(declare-fun b!760851 () Bool)

(declare-fun c!83482 () Bool)

(declare-fun lt!338980 () (_ BitVec 64))

(assert (=> b!760851 (= c!83482 (= lt!338980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424150 () SeekEntryResult!7746)

(declare-fun e!424152 () SeekEntryResult!7746)

(assert (=> b!760851 (= e!424150 e!424152)))

(declare-fun b!760852 () Bool)

(declare-fun e!424151 () SeekEntryResult!7746)

(assert (=> b!760852 (= e!424151 Undefined!7746)))

(declare-fun lt!338981 () SeekEntryResult!7746)

(declare-fun d!100649 () Bool)

(assert (=> d!100649 (and (or ((_ is Undefined!7746) lt!338981) (not ((_ is Found!7746) lt!338981)) (and (bvsge (index!33353 lt!338981) #b00000000000000000000000000000000) (bvslt (index!33353 lt!338981) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338981) ((_ is Found!7746) lt!338981) (not ((_ is MissingVacant!7746) lt!338981)) (not (= (index!33355 lt!338981) (index!33354 lt!338804))) (and (bvsge (index!33355 lt!338981) #b00000000000000000000000000000000) (bvslt (index!33355 lt!338981) (size!20567 a!3186)))) (or ((_ is Undefined!7746) lt!338981) (ite ((_ is Found!7746) lt!338981) (= (select (arr!20146 a!3186) (index!33353 lt!338981)) k0!2102) (and ((_ is MissingVacant!7746) lt!338981) (= (index!33355 lt!338981) (index!33354 lt!338804)) (= (select (arr!20146 a!3186) (index!33355 lt!338981)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100649 (= lt!338981 e!424151)))

(declare-fun c!83484 () Bool)

(assert (=> d!100649 (= c!83484 (bvsge (x!64241 lt!338804) #b01111111111111111111111111111110))))

(assert (=> d!100649 (= lt!338980 (select (arr!20146 a!3186) (index!33354 lt!338804)))))

(assert (=> d!100649 (validMask!0 mask!3328)))

(assert (=> d!100649 (= (seekKeyOrZeroReturnVacant!0 (x!64241 lt!338804) (index!33354 lt!338804) (index!33354 lt!338804) k0!2102 a!3186 mask!3328) lt!338981)))

(declare-fun b!760853 () Bool)

(assert (=> b!760853 (= e!424152 (MissingVacant!7746 (index!33354 lt!338804)))))

(declare-fun b!760854 () Bool)

(assert (=> b!760854 (= e!424150 (Found!7746 (index!33354 lt!338804)))))

(declare-fun b!760855 () Bool)

(assert (=> b!760855 (= e!424151 e!424150)))

(declare-fun c!83483 () Bool)

(assert (=> b!760855 (= c!83483 (= lt!338980 k0!2102))))

(declare-fun b!760856 () Bool)

(assert (=> b!760856 (= e!424152 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64241 lt!338804) #b00000000000000000000000000000001) (nextIndex!0 (index!33354 lt!338804) (x!64241 lt!338804) mask!3328) (index!33354 lt!338804) k0!2102 a!3186 mask!3328))))

(assert (= (and d!100649 c!83484) b!760852))

(assert (= (and d!100649 (not c!83484)) b!760855))

(assert (= (and b!760855 c!83483) b!760854))

(assert (= (and b!760855 (not c!83483)) b!760851))

(assert (= (and b!760851 c!83482) b!760853))

(assert (= (and b!760851 (not c!83482)) b!760856))

(declare-fun m!707957 () Bool)

(assert (=> d!100649 m!707957))

(declare-fun m!707959 () Bool)

(assert (=> d!100649 m!707959))

(assert (=> d!100649 m!707593))

(assert (=> d!100649 m!707489))

(declare-fun m!707961 () Bool)

(assert (=> b!760856 m!707961))

(assert (=> b!760856 m!707961))

(declare-fun m!707963 () Bool)

(assert (=> b!760856 m!707963))

(assert (=> b!760414 d!100649))

(declare-fun b!760857 () Bool)

(declare-fun e!424155 () Bool)

(declare-fun e!424156 () Bool)

(assert (=> b!760857 (= e!424155 e!424156)))

(declare-fun c!83485 () Bool)

(assert (=> b!760857 (= c!83485 (validKeyInArray!0 (select (arr!20146 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!34953 () Bool)

(declare-fun call!34956 () Bool)

(assert (=> bm!34953 (= call!34956 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!83485 (Cons!14144 (select (arr!20146 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!83411 (Cons!14144 (select (arr!20146 a!3186) #b00000000000000000000000000000000) Nil!14145) Nil!14145)) (ite c!83411 (Cons!14144 (select (arr!20146 a!3186) #b00000000000000000000000000000000) Nil!14145) Nil!14145))))))

(declare-fun b!760858 () Bool)

(assert (=> b!760858 (= e!424156 call!34956)))

(declare-fun d!100651 () Bool)

(declare-fun res!514654 () Bool)

(declare-fun e!424153 () Bool)

(assert (=> d!100651 (=> res!514654 e!424153)))

(assert (=> d!100651 (= res!514654 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20567 a!3186)))))

(assert (=> d!100651 (= (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83411 (Cons!14144 (select (arr!20146 a!3186) #b00000000000000000000000000000000) Nil!14145) Nil!14145)) e!424153)))

(declare-fun b!760859 () Bool)

(assert (=> b!760859 (= e!424153 e!424155)))

(declare-fun res!514656 () Bool)

(assert (=> b!760859 (=> (not res!514656) (not e!424155))))

(declare-fun e!424154 () Bool)

(assert (=> b!760859 (= res!514656 (not e!424154))))

(declare-fun res!514655 () Bool)

(assert (=> b!760859 (=> (not res!514655) (not e!424154))))

(assert (=> b!760859 (= res!514655 (validKeyInArray!0 (select (arr!20146 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!760860 () Bool)

(assert (=> b!760860 (= e!424156 call!34956)))

(declare-fun b!760861 () Bool)

(assert (=> b!760861 (= e!424154 (contains!4067 (ite c!83411 (Cons!14144 (select (arr!20146 a!3186) #b00000000000000000000000000000000) Nil!14145) Nil!14145) (select (arr!20146 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!100651 (not res!514654)) b!760859))

(assert (= (and b!760859 res!514655) b!760861))

(assert (= (and b!760859 res!514656) b!760857))

(assert (= (and b!760857 c!83485) b!760858))

(assert (= (and b!760857 (not c!83485)) b!760860))

(assert (= (or b!760858 b!760860) bm!34953))

(assert (=> b!760857 m!707901))

(assert (=> b!760857 m!707901))

(assert (=> b!760857 m!707903))

(assert (=> bm!34953 m!707901))

(declare-fun m!707965 () Bool)

(assert (=> bm!34953 m!707965))

(assert (=> b!760859 m!707901))

(assert (=> b!760859 m!707901))

(assert (=> b!760859 m!707903))

(assert (=> b!760861 m!707901))

(assert (=> b!760861 m!707901))

(declare-fun m!707967 () Bool)

(assert (=> b!760861 m!707967))

(assert (=> bm!34940 d!100651))

(assert (=> b!760641 d!100601))

(check-sat (not b!760783) (not d!100633) (not d!100603) (not d!100623) (not d!100625) (not b!760861) (not d!100647) (not b!760816) (not d!100621) (not b!760782) (not d!100649) (not d!100639) (not b!760804) (not b!760831) (not b!760825) (not d!100645) (not b!760841) (not b!760856) (not d!100607) (not b!760795) (not d!100615) (not d!100611) (not b!760850) (not b!760817) (not bm!34953) (not d!100641) (not bm!34951) (not b!760770) (not d!100617) (not d!100631) (not bm!34952) (not b!760827) (not b!760813) (not b!760859) (not d!100619) (not d!100609) (not b!760776) (not b!760839) (not d!100635) (not b!760784) (not b!760857) (not b!760815))
(check-sat)
