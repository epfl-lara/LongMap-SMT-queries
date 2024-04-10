; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45686 () Bool)

(assert start!45686)

(declare-fun b!504421 () Bool)

(declare-datatypes ((Unit!15348 0))(
  ( (Unit!15349) )
))
(declare-fun e!295348 () Unit!15348)

(declare-fun Unit!15350 () Unit!15348)

(assert (=> b!504421 (= e!295348 Unit!15350)))

(declare-fun b!504422 () Bool)

(declare-fun e!295346 () Bool)

(assert (=> b!504422 (= e!295346 false)))

(declare-fun b!504423 () Bool)

(declare-fun Unit!15351 () Unit!15348)

(assert (=> b!504423 (= e!295348 Unit!15351)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4068 0))(
  ( (MissingZero!4068 (index!18460 (_ BitVec 32))) (Found!4068 (index!18461 (_ BitVec 32))) (Intermediate!4068 (undefined!4880 Bool) (index!18462 (_ BitVec 32)) (x!47477 (_ BitVec 32))) (Undefined!4068) (MissingVacant!4068 (index!18463 (_ BitVec 32))) )
))
(declare-fun lt!229666 () SeekEntryResult!4068)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!229660 () Unit!15348)

(declare-fun lt!229664 () (_ BitVec 32))

(declare-datatypes ((array!32442 0))(
  ( (array!32443 (arr!15601 (Array (_ BitVec 32) (_ BitVec 64))) (size!15965 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32442)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15348)

(assert (=> b!504423 (= lt!229660 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229664 #b00000000000000000000000000000000 (index!18462 lt!229666) (x!47477 lt!229666) mask!3524))))

(declare-fun lt!229661 () (_ BitVec 64))

(declare-fun res!305606 () Bool)

(declare-fun lt!229662 () array!32442)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32442 (_ BitVec 32)) SeekEntryResult!4068)

(assert (=> b!504423 (= res!305606 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229664 lt!229661 lt!229662 mask!3524) (Intermediate!4068 false (index!18462 lt!229666) (x!47477 lt!229666))))))

(assert (=> b!504423 (=> (not res!305606) (not e!295346))))

(assert (=> b!504423 e!295346))

(declare-fun e!295347 () Bool)

(declare-fun b!504424 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32442 (_ BitVec 32)) SeekEntryResult!4068)

(assert (=> b!504424 (= e!295347 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229664 (index!18462 lt!229666) (select (arr!15601 a!3235) j!176) a!3235 mask!3524) (Found!4068 j!176))))))

(declare-fun b!504425 () Bool)

(declare-fun res!305605 () Bool)

(declare-fun e!295345 () Bool)

(assert (=> b!504425 (=> (not res!305605) (not e!295345))))

(declare-datatypes ((List!9759 0))(
  ( (Nil!9756) (Cons!9755 (h!10632 (_ BitVec 64)) (t!15987 List!9759)) )
))
(declare-fun arrayNoDuplicates!0 (array!32442 (_ BitVec 32) List!9759) Bool)

(assert (=> b!504425 (= res!305605 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9756))))

(declare-fun res!305611 () Bool)

(declare-fun e!295342 () Bool)

(assert (=> start!45686 (=> (not res!305611) (not e!295342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45686 (= res!305611 (validMask!0 mask!3524))))

(assert (=> start!45686 e!295342))

(assert (=> start!45686 true))

(declare-fun array_inv!11397 (array!32442) Bool)

(assert (=> start!45686 (array_inv!11397 a!3235)))

(declare-fun e!295343 () Bool)

(declare-fun b!504426 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32442 (_ BitVec 32)) SeekEntryResult!4068)

(assert (=> b!504426 (= e!295343 (= (seekEntryOrOpen!0 (select (arr!15601 a!3235) j!176) a!3235 mask!3524) (Found!4068 j!176)))))

(declare-fun b!504427 () Bool)

(declare-fun e!295344 () Bool)

(assert (=> b!504427 (= e!295345 (not e!295344))))

(declare-fun res!305612 () Bool)

(assert (=> b!504427 (=> res!305612 e!295344)))

(declare-fun lt!229669 () (_ BitVec 32))

(assert (=> b!504427 (= res!305612 (= lt!229666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229669 lt!229661 lt!229662 mask!3524)))))

