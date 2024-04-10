; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44202 () Bool)

(assert start!44202)

(declare-fun b!486449 () Bool)

(declare-fun res!289912 () Bool)

(declare-fun e!286331 () Bool)

(assert (=> b!486449 (=> (not res!289912) (not e!286331))))

(declare-datatypes ((array!31498 0))(
  ( (array!31499 (arr!15144 (Array (_ BitVec 32) (_ BitVec 64))) (size!15508 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31498)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486449 (= res!289912 (validKeyInArray!0 (select (arr!15144 a!3235) j!176)))))

(declare-fun b!486450 () Bool)

(declare-fun e!286329 () Bool)

(declare-fun e!286330 () Bool)

(assert (=> b!486450 (= e!286329 e!286330)))

(declare-fun res!289911 () Bool)

(assert (=> b!486450 (=> res!289911 e!286330)))

(declare-datatypes ((List!9302 0))(
  ( (Nil!9299) (Cons!9298 (h!10154 (_ BitVec 64)) (t!15530 List!9302)) )
))
(declare-fun contains!2696 (List!9302 (_ BitVec 64)) Bool)

(assert (=> b!486450 (= res!289911 (contains!2696 Nil!9299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486452 () Bool)

(declare-fun res!289916 () Bool)

(assert (=> b!486452 (=> (not res!289916) (not e!286329))))

(declare-fun noDuplicate!210 (List!9302) Bool)

(assert (=> b!486452 (= res!289916 (noDuplicate!210 Nil!9299))))

(declare-fun b!486453 () Bool)

(declare-fun res!289909 () Bool)

(assert (=> b!486453 (=> (not res!289909) (not e!286329))))

(assert (=> b!486453 (= res!289909 (and (bvsle #b00000000000000000000000000000000 (size!15508 a!3235)) (bvslt (size!15508 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!486454 () Bool)

(declare-fun res!289907 () Bool)

(assert (=> b!486454 (=> (not res!289907) (not e!286331))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486454 (= res!289907 (and (= (size!15508 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15508 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15508 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486455 () Bool)

(declare-fun res!289915 () Bool)

(assert (=> b!486455 (=> (not res!289915) (not e!286331))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!486455 (= res!289915 (validKeyInArray!0 k!2280))))

(declare-fun b!486456 () Bool)

(declare-fun res!289913 () Bool)

(assert (=> b!486456 (=> (not res!289913) (not e!286331))))

(declare-fun arrayContainsKey!0 (array!31498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486456 (= res!289913 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486457 () Bool)

(assert (=> b!486457 (= e!286330 (contains!2696 Nil!9299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486458 () Bool)

(assert (=> b!486458 (= e!286331 e!286329)))

(declare-fun res!289914 () Bool)

(assert (=> b!486458 (=> (not res!289914) (not e!286329))))

(declare-datatypes ((SeekEntryResult!3611 0))(
  ( (MissingZero!3611 (index!16623 (_ BitVec 32))) (Found!3611 (index!16624 (_ BitVec 32))) (Intermediate!3611 (undefined!4423 Bool) (index!16625 (_ BitVec 32)) (x!45759 (_ BitVec 32))) (Undefined!3611) (MissingVacant!3611 (index!16626 (_ BitVec 32))) )
))
(declare-fun lt!219748 () SeekEntryResult!3611)

(assert (=> b!486458 (= res!289914 (or (= lt!219748 (MissingZero!3611 i!1204)) (= lt!219748 (MissingVacant!3611 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31498 (_ BitVec 32)) SeekEntryResult!3611)

(assert (=> b!486458 (= lt!219748 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289910 () Bool)

(assert (=> start!44202 (=> (not res!289910) (not e!286331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44202 (= res!289910 (validMask!0 mask!3524))))

(assert (=> start!44202 e!286331))

(assert (=> start!44202 true))

(declare-fun array_inv!10940 (array!31498) Bool)

(assert (=> start!44202 (array_inv!10940 a!3235)))

(declare-fun b!486451 () Bool)

(declare-fun res!289908 () Bool)

(assert (=> b!486451 (=> (not res!289908) (not e!286329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31498 (_ BitVec 32)) Bool)

(assert (=> b!486451 (= res!289908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44202 res!289910) b!486454))

(assert (= (and b!486454 res!289907) b!486449))

(assert (= (and b!486449 res!289912) b!486455))

(assert (= (and b!486455 res!289915) b!486456))

(assert (= (and b!486456 res!289913) b!486458))

(assert (= (and b!486458 res!289914) b!486451))

(assert (= (and b!486451 res!289908) b!486453))

(assert (= (and b!486453 res!289909) b!486452))

(assert (= (and b!486452 res!289916) b!486450))

(assert (= (and b!486450 (not res!289911)) b!486457))

(declare-fun m!466395 () Bool)

(assert (=> b!486450 m!466395))

(declare-fun m!466397 () Bool)

(assert (=> b!486458 m!466397))

(declare-fun m!466399 () Bool)

(assert (=> b!486456 m!466399))

(declare-fun m!466401 () Bool)

(assert (=> b!486451 m!466401))

(declare-fun m!466403 () Bool)

(assert (=> b!486449 m!466403))

(assert (=> b!486449 m!466403))

(declare-fun m!466405 () Bool)

(assert (=> b!486449 m!466405))

(declare-fun m!466407 () Bool)

(assert (=> start!44202 m!466407))

(declare-fun m!466409 () Bool)

(assert (=> start!44202 m!466409))

(declare-fun m!466411 () Bool)

(assert (=> b!486455 m!466411))

(declare-fun m!466413 () Bool)

(assert (=> b!486457 m!466413))

(declare-fun m!466415 () Bool)

(assert (=> b!486452 m!466415))

(push 1)

(assert (not b!486452))

(assert (not b!486455))

(assert (not b!486458))

(assert (not b!486456))

(assert (not start!44202))

(assert (not b!486451))

(assert (not b!486449))

(assert (not b!486450))

(assert (not b!486457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77551 () Bool)

(assert (=> d!77551 (= (validKeyInArray!0 (select (arr!15144 a!3235) j!176)) (and (not (= (select (arr!15144 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15144 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486449 d!77551))

(declare-fun d!77553 () Bool)

(assert (=> d!77553 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486455 d!77553))

(declare-fun d!77555 () Bool)

(declare-fun lt!219757 () Bool)

(declare-fun content!219 (List!9302) (Set (_ BitVec 64)))

(assert (=> d!77555 (= lt!219757 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!219 Nil!9299)))))

(declare-fun e!286362 () Bool)

(assert (=> d!77555 (= lt!219757 e!286362)))

(declare-fun res!289981 () Bool)

(assert (=> d!77555 (=> (not res!289981) (not e!286362))))

(assert (=> d!77555 (= res!289981 (is-Cons!9298 Nil!9299))))

(assert (=> d!77555 (= (contains!2696 Nil!9299 #b0000000000000000000000000000000000000000000000000000000000000000) lt!219757)))

(declare-fun b!486523 () Bool)

(declare-fun e!286361 () Bool)

(assert (=> b!486523 (= e!286362 e!286361)))

(declare-fun res!289982 () Bool)

(assert (=> b!486523 (=> res!289982 e!286361)))

(assert (=> b!486523 (= res!289982 (= (h!10154 Nil!9299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486524 () Bool)

(assert (=> b!486524 (= e!286361 (contains!2696 (t!15530 Nil!9299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!77555 res!289981) b!486523))

(assert (= (and b!486523 (not res!289982)) b!486524))

(declare-fun m!466461 () Bool)

(assert (=> d!77555 m!466461))

(declare-fun m!466463 () Bool)

(assert (=> d!77555 m!466463))

(declare-fun m!466465 () Bool)

(assert (=> b!486524 m!466465))

(assert (=> b!486450 d!77555))

(declare-fun d!77561 () Bool)

(declare-fun res!289993 () Bool)

(declare-fun e!286373 () Bool)

(assert (=> d!77561 (=> res!289993 e!286373)))

(assert (=> d!77561 (= res!289993 (= (select (arr!15144 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77561 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!286373)))

(declare-fun b!486535 () Bool)

(declare-fun e!286374 () Bool)

(assert (=> b!486535 (= e!286373 e!286374)))

(declare-fun res!289994 () Bool)

(assert (=> b!486535 (=> (not res!289994) (not e!286374))))

(assert (=> b!486535 (= res!289994 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15508 a!3235)))))

(declare-fun b!486536 () Bool)

(assert (=> b!486536 (= e!286374 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77561 (not res!289993)) b!486535))

(assert (= (and b!486535 res!289994) b!486536))

(declare-fun m!466473 () Bool)

(assert (=> d!77561 m!466473))

(declare-fun m!466475 () Bool)

(assert (=> b!486536 m!466475))

(assert (=> b!486456 d!77561))

(declare-fun b!486559 () Bool)

(declare-fun e!286392 () Bool)

(declare-fun call!31280 () Bool)

(assert (=> b!486559 (= e!286392 call!31280)))

(declare-fun b!486560 () Bool)

(declare-fun e!286394 () Bool)

(assert (=> b!486560 (= e!286394 e!286392)))

(declare-fun c!58544 () Bool)

(assert (=> b!486560 (= c!58544 (validKeyInArray!0 (select (arr!15144 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!486561 () Bool)

(declare-fun e!286393 () Bool)

(assert (=> b!486561 (= e!286392 e!286393)))

(declare-fun lt!219777 () (_ BitVec 64))

(assert (=> b!486561 (= lt!219777 (select (arr!15144 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14200 0))(
  ( (Unit!14201) )
))
(declare-fun lt!219779 () Unit!14200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31498 (_ BitVec 64) (_ BitVec 32)) Unit!14200)

(assert (=> b!486561 (= lt!219779 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219777 #b00000000000000000000000000000000))))

(assert (=> b!486561 (arrayContainsKey!0 a!3235 lt!219777 #b00000000000000000000000000000000)))

(declare-fun lt!219778 () Unit!14200)

(assert (=> b!486561 (= lt!219778 lt!219779)))

(declare-fun res!290008 () Bool)

(assert (=> b!486561 (= res!290008 (= (seekEntryOrOpen!0 (select (arr!15144 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3611 #b00000000000000000000000000000000)))))

(assert (=> b!486561 (=> (not res!290008) (not e!286393))))

(declare-fun d!77565 () Bool)

(declare-fun res!290007 () Bool)

(assert (=> d!77565 (=> res!290007 e!286394)))

(assert (=> d!77565 (= res!290007 (bvsge #b00000000000000000000000000000000 (size!15508 a!3235)))))

(assert (=> d!77565 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286394)))

(declare-fun bm!31277 () Bool)

(assert (=> bm!31277 (= call!31280 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!486562 () Bool)

(assert (=> b!486562 (= e!286393 call!31280)))

(assert (= (and d!77565 (not res!290007)) b!486560))

(assert (= (and b!486560 c!58544) b!486561))

(assert (= (and b!486560 (not c!58544)) b!486559))

(assert (= (and b!486561 res!290008) b!486562))

(assert (= (or b!486562 b!486559) bm!31277))

(assert (=> b!486560 m!466473))

(assert (=> b!486560 m!466473))

(declare-fun m!466493 () Bool)

(assert (=> b!486560 m!466493))

(assert (=> b!486561 m!466473))

(declare-fun m!466495 () Bool)

(assert (=> b!486561 m!466495))

(declare-fun m!466497 () Bool)

(assert (=> b!486561 m!466497))

(assert (=> b!486561 m!466473))

(declare-fun m!466499 () Bool)

(assert (=> b!486561 m!466499))

(declare-fun m!466501 () Bool)

(assert (=> bm!31277 m!466501))

(assert (=> b!486451 d!77565))

(declare-fun d!77571 () Bool)

(declare-fun lt!219786 () Bool)

(assert (=> d!77571 (= lt!219786 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!219 Nil!9299)))))

(declare-fun e!286400 () Bool)

(assert (=> d!77571 (= lt!219786 e!286400)))

(declare-fun res!290011 () Bool)

(assert (=> d!77571 (=> (not res!290011) (not e!286400))))

(assert (=> d!77571 (= res!290011 (is-Cons!9298 Nil!9299))))

(assert (=> d!77571 (= (contains!2696 Nil!9299 #b1000000000000000000000000000000000000000000000000000000000000000) lt!219786)))

(declare-fun b!486569 () Bool)

(declare-fun e!286399 () Bool)

(assert (=> b!486569 (= e!286400 e!286399)))

(declare-fun res!290012 () Bool)

(assert (=> b!486569 (=> res!290012 e!286399)))

(assert (=> b!486569 (= res!290012 (= (h!10154 Nil!9299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486570 () Bool)

(assert (=> b!486570 (= e!286399 (contains!2696 (t!15530 Nil!9299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!77571 res!290011) b!486569))

(assert (= (and b!486569 (not res!290012)) b!486570))

(assert (=> d!77571 m!466461))

(declare-fun m!466503 () Bool)

(assert (=> d!77571 m!466503))

(declare-fun m!466505 () Bool)

(assert (=> b!486570 m!466505))

(assert (=> b!486457 d!77571))

(declare-fun d!77573 () Bool)

(declare-fun res!290025 () Bool)

(declare-fun e!286413 () Bool)

(assert (=> d!77573 (=> res!290025 e!286413)))

(assert (=> d!77573 (= res!290025 (is-Nil!9299 Nil!9299))))

(assert (=> d!77573 (= (noDuplicate!210 Nil!9299) e!286413)))

(declare-fun b!486583 () Bool)

(declare-fun e!286414 () Bool)

(assert (=> b!486583 (= e!286413 e!286414)))

(declare-fun res!290026 () Bool)

(assert (=> b!486583 (=> (not res!290026) (not e!286414))))

(assert (=> b!486583 (= res!290026 (not (contains!2696 (t!15530 Nil!9299) (h!10154 Nil!9299))))))

(declare-fun b!486584 () Bool)

(assert (=> b!486584 (= e!286414 (noDuplicate!210 (t!15530 Nil!9299)))))

(assert (= (and d!77573 (not res!290025)) b!486583))

(assert (= (and b!486583 res!290026) b!486584))

(declare-fun m!466509 () Bool)

(assert (=> b!486583 m!466509))

(declare-fun m!466511 () Bool)

(assert (=> b!486584 m!466511))

(assert (=> b!486452 d!77573))

(declare-fun d!77577 () Bool)

(assert (=> d!77577 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44202 d!77577))

(declare-fun d!77585 () Bool)

(assert (=> d!77585 (= (array_inv!10940 a!3235) (bvsge (size!15508 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44202 d!77585))

(declare-fun d!77587 () Bool)

(declare-fun lt!219819 () SeekEntryResult!3611)

(assert (=> d!77587 (and (or (is-Undefined!3611 lt!219819) (not (is-Found!3611 lt!219819)) (and (bvsge (index!16624 lt!219819) #b00000000000000000000000000000000) (bvslt (index!16624 lt!219819) (size!15508 a!3235)))) (or (is-Undefined!3611 lt!219819) (is-Found!3611 lt!219819) (not (is-MissingZero!3611 lt!219819)) (and (bvsge (index!16623 lt!219819) #b00000000000000000000000000000000) (bvslt (index!16623 lt!219819) (size!15508 a!3235)))) (or (is-Undefined!3611 lt!219819) (is-Found!3611 lt!219819) (is-MissingZero!3611 lt!219819) (not (is-MissingVacant!3611 lt!219819)) (and (bvsge (index!16626 lt!219819) #b00000000000000000000000000000000) (bvslt (index!16626 lt!219819) (size!15508 a!3235)))) (or (is-Undefined!3611 lt!219819) (ite (is-Found!3611 lt!219819) (= (select (arr!15144 a!3235) (index!16624 lt!219819)) k!2280) (ite (is-MissingZero!3611 lt!219819) (= (select (arr!15144 a!3235) (index!16623 lt!219819)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3611 lt!219819) (= (select (arr!15144 a!3235) (index!16626 lt!219819)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286456 () SeekEntryResult!3611)

(assert (=> d!77587 (= lt!219819 e!286456)))

(declare-fun c!58574 () Bool)

(declare-fun lt!219817 () SeekEntryResult!3611)

(assert (=> d!77587 (= c!58574 (and (is-Intermediate!3611 lt!219817) (undefined!4423 lt!219817)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31498 (_ BitVec 32)) SeekEntryResult!3611)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77587 (= lt!219817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77587 (validMask!0 mask!3524)))

(assert (=> d!77587 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!219819)))

(declare-fun b!486649 () Bool)

(declare-fun e!286454 () SeekEntryResult!3611)

(assert (=> b!486649 (= e!286456 e!286454)))

(declare-fun lt!219818 () (_ BitVec 64))

(assert (=> b!486649 (= lt!219818 (select (arr!15144 a!3235) (index!16625 lt!219817)))))

(declare-fun c!58573 () Bool)

(assert (=> b!486649 (= c!58573 (= lt!219818 k!2280))))

(declare-fun e!286455 () SeekEntryResult!3611)

(declare-fun b!486650 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31498 (_ BitVec 32)) SeekEntryResult!3611)

(assert (=> b!486650 (= e!286455 (seekKeyOrZeroReturnVacant!0 (x!45759 lt!219817) (index!16625 lt!219817) (index!16625 lt!219817) k!2280 a!3235 mask!3524))))

(declare-fun b!486651 () Bool)

(assert (=> b!486651 (= e!286454 (Found!3611 (index!16625 lt!219817)))))

(declare-fun b!486652 () Bool)

(assert (=> b!486652 (= e!286456 Undefined!3611)))

(declare-fun b!486653 () Bool)

(declare-fun c!58572 () Bool)

(assert (=> b!486653 (= c!58572 (= lt!219818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486653 (= e!286454 e!286455)))

(declare-fun b!486654 () Bool)

(assert (=> b!486654 (= e!286455 (MissingZero!3611 (index!16625 lt!219817)))))

(assert (= (and d!77587 c!58574) b!486652))

(assert (= (and d!77587 (not c!58574)) b!486649))

(assert (= (and b!486649 c!58573) b!486651))

(assert (= (and b!486649 (not c!58573)) b!486653))

(assert (= (and b!486653 c!58572) b!486654))

(assert (= (and b!486653 (not c!58572)) b!486650))

(declare-fun m!466563 () Bool)

(assert (=> d!77587 m!466563))

(assert (=> d!77587 m!466407))

(declare-fun m!466565 () Bool)

(assert (=> d!77587 m!466565))

(declare-fun m!466567 () Bool)

(assert (=> d!77587 m!466567))

(assert (=> d!77587 m!466565))

(declare-fun m!466569 () Bool)

(assert (=> d!77587 m!466569))

(declare-fun m!466571 () Bool)

(assert (=> d!77587 m!466571))

(declare-fun m!466573 () Bool)

(assert (=> b!486649 m!466573))

(declare-fun m!466575 () Bool)

(assert (=> b!486650 m!466575))

(assert (=> b!486458 d!77587))

(push 1)

(assert (not b!486561))

(assert (not d!77587))

(assert (not b!486560))

(assert (not b!486583))

(assert (not b!486584))

(assert (not d!77571))

(assert (not b!486524))

(assert (not b!486650))

(assert (not b!486536))

(assert (not bm!31277))

(assert (not b!486570))

(assert (not d!77555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

