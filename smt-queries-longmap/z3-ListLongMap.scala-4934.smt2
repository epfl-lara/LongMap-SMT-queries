; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67916 () Bool)

(assert start!67916)

(declare-datatypes ((SeekEntryResult!8133 0))(
  ( (MissingZero!8133 (index!34900 (_ BitVec 32))) (Found!8133 (index!34901 (_ BitVec 32))) (Intermediate!8133 (undefined!8945 Bool) (index!34902 (_ BitVec 32)) (x!65834 (_ BitVec 32))) (Undefined!8133) (MissingVacant!8133 (index!34903 (_ BitVec 32))) )
))
(declare-fun lt!352880 () SeekEntryResult!8133)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42893 0))(
  ( (array!42894 (arr!20533 (Array (_ BitVec 32) (_ BitVec 64))) (size!20954 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42893)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!790424 () Bool)

(declare-fun e!439304 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42893 (_ BitVec 32)) SeekEntryResult!8133)

(assert (=> b!790424 (= e!439304 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!352880))))

(declare-fun b!790425 () Bool)

(declare-fun e!439305 () Bool)

(declare-fun e!439310 () Bool)

(assert (=> b!790425 (= e!439305 e!439310)))

(declare-fun res!535535 () Bool)

(assert (=> b!790425 (=> (not res!535535) (not e!439310))))

