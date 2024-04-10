; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50206 () Bool)

(assert start!50206)

(declare-fun b!549529 () Bool)

(declare-fun res!342679 () Bool)

(declare-fun e!317375 () Bool)

(assert (=> b!549529 (=> (not res!342679) (not e!317375))))

(declare-datatypes ((array!34659 0))(
  ( (array!34660 (arr!16645 (Array (_ BitVec 32) (_ BitVec 64))) (size!17009 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34659)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549529 (= res!342679 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549530 () Bool)

(declare-fun e!317374 () Bool)

(assert (=> b!549530 (= e!317374 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5094 0))(
  ( (MissingZero!5094 (index!22603 (_ BitVec 32))) (Found!5094 (index!22604 (_ BitVec 32))) (Intermediate!5094 (undefined!5906 Bool) (index!22605 (_ BitVec 32)) (x!51536 (_ BitVec 32))) (Undefined!5094) (MissingVacant!5094 (index!22606 (_ BitVec 32))) )
))
(declare-fun lt!250185 () SeekEntryResult!5094)

(declare-fun lt!250188 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34659 (_ BitVec 32)) SeekEntryResult!5094)

(assert (=> b!549530 (= lt!250185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250188 (select (store (arr!16645 a!3118) i!1132 k0!1914) j!142) (array!34660 (store (arr!16645 a!3118) i!1132 k0!1914) (size!17009 a!3118)) mask!3119))))

(declare-fun lt!250189 () (_ BitVec 32))

(declare-fun lt!250186 () SeekEntryResult!5094)

(assert (=> b!549530 (= lt!250186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250189 (select (arr!16645 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549530 (= lt!250188 (toIndex!0 (select (store (arr!16645 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549530 (= lt!250189 (toIndex!0 (select (arr!16645 a!3118) j!142) mask!3119))))

(declare-fun b!549531 () Bool)

(declare-fun res!342678 () Bool)

(assert (=> b!549531 (=> (not res!342678) (not e!317375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549531 (= res!342678 (validKeyInArray!0 k0!1914))))

(declare-fun res!342676 () Bool)

(assert (=> start!50206 (=> (not res!342676) (not e!317375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50206 (= res!342676 (validMask!0 mask!3119))))

(assert (=> start!50206 e!317375))

(assert (=> start!50206 true))

(declare-fun array_inv!12441 (array!34659) Bool)

(assert (=> start!50206 (array_inv!12441 a!3118)))

(declare-fun b!549532 () Bool)

(declare-fun res!342677 () Bool)

(assert (=> b!549532 (=> (not res!342677) (not e!317375))))

(assert (=> b!549532 (= res!342677 (and (= (size!17009 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17009 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17009 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549533 () Bool)

(assert (=> b!549533 (= e!317375 e!317374)))

(declare-fun res!342680 () Bool)

(assert (=> b!549533 (=> (not res!342680) (not e!317374))))

(declare-fun lt!250187 () SeekEntryResult!5094)

(assert (=> b!549533 (= res!342680 (or (= lt!250187 (MissingZero!5094 i!1132)) (= lt!250187 (MissingVacant!5094 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34659 (_ BitVec 32)) SeekEntryResult!5094)

(assert (=> b!549533 (= lt!250187 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549534 () Bool)

(declare-fun res!342673 () Bool)

(assert (=> b!549534 (=> (not res!342673) (not e!317374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34659 (_ BitVec 32)) Bool)

(assert (=> b!549534 (= res!342673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549535 () Bool)

(declare-fun res!342674 () Bool)

(assert (=> b!549535 (=> (not res!342674) (not e!317374))))

(declare-datatypes ((List!10725 0))(
  ( (Nil!10722) (Cons!10721 (h!11694 (_ BitVec 64)) (t!16953 List!10725)) )
))
(declare-fun arrayNoDuplicates!0 (array!34659 (_ BitVec 32) List!10725) Bool)

(assert (=> b!549535 (= res!342674 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10722))))

(declare-fun b!549536 () Bool)

(declare-fun res!342675 () Bool)

(assert (=> b!549536 (=> (not res!342675) (not e!317375))))

(assert (=> b!549536 (= res!342675 (validKeyInArray!0 (select (arr!16645 a!3118) j!142)))))

(assert (= (and start!50206 res!342676) b!549532))

(assert (= (and b!549532 res!342677) b!549536))

(assert (= (and b!549536 res!342675) b!549531))

(assert (= (and b!549531 res!342678) b!549529))

(assert (= (and b!549529 res!342679) b!549533))

(assert (= (and b!549533 res!342680) b!549534))

(assert (= (and b!549534 res!342673) b!549535))

(assert (= (and b!549535 res!342674) b!549530))

(declare-fun m!526401 () Bool)

(assert (=> b!549533 m!526401))

(declare-fun m!526403 () Bool)

(assert (=> start!50206 m!526403))

(declare-fun m!526405 () Bool)

(assert (=> start!50206 m!526405))

(declare-fun m!526407 () Bool)

(assert (=> b!549530 m!526407))

(declare-fun m!526409 () Bool)

(assert (=> b!549530 m!526409))

(assert (=> b!549530 m!526407))

(declare-fun m!526411 () Bool)

(assert (=> b!549530 m!526411))

(assert (=> b!549530 m!526407))

(declare-fun m!526413 () Bool)

(assert (=> b!549530 m!526413))

(declare-fun m!526415 () Bool)

(assert (=> b!549530 m!526415))

(assert (=> b!549530 m!526413))

(declare-fun m!526417 () Bool)

(assert (=> b!549530 m!526417))

(assert (=> b!549530 m!526413))

(declare-fun m!526419 () Bool)

(assert (=> b!549530 m!526419))

(declare-fun m!526421 () Bool)

(assert (=> b!549529 m!526421))

(declare-fun m!526423 () Bool)

(assert (=> b!549534 m!526423))

(declare-fun m!526425 () Bool)

(assert (=> b!549531 m!526425))

(assert (=> b!549536 m!526407))

(assert (=> b!549536 m!526407))

(declare-fun m!526427 () Bool)

(assert (=> b!549536 m!526427))

(declare-fun m!526429 () Bool)

(assert (=> b!549535 m!526429))

(check-sat (not b!549533) (not b!549536) (not b!549535) (not b!549534) (not b!549530) (not start!50206) (not b!549531) (not b!549529))
(check-sat)
