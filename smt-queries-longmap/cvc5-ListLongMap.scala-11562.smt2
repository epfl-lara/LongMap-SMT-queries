; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134654 () Bool)

(assert start!134654)

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun e!876169 () Bool)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun b!1571396 () Bool)

(declare-datatypes ((array!104856 0))(
  ( (array!104857 (arr!50605 (Array (_ BitVec 32) (_ BitVec 64))) (size!51155 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104856)

(declare-datatypes ((SeekEntryResult!13542 0))(
  ( (MissingZero!13542 (index!56566 (_ BitVec 32))) (Found!13542 (index!56567 (_ BitVec 32))) (Intermediate!13542 (undefined!14354 Bool) (index!56568 (_ BitVec 32)) (x!141268 (_ BitVec 32))) (Undefined!13542) (MissingVacant!13542 (index!56569 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!104856 (_ BitVec 32)) SeekEntryResult!13542)

(assert (=> b!1571396 (= e!876169 (is-Found!13542 (seekEntry!0 k!2731 a!3462 mask!4043)))))

(declare-fun b!1571397 () Bool)

(declare-fun res!1073634 () Bool)

(assert (=> b!1571397 (=> (not res!1073634) (not e!876169))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104856 (_ BitVec 32)) SeekEntryResult!13542)

(assert (=> b!1571397 (= res!1073634 (not (is-Found!13542 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))))

(declare-fun res!1073633 () Bool)

(assert (=> start!134654 (=> (not res!1073633) (not e!876169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134654 (= res!1073633 (validMask!0 mask!4043))))

(assert (=> start!134654 e!876169))

(assert (=> start!134654 true))

(declare-fun array_inv!39332 (array!104856) Bool)

(assert (=> start!134654 (array_inv!39332 a!3462)))

(declare-fun b!1571398 () Bool)

(declare-fun res!1073635 () Bool)

(assert (=> b!1571398 (=> (not res!1073635) (not e!876169))))

(assert (=> b!1571398 (= res!1073635 (= (size!51155 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571399 () Bool)

(declare-fun res!1073637 () Bool)

(assert (=> b!1571399 (=> (not res!1073637) (not e!876169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104856 (_ BitVec 32)) Bool)

(assert (=> b!1571399 (= res!1073637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571400 () Bool)

(declare-fun res!1073636 () Bool)

(assert (=> b!1571400 (=> (not res!1073636) (not e!876169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571400 (= res!1073636 (validKeyInArray!0 k!2731))))

(assert (= (and start!134654 res!1073633) b!1571398))

(assert (= (and b!1571398 res!1073635) b!1571399))

(assert (= (and b!1571399 res!1073637) b!1571400))

(assert (= (and b!1571400 res!1073636) b!1571397))

(assert (= (and b!1571397 res!1073634) b!1571396))

(declare-fun m!1445359 () Bool)

(assert (=> b!1571400 m!1445359))

(declare-fun m!1445361 () Bool)

(assert (=> b!1571397 m!1445361))

(declare-fun m!1445363 () Bool)

(assert (=> b!1571396 m!1445363))

(declare-fun m!1445365 () Bool)

(assert (=> start!134654 m!1445365))

(declare-fun m!1445367 () Bool)

(assert (=> start!134654 m!1445367))

(declare-fun m!1445369 () Bool)

(assert (=> b!1571399 m!1445369))

(push 1)

(assert (not b!1571399))

(assert (not start!134654))

(assert (not b!1571396))

(assert (not b!1571397))

(assert (not b!1571400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164529 () Bool)

(assert (=> d!164529 (= (validKeyInArray!0 k!2731) (and (not (= k!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571400 d!164529))

(declare-fun b!1571439 () Bool)

(declare-fun e!876190 () Bool)

(declare-fun call!72365 () Bool)

(assert (=> b!1571439 (= e!876190 call!72365)))

(declare-fun b!1571440 () Bool)

(declare-fun e!876189 () Bool)

(assert (=> b!1571440 (= e!876189 call!72365)))

(declare-fun b!1571441 () Bool)

(assert (=> b!1571441 (= e!876190 e!876189)))

(declare-fun lt!673568 () (_ BitVec 64))

(assert (=> b!1571441 (= lt!673568 (select (arr!50605 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52108 0))(
  ( (Unit!52109) )
))
(declare-fun lt!673569 () Unit!52108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104856 (_ BitVec 64) (_ BitVec 32)) Unit!52108)

(assert (=> b!1571441 (= lt!673569 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!673568 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1571441 (arrayContainsKey!0 a!3462 lt!673568 #b00000000000000000000000000000000)))

(declare-fun lt!673570 () Unit!52108)

(assert (=> b!1571441 (= lt!673570 lt!673569)))

(declare-fun res!1073673 () Bool)

(assert (=> b!1571441 (= res!1073673 (= (seekEntryOrOpen!0 (select (arr!50605 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13542 #b00000000000000000000000000000000)))))

(assert (=> b!1571441 (=> (not res!1073673) (not e!876189))))

(declare-fun b!1571442 () Bool)

(declare-fun e!876191 () Bool)

(assert (=> b!1571442 (= e!876191 e!876190)))

(declare-fun c!145119 () Bool)

(assert (=> b!1571442 (= c!145119 (validKeyInArray!0 (select (arr!50605 a!3462) #b00000000000000000000000000000000)))))

(declare-fun bm!72362 () Bool)

(assert (=> bm!72362 (= call!72365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun d!164533 () Bool)

(declare-fun res!1073672 () Bool)

(assert (=> d!164533 (=> res!1073672 e!876191)))

(assert (=> d!164533 (= res!1073672 (bvsge #b00000000000000000000000000000000 (size!51155 a!3462)))))

(assert (=> d!164533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!876191)))

(assert (= (and d!164533 (not res!1073672)) b!1571442))

(assert (= (and b!1571442 c!145119) b!1571441))

(assert (= (and b!1571442 (not c!145119)) b!1571439))

(assert (= (and b!1571441 res!1073673) b!1571440))

(assert (= (or b!1571440 b!1571439) bm!72362))

(declare-fun m!1445395 () Bool)

(assert (=> b!1571441 m!1445395))

(declare-fun m!1445397 () Bool)

(assert (=> b!1571441 m!1445397))

(declare-fun m!1445399 () Bool)

(assert (=> b!1571441 m!1445399))

(assert (=> b!1571441 m!1445395))

(declare-fun m!1445401 () Bool)

(assert (=> b!1571441 m!1445401))

(assert (=> b!1571442 m!1445395))

(assert (=> b!1571442 m!1445395))

(declare-fun m!1445403 () Bool)

(assert (=> b!1571442 m!1445403))

(declare-fun m!1445405 () Bool)

(assert (=> bm!72362 m!1445405))

(assert (=> b!1571399 d!164533))

(declare-fun d!164545 () Bool)

(assert (=> d!164545 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!134654 d!164545))

(declare-fun d!164549 () Bool)

(assert (=> d!164549 (= (array_inv!39332 a!3462) (bvsge (size!51155 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!134654 d!164549))

(declare-fun d!164551 () Bool)

(declare-fun lt!673606 () SeekEntryResult!13542)

(assert (=> d!164551 (and (or (is-MissingVacant!13542 lt!673606) (not (is-Found!13542 lt!673606)) (and (bvsge (index!56567 lt!673606) #b00000000000000000000000000000000) (bvslt (index!56567 lt!673606) (size!51155 a!3462)))) (not (is-MissingVacant!13542 lt!673606)) (or (not (is-Found!13542 lt!673606)) (= (select (arr!50605 a!3462) (index!56567 lt!673606)) k!2731)))))

(declare-fun e!876222 () SeekEntryResult!13542)

(assert (=> d!164551 (= lt!673606 e!876222)))

(declare-fun c!145145 () Bool)

(declare-fun lt!673603 () SeekEntryResult!13542)

(assert (=> d!164551 (= c!145145 (and (is-Intermediate!13542 lt!673603) (undefined!14354 lt!673603)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104856 (_ BitVec 32)) SeekEntryResult!13542)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!164551 (= lt!673603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2731 mask!4043) k!2731 a!3462 mask!4043))))

(assert (=> d!164551 (validMask!0 mask!4043)))

(assert (=> d!164551 (= (seekEntry!0 k!2731 a!3462 mask!4043) lt!673606)))

(declare-fun b!1571497 () Bool)

(declare-fun e!876223 () SeekEntryResult!13542)

(assert (=> b!1571497 (= e!876222 e!876223)))

(declare-fun lt!673604 () (_ BitVec 64))

(assert (=> b!1571497 (= lt!673604 (select (arr!50605 a!3462) (index!56568 lt!673603)))))

(declare-fun c!145146 () Bool)

(assert (=> b!1571497 (= c!145146 (= lt!673604 k!2731))))

(declare-fun b!1571498 () Bool)

(declare-fun c!145144 () Bool)

(assert (=> b!1571498 (= c!145144 (= lt!673604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876224 () SeekEntryResult!13542)

(assert (=> b!1571498 (= e!876223 e!876224)))

(declare-fun b!1571499 () Bool)

(assert (=> b!1571499 (= e!876224 (MissingZero!13542 (index!56568 lt!673603)))))

(declare-fun b!1571500 () Bool)

(assert (=> b!1571500 (= e!876223 (Found!13542 (index!56568 lt!673603)))))

(declare-fun b!1571501 () Bool)

(assert (=> b!1571501 (= e!876222 Undefined!13542)))

(declare-fun b!1571502 () Bool)

(declare-fun lt!673605 () SeekEntryResult!13542)

(assert (=> b!1571502 (= e!876224 (ite (is-MissingVacant!13542 lt!673605) (MissingZero!13542 (index!56569 lt!673605)) lt!673605))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104856 (_ BitVec 32)) SeekEntryResult!13542)

(assert (=> b!1571502 (= lt!673605 (seekKeyOrZeroReturnVacant!0 (x!141268 lt!673603) (index!56568 lt!673603) (index!56568 lt!673603) k!2731 a!3462 mask!4043))))

(assert (= (and d!164551 c!145145) b!1571501))

(assert (= (and d!164551 (not c!145145)) b!1571497))

(assert (= (and b!1571497 c!145146) b!1571500))

(assert (= (and b!1571497 (not c!145146)) b!1571498))

(assert (= (and b!1571498 c!145144) b!1571499))

(assert (= (and b!1571498 (not c!145144)) b!1571502))

(declare-fun m!1445433 () Bool)

(assert (=> d!164551 m!1445433))

(declare-fun m!1445435 () Bool)

(assert (=> d!164551 m!1445435))

(assert (=> d!164551 m!1445435))

(declare-fun m!1445437 () Bool)

(assert (=> d!164551 m!1445437))

(assert (=> d!164551 m!1445365))

(declare-fun m!1445439 () Bool)

(assert (=> b!1571497 m!1445439))

(declare-fun m!1445441 () Bool)

(assert (=> b!1571502 m!1445441))

(assert (=> b!1571396 d!164551))

(declare-fun b!1571569 () Bool)

(declare-fun e!876263 () SeekEntryResult!13542)

(declare-fun e!876261 () SeekEntryResult!13542)

(assert (=> b!1571569 (= e!876263 e!876261)))

(declare-fun lt!673650 () (_ BitVec 64))

(declare-fun lt!673651 () SeekEntryResult!13542)

(assert (=> b!1571569 (= lt!673650 (select (arr!50605 a!3462) (index!56568 lt!673651)))))

(declare-fun c!145177 () Bool)

(assert (=> b!1571569 (= c!145177 (= lt!673650 k!2731))))

(declare-fun b!1571570 () Bool)

(assert (=> b!1571570 (= e!876261 (Found!13542 (index!56568 lt!673651)))))

(declare-fun b!1571571 () Bool)

(assert (=> b!1571571 (= e!876263 Undefined!13542)))

(declare-fun e!876262 () SeekEntryResult!13542)

(declare-fun b!1571572 () Bool)

(assert (=> b!1571572 (= e!876262 (seekKeyOrZeroReturnVacant!0 (x!141268 lt!673651) (index!56568 lt!673651) (index!56568 lt!673651) k!2731 a!3462 mask!4043))))

(declare-fun d!164555 () Bool)

(declare-fun lt!673649 () SeekEntryResult!13542)

(assert (=> d!164555 (and (or (is-Undefined!13542 lt!673649) (not (is-Found!13542 lt!673649)) (and (bvsge (index!56567 lt!673649) #b00000000000000000000000000000000) (bvslt (index!56567 lt!673649) (size!51155 a!3462)))) (or (is-Undefined!13542 lt!673649) (is-Found!13542 lt!673649) (not (is-MissingZero!13542 lt!673649)) (and (bvsge (index!56566 lt!673649) #b00000000000000000000000000000000) (bvslt (index!56566 lt!673649) (size!51155 a!3462)))) (or (is-Undefined!13542 lt!673649) (is-Found!13542 lt!673649) (is-MissingZero!13542 lt!673649) (not (is-MissingVacant!13542 lt!673649)) (and (bvsge (index!56569 lt!673649) #b00000000000000000000000000000000) (bvslt (index!56569 lt!673649) (size!51155 a!3462)))) (or (is-Undefined!13542 lt!673649) (ite (is-Found!13542 lt!673649) (= (select (arr!50605 a!3462) (index!56567 lt!673649)) k!2731) (ite (is-MissingZero!13542 lt!673649) (= (select (arr!50605 a!3462) (index!56566 lt!673649)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13542 lt!673649) (= (select (arr!50605 a!3462) (index!56569 lt!673649)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!164555 (= lt!673649 e!876263)))

(declare-fun c!145178 () Bool)

(assert (=> d!164555 (= c!145178 (and (is-Intermediate!13542 lt!673651) (undefined!14354 lt!673651)))))

(assert (=> d!164555 (= lt!673651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2731 mask!4043) k!2731 a!3462 mask!4043))))

(assert (=> d!164555 (validMask!0 mask!4043)))

(assert (=> d!164555 (= (seekEntryOrOpen!0 k!2731 a!3462 mask!4043) lt!673649)))

(declare-fun b!1571573 () Bool)

(declare-fun c!145179 () Bool)

(assert (=> b!1571573 (= c!145179 (= lt!673650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1571573 (= e!876261 e!876262)))

(declare-fun b!1571574 () Bool)

(assert (=> b!1571574 (= e!876262 (MissingZero!13542 (index!56568 lt!673651)))))

(assert (= (and d!164555 c!145178) b!1571571))

(assert (= (and d!164555 (not c!145178)) b!1571569))

(assert (= (and b!1571569 c!145177) b!1571570))

(assert (= (and b!1571569 (not c!145177)) b!1571573))

(assert (= (and b!1571573 c!145179) b!1571574))

(assert (= (and b!1571573 (not c!145179)) b!1571572))

(declare-fun m!1445481 () Bool)

(assert (=> b!1571569 m!1445481))

(declare-fun m!1445483 () Bool)

(assert (=> b!1571572 m!1445483))

(declare-fun m!1445485 () Bool)

(assert (=> d!164555 m!1445485))

(assert (=> d!164555 m!1445365))

(assert (=> d!164555 m!1445435))

(assert (=> d!164555 m!1445435))

(assert (=> d!164555 m!1445437))

(declare-fun m!1445487 () Bool)

(assert (=> d!164555 m!1445487))

(declare-fun m!1445489 () Bool)

(assert (=> d!164555 m!1445489))

(assert (=> b!1571397 d!164555))

(push 1)

(assert (not bm!72362))

(assert (not b!1571502))

(assert (not b!1571572))

(assert (not d!164551))

(assert (not d!164555))

(assert (not b!1571442))

(assert (not b!1571441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

