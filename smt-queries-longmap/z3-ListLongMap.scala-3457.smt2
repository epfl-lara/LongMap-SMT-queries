; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48002 () Bool)

(assert start!48002)

(declare-fun b!528609 () Bool)

(declare-fun e!308047 () Bool)

(declare-fun e!308053 () Bool)

(assert (=> b!528609 (= e!308047 e!308053)))

(declare-fun res!324625 () Bool)

(assert (=> b!528609 (=> res!324625 e!308053)))

(declare-fun lt!243538 () (_ BitVec 32))

(declare-datatypes ((array!33496 0))(
  ( (array!33497 (arr!16096 (Array (_ BitVec 32) (_ BitVec 64))) (size!16460 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33496)

(declare-datatypes ((SeekEntryResult!4519 0))(
  ( (MissingZero!4519 (index!20300 (_ BitVec 32))) (Found!4519 (index!20301 (_ BitVec 32))) (Intermediate!4519 (undefined!5331 Bool) (index!20302 (_ BitVec 32)) (x!49420 (_ BitVec 32))) (Undefined!4519) (MissingVacant!4519 (index!20303 (_ BitVec 32))) )
))
(declare-fun lt!243536 () SeekEntryResult!4519)

(assert (=> b!528609 (= res!324625 (or (bvsgt (x!49420 lt!243536) #b01111111111111111111111111111110) (bvslt lt!243538 #b00000000000000000000000000000000) (bvsge lt!243538 (size!16460 a!3235)) (bvslt (index!20302 lt!243536) #b00000000000000000000000000000000) (bvsge (index!20302 lt!243536) (size!16460 a!3235)) (not (= lt!243536 (Intermediate!4519 false (index!20302 lt!243536) (x!49420 lt!243536))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528609 (= (index!20302 lt!243536) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!16687 0))(
  ( (Unit!16688) )
))
(declare-fun lt!243544 () Unit!16687)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16687)

(assert (=> b!528609 (= lt!243544 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243538 #b00000000000000000000000000000000 (index!20302 lt!243536) (x!49420 lt!243536) mask!3524))))

(assert (=> b!528609 (and (or (= (select (arr!16096 a!3235) (index!20302 lt!243536)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16096 a!3235) (index!20302 lt!243536)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16096 a!3235) (index!20302 lt!243536)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16096 a!3235) (index!20302 lt!243536)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243534 () Unit!16687)

(declare-fun e!308049 () Unit!16687)

(assert (=> b!528609 (= lt!243534 e!308049)))

(declare-fun c!62303 () Bool)

(assert (=> b!528609 (= c!62303 (= (select (arr!16096 a!3235) (index!20302 lt!243536)) (select (arr!16096 a!3235) j!176)))))

(assert (=> b!528609 (and (bvslt (x!49420 lt!243536) #b01111111111111111111111111111110) (or (= (select (arr!16096 a!3235) (index!20302 lt!243536)) (select (arr!16096 a!3235) j!176)) (= (select (arr!16096 a!3235) (index!20302 lt!243536)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16096 a!3235) (index!20302 lt!243536)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528610 () Bool)

(declare-fun res!324627 () Bool)

(declare-fun e!308048 () Bool)

(assert (=> b!528610 (=> (not res!324627) (not e!308048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33496 (_ BitVec 32)) Bool)

(assert (=> b!528610 (= res!324627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!324629 () Bool)

(declare-fun e!308052 () Bool)

(assert (=> start!48002 (=> (not res!324629) (not e!308052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48002 (= res!324629 (validMask!0 mask!3524))))

(assert (=> start!48002 e!308052))

(assert (=> start!48002 true))

(declare-fun array_inv!11955 (array!33496) Bool)

(assert (=> start!48002 (array_inv!11955 a!3235)))

(declare-fun b!528611 () Bool)

(declare-fun res!324620 () Bool)

(assert (=> b!528611 (=> (not res!324620) (not e!308052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528611 (= res!324620 (validKeyInArray!0 k0!2280))))

(declare-fun b!528612 () Bool)

(declare-fun e!308050 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33496 (_ BitVec 32)) SeekEntryResult!4519)

(assert (=> b!528612 (= e!308050 (= (seekEntryOrOpen!0 (select (arr!16096 a!3235) j!176) a!3235 mask!3524) (Found!4519 j!176)))))

(declare-fun b!528613 () Bool)

(declare-fun res!324632 () Bool)

(assert (=> b!528613 (=> res!324632 e!308053)))

(declare-fun lt!243533 () SeekEntryResult!4519)

(declare-fun lt!243532 () array!33496)

(declare-fun lt!243542 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33496 (_ BitVec 32)) SeekEntryResult!4519)

(assert (=> b!528613 (= res!324632 (not (= lt!243533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243538 lt!243542 lt!243532 mask!3524))))))

(declare-fun b!528614 () Bool)

(declare-fun res!324626 () Bool)

(assert (=> b!528614 (=> (not res!324626) (not e!308052))))

(assert (=> b!528614 (= res!324626 (validKeyInArray!0 (select (arr!16096 a!3235) j!176)))))

(declare-fun b!528615 () Bool)

(declare-fun Unit!16689 () Unit!16687)

(assert (=> b!528615 (= e!308049 Unit!16689)))

(declare-fun b!528616 () Bool)

(declare-fun res!324623 () Bool)

(assert (=> b!528616 (=> res!324623 e!308053)))

(declare-fun e!308051 () Bool)

(assert (=> b!528616 (= res!324623 e!308051)))

(declare-fun res!324634 () Bool)

(assert (=> b!528616 (=> (not res!324634) (not e!308051))))

(assert (=> b!528616 (= res!324634 (bvsgt #b00000000000000000000000000000000 (x!49420 lt!243536)))))

(declare-fun b!528617 () Bool)

(assert (=> b!528617 (= e!308048 (not e!308047))))

(declare-fun res!324622 () Bool)

(assert (=> b!528617 (=> res!324622 e!308047)))

(get-info :version)

(assert (=> b!528617 (= res!324622 (or (= lt!243536 lt!243533) (undefined!5331 lt!243536) (not ((_ is Intermediate!4519) lt!243536))))))

(declare-fun lt!243540 () (_ BitVec 32))

(assert (=> b!528617 (= lt!243533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243540 lt!243542 lt!243532 mask!3524))))

(assert (=> b!528617 (= lt!243536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243538 (select (arr!16096 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528617 (= lt!243540 (toIndex!0 lt!243542 mask!3524))))

(assert (=> b!528617 (= lt!243542 (select (store (arr!16096 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528617 (= lt!243538 (toIndex!0 (select (arr!16096 a!3235) j!176) mask!3524))))

(assert (=> b!528617 (= lt!243532 (array!33497 (store (arr!16096 a!3235) i!1204 k0!2280) (size!16460 a!3235)))))

(declare-fun lt!243535 () SeekEntryResult!4519)

(assert (=> b!528617 (= lt!243535 (Found!4519 j!176))))

(assert (=> b!528617 e!308050))

(declare-fun res!324631 () Bool)

(assert (=> b!528617 (=> (not res!324631) (not e!308050))))

(assert (=> b!528617 (= res!324631 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243543 () Unit!16687)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16687)

(assert (=> b!528617 (= lt!243543 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528618 () Bool)

(declare-fun res!324624 () Bool)

(assert (=> b!528618 (=> (not res!324624) (not e!308052))))

(assert (=> b!528618 (= res!324624 (and (= (size!16460 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16460 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16460 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528619 () Bool)

(declare-fun e!308055 () Bool)

(assert (=> b!528619 (= e!308055 false)))

(declare-fun b!528620 () Bool)

(declare-fun res!324621 () Bool)

(assert (=> b!528620 (=> (not res!324621) (not e!308048))))

(declare-datatypes ((List!10161 0))(
  ( (Nil!10158) (Cons!10157 (h!11094 (_ BitVec 64)) (t!16381 List!10161)) )
))
(declare-fun arrayNoDuplicates!0 (array!33496 (_ BitVec 32) List!10161) Bool)

(assert (=> b!528620 (= res!324621 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10158))))

(declare-fun b!528621 () Bool)

(declare-fun res!324633 () Bool)

(assert (=> b!528621 (=> (not res!324633) (not e!308052))))

(declare-fun arrayContainsKey!0 (array!33496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528621 (= res!324633 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528622 () Bool)

(assert (=> b!528622 (= e!308052 e!308048)))

(declare-fun res!324628 () Bool)

(assert (=> b!528622 (=> (not res!324628) (not e!308048))))

(declare-fun lt!243539 () SeekEntryResult!4519)

(assert (=> b!528622 (= res!324628 (or (= lt!243539 (MissingZero!4519 i!1204)) (= lt!243539 (MissingVacant!4519 i!1204))))))

(assert (=> b!528622 (= lt!243539 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528623 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33496 (_ BitVec 32)) SeekEntryResult!4519)

(assert (=> b!528623 (= e!308051 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243538 (index!20302 lt!243536) (select (arr!16096 a!3235) j!176) a!3235 mask!3524) lt!243535)))))

(declare-fun b!528624 () Bool)

(assert (=> b!528624 (= e!308053 true)))

(assert (=> b!528624 (= (seekEntryOrOpen!0 lt!243542 lt!243532 mask!3524) lt!243535)))

(declare-fun lt!243541 () Unit!16687)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16687)

(assert (=> b!528624 (= lt!243541 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243538 #b00000000000000000000000000000000 (index!20302 lt!243536) (x!49420 lt!243536) mask!3524))))

(declare-fun b!528625 () Bool)

(declare-fun Unit!16690 () Unit!16687)

(assert (=> b!528625 (= e!308049 Unit!16690)))

(declare-fun lt!243537 () Unit!16687)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16687)

(assert (=> b!528625 (= lt!243537 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243538 #b00000000000000000000000000000000 (index!20302 lt!243536) (x!49420 lt!243536) mask!3524))))

(declare-fun res!324630 () Bool)

(assert (=> b!528625 (= res!324630 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243538 lt!243542 lt!243532 mask!3524) (Intermediate!4519 false (index!20302 lt!243536) (x!49420 lt!243536))))))

(assert (=> b!528625 (=> (not res!324630) (not e!308055))))

(assert (=> b!528625 e!308055))

(assert (= (and start!48002 res!324629) b!528618))

(assert (= (and b!528618 res!324624) b!528614))

(assert (= (and b!528614 res!324626) b!528611))

(assert (= (and b!528611 res!324620) b!528621))

(assert (= (and b!528621 res!324633) b!528622))

(assert (= (and b!528622 res!324628) b!528610))

(assert (= (and b!528610 res!324627) b!528620))

(assert (= (and b!528620 res!324621) b!528617))

(assert (= (and b!528617 res!324631) b!528612))

(assert (= (and b!528617 (not res!324622)) b!528609))

(assert (= (and b!528609 c!62303) b!528625))

(assert (= (and b!528609 (not c!62303)) b!528615))

(assert (= (and b!528625 res!324630) b!528619))

(assert (= (and b!528609 (not res!324625)) b!528616))

(assert (= (and b!528616 res!324634) b!528623))

(assert (= (and b!528616 (not res!324623)) b!528613))

(assert (= (and b!528613 (not res!324632)) b!528624))

(declare-fun m!509389 () Bool)

(assert (=> b!528617 m!509389))

(declare-fun m!509391 () Bool)

(assert (=> b!528617 m!509391))

(declare-fun m!509393 () Bool)

(assert (=> b!528617 m!509393))

(declare-fun m!509395 () Bool)

(assert (=> b!528617 m!509395))

(declare-fun m!509397 () Bool)

(assert (=> b!528617 m!509397))

(declare-fun m!509399 () Bool)

(assert (=> b!528617 m!509399))

(declare-fun m!509401 () Bool)

(assert (=> b!528617 m!509401))

(assert (=> b!528617 m!509399))

(declare-fun m!509403 () Bool)

(assert (=> b!528617 m!509403))

(assert (=> b!528617 m!509399))

(declare-fun m!509405 () Bool)

(assert (=> b!528617 m!509405))

(declare-fun m!509407 () Bool)

(assert (=> b!528625 m!509407))

(declare-fun m!509409 () Bool)

(assert (=> b!528625 m!509409))

(declare-fun m!509411 () Bool)

(assert (=> b!528621 m!509411))

(declare-fun m!509413 () Bool)

(assert (=> b!528622 m!509413))

(declare-fun m!509415 () Bool)

(assert (=> b!528620 m!509415))

(declare-fun m!509417 () Bool)

(assert (=> b!528609 m!509417))

(declare-fun m!509419 () Bool)

(assert (=> b!528609 m!509419))

(assert (=> b!528609 m!509399))

(assert (=> b!528612 m!509399))

(assert (=> b!528612 m!509399))

(declare-fun m!509421 () Bool)

(assert (=> b!528612 m!509421))

(assert (=> b!528613 m!509409))

(declare-fun m!509423 () Bool)

(assert (=> b!528611 m!509423))

(assert (=> b!528623 m!509399))

(assert (=> b!528623 m!509399))

(declare-fun m!509425 () Bool)

(assert (=> b!528623 m!509425))

(assert (=> b!528614 m!509399))

(assert (=> b!528614 m!509399))

(declare-fun m!509427 () Bool)

(assert (=> b!528614 m!509427))

(declare-fun m!509429 () Bool)

(assert (=> b!528624 m!509429))

(declare-fun m!509431 () Bool)

(assert (=> b!528624 m!509431))

(declare-fun m!509433 () Bool)

(assert (=> b!528610 m!509433))

(declare-fun m!509435 () Bool)

(assert (=> start!48002 m!509435))

(declare-fun m!509437 () Bool)

(assert (=> start!48002 m!509437))

(check-sat (not b!528622) (not b!528614) (not b!528623) (not start!48002) (not b!528609) (not b!528611) (not b!528625) (not b!528610) (not b!528617) (not b!528621) (not b!528612) (not b!528624) (not b!528613) (not b!528620))
(check-sat)