(assert (=> b!504427 (= lt!229666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229664 (select (arr!15601 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504427 (= lt!229669 (toIndex!0 lt!229661 mask!3524))))

(assert (=> b!504427 (= lt!229661 (select (store (arr!15601 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504427 (= lt!229664 (toIndex!0 (select (arr!15601 a!3235) j!176) mask!3524))))

(assert (=> b!504427 (= lt!229662 (array!32443 (store (arr!15601 a!3235) i!1204 k0!2280) (size!15965 a!3235)))))

(assert (=> b!504427 e!295343))

(declare-fun res!305614 () Bool)

(assert (=> b!504427 (=> (not res!305614) (not e!295343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32442 (_ BitVec 32)) Bool)

(assert (=> b!504427 (= res!305614 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229663 () Unit!15348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15348)

(assert (=> b!504427 (= lt!229663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504428 () Bool)

(declare-fun res!305616 () Bool)

(assert (=> b!504428 (=> (not res!305616) (not e!295342))))

(declare-fun arrayContainsKey!0 (array!32442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504428 (= res!305616 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504429 () Bool)

(declare-fun res!305613 () Bool)

(assert (=> b!504429 (=> (not res!305613) (not e!295345))))

(assert (=> b!504429 (= res!305613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504430 () Bool)

(assert (=> b!504430 (= e!295342 e!295345)))

(declare-fun res!305617 () Bool)

(assert (=> b!504430 (=> (not res!305617) (not e!295345))))

(declare-fun lt!229668 () SeekEntryResult!4068)

(assert (=> b!504430 (= res!305617 (or (= lt!229668 (MissingZero!4068 i!1204)) (= lt!229668 (MissingVacant!4068 i!1204))))))

(assert (=> b!504430 (= lt!229668 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504431 () Bool)

(declare-fun res!305610 () Bool)

(assert (=> b!504431 (=> (not res!305610) (not e!295342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504431 (= res!305610 (validKeyInArray!0 k0!2280))))

(declare-fun b!504432 () Bool)

(declare-fun res!305608 () Bool)

(declare-fun e!295350 () Bool)

(assert (=> b!504432 (=> res!305608 e!295350)))

(assert (=> b!504432 (= res!305608 e!295347)))

(declare-fun res!305615 () Bool)

(assert (=> b!504432 (=> (not res!305615) (not e!295347))))

(assert (=> b!504432 (= res!305615 (bvsgt #b00000000000000000000000000000000 (x!47477 lt!229666)))))

(declare-fun b!504433 () Bool)

(declare-fun res!305609 () Bool)

(assert (=> b!504433 (=> (not res!305609) (not e!295342))))

(assert (=> b!504433 (= res!305609 (validKeyInArray!0 (select (arr!15601 a!3235) j!176)))))

(declare-fun b!504434 () Bool)

(declare-fun res!305604 () Bool)

(assert (=> b!504434 (=> (not res!305604) (not e!295342))))

(assert (=> b!504434 (= res!305604 (and (= (size!15965 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15965 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15965 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504435 () Bool)

(assert (=> b!504435 (= e!295344 e!295350)))

(declare-fun res!305618 () Bool)

(assert (=> b!504435 (=> res!305618 e!295350)))

(assert (=> b!504435 (= res!305618 (or (bvsgt (x!47477 lt!229666) #b01111111111111111111111111111110) (bvslt lt!229664 #b00000000000000000000000000000000) (bvsge lt!229664 (size!15965 a!3235)) (bvslt (index!18462 lt!229666) #b00000000000000000000000000000000) (bvsge (index!18462 lt!229666) (size!15965 a!3235)) (not (= lt!229666 (Intermediate!4068 false (index!18462 lt!229666) (x!47477 lt!229666))))))))

(assert (=> b!504435 (= (index!18462 lt!229666) i!1204)))

(declare-fun lt!229659 () Unit!15348)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15348)

(assert (=> b!504435 (= lt!229659 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229664 #b00000000000000000000000000000000 (index!18462 lt!229666) (x!47477 lt!229666) mask!3524))))

(assert (=> b!504435 (and (or (= (select (arr!15601 a!3235) (index!18462 lt!229666)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15601 a!3235) (index!18462 lt!229666)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15601 a!3235) (index!18462 lt!229666)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15601 a!3235) (index!18462 lt!229666)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229665 () Unit!15348)

(assert (=> b!504435 (= lt!229665 e!295348)))

(declare-fun c!59687 () Bool)

(assert (=> b!504435 (= c!59687 (= (select (arr!15601 a!3235) (index!18462 lt!229666)) (select (arr!15601 a!3235) j!176)))))

(assert (=> b!504435 (and (bvslt (x!47477 lt!229666) #b01111111111111111111111111111110) (or (= (select (arr!15601 a!3235) (index!18462 lt!229666)) (select (arr!15601 a!3235) j!176)) (= (select (arr!15601 a!3235) (index!18462 lt!229666)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15601 a!3235) (index!18462 lt!229666)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504436 () Bool)

(declare-fun res!305607 () Bool)

(assert (=> b!504436 (=> res!305607 e!295344)))

(get-info :version)

(assert (=> b!504436 (= res!305607 (or (undefined!4880 lt!229666) (not ((_ is Intermediate!4068) lt!229666))))))

(declare-fun b!504437 () Bool)

(assert (=> b!504437 (= e!295350 true)))

(declare-fun lt!229667 () SeekEntryResult!4068)

(assert (=> b!504437 (= lt!229667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229664 lt!229661 lt!229662 mask!3524))))

(assert (= (and start!45686 res!305611) b!504434))

(assert (= (and b!504434 res!305604) b!504433))

(assert (= (and b!504433 res!305609) b!504431))

(assert (= (and b!504431 res!305610) b!504428))

(assert (= (and b!504428 res!305616) b!504430))

(assert (= (and b!504430 res!305617) b!504429))

(assert (= (and b!504429 res!305613) b!504425))

(assert (= (and b!504425 res!305605) b!504427))

(assert (= (and b!504427 res!305614) b!504426))

(assert (= (and b!504427 (not res!305612)) b!504436))

(assert (= (and b!504436 (not res!305607)) b!504435))

(assert (= (and b!504435 c!59687) b!504423))

(assert (= (and b!504435 (not c!59687)) b!504421))

(assert (= (and b!504423 res!305606) b!504422))

(assert (= (and b!504435 (not res!305618)) b!504432))

(assert (= (and b!504432 res!305615) b!504424))

(assert (= (and b!504432 (not res!305608)) b!504437))

(declare-fun m!485161 () Bool)

(assert (=> b!504426 m!485161))

(assert (=> b!504426 m!485161))

(declare-fun m!485163 () Bool)

(assert (=> b!504426 m!485163))

(declare-fun m!485165 () Bool)

(assert (=> start!45686 m!485165))

(declare-fun m!485167 () Bool)

(assert (=> start!45686 m!485167))

(declare-fun m!485169 () Bool)

(assert (=> b!504428 m!485169))

(declare-fun m!485171 () Bool)

(assert (=> b!504431 m!485171))

(declare-fun m!485173 () Bool)

(assert (=> b!504423 m!485173))

(declare-fun m!485175 () Bool)

(assert (=> b!504423 m!485175))

(declare-fun m!485177 () Bool)

(assert (=> b!504425 m!485177))

(declare-fun m!485179 () Bool)

(assert (=> b!504427 m!485179))

(declare-fun m!485181 () Bool)

(assert (=> b!504427 m!485181))

(declare-fun m!485183 () Bool)

(assert (=> b!504427 m!485183))

(declare-fun m!485185 () Bool)

(assert (=> b!504427 m!485185))

(assert (=> b!504427 m!485161))

(declare-fun m!485187 () Bool)

(assert (=> b!504427 m!485187))

(assert (=> b!504427 m!485161))

(declare-fun m!485189 () Bool)

(assert (=> b!504427 m!485189))

(assert (=> b!504427 m!485161))

(declare-fun m!485191 () Bool)

(assert (=> b!504427 m!485191))

(declare-fun m!485193 () Bool)

(assert (=> b!504427 m!485193))

(assert (=> b!504433 m!485161))

(assert (=> b!504433 m!485161))

(declare-fun m!485195 () Bool)

(assert (=> b!504433 m!485195))

(assert (=> b!504437 m!485175))

(declare-fun m!485197 () Bool)

(assert (=> b!504429 m!485197))

(declare-fun m!485199 () Bool)

(assert (=> b!504435 m!485199))

(declare-fun m!485201 () Bool)

(assert (=> b!504435 m!485201))

(assert (=> b!504435 m!485161))

(declare-fun m!485203 () Bool)

(assert (=> b!504430 m!485203))

(assert (=> b!504424 m!485161))

(assert (=> b!504424 m!485161))

(declare-fun m!485205 () Bool)

(assert (=> b!504424 m!485205))

(check-sat (not b!504437) (not b!504428) (not b!504426) (not b!504430) (not b!504435) (not b!504425) (not b!504433) (not b!504423) (not b!504431) (not b!504427) (not start!45686) (not b!504429) (not b!504424))
(check-sat)
