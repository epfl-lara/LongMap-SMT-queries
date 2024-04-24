; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45680 () Bool)

(assert start!45680)

(declare-fun b!504462 () Bool)

(declare-fun res!305687 () Bool)

(declare-fun e!295362 () Bool)

(assert (=> b!504462 (=> (not res!305687) (not e!295362))))

(declare-datatypes ((array!32437 0))(
  ( (array!32438 (arr!15598 (Array (_ BitVec 32) (_ BitVec 64))) (size!15962 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32437)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504462 (= res!305687 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504463 () Bool)

(declare-fun e!295359 () Bool)

(declare-fun e!295358 () Bool)

(assert (=> b!504463 (= e!295359 e!295358)))

(declare-fun res!305696 () Bool)

(assert (=> b!504463 (=> res!305696 e!295358)))

(declare-datatypes ((SeekEntryResult!4021 0))(
  ( (MissingZero!4021 (index!18272 (_ BitVec 32))) (Found!4021 (index!18273 (_ BitVec 32))) (Intermediate!4021 (undefined!4833 Bool) (index!18274 (_ BitVec 32)) (x!47435 (_ BitVec 32))) (Undefined!4021) (MissingVacant!4021 (index!18275 (_ BitVec 32))) )
))
(declare-fun lt!229740 () SeekEntryResult!4021)

(declare-fun lt!229746 () (_ BitVec 32))

(assert (=> b!504463 (= res!305696 (or (bvsgt (x!47435 lt!229740) #b01111111111111111111111111111110) (bvslt lt!229746 #b00000000000000000000000000000000) (bvsge lt!229746 (size!15962 a!3235)) (bvslt (index!18274 lt!229740) #b00000000000000000000000000000000) (bvsge (index!18274 lt!229740) (size!15962 a!3235)) (not (= lt!229740 (Intermediate!4021 false (index!18274 lt!229740) (x!47435 lt!229740))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504463 (= (index!18274 lt!229740) i!1204)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!15319 0))(
  ( (Unit!15320) )
))
(declare-fun lt!229738 () Unit!15319)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15319)

(assert (=> b!504463 (= lt!229738 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229746 #b00000000000000000000000000000000 (index!18274 lt!229740) (x!47435 lt!229740) mask!3524))))

(assert (=> b!504463 (and (or (= (select (arr!15598 a!3235) (index!18274 lt!229740)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15598 a!3235) (index!18274 lt!229740)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15598 a!3235) (index!18274 lt!229740)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15598 a!3235) (index!18274 lt!229740)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229745 () Unit!15319)

(declare-fun e!295365 () Unit!15319)

(assert (=> b!504463 (= lt!229745 e!295365)))

(declare-fun c!59666 () Bool)

(assert (=> b!504463 (= c!59666 (= (select (arr!15598 a!3235) (index!18274 lt!229740)) (select (arr!15598 a!3235) j!176)))))

(assert (=> b!504463 (and (bvslt (x!47435 lt!229740) #b01111111111111111111111111111110) (or (= (select (arr!15598 a!3235) (index!18274 lt!229740)) (select (arr!15598 a!3235) j!176)) (= (select (arr!15598 a!3235) (index!18274 lt!229740)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15598 a!3235) (index!18274 lt!229740)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!295361 () Bool)

(declare-fun b!504464 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32437 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!504464 (= e!295361 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229746 (index!18274 lt!229740) (select (arr!15598 a!3235) j!176) a!3235 mask!3524) (Found!4021 j!176))))))

(declare-fun b!504465 () Bool)

(declare-fun res!305700 () Bool)

(assert (=> b!504465 (=> res!305700 e!295359)))

(get-info :version)

(assert (=> b!504465 (= res!305700 (or (undefined!4833 lt!229740) (not ((_ is Intermediate!4021) lt!229740))))))

(declare-fun b!504467 () Bool)

(declare-fun res!305691 () Bool)

(assert (=> b!504467 (=> (not res!305691) (not e!295362))))

(assert (=> b!504467 (= res!305691 (and (= (size!15962 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15962 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15962 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504468 () Bool)

(declare-fun res!305688 () Bool)

(assert (=> b!504468 (=> (not res!305688) (not e!295362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504468 (= res!305688 (validKeyInArray!0 (select (arr!15598 a!3235) j!176)))))

(declare-fun b!504469 () Bool)

(declare-fun res!305694 () Bool)

(assert (=> b!504469 (=> res!305694 e!295358)))

(assert (=> b!504469 (= res!305694 e!295361)))

(declare-fun res!305699 () Bool)

(assert (=> b!504469 (=> (not res!305699) (not e!295361))))

(assert (=> b!504469 (= res!305699 (bvsgt #b00000000000000000000000000000000 (x!47435 lt!229740)))))

(declare-fun b!504470 () Bool)

(declare-fun res!305690 () Bool)

(declare-fun e!295363 () Bool)

(assert (=> b!504470 (=> (not res!305690) (not e!295363))))

(declare-datatypes ((List!9663 0))(
  ( (Nil!9660) (Cons!9659 (h!10536 (_ BitVec 64)) (t!15883 List!9663)) )
))
(declare-fun arrayNoDuplicates!0 (array!32437 (_ BitVec 32) List!9663) Bool)

(assert (=> b!504470 (= res!305690 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9660))))

(declare-fun res!305689 () Bool)

(assert (=> start!45680 (=> (not res!305689) (not e!295362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45680 (= res!305689 (validMask!0 mask!3524))))

(assert (=> start!45680 e!295362))

(assert (=> start!45680 true))

(declare-fun array_inv!11457 (array!32437) Bool)

(assert (=> start!45680 (array_inv!11457 a!3235)))

(declare-fun b!504466 () Bool)

(declare-fun res!305693 () Bool)

(assert (=> b!504466 (=> (not res!305693) (not e!295363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32437 (_ BitVec 32)) Bool)

(assert (=> b!504466 (= res!305693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!295360 () Bool)

(declare-fun b!504471 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32437 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!504471 (= e!295360 (= (seekEntryOrOpen!0 (select (arr!15598 a!3235) j!176) a!3235 mask!3524) (Found!4021 j!176)))))

(declare-fun b!504472 () Bool)

(assert (=> b!504472 (= e!295363 (not e!295359))))

(declare-fun res!305697 () Bool)

(assert (=> b!504472 (=> res!305697 e!295359)))

(declare-fun lt!229743 () array!32437)

(declare-fun lt!229744 () (_ BitVec 32))

(declare-fun lt!229737 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32437 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!504472 (= res!305697 (= lt!229740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229744 lt!229737 lt!229743 mask!3524)))))

(assert (=> b!504472 (= lt!229740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229746 (select (arr!15598 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504472 (= lt!229744 (toIndex!0 lt!229737 mask!3524))))

(assert (=> b!504472 (= lt!229737 (select (store (arr!15598 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504472 (= lt!229746 (toIndex!0 (select (arr!15598 a!3235) j!176) mask!3524))))

(assert (=> b!504472 (= lt!229743 (array!32438 (store (arr!15598 a!3235) i!1204 k0!2280) (size!15962 a!3235)))))

(assert (=> b!504472 e!295360))

(declare-fun res!305698 () Bool)

(assert (=> b!504472 (=> (not res!305698) (not e!295360))))

(assert (=> b!504472 (= res!305698 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229741 () Unit!15319)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15319)

(assert (=> b!504472 (= lt!229741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504473 () Bool)

(declare-fun e!295364 () Bool)

(assert (=> b!504473 (= e!295364 false)))

(declare-fun b!504474 () Bool)

(assert (=> b!504474 (= e!295358 true)))

(declare-fun lt!229747 () SeekEntryResult!4021)

(assert (=> b!504474 (= lt!229747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229746 lt!229737 lt!229743 mask!3524))))

(declare-fun b!504475 () Bool)

(declare-fun Unit!15321 () Unit!15319)

(assert (=> b!504475 (= e!295365 Unit!15321)))

(declare-fun b!504476 () Bool)

(declare-fun res!305692 () Bool)

(assert (=> b!504476 (=> (not res!305692) (not e!295362))))

(assert (=> b!504476 (= res!305692 (validKeyInArray!0 k0!2280))))

(declare-fun b!504477 () Bool)

(assert (=> b!504477 (= e!295362 e!295363)))

(declare-fun res!305695 () Bool)

(assert (=> b!504477 (=> (not res!305695) (not e!295363))))

(declare-fun lt!229742 () SeekEntryResult!4021)

(assert (=> b!504477 (= res!305695 (or (= lt!229742 (MissingZero!4021 i!1204)) (= lt!229742 (MissingVacant!4021 i!1204))))))

(assert (=> b!504477 (= lt!229742 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504478 () Bool)

(declare-fun Unit!15322 () Unit!15319)

(assert (=> b!504478 (= e!295365 Unit!15322)))

(declare-fun lt!229739 () Unit!15319)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15319)

(assert (=> b!504478 (= lt!229739 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229746 #b00000000000000000000000000000000 (index!18274 lt!229740) (x!47435 lt!229740) mask!3524))))

(declare-fun res!305701 () Bool)

(assert (=> b!504478 (= res!305701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229746 lt!229737 lt!229743 mask!3524) (Intermediate!4021 false (index!18274 lt!229740) (x!47435 lt!229740))))))

(assert (=> b!504478 (=> (not res!305701) (not e!295364))))

(assert (=> b!504478 e!295364))

(assert (= (and start!45680 res!305689) b!504467))

(assert (= (and b!504467 res!305691) b!504468))

(assert (= (and b!504468 res!305688) b!504476))

(assert (= (and b!504476 res!305692) b!504462))

(assert (= (and b!504462 res!305687) b!504477))

(assert (= (and b!504477 res!305695) b!504466))

(assert (= (and b!504466 res!305693) b!504470))

(assert (= (and b!504470 res!305690) b!504472))

(assert (= (and b!504472 res!305698) b!504471))

(assert (= (and b!504472 (not res!305697)) b!504465))

(assert (= (and b!504465 (not res!305700)) b!504463))

(assert (= (and b!504463 c!59666) b!504478))

(assert (= (and b!504463 (not c!59666)) b!504475))

(assert (= (and b!504478 res!305701) b!504473))

(assert (= (and b!504463 (not res!305696)) b!504469))

(assert (= (and b!504469 res!305699) b!504464))

(assert (= (and b!504469 (not res!305694)) b!504474))

(declare-fun m!485437 () Bool)

(assert (=> b!504476 m!485437))

(declare-fun m!485439 () Bool)

(assert (=> b!504474 m!485439))

(declare-fun m!485441 () Bool)

(assert (=> b!504462 m!485441))

(declare-fun m!485443 () Bool)

(assert (=> b!504463 m!485443))

(declare-fun m!485445 () Bool)

(assert (=> b!504463 m!485445))

(declare-fun m!485447 () Bool)

(assert (=> b!504463 m!485447))

(assert (=> b!504468 m!485447))

(assert (=> b!504468 m!485447))

(declare-fun m!485449 () Bool)

(assert (=> b!504468 m!485449))

(assert (=> b!504464 m!485447))

(assert (=> b!504464 m!485447))

(declare-fun m!485451 () Bool)

(assert (=> b!504464 m!485451))

(declare-fun m!485453 () Bool)

(assert (=> b!504470 m!485453))

(declare-fun m!485455 () Bool)

(assert (=> b!504466 m!485455))

(declare-fun m!485457 () Bool)

(assert (=> b!504477 m!485457))

(assert (=> b!504471 m!485447))

(assert (=> b!504471 m!485447))

(declare-fun m!485459 () Bool)

(assert (=> b!504471 m!485459))

(declare-fun m!485461 () Bool)

(assert (=> b!504478 m!485461))

(assert (=> b!504478 m!485439))

(declare-fun m!485463 () Bool)

(assert (=> b!504472 m!485463))

(declare-fun m!485465 () Bool)

(assert (=> b!504472 m!485465))

(declare-fun m!485467 () Bool)

(assert (=> b!504472 m!485467))

(declare-fun m!485469 () Bool)

(assert (=> b!504472 m!485469))

(assert (=> b!504472 m!485447))

(declare-fun m!485471 () Bool)

(assert (=> b!504472 m!485471))

(assert (=> b!504472 m!485447))

(declare-fun m!485473 () Bool)

(assert (=> b!504472 m!485473))

(assert (=> b!504472 m!485447))

(declare-fun m!485475 () Bool)

(assert (=> b!504472 m!485475))

(declare-fun m!485477 () Bool)

(assert (=> b!504472 m!485477))

(declare-fun m!485479 () Bool)

(assert (=> start!45680 m!485479))

(declare-fun m!485481 () Bool)

(assert (=> start!45680 m!485481))

(check-sat (not b!504466) (not b!504477) (not start!45680) (not b!504463) (not b!504478) (not b!504471) (not b!504472) (not b!504462) (not b!504470) (not b!504468) (not b!504474) (not b!504476) (not b!504464))
(check-sat)
