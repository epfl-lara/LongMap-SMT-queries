; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65982 () Bool)

(assert start!65982)

(declare-datatypes ((array!42025 0))(
  ( (array!42026 (arr!20122 (Array (_ BitVec 32) (_ BitVec 64))) (size!20542 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42025)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7678 0))(
  ( (MissingZero!7678 (index!33080 (_ BitVec 32))) (Found!7678 (index!33081 (_ BitVec 32))) (Intermediate!7678 (undefined!8490 Bool) (index!33082 (_ BitVec 32)) (x!64128 (_ BitVec 32))) (Undefined!7678) (MissingVacant!7678 (index!33083 (_ BitVec 32))) )
))
(declare-fun lt!338469 () SeekEntryResult!7678)

(declare-fun b!759594 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!423547 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42025 (_ BitVec 32)) SeekEntryResult!7678)

(assert (=> b!759594 (= e!423547 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20122 a!3186) j!159) a!3186 mask!3328) lt!338469))))

(declare-fun b!759595 () Bool)

(declare-fun e!423558 () Bool)

(declare-fun e!423550 () Bool)

(assert (=> b!759595 (= e!423558 e!423550)))

(declare-fun res!513742 () Bool)

(assert (=> b!759595 (=> (not res!513742) (not e!423550))))

