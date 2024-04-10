; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45612 () Bool)

(assert start!45612)

(declare-fun b!502534 () Bool)

(declare-fun e!294347 () Bool)

(assert (=> b!502534 (= e!294347 true)))

(declare-datatypes ((array!32368 0))(
  ( (array!32369 (arr!15564 (Array (_ BitVec 32) (_ BitVec 64))) (size!15928 (_ BitVec 32))) )
))
(declare-fun lt!228439 () array!32368)

(declare-datatypes ((SeekEntryResult!4031 0))(
  ( (MissingZero!4031 (index!18312 (_ BitVec 32))) (Found!4031 (index!18313 (_ BitVec 32))) (Intermediate!4031 (undefined!4843 Bool) (index!18314 (_ BitVec 32)) (x!47344 (_ BitVec 32))) (Undefined!4031) (MissingVacant!4031 (index!18315 (_ BitVec 32))) )
))
(declare-fun lt!228441 () SeekEntryResult!4031)

(declare-fun lt!228446 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!228438 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32368 (_ BitVec 32)) SeekEntryResult!4031)

(assert (=> b!502534 (= lt!228441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228438 lt!228446 lt!228439 mask!3524))))

(declare-fun b!502535 () Bool)

(declare-fun res!303945 () Bool)

(declare-fun e!294349 () Bool)

(assert (=> b!502535 (=> (not res!303945) (not e!294349))))

(declare-fun a!3235 () array!32368)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32368 (_ BitVec 32)) Bool)

