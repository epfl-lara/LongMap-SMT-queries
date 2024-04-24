; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45602 () Bool)

(assert start!45602)

(declare-fun b!502473 () Bool)

(declare-fun res!303945 () Bool)

(declare-fun e!294308 () Bool)

(assert (=> b!502473 (=> (not res!303945) (not e!294308))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32359 0))(
  ( (array!32360 (arr!15559 (Array (_ BitVec 32) (_ BitVec 64))) (size!15923 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32359)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!502473 (= res!303945 (and (= (size!15923 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15923 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15923 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502474 () Bool)

(declare-fun res!303943 () Bool)

(declare-fun e!294306 () Bool)

(assert (=> b!502474 (=> (not res!303943) (not e!294306))))

(declare-datatypes ((List!9624 0))(
  ( (Nil!9621) (Cons!9620 (h!10497 (_ BitVec 64)) (t!15844 List!9624)) )
))
(declare-fun arrayNoDuplicates!0 (array!32359 (_ BitVec 32) List!9624) Bool)

(assert (=> b!502474 (= res!303943 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9621))))

(declare-fun b!502475 () Bool)

(declare-datatypes ((Unit!15163 0))(
  ( (Unit!15164) )
))
(declare-fun e!294307 () Unit!15163)

(declare-fun Unit!15165 () Unit!15163)

(assert (=> b!502475 (= e!294307 Unit!15165)))

(declare-fun lt!228454 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!228457 () Unit!15163)

(declare-datatypes ((SeekEntryResult!3982 0))(
  ( (MissingZero!3982 (index!18116 (_ BitVec 32))) (Found!3982 (index!18117 (_ BitVec 32))) (Intermediate!3982 (undefined!4794 Bool) (index!18118 (_ BitVec 32)) (x!47292 (_ BitVec 32))) (Undefined!3982) (MissingVacant!3982 (index!18119 (_ BitVec 32))) )
))
(declare-fun lt!228456 () SeekEntryResult!3982)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15163)

(assert (=> b!502475 (= lt!228457 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228454 #b00000000000000000000000000000000 (index!18118 lt!228456) (x!47292 lt!228456) mask!3524))))

(declare-fun res!303946 () Bool)

(declare-fun lt!228453 () (_ BitVec 64))

(declare-fun lt!228450 () array!32359)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32359 (_ BitVec 32)) SeekEntryResult!3982)

(assert (=> b!502475 (= res!303946 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228454 lt!228453 lt!228450 mask!3524) (Intermediate!3982 false (index!18118 lt!228456) (x!47292 lt!228456))))))

(declare-fun e!294305 () Bool)

(assert (=> b!502475 (=> (not res!303946) (not e!294305))))

(assert (=> b!502475 e!294305))

(declare-fun b!502476 () Bool)

(declare-fun e!294312 () Bool)

(assert (=> b!502476 (= e!294312 true)))

(declare-fun lt!228459 () SeekEntryResult!3982)

(assert (=> b!502476 (= lt!228459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228454 lt!228453 lt!228450 mask!3524))))

(declare-fun b!502477 () Bool)

(declare-fun e!294311 () Bool)

(assert (=> b!502477 (= e!294306 (not e!294311))))

(declare-fun res!303935 () Bool)

(assert (=> b!502477 (=> res!303935 e!294311)))

(declare-fun lt!228455 () (_ BitVec 32))

(assert (=> b!502477 (= res!303935 (= lt!228456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228455 lt!228453 lt!228450 mask!3524)))))

(assert (=> b!502477 (= lt!228456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228454 (select (arr!15559 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502477 (= lt!228455 (toIndex!0 lt!228453 mask!3524))))

(assert (=> b!502477 (= lt!228453 (select (store (arr!15559 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502477 (= lt!228454 (toIndex!0 (select (arr!15559 a!3235) j!176) mask!3524))))

(assert (=> b!502477 (= lt!228450 (array!32360 (store (arr!15559 a!3235) i!1204 k0!2280) (size!15923 a!3235)))))

(declare-fun e!294309 () Bool)

(assert (=> b!502477 e!294309))

(declare-fun res!303938 () Bool)

(assert (=> b!502477 (=> (not res!303938) (not e!294309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32359 (_ BitVec 32)) Bool)

(assert (=> b!502477 (= res!303938 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228460 () Unit!15163)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15163)

(assert (=> b!502477 (= lt!228460 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun e!294310 () Bool)

(declare-fun b!502478 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32359 (_ BitVec 32)) SeekEntryResult!3982)

(assert (=> b!502478 (= e!294310 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228454 (index!18118 lt!228456) (select (arr!15559 a!3235) j!176) a!3235 mask!3524) (Found!3982 j!176))))))

(declare-fun b!502479 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32359 (_ BitVec 32)) SeekEntryResult!3982)

(assert (=> b!502479 (= e!294309 (= (seekEntryOrOpen!0 (select (arr!15559 a!3235) j!176) a!3235 mask!3524) (Found!3982 j!176)))))

(declare-fun b!502480 () Bool)

(declare-fun res!303933 () Bool)

(assert (=> b!502480 (=> (not res!303933) (not e!294308))))

(declare-fun arrayContainsKey!0 (array!32359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502480 (= res!303933 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502481 () Bool)

(declare-fun res!303937 () Bool)

(assert (=> b!502481 (=> (not res!303937) (not e!294306))))

(assert (=> b!502481 (= res!303937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502483 () Bool)

(assert (=> b!502483 (= e!294308 e!294306)))

(declare-fun res!303939 () Bool)

(assert (=> b!502483 (=> (not res!303939) (not e!294306))))

(declare-fun lt!228451 () SeekEntryResult!3982)

(assert (=> b!502483 (= res!303939 (or (= lt!228451 (MissingZero!3982 i!1204)) (= lt!228451 (MissingVacant!3982 i!1204))))))

(assert (=> b!502483 (= lt!228451 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502484 () Bool)

(declare-fun res!303941 () Bool)

(assert (=> b!502484 (=> res!303941 e!294312)))

(assert (=> b!502484 (= res!303941 e!294310)))

(declare-fun res!303940 () Bool)

(assert (=> b!502484 (=> (not res!303940) (not e!294310))))

(assert (=> b!502484 (= res!303940 (bvsgt #b00000000000000000000000000000000 (x!47292 lt!228456)))))

(declare-fun b!502485 () Bool)

(assert (=> b!502485 (= e!294311 e!294312)))

(declare-fun res!303936 () Bool)

(assert (=> b!502485 (=> res!303936 e!294312)))

(assert (=> b!502485 (= res!303936 (or (bvsgt (x!47292 lt!228456) #b01111111111111111111111111111110) (bvslt lt!228454 #b00000000000000000000000000000000) (bvsge lt!228454 (size!15923 a!3235)) (bvslt (index!18118 lt!228456) #b00000000000000000000000000000000) (bvsge (index!18118 lt!228456) (size!15923 a!3235)) (not (= lt!228456 (Intermediate!3982 false (index!18118 lt!228456) (x!47292 lt!228456))))))))

(assert (=> b!502485 (= (index!18118 lt!228456) i!1204)))

(declare-fun lt!228458 () Unit!15163)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15163)

(assert (=> b!502485 (= lt!228458 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228454 #b00000000000000000000000000000000 (index!18118 lt!228456) (x!47292 lt!228456) mask!3524))))

(assert (=> b!502485 (and (or (= (select (arr!15559 a!3235) (index!18118 lt!228456)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15559 a!3235) (index!18118 lt!228456)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15559 a!3235) (index!18118 lt!228456)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15559 a!3235) (index!18118 lt!228456)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228452 () Unit!15163)

(assert (=> b!502485 (= lt!228452 e!294307)))

(declare-fun c!59549 () Bool)

(assert (=> b!502485 (= c!59549 (= (select (arr!15559 a!3235) (index!18118 lt!228456)) (select (arr!15559 a!3235) j!176)))))

(assert (=> b!502485 (and (bvslt (x!47292 lt!228456) #b01111111111111111111111111111110) (or (= (select (arr!15559 a!3235) (index!18118 lt!228456)) (select (arr!15559 a!3235) j!176)) (= (select (arr!15559 a!3235) (index!18118 lt!228456)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15559 a!3235) (index!18118 lt!228456)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502486 () Bool)

(declare-fun res!303934 () Bool)

(assert (=> b!502486 (=> res!303934 e!294311)))

(get-info :version)

(assert (=> b!502486 (= res!303934 (or (undefined!4794 lt!228456) (not ((_ is Intermediate!3982) lt!228456))))))

(declare-fun b!502487 () Bool)

(assert (=> b!502487 (= e!294305 false)))

(declare-fun b!502488 () Bool)

(declare-fun res!303944 () Bool)

(assert (=> b!502488 (=> (not res!303944) (not e!294308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502488 (= res!303944 (validKeyInArray!0 k0!2280))))

(declare-fun b!502489 () Bool)

(declare-fun Unit!15166 () Unit!15163)

(assert (=> b!502489 (= e!294307 Unit!15166)))

(declare-fun res!303942 () Bool)

(assert (=> start!45602 (=> (not res!303942) (not e!294308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45602 (= res!303942 (validMask!0 mask!3524))))

(assert (=> start!45602 e!294308))

(assert (=> start!45602 true))

(declare-fun array_inv!11418 (array!32359) Bool)

(assert (=> start!45602 (array_inv!11418 a!3235)))

(declare-fun b!502482 () Bool)

(declare-fun res!303932 () Bool)

(assert (=> b!502482 (=> (not res!303932) (not e!294308))))

(assert (=> b!502482 (= res!303932 (validKeyInArray!0 (select (arr!15559 a!3235) j!176)))))

(assert (= (and start!45602 res!303942) b!502473))

(assert (= (and b!502473 res!303945) b!502482))

(assert (= (and b!502482 res!303932) b!502488))

(assert (= (and b!502488 res!303944) b!502480))

(assert (= (and b!502480 res!303933) b!502483))

(assert (= (and b!502483 res!303939) b!502481))

(assert (= (and b!502481 res!303937) b!502474))

(assert (= (and b!502474 res!303943) b!502477))

(assert (= (and b!502477 res!303938) b!502479))

(assert (= (and b!502477 (not res!303935)) b!502486))

(assert (= (and b!502486 (not res!303934)) b!502485))

(assert (= (and b!502485 c!59549) b!502475))

(assert (= (and b!502485 (not c!59549)) b!502489))

(assert (= (and b!502475 res!303946) b!502487))

(assert (= (and b!502485 (not res!303936)) b!502484))

(assert (= (and b!502484 res!303940) b!502478))

(assert (= (and b!502484 (not res!303941)) b!502476))

(declare-fun m!483643 () Bool)

(assert (=> b!502488 m!483643))

(declare-fun m!483645 () Bool)

(assert (=> b!502483 m!483645))

(declare-fun m!483647 () Bool)

(assert (=> b!502485 m!483647))

(declare-fun m!483649 () Bool)

(assert (=> b!502485 m!483649))

(declare-fun m!483651 () Bool)

(assert (=> b!502485 m!483651))

(declare-fun m!483653 () Bool)

(assert (=> b!502477 m!483653))

(declare-fun m!483655 () Bool)

(assert (=> b!502477 m!483655))

(declare-fun m!483657 () Bool)

(assert (=> b!502477 m!483657))

(assert (=> b!502477 m!483651))

(declare-fun m!483659 () Bool)

(assert (=> b!502477 m!483659))

(assert (=> b!502477 m!483651))

(declare-fun m!483661 () Bool)

(assert (=> b!502477 m!483661))

(declare-fun m!483663 () Bool)

(assert (=> b!502477 m!483663))

(declare-fun m!483665 () Bool)

(assert (=> b!502477 m!483665))

(declare-fun m!483667 () Bool)

(assert (=> b!502477 m!483667))

(assert (=> b!502477 m!483651))

(declare-fun m!483669 () Bool)

(assert (=> start!45602 m!483669))

(declare-fun m!483671 () Bool)

(assert (=> start!45602 m!483671))

(assert (=> b!502479 m!483651))

(assert (=> b!502479 m!483651))

(declare-fun m!483673 () Bool)

(assert (=> b!502479 m!483673))

(declare-fun m!483675 () Bool)

(assert (=> b!502480 m!483675))

(assert (=> b!502482 m!483651))

(assert (=> b!502482 m!483651))

(declare-fun m!483677 () Bool)

(assert (=> b!502482 m!483677))

(declare-fun m!483679 () Bool)

(assert (=> b!502481 m!483679))

(declare-fun m!483681 () Bool)

(assert (=> b!502476 m!483681))

(declare-fun m!483683 () Bool)

(assert (=> b!502475 m!483683))

(assert (=> b!502475 m!483681))

(assert (=> b!502478 m!483651))

(assert (=> b!502478 m!483651))

(declare-fun m!483685 () Bool)

(assert (=> b!502478 m!483685))

(declare-fun m!483687 () Bool)

(assert (=> b!502474 m!483687))

(check-sat (not b!502485) (not b!502488) (not b!502477) (not b!502482) (not b!502475) (not b!502479) (not b!502474) (not start!45602) (not b!502483) (not b!502476) (not b!502478) (not b!502480) (not b!502481))
(check-sat)
