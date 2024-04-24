; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64446 () Bool)

(assert start!64446)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!724513 () Bool)

(declare-fun e!405850 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!724513 (= e!405850 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateX!5 #b00000000000000000000000000000000))))))

(declare-fun e!405849 () Bool)

(assert (=> b!724513 e!405849))

(declare-fun res!485854 () Bool)

(assert (=> b!724513 (=> (not res!485854) (not e!405849))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((array!40960 0))(
  ( (array!40961 (arr!19600 (Array (_ BitVec 32) (_ BitVec 64))) (size!20020 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40960)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40960 (_ BitVec 32)) Bool)

(assert (=> b!724513 (= res!485854 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24709 0))(
  ( (Unit!24710) )
))
(declare-fun lt!321036 () Unit!24709)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24709)

(assert (=> b!724513 (= lt!321036 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724514 () Bool)

(declare-fun res!485847 () Bool)

(declare-fun e!405851 () Bool)

(assert (=> b!724514 (=> (not res!485847) (not e!405851))))

(declare-fun e!405852 () Bool)

(assert (=> b!724514 (= res!485847 e!405852)))

(declare-fun c!79709 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!724514 (= c!79709 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724515 () Bool)

(declare-fun res!485850 () Bool)

(declare-fun e!405854 () Bool)

(assert (=> b!724515 (=> (not res!485850) (not e!405854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724515 (= res!485850 (validKeyInArray!0 (select (arr!19600 a!3186) j!159)))))

(declare-fun b!724516 () Bool)

(declare-fun res!485844 () Bool)

(declare-fun e!405853 () Bool)

(assert (=> b!724516 (=> (not res!485844) (not e!405853))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!724516 (= res!485844 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20020 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20020 a!3186))))))

(declare-fun b!724517 () Bool)

(declare-fun res!485851 () Bool)

(assert (=> b!724517 (=> (not res!485851) (not e!405854))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724517 (= res!485851 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724518 () Bool)

(declare-datatypes ((SeekEntryResult!7156 0))(
  ( (MissingZero!7156 (index!30992 (_ BitVec 32))) (Found!7156 (index!30993 (_ BitVec 32))) (Intermediate!7156 (undefined!7968 Bool) (index!30994 (_ BitVec 32)) (x!62136 (_ BitVec 32))) (Undefined!7156) (MissingVacant!7156 (index!30995 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40960 (_ BitVec 32)) SeekEntryResult!7156)

(assert (=> b!724518 (= e!405849 (= (seekEntryOrOpen!0 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) (Found!7156 j!159)))))

(declare-fun b!724519 () Bool)

(assert (=> b!724519 (= e!405851 e!405850)))

(declare-fun res!485843 () Bool)

(assert (=> b!724519 (=> (not res!485843) (not e!405850))))

(declare-fun lt!321039 () array!40960)

(declare-fun lt!321035 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40960 (_ BitVec 32)) SeekEntryResult!7156)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724519 (= res!485843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321035 mask!3328) lt!321035 lt!321039 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321035 lt!321039 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724519 (= lt!321035 (select (store (arr!19600 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724519 (= lt!321039 (array!40961 (store (arr!19600 a!3186) i!1173 k0!2102) (size!20020 a!3186)))))

(declare-fun b!724520 () Bool)

(declare-fun res!485841 () Bool)

(assert (=> b!724520 (=> (not res!485841) (not e!405853))))

(declare-datatypes ((List!13509 0))(
  ( (Nil!13506) (Cons!13505 (h!14562 (_ BitVec 64)) (t!19816 List!13509)) )
))
(declare-fun arrayNoDuplicates!0 (array!40960 (_ BitVec 32) List!13509) Bool)

(assert (=> b!724520 (= res!485841 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13506))))

(declare-fun res!485848 () Bool)

(assert (=> start!64446 (=> (not res!485848) (not e!405854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64446 (= res!485848 (validMask!0 mask!3328))))

(assert (=> start!64446 e!405854))

(assert (=> start!64446 true))

(declare-fun array_inv!15459 (array!40960) Bool)

(assert (=> start!64446 (array_inv!15459 a!3186)))

(declare-fun b!724521 () Bool)

(assert (=> b!724521 (= e!405854 e!405853)))

(declare-fun res!485842 () Bool)

(assert (=> b!724521 (=> (not res!485842) (not e!405853))))

(declare-fun lt!321038 () SeekEntryResult!7156)

(assert (=> b!724521 (= res!485842 (or (= lt!321038 (MissingZero!7156 i!1173)) (= lt!321038 (MissingVacant!7156 i!1173))))))

(assert (=> b!724521 (= lt!321038 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!724522 () Bool)

(declare-fun res!485849 () Bool)

(assert (=> b!724522 (=> (not res!485849) (not e!405851))))

(assert (=> b!724522 (= res!485849 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19600 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724523 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40960 (_ BitVec 32)) SeekEntryResult!7156)

(assert (=> b!724523 (= e!405852 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) (Found!7156 j!159)))))

(declare-fun b!724524 () Bool)

(declare-fun res!485853 () Bool)

(assert (=> b!724524 (=> (not res!485853) (not e!405854))))

(assert (=> b!724524 (= res!485853 (validKeyInArray!0 k0!2102))))

(declare-fun b!724525 () Bool)

(declare-fun res!485845 () Bool)

(assert (=> b!724525 (=> (not res!485845) (not e!405854))))

(assert (=> b!724525 (= res!485845 (and (= (size!20020 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20020 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20020 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724526 () Bool)

(declare-fun res!485846 () Bool)

(assert (=> b!724526 (=> (not res!485846) (not e!405853))))

(assert (=> b!724526 (= res!485846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724527 () Bool)

(assert (=> b!724527 (= e!405853 e!405851)))

(declare-fun res!485852 () Bool)

(assert (=> b!724527 (=> (not res!485852) (not e!405851))))

(declare-fun lt!321037 () SeekEntryResult!7156)

(assert (=> b!724527 (= res!485852 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328) (select (arr!19600 a!3186) j!159) a!3186 mask!3328) lt!321037))))

(assert (=> b!724527 (= lt!321037 (Intermediate!7156 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724528 () Bool)

(assert (=> b!724528 (= e!405852 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) lt!321037))))

(assert (= (and start!64446 res!485848) b!724525))

(assert (= (and b!724525 res!485845) b!724515))

(assert (= (and b!724515 res!485850) b!724524))

(assert (= (and b!724524 res!485853) b!724517))

(assert (= (and b!724517 res!485851) b!724521))

(assert (= (and b!724521 res!485842) b!724526))

(assert (= (and b!724526 res!485846) b!724520))

(assert (= (and b!724520 res!485841) b!724516))

(assert (= (and b!724516 res!485844) b!724527))

(assert (= (and b!724527 res!485852) b!724522))

(assert (= (and b!724522 res!485849) b!724514))

(assert (= (and b!724514 c!79709) b!724528))

(assert (= (and b!724514 (not c!79709)) b!724523))

(assert (= (and b!724514 res!485847) b!724519))

(assert (= (and b!724519 res!485843) b!724513))

(assert (= (and b!724513 res!485854) b!724518))

(declare-fun m!679413 () Bool)

(assert (=> b!724521 m!679413))

(declare-fun m!679415 () Bool)

(assert (=> b!724518 m!679415))

(assert (=> b!724518 m!679415))

(declare-fun m!679417 () Bool)

(assert (=> b!724518 m!679417))

(declare-fun m!679419 () Bool)

(assert (=> b!724522 m!679419))

(declare-fun m!679421 () Bool)

(assert (=> b!724517 m!679421))

(declare-fun m!679423 () Bool)

(assert (=> start!64446 m!679423))

(declare-fun m!679425 () Bool)

(assert (=> start!64446 m!679425))

(declare-fun m!679427 () Bool)

(assert (=> b!724519 m!679427))

(declare-fun m!679429 () Bool)

(assert (=> b!724519 m!679429))

(declare-fun m!679431 () Bool)

(assert (=> b!724519 m!679431))

(assert (=> b!724519 m!679429))

(declare-fun m!679433 () Bool)

(assert (=> b!724519 m!679433))

(declare-fun m!679435 () Bool)

(assert (=> b!724519 m!679435))

(assert (=> b!724515 m!679415))

(assert (=> b!724515 m!679415))

(declare-fun m!679437 () Bool)

(assert (=> b!724515 m!679437))

(declare-fun m!679439 () Bool)

(assert (=> b!724526 m!679439))

(declare-fun m!679441 () Bool)

(assert (=> b!724520 m!679441))

(assert (=> b!724528 m!679415))

(assert (=> b!724528 m!679415))

(declare-fun m!679443 () Bool)

(assert (=> b!724528 m!679443))

(declare-fun m!679445 () Bool)

(assert (=> b!724524 m!679445))

(assert (=> b!724523 m!679415))

(assert (=> b!724523 m!679415))

(declare-fun m!679447 () Bool)

(assert (=> b!724523 m!679447))

(assert (=> b!724527 m!679415))

(assert (=> b!724527 m!679415))

(declare-fun m!679449 () Bool)

(assert (=> b!724527 m!679449))

(assert (=> b!724527 m!679449))

(assert (=> b!724527 m!679415))

(declare-fun m!679451 () Bool)

(assert (=> b!724527 m!679451))

(declare-fun m!679453 () Bool)

(assert (=> b!724513 m!679453))

(declare-fun m!679455 () Bool)

(assert (=> b!724513 m!679455))

(check-sat (not b!724523) (not b!724521) (not b!724527) (not b!724520) (not b!724528) (not b!724519) (not start!64446) (not b!724513) (not b!724524) (not b!724526) (not b!724518) (not b!724517) (not b!724515))
(check-sat)
(get-model)

(declare-fun b!724637 () Bool)

(declare-fun e!405905 () SeekEntryResult!7156)

(assert (=> b!724637 (= e!405905 (MissingVacant!7156 resIntermediateIndex!5))))

(declare-fun b!724638 () Bool)

(declare-fun e!405904 () SeekEntryResult!7156)

(assert (=> b!724638 (= e!405904 (Found!7156 index!1321))))

(declare-fun b!724639 () Bool)

(declare-fun c!79722 () Bool)

(declare-fun lt!321075 () (_ BitVec 64))

(assert (=> b!724639 (= c!79722 (= lt!321075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724639 (= e!405904 e!405905)))

(declare-fun b!724640 () Bool)

(declare-fun e!405906 () SeekEntryResult!7156)

(assert (=> b!724640 (= e!405906 e!405904)))

(declare-fun c!79723 () Bool)

(assert (=> b!724640 (= c!79723 (= lt!321075 (select (arr!19600 a!3186) j!159)))))

(declare-fun b!724641 () Bool)

(assert (=> b!724641 (= e!405906 Undefined!7156)))

(declare-fun lt!321074 () SeekEntryResult!7156)

(declare-fun d!99497 () Bool)

(get-info :version)

(assert (=> d!99497 (and (or ((_ is Undefined!7156) lt!321074) (not ((_ is Found!7156) lt!321074)) (and (bvsge (index!30993 lt!321074) #b00000000000000000000000000000000) (bvslt (index!30993 lt!321074) (size!20020 a!3186)))) (or ((_ is Undefined!7156) lt!321074) ((_ is Found!7156) lt!321074) (not ((_ is MissingVacant!7156) lt!321074)) (not (= (index!30995 lt!321074) resIntermediateIndex!5)) (and (bvsge (index!30995 lt!321074) #b00000000000000000000000000000000) (bvslt (index!30995 lt!321074) (size!20020 a!3186)))) (or ((_ is Undefined!7156) lt!321074) (ite ((_ is Found!7156) lt!321074) (= (select (arr!19600 a!3186) (index!30993 lt!321074)) (select (arr!19600 a!3186) j!159)) (and ((_ is MissingVacant!7156) lt!321074) (= (index!30995 lt!321074) resIntermediateIndex!5) (= (select (arr!19600 a!3186) (index!30995 lt!321074)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99497 (= lt!321074 e!405906)))

(declare-fun c!79724 () Bool)

(assert (=> d!99497 (= c!79724 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99497 (= lt!321075 (select (arr!19600 a!3186) index!1321))))

(assert (=> d!99497 (validMask!0 mask!3328)))

(assert (=> d!99497 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) lt!321074)))

(declare-fun b!724642 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724642 (= e!405905 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19600 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99497 c!79724) b!724641))

(assert (= (and d!99497 (not c!79724)) b!724640))

(assert (= (and b!724640 c!79723) b!724638))

(assert (= (and b!724640 (not c!79723)) b!724639))

(assert (= (and b!724639 c!79722) b!724637))

(assert (= (and b!724639 (not c!79722)) b!724642))

(declare-fun m!679545 () Bool)

(assert (=> d!99497 m!679545))

(declare-fun m!679547 () Bool)

(assert (=> d!99497 m!679547))

(declare-fun m!679549 () Bool)

(assert (=> d!99497 m!679549))

(assert (=> d!99497 m!679423))

(declare-fun m!679551 () Bool)

(assert (=> b!724642 m!679551))

(assert (=> b!724642 m!679551))

(assert (=> b!724642 m!679415))

(declare-fun m!679553 () Bool)

(assert (=> b!724642 m!679553))

(assert (=> b!724523 d!99497))

(declare-fun d!99499 () Bool)

(assert (=> d!99499 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!724524 d!99499))

(declare-fun b!724652 () Bool)

(declare-fun e!405913 () Bool)

(declare-fun e!405914 () Bool)

(assert (=> b!724652 (= e!405913 e!405914)))

(declare-fun c!79727 () Bool)

(assert (=> b!724652 (= c!79727 (validKeyInArray!0 (select (arr!19600 a!3186) j!159)))))

(declare-fun b!724653 () Bool)

(declare-fun e!405915 () Bool)

(declare-fun call!34797 () Bool)

(assert (=> b!724653 (= e!405915 call!34797)))

(declare-fun bm!34794 () Bool)

(assert (=> bm!34794 (= call!34797 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!724654 () Bool)

(assert (=> b!724654 (= e!405914 e!405915)))

(declare-fun lt!321082 () (_ BitVec 64))

(assert (=> b!724654 (= lt!321082 (select (arr!19600 a!3186) j!159))))

(declare-fun lt!321084 () Unit!24709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40960 (_ BitVec 64) (_ BitVec 32)) Unit!24709)

(assert (=> b!724654 (= lt!321084 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!321082 j!159))))

(assert (=> b!724654 (arrayContainsKey!0 a!3186 lt!321082 #b00000000000000000000000000000000)))

(declare-fun lt!321083 () Unit!24709)

(assert (=> b!724654 (= lt!321083 lt!321084)))

(declare-fun res!485944 () Bool)

(assert (=> b!724654 (= res!485944 (= (seekEntryOrOpen!0 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) (Found!7156 j!159)))))

(assert (=> b!724654 (=> (not res!485944) (not e!405915))))

(declare-fun d!99501 () Bool)

(declare-fun res!485943 () Bool)

(assert (=> d!99501 (=> res!485943 e!405913)))

(assert (=> d!99501 (= res!485943 (bvsge j!159 (size!20020 a!3186)))))

(assert (=> d!99501 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!405913)))

(declare-fun b!724651 () Bool)

(assert (=> b!724651 (= e!405914 call!34797)))

(assert (= (and d!99501 (not res!485943)) b!724652))

(assert (= (and b!724652 c!79727) b!724654))

(assert (= (and b!724652 (not c!79727)) b!724651))

(assert (= (and b!724654 res!485944) b!724653))

(assert (= (or b!724653 b!724651) bm!34794))

(assert (=> b!724652 m!679415))

(assert (=> b!724652 m!679415))

(assert (=> b!724652 m!679437))

(declare-fun m!679555 () Bool)

(assert (=> bm!34794 m!679555))

(assert (=> b!724654 m!679415))

(declare-fun m!679557 () Bool)

(assert (=> b!724654 m!679557))

(declare-fun m!679559 () Bool)

(assert (=> b!724654 m!679559))

(assert (=> b!724654 m!679415))

(assert (=> b!724654 m!679417))

(assert (=> b!724513 d!99501))

(declare-fun d!99503 () Bool)

(assert (=> d!99503 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!321087 () Unit!24709)

(declare-fun choose!38 (array!40960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24709)

(assert (=> d!99503 (= lt!321087 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99503 (validMask!0 mask!3328)))

(assert (=> d!99503 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!321087)))

(declare-fun bs!20828 () Bool)

(assert (= bs!20828 d!99503))

(assert (=> bs!20828 m!679453))

(declare-fun m!679561 () Bool)

(assert (=> bs!20828 m!679561))

(assert (=> bs!20828 m!679423))

(assert (=> b!724513 d!99503))

(declare-fun bm!34797 () Bool)

(declare-fun call!34800 () Bool)

(declare-fun c!79730 () Bool)

(assert (=> bm!34797 (= call!34800 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79730 (Cons!13505 (select (arr!19600 a!3186) #b00000000000000000000000000000000) Nil!13506) Nil!13506)))))

(declare-fun b!724665 () Bool)

(declare-fun e!405924 () Bool)

(declare-fun e!405926 () Bool)

(assert (=> b!724665 (= e!405924 e!405926)))

(declare-fun res!485951 () Bool)

(assert (=> b!724665 (=> (not res!485951) (not e!405926))))

(declare-fun e!405927 () Bool)

(assert (=> b!724665 (= res!485951 (not e!405927))))

(declare-fun res!485953 () Bool)

(assert (=> b!724665 (=> (not res!485953) (not e!405927))))

(assert (=> b!724665 (= res!485953 (validKeyInArray!0 (select (arr!19600 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724667 () Bool)

(declare-fun e!405925 () Bool)

(assert (=> b!724667 (= e!405925 call!34800)))

(declare-fun b!724668 () Bool)

(assert (=> b!724668 (= e!405926 e!405925)))

(assert (=> b!724668 (= c!79730 (validKeyInArray!0 (select (arr!19600 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724669 () Bool)

(declare-fun contains!4024 (List!13509 (_ BitVec 64)) Bool)

(assert (=> b!724669 (= e!405927 (contains!4024 Nil!13506 (select (arr!19600 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99505 () Bool)

(declare-fun res!485952 () Bool)

(assert (=> d!99505 (=> res!485952 e!405924)))

(assert (=> d!99505 (= res!485952 (bvsge #b00000000000000000000000000000000 (size!20020 a!3186)))))

(assert (=> d!99505 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13506) e!405924)))

(declare-fun b!724666 () Bool)

(assert (=> b!724666 (= e!405925 call!34800)))

(assert (= (and d!99505 (not res!485952)) b!724665))

(assert (= (and b!724665 res!485953) b!724669))

(assert (= (and b!724665 res!485951) b!724668))

(assert (= (and b!724668 c!79730) b!724667))

(assert (= (and b!724668 (not c!79730)) b!724666))

(assert (= (or b!724667 b!724666) bm!34797))

(declare-fun m!679563 () Bool)

(assert (=> bm!34797 m!679563))

(declare-fun m!679565 () Bool)

(assert (=> bm!34797 m!679565))

(assert (=> b!724665 m!679563))

(assert (=> b!724665 m!679563))

(declare-fun m!679567 () Bool)

(assert (=> b!724665 m!679567))

(assert (=> b!724668 m!679563))

(assert (=> b!724668 m!679563))

(assert (=> b!724668 m!679567))

(assert (=> b!724669 m!679563))

(assert (=> b!724669 m!679563))

(declare-fun m!679569 () Bool)

(assert (=> b!724669 m!679569))

(assert (=> b!724520 d!99505))

(declare-fun b!724721 () Bool)

(declare-fun c!79754 () Bool)

(declare-fun lt!321106 () (_ BitVec 64))

(assert (=> b!724721 (= c!79754 (= lt!321106 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405957 () SeekEntryResult!7156)

(declare-fun e!405956 () SeekEntryResult!7156)

(assert (=> b!724721 (= e!405957 e!405956)))

(declare-fun d!99511 () Bool)

(declare-fun lt!321107 () SeekEntryResult!7156)

(assert (=> d!99511 (and (or ((_ is Undefined!7156) lt!321107) (not ((_ is Found!7156) lt!321107)) (and (bvsge (index!30993 lt!321107) #b00000000000000000000000000000000) (bvslt (index!30993 lt!321107) (size!20020 a!3186)))) (or ((_ is Undefined!7156) lt!321107) ((_ is Found!7156) lt!321107) (not ((_ is MissingZero!7156) lt!321107)) (and (bvsge (index!30992 lt!321107) #b00000000000000000000000000000000) (bvslt (index!30992 lt!321107) (size!20020 a!3186)))) (or ((_ is Undefined!7156) lt!321107) ((_ is Found!7156) lt!321107) ((_ is MissingZero!7156) lt!321107) (not ((_ is MissingVacant!7156) lt!321107)) (and (bvsge (index!30995 lt!321107) #b00000000000000000000000000000000) (bvslt (index!30995 lt!321107) (size!20020 a!3186)))) (or ((_ is Undefined!7156) lt!321107) (ite ((_ is Found!7156) lt!321107) (= (select (arr!19600 a!3186) (index!30993 lt!321107)) k0!2102) (ite ((_ is MissingZero!7156) lt!321107) (= (select (arr!19600 a!3186) (index!30992 lt!321107)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7156) lt!321107) (= (select (arr!19600 a!3186) (index!30995 lt!321107)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!405955 () SeekEntryResult!7156)

(assert (=> d!99511 (= lt!321107 e!405955)))

(declare-fun c!79752 () Bool)

(declare-fun lt!321108 () SeekEntryResult!7156)

(assert (=> d!99511 (= c!79752 (and ((_ is Intermediate!7156) lt!321108) (undefined!7968 lt!321108)))))

(assert (=> d!99511 (= lt!321108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99511 (validMask!0 mask!3328)))

(assert (=> d!99511 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!321107)))

(declare-fun b!724722 () Bool)

(assert (=> b!724722 (= e!405955 e!405957)))

(assert (=> b!724722 (= lt!321106 (select (arr!19600 a!3186) (index!30994 lt!321108)))))

(declare-fun c!79753 () Bool)

(assert (=> b!724722 (= c!79753 (= lt!321106 k0!2102))))

(declare-fun b!724723 () Bool)

(assert (=> b!724723 (= e!405955 Undefined!7156)))

(declare-fun b!724724 () Bool)

(assert (=> b!724724 (= e!405956 (MissingZero!7156 (index!30994 lt!321108)))))

(declare-fun b!724725 () Bool)

(assert (=> b!724725 (= e!405957 (Found!7156 (index!30994 lt!321108)))))

(declare-fun b!724726 () Bool)

(assert (=> b!724726 (= e!405956 (seekKeyOrZeroReturnVacant!0 (x!62136 lt!321108) (index!30994 lt!321108) (index!30994 lt!321108) k0!2102 a!3186 mask!3328))))

(assert (= (and d!99511 c!79752) b!724723))

(assert (= (and d!99511 (not c!79752)) b!724722))

(assert (= (and b!724722 c!79753) b!724725))

(assert (= (and b!724722 (not c!79753)) b!724721))

(assert (= (and b!724721 c!79754) b!724724))

(assert (= (and b!724721 (not c!79754)) b!724726))

(declare-fun m!679579 () Bool)

(assert (=> d!99511 m!679579))

(assert (=> d!99511 m!679423))

(declare-fun m!679581 () Bool)

(assert (=> d!99511 m!679581))

(declare-fun m!679583 () Bool)

(assert (=> d!99511 m!679583))

(assert (=> d!99511 m!679583))

(declare-fun m!679585 () Bool)

(assert (=> d!99511 m!679585))

(declare-fun m!679587 () Bool)

(assert (=> d!99511 m!679587))

(declare-fun m!679589 () Bool)

(assert (=> b!724722 m!679589))

(declare-fun m!679591 () Bool)

(assert (=> b!724726 m!679591))

(assert (=> b!724521 d!99511))

(declare-fun b!724781 () Bool)

(declare-fun e!405991 () Bool)

(declare-fun e!405989 () Bool)

(assert (=> b!724781 (= e!405991 e!405989)))

(declare-fun res!485975 () Bool)

(declare-fun lt!321138 () SeekEntryResult!7156)

(assert (=> b!724781 (= res!485975 (and ((_ is Intermediate!7156) lt!321138) (not (undefined!7968 lt!321138)) (bvslt (x!62136 lt!321138) #b01111111111111111111111111111110) (bvsge (x!62136 lt!321138) #b00000000000000000000000000000000) (bvsge (x!62136 lt!321138) x!1131)))))

(assert (=> b!724781 (=> (not res!485975) (not e!405989))))

(declare-fun b!724782 () Bool)

(declare-fun e!405993 () SeekEntryResult!7156)

(assert (=> b!724782 (= e!405993 (Intermediate!7156 false index!1321 x!1131))))

(declare-fun b!724783 () Bool)

(assert (=> b!724783 (and (bvsge (index!30994 lt!321138) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321138) (size!20020 a!3186)))))

(declare-fun res!485977 () Bool)

(assert (=> b!724783 (= res!485977 (= (select (arr!19600 a!3186) (index!30994 lt!321138)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405992 () Bool)

(assert (=> b!724783 (=> res!485977 e!405992)))

(declare-fun d!99515 () Bool)

(assert (=> d!99515 e!405991))

(declare-fun c!79778 () Bool)

(assert (=> d!99515 (= c!79778 (and ((_ is Intermediate!7156) lt!321138) (undefined!7968 lt!321138)))))

(declare-fun e!405990 () SeekEntryResult!7156)

(assert (=> d!99515 (= lt!321138 e!405990)))

(declare-fun c!79777 () Bool)

(assert (=> d!99515 (= c!79777 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!321137 () (_ BitVec 64))

(assert (=> d!99515 (= lt!321137 (select (arr!19600 a!3186) index!1321))))

(assert (=> d!99515 (validMask!0 mask!3328)))

(assert (=> d!99515 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) lt!321138)))

(declare-fun b!724784 () Bool)

(assert (=> b!724784 (= e!405991 (bvsge (x!62136 lt!321138) #b01111111111111111111111111111110))))

(declare-fun b!724785 () Bool)

(assert (=> b!724785 (= e!405990 e!405993)))

(declare-fun c!79776 () Bool)

(assert (=> b!724785 (= c!79776 (or (= lt!321137 (select (arr!19600 a!3186) j!159)) (= (bvadd lt!321137 lt!321137) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724786 () Bool)

(assert (=> b!724786 (and (bvsge (index!30994 lt!321138) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321138) (size!20020 a!3186)))))

(declare-fun res!485976 () Bool)

(assert (=> b!724786 (= res!485976 (= (select (arr!19600 a!3186) (index!30994 lt!321138)) (select (arr!19600 a!3186) j!159)))))

(assert (=> b!724786 (=> res!485976 e!405992)))

(assert (=> b!724786 (= e!405989 e!405992)))

(declare-fun b!724787 () Bool)

(assert (=> b!724787 (= e!405990 (Intermediate!7156 true index!1321 x!1131))))

(declare-fun b!724788 () Bool)

(assert (=> b!724788 (and (bvsge (index!30994 lt!321138) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321138) (size!20020 a!3186)))))

(assert (=> b!724788 (= e!405992 (= (select (arr!19600 a!3186) (index!30994 lt!321138)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724789 () Bool)

(assert (=> b!724789 (= e!405993 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!19600 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99515 c!79777) b!724787))

(assert (= (and d!99515 (not c!79777)) b!724785))

(assert (= (and b!724785 c!79776) b!724782))

(assert (= (and b!724785 (not c!79776)) b!724789))

(assert (= (and d!99515 c!79778) b!724784))

(assert (= (and d!99515 (not c!79778)) b!724781))

(assert (= (and b!724781 res!485975) b!724786))

(assert (= (and b!724786 (not res!485976)) b!724783))

(assert (= (and b!724783 (not res!485977)) b!724788))

(declare-fun m!679629 () Bool)

(assert (=> b!724783 m!679629))

(assert (=> d!99515 m!679549))

(assert (=> d!99515 m!679423))

(assert (=> b!724786 m!679629))

(assert (=> b!724788 m!679629))

(assert (=> b!724789 m!679551))

(assert (=> b!724789 m!679551))

(assert (=> b!724789 m!679415))

(declare-fun m!679631 () Bool)

(assert (=> b!724789 m!679631))

(assert (=> b!724528 d!99515))

(declare-fun d!99527 () Bool)

(declare-fun res!485982 () Bool)

(declare-fun e!405998 () Bool)

(assert (=> d!99527 (=> res!485982 e!405998)))

(assert (=> d!99527 (= res!485982 (= (select (arr!19600 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99527 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!405998)))

(declare-fun b!724794 () Bool)

(declare-fun e!405999 () Bool)

(assert (=> b!724794 (= e!405998 e!405999)))

(declare-fun res!485983 () Bool)

(assert (=> b!724794 (=> (not res!485983) (not e!405999))))

(assert (=> b!724794 (= res!485983 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20020 a!3186)))))

(declare-fun b!724795 () Bool)

(assert (=> b!724795 (= e!405999 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99527 (not res!485982)) b!724794))

(assert (= (and b!724794 res!485983) b!724795))

(assert (=> d!99527 m!679563))

(declare-fun m!679633 () Bool)

(assert (=> b!724795 m!679633))

(assert (=> b!724517 d!99527))

(declare-fun b!724796 () Bool)

(declare-fun e!406002 () Bool)

(declare-fun e!406000 () Bool)

(assert (=> b!724796 (= e!406002 e!406000)))

(declare-fun res!485984 () Bool)

(declare-fun lt!321140 () SeekEntryResult!7156)

(assert (=> b!724796 (= res!485984 (and ((_ is Intermediate!7156) lt!321140) (not (undefined!7968 lt!321140)) (bvslt (x!62136 lt!321140) #b01111111111111111111111111111110) (bvsge (x!62136 lt!321140) #b00000000000000000000000000000000) (bvsge (x!62136 lt!321140) #b00000000000000000000000000000000)))))

(assert (=> b!724796 (=> (not res!485984) (not e!406000))))

(declare-fun b!724797 () Bool)

(declare-fun e!406004 () SeekEntryResult!7156)

(assert (=> b!724797 (= e!406004 (Intermediate!7156 false (toIndex!0 lt!321035 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724798 () Bool)

(assert (=> b!724798 (and (bvsge (index!30994 lt!321140) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321140) (size!20020 lt!321039)))))

(declare-fun res!485986 () Bool)

(assert (=> b!724798 (= res!485986 (= (select (arr!19600 lt!321039) (index!30994 lt!321140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!406003 () Bool)

(assert (=> b!724798 (=> res!485986 e!406003)))

(declare-fun d!99529 () Bool)

(assert (=> d!99529 e!406002))

(declare-fun c!79781 () Bool)

(assert (=> d!99529 (= c!79781 (and ((_ is Intermediate!7156) lt!321140) (undefined!7968 lt!321140)))))

(declare-fun e!406001 () SeekEntryResult!7156)

(assert (=> d!99529 (= lt!321140 e!406001)))

(declare-fun c!79780 () Bool)

(assert (=> d!99529 (= c!79780 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!321139 () (_ BitVec 64))

(assert (=> d!99529 (= lt!321139 (select (arr!19600 lt!321039) (toIndex!0 lt!321035 mask!3328)))))

(assert (=> d!99529 (validMask!0 mask!3328)))

(assert (=> d!99529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321035 mask!3328) lt!321035 lt!321039 mask!3328) lt!321140)))

(declare-fun b!724799 () Bool)

(assert (=> b!724799 (= e!406002 (bvsge (x!62136 lt!321140) #b01111111111111111111111111111110))))

(declare-fun b!724800 () Bool)

(assert (=> b!724800 (= e!406001 e!406004)))

(declare-fun c!79779 () Bool)

(assert (=> b!724800 (= c!79779 (or (= lt!321139 lt!321035) (= (bvadd lt!321139 lt!321139) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724801 () Bool)

(assert (=> b!724801 (and (bvsge (index!30994 lt!321140) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321140) (size!20020 lt!321039)))))

(declare-fun res!485985 () Bool)

(assert (=> b!724801 (= res!485985 (= (select (arr!19600 lt!321039) (index!30994 lt!321140)) lt!321035))))

(assert (=> b!724801 (=> res!485985 e!406003)))

(assert (=> b!724801 (= e!406000 e!406003)))

(declare-fun b!724802 () Bool)

(assert (=> b!724802 (= e!406001 (Intermediate!7156 true (toIndex!0 lt!321035 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724803 () Bool)

(assert (=> b!724803 (and (bvsge (index!30994 lt!321140) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321140) (size!20020 lt!321039)))))

(assert (=> b!724803 (= e!406003 (= (select (arr!19600 lt!321039) (index!30994 lt!321140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724804 () Bool)

(assert (=> b!724804 (= e!406004 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!321035 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!321035 lt!321039 mask!3328))))

(assert (= (and d!99529 c!79780) b!724802))

(assert (= (and d!99529 (not c!79780)) b!724800))

(assert (= (and b!724800 c!79779) b!724797))

(assert (= (and b!724800 (not c!79779)) b!724804))

(assert (= (and d!99529 c!79781) b!724799))

(assert (= (and d!99529 (not c!79781)) b!724796))

(assert (= (and b!724796 res!485984) b!724801))

(assert (= (and b!724801 (not res!485985)) b!724798))

(assert (= (and b!724798 (not res!485986)) b!724803))

(declare-fun m!679635 () Bool)

(assert (=> b!724798 m!679635))

(assert (=> d!99529 m!679429))

(declare-fun m!679637 () Bool)

(assert (=> d!99529 m!679637))

(assert (=> d!99529 m!679423))

(assert (=> b!724801 m!679635))

(assert (=> b!724803 m!679635))

(assert (=> b!724804 m!679429))

(declare-fun m!679639 () Bool)

(assert (=> b!724804 m!679639))

(assert (=> b!724804 m!679639))

(declare-fun m!679641 () Bool)

(assert (=> b!724804 m!679641))

(assert (=> b!724519 d!99529))

(declare-fun d!99531 () Bool)

(declare-fun lt!321146 () (_ BitVec 32))

(declare-fun lt!321145 () (_ BitVec 32))

(assert (=> d!99531 (= lt!321146 (bvmul (bvxor lt!321145 (bvlshr lt!321145 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99531 (= lt!321145 ((_ extract 31 0) (bvand (bvxor lt!321035 (bvlshr lt!321035 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99531 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!485987 (let ((h!14565 ((_ extract 31 0) (bvand (bvxor lt!321035 (bvlshr lt!321035 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62142 (bvmul (bvxor h!14565 (bvlshr h!14565 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62142 (bvlshr x!62142 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!485987 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!485987 #b00000000000000000000000000000000))))))

(assert (=> d!99531 (= (toIndex!0 lt!321035 mask!3328) (bvand (bvxor lt!321146 (bvlshr lt!321146 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!724519 d!99531))

(declare-fun b!724805 () Bool)

(declare-fun e!406007 () Bool)

(declare-fun e!406005 () Bool)

(assert (=> b!724805 (= e!406007 e!406005)))

(declare-fun res!485988 () Bool)

(declare-fun lt!321148 () SeekEntryResult!7156)

(assert (=> b!724805 (= res!485988 (and ((_ is Intermediate!7156) lt!321148) (not (undefined!7968 lt!321148)) (bvslt (x!62136 lt!321148) #b01111111111111111111111111111110) (bvsge (x!62136 lt!321148) #b00000000000000000000000000000000) (bvsge (x!62136 lt!321148) x!1131)))))

(assert (=> b!724805 (=> (not res!485988) (not e!406005))))

(declare-fun b!724806 () Bool)

(declare-fun e!406009 () SeekEntryResult!7156)

(assert (=> b!724806 (= e!406009 (Intermediate!7156 false index!1321 x!1131))))

(declare-fun b!724807 () Bool)

(assert (=> b!724807 (and (bvsge (index!30994 lt!321148) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321148) (size!20020 lt!321039)))))

(declare-fun res!485990 () Bool)

(assert (=> b!724807 (= res!485990 (= (select (arr!19600 lt!321039) (index!30994 lt!321148)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!406008 () Bool)

(assert (=> b!724807 (=> res!485990 e!406008)))

(declare-fun d!99533 () Bool)

(assert (=> d!99533 e!406007))

(declare-fun c!79784 () Bool)

(assert (=> d!99533 (= c!79784 (and ((_ is Intermediate!7156) lt!321148) (undefined!7968 lt!321148)))))

(declare-fun e!406006 () SeekEntryResult!7156)

(assert (=> d!99533 (= lt!321148 e!406006)))

(declare-fun c!79783 () Bool)

(assert (=> d!99533 (= c!79783 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!321147 () (_ BitVec 64))

(assert (=> d!99533 (= lt!321147 (select (arr!19600 lt!321039) index!1321))))

(assert (=> d!99533 (validMask!0 mask!3328)))

(assert (=> d!99533 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321035 lt!321039 mask!3328) lt!321148)))

(declare-fun b!724808 () Bool)

(assert (=> b!724808 (= e!406007 (bvsge (x!62136 lt!321148) #b01111111111111111111111111111110))))

(declare-fun b!724809 () Bool)

(assert (=> b!724809 (= e!406006 e!406009)))

(declare-fun c!79782 () Bool)

(assert (=> b!724809 (= c!79782 (or (= lt!321147 lt!321035) (= (bvadd lt!321147 lt!321147) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724810 () Bool)

(assert (=> b!724810 (and (bvsge (index!30994 lt!321148) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321148) (size!20020 lt!321039)))))

(declare-fun res!485989 () Bool)

(assert (=> b!724810 (= res!485989 (= (select (arr!19600 lt!321039) (index!30994 lt!321148)) lt!321035))))

(assert (=> b!724810 (=> res!485989 e!406008)))

(assert (=> b!724810 (= e!406005 e!406008)))

(declare-fun b!724811 () Bool)

(assert (=> b!724811 (= e!406006 (Intermediate!7156 true index!1321 x!1131))))

(declare-fun b!724812 () Bool)

(assert (=> b!724812 (and (bvsge (index!30994 lt!321148) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321148) (size!20020 lt!321039)))))

(assert (=> b!724812 (= e!406008 (= (select (arr!19600 lt!321039) (index!30994 lt!321148)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724813 () Bool)

(assert (=> b!724813 (= e!406009 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!321035 lt!321039 mask!3328))))

(assert (= (and d!99533 c!79783) b!724811))

(assert (= (and d!99533 (not c!79783)) b!724809))

(assert (= (and b!724809 c!79782) b!724806))

(assert (= (and b!724809 (not c!79782)) b!724813))

(assert (= (and d!99533 c!79784) b!724808))

(assert (= (and d!99533 (not c!79784)) b!724805))

(assert (= (and b!724805 res!485988) b!724810))

(assert (= (and b!724810 (not res!485989)) b!724807))

(assert (= (and b!724807 (not res!485990)) b!724812))

(declare-fun m!679643 () Bool)

(assert (=> b!724807 m!679643))

(declare-fun m!679645 () Bool)

(assert (=> d!99533 m!679645))

(assert (=> d!99533 m!679423))

(assert (=> b!724810 m!679643))

(assert (=> b!724812 m!679643))

(assert (=> b!724813 m!679551))

(assert (=> b!724813 m!679551))

(declare-fun m!679647 () Bool)

(assert (=> b!724813 m!679647))

(assert (=> b!724519 d!99533))

(declare-fun b!724814 () Bool)

(declare-fun c!79787 () Bool)

(declare-fun lt!321149 () (_ BitVec 64))

(assert (=> b!724814 (= c!79787 (= lt!321149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!406012 () SeekEntryResult!7156)

(declare-fun e!406011 () SeekEntryResult!7156)

(assert (=> b!724814 (= e!406012 e!406011)))

(declare-fun d!99539 () Bool)

(declare-fun lt!321150 () SeekEntryResult!7156)

(assert (=> d!99539 (and (or ((_ is Undefined!7156) lt!321150) (not ((_ is Found!7156) lt!321150)) (and (bvsge (index!30993 lt!321150) #b00000000000000000000000000000000) (bvslt (index!30993 lt!321150) (size!20020 a!3186)))) (or ((_ is Undefined!7156) lt!321150) ((_ is Found!7156) lt!321150) (not ((_ is MissingZero!7156) lt!321150)) (and (bvsge (index!30992 lt!321150) #b00000000000000000000000000000000) (bvslt (index!30992 lt!321150) (size!20020 a!3186)))) (or ((_ is Undefined!7156) lt!321150) ((_ is Found!7156) lt!321150) ((_ is MissingZero!7156) lt!321150) (not ((_ is MissingVacant!7156) lt!321150)) (and (bvsge (index!30995 lt!321150) #b00000000000000000000000000000000) (bvslt (index!30995 lt!321150) (size!20020 a!3186)))) (or ((_ is Undefined!7156) lt!321150) (ite ((_ is Found!7156) lt!321150) (= (select (arr!19600 a!3186) (index!30993 lt!321150)) (select (arr!19600 a!3186) j!159)) (ite ((_ is MissingZero!7156) lt!321150) (= (select (arr!19600 a!3186) (index!30992 lt!321150)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7156) lt!321150) (= (select (arr!19600 a!3186) (index!30995 lt!321150)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!406010 () SeekEntryResult!7156)

(assert (=> d!99539 (= lt!321150 e!406010)))

(declare-fun c!79785 () Bool)

(declare-fun lt!321151 () SeekEntryResult!7156)

(assert (=> d!99539 (= c!79785 (and ((_ is Intermediate!7156) lt!321151) (undefined!7968 lt!321151)))))

(assert (=> d!99539 (= lt!321151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328) (select (arr!19600 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99539 (validMask!0 mask!3328)))

(assert (=> d!99539 (= (seekEntryOrOpen!0 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) lt!321150)))

(declare-fun b!724815 () Bool)

(assert (=> b!724815 (= e!406010 e!406012)))

(assert (=> b!724815 (= lt!321149 (select (arr!19600 a!3186) (index!30994 lt!321151)))))

(declare-fun c!79786 () Bool)

(assert (=> b!724815 (= c!79786 (= lt!321149 (select (arr!19600 a!3186) j!159)))))

(declare-fun b!724816 () Bool)

(assert (=> b!724816 (= e!406010 Undefined!7156)))

(declare-fun b!724817 () Bool)

(assert (=> b!724817 (= e!406011 (MissingZero!7156 (index!30994 lt!321151)))))

(declare-fun b!724818 () Bool)

(assert (=> b!724818 (= e!406012 (Found!7156 (index!30994 lt!321151)))))

(declare-fun b!724819 () Bool)

(assert (=> b!724819 (= e!406011 (seekKeyOrZeroReturnVacant!0 (x!62136 lt!321151) (index!30994 lt!321151) (index!30994 lt!321151) (select (arr!19600 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99539 c!79785) b!724816))

(assert (= (and d!99539 (not c!79785)) b!724815))

(assert (= (and b!724815 c!79786) b!724818))

(assert (= (and b!724815 (not c!79786)) b!724814))

(assert (= (and b!724814 c!79787) b!724817))

(assert (= (and b!724814 (not c!79787)) b!724819))

(declare-fun m!679649 () Bool)

(assert (=> d!99539 m!679649))

(assert (=> d!99539 m!679423))

(declare-fun m!679651 () Bool)

(assert (=> d!99539 m!679651))

(assert (=> d!99539 m!679415))

(assert (=> d!99539 m!679449))

(assert (=> d!99539 m!679449))

(assert (=> d!99539 m!679415))

(assert (=> d!99539 m!679451))

(declare-fun m!679653 () Bool)

(assert (=> d!99539 m!679653))

(declare-fun m!679655 () Bool)

(assert (=> b!724815 m!679655))

(assert (=> b!724819 m!679415))

(declare-fun m!679657 () Bool)

(assert (=> b!724819 m!679657))

(assert (=> b!724518 d!99539))

(declare-fun d!99541 () Bool)

(assert (=> d!99541 (= (validKeyInArray!0 (select (arr!19600 a!3186) j!159)) (and (not (= (select (arr!19600 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19600 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!724515 d!99541))

(declare-fun d!99543 () Bool)

(assert (=> d!99543 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64446 d!99543))

(declare-fun d!99557 () Bool)

(assert (=> d!99557 (= (array_inv!15459 a!3186) (bvsge (size!20020 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64446 d!99557))

(declare-fun b!724868 () Bool)

(declare-fun e!406044 () Bool)

(declare-fun e!406042 () Bool)

(assert (=> b!724868 (= e!406044 e!406042)))

(declare-fun res!486011 () Bool)

(declare-fun lt!321170 () SeekEntryResult!7156)

(assert (=> b!724868 (= res!486011 (and ((_ is Intermediate!7156) lt!321170) (not (undefined!7968 lt!321170)) (bvslt (x!62136 lt!321170) #b01111111111111111111111111111110) (bvsge (x!62136 lt!321170) #b00000000000000000000000000000000) (bvsge (x!62136 lt!321170) #b00000000000000000000000000000000)))))

(assert (=> b!724868 (=> (not res!486011) (not e!406042))))

(declare-fun b!724869 () Bool)

(declare-fun e!406046 () SeekEntryResult!7156)

(assert (=> b!724869 (= e!406046 (Intermediate!7156 false (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724870 () Bool)

(assert (=> b!724870 (and (bvsge (index!30994 lt!321170) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321170) (size!20020 a!3186)))))

(declare-fun res!486013 () Bool)

(assert (=> b!724870 (= res!486013 (= (select (arr!19600 a!3186) (index!30994 lt!321170)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!406045 () Bool)

(assert (=> b!724870 (=> res!486013 e!406045)))

(declare-fun d!99559 () Bool)

(assert (=> d!99559 e!406044))

(declare-fun c!79805 () Bool)

(assert (=> d!99559 (= c!79805 (and ((_ is Intermediate!7156) lt!321170) (undefined!7968 lt!321170)))))

(declare-fun e!406043 () SeekEntryResult!7156)

(assert (=> d!99559 (= lt!321170 e!406043)))

(declare-fun c!79804 () Bool)

(assert (=> d!99559 (= c!79804 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!321169 () (_ BitVec 64))

(assert (=> d!99559 (= lt!321169 (select (arr!19600 a!3186) (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328)))))

(assert (=> d!99559 (validMask!0 mask!3328)))

(assert (=> d!99559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328) (select (arr!19600 a!3186) j!159) a!3186 mask!3328) lt!321170)))

(declare-fun b!724871 () Bool)

(assert (=> b!724871 (= e!406044 (bvsge (x!62136 lt!321170) #b01111111111111111111111111111110))))

(declare-fun b!724872 () Bool)

(assert (=> b!724872 (= e!406043 e!406046)))

(declare-fun c!79803 () Bool)

(assert (=> b!724872 (= c!79803 (or (= lt!321169 (select (arr!19600 a!3186) j!159)) (= (bvadd lt!321169 lt!321169) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724873 () Bool)

(assert (=> b!724873 (and (bvsge (index!30994 lt!321170) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321170) (size!20020 a!3186)))))

(declare-fun res!486012 () Bool)

(assert (=> b!724873 (= res!486012 (= (select (arr!19600 a!3186) (index!30994 lt!321170)) (select (arr!19600 a!3186) j!159)))))

(assert (=> b!724873 (=> res!486012 e!406045)))

(assert (=> b!724873 (= e!406042 e!406045)))

(declare-fun b!724874 () Bool)

(assert (=> b!724874 (= e!406043 (Intermediate!7156 true (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724875 () Bool)

(assert (=> b!724875 (and (bvsge (index!30994 lt!321170) #b00000000000000000000000000000000) (bvslt (index!30994 lt!321170) (size!20020 a!3186)))))

(assert (=> b!724875 (= e!406045 (= (select (arr!19600 a!3186) (index!30994 lt!321170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724876 () Bool)

(assert (=> b!724876 (= e!406046 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!19600 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99559 c!79804) b!724874))

(assert (= (and d!99559 (not c!79804)) b!724872))

(assert (= (and b!724872 c!79803) b!724869))

(assert (= (and b!724872 (not c!79803)) b!724876))

(assert (= (and d!99559 c!79805) b!724871))

(assert (= (and d!99559 (not c!79805)) b!724868))

(assert (= (and b!724868 res!486011) b!724873))

(assert (= (and b!724873 (not res!486012)) b!724870))

(assert (= (and b!724870 (not res!486013)) b!724875))

(declare-fun m!679689 () Bool)

(assert (=> b!724870 m!679689))

(assert (=> d!99559 m!679449))

(declare-fun m!679691 () Bool)

(assert (=> d!99559 m!679691))

(assert (=> d!99559 m!679423))

(assert (=> b!724873 m!679689))

(assert (=> b!724875 m!679689))

(assert (=> b!724876 m!679449))

(declare-fun m!679693 () Bool)

(assert (=> b!724876 m!679693))

(assert (=> b!724876 m!679693))

(assert (=> b!724876 m!679415))

(declare-fun m!679695 () Bool)

(assert (=> b!724876 m!679695))

(assert (=> b!724527 d!99559))

(declare-fun d!99561 () Bool)

(declare-fun lt!321172 () (_ BitVec 32))

(declare-fun lt!321171 () (_ BitVec 32))

(assert (=> d!99561 (= lt!321172 (bvmul (bvxor lt!321171 (bvlshr lt!321171 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99561 (= lt!321171 ((_ extract 31 0) (bvand (bvxor (select (arr!19600 a!3186) j!159) (bvlshr (select (arr!19600 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99561 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!485987 (let ((h!14565 ((_ extract 31 0) (bvand (bvxor (select (arr!19600 a!3186) j!159) (bvlshr (select (arr!19600 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62142 (bvmul (bvxor h!14565 (bvlshr h!14565 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62142 (bvlshr x!62142 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!485987 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!485987 #b00000000000000000000000000000000))))))

(assert (=> d!99561 (= (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328) (bvand (bvxor lt!321172 (bvlshr lt!321172 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!724527 d!99561))

(declare-fun b!724878 () Bool)

(declare-fun e!406047 () Bool)

(declare-fun e!406048 () Bool)

(assert (=> b!724878 (= e!406047 e!406048)))

(declare-fun c!79806 () Bool)

(assert (=> b!724878 (= c!79806 (validKeyInArray!0 (select (arr!19600 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724879 () Bool)

(declare-fun e!406049 () Bool)

(declare-fun call!34804 () Bool)

(assert (=> b!724879 (= e!406049 call!34804)))

(declare-fun bm!34801 () Bool)

(assert (=> bm!34801 (= call!34804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!724880 () Bool)

(assert (=> b!724880 (= e!406048 e!406049)))

(declare-fun lt!321173 () (_ BitVec 64))

(assert (=> b!724880 (= lt!321173 (select (arr!19600 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!321175 () Unit!24709)

(assert (=> b!724880 (= lt!321175 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!321173 #b00000000000000000000000000000000))))

(assert (=> b!724880 (arrayContainsKey!0 a!3186 lt!321173 #b00000000000000000000000000000000)))

(declare-fun lt!321174 () Unit!24709)

(assert (=> b!724880 (= lt!321174 lt!321175)))

(declare-fun res!486015 () Bool)

(assert (=> b!724880 (= res!486015 (= (seekEntryOrOpen!0 (select (arr!19600 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7156 #b00000000000000000000000000000000)))))

(assert (=> b!724880 (=> (not res!486015) (not e!406049))))

(declare-fun d!99563 () Bool)

(declare-fun res!486014 () Bool)

(assert (=> d!99563 (=> res!486014 e!406047)))

(assert (=> d!99563 (= res!486014 (bvsge #b00000000000000000000000000000000 (size!20020 a!3186)))))

(assert (=> d!99563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!406047)))

(declare-fun b!724877 () Bool)

(assert (=> b!724877 (= e!406048 call!34804)))

(assert (= (and d!99563 (not res!486014)) b!724878))

(assert (= (and b!724878 c!79806) b!724880))

(assert (= (and b!724878 (not c!79806)) b!724877))

(assert (= (and b!724880 res!486015) b!724879))

(assert (= (or b!724879 b!724877) bm!34801))

(assert (=> b!724878 m!679563))

(assert (=> b!724878 m!679563))

(assert (=> b!724878 m!679567))

(declare-fun m!679697 () Bool)

(assert (=> bm!34801 m!679697))

(assert (=> b!724880 m!679563))

(declare-fun m!679699 () Bool)

(assert (=> b!724880 m!679699))

(declare-fun m!679701 () Bool)

(assert (=> b!724880 m!679701))

(assert (=> b!724880 m!679563))

(declare-fun m!679703 () Bool)

(assert (=> b!724880 m!679703))

(assert (=> b!724526 d!99563))

(check-sat (not b!724665) (not bm!34797) (not d!99539) (not b!724804) (not d!99511) (not b!724654) (not d!99497) (not bm!34794) (not b!724652) (not b!724668) (not d!99515) (not b!724726) (not b!724819) (not d!99559) (not bm!34801) (not d!99533) (not b!724813) (not d!99503) (not d!99529) (not b!724878) (not b!724876) (not b!724789) (not b!724880) (not b!724669) (not b!724795) (not b!724642))
(check-sat)