(assert (=> b!502535 (= res!303945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502536 () Bool)

(declare-fun e!294346 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32368 (_ BitVec 32)) SeekEntryResult!4031)

(assert (=> b!502536 (= e!294346 (= (seekEntryOrOpen!0 (select (arr!15564 a!3235) j!176) a!3235 mask!3524) (Found!4031 j!176)))))

(declare-fun b!502537 () Bool)

(declare-fun res!303953 () Bool)

(declare-fun e!294345 () Bool)

(assert (=> b!502537 (=> (not res!303953) (not e!294345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502537 (= res!303953 (validKeyInArray!0 (select (arr!15564 a!3235) j!176)))))

(declare-fun b!502538 () Bool)

(declare-fun res!303950 () Bool)

(assert (=> b!502538 (=> (not res!303950) (not e!294345))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502538 (= res!303950 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502539 () Bool)

(declare-datatypes ((Unit!15200 0))(
  ( (Unit!15201) )
))
(declare-fun e!294348 () Unit!15200)

(declare-fun Unit!15202 () Unit!15200)

(assert (=> b!502539 (= e!294348 Unit!15202)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!228445 () SeekEntryResult!4031)

(declare-fun lt!228442 () Unit!15200)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32368 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15200)

(assert (=> b!502539 (= lt!228442 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228438 #b00000000000000000000000000000000 (index!18314 lt!228445) (x!47344 lt!228445) mask!3524))))

(declare-fun res!303940 () Bool)

(assert (=> b!502539 (= res!303940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228438 lt!228446 lt!228439 mask!3524) (Intermediate!4031 false (index!18314 lt!228445) (x!47344 lt!228445))))))

(declare-fun e!294351 () Bool)

(assert (=> b!502539 (=> (not res!303940) (not e!294351))))

(assert (=> b!502539 e!294351))

(declare-fun b!502540 () Bool)

(declare-fun res!303939 () Bool)

(declare-fun e!294344 () Bool)

(assert (=> b!502540 (=> res!303939 e!294344)))

(assert (=> b!502540 (= res!303939 (or (undefined!4843 lt!228445) (not (is-Intermediate!4031 lt!228445))))))

(declare-fun res!303947 () Bool)

(assert (=> start!45612 (=> (not res!303947) (not e!294345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45612 (= res!303947 (validMask!0 mask!3524))))

(assert (=> start!45612 e!294345))

(assert (=> start!45612 true))

(declare-fun array_inv!11360 (array!32368) Bool)

(assert (=> start!45612 (array_inv!11360 a!3235)))

(declare-fun b!502541 () Bool)

(assert (=> b!502541 (= e!294349 (not e!294344))))

(declare-fun res!303949 () Bool)

(assert (=> b!502541 (=> res!303949 e!294344)))

(declare-fun lt!228444 () (_ BitVec 32))

(assert (=> b!502541 (= res!303949 (= lt!228445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228444 lt!228446 lt!228439 mask!3524)))))

(assert (=> b!502541 (= lt!228445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228438 (select (arr!15564 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502541 (= lt!228444 (toIndex!0 lt!228446 mask!3524))))

(assert (=> b!502541 (= lt!228446 (select (store (arr!15564 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502541 (= lt!228438 (toIndex!0 (select (arr!15564 a!3235) j!176) mask!3524))))

(assert (=> b!502541 (= lt!228439 (array!32369 (store (arr!15564 a!3235) i!1204 k!2280) (size!15928 a!3235)))))

(assert (=> b!502541 e!294346))

(declare-fun res!303943 () Bool)

(assert (=> b!502541 (=> (not res!303943) (not e!294346))))

(assert (=> b!502541 (= res!303943 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228440 () Unit!15200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15200)

(assert (=> b!502541 (= lt!228440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502542 () Bool)

(declare-fun res!303948 () Bool)

(assert (=> b!502542 (=> (not res!303948) (not e!294345))))

(assert (=> b!502542 (= res!303948 (and (= (size!15928 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15928 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15928 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502543 () Bool)

(assert (=> b!502543 (= e!294345 e!294349)))

(declare-fun res!303952 () Bool)

(assert (=> b!502543 (=> (not res!303952) (not e!294349))))

(declare-fun lt!228447 () SeekEntryResult!4031)

(assert (=> b!502543 (= res!303952 (or (= lt!228447 (MissingZero!4031 i!1204)) (= lt!228447 (MissingVacant!4031 i!1204))))))

(assert (=> b!502543 (= lt!228447 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502544 () Bool)

(declare-fun res!303942 () Bool)

(assert (=> b!502544 (=> (not res!303942) (not e!294345))))

(assert (=> b!502544 (= res!303942 (validKeyInArray!0 k!2280))))

(declare-fun b!502545 () Bool)

(assert (=> b!502545 (= e!294351 false)))

(declare-fun b!502546 () Bool)

(declare-fun Unit!15203 () Unit!15200)

(assert (=> b!502546 (= e!294348 Unit!15203)))

(declare-fun b!502547 () Bool)

(declare-fun e!294350 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32368 (_ BitVec 32)) SeekEntryResult!4031)

(assert (=> b!502547 (= e!294350 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228438 (index!18314 lt!228445) (select (arr!15564 a!3235) j!176) a!3235 mask!3524) (Found!4031 j!176))))))

(declare-fun b!502548 () Bool)

(declare-fun res!303946 () Bool)

(assert (=> b!502548 (=> (not res!303946) (not e!294349))))

(declare-datatypes ((List!9722 0))(
  ( (Nil!9719) (Cons!9718 (h!10595 (_ BitVec 64)) (t!15950 List!9722)) )
))
(declare-fun arrayNoDuplicates!0 (array!32368 (_ BitVec 32) List!9722) Bool)

(assert (=> b!502548 (= res!303946 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9719))))

(declare-fun b!502549 () Bool)

(assert (=> b!502549 (= e!294344 e!294347)))

(declare-fun res!303941 () Bool)

(assert (=> b!502549 (=> res!303941 e!294347)))

(assert (=> b!502549 (= res!303941 (or (bvsgt (x!47344 lt!228445) #b01111111111111111111111111111110) (bvslt lt!228438 #b00000000000000000000000000000000) (bvsge lt!228438 (size!15928 a!3235)) (bvslt (index!18314 lt!228445) #b00000000000000000000000000000000) (bvsge (index!18314 lt!228445) (size!15928 a!3235)) (not (= lt!228445 (Intermediate!4031 false (index!18314 lt!228445) (x!47344 lt!228445))))))))

(assert (=> b!502549 (= (index!18314 lt!228445) i!1204)))

(declare-fun lt!228443 () Unit!15200)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32368 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15200)

(assert (=> b!502549 (= lt!228443 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228438 #b00000000000000000000000000000000 (index!18314 lt!228445) (x!47344 lt!228445) mask!3524))))

(assert (=> b!502549 (and (or (= (select (arr!15564 a!3235) (index!18314 lt!228445)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15564 a!3235) (index!18314 lt!228445)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15564 a!3235) (index!18314 lt!228445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15564 a!3235) (index!18314 lt!228445)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228448 () Unit!15200)

(assert (=> b!502549 (= lt!228448 e!294348)))

(declare-fun c!59576 () Bool)

(assert (=> b!502549 (= c!59576 (= (select (arr!15564 a!3235) (index!18314 lt!228445)) (select (arr!15564 a!3235) j!176)))))

(assert (=> b!502549 (and (bvslt (x!47344 lt!228445) #b01111111111111111111111111111110) (or (= (select (arr!15564 a!3235) (index!18314 lt!228445)) (select (arr!15564 a!3235) j!176)) (= (select (arr!15564 a!3235) (index!18314 lt!228445)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15564 a!3235) (index!18314 lt!228445)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502550 () Bool)

(declare-fun res!303944 () Bool)

(assert (=> b!502550 (=> res!303944 e!294347)))

(assert (=> b!502550 (= res!303944 e!294350)))

(declare-fun res!303951 () Bool)

(assert (=> b!502550 (=> (not res!303951) (not e!294350))))

(assert (=> b!502550 (= res!303951 (bvsgt #b00000000000000000000000000000000 (x!47344 lt!228445)))))

(assert (= (and start!45612 res!303947) b!502542))

(assert (= (and b!502542 res!303948) b!502537))

(assert (= (and b!502537 res!303953) b!502544))

(assert (= (and b!502544 res!303942) b!502538))

(assert (= (and b!502538 res!303950) b!502543))

(assert (= (and b!502543 res!303952) b!502535))

(assert (= (and b!502535 res!303945) b!502548))

(assert (= (and b!502548 res!303946) b!502541))

(assert (= (and b!502541 res!303943) b!502536))

(assert (= (and b!502541 (not res!303949)) b!502540))

(assert (= (and b!502540 (not res!303939)) b!502549))

(assert (= (and b!502549 c!59576) b!502539))

(assert (= (and b!502549 (not c!59576)) b!502546))

(assert (= (and b!502539 res!303940) b!502545))

(assert (= (and b!502549 (not res!303941)) b!502550))

(assert (= (and b!502550 res!303951) b!502547))

(assert (= (and b!502550 (not res!303944)) b!502534))

(declare-fun m!483459 () Bool)

(assert (=> b!502541 m!483459))

(declare-fun m!483461 () Bool)

(assert (=> b!502541 m!483461))

(declare-fun m!483463 () Bool)

(assert (=> b!502541 m!483463))

(declare-fun m!483465 () Bool)

(assert (=> b!502541 m!483465))

(declare-fun m!483467 () Bool)

(assert (=> b!502541 m!483467))

(assert (=> b!502541 m!483465))

(declare-fun m!483469 () Bool)

(assert (=> b!502541 m!483469))

(declare-fun m!483471 () Bool)

(assert (=> b!502541 m!483471))

(assert (=> b!502541 m!483465))

(declare-fun m!483473 () Bool)

(assert (=> b!502541 m!483473))

(declare-fun m!483475 () Bool)

(assert (=> b!502541 m!483475))

(declare-fun m!483477 () Bool)

(assert (=> b!502544 m!483477))

(declare-fun m!483479 () Bool)

(assert (=> b!502549 m!483479))

(declare-fun m!483481 () Bool)

(assert (=> b!502549 m!483481))

(assert (=> b!502549 m!483465))

(assert (=> b!502536 m!483465))

(assert (=> b!502536 m!483465))

(declare-fun m!483483 () Bool)

(assert (=> b!502536 m!483483))

(assert (=> b!502547 m!483465))

(assert (=> b!502547 m!483465))

(declare-fun m!483485 () Bool)

(assert (=> b!502547 m!483485))

(assert (=> b!502537 m!483465))

(assert (=> b!502537 m!483465))

(declare-fun m!483487 () Bool)

(assert (=> b!502537 m!483487))

(declare-fun m!483489 () Bool)

(assert (=> b!502538 m!483489))

(declare-fun m!483491 () Bool)

(assert (=> start!45612 m!483491))

(declare-fun m!483493 () Bool)

(assert (=> start!45612 m!483493))

(declare-fun m!483495 () Bool)

(assert (=> b!502548 m!483495))

(declare-fun m!483497 () Bool)

(assert (=> b!502543 m!483497))

(declare-fun m!483499 () Bool)

(assert (=> b!502534 m!483499))

(declare-fun m!483501 () Bool)

(assert (=> b!502535 m!483501))

(declare-fun m!483503 () Bool)

(assert (=> b!502539 m!483503))

(assert (=> b!502539 m!483499))

(push 1)

