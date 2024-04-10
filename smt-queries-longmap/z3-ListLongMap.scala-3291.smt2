; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45692 () Bool)

(assert start!45692)

(declare-fun b!504574 () Bool)

(declare-datatypes ((Unit!15360 0))(
  ( (Unit!15361) )
))
(declare-fun e!295431 () Unit!15360)

(declare-fun Unit!15362 () Unit!15360)

(assert (=> b!504574 (= e!295431 Unit!15362)))

(declare-fun b!504575 () Bool)

(declare-fun res!305749 () Bool)

(declare-fun e!295425 () Bool)

(assert (=> b!504575 (=> (not res!305749) (not e!295425))))

(declare-datatypes ((array!32448 0))(
  ( (array!32449 (arr!15604 (Array (_ BitVec 32) (_ BitVec 64))) (size!15968 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32448)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504575 (= res!305749 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!305746 () Bool)

(assert (=> start!45692 (=> (not res!305746) (not e!295425))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45692 (= res!305746 (validMask!0 mask!3524))))

(assert (=> start!45692 e!295425))

(assert (=> start!45692 true))

(declare-fun array_inv!11400 (array!32448) Bool)

(assert (=> start!45692 (array_inv!11400 a!3235)))

(declare-fun b!504576 () Bool)

(declare-fun e!295423 () Bool)

(assert (=> b!504576 (= e!295423 false)))

(declare-fun b!504577 () Bool)

(declare-fun res!305750 () Bool)

(assert (=> b!504577 (=> (not res!305750) (not e!295425))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504577 (= res!305750 (and (= (size!15968 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15968 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15968 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504578 () Bool)

(declare-fun e!295426 () Bool)

(assert (=> b!504578 (= e!295425 e!295426)))

(declare-fun res!305740 () Bool)

(assert (=> b!504578 (=> (not res!305740) (not e!295426))))

(declare-datatypes ((SeekEntryResult!4071 0))(
  ( (MissingZero!4071 (index!18472 (_ BitVec 32))) (Found!4071 (index!18473 (_ BitVec 32))) (Intermediate!4071 (undefined!4883 Bool) (index!18474 (_ BitVec 32)) (x!47488 (_ BitVec 32))) (Undefined!4071) (MissingVacant!4071 (index!18475 (_ BitVec 32))) )
))
(declare-fun lt!229768 () SeekEntryResult!4071)

(assert (=> b!504578 (= res!305740 (or (= lt!229768 (MissingZero!4071 i!1204)) (= lt!229768 (MissingVacant!4071 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32448 (_ BitVec 32)) SeekEntryResult!4071)

(assert (=> b!504578 (= lt!229768 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504579 () Bool)

(declare-fun Unit!15363 () Unit!15360)

(assert (=> b!504579 (= e!295431 Unit!15363)))

(declare-fun lt!229762 () SeekEntryResult!4071)

(declare-fun lt!229763 () Unit!15360)

(declare-fun lt!229764 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32448 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15360)

(assert (=> b!504579 (= lt!229763 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229764 #b00000000000000000000000000000000 (index!18474 lt!229762) (x!47488 lt!229762) mask!3524))))

(declare-fun res!305751 () Bool)

(declare-fun lt!229766 () (_ BitVec 64))

(declare-fun lt!229767 () array!32448)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32448 (_ BitVec 32)) SeekEntryResult!4071)

(assert (=> b!504579 (= res!305751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229764 lt!229766 lt!229767 mask!3524) (Intermediate!4071 false (index!18474 lt!229762) (x!47488 lt!229762))))))

(assert (=> b!504579 (=> (not res!305751) (not e!295423))))

(assert (=> b!504579 e!295423))

(declare-fun b!504580 () Bool)

(declare-fun e!295424 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32448 (_ BitVec 32)) SeekEntryResult!4071)

(assert (=> b!504580 (= e!295424 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229764 (index!18474 lt!229762) (select (arr!15604 a!3235) j!176) a!3235 mask!3524) (Found!4071 j!176))))))

(declare-fun b!504581 () Bool)

(declare-fun res!305744 () Bool)

(declare-fun e!295427 () Bool)

(assert (=> b!504581 (=> res!305744 e!295427)))

(assert (=> b!504581 (= res!305744 e!295424)))

(declare-fun res!305752 () Bool)

(assert (=> b!504581 (=> (not res!305752) (not e!295424))))

(assert (=> b!504581 (= res!305752 (bvsgt #b00000000000000000000000000000000 (x!47488 lt!229762)))))

(declare-fun b!504582 () Bool)

(declare-fun res!305747 () Bool)

(assert (=> b!504582 (=> (not res!305747) (not e!295425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504582 (= res!305747 (validKeyInArray!0 k0!2280))))

(declare-fun b!504583 () Bool)

(declare-fun res!305748 () Bool)

(declare-fun e!295428 () Bool)

(assert (=> b!504583 (=> res!305748 e!295428)))

(get-info :version)

(assert (=> b!504583 (= res!305748 (or (undefined!4883 lt!229762) (not ((_ is Intermediate!4071) lt!229762))))))

(declare-fun b!504584 () Bool)

(declare-fun res!305745 () Bool)

(assert (=> b!504584 (=> (not res!305745) (not e!295426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32448 (_ BitVec 32)) Bool)

(assert (=> b!504584 (= res!305745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504585 () Bool)

(assert (=> b!504585 (= e!295427 true)))

(declare-fun lt!229760 () SeekEntryResult!4071)

(assert (=> b!504585 (= lt!229760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229764 lt!229766 lt!229767 mask!3524))))

(declare-fun e!295430 () Bool)

(declare-fun b!504586 () Bool)

(assert (=> b!504586 (= e!295430 (= (seekEntryOrOpen!0 (select (arr!15604 a!3235) j!176) a!3235 mask!3524) (Found!4071 j!176)))))

(declare-fun b!504587 () Bool)

(declare-fun res!305741 () Bool)

(assert (=> b!504587 (=> (not res!305741) (not e!295425))))

(assert (=> b!504587 (= res!305741 (validKeyInArray!0 (select (arr!15604 a!3235) j!176)))))

(declare-fun b!504588 () Bool)

(assert (=> b!504588 (= e!295426 (not e!295428))))

(declare-fun res!305742 () Bool)

(assert (=> b!504588 (=> res!305742 e!295428)))

(declare-fun lt!229759 () (_ BitVec 32))

(assert (=> b!504588 (= res!305742 (= lt!229762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229759 lt!229766 lt!229767 mask!3524)))))

(assert (=> b!504588 (= lt!229762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229764 (select (arr!15604 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504588 (= lt!229759 (toIndex!0 lt!229766 mask!3524))))

(assert (=> b!504588 (= lt!229766 (select (store (arr!15604 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504588 (= lt!229764 (toIndex!0 (select (arr!15604 a!3235) j!176) mask!3524))))

(assert (=> b!504588 (= lt!229767 (array!32449 (store (arr!15604 a!3235) i!1204 k0!2280) (size!15968 a!3235)))))

(assert (=> b!504588 e!295430))

(declare-fun res!305743 () Bool)

(assert (=> b!504588 (=> (not res!305743) (not e!295430))))

(assert (=> b!504588 (= res!305743 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229758 () Unit!15360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15360)

(assert (=> b!504588 (= lt!229758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504589 () Bool)

(declare-fun res!305739 () Bool)

(assert (=> b!504589 (=> (not res!305739) (not e!295426))))

(declare-datatypes ((List!9762 0))(
  ( (Nil!9759) (Cons!9758 (h!10635 (_ BitVec 64)) (t!15990 List!9762)) )
))
(declare-fun arrayNoDuplicates!0 (array!32448 (_ BitVec 32) List!9762) Bool)

(assert (=> b!504589 (= res!305739 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9759))))

(declare-fun b!504590 () Bool)

(assert (=> b!504590 (= e!295428 e!295427)))

(declare-fun res!305753 () Bool)

(assert (=> b!504590 (=> res!305753 e!295427)))

(assert (=> b!504590 (= res!305753 (or (bvsgt (x!47488 lt!229762) #b01111111111111111111111111111110) (bvslt lt!229764 #b00000000000000000000000000000000) (bvsge lt!229764 (size!15968 a!3235)) (bvslt (index!18474 lt!229762) #b00000000000000000000000000000000) (bvsge (index!18474 lt!229762) (size!15968 a!3235)) (not (= lt!229762 (Intermediate!4071 false (index!18474 lt!229762) (x!47488 lt!229762))))))))

(assert (=> b!504590 (= (index!18474 lt!229762) i!1204)))

(declare-fun lt!229765 () Unit!15360)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32448 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15360)

(assert (=> b!504590 (= lt!229765 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229764 #b00000000000000000000000000000000 (index!18474 lt!229762) (x!47488 lt!229762) mask!3524))))

(assert (=> b!504590 (and (or (= (select (arr!15604 a!3235) (index!18474 lt!229762)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15604 a!3235) (index!18474 lt!229762)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15604 a!3235) (index!18474 lt!229762)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15604 a!3235) (index!18474 lt!229762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229761 () Unit!15360)

(assert (=> b!504590 (= lt!229761 e!295431)))

(declare-fun c!59696 () Bool)

(assert (=> b!504590 (= c!59696 (= (select (arr!15604 a!3235) (index!18474 lt!229762)) (select (arr!15604 a!3235) j!176)))))

(assert (=> b!504590 (and (bvslt (x!47488 lt!229762) #b01111111111111111111111111111110) (or (= (select (arr!15604 a!3235) (index!18474 lt!229762)) (select (arr!15604 a!3235) j!176)) (= (select (arr!15604 a!3235) (index!18474 lt!229762)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15604 a!3235) (index!18474 lt!229762)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45692 res!305746) b!504577))

(assert (= (and b!504577 res!305750) b!504587))

(assert (= (and b!504587 res!305741) b!504582))

(assert (= (and b!504582 res!305747) b!504575))

(assert (= (and b!504575 res!305749) b!504578))

(assert (= (and b!504578 res!305740) b!504584))

(assert (= (and b!504584 res!305745) b!504589))

(assert (= (and b!504589 res!305739) b!504588))

(assert (= (and b!504588 res!305743) b!504586))

(assert (= (and b!504588 (not res!305742)) b!504583))

(assert (= (and b!504583 (not res!305748)) b!504590))

(assert (= (and b!504590 c!59696) b!504579))

(assert (= (and b!504590 (not c!59696)) b!504574))

(assert (= (and b!504579 res!305751) b!504576))

(assert (= (and b!504590 (not res!305753)) b!504581))

(assert (= (and b!504581 res!305752) b!504580))

(assert (= (and b!504581 (not res!305744)) b!504585))

(declare-fun m!485299 () Bool)

(assert (=> b!504584 m!485299))

(declare-fun m!485301 () Bool)

(assert (=> b!504588 m!485301))

(declare-fun m!485303 () Bool)

(assert (=> b!504588 m!485303))

(declare-fun m!485305 () Bool)

(assert (=> b!504588 m!485305))

(declare-fun m!485307 () Bool)

(assert (=> b!504588 m!485307))

(declare-fun m!485309 () Bool)

(assert (=> b!504588 m!485309))

(declare-fun m!485311 () Bool)

(assert (=> b!504588 m!485311))

(declare-fun m!485313 () Bool)

(assert (=> b!504588 m!485313))

(assert (=> b!504588 m!485311))

(declare-fun m!485315 () Bool)

(assert (=> b!504588 m!485315))

(assert (=> b!504588 m!485311))

(declare-fun m!485317 () Bool)

(assert (=> b!504588 m!485317))

(declare-fun m!485319 () Bool)

(assert (=> b!504575 m!485319))

(assert (=> b!504587 m!485311))

(assert (=> b!504587 m!485311))

(declare-fun m!485321 () Bool)

(assert (=> b!504587 m!485321))

(declare-fun m!485323 () Bool)

(assert (=> b!504578 m!485323))

(declare-fun m!485325 () Bool)

(assert (=> start!45692 m!485325))

(declare-fun m!485327 () Bool)

(assert (=> start!45692 m!485327))

(declare-fun m!485329 () Bool)

(assert (=> b!504582 m!485329))

(declare-fun m!485331 () Bool)

(assert (=> b!504585 m!485331))

(declare-fun m!485333 () Bool)

(assert (=> b!504589 m!485333))

(assert (=> b!504580 m!485311))

(assert (=> b!504580 m!485311))

(declare-fun m!485335 () Bool)

(assert (=> b!504580 m!485335))

(declare-fun m!485337 () Bool)

(assert (=> b!504579 m!485337))

(assert (=> b!504579 m!485331))

(assert (=> b!504586 m!485311))

(assert (=> b!504586 m!485311))

(declare-fun m!485339 () Bool)

(assert (=> b!504586 m!485339))

(declare-fun m!485341 () Bool)

(assert (=> b!504590 m!485341))

(declare-fun m!485343 () Bool)

(assert (=> b!504590 m!485343))

(assert (=> b!504590 m!485311))

(check-sat (not b!504582) (not b!504580) (not b!504585) (not b!504584) (not b!504588) (not b!504578) (not b!504587) (not b!504579) (not b!504575) (not start!45692) (not b!504589) (not b!504586) (not b!504590))
(check-sat)
