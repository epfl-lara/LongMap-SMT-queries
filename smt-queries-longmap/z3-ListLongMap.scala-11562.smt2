; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134656 () Bool)

(assert start!134656)

(declare-fun b!1571411 () Bool)

(declare-fun res!1073652 () Bool)

(declare-fun e!876175 () Bool)

(assert (=> b!1571411 (=> (not res!1073652) (not e!876175))))

(declare-datatypes ((array!104858 0))(
  ( (array!104859 (arr!50606 (Array (_ BitVec 32) (_ BitVec 64))) (size!51156 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104858)

(declare-fun mask!4043 () (_ BitVec 32))

(assert (=> b!1571411 (= res!1073652 (= (size!51156 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-fun b!1571412 () Bool)

(get-info :version)

(declare-datatypes ((SeekEntryResult!13543 0))(
  ( (MissingZero!13543 (index!56570 (_ BitVec 32))) (Found!13543 (index!56571 (_ BitVec 32))) (Intermediate!13543 (undefined!14355 Bool) (index!56572 (_ BitVec 32)) (x!141269 (_ BitVec 32))) (Undefined!13543) (MissingVacant!13543 (index!56573 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!104858 (_ BitVec 32)) SeekEntryResult!13543)

(assert (=> b!1571412 (= e!876175 ((_ is Found!13543) (seekEntry!0 k0!2731 a!3462 mask!4043)))))

(declare-fun b!1571413 () Bool)

(declare-fun res!1073648 () Bool)

(assert (=> b!1571413 (=> (not res!1073648) (not e!876175))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104858 (_ BitVec 32)) SeekEntryResult!13543)

(assert (=> b!1571413 (= res!1073648 (not ((_ is Found!13543) (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043))))))

(declare-fun b!1571414 () Bool)

(declare-fun res!1073649 () Bool)

(assert (=> b!1571414 (=> (not res!1073649) (not e!876175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571414 (= res!1073649 (validKeyInArray!0 k0!2731))))

(declare-fun res!1073650 () Bool)

(assert (=> start!134656 (=> (not res!1073650) (not e!876175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134656 (= res!1073650 (validMask!0 mask!4043))))

(assert (=> start!134656 e!876175))

(assert (=> start!134656 true))

(declare-fun array_inv!39333 (array!104858) Bool)

(assert (=> start!134656 (array_inv!39333 a!3462)))

(declare-fun b!1571415 () Bool)

(declare-fun res!1073651 () Bool)

(assert (=> b!1571415 (=> (not res!1073651) (not e!876175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104858 (_ BitVec 32)) Bool)

(assert (=> b!1571415 (= res!1073651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134656 res!1073650) b!1571411))

(assert (= (and b!1571411 res!1073652) b!1571415))

(assert (= (and b!1571415 res!1073651) b!1571414))

(assert (= (and b!1571414 res!1073649) b!1571413))

(assert (= (and b!1571413 res!1073648) b!1571412))

(declare-fun m!1445371 () Bool)

(assert (=> start!134656 m!1445371))

(declare-fun m!1445373 () Bool)

(assert (=> start!134656 m!1445373))

(declare-fun m!1445375 () Bool)

(assert (=> b!1571414 m!1445375))

(declare-fun m!1445377 () Bool)

(assert (=> b!1571413 m!1445377))

(declare-fun m!1445379 () Bool)

(assert (=> b!1571415 m!1445379))

(declare-fun m!1445381 () Bool)

(assert (=> b!1571412 m!1445381))

(check-sat (not b!1571415) (not b!1571414) (not b!1571413) (not start!134656) (not b!1571412))
(check-sat)
(get-model)

(declare-fun d!164527 () Bool)

(assert (=> d!164527 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!134656 d!164527))

(declare-fun d!164535 () Bool)

(assert (=> d!164535 (= (array_inv!39333 a!3462) (bvsge (size!51156 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!134656 d!164535))

(declare-fun d!164537 () Bool)

(assert (=> d!164537 (= (validKeyInArray!0 k0!2731) (and (not (= k0!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571414 d!164537))

(declare-fun b!1571452 () Bool)

(declare-fun e!876198 () Bool)

(declare-fun call!72368 () Bool)

(assert (=> b!1571452 (= e!876198 call!72368)))

(declare-fun bm!72365 () Bool)

(assert (=> bm!72365 (= call!72368 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun b!1571453 () Bool)

(declare-fun e!876199 () Bool)

(assert (=> b!1571453 (= e!876199 e!876198)))

(declare-fun c!145122 () Bool)

(assert (=> b!1571453 (= c!145122 (validKeyInArray!0 (select (arr!50606 a!3462) #b00000000000000000000000000000000)))))

(declare-fun b!1571454 () Bool)

(declare-fun e!876200 () Bool)

(assert (=> b!1571454 (= e!876200 call!72368)))

(declare-fun b!1571451 () Bool)

(assert (=> b!1571451 (= e!876198 e!876200)))

(declare-fun lt!673578 () (_ BitVec 64))

(assert (=> b!1571451 (= lt!673578 (select (arr!50606 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52110 0))(
  ( (Unit!52111) )
))
(declare-fun lt!673579 () Unit!52110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104858 (_ BitVec 64) (_ BitVec 32)) Unit!52110)

(assert (=> b!1571451 (= lt!673579 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!673578 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1571451 (arrayContainsKey!0 a!3462 lt!673578 #b00000000000000000000000000000000)))

(declare-fun lt!673577 () Unit!52110)

(assert (=> b!1571451 (= lt!673577 lt!673579)))

(declare-fun res!1073679 () Bool)

(assert (=> b!1571451 (= res!1073679 (= (seekEntryOrOpen!0 (select (arr!50606 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13543 #b00000000000000000000000000000000)))))

(assert (=> b!1571451 (=> (not res!1073679) (not e!876200))))

(declare-fun d!164539 () Bool)

(declare-fun res!1073678 () Bool)

(assert (=> d!164539 (=> res!1073678 e!876199)))

(assert (=> d!164539 (= res!1073678 (bvsge #b00000000000000000000000000000000 (size!51156 a!3462)))))

(assert (=> d!164539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!876199)))

(assert (= (and d!164539 (not res!1073678)) b!1571453))

(assert (= (and b!1571453 c!145122) b!1571451))

(assert (= (and b!1571453 (not c!145122)) b!1571452))

(assert (= (and b!1571451 res!1073679) b!1571454))

(assert (= (or b!1571454 b!1571452) bm!72365))

(declare-fun m!1445407 () Bool)

(assert (=> bm!72365 m!1445407))

(declare-fun m!1445409 () Bool)

(assert (=> b!1571453 m!1445409))

(assert (=> b!1571453 m!1445409))

(declare-fun m!1445411 () Bool)

(assert (=> b!1571453 m!1445411))

(assert (=> b!1571451 m!1445409))

(declare-fun m!1445413 () Bool)

(assert (=> b!1571451 m!1445413))

(declare-fun m!1445415 () Bool)

(assert (=> b!1571451 m!1445415))

(assert (=> b!1571451 m!1445409))

(declare-fun m!1445417 () Bool)

(assert (=> b!1571451 m!1445417))

(assert (=> b!1571415 d!164539))

(declare-fun b!1571511 () Bool)

(declare-fun c!145150 () Bool)

(declare-fun lt!673614 () (_ BitVec 64))

(assert (=> b!1571511 (= c!145150 (= lt!673614 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876233 () SeekEntryResult!13543)

(declare-fun e!876231 () SeekEntryResult!13543)

(assert (=> b!1571511 (= e!876233 e!876231)))

(declare-fun d!164547 () Bool)

(declare-fun lt!673615 () SeekEntryResult!13543)

(assert (=> d!164547 (and (or ((_ is Undefined!13543) lt!673615) (not ((_ is Found!13543) lt!673615)) (and (bvsge (index!56571 lt!673615) #b00000000000000000000000000000000) (bvslt (index!56571 lt!673615) (size!51156 a!3462)))) (or ((_ is Undefined!13543) lt!673615) ((_ is Found!13543) lt!673615) (not ((_ is MissingZero!13543) lt!673615)) (and (bvsge (index!56570 lt!673615) #b00000000000000000000000000000000) (bvslt (index!56570 lt!673615) (size!51156 a!3462)))) (or ((_ is Undefined!13543) lt!673615) ((_ is Found!13543) lt!673615) ((_ is MissingZero!13543) lt!673615) (not ((_ is MissingVacant!13543) lt!673615)) (and (bvsge (index!56573 lt!673615) #b00000000000000000000000000000000) (bvslt (index!56573 lt!673615) (size!51156 a!3462)))) (or ((_ is Undefined!13543) lt!673615) (ite ((_ is Found!13543) lt!673615) (= (select (arr!50606 a!3462) (index!56571 lt!673615)) k0!2731) (ite ((_ is MissingZero!13543) lt!673615) (= (select (arr!50606 a!3462) (index!56570 lt!673615)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13543) lt!673615) (= (select (arr!50606 a!3462) (index!56573 lt!673615)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!876232 () SeekEntryResult!13543)

(assert (=> d!164547 (= lt!673615 e!876232)))

(declare-fun c!145151 () Bool)

(declare-fun lt!673613 () SeekEntryResult!13543)

(assert (=> d!164547 (= c!145151 (and ((_ is Intermediate!13543) lt!673613) (undefined!14355 lt!673613)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104858 (_ BitVec 32)) SeekEntryResult!13543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!164547 (= lt!673613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2731 mask!4043) k0!2731 a!3462 mask!4043))))

(assert (=> d!164547 (validMask!0 mask!4043)))

(assert (=> d!164547 (= (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043) lt!673615)))

(declare-fun b!1571512 () Bool)

(assert (=> b!1571512 (= e!876232 e!876233)))

(assert (=> b!1571512 (= lt!673614 (select (arr!50606 a!3462) (index!56572 lt!673613)))))

(declare-fun c!145149 () Bool)

(assert (=> b!1571512 (= c!145149 (= lt!673614 k0!2731))))

(declare-fun b!1571513 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104858 (_ BitVec 32)) SeekEntryResult!13543)

(assert (=> b!1571513 (= e!876231 (seekKeyOrZeroReturnVacant!0 (x!141269 lt!673613) (index!56572 lt!673613) (index!56572 lt!673613) k0!2731 a!3462 mask!4043))))

(declare-fun b!1571514 () Bool)

(assert (=> b!1571514 (= e!876231 (MissingZero!13543 (index!56572 lt!673613)))))

(declare-fun b!1571515 () Bool)

(assert (=> b!1571515 (= e!876233 (Found!13543 (index!56572 lt!673613)))))

(declare-fun b!1571516 () Bool)

(assert (=> b!1571516 (= e!876232 Undefined!13543)))

(assert (= (and d!164547 c!145151) b!1571516))

(assert (= (and d!164547 (not c!145151)) b!1571512))

(assert (= (and b!1571512 c!145149) b!1571515))

(assert (= (and b!1571512 (not c!145149)) b!1571511))

(assert (= (and b!1571511 c!145150) b!1571514))

(assert (= (and b!1571511 (not c!145150)) b!1571513))

(declare-fun m!1445443 () Bool)

(assert (=> d!164547 m!1445443))

(declare-fun m!1445445 () Bool)

(assert (=> d!164547 m!1445445))

(declare-fun m!1445447 () Bool)

(assert (=> d!164547 m!1445447))

(declare-fun m!1445449 () Bool)

(assert (=> d!164547 m!1445449))

(assert (=> d!164547 m!1445447))

(declare-fun m!1445451 () Bool)

(assert (=> d!164547 m!1445451))

(assert (=> d!164547 m!1445371))

(declare-fun m!1445453 () Bool)

(assert (=> b!1571512 m!1445453))

(declare-fun m!1445455 () Bool)

(assert (=> b!1571513 m!1445455))

(assert (=> b!1571413 d!164547))

(declare-fun b!1571557 () Bool)

(declare-fun e!876256 () SeekEntryResult!13543)

(assert (=> b!1571557 (= e!876256 Undefined!13543)))

(declare-fun b!1571558 () Bool)

(declare-fun e!876257 () SeekEntryResult!13543)

(assert (=> b!1571558 (= e!876256 e!876257)))

(declare-fun lt!673641 () (_ BitVec 64))

(declare-fun lt!673642 () SeekEntryResult!13543)

(assert (=> b!1571558 (= lt!673641 (select (arr!50606 a!3462) (index!56572 lt!673642)))))

(declare-fun c!145172 () Bool)

(assert (=> b!1571558 (= c!145172 (= lt!673641 k0!2731))))

(declare-fun b!1571559 () Bool)

(declare-fun e!876255 () SeekEntryResult!13543)

(declare-fun lt!673643 () SeekEntryResult!13543)

(assert (=> b!1571559 (= e!876255 (ite ((_ is MissingVacant!13543) lt!673643) (MissingZero!13543 (index!56573 lt!673643)) lt!673643))))

(assert (=> b!1571559 (= lt!673643 (seekKeyOrZeroReturnVacant!0 (x!141269 lt!673642) (index!56572 lt!673642) (index!56572 lt!673642) k0!2731 a!3462 mask!4043))))

(declare-fun d!164557 () Bool)

(declare-fun lt!673644 () SeekEntryResult!13543)

(assert (=> d!164557 (and (or ((_ is MissingVacant!13543) lt!673644) (not ((_ is Found!13543) lt!673644)) (and (bvsge (index!56571 lt!673644) #b00000000000000000000000000000000) (bvslt (index!56571 lt!673644) (size!51156 a!3462)))) (not ((_ is MissingVacant!13543) lt!673644)) (or (not ((_ is Found!13543) lt!673644)) (= (select (arr!50606 a!3462) (index!56571 lt!673644)) k0!2731)))))

(assert (=> d!164557 (= lt!673644 e!876256)))

(declare-fun c!145171 () Bool)

(assert (=> d!164557 (= c!145171 (and ((_ is Intermediate!13543) lt!673642) (undefined!14355 lt!673642)))))

(assert (=> d!164557 (= lt!673642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2731 mask!4043) k0!2731 a!3462 mask!4043))))

(assert (=> d!164557 (validMask!0 mask!4043)))

(assert (=> d!164557 (= (seekEntry!0 k0!2731 a!3462 mask!4043) lt!673644)))

(declare-fun b!1571560 () Bool)

(declare-fun c!145173 () Bool)

(assert (=> b!1571560 (= c!145173 (= lt!673641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1571560 (= e!876257 e!876255)))

(declare-fun b!1571561 () Bool)

(assert (=> b!1571561 (= e!876257 (Found!13543 (index!56572 lt!673642)))))

(declare-fun b!1571562 () Bool)

(assert (=> b!1571562 (= e!876255 (MissingZero!13543 (index!56572 lt!673642)))))

(assert (= (and d!164557 c!145171) b!1571557))

(assert (= (and d!164557 (not c!145171)) b!1571558))

(assert (= (and b!1571558 c!145172) b!1571561))

(assert (= (and b!1571558 (not c!145172)) b!1571560))

(assert (= (and b!1571560 c!145173) b!1571562))

(assert (= (and b!1571560 (not c!145173)) b!1571559))

(declare-fun m!1445469 () Bool)

(assert (=> b!1571558 m!1445469))

(declare-fun m!1445471 () Bool)

(assert (=> b!1571559 m!1445471))

(declare-fun m!1445473 () Bool)

(assert (=> d!164557 m!1445473))

(assert (=> d!164557 m!1445447))

(assert (=> d!164557 m!1445447))

(assert (=> d!164557 m!1445449))

(assert (=> d!164557 m!1445371))

(assert (=> b!1571412 d!164557))

(check-sat (not b!1571559) (not d!164557) (not b!1571453) (not b!1571513) (not bm!72365) (not b!1571451) (not d!164547))
(check-sat)
