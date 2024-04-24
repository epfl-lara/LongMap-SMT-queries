; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45764 () Bool)

(assert start!45764)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!296444 () Bool)

(declare-datatypes ((array!32521 0))(
  ( (array!32522 (arr!15640 (Array (_ BitVec 32) (_ BitVec 64))) (size!16004 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32521)

(declare-fun b!506493 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4063 0))(
  ( (MissingZero!4063 (index!18440 (_ BitVec 32))) (Found!4063 (index!18441 (_ BitVec 32))) (Intermediate!4063 (undefined!4875 Bool) (index!18442 (_ BitVec 32)) (x!47589 (_ BitVec 32))) (Undefined!4063) (MissingVacant!4063 (index!18443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32521 (_ BitVec 32)) SeekEntryResult!4063)

(assert (=> b!506493 (= e!296444 (= (seekEntryOrOpen!0 (select (arr!15640 a!3235) j!176) a!3235 mask!3524) (Found!4063 j!176)))))

(declare-fun b!506494 () Bool)

(declare-fun e!296445 () Bool)

(declare-fun e!296440 () Bool)

(assert (=> b!506494 (= e!296445 e!296440)))

(declare-fun res!307516 () Bool)

(assert (=> b!506494 (=> res!307516 e!296440)))

(declare-fun lt!231170 () Bool)

(declare-fun lt!231167 () SeekEntryResult!4063)

(assert (=> b!506494 (= res!307516 (or (and (not lt!231170) (undefined!4875 lt!231167)) (and (not lt!231170) (not (undefined!4875 lt!231167)))))))

(get-info :version)

(assert (=> b!506494 (= lt!231170 (not ((_ is Intermediate!4063) lt!231167)))))

(declare-fun b!506495 () Bool)

(assert (=> b!506495 (= e!296440 true)))

(assert (=> b!506495 false))

(declare-fun b!506496 () Bool)

(declare-fun res!307508 () Bool)

(declare-fun e!296443 () Bool)

(assert (=> b!506496 (=> (not res!307508) (not e!296443))))

(declare-datatypes ((List!9705 0))(
  ( (Nil!9702) (Cons!9701 (h!10578 (_ BitVec 64)) (t!15925 List!9705)) )
))
(declare-fun arrayNoDuplicates!0 (array!32521 (_ BitVec 32) List!9705) Bool)

(assert (=> b!506496 (= res!307508 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9702))))

(declare-fun res!307515 () Bool)

(declare-fun e!296442 () Bool)

(assert (=> start!45764 (=> (not res!307515) (not e!296442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45764 (= res!307515 (validMask!0 mask!3524))))

(assert (=> start!45764 e!296442))

(assert (=> start!45764 true))

(declare-fun array_inv!11499 (array!32521) Bool)

(assert (=> start!45764 (array_inv!11499 a!3235)))

(declare-fun b!506497 () Bool)

(assert (=> b!506497 (= e!296442 e!296443)))

(declare-fun res!307513 () Bool)

(assert (=> b!506497 (=> (not res!307513) (not e!296443))))

(declare-fun lt!231172 () SeekEntryResult!4063)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506497 (= res!307513 (or (= lt!231172 (MissingZero!4063 i!1204)) (= lt!231172 (MissingVacant!4063 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!506497 (= lt!231172 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506498 () Bool)

(assert (=> b!506498 (= e!296443 (not e!296445))))

(declare-fun res!307514 () Bool)

(assert (=> b!506498 (=> res!307514 e!296445)))

(declare-fun lt!231171 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32521 (_ BitVec 32)) SeekEntryResult!4063)

(assert (=> b!506498 (= res!307514 (= lt!231167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231171 (select (store (arr!15640 a!3235) i!1204 k0!2280) j!176) (array!32522 (store (arr!15640 a!3235) i!1204 k0!2280) (size!16004 a!3235)) mask!3524)))))

(declare-fun lt!231169 () (_ BitVec 32))

(assert (=> b!506498 (= lt!231167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231169 (select (arr!15640 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506498 (= lt!231171 (toIndex!0 (select (store (arr!15640 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506498 (= lt!231169 (toIndex!0 (select (arr!15640 a!3235) j!176) mask!3524))))

(assert (=> b!506498 e!296444))

(declare-fun res!307506 () Bool)

(assert (=> b!506498 (=> (not res!307506) (not e!296444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32521 (_ BitVec 32)) Bool)

(assert (=> b!506498 (= res!307506 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15475 0))(
  ( (Unit!15476) )
))
(declare-fun lt!231168 () Unit!15475)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15475)

(assert (=> b!506498 (= lt!231168 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506499 () Bool)

(declare-fun res!307507 () Bool)

(assert (=> b!506499 (=> (not res!307507) (not e!296442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506499 (= res!307507 (validKeyInArray!0 (select (arr!15640 a!3235) j!176)))))

(declare-fun b!506500 () Bool)

(declare-fun res!307509 () Bool)

(assert (=> b!506500 (=> (not res!307509) (not e!296443))))

(assert (=> b!506500 (= res!307509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506501 () Bool)

(declare-fun res!307511 () Bool)

(assert (=> b!506501 (=> (not res!307511) (not e!296442))))

(assert (=> b!506501 (= res!307511 (and (= (size!16004 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16004 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16004 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506502 () Bool)

(declare-fun res!307510 () Bool)

(assert (=> b!506502 (=> (not res!307510) (not e!296442))))

(assert (=> b!506502 (= res!307510 (validKeyInArray!0 k0!2280))))

(declare-fun b!506503 () Bool)

(declare-fun res!307512 () Bool)

(assert (=> b!506503 (=> (not res!307512) (not e!296442))))

(declare-fun arrayContainsKey!0 (array!32521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506503 (= res!307512 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45764 res!307515) b!506501))

(assert (= (and b!506501 res!307511) b!506499))

(assert (= (and b!506499 res!307507) b!506502))

(assert (= (and b!506502 res!307510) b!506503))

(assert (= (and b!506503 res!307512) b!506497))

(assert (= (and b!506497 res!307513) b!506500))

(assert (= (and b!506500 res!307509) b!506496))

(assert (= (and b!506496 res!307508) b!506498))

(assert (= (and b!506498 res!307506) b!506493))

(assert (= (and b!506498 (not res!307514)) b!506494))

(assert (= (and b!506494 (not res!307516)) b!506495))

(declare-fun m!487411 () Bool)

(assert (=> b!506502 m!487411))

(declare-fun m!487413 () Bool)

(assert (=> b!506498 m!487413))

(declare-fun m!487415 () Bool)

(assert (=> b!506498 m!487415))

(declare-fun m!487417 () Bool)

(assert (=> b!506498 m!487417))

(declare-fun m!487419 () Bool)

(assert (=> b!506498 m!487419))

(declare-fun m!487421 () Bool)

(assert (=> b!506498 m!487421))

(assert (=> b!506498 m!487419))

(assert (=> b!506498 m!487419))

(declare-fun m!487423 () Bool)

(assert (=> b!506498 m!487423))

(declare-fun m!487425 () Bool)

(assert (=> b!506498 m!487425))

(assert (=> b!506498 m!487417))

(declare-fun m!487427 () Bool)

(assert (=> b!506498 m!487427))

(assert (=> b!506498 m!487417))

(declare-fun m!487429 () Bool)

(assert (=> b!506498 m!487429))

(declare-fun m!487431 () Bool)

(assert (=> b!506497 m!487431))

(assert (=> b!506499 m!487419))

(assert (=> b!506499 m!487419))

(declare-fun m!487433 () Bool)

(assert (=> b!506499 m!487433))

(declare-fun m!487435 () Bool)

(assert (=> b!506500 m!487435))

(declare-fun m!487437 () Bool)

(assert (=> start!45764 m!487437))

(declare-fun m!487439 () Bool)

(assert (=> start!45764 m!487439))

(declare-fun m!487441 () Bool)

(assert (=> b!506503 m!487441))

(declare-fun m!487443 () Bool)

(assert (=> b!506496 m!487443))

(assert (=> b!506493 m!487419))

(assert (=> b!506493 m!487419))

(declare-fun m!487445 () Bool)

(assert (=> b!506493 m!487445))

(check-sat (not b!506497) (not b!506502) (not b!506493) (not b!506498) (not start!45764) (not b!506500) (not b!506496) (not b!506503) (not b!506499))
(check-sat)
