; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27392 () Bool)

(assert start!27392)

(declare-fun b!283517 () Bool)

(declare-fun e!179881 () Bool)

(declare-fun e!179882 () Bool)

(assert (=> b!283517 (= e!179881 (not e!179882))))

(declare-fun res!146442 () Bool)

(assert (=> b!283517 (=> res!146442 e!179882)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14147 0))(
  ( (array!14148 (arr!6714 (Array (_ BitVec 32) (_ BitVec 64))) (size!7066 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14147)

(assert (=> b!283517 (= res!146442 (bvslt startIndex!26 (bvsub (size!7066 a!3325) #b00000000000000000000000000000001)))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14147 (_ BitVec 32)) Bool)

(assert (=> b!283517 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9028 0))(
  ( (Unit!9029) )
))
(declare-fun lt!140136 () Unit!9028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9028)

(assert (=> b!283517 (= lt!140136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!140137 () array!14147)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1872 0))(
  ( (MissingZero!1872 (index!9658 (_ BitVec 32))) (Found!1872 (index!9659 (_ BitVec 32))) (Intermediate!1872 (undefined!2684 Bool) (index!9660 (_ BitVec 32)) (x!27862 (_ BitVec 32))) (Undefined!1872) (MissingVacant!1872 (index!9661 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14147 (_ BitVec 32)) SeekEntryResult!1872)

(assert (=> b!283517 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) lt!140137 mask!3868))))

(declare-fun lt!140138 () Unit!9028)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9028)

(assert (=> b!283517 (= lt!140138 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4522 0))(
  ( (Nil!4519) (Cons!4518 (h!5188 (_ BitVec 64)) (t!9604 List!4522)) )
))
(declare-fun arrayNoDuplicates!0 (array!14147 (_ BitVec 32) List!4522) Bool)

(assert (=> b!283517 (arrayNoDuplicates!0 lt!140137 #b00000000000000000000000000000000 Nil!4519)))

(declare-fun lt!140140 () Unit!9028)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4522) Unit!9028)

(assert (=> b!283517 (= lt!140140 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4519))))

(declare-fun b!283518 () Bool)

(declare-fun res!146436 () Bool)

(declare-fun e!179879 () Bool)

(assert (=> b!283518 (=> (not res!146436) (not e!179879))))

(assert (=> b!283518 (= res!146436 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4519))))

(declare-fun res!146440 () Bool)

(assert (=> start!27392 (=> (not res!146440) (not e!179879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27392 (= res!146440 (validMask!0 mask!3868))))

(assert (=> start!27392 e!179879))

(declare-fun array_inv!4677 (array!14147) Bool)

(assert (=> start!27392 (array_inv!4677 a!3325)))

(assert (=> start!27392 true))

(declare-fun b!283519 () Bool)

(declare-fun res!146443 () Bool)

(assert (=> b!283519 (=> (not res!146443) (not e!179879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283519 (= res!146443 (validKeyInArray!0 k0!2581))))

(declare-fun b!283520 () Bool)

(declare-fun res!146437 () Bool)

(assert (=> b!283520 (=> (not res!146437) (not e!179879))))

(assert (=> b!283520 (= res!146437 (and (= (size!7066 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7066 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7066 a!3325))))))

(declare-fun b!283521 () Bool)

(declare-fun res!146439 () Bool)

(declare-fun e!179880 () Bool)

(assert (=> b!283521 (=> (not res!146439) (not e!179880))))

(assert (=> b!283521 (= res!146439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283522 () Bool)

(assert (=> b!283522 (= e!179882 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140137 mask!3868))))

(declare-fun b!283523 () Bool)

(assert (=> b!283523 (= e!179879 e!179880)))

(declare-fun res!146444 () Bool)

(assert (=> b!283523 (=> (not res!146444) (not e!179880))))

(declare-fun lt!140139 () SeekEntryResult!1872)

(assert (=> b!283523 (= res!146444 (or (= lt!140139 (MissingZero!1872 i!1267)) (= lt!140139 (MissingVacant!1872 i!1267))))))

(assert (=> b!283523 (= lt!140139 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!283524 () Bool)

(declare-fun res!146441 () Bool)

(assert (=> b!283524 (=> (not res!146441) (not e!179881))))

(assert (=> b!283524 (= res!146441 (validKeyInArray!0 (select (arr!6714 a!3325) startIndex!26)))))

(declare-fun b!283525 () Bool)

(declare-fun res!146445 () Bool)

(assert (=> b!283525 (=> (not res!146445) (not e!179879))))

(declare-fun arrayContainsKey!0 (array!14147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283525 (= res!146445 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283526 () Bool)

(assert (=> b!283526 (= e!179880 e!179881)))

(declare-fun res!146438 () Bool)

(assert (=> b!283526 (=> (not res!146438) (not e!179881))))

(assert (=> b!283526 (= res!146438 (not (= startIndex!26 i!1267)))))

(assert (=> b!283526 (= lt!140137 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)))))

(assert (= (and start!27392 res!146440) b!283520))

(assert (= (and b!283520 res!146437) b!283519))

(assert (= (and b!283519 res!146443) b!283518))

(assert (= (and b!283518 res!146436) b!283525))

(assert (= (and b!283525 res!146445) b!283523))

(assert (= (and b!283523 res!146444) b!283521))

(assert (= (and b!283521 res!146439) b!283526))

(assert (= (and b!283526 res!146438) b!283524))

(assert (= (and b!283524 res!146441) b!283517))

(assert (= (and b!283517 (not res!146442)) b!283522))

(declare-fun m!298427 () Bool)

(assert (=> b!283519 m!298427))

(declare-fun m!298429 () Bool)

(assert (=> b!283523 m!298429))

(declare-fun m!298431 () Bool)

(assert (=> b!283524 m!298431))

(assert (=> b!283524 m!298431))

(declare-fun m!298433 () Bool)

(assert (=> b!283524 m!298433))

(declare-fun m!298435 () Bool)

(assert (=> start!27392 m!298435))

(declare-fun m!298437 () Bool)

(assert (=> start!27392 m!298437))

(declare-fun m!298439 () Bool)

(assert (=> b!283517 m!298439))

(declare-fun m!298441 () Bool)

(assert (=> b!283517 m!298441))

(declare-fun m!298443 () Bool)

(assert (=> b!283517 m!298443))

(assert (=> b!283517 m!298441))

(declare-fun m!298445 () Bool)

(assert (=> b!283517 m!298445))

(declare-fun m!298447 () Bool)

(assert (=> b!283517 m!298447))

(assert (=> b!283517 m!298431))

(declare-fun m!298449 () Bool)

(assert (=> b!283517 m!298449))

(declare-fun m!298451 () Bool)

(assert (=> b!283517 m!298451))

(declare-fun m!298453 () Bool)

(assert (=> b!283517 m!298453))

(assert (=> b!283517 m!298431))

(declare-fun m!298455 () Bool)

(assert (=> b!283517 m!298455))

(declare-fun m!298457 () Bool)

(assert (=> b!283518 m!298457))

(declare-fun m!298459 () Bool)

(assert (=> b!283525 m!298459))

(declare-fun m!298461 () Bool)

(assert (=> b!283522 m!298461))

(assert (=> b!283526 m!298443))

(declare-fun m!298463 () Bool)

(assert (=> b!283521 m!298463))

(check-sat (not b!283524) (not b!283519) (not b!283522) (not b!283521) (not b!283525) (not b!283518) (not b!283517) (not b!283523) (not start!27392))
(check-sat)
(get-model)

(declare-fun call!25492 () Bool)

(declare-fun bm!25489 () Bool)

(assert (=> bm!25489 (= call!25492 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140137 mask!3868))))

(declare-fun d!65367 () Bool)

(declare-fun res!146481 () Bool)

(declare-fun e!179906 () Bool)

(assert (=> d!65367 (=> res!146481 e!179906)))

(assert (=> d!65367 (= res!146481 (bvsge startIndex!26 (size!7066 lt!140137)))))

(assert (=> d!65367 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140137 mask!3868) e!179906)))

(declare-fun b!283565 () Bool)

(declare-fun e!179904 () Bool)

(assert (=> b!283565 (= e!179906 e!179904)))

(declare-fun c!46095 () Bool)

(assert (=> b!283565 (= c!46095 (validKeyInArray!0 (select (arr!6714 lt!140137) startIndex!26)))))

(declare-fun b!283566 () Bool)

(declare-fun e!179905 () Bool)

(assert (=> b!283566 (= e!179904 e!179905)))

(declare-fun lt!140164 () (_ BitVec 64))

(assert (=> b!283566 (= lt!140164 (select (arr!6714 lt!140137) startIndex!26))))

(declare-fun lt!140162 () Unit!9028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14147 (_ BitVec 64) (_ BitVec 32)) Unit!9028)

(assert (=> b!283566 (= lt!140162 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140137 lt!140164 startIndex!26))))

(assert (=> b!283566 (arrayContainsKey!0 lt!140137 lt!140164 #b00000000000000000000000000000000)))

(declare-fun lt!140163 () Unit!9028)

(assert (=> b!283566 (= lt!140163 lt!140162)))

(declare-fun res!146480 () Bool)

(assert (=> b!283566 (= res!146480 (= (seekEntryOrOpen!0 (select (arr!6714 lt!140137) startIndex!26) lt!140137 mask!3868) (Found!1872 startIndex!26)))))

(assert (=> b!283566 (=> (not res!146480) (not e!179905))))

(declare-fun b!283567 () Bool)

(assert (=> b!283567 (= e!179905 call!25492)))

(declare-fun b!283568 () Bool)

(assert (=> b!283568 (= e!179904 call!25492)))

(assert (= (and d!65367 (not res!146481)) b!283565))

(assert (= (and b!283565 c!46095) b!283566))

(assert (= (and b!283565 (not c!46095)) b!283568))

(assert (= (and b!283566 res!146480) b!283567))

(assert (= (or b!283567 b!283568) bm!25489))

(declare-fun m!298503 () Bool)

(assert (=> bm!25489 m!298503))

(declare-fun m!298505 () Bool)

(assert (=> b!283565 m!298505))

(assert (=> b!283565 m!298505))

(declare-fun m!298507 () Bool)

(assert (=> b!283565 m!298507))

(assert (=> b!283566 m!298505))

(declare-fun m!298509 () Bool)

(assert (=> b!283566 m!298509))

(declare-fun m!298511 () Bool)

(assert (=> b!283566 m!298511))

(assert (=> b!283566 m!298505))

(declare-fun m!298513 () Bool)

(assert (=> b!283566 m!298513))

(assert (=> b!283522 d!65367))

(declare-fun d!65369 () Bool)

(assert (=> d!65369 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27392 d!65369))

(declare-fun d!65371 () Bool)

(assert (=> d!65371 (= (array_inv!4677 a!3325) (bvsge (size!7066 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27392 d!65371))

(declare-fun bm!25490 () Bool)

(declare-fun call!25493 () Bool)

(assert (=> bm!25490 (= call!25493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65373 () Bool)

(declare-fun res!146483 () Bool)

(declare-fun e!179909 () Bool)

(assert (=> d!65373 (=> res!146483 e!179909)))

(assert (=> d!65373 (= res!146483 (bvsge #b00000000000000000000000000000000 (size!7066 a!3325)))))

(assert (=> d!65373 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179909)))

(declare-fun b!283569 () Bool)

(declare-fun e!179907 () Bool)

(assert (=> b!283569 (= e!179909 e!179907)))

(declare-fun c!46096 () Bool)

(assert (=> b!283569 (= c!46096 (validKeyInArray!0 (select (arr!6714 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283570 () Bool)

(declare-fun e!179908 () Bool)

(assert (=> b!283570 (= e!179907 e!179908)))

(declare-fun lt!140167 () (_ BitVec 64))

(assert (=> b!283570 (= lt!140167 (select (arr!6714 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140165 () Unit!9028)

(assert (=> b!283570 (= lt!140165 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140167 #b00000000000000000000000000000000))))

(assert (=> b!283570 (arrayContainsKey!0 a!3325 lt!140167 #b00000000000000000000000000000000)))

(declare-fun lt!140166 () Unit!9028)

(assert (=> b!283570 (= lt!140166 lt!140165)))

(declare-fun res!146482 () Bool)

(assert (=> b!283570 (= res!146482 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1872 #b00000000000000000000000000000000)))))

(assert (=> b!283570 (=> (not res!146482) (not e!179908))))

(declare-fun b!283571 () Bool)

(assert (=> b!283571 (= e!179908 call!25493)))

(declare-fun b!283572 () Bool)

(assert (=> b!283572 (= e!179907 call!25493)))

(assert (= (and d!65373 (not res!146483)) b!283569))

(assert (= (and b!283569 c!46096) b!283570))

(assert (= (and b!283569 (not c!46096)) b!283572))

(assert (= (and b!283570 res!146482) b!283571))

(assert (= (or b!283571 b!283572) bm!25490))

(declare-fun m!298515 () Bool)

(assert (=> bm!25490 m!298515))

(declare-fun m!298517 () Bool)

(assert (=> b!283569 m!298517))

(assert (=> b!283569 m!298517))

(declare-fun m!298519 () Bool)

(assert (=> b!283569 m!298519))

(assert (=> b!283570 m!298517))

(declare-fun m!298521 () Bool)

(assert (=> b!283570 m!298521))

(declare-fun m!298523 () Bool)

(assert (=> b!283570 m!298523))

(assert (=> b!283570 m!298517))

(declare-fun m!298525 () Bool)

(assert (=> b!283570 m!298525))

(assert (=> b!283521 d!65373))

(declare-fun d!65375 () Bool)

(declare-fun res!146488 () Bool)

(declare-fun e!179914 () Bool)

(assert (=> d!65375 (=> res!146488 e!179914)))

(assert (=> d!65375 (= res!146488 (= (select (arr!6714 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65375 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!179914)))

(declare-fun b!283577 () Bool)

(declare-fun e!179915 () Bool)

(assert (=> b!283577 (= e!179914 e!179915)))

(declare-fun res!146489 () Bool)

(assert (=> b!283577 (=> (not res!146489) (not e!179915))))

(assert (=> b!283577 (= res!146489 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7066 a!3325)))))

(declare-fun b!283578 () Bool)

(assert (=> b!283578 (= e!179915 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65375 (not res!146488)) b!283577))

(assert (= (and b!283577 res!146489) b!283578))

(assert (=> d!65375 m!298517))

(declare-fun m!298527 () Bool)

(assert (=> b!283578 m!298527))

(assert (=> b!283525 d!65375))

(declare-fun d!65381 () Bool)

(assert (=> d!65381 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283519 d!65381))

(declare-fun d!65385 () Bool)

(assert (=> d!65385 (= (validKeyInArray!0 (select (arr!6714 a!3325) startIndex!26)) (and (not (= (select (arr!6714 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6714 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283524 d!65385))

(declare-fun b!283589 () Bool)

(declare-fun e!179925 () Bool)

(declare-fun call!25496 () Bool)

(assert (=> b!283589 (= e!179925 call!25496)))

(declare-fun b!283590 () Bool)

(declare-fun e!179926 () Bool)

(assert (=> b!283590 (= e!179926 e!179925)))

(declare-fun c!46099 () Bool)

(assert (=> b!283590 (= c!46099 (validKeyInArray!0 (select (arr!6714 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25493 () Bool)

(assert (=> bm!25493 (= call!25496 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46099 (Cons!4518 (select (arr!6714 a!3325) #b00000000000000000000000000000000) Nil!4519) Nil!4519)))))

(declare-fun b!283591 () Bool)

(declare-fun e!179924 () Bool)

(declare-fun contains!1993 (List!4522 (_ BitVec 64)) Bool)

(assert (=> b!283591 (= e!179924 (contains!1993 Nil!4519 (select (arr!6714 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283592 () Bool)

(assert (=> b!283592 (= e!179925 call!25496)))

(declare-fun b!283593 () Bool)

(declare-fun e!179927 () Bool)

(assert (=> b!283593 (= e!179927 e!179926)))

(declare-fun res!146496 () Bool)

(assert (=> b!283593 (=> (not res!146496) (not e!179926))))

(assert (=> b!283593 (= res!146496 (not e!179924))))

(declare-fun res!146498 () Bool)

(assert (=> b!283593 (=> (not res!146498) (not e!179924))))

(assert (=> b!283593 (= res!146498 (validKeyInArray!0 (select (arr!6714 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65387 () Bool)

(declare-fun res!146497 () Bool)

(assert (=> d!65387 (=> res!146497 e!179927)))

(assert (=> d!65387 (= res!146497 (bvsge #b00000000000000000000000000000000 (size!7066 a!3325)))))

(assert (=> d!65387 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4519) e!179927)))

(assert (= (and d!65387 (not res!146497)) b!283593))

(assert (= (and b!283593 res!146498) b!283591))

(assert (= (and b!283593 res!146496) b!283590))

(assert (= (and b!283590 c!46099) b!283592))

(assert (= (and b!283590 (not c!46099)) b!283589))

(assert (= (or b!283592 b!283589) bm!25493))

(assert (=> b!283590 m!298517))

(assert (=> b!283590 m!298517))

(assert (=> b!283590 m!298519))

(assert (=> bm!25493 m!298517))

(declare-fun m!298529 () Bool)

(assert (=> bm!25493 m!298529))

(assert (=> b!283591 m!298517))

(assert (=> b!283591 m!298517))

(declare-fun m!298531 () Bool)

(assert (=> b!283591 m!298531))

(assert (=> b!283593 m!298517))

(assert (=> b!283593 m!298517))

(assert (=> b!283593 m!298519))

(assert (=> b!283518 d!65387))

(declare-fun b!283647 () Bool)

(declare-fun c!46116 () Bool)

(declare-fun lt!140190 () (_ BitVec 64))

(assert (=> b!283647 (= c!46116 (= lt!140190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179968 () SeekEntryResult!1872)

(declare-fun e!179969 () SeekEntryResult!1872)

(assert (=> b!283647 (= e!179968 e!179969)))

(declare-fun b!283648 () Bool)

(declare-fun lt!140189 () SeekEntryResult!1872)

(assert (=> b!283648 (= e!179968 (Found!1872 (index!9660 lt!140189)))))

(declare-fun b!283649 () Bool)

(declare-fun e!179967 () SeekEntryResult!1872)

(assert (=> b!283649 (= e!179967 e!179968)))

(assert (=> b!283649 (= lt!140190 (select (arr!6714 a!3325) (index!9660 lt!140189)))))

(declare-fun c!46114 () Bool)

(assert (=> b!283649 (= c!46114 (= lt!140190 k0!2581))))

(declare-fun d!65389 () Bool)

(declare-fun lt!140191 () SeekEntryResult!1872)

(get-info :version)

(assert (=> d!65389 (and (or ((_ is Undefined!1872) lt!140191) (not ((_ is Found!1872) lt!140191)) (and (bvsge (index!9659 lt!140191) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140191) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140191) ((_ is Found!1872) lt!140191) (not ((_ is MissingZero!1872) lt!140191)) (and (bvsge (index!9658 lt!140191) #b00000000000000000000000000000000) (bvslt (index!9658 lt!140191) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140191) ((_ is Found!1872) lt!140191) ((_ is MissingZero!1872) lt!140191) (not ((_ is MissingVacant!1872) lt!140191)) (and (bvsge (index!9661 lt!140191) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140191) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140191) (ite ((_ is Found!1872) lt!140191) (= (select (arr!6714 a!3325) (index!9659 lt!140191)) k0!2581) (ite ((_ is MissingZero!1872) lt!140191) (= (select (arr!6714 a!3325) (index!9658 lt!140191)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1872) lt!140191) (= (select (arr!6714 a!3325) (index!9661 lt!140191)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65389 (= lt!140191 e!179967)))

(declare-fun c!46115 () Bool)

(assert (=> d!65389 (= c!46115 (and ((_ is Intermediate!1872) lt!140189) (undefined!2684 lt!140189)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14147 (_ BitVec 32)) SeekEntryResult!1872)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65389 (= lt!140189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65389 (validMask!0 mask!3868)))

(assert (=> d!65389 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140191)))

(declare-fun b!283650 () Bool)

(assert (=> b!283650 (= e!179967 Undefined!1872)))

(declare-fun b!283651 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14147 (_ BitVec 32)) SeekEntryResult!1872)

(assert (=> b!283651 (= e!179969 (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140189) (index!9660 lt!140189) (index!9660 lt!140189) k0!2581 a!3325 mask!3868))))

(declare-fun b!283652 () Bool)

(assert (=> b!283652 (= e!179969 (MissingZero!1872 (index!9660 lt!140189)))))

(assert (= (and d!65389 c!46115) b!283650))

(assert (= (and d!65389 (not c!46115)) b!283649))

(assert (= (and b!283649 c!46114) b!283648))

(assert (= (and b!283649 (not c!46114)) b!283647))

(assert (= (and b!283647 c!46116) b!283652))

(assert (= (and b!283647 (not c!46116)) b!283651))

(declare-fun m!298555 () Bool)

(assert (=> b!283649 m!298555))

(declare-fun m!298557 () Bool)

(assert (=> d!65389 m!298557))

(declare-fun m!298559 () Bool)

(assert (=> d!65389 m!298559))

(assert (=> d!65389 m!298435))

(declare-fun m!298561 () Bool)

(assert (=> d!65389 m!298561))

(assert (=> d!65389 m!298559))

(declare-fun m!298563 () Bool)

(assert (=> d!65389 m!298563))

(declare-fun m!298565 () Bool)

(assert (=> d!65389 m!298565))

(declare-fun m!298567 () Bool)

(assert (=> b!283651 m!298567))

(assert (=> b!283523 d!65389))

(declare-fun d!65409 () Bool)

(declare-fun e!179978 () Bool)

(assert (=> d!65409 e!179978))

(declare-fun res!146531 () Bool)

(assert (=> d!65409 (=> (not res!146531) (not e!179978))))

(assert (=> d!65409 (= res!146531 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7066 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7066 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7066 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7066 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7066 a!3325))))))

(declare-fun lt!140200 () Unit!9028)

(declare-fun choose!83 (array!14147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9028)

(assert (=> d!65409 (= lt!140200 (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> d!65409 (validMask!0 mask!3868)))

(assert (=> d!65409 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) lt!140200)))

(declare-fun b!283662 () Bool)

(assert (=> b!283662 (= e!179978 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) mask!3868)))))

(assert (= (and d!65409 res!146531) b!283662))

(declare-fun m!298581 () Bool)

(assert (=> d!65409 m!298581))

(assert (=> d!65409 m!298435))

(assert (=> b!283662 m!298431))

(assert (=> b!283662 m!298455))

(assert (=> b!283662 m!298443))

(assert (=> b!283662 m!298441))

(assert (=> b!283662 m!298441))

(declare-fun m!298583 () Bool)

(assert (=> b!283662 m!298583))

(assert (=> b!283662 m!298431))

(assert (=> b!283517 d!65409))

(declare-fun b!283663 () Bool)

(declare-fun c!46120 () Bool)

(declare-fun lt!140202 () (_ BitVec 64))

(assert (=> b!283663 (= c!46120 (= lt!140202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179980 () SeekEntryResult!1872)

(declare-fun e!179981 () SeekEntryResult!1872)

(assert (=> b!283663 (= e!179980 e!179981)))

(declare-fun b!283664 () Bool)

(declare-fun lt!140201 () SeekEntryResult!1872)

(assert (=> b!283664 (= e!179980 (Found!1872 (index!9660 lt!140201)))))

(declare-fun b!283665 () Bool)

(declare-fun e!179979 () SeekEntryResult!1872)

(assert (=> b!283665 (= e!179979 e!179980)))

(assert (=> b!283665 (= lt!140202 (select (arr!6714 a!3325) (index!9660 lt!140201)))))

(declare-fun c!46118 () Bool)

(assert (=> b!283665 (= c!46118 (= lt!140202 (select (arr!6714 a!3325) startIndex!26)))))

(declare-fun d!65415 () Bool)

(declare-fun lt!140203 () SeekEntryResult!1872)

(assert (=> d!65415 (and (or ((_ is Undefined!1872) lt!140203) (not ((_ is Found!1872) lt!140203)) (and (bvsge (index!9659 lt!140203) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140203) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140203) ((_ is Found!1872) lt!140203) (not ((_ is MissingZero!1872) lt!140203)) (and (bvsge (index!9658 lt!140203) #b00000000000000000000000000000000) (bvslt (index!9658 lt!140203) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140203) ((_ is Found!1872) lt!140203) ((_ is MissingZero!1872) lt!140203) (not ((_ is MissingVacant!1872) lt!140203)) (and (bvsge (index!9661 lt!140203) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140203) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140203) (ite ((_ is Found!1872) lt!140203) (= (select (arr!6714 a!3325) (index!9659 lt!140203)) (select (arr!6714 a!3325) startIndex!26)) (ite ((_ is MissingZero!1872) lt!140203) (= (select (arr!6714 a!3325) (index!9658 lt!140203)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1872) lt!140203) (= (select (arr!6714 a!3325) (index!9661 lt!140203)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65415 (= lt!140203 e!179979)))

(declare-fun c!46119 () Bool)

(assert (=> d!65415 (= c!46119 (and ((_ is Intermediate!1872) lt!140201) (undefined!2684 lt!140201)))))

(assert (=> d!65415 (= lt!140201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6714 a!3325) startIndex!26) mask!3868) (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (=> d!65415 (validMask!0 mask!3868)))

(assert (=> d!65415 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868) lt!140203)))

(declare-fun b!283666 () Bool)

(assert (=> b!283666 (= e!179979 Undefined!1872)))

(declare-fun b!283667 () Bool)

(assert (=> b!283667 (= e!179981 (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140201) (index!9660 lt!140201) (index!9660 lt!140201) (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283668 () Bool)

(assert (=> b!283668 (= e!179981 (MissingZero!1872 (index!9660 lt!140201)))))

(assert (= (and d!65415 c!46119) b!283666))

(assert (= (and d!65415 (not c!46119)) b!283665))

(assert (= (and b!283665 c!46118) b!283664))

(assert (= (and b!283665 (not c!46118)) b!283663))

(assert (= (and b!283663 c!46120) b!283668))

(assert (= (and b!283663 (not c!46120)) b!283667))

(declare-fun m!298585 () Bool)

(assert (=> b!283665 m!298585))

(declare-fun m!298587 () Bool)

(assert (=> d!65415 m!298587))

(assert (=> d!65415 m!298431))

(declare-fun m!298589 () Bool)

(assert (=> d!65415 m!298589))

(assert (=> d!65415 m!298435))

(declare-fun m!298591 () Bool)

(assert (=> d!65415 m!298591))

(assert (=> d!65415 m!298589))

(assert (=> d!65415 m!298431))

(declare-fun m!298593 () Bool)

(assert (=> d!65415 m!298593))

(declare-fun m!298595 () Bool)

(assert (=> d!65415 m!298595))

(assert (=> b!283667 m!298431))

(declare-fun m!298597 () Bool)

(assert (=> b!283667 m!298597))

(assert (=> b!283517 d!65415))

(declare-fun b!283669 () Bool)

(declare-fun e!179983 () Bool)

(declare-fun call!25506 () Bool)

(assert (=> b!283669 (= e!179983 call!25506)))

(declare-fun b!283670 () Bool)

(declare-fun e!179984 () Bool)

(assert (=> b!283670 (= e!179984 e!179983)))

(declare-fun c!46121 () Bool)

(assert (=> b!283670 (= c!46121 (validKeyInArray!0 (select (arr!6714 lt!140137) #b00000000000000000000000000000000)))))

(declare-fun bm!25503 () Bool)

(assert (=> bm!25503 (= call!25506 (arrayNoDuplicates!0 lt!140137 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46121 (Cons!4518 (select (arr!6714 lt!140137) #b00000000000000000000000000000000) Nil!4519) Nil!4519)))))

(declare-fun b!283671 () Bool)

(declare-fun e!179982 () Bool)

(assert (=> b!283671 (= e!179982 (contains!1993 Nil!4519 (select (arr!6714 lt!140137) #b00000000000000000000000000000000)))))

(declare-fun b!283672 () Bool)

(assert (=> b!283672 (= e!179983 call!25506)))

(declare-fun b!283673 () Bool)

(declare-fun e!179985 () Bool)

(assert (=> b!283673 (= e!179985 e!179984)))

(declare-fun res!146532 () Bool)

(assert (=> b!283673 (=> (not res!146532) (not e!179984))))

(assert (=> b!283673 (= res!146532 (not e!179982))))

(declare-fun res!146534 () Bool)

(assert (=> b!283673 (=> (not res!146534) (not e!179982))))

(assert (=> b!283673 (= res!146534 (validKeyInArray!0 (select (arr!6714 lt!140137) #b00000000000000000000000000000000)))))

(declare-fun d!65417 () Bool)

(declare-fun res!146533 () Bool)

(assert (=> d!65417 (=> res!146533 e!179985)))

(assert (=> d!65417 (= res!146533 (bvsge #b00000000000000000000000000000000 (size!7066 lt!140137)))))

(assert (=> d!65417 (= (arrayNoDuplicates!0 lt!140137 #b00000000000000000000000000000000 Nil!4519) e!179985)))

(assert (= (and d!65417 (not res!146533)) b!283673))

(assert (= (and b!283673 res!146534) b!283671))

(assert (= (and b!283673 res!146532) b!283670))

(assert (= (and b!283670 c!46121) b!283672))

(assert (= (and b!283670 (not c!46121)) b!283669))

(assert (= (or b!283672 b!283669) bm!25503))

(declare-fun m!298599 () Bool)

(assert (=> b!283670 m!298599))

(assert (=> b!283670 m!298599))

(declare-fun m!298601 () Bool)

(assert (=> b!283670 m!298601))

(assert (=> bm!25503 m!298599))

(declare-fun m!298603 () Bool)

(assert (=> bm!25503 m!298603))

(assert (=> b!283671 m!298599))

(assert (=> b!283671 m!298599))

(declare-fun m!298605 () Bool)

(assert (=> b!283671 m!298605))

(assert (=> b!283673 m!298599))

(assert (=> b!283673 m!298599))

(assert (=> b!283673 m!298601))

(assert (=> b!283517 d!65417))

(declare-fun b!283674 () Bool)

(declare-fun c!46124 () Bool)

(declare-fun lt!140205 () (_ BitVec 64))

(assert (=> b!283674 (= c!46124 (= lt!140205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179987 () SeekEntryResult!1872)

(declare-fun e!179988 () SeekEntryResult!1872)

(assert (=> b!283674 (= e!179987 e!179988)))

(declare-fun b!283675 () Bool)

(declare-fun lt!140204 () SeekEntryResult!1872)

(assert (=> b!283675 (= e!179987 (Found!1872 (index!9660 lt!140204)))))

(declare-fun b!283676 () Bool)

(declare-fun e!179986 () SeekEntryResult!1872)

(assert (=> b!283676 (= e!179986 e!179987)))

(assert (=> b!283676 (= lt!140205 (select (arr!6714 lt!140137) (index!9660 lt!140204)))))

(declare-fun c!46122 () Bool)

(assert (=> b!283676 (= c!46122 (= lt!140205 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun d!65419 () Bool)

(declare-fun lt!140206 () SeekEntryResult!1872)

(assert (=> d!65419 (and (or ((_ is Undefined!1872) lt!140206) (not ((_ is Found!1872) lt!140206)) (and (bvsge (index!9659 lt!140206) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140206) (size!7066 lt!140137)))) (or ((_ is Undefined!1872) lt!140206) ((_ is Found!1872) lt!140206) (not ((_ is MissingZero!1872) lt!140206)) (and (bvsge (index!9658 lt!140206) #b00000000000000000000000000000000) (bvslt (index!9658 lt!140206) (size!7066 lt!140137)))) (or ((_ is Undefined!1872) lt!140206) ((_ is Found!1872) lt!140206) ((_ is MissingZero!1872) lt!140206) (not ((_ is MissingVacant!1872) lt!140206)) (and (bvsge (index!9661 lt!140206) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140206) (size!7066 lt!140137)))) (or ((_ is Undefined!1872) lt!140206) (ite ((_ is Found!1872) lt!140206) (= (select (arr!6714 lt!140137) (index!9659 lt!140206)) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1872) lt!140206) (= (select (arr!6714 lt!140137) (index!9658 lt!140206)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1872) lt!140206) (= (select (arr!6714 lt!140137) (index!9661 lt!140206)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65419 (= lt!140206 e!179986)))

(declare-fun c!46123 () Bool)

(assert (=> d!65419 (= c!46123 (and ((_ is Intermediate!1872) lt!140204) (undefined!2684 lt!140204)))))

(assert (=> d!65419 (= lt!140204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) lt!140137 mask!3868))))

(assert (=> d!65419 (validMask!0 mask!3868)))

(assert (=> d!65419 (= (seekEntryOrOpen!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) lt!140137 mask!3868) lt!140206)))

(declare-fun b!283677 () Bool)

(assert (=> b!283677 (= e!179986 Undefined!1872)))

(declare-fun b!283678 () Bool)

(assert (=> b!283678 (= e!179988 (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140204) (index!9660 lt!140204) (index!9660 lt!140204) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) lt!140137 mask!3868))))

(declare-fun b!283679 () Bool)

(assert (=> b!283679 (= e!179988 (MissingZero!1872 (index!9660 lt!140204)))))

(assert (= (and d!65419 c!46123) b!283677))

(assert (= (and d!65419 (not c!46123)) b!283676))

(assert (= (and b!283676 c!46122) b!283675))

(assert (= (and b!283676 (not c!46122)) b!283674))

(assert (= (and b!283674 c!46124) b!283679))

(assert (= (and b!283674 (not c!46124)) b!283678))

(declare-fun m!298607 () Bool)

(assert (=> b!283676 m!298607))

(declare-fun m!298609 () Bool)

(assert (=> d!65419 m!298609))

(assert (=> d!65419 m!298441))

(declare-fun m!298611 () Bool)

(assert (=> d!65419 m!298611))

(assert (=> d!65419 m!298435))

(declare-fun m!298613 () Bool)

(assert (=> d!65419 m!298613))

(assert (=> d!65419 m!298611))

(assert (=> d!65419 m!298441))

(declare-fun m!298615 () Bool)

(assert (=> d!65419 m!298615))

(declare-fun m!298617 () Bool)

(assert (=> d!65419 m!298617))

(assert (=> b!283678 m!298441))

(declare-fun m!298619 () Bool)

(assert (=> b!283678 m!298619))

(assert (=> b!283517 d!65419))

(declare-fun d!65421 () Bool)

(declare-fun e!180003 () Bool)

(assert (=> d!65421 e!180003))

(declare-fun res!146537 () Bool)

(assert (=> d!65421 (=> (not res!146537) (not e!180003))))

(assert (=> d!65421 (= res!146537 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7066 a!3325))))))

(declare-fun lt!140221 () Unit!9028)

(declare-fun choose!41 (array!14147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4522) Unit!9028)

(assert (=> d!65421 (= lt!140221 (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4519))))

(assert (=> d!65421 (bvslt (size!7066 a!3325) #b01111111111111111111111111111111)))

(assert (=> d!65421 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4519) lt!140221)))

(declare-fun b!283706 () Bool)

(assert (=> b!283706 (= e!180003 (arrayNoDuplicates!0 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) #b00000000000000000000000000000000 Nil!4519))))

(assert (= (and d!65421 res!146537) b!283706))

(declare-fun m!298621 () Bool)

(assert (=> d!65421 m!298621))

(assert (=> b!283706 m!298443))

(declare-fun m!298623 () Bool)

(assert (=> b!283706 m!298623))

(assert (=> b!283517 d!65421))

(declare-fun d!65423 () Bool)

(assert (=> d!65423 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!140230 () Unit!9028)

(declare-fun choose!38 (array!14147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9028)

(assert (=> d!65423 (= lt!140230 (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> d!65423 (validMask!0 mask!3868)))

(assert (=> d!65423 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) lt!140230)))

(declare-fun bs!10071 () Bool)

(assert (= bs!10071 d!65423))

(assert (=> bs!10071 m!298447))

(declare-fun m!298653 () Bool)

(assert (=> bs!10071 m!298653))

(assert (=> bs!10071 m!298435))

(assert (=> b!283517 d!65423))

(declare-fun call!25507 () Bool)

(declare-fun bm!25504 () Bool)

(assert (=> bm!25504 (= call!25507 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65429 () Bool)

(declare-fun res!146539 () Bool)

(declare-fun e!180012 () Bool)

(assert (=> d!65429 (=> res!146539 e!180012)))

(assert (=> d!65429 (= res!146539 (bvsge startIndex!26 (size!7066 a!3325)))))

(assert (=> d!65429 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868) e!180012)))

(declare-fun b!283719 () Bool)

(declare-fun e!180010 () Bool)

(assert (=> b!283719 (= e!180012 e!180010)))

(declare-fun c!46143 () Bool)

(assert (=> b!283719 (= c!46143 (validKeyInArray!0 (select (arr!6714 a!3325) startIndex!26)))))

(declare-fun b!283720 () Bool)

(declare-fun e!180011 () Bool)

(assert (=> b!283720 (= e!180010 e!180011)))

(declare-fun lt!140233 () (_ BitVec 64))

(assert (=> b!283720 (= lt!140233 (select (arr!6714 a!3325) startIndex!26))))

(declare-fun lt!140231 () Unit!9028)

(assert (=> b!283720 (= lt!140231 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140233 startIndex!26))))

(assert (=> b!283720 (arrayContainsKey!0 a!3325 lt!140233 #b00000000000000000000000000000000)))

(declare-fun lt!140232 () Unit!9028)

(assert (=> b!283720 (= lt!140232 lt!140231)))

(declare-fun res!146538 () Bool)

(assert (=> b!283720 (= res!146538 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868) (Found!1872 startIndex!26)))))

(assert (=> b!283720 (=> (not res!146538) (not e!180011))))

(declare-fun b!283721 () Bool)

(assert (=> b!283721 (= e!180011 call!25507)))

(declare-fun b!283722 () Bool)

(assert (=> b!283722 (= e!180010 call!25507)))

(assert (= (and d!65429 (not res!146539)) b!283719))

(assert (= (and b!283719 c!46143) b!283720))

(assert (= (and b!283719 (not c!46143)) b!283722))

(assert (= (and b!283720 res!146538) b!283721))

(assert (= (or b!283721 b!283722) bm!25504))

(declare-fun m!298655 () Bool)

(assert (=> bm!25504 m!298655))

(assert (=> b!283719 m!298431))

(assert (=> b!283719 m!298431))

(assert (=> b!283719 m!298433))

(assert (=> b!283720 m!298431))

(declare-fun m!298657 () Bool)

(assert (=> b!283720 m!298657))

(declare-fun m!298659 () Bool)

(assert (=> b!283720 m!298659))

(assert (=> b!283720 m!298431))

(assert (=> b!283720 m!298455))

(assert (=> b!283517 d!65429))

(check-sat (not d!65409) (not bm!25490) (not d!65419) (not d!65389) (not b!283651) (not b!283590) (not b!283670) (not d!65423) (not d!65415) (not b!283673) (not b!283565) (not bm!25493) (not bm!25503) (not b!283662) (not d!65421) (not b!283591) (not b!283570) (not b!283671) (not b!283678) (not b!283706) (not b!283667) (not b!283569) (not b!283566) (not b!283720) (not bm!25489) (not b!283593) (not b!283578) (not bm!25504) (not b!283719))
(check-sat)
(get-model)

(declare-fun d!65463 () Bool)

(declare-fun lt!140275 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!191 (List!4522) (InoxSet (_ BitVec 64)))

(assert (=> d!65463 (= lt!140275 (select (content!191 Nil!4519) (select (arr!6714 a!3325) #b00000000000000000000000000000000)))))

(declare-fun e!180077 () Bool)

(assert (=> d!65463 (= lt!140275 e!180077)))

(declare-fun res!146583 () Bool)

(assert (=> d!65463 (=> (not res!146583) (not e!180077))))

(assert (=> d!65463 (= res!146583 ((_ is Cons!4518) Nil!4519))))

(assert (=> d!65463 (= (contains!1993 Nil!4519 (select (arr!6714 a!3325) #b00000000000000000000000000000000)) lt!140275)))

(declare-fun b!283807 () Bool)

(declare-fun e!180076 () Bool)

(assert (=> b!283807 (= e!180077 e!180076)))

(declare-fun res!146582 () Bool)

(assert (=> b!283807 (=> res!146582 e!180076)))

(assert (=> b!283807 (= res!146582 (= (h!5188 Nil!4519) (select (arr!6714 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283808 () Bool)

(assert (=> b!283808 (= e!180076 (contains!1993 (t!9604 Nil!4519) (select (arr!6714 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65463 res!146583) b!283807))

(assert (= (and b!283807 (not res!146582)) b!283808))

(declare-fun m!298791 () Bool)

(assert (=> d!65463 m!298791))

(assert (=> d!65463 m!298517))

(declare-fun m!298793 () Bool)

(assert (=> d!65463 m!298793))

(assert (=> b!283808 m!298517))

(declare-fun m!298795 () Bool)

(assert (=> b!283808 m!298795))

(assert (=> b!283591 d!65463))

(declare-fun d!65465 () Bool)

(assert (=> d!65465 (arrayContainsKey!0 a!3325 lt!140167 #b00000000000000000000000000000000)))

(declare-fun lt!140278 () Unit!9028)

(declare-fun choose!13 (array!14147 (_ BitVec 64) (_ BitVec 32)) Unit!9028)

(assert (=> d!65465 (= lt!140278 (choose!13 a!3325 lt!140167 #b00000000000000000000000000000000))))

(assert (=> d!65465 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!65465 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140167 #b00000000000000000000000000000000) lt!140278)))

(declare-fun bs!10074 () Bool)

(assert (= bs!10074 d!65465))

(assert (=> bs!10074 m!298523))

(declare-fun m!298797 () Bool)

(assert (=> bs!10074 m!298797))

(assert (=> b!283570 d!65465))

(declare-fun d!65469 () Bool)

(declare-fun res!146584 () Bool)

(declare-fun e!180078 () Bool)

(assert (=> d!65469 (=> res!146584 e!180078)))

(assert (=> d!65469 (= res!146584 (= (select (arr!6714 a!3325) #b00000000000000000000000000000000) lt!140167))))

(assert (=> d!65469 (= (arrayContainsKey!0 a!3325 lt!140167 #b00000000000000000000000000000000) e!180078)))

(declare-fun b!283809 () Bool)

(declare-fun e!180079 () Bool)

(assert (=> b!283809 (= e!180078 e!180079)))

(declare-fun res!146585 () Bool)

(assert (=> b!283809 (=> (not res!146585) (not e!180079))))

(assert (=> b!283809 (= res!146585 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7066 a!3325)))))

(declare-fun b!283810 () Bool)

(assert (=> b!283810 (= e!180079 (arrayContainsKey!0 a!3325 lt!140167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65469 (not res!146584)) b!283809))

(assert (= (and b!283809 res!146585) b!283810))

(assert (=> d!65469 m!298517))

(declare-fun m!298799 () Bool)

(assert (=> b!283810 m!298799))

(assert (=> b!283570 d!65469))

(declare-fun b!283811 () Bool)

(declare-fun c!46167 () Bool)

(declare-fun lt!140280 () (_ BitVec 64))

(assert (=> b!283811 (= c!46167 (= lt!140280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180081 () SeekEntryResult!1872)

(declare-fun e!180082 () SeekEntryResult!1872)

(assert (=> b!283811 (= e!180081 e!180082)))

(declare-fun b!283812 () Bool)

(declare-fun lt!140279 () SeekEntryResult!1872)

(assert (=> b!283812 (= e!180081 (Found!1872 (index!9660 lt!140279)))))

(declare-fun b!283813 () Bool)

(declare-fun e!180080 () SeekEntryResult!1872)

(assert (=> b!283813 (= e!180080 e!180081)))

(assert (=> b!283813 (= lt!140280 (select (arr!6714 a!3325) (index!9660 lt!140279)))))

(declare-fun c!46165 () Bool)

(assert (=> b!283813 (= c!46165 (= lt!140280 (select (arr!6714 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65471 () Bool)

(declare-fun lt!140281 () SeekEntryResult!1872)

(assert (=> d!65471 (and (or ((_ is Undefined!1872) lt!140281) (not ((_ is Found!1872) lt!140281)) (and (bvsge (index!9659 lt!140281) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140281) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140281) ((_ is Found!1872) lt!140281) (not ((_ is MissingZero!1872) lt!140281)) (and (bvsge (index!9658 lt!140281) #b00000000000000000000000000000000) (bvslt (index!9658 lt!140281) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140281) ((_ is Found!1872) lt!140281) ((_ is MissingZero!1872) lt!140281) (not ((_ is MissingVacant!1872) lt!140281)) (and (bvsge (index!9661 lt!140281) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140281) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140281) (ite ((_ is Found!1872) lt!140281) (= (select (arr!6714 a!3325) (index!9659 lt!140281)) (select (arr!6714 a!3325) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1872) lt!140281) (= (select (arr!6714 a!3325) (index!9658 lt!140281)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1872) lt!140281) (= (select (arr!6714 a!3325) (index!9661 lt!140281)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65471 (= lt!140281 e!180080)))

(declare-fun c!46166 () Bool)

(assert (=> d!65471 (= c!46166 (and ((_ is Intermediate!1872) lt!140279) (undefined!2684 lt!140279)))))

(assert (=> d!65471 (= lt!140279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6714 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6714 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!65471 (validMask!0 mask!3868)))

(assert (=> d!65471 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!140281)))

(declare-fun b!283814 () Bool)

(assert (=> b!283814 (= e!180080 Undefined!1872)))

(declare-fun b!283815 () Bool)

(assert (=> b!283815 (= e!180082 (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140279) (index!9660 lt!140279) (index!9660 lt!140279) (select (arr!6714 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(declare-fun b!283816 () Bool)

(assert (=> b!283816 (= e!180082 (MissingZero!1872 (index!9660 lt!140279)))))

(assert (= (and d!65471 c!46166) b!283814))

(assert (= (and d!65471 (not c!46166)) b!283813))

(assert (= (and b!283813 c!46165) b!283812))

(assert (= (and b!283813 (not c!46165)) b!283811))

(assert (= (and b!283811 c!46167) b!283816))

(assert (= (and b!283811 (not c!46167)) b!283815))

(declare-fun m!298801 () Bool)

(assert (=> b!283813 m!298801))

(declare-fun m!298803 () Bool)

(assert (=> d!65471 m!298803))

(assert (=> d!65471 m!298517))

(declare-fun m!298805 () Bool)

(assert (=> d!65471 m!298805))

(assert (=> d!65471 m!298435))

(declare-fun m!298807 () Bool)

(assert (=> d!65471 m!298807))

(assert (=> d!65471 m!298805))

(assert (=> d!65471 m!298517))

(declare-fun m!298809 () Bool)

(assert (=> d!65471 m!298809))

(declare-fun m!298811 () Bool)

(assert (=> d!65471 m!298811))

(assert (=> b!283815 m!298517))

(declare-fun m!298813 () Bool)

(assert (=> b!283815 m!298813))

(assert (=> b!283570 d!65471))

(declare-fun b!283847 () Bool)

(declare-fun e!180100 () SeekEntryResult!1872)

(declare-fun e!180099 () SeekEntryResult!1872)

(assert (=> b!283847 (= e!180100 e!180099)))

(declare-fun lt!140292 () (_ BitVec 64))

(declare-fun c!46184 () Bool)

(assert (=> b!283847 (= c!46184 (= lt!140292 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun d!65473 () Bool)

(declare-fun lt!140293 () SeekEntryResult!1872)

(assert (=> d!65473 (and (or ((_ is Undefined!1872) lt!140293) (not ((_ is Found!1872) lt!140293)) (and (bvsge (index!9659 lt!140293) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140293) (size!7066 lt!140137)))) (or ((_ is Undefined!1872) lt!140293) ((_ is Found!1872) lt!140293) (not ((_ is MissingVacant!1872) lt!140293)) (not (= (index!9661 lt!140293) (index!9660 lt!140204))) (and (bvsge (index!9661 lt!140293) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140293) (size!7066 lt!140137)))) (or ((_ is Undefined!1872) lt!140293) (ite ((_ is Found!1872) lt!140293) (= (select (arr!6714 lt!140137) (index!9659 lt!140293)) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26)) (and ((_ is MissingVacant!1872) lt!140293) (= (index!9661 lt!140293) (index!9660 lt!140204)) (= (select (arr!6714 lt!140137) (index!9661 lt!140293)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65473 (= lt!140293 e!180100)))

(declare-fun c!46183 () Bool)

(assert (=> d!65473 (= c!46183 (bvsge (x!27862 lt!140204) #b01111111111111111111111111111110))))

(assert (=> d!65473 (= lt!140292 (select (arr!6714 lt!140137) (index!9660 lt!140204)))))

(assert (=> d!65473 (validMask!0 mask!3868)))

(assert (=> d!65473 (= (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140204) (index!9660 lt!140204) (index!9660 lt!140204) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) lt!140137 mask!3868) lt!140293)))

(declare-fun b!283848 () Bool)

(assert (=> b!283848 (= e!180100 Undefined!1872)))

(declare-fun b!283849 () Bool)

(declare-fun c!46185 () Bool)

(assert (=> b!283849 (= c!46185 (= lt!140292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180098 () SeekEntryResult!1872)

(assert (=> b!283849 (= e!180099 e!180098)))

(declare-fun b!283850 () Bool)

(assert (=> b!283850 (= e!180098 (MissingVacant!1872 (index!9660 lt!140204)))))

(declare-fun b!283851 () Bool)

(assert (=> b!283851 (= e!180099 (Found!1872 (index!9660 lt!140204)))))

(declare-fun b!283852 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!283852 (= e!180098 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27862 lt!140204) #b00000000000000000000000000000001) (nextIndex!0 (index!9660 lt!140204) (x!27862 lt!140204) mask!3868) (index!9660 lt!140204) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) lt!140137 mask!3868))))

(assert (= (and d!65473 c!46183) b!283848))

(assert (= (and d!65473 (not c!46183)) b!283847))

(assert (= (and b!283847 c!46184) b!283851))

(assert (= (and b!283847 (not c!46184)) b!283849))

(assert (= (and b!283849 c!46185) b!283850))

(assert (= (and b!283849 (not c!46185)) b!283852))

(declare-fun m!298823 () Bool)

(assert (=> d!65473 m!298823))

(declare-fun m!298825 () Bool)

(assert (=> d!65473 m!298825))

(assert (=> d!65473 m!298607))

(assert (=> d!65473 m!298435))

(declare-fun m!298827 () Bool)

(assert (=> b!283852 m!298827))

(assert (=> b!283852 m!298827))

(assert (=> b!283852 m!298441))

(declare-fun m!298829 () Bool)

(assert (=> b!283852 m!298829))

(assert (=> b!283678 d!65473))

(declare-fun b!283857 () Bool)

(declare-fun e!180106 () Bool)

(declare-fun call!25517 () Bool)

(assert (=> b!283857 (= e!180106 call!25517)))

(declare-fun b!283858 () Bool)

(declare-fun e!180107 () Bool)

(assert (=> b!283858 (= e!180107 e!180106)))

(declare-fun c!46186 () Bool)

(assert (=> b!283858 (= c!46186 (validKeyInArray!0 (select (arr!6714 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25514 () Bool)

(assert (=> bm!25514 (= call!25517 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46186 (Cons!4518 (select (arr!6714 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46099 (Cons!4518 (select (arr!6714 a!3325) #b00000000000000000000000000000000) Nil!4519) Nil!4519)) (ite c!46099 (Cons!4518 (select (arr!6714 a!3325) #b00000000000000000000000000000000) Nil!4519) Nil!4519))))))

(declare-fun b!283859 () Bool)

(declare-fun e!180105 () Bool)

(assert (=> b!283859 (= e!180105 (contains!1993 (ite c!46099 (Cons!4518 (select (arr!6714 a!3325) #b00000000000000000000000000000000) Nil!4519) Nil!4519) (select (arr!6714 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283860 () Bool)

(assert (=> b!283860 (= e!180106 call!25517)))

(declare-fun b!283861 () Bool)

(declare-fun e!180108 () Bool)

(assert (=> b!283861 (= e!180108 e!180107)))

(declare-fun res!146590 () Bool)

(assert (=> b!283861 (=> (not res!146590) (not e!180107))))

(assert (=> b!283861 (= res!146590 (not e!180105))))

(declare-fun res!146592 () Bool)

(assert (=> b!283861 (=> (not res!146592) (not e!180105))))

(assert (=> b!283861 (= res!146592 (validKeyInArray!0 (select (arr!6714 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!65479 () Bool)

(declare-fun res!146591 () Bool)

(assert (=> d!65479 (=> res!146591 e!180108)))

(assert (=> d!65479 (= res!146591 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7066 a!3325)))))

(assert (=> d!65479 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46099 (Cons!4518 (select (arr!6714 a!3325) #b00000000000000000000000000000000) Nil!4519) Nil!4519)) e!180108)))

(assert (= (and d!65479 (not res!146591)) b!283861))

(assert (= (and b!283861 res!146592) b!283859))

(assert (= (and b!283861 res!146590) b!283858))

(assert (= (and b!283858 c!46186) b!283860))

(assert (= (and b!283858 (not c!46186)) b!283857))

(assert (= (or b!283860 b!283857) bm!25514))

(declare-fun m!298831 () Bool)

(assert (=> b!283858 m!298831))

(assert (=> b!283858 m!298831))

(declare-fun m!298833 () Bool)

(assert (=> b!283858 m!298833))

(assert (=> bm!25514 m!298831))

(declare-fun m!298835 () Bool)

(assert (=> bm!25514 m!298835))

(assert (=> b!283859 m!298831))

(assert (=> b!283859 m!298831))

(declare-fun m!298837 () Bool)

(assert (=> b!283859 m!298837))

(assert (=> b!283861 m!298831))

(assert (=> b!283861 m!298831))

(assert (=> b!283861 m!298833))

(assert (=> bm!25493 d!65479))

(declare-fun d!65481 () Bool)

(assert (=> d!65481 (= (validKeyInArray!0 (select (arr!6714 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6714 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6714 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283569 d!65481))

(declare-fun b!283864 () Bool)

(declare-fun e!180112 () Bool)

(declare-fun call!25518 () Bool)

(assert (=> b!283864 (= e!180112 call!25518)))

(declare-fun b!283865 () Bool)

(declare-fun e!180113 () Bool)

(assert (=> b!283865 (= e!180113 e!180112)))

(declare-fun c!46187 () Bool)

(assert (=> b!283865 (= c!46187 (validKeyInArray!0 (select (arr!6714 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun bm!25515 () Bool)

(assert (=> bm!25515 (= call!25518 (arrayNoDuplicates!0 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46187 (Cons!4518 (select (arr!6714 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325))) #b00000000000000000000000000000000) Nil!4519) Nil!4519)))))

(declare-fun e!180111 () Bool)

(declare-fun b!283866 () Bool)

(assert (=> b!283866 (= e!180111 (contains!1993 Nil!4519 (select (arr!6714 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun b!283867 () Bool)

(assert (=> b!283867 (= e!180112 call!25518)))

(declare-fun b!283868 () Bool)

(declare-fun e!180114 () Bool)

(assert (=> b!283868 (= e!180114 e!180113)))

(declare-fun res!146595 () Bool)

(assert (=> b!283868 (=> (not res!146595) (not e!180113))))

(assert (=> b!283868 (= res!146595 (not e!180111))))

(declare-fun res!146597 () Bool)

(assert (=> b!283868 (=> (not res!146597) (not e!180111))))

(assert (=> b!283868 (= res!146597 (validKeyInArray!0 (select (arr!6714 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun d!65485 () Bool)

(declare-fun res!146596 () Bool)

(assert (=> d!65485 (=> res!146596 e!180114)))

(assert (=> d!65485 (= res!146596 (bvsge #b00000000000000000000000000000000 (size!7066 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)))))))

(assert (=> d!65485 (= (arrayNoDuplicates!0 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) #b00000000000000000000000000000000 Nil!4519) e!180114)))

(assert (= (and d!65485 (not res!146596)) b!283868))

(assert (= (and b!283868 res!146597) b!283866))

(assert (= (and b!283868 res!146595) b!283865))

(assert (= (and b!283865 c!46187) b!283867))

(assert (= (and b!283865 (not c!46187)) b!283864))

(assert (= (or b!283867 b!283864) bm!25515))

(declare-fun m!298845 () Bool)

(assert (=> b!283865 m!298845))

(assert (=> b!283865 m!298845))

(declare-fun m!298847 () Bool)

(assert (=> b!283865 m!298847))

(assert (=> bm!25515 m!298845))

(declare-fun m!298849 () Bool)

(assert (=> bm!25515 m!298849))

(assert (=> b!283866 m!298845))

(assert (=> b!283866 m!298845))

(declare-fun m!298851 () Bool)

(assert (=> b!283866 m!298851))

(assert (=> b!283868 m!298845))

(assert (=> b!283868 m!298845))

(assert (=> b!283868 m!298847))

(assert (=> b!283706 d!65485))

(assert (=> b!283590 d!65481))

(declare-fun bm!25516 () Bool)

(declare-fun call!25519 () Bool)

(assert (=> bm!25516 (= call!25519 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65487 () Bool)

(declare-fun res!146599 () Bool)

(declare-fun e!180117 () Bool)

(assert (=> d!65487 (=> res!146599 e!180117)))

(assert (=> d!65487 (= res!146599 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7066 a!3325)))))

(assert (=> d!65487 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!180117)))

(declare-fun b!283869 () Bool)

(declare-fun e!180115 () Bool)

(assert (=> b!283869 (= e!180117 e!180115)))

(declare-fun c!46188 () Bool)

(assert (=> b!283869 (= c!46188 (validKeyInArray!0 (select (arr!6714 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283870 () Bool)

(declare-fun e!180116 () Bool)

(assert (=> b!283870 (= e!180115 e!180116)))

(declare-fun lt!140299 () (_ BitVec 64))

(assert (=> b!283870 (= lt!140299 (select (arr!6714 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140297 () Unit!9028)

(assert (=> b!283870 (= lt!140297 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140299 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!283870 (arrayContainsKey!0 a!3325 lt!140299 #b00000000000000000000000000000000)))

(declare-fun lt!140298 () Unit!9028)

(assert (=> b!283870 (= lt!140298 lt!140297)))

(declare-fun res!146598 () Bool)

(assert (=> b!283870 (= res!146598 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1872 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!283870 (=> (not res!146598) (not e!180116))))

(declare-fun b!283871 () Bool)

(assert (=> b!283871 (= e!180116 call!25519)))

(declare-fun b!283872 () Bool)

(assert (=> b!283872 (= e!180115 call!25519)))

(assert (= (and d!65487 (not res!146599)) b!283869))

(assert (= (and b!283869 c!46188) b!283870))

(assert (= (and b!283869 (not c!46188)) b!283872))

(assert (= (and b!283870 res!146598) b!283871))

(assert (= (or b!283871 b!283872) bm!25516))

(declare-fun m!298853 () Bool)

(assert (=> bm!25516 m!298853))

(assert (=> b!283869 m!298831))

(assert (=> b!283869 m!298831))

(assert (=> b!283869 m!298833))

(assert (=> b!283870 m!298831))

(declare-fun m!298855 () Bool)

(assert (=> b!283870 m!298855))

(declare-fun m!298857 () Bool)

(assert (=> b!283870 m!298857))

(assert (=> b!283870 m!298831))

(declare-fun m!298859 () Bool)

(assert (=> b!283870 m!298859))

(assert (=> bm!25490 d!65487))

(declare-fun d!65489 () Bool)

(assert (=> d!65489 (= (validKeyInArray!0 (select (arr!6714 lt!140137) startIndex!26)) (and (not (= (select (arr!6714 lt!140137) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6714 lt!140137) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283565 d!65489))

(assert (=> b!283593 d!65481))

(declare-fun bm!25517 () Bool)

(declare-fun call!25520 () Bool)

(assert (=> bm!25517 (= call!25520 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!140137 mask!3868))))

(declare-fun d!65491 () Bool)

(declare-fun res!146601 () Bool)

(declare-fun e!180120 () Bool)

(assert (=> d!65491 (=> res!146601 e!180120)))

(assert (=> d!65491 (= res!146601 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7066 lt!140137)))))

(assert (=> d!65491 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140137 mask!3868) e!180120)))

(declare-fun b!283873 () Bool)

(declare-fun e!180118 () Bool)

(assert (=> b!283873 (= e!180120 e!180118)))

(declare-fun c!46189 () Bool)

(assert (=> b!283873 (= c!46189 (validKeyInArray!0 (select (arr!6714 lt!140137) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun b!283874 () Bool)

(declare-fun e!180119 () Bool)

(assert (=> b!283874 (= e!180118 e!180119)))

(declare-fun lt!140302 () (_ BitVec 64))

(assert (=> b!283874 (= lt!140302 (select (arr!6714 lt!140137) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140300 () Unit!9028)

(assert (=> b!283874 (= lt!140300 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140137 lt!140302 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!283874 (arrayContainsKey!0 lt!140137 lt!140302 #b00000000000000000000000000000000)))

(declare-fun lt!140301 () Unit!9028)

(assert (=> b!283874 (= lt!140301 lt!140300)))

(declare-fun res!146600 () Bool)

(assert (=> b!283874 (= res!146600 (= (seekEntryOrOpen!0 (select (arr!6714 lt!140137) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!140137 mask!3868) (Found!1872 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!283874 (=> (not res!146600) (not e!180119))))

(declare-fun b!283875 () Bool)

(assert (=> b!283875 (= e!180119 call!25520)))

(declare-fun b!283876 () Bool)

(assert (=> b!283876 (= e!180118 call!25520)))

(assert (= (and d!65491 (not res!146601)) b!283873))

(assert (= (and b!283873 c!46189) b!283874))

(assert (= (and b!283873 (not c!46189)) b!283876))

(assert (= (and b!283874 res!146600) b!283875))

(assert (= (or b!283875 b!283876) bm!25517))

(declare-fun m!298861 () Bool)

(assert (=> bm!25517 m!298861))

(declare-fun m!298863 () Bool)

(assert (=> b!283873 m!298863))

(assert (=> b!283873 m!298863))

(declare-fun m!298865 () Bool)

(assert (=> b!283873 m!298865))

(assert (=> b!283874 m!298863))

(declare-fun m!298867 () Bool)

(assert (=> b!283874 m!298867))

(declare-fun m!298869 () Bool)

(assert (=> b!283874 m!298869))

(assert (=> b!283874 m!298863))

(declare-fun m!298871 () Bool)

(assert (=> b!283874 m!298871))

(assert (=> bm!25489 d!65491))

(declare-fun b!283877 () Bool)

(declare-fun e!180123 () SeekEntryResult!1872)

(declare-fun e!180122 () SeekEntryResult!1872)

(assert (=> b!283877 (= e!180123 e!180122)))

(declare-fun c!46191 () Bool)

(declare-fun lt!140303 () (_ BitVec 64))

(assert (=> b!283877 (= c!46191 (= lt!140303 k0!2581))))

(declare-fun lt!140304 () SeekEntryResult!1872)

(declare-fun d!65493 () Bool)

(assert (=> d!65493 (and (or ((_ is Undefined!1872) lt!140304) (not ((_ is Found!1872) lt!140304)) (and (bvsge (index!9659 lt!140304) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140304) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140304) ((_ is Found!1872) lt!140304) (not ((_ is MissingVacant!1872) lt!140304)) (not (= (index!9661 lt!140304) (index!9660 lt!140189))) (and (bvsge (index!9661 lt!140304) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140304) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140304) (ite ((_ is Found!1872) lt!140304) (= (select (arr!6714 a!3325) (index!9659 lt!140304)) k0!2581) (and ((_ is MissingVacant!1872) lt!140304) (= (index!9661 lt!140304) (index!9660 lt!140189)) (= (select (arr!6714 a!3325) (index!9661 lt!140304)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65493 (= lt!140304 e!180123)))

(declare-fun c!46190 () Bool)

(assert (=> d!65493 (= c!46190 (bvsge (x!27862 lt!140189) #b01111111111111111111111111111110))))

(assert (=> d!65493 (= lt!140303 (select (arr!6714 a!3325) (index!9660 lt!140189)))))

(assert (=> d!65493 (validMask!0 mask!3868)))

(assert (=> d!65493 (= (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140189) (index!9660 lt!140189) (index!9660 lt!140189) k0!2581 a!3325 mask!3868) lt!140304)))

(declare-fun b!283878 () Bool)

(assert (=> b!283878 (= e!180123 Undefined!1872)))

(declare-fun b!283879 () Bool)

(declare-fun c!46192 () Bool)

(assert (=> b!283879 (= c!46192 (= lt!140303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180121 () SeekEntryResult!1872)

(assert (=> b!283879 (= e!180122 e!180121)))

(declare-fun b!283880 () Bool)

(assert (=> b!283880 (= e!180121 (MissingVacant!1872 (index!9660 lt!140189)))))

(declare-fun b!283881 () Bool)

(assert (=> b!283881 (= e!180122 (Found!1872 (index!9660 lt!140189)))))

(declare-fun b!283882 () Bool)

(assert (=> b!283882 (= e!180121 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27862 lt!140189) #b00000000000000000000000000000001) (nextIndex!0 (index!9660 lt!140189) (x!27862 lt!140189) mask!3868) (index!9660 lt!140189) k0!2581 a!3325 mask!3868))))

(assert (= (and d!65493 c!46190) b!283878))

(assert (= (and d!65493 (not c!46190)) b!283877))

(assert (= (and b!283877 c!46191) b!283881))

(assert (= (and b!283877 (not c!46191)) b!283879))

(assert (= (and b!283879 c!46192) b!283880))

(assert (= (and b!283879 (not c!46192)) b!283882))

(declare-fun m!298873 () Bool)

(assert (=> d!65493 m!298873))

(declare-fun m!298875 () Bool)

(assert (=> d!65493 m!298875))

(assert (=> d!65493 m!298555))

(assert (=> d!65493 m!298435))

(declare-fun m!298877 () Bool)

(assert (=> b!283882 m!298877))

(assert (=> b!283882 m!298877))

(declare-fun m!298879 () Bool)

(assert (=> b!283882 m!298879))

(assert (=> b!283651 d!65493))

(declare-fun d!65495 () Bool)

(declare-fun lt!140305 () Bool)

(assert (=> d!65495 (= lt!140305 (select (content!191 Nil!4519) (select (arr!6714 lt!140137) #b00000000000000000000000000000000)))))

(declare-fun e!180125 () Bool)

(assert (=> d!65495 (= lt!140305 e!180125)))

(declare-fun res!146603 () Bool)

(assert (=> d!65495 (=> (not res!146603) (not e!180125))))

(assert (=> d!65495 (= res!146603 ((_ is Cons!4518) Nil!4519))))

(assert (=> d!65495 (= (contains!1993 Nil!4519 (select (arr!6714 lt!140137) #b00000000000000000000000000000000)) lt!140305)))

(declare-fun b!283883 () Bool)

(declare-fun e!180124 () Bool)

(assert (=> b!283883 (= e!180125 e!180124)))

(declare-fun res!146602 () Bool)

(assert (=> b!283883 (=> res!146602 e!180124)))

(assert (=> b!283883 (= res!146602 (= (h!5188 Nil!4519) (select (arr!6714 lt!140137) #b00000000000000000000000000000000)))))

(declare-fun b!283884 () Bool)

(assert (=> b!283884 (= e!180124 (contains!1993 (t!9604 Nil!4519) (select (arr!6714 lt!140137) #b00000000000000000000000000000000)))))

(assert (= (and d!65495 res!146603) b!283883))

(assert (= (and b!283883 (not res!146602)) b!283884))

(assert (=> d!65495 m!298791))

(assert (=> d!65495 m!298599))

(declare-fun m!298881 () Bool)

(assert (=> d!65495 m!298881))

(assert (=> b!283884 m!298599))

(declare-fun m!298883 () Bool)

(assert (=> b!283884 m!298883))

(assert (=> b!283671 d!65495))

(declare-fun d!65497 () Bool)

(assert (=> d!65497 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) mask!3868))))

(assert (=> d!65497 true))

(declare-fun _$51!18 () Unit!9028)

(assert (=> d!65497 (= (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) _$51!18)))

(declare-fun bs!10077 () Bool)

(assert (= bs!10077 d!65497))

(assert (=> bs!10077 m!298431))

(assert (=> bs!10077 m!298455))

(assert (=> bs!10077 m!298431))

(assert (=> bs!10077 m!298441))

(assert (=> bs!10077 m!298583))

(assert (=> bs!10077 m!298443))

(assert (=> bs!10077 m!298441))

(assert (=> d!65409 d!65497))

(assert (=> d!65409 d!65369))

(declare-fun d!65505 () Bool)

(assert (=> d!65505 (arrayNoDuplicates!0 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) #b00000000000000000000000000000000 Nil!4519)))

(assert (=> d!65505 true))

(declare-fun _$65!104 () Unit!9028)

(assert (=> d!65505 (= (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4519) _$65!104)))

(declare-fun bs!10078 () Bool)

(assert (= bs!10078 d!65505))

(assert (=> bs!10078 m!298443))

(assert (=> bs!10078 m!298623))

(assert (=> d!65421 d!65505))

(declare-fun b!283934 () Bool)

(declare-fun lt!140319 () SeekEntryResult!1872)

(assert (=> b!283934 (and (bvsge (index!9660 lt!140319) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140319) (size!7066 a!3325)))))

(declare-fun res!146623 () Bool)

(assert (=> b!283934 (= res!146623 (= (select (arr!6714 a!3325) (index!9660 lt!140319)) (select (arr!6714 a!3325) startIndex!26)))))

(declare-fun e!180154 () Bool)

(assert (=> b!283934 (=> res!146623 e!180154)))

(declare-fun e!180155 () Bool)

(assert (=> b!283934 (= e!180155 e!180154)))

(declare-fun b!283935 () Bool)

(declare-fun e!180157 () SeekEntryResult!1872)

(declare-fun e!180158 () SeekEntryResult!1872)

(assert (=> b!283935 (= e!180157 e!180158)))

(declare-fun c!46210 () Bool)

(declare-fun lt!140320 () (_ BitVec 64))

(assert (=> b!283935 (= c!46210 (or (= lt!140320 (select (arr!6714 a!3325) startIndex!26)) (= (bvadd lt!140320 lt!140320) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283936 () Bool)

(assert (=> b!283936 (and (bvsge (index!9660 lt!140319) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140319) (size!7066 a!3325)))))

(assert (=> b!283936 (= e!180154 (= (select (arr!6714 a!3325) (index!9660 lt!140319)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283937 () Bool)

(assert (=> b!283937 (= e!180158 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!6714 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000 mask!3868) (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283938 () Bool)

(declare-fun e!180156 () Bool)

(assert (=> b!283938 (= e!180156 (bvsge (x!27862 lt!140319) #b01111111111111111111111111111110))))

(declare-fun b!283939 () Bool)

(assert (=> b!283939 (= e!180157 (Intermediate!1872 true (toIndex!0 (select (arr!6714 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283940 () Bool)

(assert (=> b!283940 (= e!180158 (Intermediate!1872 false (toIndex!0 (select (arr!6714 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun d!65507 () Bool)

(assert (=> d!65507 e!180156))

(declare-fun c!46209 () Bool)

(assert (=> d!65507 (= c!46209 (and ((_ is Intermediate!1872) lt!140319) (undefined!2684 lt!140319)))))

(assert (=> d!65507 (= lt!140319 e!180157)))

(declare-fun c!46211 () Bool)

(assert (=> d!65507 (= c!46211 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!65507 (= lt!140320 (select (arr!6714 a!3325) (toIndex!0 (select (arr!6714 a!3325) startIndex!26) mask!3868)))))

(assert (=> d!65507 (validMask!0 mask!3868)))

(assert (=> d!65507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6714 a!3325) startIndex!26) mask!3868) (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868) lt!140319)))

(declare-fun b!283941 () Bool)

(assert (=> b!283941 (and (bvsge (index!9660 lt!140319) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140319) (size!7066 a!3325)))))

(declare-fun res!146624 () Bool)

(assert (=> b!283941 (= res!146624 (= (select (arr!6714 a!3325) (index!9660 lt!140319)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283941 (=> res!146624 e!180154)))

(declare-fun b!283942 () Bool)

(assert (=> b!283942 (= e!180156 e!180155)))

(declare-fun res!146622 () Bool)

(assert (=> b!283942 (= res!146622 (and ((_ is Intermediate!1872) lt!140319) (not (undefined!2684 lt!140319)) (bvslt (x!27862 lt!140319) #b01111111111111111111111111111110) (bvsge (x!27862 lt!140319) #b00000000000000000000000000000000) (bvsge (x!27862 lt!140319) #b00000000000000000000000000000000)))))

(assert (=> b!283942 (=> (not res!146622) (not e!180155))))

(assert (= (and d!65507 c!46211) b!283939))

(assert (= (and d!65507 (not c!46211)) b!283935))

(assert (= (and b!283935 c!46210) b!283940))

(assert (= (and b!283935 (not c!46210)) b!283937))

(assert (= (and d!65507 c!46209) b!283938))

(assert (= (and d!65507 (not c!46209)) b!283942))

(assert (= (and b!283942 res!146622) b!283934))

(assert (= (and b!283934 (not res!146623)) b!283941))

(assert (= (and b!283941 (not res!146624)) b!283936))

(assert (=> d!65507 m!298589))

(declare-fun m!298905 () Bool)

(assert (=> d!65507 m!298905))

(assert (=> d!65507 m!298435))

(declare-fun m!298907 () Bool)

(assert (=> b!283941 m!298907))

(assert (=> b!283934 m!298907))

(assert (=> b!283937 m!298589))

(declare-fun m!298909 () Bool)

(assert (=> b!283937 m!298909))

(assert (=> b!283937 m!298909))

(assert (=> b!283937 m!298431))

(declare-fun m!298911 () Bool)

(assert (=> b!283937 m!298911))

(assert (=> b!283936 m!298907))

(assert (=> d!65415 d!65507))

(declare-fun d!65511 () Bool)

(declare-fun lt!140334 () (_ BitVec 32))

(declare-fun lt!140333 () (_ BitVec 32))

(assert (=> d!65511 (= lt!140334 (bvmul (bvxor lt!140333 (bvlshr lt!140333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65511 (= lt!140333 ((_ extract 31 0) (bvand (bvxor (select (arr!6714 a!3325) startIndex!26) (bvlshr (select (arr!6714 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65511 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146625 (let ((h!5191 ((_ extract 31 0) (bvand (bvxor (select (arr!6714 a!3325) startIndex!26) (bvlshr (select (arr!6714 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27869 (bvmul (bvxor h!5191 (bvlshr h!5191 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27869 (bvlshr x!27869 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146625 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146625 #b00000000000000000000000000000000))))))

(assert (=> d!65511 (= (toIndex!0 (select (arr!6714 a!3325) startIndex!26) mask!3868) (bvand (bvxor lt!140334 (bvlshr lt!140334 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65415 d!65511))

(assert (=> d!65415 d!65369))

(declare-fun b!283948 () Bool)

(declare-fun e!180164 () Bool)

(declare-fun call!25523 () Bool)

(assert (=> b!283948 (= e!180164 call!25523)))

(declare-fun b!283950 () Bool)

(declare-fun e!180167 () Bool)

(assert (=> b!283950 (= e!180167 e!180164)))

(declare-fun c!46213 () Bool)

(assert (=> b!283950 (= c!46213 (validKeyInArray!0 (select (arr!6714 lt!140137) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25520 () Bool)

(assert (=> bm!25520 (= call!25523 (arrayNoDuplicates!0 lt!140137 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46213 (Cons!4518 (select (arr!6714 lt!140137) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46121 (Cons!4518 (select (arr!6714 lt!140137) #b00000000000000000000000000000000) Nil!4519) Nil!4519)) (ite c!46121 (Cons!4518 (select (arr!6714 lt!140137) #b00000000000000000000000000000000) Nil!4519) Nil!4519))))))

(declare-fun b!283952 () Bool)

(declare-fun e!180163 () Bool)

(assert (=> b!283952 (= e!180163 (contains!1993 (ite c!46121 (Cons!4518 (select (arr!6714 lt!140137) #b00000000000000000000000000000000) Nil!4519) Nil!4519) (select (arr!6714 lt!140137) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283953 () Bool)

(assert (=> b!283953 (= e!180164 call!25523)))

(declare-fun b!283954 () Bool)

(declare-fun e!180168 () Bool)

(assert (=> b!283954 (= e!180168 e!180167)))

(declare-fun res!146629 () Bool)

(assert (=> b!283954 (=> (not res!146629) (not e!180167))))

(assert (=> b!283954 (= res!146629 (not e!180163))))

(declare-fun res!146632 () Bool)

(assert (=> b!283954 (=> (not res!146632) (not e!180163))))

(assert (=> b!283954 (= res!146632 (validKeyInArray!0 (select (arr!6714 lt!140137) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!65517 () Bool)

(declare-fun res!146630 () Bool)

(assert (=> d!65517 (=> res!146630 e!180168)))

(assert (=> d!65517 (= res!146630 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7066 lt!140137)))))

(assert (=> d!65517 (= (arrayNoDuplicates!0 lt!140137 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46121 (Cons!4518 (select (arr!6714 lt!140137) #b00000000000000000000000000000000) Nil!4519) Nil!4519)) e!180168)))

(assert (= (and d!65517 (not res!146630)) b!283954))

(assert (= (and b!283954 res!146632) b!283952))

(assert (= (and b!283954 res!146629) b!283950))

(assert (= (and b!283950 c!46213) b!283953))

(assert (= (and b!283950 (not c!46213)) b!283948))

(assert (= (or b!283953 b!283948) bm!25520))

(declare-fun m!298925 () Bool)

(assert (=> b!283950 m!298925))

(assert (=> b!283950 m!298925))

(declare-fun m!298927 () Bool)

(assert (=> b!283950 m!298927))

(assert (=> bm!25520 m!298925))

(declare-fun m!298929 () Bool)

(assert (=> bm!25520 m!298929))

(assert (=> b!283952 m!298925))

(assert (=> b!283952 m!298925))

(declare-fun m!298931 () Bool)

(assert (=> b!283952 m!298931))

(assert (=> b!283954 m!298925))

(assert (=> b!283954 m!298925))

(assert (=> b!283954 m!298927))

(assert (=> bm!25503 d!65517))

(declare-fun d!65523 () Bool)

(assert (=> d!65523 (= (validKeyInArray!0 (select (arr!6714 lt!140137) #b00000000000000000000000000000000)) (and (not (= (select (arr!6714 lt!140137) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6714 lt!140137) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283670 d!65523))

(assert (=> b!283673 d!65523))

(assert (=> b!283662 d!65415))

(declare-fun b!283961 () Bool)

(declare-fun c!46219 () Bool)

(declare-fun lt!140339 () (_ BitVec 64))

(assert (=> b!283961 (= c!46219 (= lt!140339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180173 () SeekEntryResult!1872)

(declare-fun e!180174 () SeekEntryResult!1872)

(assert (=> b!283961 (= e!180173 e!180174)))

(declare-fun b!283962 () Bool)

(declare-fun lt!140338 () SeekEntryResult!1872)

(assert (=> b!283962 (= e!180173 (Found!1872 (index!9660 lt!140338)))))

(declare-fun b!283963 () Bool)

(declare-fun e!180172 () SeekEntryResult!1872)

(assert (=> b!283963 (= e!180172 e!180173)))

(assert (=> b!283963 (= lt!140339 (select (arr!6714 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325))) (index!9660 lt!140338)))))

(declare-fun c!46217 () Bool)

(assert (=> b!283963 (= c!46217 (= lt!140339 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun d!65525 () Bool)

(declare-fun lt!140340 () SeekEntryResult!1872)

(assert (=> d!65525 (and (or ((_ is Undefined!1872) lt!140340) (not ((_ is Found!1872) lt!140340)) (and (bvsge (index!9659 lt!140340) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140340) (size!7066 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)))))) (or ((_ is Undefined!1872) lt!140340) ((_ is Found!1872) lt!140340) (not ((_ is MissingZero!1872) lt!140340)) (and (bvsge (index!9658 lt!140340) #b00000000000000000000000000000000) (bvslt (index!9658 lt!140340) (size!7066 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)))))) (or ((_ is Undefined!1872) lt!140340) ((_ is Found!1872) lt!140340) ((_ is MissingZero!1872) lt!140340) (not ((_ is MissingVacant!1872) lt!140340)) (and (bvsge (index!9661 lt!140340) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140340) (size!7066 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)))))) (or ((_ is Undefined!1872) lt!140340) (ite ((_ is Found!1872) lt!140340) (= (select (arr!6714 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325))) (index!9659 lt!140340)) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1872) lt!140340) (= (select (arr!6714 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325))) (index!9658 lt!140340)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1872) lt!140340) (= (select (arr!6714 (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325))) (index!9661 lt!140340)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65525 (= lt!140340 e!180172)))

(declare-fun c!46218 () Bool)

(assert (=> d!65525 (= c!46218 (and ((_ is Intermediate!1872) lt!140338) (undefined!2684 lt!140338)))))

(assert (=> d!65525 (= lt!140338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) mask!3868))))

(assert (=> d!65525 (validMask!0 mask!3868)))

(assert (=> d!65525 (= (seekEntryOrOpen!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) mask!3868) lt!140340)))

(declare-fun b!283964 () Bool)

(assert (=> b!283964 (= e!180172 Undefined!1872)))

(declare-fun b!283965 () Bool)

(assert (=> b!283965 (= e!180174 (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140338) (index!9660 lt!140338) (index!9660 lt!140338) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) (array!14148 (store (arr!6714 a!3325) i!1267 k0!2581) (size!7066 a!3325)) mask!3868))))

(declare-fun b!283966 () Bool)

(assert (=> b!283966 (= e!180174 (MissingZero!1872 (index!9660 lt!140338)))))

(assert (= (and d!65525 c!46218) b!283964))

(assert (= (and d!65525 (not c!46218)) b!283963))

(assert (= (and b!283963 c!46217) b!283962))

(assert (= (and b!283963 (not c!46217)) b!283961))

(assert (= (and b!283961 c!46219) b!283966))

(assert (= (and b!283961 (not c!46219)) b!283965))

(declare-fun m!298945 () Bool)

(assert (=> b!283963 m!298945))

(declare-fun m!298951 () Bool)

(assert (=> d!65525 m!298951))

(assert (=> d!65525 m!298441))

(assert (=> d!65525 m!298611))

(assert (=> d!65525 m!298435))

(declare-fun m!298957 () Bool)

(assert (=> d!65525 m!298957))

(assert (=> d!65525 m!298611))

(assert (=> d!65525 m!298441))

(declare-fun m!298959 () Bool)

(assert (=> d!65525 m!298959))

(declare-fun m!298961 () Bool)

(assert (=> d!65525 m!298961))

(assert (=> b!283965 m!298441))

(declare-fun m!298963 () Bool)

(assert (=> b!283965 m!298963))

(assert (=> b!283662 d!65525))

(assert (=> d!65423 d!65429))

(declare-fun d!65533 () Bool)

(assert (=> d!65533 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(assert (=> d!65533 true))

(declare-fun _$72!98 () Unit!9028)

(assert (=> d!65533 (= (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) _$72!98)))

(declare-fun bs!10081 () Bool)

(assert (= bs!10081 d!65533))

(assert (=> bs!10081 m!298447))

(assert (=> d!65423 d!65533))

(assert (=> d!65423 d!65369))

(declare-fun d!65543 () Bool)

(assert (=> d!65543 (arrayContainsKey!0 lt!140137 lt!140164 #b00000000000000000000000000000000)))

(declare-fun lt!140352 () Unit!9028)

(assert (=> d!65543 (= lt!140352 (choose!13 lt!140137 lt!140164 startIndex!26))))

(assert (=> d!65543 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65543 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140137 lt!140164 startIndex!26) lt!140352)))

(declare-fun bs!10082 () Bool)

(assert (= bs!10082 d!65543))

(assert (=> bs!10082 m!298511))

(declare-fun m!298991 () Bool)

(assert (=> bs!10082 m!298991))

(assert (=> b!283566 d!65543))

(declare-fun d!65545 () Bool)

(declare-fun res!146641 () Bool)

(declare-fun e!180191 () Bool)

(assert (=> d!65545 (=> res!146641 e!180191)))

(assert (=> d!65545 (= res!146641 (= (select (arr!6714 lt!140137) #b00000000000000000000000000000000) lt!140164))))

(assert (=> d!65545 (= (arrayContainsKey!0 lt!140137 lt!140164 #b00000000000000000000000000000000) e!180191)))

(declare-fun b!283994 () Bool)

(declare-fun e!180192 () Bool)

(assert (=> b!283994 (= e!180191 e!180192)))

(declare-fun res!146642 () Bool)

(assert (=> b!283994 (=> (not res!146642) (not e!180192))))

(assert (=> b!283994 (= res!146642 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7066 lt!140137)))))

(declare-fun b!283995 () Bool)

(assert (=> b!283995 (= e!180192 (arrayContainsKey!0 lt!140137 lt!140164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65545 (not res!146641)) b!283994))

(assert (= (and b!283994 res!146642) b!283995))

(assert (=> d!65545 m!298599))

(declare-fun m!298999 () Bool)

(assert (=> b!283995 m!298999))

(assert (=> b!283566 d!65545))

(declare-fun b!283996 () Bool)

(declare-fun c!46232 () Bool)

(declare-fun lt!140354 () (_ BitVec 64))

(assert (=> b!283996 (= c!46232 (= lt!140354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180194 () SeekEntryResult!1872)

(declare-fun e!180195 () SeekEntryResult!1872)

(assert (=> b!283996 (= e!180194 e!180195)))

(declare-fun b!283997 () Bool)

(declare-fun lt!140353 () SeekEntryResult!1872)

(assert (=> b!283997 (= e!180194 (Found!1872 (index!9660 lt!140353)))))

(declare-fun b!283998 () Bool)

(declare-fun e!180193 () SeekEntryResult!1872)

(assert (=> b!283998 (= e!180193 e!180194)))

(assert (=> b!283998 (= lt!140354 (select (arr!6714 lt!140137) (index!9660 lt!140353)))))

(declare-fun c!46230 () Bool)

(assert (=> b!283998 (= c!46230 (= lt!140354 (select (arr!6714 lt!140137) startIndex!26)))))

(declare-fun d!65547 () Bool)

(declare-fun lt!140355 () SeekEntryResult!1872)

(assert (=> d!65547 (and (or ((_ is Undefined!1872) lt!140355) (not ((_ is Found!1872) lt!140355)) (and (bvsge (index!9659 lt!140355) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140355) (size!7066 lt!140137)))) (or ((_ is Undefined!1872) lt!140355) ((_ is Found!1872) lt!140355) (not ((_ is MissingZero!1872) lt!140355)) (and (bvsge (index!9658 lt!140355) #b00000000000000000000000000000000) (bvslt (index!9658 lt!140355) (size!7066 lt!140137)))) (or ((_ is Undefined!1872) lt!140355) ((_ is Found!1872) lt!140355) ((_ is MissingZero!1872) lt!140355) (not ((_ is MissingVacant!1872) lt!140355)) (and (bvsge (index!9661 lt!140355) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140355) (size!7066 lt!140137)))) (or ((_ is Undefined!1872) lt!140355) (ite ((_ is Found!1872) lt!140355) (= (select (arr!6714 lt!140137) (index!9659 lt!140355)) (select (arr!6714 lt!140137) startIndex!26)) (ite ((_ is MissingZero!1872) lt!140355) (= (select (arr!6714 lt!140137) (index!9658 lt!140355)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1872) lt!140355) (= (select (arr!6714 lt!140137) (index!9661 lt!140355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65547 (= lt!140355 e!180193)))

(declare-fun c!46231 () Bool)

(assert (=> d!65547 (= c!46231 (and ((_ is Intermediate!1872) lt!140353) (undefined!2684 lt!140353)))))

(assert (=> d!65547 (= lt!140353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6714 lt!140137) startIndex!26) mask!3868) (select (arr!6714 lt!140137) startIndex!26) lt!140137 mask!3868))))

(assert (=> d!65547 (validMask!0 mask!3868)))

(assert (=> d!65547 (= (seekEntryOrOpen!0 (select (arr!6714 lt!140137) startIndex!26) lt!140137 mask!3868) lt!140355)))

(declare-fun b!283999 () Bool)

(assert (=> b!283999 (= e!180193 Undefined!1872)))

(declare-fun b!284000 () Bool)

(assert (=> b!284000 (= e!180195 (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140353) (index!9660 lt!140353) (index!9660 lt!140353) (select (arr!6714 lt!140137) startIndex!26) lt!140137 mask!3868))))

(declare-fun b!284001 () Bool)

(assert (=> b!284001 (= e!180195 (MissingZero!1872 (index!9660 lt!140353)))))

(assert (= (and d!65547 c!46231) b!283999))

(assert (= (and d!65547 (not c!46231)) b!283998))

(assert (= (and b!283998 c!46230) b!283997))

(assert (= (and b!283998 (not c!46230)) b!283996))

(assert (= (and b!283996 c!46232) b!284001))

(assert (= (and b!283996 (not c!46232)) b!284000))

(declare-fun m!299003 () Bool)

(assert (=> b!283998 m!299003))

(declare-fun m!299005 () Bool)

(assert (=> d!65547 m!299005))

(assert (=> d!65547 m!298505))

(declare-fun m!299007 () Bool)

(assert (=> d!65547 m!299007))

(assert (=> d!65547 m!298435))

(declare-fun m!299009 () Bool)

(assert (=> d!65547 m!299009))

(assert (=> d!65547 m!299007))

(assert (=> d!65547 m!298505))

(declare-fun m!299011 () Bool)

(assert (=> d!65547 m!299011))

(declare-fun m!299013 () Bool)

(assert (=> d!65547 m!299013))

(assert (=> b!284000 m!298505))

(declare-fun m!299015 () Bool)

(assert (=> b!284000 m!299015))

(assert (=> b!283566 d!65547))

(declare-fun d!65553 () Bool)

(declare-fun res!146646 () Bool)

(declare-fun e!180201 () Bool)

(assert (=> d!65553 (=> res!146646 e!180201)))

(assert (=> d!65553 (= res!146646 (= (select (arr!6714 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2581))))

(assert (=> d!65553 (= (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!180201)))

(declare-fun b!284011 () Bool)

(declare-fun e!180202 () Bool)

(assert (=> b!284011 (= e!180201 e!180202)))

(declare-fun res!146647 () Bool)

(assert (=> b!284011 (=> (not res!146647) (not e!180202))))

(assert (=> b!284011 (= res!146647 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7066 a!3325)))))

(declare-fun b!284012 () Bool)

(assert (=> b!284012 (= e!180202 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!65553 (not res!146646)) b!284011))

(assert (= (and b!284011 res!146647) b!284012))

(assert (=> d!65553 m!298831))

(declare-fun m!299023 () Bool)

(assert (=> b!284012 m!299023))

(assert (=> b!283578 d!65553))

(declare-fun b!284013 () Bool)

(declare-fun lt!140360 () SeekEntryResult!1872)

(assert (=> b!284013 (and (bvsge (index!9660 lt!140360) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140360) (size!7066 a!3325)))))

(declare-fun res!146649 () Bool)

(assert (=> b!284013 (= res!146649 (= (select (arr!6714 a!3325) (index!9660 lt!140360)) k0!2581))))

(declare-fun e!180203 () Bool)

(assert (=> b!284013 (=> res!146649 e!180203)))

(declare-fun e!180204 () Bool)

(assert (=> b!284013 (= e!180204 e!180203)))

(declare-fun b!284014 () Bool)

(declare-fun e!180206 () SeekEntryResult!1872)

(declare-fun e!180207 () SeekEntryResult!1872)

(assert (=> b!284014 (= e!180206 e!180207)))

(declare-fun c!46237 () Bool)

(declare-fun lt!140361 () (_ BitVec 64))

(assert (=> b!284014 (= c!46237 (or (= lt!140361 k0!2581) (= (bvadd lt!140361 lt!140361) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!284015 () Bool)

(assert (=> b!284015 (and (bvsge (index!9660 lt!140360) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140360) (size!7066 a!3325)))))

(assert (=> b!284015 (= e!180203 (= (select (arr!6714 a!3325) (index!9660 lt!140360)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!284016 () Bool)

(assert (=> b!284016 (= e!180207 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k0!2581 a!3325 mask!3868))))

(declare-fun b!284017 () Bool)

(declare-fun e!180205 () Bool)

(assert (=> b!284017 (= e!180205 (bvsge (x!27862 lt!140360) #b01111111111111111111111111111110))))

(declare-fun b!284018 () Bool)

(assert (=> b!284018 (= e!180206 (Intermediate!1872 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!284019 () Bool)

(assert (=> b!284019 (= e!180207 (Intermediate!1872 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun d!65555 () Bool)

(assert (=> d!65555 e!180205))

(declare-fun c!46236 () Bool)

(assert (=> d!65555 (= c!46236 (and ((_ is Intermediate!1872) lt!140360) (undefined!2684 lt!140360)))))

(assert (=> d!65555 (= lt!140360 e!180206)))

(declare-fun c!46238 () Bool)

(assert (=> d!65555 (= c!46238 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!65555 (= lt!140361 (select (arr!6714 a!3325) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!65555 (validMask!0 mask!3868)))

(assert (=> d!65555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868) lt!140360)))

(declare-fun b!284020 () Bool)

(assert (=> b!284020 (and (bvsge (index!9660 lt!140360) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140360) (size!7066 a!3325)))))

(declare-fun res!146650 () Bool)

(assert (=> b!284020 (= res!146650 (= (select (arr!6714 a!3325) (index!9660 lt!140360)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284020 (=> res!146650 e!180203)))

(declare-fun b!284021 () Bool)

(assert (=> b!284021 (= e!180205 e!180204)))

(declare-fun res!146648 () Bool)

(assert (=> b!284021 (= res!146648 (and ((_ is Intermediate!1872) lt!140360) (not (undefined!2684 lt!140360)) (bvslt (x!27862 lt!140360) #b01111111111111111111111111111110) (bvsge (x!27862 lt!140360) #b00000000000000000000000000000000) (bvsge (x!27862 lt!140360) #b00000000000000000000000000000000)))))

(assert (=> b!284021 (=> (not res!146648) (not e!180204))))

(assert (= (and d!65555 c!46238) b!284018))

(assert (= (and d!65555 (not c!46238)) b!284014))

(assert (= (and b!284014 c!46237) b!284019))

(assert (= (and b!284014 (not c!46237)) b!284016))

(assert (= (and d!65555 c!46236) b!284017))

(assert (= (and d!65555 (not c!46236)) b!284021))

(assert (= (and b!284021 res!146648) b!284013))

(assert (= (and b!284013 (not res!146649)) b!284020))

(assert (= (and b!284020 (not res!146650)) b!284015))

(assert (=> d!65555 m!298559))

(declare-fun m!299027 () Bool)

(assert (=> d!65555 m!299027))

(assert (=> d!65555 m!298435))

(declare-fun m!299029 () Bool)

(assert (=> b!284020 m!299029))

(assert (=> b!284013 m!299029))

(assert (=> b!284016 m!298559))

(declare-fun m!299031 () Bool)

(assert (=> b!284016 m!299031))

(assert (=> b!284016 m!299031))

(declare-fun m!299033 () Bool)

(assert (=> b!284016 m!299033))

(assert (=> b!284015 m!299029))

(assert (=> d!65389 d!65555))

(declare-fun d!65561 () Bool)

(declare-fun lt!140368 () (_ BitVec 32))

(declare-fun lt!140367 () (_ BitVec 32))

(assert (=> d!65561 (= lt!140368 (bvmul (bvxor lt!140367 (bvlshr lt!140367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65561 (= lt!140367 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65561 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146625 (let ((h!5191 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27869 (bvmul (bvxor h!5191 (bvlshr h!5191 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27869 (bvlshr x!27869 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146625 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146625 #b00000000000000000000000000000000))))))

(assert (=> d!65561 (= (toIndex!0 k0!2581 mask!3868) (bvand (bvxor lt!140368 (bvlshr lt!140368 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65389 d!65561))

(assert (=> d!65389 d!65369))

(declare-fun d!65563 () Bool)

(assert (=> d!65563 (arrayContainsKey!0 a!3325 lt!140233 #b00000000000000000000000000000000)))

(declare-fun lt!140369 () Unit!9028)

(assert (=> d!65563 (= lt!140369 (choose!13 a!3325 lt!140233 startIndex!26))))

(assert (=> d!65563 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65563 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140233 startIndex!26) lt!140369)))

(declare-fun bs!10083 () Bool)

(assert (= bs!10083 d!65563))

(assert (=> bs!10083 m!298659))

(declare-fun m!299047 () Bool)

(assert (=> bs!10083 m!299047))

(assert (=> b!283720 d!65563))

(declare-fun d!65567 () Bool)

(declare-fun res!146651 () Bool)

(declare-fun e!180211 () Bool)

(assert (=> d!65567 (=> res!146651 e!180211)))

(assert (=> d!65567 (= res!146651 (= (select (arr!6714 a!3325) #b00000000000000000000000000000000) lt!140233))))

(assert (=> d!65567 (= (arrayContainsKey!0 a!3325 lt!140233 #b00000000000000000000000000000000) e!180211)))

(declare-fun b!284028 () Bool)

(declare-fun e!180212 () Bool)

(assert (=> b!284028 (= e!180211 e!180212)))

(declare-fun res!146652 () Bool)

(assert (=> b!284028 (=> (not res!146652) (not e!180212))))

(assert (=> b!284028 (= res!146652 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7066 a!3325)))))

(declare-fun b!284029 () Bool)

(assert (=> b!284029 (= e!180212 (arrayContainsKey!0 a!3325 lt!140233 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65567 (not res!146651)) b!284028))

(assert (= (and b!284028 res!146652) b!284029))

(assert (=> d!65567 m!298517))

(declare-fun m!299049 () Bool)

(assert (=> b!284029 m!299049))

(assert (=> b!283720 d!65567))

(assert (=> b!283720 d!65415))

(assert (=> b!283719 d!65385))

(declare-fun b!284032 () Bool)

(declare-fun e!180217 () SeekEntryResult!1872)

(declare-fun e!180216 () SeekEntryResult!1872)

(assert (=> b!284032 (= e!180217 e!180216)))

(declare-fun lt!140370 () (_ BitVec 64))

(declare-fun c!46243 () Bool)

(assert (=> b!284032 (= c!46243 (= lt!140370 (select (arr!6714 a!3325) startIndex!26)))))

(declare-fun lt!140371 () SeekEntryResult!1872)

(declare-fun d!65569 () Bool)

(assert (=> d!65569 (and (or ((_ is Undefined!1872) lt!140371) (not ((_ is Found!1872) lt!140371)) (and (bvsge (index!9659 lt!140371) #b00000000000000000000000000000000) (bvslt (index!9659 lt!140371) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140371) ((_ is Found!1872) lt!140371) (not ((_ is MissingVacant!1872) lt!140371)) (not (= (index!9661 lt!140371) (index!9660 lt!140201))) (and (bvsge (index!9661 lt!140371) #b00000000000000000000000000000000) (bvslt (index!9661 lt!140371) (size!7066 a!3325)))) (or ((_ is Undefined!1872) lt!140371) (ite ((_ is Found!1872) lt!140371) (= (select (arr!6714 a!3325) (index!9659 lt!140371)) (select (arr!6714 a!3325) startIndex!26)) (and ((_ is MissingVacant!1872) lt!140371) (= (index!9661 lt!140371) (index!9660 lt!140201)) (= (select (arr!6714 a!3325) (index!9661 lt!140371)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65569 (= lt!140371 e!180217)))

(declare-fun c!46242 () Bool)

(assert (=> d!65569 (= c!46242 (bvsge (x!27862 lt!140201) #b01111111111111111111111111111110))))

(assert (=> d!65569 (= lt!140370 (select (arr!6714 a!3325) (index!9660 lt!140201)))))

(assert (=> d!65569 (validMask!0 mask!3868)))

(assert (=> d!65569 (= (seekKeyOrZeroReturnVacant!0 (x!27862 lt!140201) (index!9660 lt!140201) (index!9660 lt!140201) (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868) lt!140371)))

(declare-fun b!284033 () Bool)

(assert (=> b!284033 (= e!180217 Undefined!1872)))

(declare-fun b!284034 () Bool)

(declare-fun c!46244 () Bool)

(assert (=> b!284034 (= c!46244 (= lt!140370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180215 () SeekEntryResult!1872)

(assert (=> b!284034 (= e!180216 e!180215)))

(declare-fun b!284035 () Bool)

(assert (=> b!284035 (= e!180215 (MissingVacant!1872 (index!9660 lt!140201)))))

(declare-fun b!284036 () Bool)

(assert (=> b!284036 (= e!180216 (Found!1872 (index!9660 lt!140201)))))

(declare-fun b!284037 () Bool)

(assert (=> b!284037 (= e!180215 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27862 lt!140201) #b00000000000000000000000000000001) (nextIndex!0 (index!9660 lt!140201) (x!27862 lt!140201) mask!3868) (index!9660 lt!140201) (select (arr!6714 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (= (and d!65569 c!46242) b!284033))

(assert (= (and d!65569 (not c!46242)) b!284032))

(assert (= (and b!284032 c!46243) b!284036))

(assert (= (and b!284032 (not c!46243)) b!284034))

(assert (= (and b!284034 c!46244) b!284035))

(assert (= (and b!284034 (not c!46244)) b!284037))

(declare-fun m!299059 () Bool)

(assert (=> d!65569 m!299059))

(declare-fun m!299063 () Bool)

(assert (=> d!65569 m!299063))

(assert (=> d!65569 m!298585))

(assert (=> d!65569 m!298435))

(declare-fun m!299069 () Bool)

(assert (=> b!284037 m!299069))

(assert (=> b!284037 m!299069))

(assert (=> b!284037 m!298431))

(declare-fun m!299071 () Bool)

(assert (=> b!284037 m!299071))

(assert (=> b!283667 d!65569))

(declare-fun b!284044 () Bool)

(declare-fun lt!140376 () SeekEntryResult!1872)

(assert (=> b!284044 (and (bvsge (index!9660 lt!140376) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140376) (size!7066 lt!140137)))))

(declare-fun res!146660 () Bool)

(assert (=> b!284044 (= res!146660 (= (select (arr!6714 lt!140137) (index!9660 lt!140376)) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun e!180223 () Bool)

(assert (=> b!284044 (=> res!146660 e!180223)))

(declare-fun e!180224 () Bool)

(assert (=> b!284044 (= e!180224 e!180223)))

(declare-fun b!284045 () Bool)

(declare-fun e!180226 () SeekEntryResult!1872)

(declare-fun e!180227 () SeekEntryResult!1872)

(assert (=> b!284045 (= e!180226 e!180227)))

(declare-fun lt!140377 () (_ BitVec 64))

(declare-fun c!46247 () Bool)

(assert (=> b!284045 (= c!46247 (or (= lt!140377 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26)) (= (bvadd lt!140377 lt!140377) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!284046 () Bool)

(assert (=> b!284046 (and (bvsge (index!9660 lt!140376) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140376) (size!7066 lt!140137)))))

(assert (=> b!284046 (= e!180223 (= (select (arr!6714 lt!140137) (index!9660 lt!140376)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!284047 () Bool)

(assert (=> b!284047 (= e!180227 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000 mask!3868) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) lt!140137 mask!3868))))

(declare-fun b!284048 () Bool)

(declare-fun e!180225 () Bool)

(assert (=> b!284048 (= e!180225 (bvsge (x!27862 lt!140376) #b01111111111111111111111111111110))))

(declare-fun b!284049 () Bool)

(assert (=> b!284049 (= e!180226 (Intermediate!1872 true (toIndex!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!284050 () Bool)

(assert (=> b!284050 (= e!180227 (Intermediate!1872 false (toIndex!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun d!65575 () Bool)

(assert (=> d!65575 e!180225))

(declare-fun c!46246 () Bool)

(assert (=> d!65575 (= c!46246 (and ((_ is Intermediate!1872) lt!140376) (undefined!2684 lt!140376)))))

(assert (=> d!65575 (= lt!140376 e!180226)))

(declare-fun c!46248 () Bool)

(assert (=> d!65575 (= c!46248 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!65575 (= lt!140377 (select (arr!6714 lt!140137) (toIndex!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) mask!3868)))))

(assert (=> d!65575 (validMask!0 mask!3868)))

(assert (=> d!65575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) lt!140137 mask!3868) lt!140376)))

(declare-fun b!284051 () Bool)

(assert (=> b!284051 (and (bvsge (index!9660 lt!140376) #b00000000000000000000000000000000) (bvslt (index!9660 lt!140376) (size!7066 lt!140137)))))

(declare-fun res!146661 () Bool)

(assert (=> b!284051 (= res!146661 (= (select (arr!6714 lt!140137) (index!9660 lt!140376)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284051 (=> res!146661 e!180223)))

(declare-fun b!284052 () Bool)

(assert (=> b!284052 (= e!180225 e!180224)))

(declare-fun res!146659 () Bool)

(assert (=> b!284052 (= res!146659 (and ((_ is Intermediate!1872) lt!140376) (not (undefined!2684 lt!140376)) (bvslt (x!27862 lt!140376) #b01111111111111111111111111111110) (bvsge (x!27862 lt!140376) #b00000000000000000000000000000000) (bvsge (x!27862 lt!140376) #b00000000000000000000000000000000)))))

(assert (=> b!284052 (=> (not res!146659) (not e!180224))))

(assert (= (and d!65575 c!46248) b!284049))

(assert (= (and d!65575 (not c!46248)) b!284045))

(assert (= (and b!284045 c!46247) b!284050))

(assert (= (and b!284045 (not c!46247)) b!284047))

(assert (= (and d!65575 c!46246) b!284048))

(assert (= (and d!65575 (not c!46246)) b!284052))

(assert (= (and b!284052 res!146659) b!284044))

(assert (= (and b!284044 (not res!146660)) b!284051))

(assert (= (and b!284051 (not res!146661)) b!284046))

(assert (=> d!65575 m!298611))

(declare-fun m!299077 () Bool)

(assert (=> d!65575 m!299077))

(assert (=> d!65575 m!298435))

(declare-fun m!299079 () Bool)

(assert (=> b!284051 m!299079))

(assert (=> b!284044 m!299079))

(assert (=> b!284047 m!298611))

(declare-fun m!299081 () Bool)

(assert (=> b!284047 m!299081))

(assert (=> b!284047 m!299081))

(assert (=> b!284047 m!298441))

(declare-fun m!299085 () Bool)

(assert (=> b!284047 m!299085))

(assert (=> b!284046 m!299079))

(assert (=> d!65419 d!65575))

(declare-fun d!65579 () Bool)

(declare-fun lt!140379 () (_ BitVec 32))

(declare-fun lt!140378 () (_ BitVec 32))

(assert (=> d!65579 (= lt!140379 (bvmul (bvxor lt!140378 (bvlshr lt!140378 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65579 (= lt!140378 ((_ extract 31 0) (bvand (bvxor (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) (bvlshr (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65579 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146625 (let ((h!5191 ((_ extract 31 0) (bvand (bvxor (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) (bvlshr (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27869 (bvmul (bvxor h!5191 (bvlshr h!5191 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27869 (bvlshr x!27869 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146625 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146625 #b00000000000000000000000000000000))))))

(assert (=> d!65579 (= (toIndex!0 (select (store (arr!6714 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (bvand (bvxor lt!140379 (bvlshr lt!140379 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65419 d!65579))

(assert (=> d!65419 d!65369))

(declare-fun call!25527 () Bool)

(declare-fun bm!25524 () Bool)

(assert (=> bm!25524 (= call!25527 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65583 () Bool)

(declare-fun res!146666 () Bool)

(declare-fun e!180234 () Bool)

(assert (=> d!65583 (=> res!146666 e!180234)))

(assert (=> d!65583 (= res!146666 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7066 a!3325)))))

(assert (=> d!65583 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868) e!180234)))

(declare-fun b!284058 () Bool)

(declare-fun e!180232 () Bool)

(assert (=> b!284058 (= e!180234 e!180232)))

(declare-fun c!46250 () Bool)

(assert (=> b!284058 (= c!46250 (validKeyInArray!0 (select (arr!6714 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun b!284059 () Bool)

(declare-fun e!180233 () Bool)

(assert (=> b!284059 (= e!180232 e!180233)))

(declare-fun lt!140383 () (_ BitVec 64))

(assert (=> b!284059 (= lt!140383 (select (arr!6714 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140380 () Unit!9028)

(assert (=> b!284059 (= lt!140380 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140383 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!284059 (arrayContainsKey!0 a!3325 lt!140383 #b00000000000000000000000000000000)))

(declare-fun lt!140381 () Unit!9028)

(assert (=> b!284059 (= lt!140381 lt!140380)))

(declare-fun res!146665 () Bool)

(assert (=> b!284059 (= res!146665 (= (seekEntryOrOpen!0 (select (arr!6714 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1872 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!284059 (=> (not res!146665) (not e!180233))))

(declare-fun b!284060 () Bool)

(assert (=> b!284060 (= e!180233 call!25527)))

(declare-fun b!284061 () Bool)

(assert (=> b!284061 (= e!180232 call!25527)))

(assert (= (and d!65583 (not res!146666)) b!284058))

(assert (= (and b!284058 c!46250) b!284059))

(assert (= (and b!284058 (not c!46250)) b!284061))

(assert (= (and b!284059 res!146665) b!284060))

(assert (= (or b!284060 b!284061) bm!25524))

(declare-fun m!299095 () Bool)

(assert (=> bm!25524 m!299095))

(declare-fun m!299097 () Bool)

(assert (=> b!284058 m!299097))

(assert (=> b!284058 m!299097))

(declare-fun m!299099 () Bool)

(assert (=> b!284058 m!299099))

(assert (=> b!284059 m!299097))

(declare-fun m!299103 () Bool)

(assert (=> b!284059 m!299103))

(declare-fun m!299105 () Bool)

(assert (=> b!284059 m!299105))

(assert (=> b!284059 m!299097))

(declare-fun m!299107 () Bool)

(assert (=> b!284059 m!299107))

(assert (=> bm!25504 d!65583))

(check-sat (not d!65543) (not d!65473) (not b!283861) (not d!65507) (not b!283865) (not bm!25524) (not d!65575) (not d!65465) (not b!283859) (not b!283858) (not bm!25515) (not b!284059) (not b!283873) (not b!283952) (not b!283870) (not b!283866) (not b!283869) (not b!284000) (not b!284012) (not d!65547) (not b!283808) (not b!284047) (not d!65563) (not b!283965) (not d!65495) (not b!283882) (not b!283815) (not d!65497) (not bm!25514) (not b!283884) (not d!65533) (not bm!25520) (not bm!25516) (not b!283954) (not b!283937) (not d!65525) (not b!284037) (not d!65493) (not b!283868) (not b!283874) (not b!283950) (not bm!25517) (not b!284029) (not b!283810) (not d!65555) (not b!284058) (not b!284016) (not d!65463) (not d!65505) (not d!65569) (not b!283852) (not b!283995) (not d!65471))
(check-sat)