(declare-fun lt!338472 () SeekEntryResult!7678)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759595 (= res!513742 (or (= lt!338472 (MissingZero!7678 i!1173)) (= lt!338472 (MissingVacant!7678 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42025 (_ BitVec 32)) SeekEntryResult!7678)

(assert (=> b!759595 (= lt!338472 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759596 () Bool)

(declare-fun e!423548 () Bool)

(declare-fun e!423556 () Bool)

(assert (=> b!759596 (= e!423548 e!423556)))

(declare-fun res!513747 () Bool)

(assert (=> b!759596 (=> (not res!513747) (not e!423556))))

(declare-fun lt!338463 () SeekEntryResult!7678)

(declare-fun lt!338470 () SeekEntryResult!7678)

(assert (=> b!759596 (= res!513747 (= lt!338463 lt!338470))))

(declare-fun lt!338467 () (_ BitVec 64))

(declare-fun lt!338468 () array!42025)

(assert (=> b!759596 (= lt!338470 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338467 lt!338468 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759596 (= lt!338463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338467 mask!3328) lt!338467 lt!338468 mask!3328))))

(assert (=> b!759596 (= lt!338467 (select (store (arr!20122 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759596 (= lt!338468 (array!42026 (store (arr!20122 a!3186) i!1173 k0!2102) (size!20542 a!3186)))))

(declare-fun b!759597 () Bool)

(declare-fun e!423552 () Bool)

(declare-fun e!423553 () Bool)

(assert (=> b!759597 (= e!423552 e!423553)))

(declare-fun res!513733 () Bool)

(assert (=> b!759597 (=> res!513733 e!423553)))

(declare-fun lt!338465 () SeekEntryResult!7678)

(declare-fun lt!338458 () SeekEntryResult!7678)

(assert (=> b!759597 (= res!513733 (not (= lt!338465 lt!338458)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42025 (_ BitVec 32)) SeekEntryResult!7678)

(assert (=> b!759597 (= lt!338465 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20122 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!759598 () Bool)

(declare-fun res!513744 () Bool)

(assert (=> b!759598 (=> (not res!513744) (not e!423550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42025 (_ BitVec 32)) Bool)

(assert (=> b!759598 (= res!513744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759599 () Bool)

(declare-datatypes ((Unit!26269 0))(
  ( (Unit!26270) )
))
(declare-fun e!423554 () Unit!26269)

(declare-fun Unit!26271 () Unit!26269)

(assert (=> b!759599 (= e!423554 Unit!26271)))

(assert (=> b!759599 false))

(declare-fun b!759600 () Bool)

(declare-fun e!423546 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759600 (= e!423546 (validKeyInArray!0 lt!338467))))

(declare-fun b!759601 () Bool)

(declare-fun res!513736 () Bool)

(assert (=> b!759601 (=> (not res!513736) (not e!423558))))

(declare-fun arrayContainsKey!0 (array!42025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759601 (= res!513736 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!513738 () Bool)

(assert (=> start!65982 (=> (not res!513738) (not e!423558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65982 (= res!513738 (validMask!0 mask!3328))))

(assert (=> start!65982 e!423558))

(assert (=> start!65982 true))

(declare-fun array_inv!15981 (array!42025) Bool)

(assert (=> start!65982 (array_inv!15981 a!3186)))

(declare-fun b!759602 () Bool)

(declare-fun res!513739 () Bool)

(assert (=> b!759602 (=> (not res!513739) (not e!423548))))

(assert (=> b!759602 (= res!513739 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20122 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759603 () Bool)

(assert (=> b!759603 (= e!423550 e!423548)))

(declare-fun res!513745 () Bool)

(assert (=> b!759603 (=> (not res!513745) (not e!423548))))

(assert (=> b!759603 (= res!513745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20122 a!3186) j!159) mask!3328) (select (arr!20122 a!3186) j!159) a!3186 mask!3328) lt!338469))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759603 (= lt!338469 (Intermediate!7678 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759604 () Bool)

(declare-fun e!423557 () Bool)

(declare-fun e!423549 () Bool)

(assert (=> b!759604 (= e!423557 e!423549)))

(declare-fun res!513734 () Bool)

(assert (=> b!759604 (=> res!513734 e!423549)))

(assert (=> b!759604 (= res!513734 (or (not (= (select (arr!20122 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338461 () SeekEntryResult!7678)

(declare-fun lt!338460 () SeekEntryResult!7678)

(declare-fun lt!338459 () SeekEntryResult!7678)

(assert (=> b!759604 (and (= lt!338461 lt!338459) (= lt!338460 lt!338465))))

(assert (=> b!759604 (= lt!338459 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338467 lt!338468 mask!3328))))

(assert (=> b!759604 (= lt!338461 (seekEntryOrOpen!0 lt!338467 lt!338468 mask!3328))))

(declare-fun lt!338471 () (_ BitVec 64))

(assert (=> b!759604 (= lt!338471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338466 () Unit!26269)

(assert (=> b!759604 (= lt!338466 e!423554)))

(declare-fun c!83315 () Bool)

(assert (=> b!759604 (= c!83315 (= lt!338471 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!759605 () Bool)

(assert (=> b!759605 (= e!423547 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20122 a!3186) j!159) a!3186 mask!3328) (Found!7678 j!159)))))

(declare-fun b!759606 () Bool)

(assert (=> b!759606 (= e!423553 e!423557)))

(declare-fun res!513740 () Bool)

(assert (=> b!759606 (=> res!513740 e!423557)))

(assert (=> b!759606 (= res!513740 (= lt!338471 lt!338467))))

(assert (=> b!759606 (= lt!338471 (select (store (arr!20122 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun e!423555 () Bool)

(declare-fun b!759607 () Bool)

(assert (=> b!759607 (= e!423555 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20122 a!3186) j!159) a!3186 mask!3328) lt!338458))))

(declare-fun b!759608 () Bool)

(assert (=> b!759608 (= e!423556 (not e!423552))))

(declare-fun res!513750 () Bool)

(assert (=> b!759608 (=> res!513750 e!423552)))

(get-info :version)

(assert (=> b!759608 (= res!513750 (or (not ((_ is Intermediate!7678) lt!338470)) (bvslt x!1131 (x!64128 lt!338470)) (not (= x!1131 (x!64128 lt!338470))) (not (= index!1321 (index!33082 lt!338470)))))))

(assert (=> b!759608 e!423555))

(declare-fun res!513741 () Bool)

(assert (=> b!759608 (=> (not res!513741) (not e!423555))))

(assert (=> b!759608 (= res!513741 (= lt!338460 lt!338458))))

(assert (=> b!759608 (= lt!338458 (Found!7678 j!159))))

(assert (=> b!759608 (= lt!338460 (seekEntryOrOpen!0 (select (arr!20122 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!759608 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338464 () Unit!26269)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26269)

(assert (=> b!759608 (= lt!338464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759609 () Bool)

(declare-fun res!513746 () Bool)

(assert (=> b!759609 (=> (not res!513746) (not e!423548))))

(assert (=> b!759609 (= res!513746 e!423547)))

(declare-fun c!83314 () Bool)

(assert (=> b!759609 (= c!83314 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759610 () Bool)

(declare-fun res!513735 () Bool)

(assert (=> b!759610 (=> (not res!513735) (not e!423550))))

(assert (=> b!759610 (= res!513735 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20542 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20542 a!3186))))))

(declare-fun b!759611 () Bool)

(declare-fun res!513751 () Bool)

(assert (=> b!759611 (=> (not res!513751) (not e!423558))))

(assert (=> b!759611 (= res!513751 (and (= (size!20542 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20542 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20542 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759612 () Bool)

(assert (=> b!759612 (= e!423549 e!423546)))

(declare-fun res!513743 () Bool)

(assert (=> b!759612 (=> res!513743 e!423546)))

(assert (=> b!759612 (= res!513743 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!759612 (= lt!338459 lt!338465)))

(declare-fun lt!338462 () Unit!26269)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26269)

(assert (=> b!759612 (= lt!338462 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!759613 () Bool)

(declare-fun res!513748 () Bool)

(assert (=> b!759613 (=> (not res!513748) (not e!423558))))

(assert (=> b!759613 (= res!513748 (validKeyInArray!0 (select (arr!20122 a!3186) j!159)))))

(declare-fun b!759614 () Bool)

(declare-fun Unit!26272 () Unit!26269)

(assert (=> b!759614 (= e!423554 Unit!26272)))

(declare-fun b!759615 () Bool)

(declare-fun res!513737 () Bool)

(assert (=> b!759615 (=> (not res!513737) (not e!423550))))

(declare-datatypes ((List!14031 0))(
  ( (Nil!14028) (Cons!14027 (h!15105 (_ BitVec 64)) (t!20338 List!14031)) )
))
(declare-fun arrayNoDuplicates!0 (array!42025 (_ BitVec 32) List!14031) Bool)

(assert (=> b!759615 (= res!513737 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14028))))

(declare-fun b!759616 () Bool)

(declare-fun res!513749 () Bool)

(assert (=> b!759616 (=> (not res!513749) (not e!423558))))

(assert (=> b!759616 (= res!513749 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65982 res!513738) b!759611))

(assert (= (and b!759611 res!513751) b!759613))

(assert (= (and b!759613 res!513748) b!759616))

(assert (= (and b!759616 res!513749) b!759601))

(assert (= (and b!759601 res!513736) b!759595))

(assert (= (and b!759595 res!513742) b!759598))

(assert (= (and b!759598 res!513744) b!759615))

(assert (= (and b!759615 res!513737) b!759610))

(assert (= (and b!759610 res!513735) b!759603))

(assert (= (and b!759603 res!513745) b!759602))

(assert (= (and b!759602 res!513739) b!759609))

(assert (= (and b!759609 c!83314) b!759594))

(assert (= (and b!759609 (not c!83314)) b!759605))

(assert (= (and b!759609 res!513746) b!759596))

(assert (= (and b!759596 res!513747) b!759608))

(assert (= (and b!759608 res!513741) b!759607))

(assert (= (and b!759608 (not res!513750)) b!759597))

(assert (= (and b!759597 (not res!513733)) b!759606))

(assert (= (and b!759606 (not res!513740)) b!759604))

(assert (= (and b!759604 c!83315) b!759599))

(assert (= (and b!759604 (not c!83315)) b!759614))

(assert (= (and b!759604 (not res!513734)) b!759612))

(assert (= (and b!759612 (not res!513743)) b!759600))

(declare-fun m!707427 () Bool)

(assert (=> b!759594 m!707427))

(assert (=> b!759594 m!707427))

(declare-fun m!707429 () Bool)

(assert (=> b!759594 m!707429))

(declare-fun m!707431 () Bool)

(assert (=> b!759604 m!707431))

(declare-fun m!707433 () Bool)

(assert (=> b!759604 m!707433))

(declare-fun m!707435 () Bool)

(assert (=> b!759604 m!707435))

(declare-fun m!707437 () Bool)

(assert (=> b!759596 m!707437))

(declare-fun m!707439 () Bool)

(assert (=> b!759596 m!707439))

(declare-fun m!707441 () Bool)

(assert (=> b!759596 m!707441))

(declare-fun m!707443 () Bool)

(assert (=> b!759596 m!707443))

(declare-fun m!707445 () Bool)

(assert (=> b!759596 m!707445))

(assert (=> b!759596 m!707443))

(declare-fun m!707447 () Bool)

(assert (=> b!759601 m!707447))

(declare-fun m!707449 () Bool)

(assert (=> b!759598 m!707449))

(assert (=> b!759605 m!707427))

(assert (=> b!759605 m!707427))

(declare-fun m!707451 () Bool)

(assert (=> b!759605 m!707451))

(assert (=> b!759597 m!707427))

(assert (=> b!759597 m!707427))

(assert (=> b!759597 m!707451))

(declare-fun m!707453 () Bool)

(assert (=> b!759616 m!707453))

(assert (=> b!759613 m!707427))

(assert (=> b!759613 m!707427))

(declare-fun m!707455 () Bool)

(assert (=> b!759613 m!707455))

(declare-fun m!707457 () Bool)

(assert (=> b!759612 m!707457))

(assert (=> b!759607 m!707427))

(assert (=> b!759607 m!707427))

(declare-fun m!707459 () Bool)

(assert (=> b!759607 m!707459))

(assert (=> b!759608 m!707427))

(assert (=> b!759608 m!707427))

(declare-fun m!707461 () Bool)

(assert (=> b!759608 m!707461))

(declare-fun m!707463 () Bool)

(assert (=> b!759608 m!707463))

(declare-fun m!707465 () Bool)

(assert (=> b!759608 m!707465))

(declare-fun m!707467 () Bool)

(assert (=> b!759600 m!707467))

(assert (=> b!759606 m!707439))

(declare-fun m!707469 () Bool)

(assert (=> b!759606 m!707469))

(declare-fun m!707471 () Bool)

(assert (=> b!759602 m!707471))

(assert (=> b!759603 m!707427))

(assert (=> b!759603 m!707427))

(declare-fun m!707473 () Bool)

(assert (=> b!759603 m!707473))

(assert (=> b!759603 m!707473))

(assert (=> b!759603 m!707427))

(declare-fun m!707475 () Bool)

(assert (=> b!759603 m!707475))

(declare-fun m!707477 () Bool)

(assert (=> start!65982 m!707477))

(declare-fun m!707479 () Bool)

(assert (=> start!65982 m!707479))

(declare-fun m!707481 () Bool)

(assert (=> b!759595 m!707481))

(declare-fun m!707483 () Bool)

(assert (=> b!759615 m!707483))

(check-sat (not start!65982) (not b!759596) (not b!759604) (not b!759608) (not b!759594) (not b!759595) (not b!759605) (not b!759615) (not b!759612) (not b!759607) (not b!759601) (not b!759603) (not b!759616) (not b!759613) (not b!759597) (not b!759600) (not b!759598))
(check-sat)
