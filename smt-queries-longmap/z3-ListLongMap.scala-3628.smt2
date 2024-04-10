; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50056 () Bool)

(assert start!50056)

(declare-fun b!548494 () Bool)

(declare-fun res!341819 () Bool)

(declare-fun e!316881 () Bool)

(assert (=> b!548494 (=> (not res!341819) (not e!316881))))

(declare-datatypes ((array!34593 0))(
  ( (array!34594 (arr!16615 (Array (_ BitVec 32) (_ BitVec 64))) (size!16979 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34593)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34593 (_ BitVec 32)) Bool)

(assert (=> b!548494 (= res!341819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!341822 () Bool)

(declare-fun e!316880 () Bool)

(assert (=> start!50056 (=> (not res!341822) (not e!316880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50056 (= res!341822 (validMask!0 mask!3119))))

(assert (=> start!50056 e!316880))

(assert (=> start!50056 true))

(declare-fun array_inv!12411 (array!34593) Bool)

(assert (=> start!50056 (array_inv!12411 a!3118)))

(declare-fun b!548495 () Bool)

(declare-fun res!341818 () Bool)

(assert (=> b!548495 (=> (not res!341818) (not e!316880))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548495 (= res!341818 (validKeyInArray!0 k0!1914))))

(declare-fun b!548496 () Bool)

(declare-fun res!341821 () Bool)

(assert (=> b!548496 (=> (not res!341821) (not e!316880))))

(declare-fun arrayContainsKey!0 (array!34593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548496 (= res!341821 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548497 () Bool)

(declare-fun res!341816 () Bool)

(assert (=> b!548497 (=> (not res!341816) (not e!316880))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548497 (= res!341816 (and (= (size!16979 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16979 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16979 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548498 () Bool)

(declare-fun res!341820 () Bool)

(assert (=> b!548498 (=> (not res!341820) (not e!316880))))

(assert (=> b!548498 (= res!341820 (validKeyInArray!0 (select (arr!16615 a!3118) j!142)))))

(declare-fun b!548499 () Bool)

(assert (=> b!548499 (= e!316881 false)))

(declare-fun lt!249856 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548499 (= lt!249856 (toIndex!0 (select (arr!16615 a!3118) j!142) mask!3119))))

(declare-fun b!548500 () Bool)

(declare-fun res!341815 () Bool)

(assert (=> b!548500 (=> (not res!341815) (not e!316881))))

(declare-datatypes ((List!10695 0))(
  ( (Nil!10692) (Cons!10691 (h!11661 (_ BitVec 64)) (t!16923 List!10695)) )
))
(declare-fun arrayNoDuplicates!0 (array!34593 (_ BitVec 32) List!10695) Bool)

(assert (=> b!548500 (= res!341815 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10692))))

(declare-fun b!548501 () Bool)

(assert (=> b!548501 (= e!316880 e!316881)))

(declare-fun res!341817 () Bool)

(assert (=> b!548501 (=> (not res!341817) (not e!316881))))

(declare-datatypes ((SeekEntryResult!5064 0))(
  ( (MissingZero!5064 (index!22483 (_ BitVec 32))) (Found!5064 (index!22484 (_ BitVec 32))) (Intermediate!5064 (undefined!5876 Bool) (index!22485 (_ BitVec 32)) (x!51423 (_ BitVec 32))) (Undefined!5064) (MissingVacant!5064 (index!22486 (_ BitVec 32))) )
))
(declare-fun lt!249855 () SeekEntryResult!5064)

(assert (=> b!548501 (= res!341817 (or (= lt!249855 (MissingZero!5064 i!1132)) (= lt!249855 (MissingVacant!5064 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34593 (_ BitVec 32)) SeekEntryResult!5064)

(assert (=> b!548501 (= lt!249855 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50056 res!341822) b!548497))

(assert (= (and b!548497 res!341816) b!548498))

(assert (= (and b!548498 res!341820) b!548495))

(assert (= (and b!548495 res!341818) b!548496))

(assert (= (and b!548496 res!341821) b!548501))

(assert (= (and b!548501 res!341817) b!548494))

(assert (= (and b!548494 res!341819) b!548500))

(assert (= (and b!548500 res!341815) b!548499))

(declare-fun m!525503 () Bool)

(assert (=> start!50056 m!525503))

(declare-fun m!525505 () Bool)

(assert (=> start!50056 m!525505))

(declare-fun m!525507 () Bool)

(assert (=> b!548495 m!525507))

(declare-fun m!525509 () Bool)

(assert (=> b!548494 m!525509))

(declare-fun m!525511 () Bool)

(assert (=> b!548499 m!525511))

(assert (=> b!548499 m!525511))

(declare-fun m!525513 () Bool)

(assert (=> b!548499 m!525513))

(declare-fun m!525515 () Bool)

(assert (=> b!548496 m!525515))

(assert (=> b!548498 m!525511))

(assert (=> b!548498 m!525511))

(declare-fun m!525517 () Bool)

(assert (=> b!548498 m!525517))

(declare-fun m!525519 () Bool)

(assert (=> b!548501 m!525519))

(declare-fun m!525521 () Bool)

(assert (=> b!548500 m!525521))

(check-sat (not b!548494) (not b!548496) (not b!548500) (not b!548498) (not b!548501) (not b!548499) (not start!50056) (not b!548495))
(check-sat)