(declare-fun lt!352876 () SeekEntryResult!8133)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790425 (= res!535535 (or (= lt!352876 (MissingZero!8133 i!1173)) (= lt!352876 (MissingVacant!8133 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42893 (_ BitVec 32)) SeekEntryResult!8133)

(assert (=> b!790425 (= lt!352876 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790426 () Bool)

(declare-fun res!535539 () Bool)

(declare-fun e!439307 () Bool)

(assert (=> b!790426 (=> (not res!535539) (not e!439307))))

(assert (=> b!790426 (= res!535539 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20533 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790427 () Bool)

(declare-fun res!535541 () Bool)

(assert (=> b!790427 (=> (not res!535541) (not e!439305))))

(declare-fun arrayContainsKey!0 (array!42893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790427 (= res!535541 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!439308 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!790428 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!790428 (= e!439308 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) (Found!8133 j!159)))))

(declare-fun b!790429 () Bool)

(declare-fun res!535536 () Bool)

(assert (=> b!790429 (=> (not res!535536) (not e!439310))))

(assert (=> b!790429 (= res!535536 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20954 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20954 a!3186))))))

(declare-fun b!790430 () Bool)

(declare-fun res!535540 () Bool)

(assert (=> b!790430 (=> (not res!535540) (not e!439305))))

(assert (=> b!790430 (= res!535540 (and (= (size!20954 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20954 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20954 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790431 () Bool)

(declare-fun res!535544 () Bool)

(assert (=> b!790431 (=> (not res!535544) (not e!439310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42893 (_ BitVec 32)) Bool)

(assert (=> b!790431 (= res!535544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!535530 () Bool)

(assert (=> start!67916 (=> (not res!535530) (not e!439305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67916 (= res!535530 (validMask!0 mask!3328))))

(assert (=> start!67916 e!439305))

(assert (=> start!67916 true))

(declare-fun array_inv!16329 (array!42893) Bool)

(assert (=> start!67916 (array_inv!16329 a!3186)))

(declare-fun b!790432 () Bool)

(assert (=> b!790432 (= e!439310 e!439307)))

(declare-fun res!535538 () Bool)

(assert (=> b!790432 (=> (not res!535538) (not e!439307))))

(declare-fun lt!352873 () SeekEntryResult!8133)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42893 (_ BitVec 32)) SeekEntryResult!8133)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790432 (= res!535538 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328) (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!352873))))

(assert (=> b!790432 (= lt!352873 (Intermediate!8133 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790433 () Bool)

(declare-fun res!535533 () Bool)

(assert (=> b!790433 (=> (not res!535533) (not e!439305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790433 (= res!535533 (validKeyInArray!0 (select (arr!20533 a!3186) j!159)))))

(declare-fun b!790434 () Bool)

(declare-fun e!439309 () Bool)

(assert (=> b!790434 (= e!439307 e!439309)))

(declare-fun res!535543 () Bool)

(assert (=> b!790434 (=> (not res!535543) (not e!439309))))

(declare-fun lt!352879 () SeekEntryResult!8133)

(declare-fun lt!352875 () SeekEntryResult!8133)

(assert (=> b!790434 (= res!535543 (= lt!352879 lt!352875))))

(declare-fun lt!352877 () array!42893)

(declare-fun lt!352878 () (_ BitVec 64))

(assert (=> b!790434 (= lt!352875 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352878 lt!352877 mask!3328))))

(assert (=> b!790434 (= lt!352879 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352878 mask!3328) lt!352878 lt!352877 mask!3328))))

(assert (=> b!790434 (= lt!352878 (select (store (arr!20533 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790434 (= lt!352877 (array!42894 (store (arr!20533 a!3186) i!1173 k0!2102) (size!20954 a!3186)))))

(declare-fun b!790435 () Bool)

(declare-fun res!535537 () Bool)

(assert (=> b!790435 (=> (not res!535537) (not e!439310))))

(declare-datatypes ((List!14535 0))(
  ( (Nil!14532) (Cons!14531 (h!15657 (_ BitVec 64)) (t!20850 List!14535)) )
))
(declare-fun arrayNoDuplicates!0 (array!42893 (_ BitVec 32) List!14535) Bool)

(assert (=> b!790435 (= res!535537 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14532))))

(declare-fun b!790436 () Bool)

(assert (=> b!790436 (= e!439308 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!352873))))

(declare-fun b!790437 () Bool)

(declare-fun res!535542 () Bool)

(assert (=> b!790437 (=> (not res!535542) (not e!439307))))

(assert (=> b!790437 (= res!535542 e!439308)))

(declare-fun c!87856 () Bool)

(assert (=> b!790437 (= c!87856 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790438 () Bool)

(declare-fun res!535534 () Bool)

(assert (=> b!790438 (=> (not res!535534) (not e!439305))))

(assert (=> b!790438 (= res!535534 (validKeyInArray!0 k0!2102))))

(declare-fun b!790439 () Bool)

(get-info :version)

(assert (=> b!790439 (= e!439309 (not ((_ is Intermediate!8133) lt!352875)))))

(declare-fun e!439303 () Bool)

(assert (=> b!790439 e!439303))

(declare-fun res!535532 () Bool)

(assert (=> b!790439 (=> (not res!535532) (not e!439303))))

(assert (=> b!790439 (= res!535532 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27418 0))(
  ( (Unit!27419) )
))
(declare-fun lt!352874 () Unit!27418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27418)

(assert (=> b!790439 (= lt!352874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790440 () Bool)

(assert (=> b!790440 (= e!439303 e!439304)))

(declare-fun res!535531 () Bool)

(assert (=> b!790440 (=> (not res!535531) (not e!439304))))

(assert (=> b!790440 (= res!535531 (= (seekEntryOrOpen!0 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!352880))))

(assert (=> b!790440 (= lt!352880 (Found!8133 j!159))))

(assert (= (and start!67916 res!535530) b!790430))

(assert (= (and b!790430 res!535540) b!790433))

(assert (= (and b!790433 res!535533) b!790438))

(assert (= (and b!790438 res!535534) b!790427))

(assert (= (and b!790427 res!535541) b!790425))

(assert (= (and b!790425 res!535535) b!790431))

(assert (= (and b!790431 res!535544) b!790435))

(assert (= (and b!790435 res!535537) b!790429))

(assert (= (and b!790429 res!535536) b!790432))

(assert (= (and b!790432 res!535538) b!790426))

(assert (= (and b!790426 res!535539) b!790437))

(assert (= (and b!790437 c!87856) b!790436))

(assert (= (and b!790437 (not c!87856)) b!790428))

(assert (= (and b!790437 res!535542) b!790434))

(assert (= (and b!790434 res!535543) b!790439))

(assert (= (and b!790439 res!535532) b!790440))

(assert (= (and b!790440 res!535531) b!790424))

(declare-fun m!731355 () Bool)

(assert (=> b!790425 m!731355))

(declare-fun m!731357 () Bool)

(assert (=> b!790435 m!731357))

(declare-fun m!731359 () Bool)

(assert (=> b!790432 m!731359))

(assert (=> b!790432 m!731359))

(declare-fun m!731361 () Bool)

(assert (=> b!790432 m!731361))

(assert (=> b!790432 m!731361))

(assert (=> b!790432 m!731359))

(declare-fun m!731363 () Bool)

(assert (=> b!790432 m!731363))

(declare-fun m!731365 () Bool)

(assert (=> b!790427 m!731365))

(assert (=> b!790440 m!731359))

(assert (=> b!790440 m!731359))

(declare-fun m!731367 () Bool)

(assert (=> b!790440 m!731367))

(assert (=> b!790433 m!731359))

(assert (=> b!790433 m!731359))

(declare-fun m!731369 () Bool)

(assert (=> b!790433 m!731369))

(declare-fun m!731371 () Bool)

(assert (=> b!790431 m!731371))

(declare-fun m!731373 () Bool)

(assert (=> start!67916 m!731373))

(declare-fun m!731375 () Bool)

(assert (=> start!67916 m!731375))

(assert (=> b!790428 m!731359))

(assert (=> b!790428 m!731359))

(declare-fun m!731377 () Bool)

(assert (=> b!790428 m!731377))

(declare-fun m!731379 () Bool)

(assert (=> b!790439 m!731379))

(declare-fun m!731381 () Bool)

(assert (=> b!790439 m!731381))

(assert (=> b!790436 m!731359))

(assert (=> b!790436 m!731359))

(declare-fun m!731383 () Bool)

(assert (=> b!790436 m!731383))

(assert (=> b!790424 m!731359))

(assert (=> b!790424 m!731359))

(declare-fun m!731385 () Bool)

(assert (=> b!790424 m!731385))

(declare-fun m!731387 () Bool)

(assert (=> b!790434 m!731387))

(declare-fun m!731389 () Bool)

(assert (=> b!790434 m!731389))

(declare-fun m!731391 () Bool)

(assert (=> b!790434 m!731391))

(declare-fun m!731393 () Bool)

(assert (=> b!790434 m!731393))

(assert (=> b!790434 m!731389))

(declare-fun m!731395 () Bool)

(assert (=> b!790434 m!731395))

(declare-fun m!731397 () Bool)

(assert (=> b!790438 m!731397))

(declare-fun m!731399 () Bool)

(assert (=> b!790426 m!731399))

(check-sat (not b!790425) (not b!790428) (not b!790432) (not b!790424) (not b!790439) (not b!790440) (not b!790435) (not b!790433) (not b!790427) (not b!790438) (not b!790436) (not start!67916) (not b!790434) (not b!790431))
(check-sat)
(get-model)

(declare-fun b!790504 () Bool)

(declare-fun e!439342 () SeekEntryResult!8133)

(declare-fun lt!352913 () SeekEntryResult!8133)

(assert (=> b!790504 (= e!439342 (MissingZero!8133 (index!34902 lt!352913)))))

(declare-fun b!790505 () Bool)

(declare-fun e!439343 () SeekEntryResult!8133)

(assert (=> b!790505 (= e!439343 (Found!8133 (index!34902 lt!352913)))))

(declare-fun b!790506 () Bool)

(assert (=> b!790506 (= e!439342 (seekKeyOrZeroReturnVacant!0 (x!65834 lt!352913) (index!34902 lt!352913) (index!34902 lt!352913) (select (arr!20533 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790507 () Bool)

(declare-fun c!87868 () Bool)

(declare-fun lt!352911 () (_ BitVec 64))

(assert (=> b!790507 (= c!87868 (= lt!352911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790507 (= e!439343 e!439342)))

(declare-fun d!102971 () Bool)

(declare-fun lt!352912 () SeekEntryResult!8133)

(assert (=> d!102971 (and (or ((_ is Undefined!8133) lt!352912) (not ((_ is Found!8133) lt!352912)) (and (bvsge (index!34901 lt!352912) #b00000000000000000000000000000000) (bvslt (index!34901 lt!352912) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!352912) ((_ is Found!8133) lt!352912) (not ((_ is MissingZero!8133) lt!352912)) (and (bvsge (index!34900 lt!352912) #b00000000000000000000000000000000) (bvslt (index!34900 lt!352912) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!352912) ((_ is Found!8133) lt!352912) ((_ is MissingZero!8133) lt!352912) (not ((_ is MissingVacant!8133) lt!352912)) (and (bvsge (index!34903 lt!352912) #b00000000000000000000000000000000) (bvslt (index!34903 lt!352912) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!352912) (ite ((_ is Found!8133) lt!352912) (= (select (arr!20533 a!3186) (index!34901 lt!352912)) (select (arr!20533 a!3186) j!159)) (ite ((_ is MissingZero!8133) lt!352912) (= (select (arr!20533 a!3186) (index!34900 lt!352912)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8133) lt!352912) (= (select (arr!20533 a!3186) (index!34903 lt!352912)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!439341 () SeekEntryResult!8133)

(assert (=> d!102971 (= lt!352912 e!439341)))

(declare-fun c!87867 () Bool)

(assert (=> d!102971 (= c!87867 (and ((_ is Intermediate!8133) lt!352913) (undefined!8945 lt!352913)))))

(assert (=> d!102971 (= lt!352913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328) (select (arr!20533 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102971 (validMask!0 mask!3328)))

(assert (=> d!102971 (= (seekEntryOrOpen!0 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!352912)))

(declare-fun b!790508 () Bool)

(assert (=> b!790508 (= e!439341 e!439343)))

(assert (=> b!790508 (= lt!352911 (select (arr!20533 a!3186) (index!34902 lt!352913)))))

(declare-fun c!87866 () Bool)

(assert (=> b!790508 (= c!87866 (= lt!352911 (select (arr!20533 a!3186) j!159)))))

(declare-fun b!790509 () Bool)

(assert (=> b!790509 (= e!439341 Undefined!8133)))

(assert (= (and d!102971 c!87867) b!790509))

(assert (= (and d!102971 (not c!87867)) b!790508))

(assert (= (and b!790508 c!87866) b!790505))

(assert (= (and b!790508 (not c!87866)) b!790507))

(assert (= (and b!790507 c!87868) b!790504))

(assert (= (and b!790507 (not c!87868)) b!790506))

(assert (=> b!790506 m!731359))

(declare-fun m!731447 () Bool)

(assert (=> b!790506 m!731447))

(assert (=> d!102971 m!731373))

(declare-fun m!731449 () Bool)

(assert (=> d!102971 m!731449))

(declare-fun m!731451 () Bool)

(assert (=> d!102971 m!731451))

(assert (=> d!102971 m!731361))

(assert (=> d!102971 m!731359))

(assert (=> d!102971 m!731363))

(declare-fun m!731453 () Bool)

(assert (=> d!102971 m!731453))

(assert (=> d!102971 m!731359))

(assert (=> d!102971 m!731361))

(declare-fun m!731455 () Bool)

(assert (=> b!790508 m!731455))

(assert (=> b!790440 d!102971))

(declare-fun b!790538 () Bool)

(declare-fun e!439366 () Bool)

(declare-fun e!439365 () Bool)

(assert (=> b!790538 (= e!439366 e!439365)))

(declare-fun lt!352939 () (_ BitVec 64))

(assert (=> b!790538 (= lt!352939 (select (arr!20533 a!3186) j!159))))

(declare-fun lt!352940 () Unit!27418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42893 (_ BitVec 64) (_ BitVec 32)) Unit!27418)

(assert (=> b!790538 (= lt!352940 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!352939 j!159))))

(assert (=> b!790538 (arrayContainsKey!0 a!3186 lt!352939 #b00000000000000000000000000000000)))

(declare-fun lt!352938 () Unit!27418)

(assert (=> b!790538 (= lt!352938 lt!352940)))

(declare-fun res!535605 () Bool)

(assert (=> b!790538 (= res!535605 (= (seekEntryOrOpen!0 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) (Found!8133 j!159)))))

(assert (=> b!790538 (=> (not res!535605) (not e!439365))))

(declare-fun call!35306 () Bool)

(declare-fun bm!35303 () Bool)

(assert (=> bm!35303 (= call!35306 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!790540 () Bool)

(assert (=> b!790540 (= e!439366 call!35306)))

(declare-fun b!790541 () Bool)

(assert (=> b!790541 (= e!439365 call!35306)))

(declare-fun d!102973 () Bool)

(declare-fun res!535604 () Bool)

(declare-fun e!439367 () Bool)

(assert (=> d!102973 (=> res!535604 e!439367)))

(assert (=> d!102973 (= res!535604 (bvsge j!159 (size!20954 a!3186)))))

(assert (=> d!102973 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!439367)))

(declare-fun b!790539 () Bool)

(assert (=> b!790539 (= e!439367 e!439366)))

(declare-fun c!87876 () Bool)

(assert (=> b!790539 (= c!87876 (validKeyInArray!0 (select (arr!20533 a!3186) j!159)))))

(assert (= (and d!102973 (not res!535604)) b!790539))

(assert (= (and b!790539 c!87876) b!790538))

(assert (= (and b!790539 (not c!87876)) b!790540))

(assert (= (and b!790538 res!535605) b!790541))

(assert (= (or b!790541 b!790540) bm!35303))

(assert (=> b!790538 m!731359))

(declare-fun m!731465 () Bool)

(assert (=> b!790538 m!731465))

(declare-fun m!731467 () Bool)

(assert (=> b!790538 m!731467))

(assert (=> b!790538 m!731359))

(assert (=> b!790538 m!731367))

(declare-fun m!731469 () Bool)

(assert (=> bm!35303 m!731469))

(assert (=> b!790539 m!731359))

(assert (=> b!790539 m!731359))

(assert (=> b!790539 m!731369))

(assert (=> b!790439 d!102973))

(declare-fun d!102983 () Bool)

(assert (=> d!102983 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352949 () Unit!27418)

(declare-fun choose!38 (array!42893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27418)

(assert (=> d!102983 (= lt!352949 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102983 (validMask!0 mask!3328)))

(assert (=> d!102983 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!352949)))

(declare-fun bs!21863 () Bool)

(assert (= bs!21863 d!102983))

(assert (=> bs!21863 m!731379))

(declare-fun m!731486 () Bool)

(assert (=> bs!21863 m!731486))

(assert (=> bs!21863 m!731373))

(assert (=> b!790439 d!102983))

(declare-fun b!790609 () Bool)

(declare-fun e!439409 () SeekEntryResult!8133)

(declare-fun e!439408 () SeekEntryResult!8133)

(assert (=> b!790609 (= e!439409 e!439408)))

(declare-fun lt!352964 () (_ BitVec 64))

(declare-fun c!87902 () Bool)

(assert (=> b!790609 (= c!87902 (= lt!352964 (select (arr!20533 a!3186) j!159)))))

(declare-fun b!790610 () Bool)

(assert (=> b!790610 (= e!439408 (Found!8133 index!1321))))

(declare-fun b!790611 () Bool)

(declare-fun e!439410 () SeekEntryResult!8133)

(assert (=> b!790611 (= e!439410 (MissingVacant!8133 resIntermediateIndex!5))))

(declare-fun b!790612 () Bool)

(assert (=> b!790612 (= e!439409 Undefined!8133)))

(declare-fun b!790613 () Bool)

(declare-fun c!87904 () Bool)

(assert (=> b!790613 (= c!87904 (= lt!352964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790613 (= e!439408 e!439410)))

(declare-fun b!790614 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790614 (= e!439410 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20533 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!352965 () SeekEntryResult!8133)

(declare-fun d!102990 () Bool)

(assert (=> d!102990 (and (or ((_ is Undefined!8133) lt!352965) (not ((_ is Found!8133) lt!352965)) (and (bvsge (index!34901 lt!352965) #b00000000000000000000000000000000) (bvslt (index!34901 lt!352965) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!352965) ((_ is Found!8133) lt!352965) (not ((_ is MissingVacant!8133) lt!352965)) (not (= (index!34903 lt!352965) resIntermediateIndex!5)) (and (bvsge (index!34903 lt!352965) #b00000000000000000000000000000000) (bvslt (index!34903 lt!352965) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!352965) (ite ((_ is Found!8133) lt!352965) (= (select (arr!20533 a!3186) (index!34901 lt!352965)) (select (arr!20533 a!3186) j!159)) (and ((_ is MissingVacant!8133) lt!352965) (= (index!34903 lt!352965) resIntermediateIndex!5) (= (select (arr!20533 a!3186) (index!34903 lt!352965)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102990 (= lt!352965 e!439409)))

(declare-fun c!87903 () Bool)

(assert (=> d!102990 (= c!87903 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102990 (= lt!352964 (select (arr!20533 a!3186) index!1321))))

(assert (=> d!102990 (validMask!0 mask!3328)))

(assert (=> d!102990 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!352965)))

(assert (= (and d!102990 c!87903) b!790612))

(assert (= (and d!102990 (not c!87903)) b!790609))

(assert (= (and b!790609 c!87902) b!790610))

(assert (= (and b!790609 (not c!87902)) b!790613))

(assert (= (and b!790613 c!87904) b!790611))

(assert (= (and b!790613 (not c!87904)) b!790614))

(declare-fun m!731491 () Bool)

(assert (=> b!790614 m!731491))

(assert (=> b!790614 m!731491))

(assert (=> b!790614 m!731359))

(declare-fun m!731497 () Bool)

(assert (=> b!790614 m!731497))

(declare-fun m!731501 () Bool)

(assert (=> d!102990 m!731501))

(declare-fun m!731503 () Bool)

(assert (=> d!102990 m!731503))

(declare-fun m!731505 () Bool)

(assert (=> d!102990 m!731505))

(assert (=> d!102990 m!731373))

(assert (=> b!790428 d!102990))

(declare-fun d!102999 () Bool)

(assert (=> d!102999 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!790438 d!102999))

(declare-fun d!103001 () Bool)

(declare-fun res!535631 () Bool)

(declare-fun e!439420 () Bool)

(assert (=> d!103001 (=> res!535631 e!439420)))

(assert (=> d!103001 (= res!535631 (= (select (arr!20533 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!103001 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!439420)))

(declare-fun b!790628 () Bool)

(declare-fun e!439421 () Bool)

(assert (=> b!790628 (= e!439420 e!439421)))

(declare-fun res!535632 () Bool)

(assert (=> b!790628 (=> (not res!535632) (not e!439421))))

(assert (=> b!790628 (= res!535632 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20954 a!3186)))))

(declare-fun b!790629 () Bool)

(assert (=> b!790629 (= e!439421 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103001 (not res!535631)) b!790628))

(assert (= (and b!790628 res!535632) b!790629))

(declare-fun m!731515 () Bool)

(assert (=> d!103001 m!731515))

(declare-fun m!731517 () Bool)

(assert (=> b!790629 m!731517))

(assert (=> b!790427 d!103001))

(declare-fun b!790684 () Bool)

(declare-fun e!439452 () SeekEntryResult!8133)

(assert (=> b!790684 (= e!439452 (Intermediate!8133 true index!1321 x!1131))))

(declare-fun b!790685 () Bool)

(declare-fun e!439450 () SeekEntryResult!8133)

(assert (=> b!790685 (= e!439450 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20533 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790686 () Bool)

(declare-fun e!439451 () Bool)

(declare-fun e!439453 () Bool)

(assert (=> b!790686 (= e!439451 e!439453)))

(declare-fun res!535639 () Bool)

(declare-fun lt!352994 () SeekEntryResult!8133)

(assert (=> b!790686 (= res!535639 (and ((_ is Intermediate!8133) lt!352994) (not (undefined!8945 lt!352994)) (bvslt (x!65834 lt!352994) #b01111111111111111111111111111110) (bvsge (x!65834 lt!352994) #b00000000000000000000000000000000) (bvsge (x!65834 lt!352994) x!1131)))))

(assert (=> b!790686 (=> (not res!535639) (not e!439453))))

(declare-fun b!790687 () Bool)

(assert (=> b!790687 (= e!439450 (Intermediate!8133 false index!1321 x!1131))))

(declare-fun b!790688 () Bool)

(assert (=> b!790688 (and (bvsge (index!34902 lt!352994) #b00000000000000000000000000000000) (bvslt (index!34902 lt!352994) (size!20954 a!3186)))))

(declare-fun e!439454 () Bool)

(assert (=> b!790688 (= e!439454 (= (select (arr!20533 a!3186) (index!34902 lt!352994)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790689 () Bool)

(assert (=> b!790689 (= e!439452 e!439450)))

(declare-fun lt!352993 () (_ BitVec 64))

(declare-fun c!87932 () Bool)

(assert (=> b!790689 (= c!87932 (or (= lt!352993 (select (arr!20533 a!3186) j!159)) (= (bvadd lt!352993 lt!352993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!103007 () Bool)

(assert (=> d!103007 e!439451))

(declare-fun c!87933 () Bool)

(assert (=> d!103007 (= c!87933 (and ((_ is Intermediate!8133) lt!352994) (undefined!8945 lt!352994)))))

(assert (=> d!103007 (= lt!352994 e!439452)))

(declare-fun c!87934 () Bool)

(assert (=> d!103007 (= c!87934 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!103007 (= lt!352993 (select (arr!20533 a!3186) index!1321))))

(assert (=> d!103007 (validMask!0 mask!3328)))

(assert (=> d!103007 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!352994)))

(declare-fun b!790690 () Bool)

(assert (=> b!790690 (and (bvsge (index!34902 lt!352994) #b00000000000000000000000000000000) (bvslt (index!34902 lt!352994) (size!20954 a!3186)))))

(declare-fun res!535640 () Bool)

(assert (=> b!790690 (= res!535640 (= (select (arr!20533 a!3186) (index!34902 lt!352994)) (select (arr!20533 a!3186) j!159)))))

(assert (=> b!790690 (=> res!535640 e!439454)))

(assert (=> b!790690 (= e!439453 e!439454)))

(declare-fun b!790691 () Bool)

(assert (=> b!790691 (and (bvsge (index!34902 lt!352994) #b00000000000000000000000000000000) (bvslt (index!34902 lt!352994) (size!20954 a!3186)))))

(declare-fun res!535641 () Bool)

(assert (=> b!790691 (= res!535641 (= (select (arr!20533 a!3186) (index!34902 lt!352994)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790691 (=> res!535641 e!439454)))

(declare-fun b!790692 () Bool)

(assert (=> b!790692 (= e!439451 (bvsge (x!65834 lt!352994) #b01111111111111111111111111111110))))

(assert (= (and d!103007 c!87934) b!790684))

(assert (= (and d!103007 (not c!87934)) b!790689))

(assert (= (and b!790689 c!87932) b!790687))

(assert (= (and b!790689 (not c!87932)) b!790685))

(assert (= (and d!103007 c!87933) b!790692))

(assert (= (and d!103007 (not c!87933)) b!790686))

(assert (= (and b!790686 res!535639) b!790690))

(assert (= (and b!790690 (not res!535640)) b!790691))

(assert (= (and b!790691 (not res!535641)) b!790688))

(assert (=> b!790685 m!731491))

(assert (=> b!790685 m!731491))

(assert (=> b!790685 m!731359))

(declare-fun m!731539 () Bool)

(assert (=> b!790685 m!731539))

(declare-fun m!731541 () Bool)

(assert (=> b!790691 m!731541))

(assert (=> b!790690 m!731541))

(assert (=> b!790688 m!731541))

(assert (=> d!103007 m!731505))

(assert (=> d!103007 m!731373))

(assert (=> b!790436 d!103007))

(declare-fun b!790705 () Bool)

(declare-fun e!439462 () SeekEntryResult!8133)

(declare-fun lt!353003 () SeekEntryResult!8133)

(assert (=> b!790705 (= e!439462 (MissingZero!8133 (index!34902 lt!353003)))))

(declare-fun b!790706 () Bool)

(declare-fun e!439463 () SeekEntryResult!8133)

(assert (=> b!790706 (= e!439463 (Found!8133 (index!34902 lt!353003)))))

(declare-fun b!790707 () Bool)

(assert (=> b!790707 (= e!439462 (seekKeyOrZeroReturnVacant!0 (x!65834 lt!353003) (index!34902 lt!353003) (index!34902 lt!353003) k0!2102 a!3186 mask!3328))))

(declare-fun b!790708 () Bool)

(declare-fun c!87943 () Bool)

(declare-fun lt!353001 () (_ BitVec 64))

(assert (=> b!790708 (= c!87943 (= lt!353001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790708 (= e!439463 e!439462)))

(declare-fun d!103015 () Bool)

(declare-fun lt!353002 () SeekEntryResult!8133)

(assert (=> d!103015 (and (or ((_ is Undefined!8133) lt!353002) (not ((_ is Found!8133) lt!353002)) (and (bvsge (index!34901 lt!353002) #b00000000000000000000000000000000) (bvslt (index!34901 lt!353002) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!353002) ((_ is Found!8133) lt!353002) (not ((_ is MissingZero!8133) lt!353002)) (and (bvsge (index!34900 lt!353002) #b00000000000000000000000000000000) (bvslt (index!34900 lt!353002) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!353002) ((_ is Found!8133) lt!353002) ((_ is MissingZero!8133) lt!353002) (not ((_ is MissingVacant!8133) lt!353002)) (and (bvsge (index!34903 lt!353002) #b00000000000000000000000000000000) (bvslt (index!34903 lt!353002) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!353002) (ite ((_ is Found!8133) lt!353002) (= (select (arr!20533 a!3186) (index!34901 lt!353002)) k0!2102) (ite ((_ is MissingZero!8133) lt!353002) (= (select (arr!20533 a!3186) (index!34900 lt!353002)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8133) lt!353002) (= (select (arr!20533 a!3186) (index!34903 lt!353002)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!439461 () SeekEntryResult!8133)

(assert (=> d!103015 (= lt!353002 e!439461)))

(declare-fun c!87942 () Bool)

(assert (=> d!103015 (= c!87942 (and ((_ is Intermediate!8133) lt!353003) (undefined!8945 lt!353003)))))

(assert (=> d!103015 (= lt!353003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!103015 (validMask!0 mask!3328)))

(assert (=> d!103015 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!353002)))

(declare-fun b!790709 () Bool)

(assert (=> b!790709 (= e!439461 e!439463)))

(assert (=> b!790709 (= lt!353001 (select (arr!20533 a!3186) (index!34902 lt!353003)))))

(declare-fun c!87941 () Bool)

(assert (=> b!790709 (= c!87941 (= lt!353001 k0!2102))))

(declare-fun b!790710 () Bool)

(assert (=> b!790710 (= e!439461 Undefined!8133)))

(assert (= (and d!103015 c!87942) b!790710))

(assert (= (and d!103015 (not c!87942)) b!790709))

(assert (= (and b!790709 c!87941) b!790706))

(assert (= (and b!790709 (not c!87941)) b!790708))

(assert (= (and b!790708 c!87943) b!790705))

(assert (= (and b!790708 (not c!87943)) b!790707))

(declare-fun m!731543 () Bool)

(assert (=> b!790707 m!731543))

(assert (=> d!103015 m!731373))

(declare-fun m!731545 () Bool)

(assert (=> d!103015 m!731545))

(declare-fun m!731547 () Bool)

(assert (=> d!103015 m!731547))

(declare-fun m!731549 () Bool)

(assert (=> d!103015 m!731549))

(declare-fun m!731551 () Bool)

(assert (=> d!103015 m!731551))

(declare-fun m!731553 () Bool)

(assert (=> d!103015 m!731553))

(assert (=> d!103015 m!731549))

(declare-fun m!731555 () Bool)

(assert (=> b!790709 m!731555))

(assert (=> b!790425 d!103015))

(declare-fun b!790765 () Bool)

(declare-fun e!439501 () Bool)

(declare-fun call!35314 () Bool)

(assert (=> b!790765 (= e!439501 call!35314)))

(declare-fun b!790766 () Bool)

(declare-fun e!439498 () Bool)

(declare-fun contains!4114 (List!14535 (_ BitVec 64)) Bool)

(assert (=> b!790766 (= e!439498 (contains!4114 Nil!14532 (select (arr!20533 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!790767 () Bool)

(assert (=> b!790767 (= e!439501 call!35314)))

(declare-fun b!790768 () Bool)

(declare-fun e!439500 () Bool)

(assert (=> b!790768 (= e!439500 e!439501)))

(declare-fun c!87962 () Bool)

(assert (=> b!790768 (= c!87962 (validKeyInArray!0 (select (arr!20533 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!790769 () Bool)

(declare-fun e!439499 () Bool)

(assert (=> b!790769 (= e!439499 e!439500)))

(declare-fun res!535660 () Bool)

(assert (=> b!790769 (=> (not res!535660) (not e!439500))))

(assert (=> b!790769 (= res!535660 (not e!439498))))

(declare-fun res!535662 () Bool)

(assert (=> b!790769 (=> (not res!535662) (not e!439498))))

(assert (=> b!790769 (= res!535662 (validKeyInArray!0 (select (arr!20533 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!103017 () Bool)

(declare-fun res!535661 () Bool)

(assert (=> d!103017 (=> res!535661 e!439499)))

(assert (=> d!103017 (= res!535661 (bvsge #b00000000000000000000000000000000 (size!20954 a!3186)))))

(assert (=> d!103017 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14532) e!439499)))

(declare-fun bm!35311 () Bool)

(assert (=> bm!35311 (= call!35314 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87962 (Cons!14531 (select (arr!20533 a!3186) #b00000000000000000000000000000000) Nil!14532) Nil!14532)))))

(assert (= (and d!103017 (not res!535661)) b!790769))

(assert (= (and b!790769 res!535662) b!790766))

(assert (= (and b!790769 res!535660) b!790768))

(assert (= (and b!790768 c!87962) b!790767))

(assert (= (and b!790768 (not c!87962)) b!790765))

(assert (= (or b!790767 b!790765) bm!35311))

(assert (=> b!790766 m!731515))

(assert (=> b!790766 m!731515))

(declare-fun m!731613 () Bool)

(assert (=> b!790766 m!731613))

(assert (=> b!790768 m!731515))

(assert (=> b!790768 m!731515))

(declare-fun m!731615 () Bool)

(assert (=> b!790768 m!731615))

(assert (=> b!790769 m!731515))

(assert (=> b!790769 m!731515))

(assert (=> b!790769 m!731615))

(assert (=> bm!35311 m!731515))

(declare-fun m!731617 () Bool)

(assert (=> bm!35311 m!731617))

(assert (=> b!790435 d!103017))

(declare-fun b!790781 () Bool)

(declare-fun e!439510 () SeekEntryResult!8133)

(declare-fun e!439509 () SeekEntryResult!8133)

(assert (=> b!790781 (= e!439510 e!439509)))

(declare-fun lt!353023 () (_ BitVec 64))

(declare-fun c!87966 () Bool)

(assert (=> b!790781 (= c!87966 (= lt!353023 (select (arr!20533 a!3186) j!159)))))

(declare-fun b!790782 () Bool)

(assert (=> b!790782 (= e!439509 (Found!8133 resIntermediateIndex!5))))

(declare-fun b!790783 () Bool)

(declare-fun e!439511 () SeekEntryResult!8133)

(assert (=> b!790783 (= e!439511 (MissingVacant!8133 resIntermediateIndex!5))))

(declare-fun b!790784 () Bool)

(assert (=> b!790784 (= e!439510 Undefined!8133)))

(declare-fun b!790785 () Bool)

(declare-fun c!87968 () Bool)

(assert (=> b!790785 (= c!87968 (= lt!353023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790785 (= e!439509 e!439511)))

(declare-fun b!790786 () Bool)

(assert (=> b!790786 (= e!439511 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20533 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!353024 () SeekEntryResult!8133)

(declare-fun d!103039 () Bool)

(assert (=> d!103039 (and (or ((_ is Undefined!8133) lt!353024) (not ((_ is Found!8133) lt!353024)) (and (bvsge (index!34901 lt!353024) #b00000000000000000000000000000000) (bvslt (index!34901 lt!353024) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!353024) ((_ is Found!8133) lt!353024) (not ((_ is MissingVacant!8133) lt!353024)) (not (= (index!34903 lt!353024) resIntermediateIndex!5)) (and (bvsge (index!34903 lt!353024) #b00000000000000000000000000000000) (bvslt (index!34903 lt!353024) (size!20954 a!3186)))) (or ((_ is Undefined!8133) lt!353024) (ite ((_ is Found!8133) lt!353024) (= (select (arr!20533 a!3186) (index!34901 lt!353024)) (select (arr!20533 a!3186) j!159)) (and ((_ is MissingVacant!8133) lt!353024) (= (index!34903 lt!353024) resIntermediateIndex!5) (= (select (arr!20533 a!3186) (index!34903 lt!353024)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103039 (= lt!353024 e!439510)))

(declare-fun c!87967 () Bool)

(assert (=> d!103039 (= c!87967 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!103039 (= lt!353023 (select (arr!20533 a!3186) resIntermediateIndex!5))))

(assert (=> d!103039 (validMask!0 mask!3328)))

(assert (=> d!103039 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!353024)))

(assert (= (and d!103039 c!87967) b!790784))

(assert (= (and d!103039 (not c!87967)) b!790781))

(assert (= (and b!790781 c!87966) b!790782))

(assert (= (and b!790781 (not c!87966)) b!790785))

(assert (= (and b!790785 c!87968) b!790783))

(assert (= (and b!790785 (not c!87968)) b!790786))

(declare-fun m!731623 () Bool)

(assert (=> b!790786 m!731623))

(assert (=> b!790786 m!731623))

(assert (=> b!790786 m!731359))

(declare-fun m!731625 () Bool)

(assert (=> b!790786 m!731625))

(declare-fun m!731627 () Bool)

(assert (=> d!103039 m!731627))

(declare-fun m!731629 () Bool)

(assert (=> d!103039 m!731629))

(assert (=> d!103039 m!731399))

(assert (=> d!103039 m!731373))

(assert (=> b!790424 d!103039))

(declare-fun b!790787 () Bool)

(declare-fun e!439514 () SeekEntryResult!8133)

(assert (=> b!790787 (= e!439514 (Intermediate!8133 true index!1321 x!1131))))

(declare-fun b!790788 () Bool)

(declare-fun e!439512 () SeekEntryResult!8133)

(assert (=> b!790788 (= e!439512 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!352878 lt!352877 mask!3328))))

(declare-fun b!790789 () Bool)

(declare-fun e!439513 () Bool)

(declare-fun e!439515 () Bool)

(assert (=> b!790789 (= e!439513 e!439515)))

(declare-fun res!535668 () Bool)

(declare-fun lt!353026 () SeekEntryResult!8133)

(assert (=> b!790789 (= res!535668 (and ((_ is Intermediate!8133) lt!353026) (not (undefined!8945 lt!353026)) (bvslt (x!65834 lt!353026) #b01111111111111111111111111111110) (bvsge (x!65834 lt!353026) #b00000000000000000000000000000000) (bvsge (x!65834 lt!353026) x!1131)))))

(assert (=> b!790789 (=> (not res!535668) (not e!439515))))

(declare-fun b!790790 () Bool)

(assert (=> b!790790 (= e!439512 (Intermediate!8133 false index!1321 x!1131))))

(declare-fun b!790791 () Bool)

(assert (=> b!790791 (and (bvsge (index!34902 lt!353026) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353026) (size!20954 lt!352877)))))

(declare-fun e!439516 () Bool)

(assert (=> b!790791 (= e!439516 (= (select (arr!20533 lt!352877) (index!34902 lt!353026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790792 () Bool)

(assert (=> b!790792 (= e!439514 e!439512)))

(declare-fun c!87969 () Bool)

(declare-fun lt!353025 () (_ BitVec 64))

(assert (=> b!790792 (= c!87969 (or (= lt!353025 lt!352878) (= (bvadd lt!353025 lt!353025) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!103041 () Bool)

(assert (=> d!103041 e!439513))

(declare-fun c!87970 () Bool)

(assert (=> d!103041 (= c!87970 (and ((_ is Intermediate!8133) lt!353026) (undefined!8945 lt!353026)))))

(assert (=> d!103041 (= lt!353026 e!439514)))

(declare-fun c!87971 () Bool)

(assert (=> d!103041 (= c!87971 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!103041 (= lt!353025 (select (arr!20533 lt!352877) index!1321))))

(assert (=> d!103041 (validMask!0 mask!3328)))

(assert (=> d!103041 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352878 lt!352877 mask!3328) lt!353026)))

(declare-fun b!790793 () Bool)

(assert (=> b!790793 (and (bvsge (index!34902 lt!353026) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353026) (size!20954 lt!352877)))))

(declare-fun res!535669 () Bool)

(assert (=> b!790793 (= res!535669 (= (select (arr!20533 lt!352877) (index!34902 lt!353026)) lt!352878))))

(assert (=> b!790793 (=> res!535669 e!439516)))

(assert (=> b!790793 (= e!439515 e!439516)))

(declare-fun b!790794 () Bool)

(assert (=> b!790794 (and (bvsge (index!34902 lt!353026) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353026) (size!20954 lt!352877)))))

(declare-fun res!535670 () Bool)

(assert (=> b!790794 (= res!535670 (= (select (arr!20533 lt!352877) (index!34902 lt!353026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790794 (=> res!535670 e!439516)))

(declare-fun b!790795 () Bool)

(assert (=> b!790795 (= e!439513 (bvsge (x!65834 lt!353026) #b01111111111111111111111111111110))))

(assert (= (and d!103041 c!87971) b!790787))

(assert (= (and d!103041 (not c!87971)) b!790792))

(assert (= (and b!790792 c!87969) b!790790))

(assert (= (and b!790792 (not c!87969)) b!790788))

(assert (= (and d!103041 c!87970) b!790795))

(assert (= (and d!103041 (not c!87970)) b!790789))

(assert (= (and b!790789 res!535668) b!790793))

(assert (= (and b!790793 (not res!535669)) b!790794))

(assert (= (and b!790794 (not res!535670)) b!790791))

(assert (=> b!790788 m!731491))

(assert (=> b!790788 m!731491))

(declare-fun m!731631 () Bool)

(assert (=> b!790788 m!731631))

(declare-fun m!731633 () Bool)

(assert (=> b!790794 m!731633))

(assert (=> b!790793 m!731633))

(assert (=> b!790791 m!731633))

(declare-fun m!731635 () Bool)

(assert (=> d!103041 m!731635))

(assert (=> d!103041 m!731373))

(assert (=> b!790434 d!103041))

(declare-fun b!790796 () Bool)

(declare-fun e!439519 () SeekEntryResult!8133)

(assert (=> b!790796 (= e!439519 (Intermediate!8133 true (toIndex!0 lt!352878 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790797 () Bool)

(declare-fun e!439517 () SeekEntryResult!8133)

(assert (=> b!790797 (= e!439517 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!352878 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!352878 lt!352877 mask!3328))))

(declare-fun b!790798 () Bool)

(declare-fun e!439518 () Bool)

(declare-fun e!439520 () Bool)

(assert (=> b!790798 (= e!439518 e!439520)))

(declare-fun res!535671 () Bool)

(declare-fun lt!353028 () SeekEntryResult!8133)

(assert (=> b!790798 (= res!535671 (and ((_ is Intermediate!8133) lt!353028) (not (undefined!8945 lt!353028)) (bvslt (x!65834 lt!353028) #b01111111111111111111111111111110) (bvsge (x!65834 lt!353028) #b00000000000000000000000000000000) (bvsge (x!65834 lt!353028) #b00000000000000000000000000000000)))))

(assert (=> b!790798 (=> (not res!535671) (not e!439520))))

(declare-fun b!790799 () Bool)

(assert (=> b!790799 (= e!439517 (Intermediate!8133 false (toIndex!0 lt!352878 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790800 () Bool)

(assert (=> b!790800 (and (bvsge (index!34902 lt!353028) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353028) (size!20954 lt!352877)))))

(declare-fun e!439521 () Bool)

(assert (=> b!790800 (= e!439521 (= (select (arr!20533 lt!352877) (index!34902 lt!353028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790801 () Bool)

(assert (=> b!790801 (= e!439519 e!439517)))

(declare-fun c!87972 () Bool)

(declare-fun lt!353027 () (_ BitVec 64))

(assert (=> b!790801 (= c!87972 (or (= lt!353027 lt!352878) (= (bvadd lt!353027 lt!353027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!103043 () Bool)

(assert (=> d!103043 e!439518))

(declare-fun c!87973 () Bool)

(assert (=> d!103043 (= c!87973 (and ((_ is Intermediate!8133) lt!353028) (undefined!8945 lt!353028)))))

(assert (=> d!103043 (= lt!353028 e!439519)))

(declare-fun c!87974 () Bool)

(assert (=> d!103043 (= c!87974 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!103043 (= lt!353027 (select (arr!20533 lt!352877) (toIndex!0 lt!352878 mask!3328)))))

(assert (=> d!103043 (validMask!0 mask!3328)))

(assert (=> d!103043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352878 mask!3328) lt!352878 lt!352877 mask!3328) lt!353028)))

(declare-fun b!790802 () Bool)

(assert (=> b!790802 (and (bvsge (index!34902 lt!353028) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353028) (size!20954 lt!352877)))))

(declare-fun res!535672 () Bool)

(assert (=> b!790802 (= res!535672 (= (select (arr!20533 lt!352877) (index!34902 lt!353028)) lt!352878))))

(assert (=> b!790802 (=> res!535672 e!439521)))

(assert (=> b!790802 (= e!439520 e!439521)))

(declare-fun b!790803 () Bool)

(assert (=> b!790803 (and (bvsge (index!34902 lt!353028) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353028) (size!20954 lt!352877)))))

(declare-fun res!535673 () Bool)

(assert (=> b!790803 (= res!535673 (= (select (arr!20533 lt!352877) (index!34902 lt!353028)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790803 (=> res!535673 e!439521)))

(declare-fun b!790804 () Bool)

(assert (=> b!790804 (= e!439518 (bvsge (x!65834 lt!353028) #b01111111111111111111111111111110))))

(assert (= (and d!103043 c!87974) b!790796))

(assert (= (and d!103043 (not c!87974)) b!790801))

(assert (= (and b!790801 c!87972) b!790799))

(assert (= (and b!790801 (not c!87972)) b!790797))

(assert (= (and d!103043 c!87973) b!790804))

(assert (= (and d!103043 (not c!87973)) b!790798))

(assert (= (and b!790798 res!535671) b!790802))

(assert (= (and b!790802 (not res!535672)) b!790803))

(assert (= (and b!790803 (not res!535673)) b!790800))

(assert (=> b!790797 m!731389))

(declare-fun m!731637 () Bool)

(assert (=> b!790797 m!731637))

(assert (=> b!790797 m!731637))

(declare-fun m!731639 () Bool)

(assert (=> b!790797 m!731639))

(declare-fun m!731641 () Bool)

(assert (=> b!790803 m!731641))

(assert (=> b!790802 m!731641))

(assert (=> b!790800 m!731641))

(assert (=> d!103043 m!731389))

(declare-fun m!731643 () Bool)

(assert (=> d!103043 m!731643))

(assert (=> d!103043 m!731373))

(assert (=> b!790434 d!103043))

(declare-fun d!103045 () Bool)

(declare-fun lt!353038 () (_ BitVec 32))

(declare-fun lt!353037 () (_ BitVec 32))

(assert (=> d!103045 (= lt!353038 (bvmul (bvxor lt!353037 (bvlshr lt!353037 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!103045 (= lt!353037 ((_ extract 31 0) (bvand (bvxor lt!352878 (bvlshr lt!352878 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!103045 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!535674 (let ((h!15660 ((_ extract 31 0) (bvand (bvxor lt!352878 (bvlshr lt!352878 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65843 (bvmul (bvxor h!15660 (bvlshr h!15660 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65843 (bvlshr x!65843 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!535674 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!535674 #b00000000000000000000000000000000))))))

(assert (=> d!103045 (= (toIndex!0 lt!352878 mask!3328) (bvand (bvxor lt!353038 (bvlshr lt!353038 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!790434 d!103045))

(declare-fun d!103047 () Bool)

(assert (=> d!103047 (= (validKeyInArray!0 (select (arr!20533 a!3186) j!159)) (and (not (= (select (arr!20533 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20533 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!790433 d!103047))

(declare-fun e!439539 () SeekEntryResult!8133)

(declare-fun b!790832 () Bool)

(assert (=> b!790832 (= e!439539 (Intermediate!8133 true (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun e!439537 () SeekEntryResult!8133)

(declare-fun b!790833 () Bool)

(assert (=> b!790833 (= e!439537 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20533 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790834 () Bool)

(declare-fun e!439538 () Bool)

(declare-fun e!439540 () Bool)

(assert (=> b!790834 (= e!439538 e!439540)))

(declare-fun res!535684 () Bool)

(declare-fun lt!353042 () SeekEntryResult!8133)

(assert (=> b!790834 (= res!535684 (and ((_ is Intermediate!8133) lt!353042) (not (undefined!8945 lt!353042)) (bvslt (x!65834 lt!353042) #b01111111111111111111111111111110) (bvsge (x!65834 lt!353042) #b00000000000000000000000000000000) (bvsge (x!65834 lt!353042) #b00000000000000000000000000000000)))))

(assert (=> b!790834 (=> (not res!535684) (not e!439540))))

(declare-fun b!790835 () Bool)

(assert (=> b!790835 (= e!439537 (Intermediate!8133 false (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790836 () Bool)

(assert (=> b!790836 (and (bvsge (index!34902 lt!353042) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353042) (size!20954 a!3186)))))

(declare-fun e!439541 () Bool)

(assert (=> b!790836 (= e!439541 (= (select (arr!20533 a!3186) (index!34902 lt!353042)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790837 () Bool)

(assert (=> b!790837 (= e!439539 e!439537)))

(declare-fun lt!353041 () (_ BitVec 64))

(declare-fun c!87984 () Bool)

(assert (=> b!790837 (= c!87984 (or (= lt!353041 (select (arr!20533 a!3186) j!159)) (= (bvadd lt!353041 lt!353041) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!103049 () Bool)

(assert (=> d!103049 e!439538))

(declare-fun c!87985 () Bool)

(assert (=> d!103049 (= c!87985 (and ((_ is Intermediate!8133) lt!353042) (undefined!8945 lt!353042)))))

(assert (=> d!103049 (= lt!353042 e!439539)))

(declare-fun c!87986 () Bool)

(assert (=> d!103049 (= c!87986 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!103049 (= lt!353041 (select (arr!20533 a!3186) (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328)))))

(assert (=> d!103049 (validMask!0 mask!3328)))

(assert (=> d!103049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328) (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!353042)))

(declare-fun b!790838 () Bool)

(assert (=> b!790838 (and (bvsge (index!34902 lt!353042) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353042) (size!20954 a!3186)))))

(declare-fun res!535685 () Bool)

(assert (=> b!790838 (= res!535685 (= (select (arr!20533 a!3186) (index!34902 lt!353042)) (select (arr!20533 a!3186) j!159)))))

(assert (=> b!790838 (=> res!535685 e!439541)))

(assert (=> b!790838 (= e!439540 e!439541)))

(declare-fun b!790839 () Bool)

(assert (=> b!790839 (and (bvsge (index!34902 lt!353042) #b00000000000000000000000000000000) (bvslt (index!34902 lt!353042) (size!20954 a!3186)))))

(declare-fun res!535686 () Bool)

(assert (=> b!790839 (= res!535686 (= (select (arr!20533 a!3186) (index!34902 lt!353042)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790839 (=> res!535686 e!439541)))

(declare-fun b!790840 () Bool)

(assert (=> b!790840 (= e!439538 (bvsge (x!65834 lt!353042) #b01111111111111111111111111111110))))

(assert (= (and d!103049 c!87986) b!790832))

(assert (= (and d!103049 (not c!87986)) b!790837))

(assert (= (and b!790837 c!87984) b!790835))

(assert (= (and b!790837 (not c!87984)) b!790833))

(assert (= (and d!103049 c!87985) b!790840))

(assert (= (and d!103049 (not c!87985)) b!790834))

(assert (= (and b!790834 res!535684) b!790838))

(assert (= (and b!790838 (not res!535685)) b!790839))

(assert (= (and b!790839 (not res!535686)) b!790836))

(assert (=> b!790833 m!731361))

(declare-fun m!731653 () Bool)

(assert (=> b!790833 m!731653))

(assert (=> b!790833 m!731653))

(assert (=> b!790833 m!731359))

(declare-fun m!731655 () Bool)

(assert (=> b!790833 m!731655))

(declare-fun m!731657 () Bool)

(assert (=> b!790839 m!731657))

(assert (=> b!790838 m!731657))

(assert (=> b!790836 m!731657))

(assert (=> d!103049 m!731361))

(declare-fun m!731659 () Bool)

(assert (=> d!103049 m!731659))

(assert (=> d!103049 m!731373))

(assert (=> b!790432 d!103049))

(declare-fun d!103053 () Bool)

(declare-fun lt!353044 () (_ BitVec 32))

(declare-fun lt!353043 () (_ BitVec 32))

(assert (=> d!103053 (= lt!353044 (bvmul (bvxor lt!353043 (bvlshr lt!353043 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!103053 (= lt!353043 ((_ extract 31 0) (bvand (bvxor (select (arr!20533 a!3186) j!159) (bvlshr (select (arr!20533 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!103053 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!535674 (let ((h!15660 ((_ extract 31 0) (bvand (bvxor (select (arr!20533 a!3186) j!159) (bvlshr (select (arr!20533 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65843 (bvmul (bvxor h!15660 (bvlshr h!15660 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65843 (bvlshr x!65843 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!535674 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!535674 #b00000000000000000000000000000000))))))

(assert (=> d!103053 (= (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328) (bvand (bvxor lt!353044 (bvlshr lt!353044 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!790432 d!103053))

(declare-fun b!790841 () Bool)

(declare-fun e!439543 () Bool)

(declare-fun e!439542 () Bool)

(assert (=> b!790841 (= e!439543 e!439542)))

(declare-fun lt!353046 () (_ BitVec 64))

(assert (=> b!790841 (= lt!353046 (select (arr!20533 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!353047 () Unit!27418)

(assert (=> b!790841 (= lt!353047 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!353046 #b00000000000000000000000000000000))))

(assert (=> b!790841 (arrayContainsKey!0 a!3186 lt!353046 #b00000000000000000000000000000000)))

(declare-fun lt!353045 () Unit!27418)

(assert (=> b!790841 (= lt!353045 lt!353047)))

(declare-fun res!535689 () Bool)

(assert (=> b!790841 (= res!535689 (= (seekEntryOrOpen!0 (select (arr!20533 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8133 #b00000000000000000000000000000000)))))

(assert (=> b!790841 (=> (not res!535689) (not e!439542))))

(declare-fun bm!35312 () Bool)

(declare-fun call!35315 () Bool)

(assert (=> bm!35312 (= call!35315 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!790843 () Bool)

(assert (=> b!790843 (= e!439543 call!35315)))

(declare-fun b!790844 () Bool)

(assert (=> b!790844 (= e!439542 call!35315)))

(declare-fun d!103055 () Bool)

(declare-fun res!535688 () Bool)

(declare-fun e!439544 () Bool)

(assert (=> d!103055 (=> res!535688 e!439544)))

(assert (=> d!103055 (= res!535688 (bvsge #b00000000000000000000000000000000 (size!20954 a!3186)))))

(assert (=> d!103055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!439544)))

(declare-fun b!790842 () Bool)

(assert (=> b!790842 (= e!439544 e!439543)))

(declare-fun c!87987 () Bool)

(assert (=> b!790842 (= c!87987 (validKeyInArray!0 (select (arr!20533 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!103055 (not res!535688)) b!790842))

(assert (= (and b!790842 c!87987) b!790841))

(assert (= (and b!790842 (not c!87987)) b!790843))

(assert (= (and b!790841 res!535689) b!790844))

(assert (= (or b!790844 b!790843) bm!35312))

(assert (=> b!790841 m!731515))

(declare-fun m!731661 () Bool)

(assert (=> b!790841 m!731661))

(declare-fun m!731663 () Bool)

(assert (=> b!790841 m!731663))

(assert (=> b!790841 m!731515))

(declare-fun m!731665 () Bool)

(assert (=> b!790841 m!731665))

(declare-fun m!731667 () Bool)

(assert (=> bm!35312 m!731667))

(assert (=> b!790842 m!731515))

(assert (=> b!790842 m!731515))

(assert (=> b!790842 m!731615))

(assert (=> b!790431 d!103055))

(declare-fun d!103057 () Bool)

(assert (=> d!103057 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67916 d!103057))

(declare-fun d!103065 () Bool)

(assert (=> d!103065 (= (array_inv!16329 a!3186) (bvsge (size!20954 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67916 d!103065))

(check-sat (not d!103039) (not d!102971) (not bm!35311) (not b!790539) (not b!790506) (not d!103049) (not b!790841) (not b!790786) (not b!790766) (not d!103015) (not b!790833) (not b!790685) (not b!790629) (not bm!35312) (not b!790797) (not bm!35303) (not b!790788) (not d!102990) (not d!103041) (not d!103043) (not b!790538) (not d!103007) (not b!790614) (not b!790707) (not b!790768) (not b!790842) (not d!102983) (not b!790769))
(check-sat)
