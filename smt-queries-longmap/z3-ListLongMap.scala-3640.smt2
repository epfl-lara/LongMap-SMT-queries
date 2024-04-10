; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50218 () Bool)

(assert start!50218)

(declare-fun b!549673 () Bool)

(declare-fun e!317428 () Bool)

(assert (=> b!549673 (= e!317428 false)))

(declare-datatypes ((SeekEntryResult!5100 0))(
  ( (MissingZero!5100 (index!22627 (_ BitVec 32))) (Found!5100 (index!22628 (_ BitVec 32))) (Intermediate!5100 (undefined!5912 Bool) (index!22629 (_ BitVec 32)) (x!51558 (_ BitVec 32))) (Undefined!5100) (MissingVacant!5100 (index!22630 (_ BitVec 32))) )
))
(declare-fun lt!250278 () SeekEntryResult!5100)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!250275 () (_ BitVec 32))

(declare-datatypes ((array!34671 0))(
  ( (array!34672 (arr!16651 (Array (_ BitVec 32) (_ BitVec 64))) (size!17015 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34671 (_ BitVec 32)) SeekEntryResult!5100)

(assert (=> b!549673 (= lt!250278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250275 (select (store (arr!16651 a!3118) i!1132 k0!1914) j!142) (array!34672 (store (arr!16651 a!3118) i!1132 k0!1914) (size!17015 a!3118)) mask!3119))))

(declare-fun lt!250277 () SeekEntryResult!5100)

(declare-fun lt!250276 () (_ BitVec 32))

(assert (=> b!549673 (= lt!250277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250276 (select (arr!16651 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549673 (= lt!250275 (toIndex!0 (select (store (arr!16651 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549673 (= lt!250276 (toIndex!0 (select (arr!16651 a!3118) j!142) mask!3119))))

(declare-fun b!549674 () Bool)

(declare-fun e!317429 () Bool)

(assert (=> b!549674 (= e!317429 e!317428)))

(declare-fun res!342821 () Bool)

(assert (=> b!549674 (=> (not res!342821) (not e!317428))))

(declare-fun lt!250279 () SeekEntryResult!5100)

(assert (=> b!549674 (= res!342821 (or (= lt!250279 (MissingZero!5100 i!1132)) (= lt!250279 (MissingVacant!5100 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34671 (_ BitVec 32)) SeekEntryResult!5100)

(assert (=> b!549674 (= lt!250279 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549675 () Bool)

(declare-fun res!342820 () Bool)

(assert (=> b!549675 (=> (not res!342820) (not e!317428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34671 (_ BitVec 32)) Bool)

(assert (=> b!549675 (= res!342820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549676 () Bool)

(declare-fun res!342823 () Bool)

(assert (=> b!549676 (=> (not res!342823) (not e!317429))))

(declare-fun arrayContainsKey!0 (array!34671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549676 (= res!342823 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!342822 () Bool)

(assert (=> start!50218 (=> (not res!342822) (not e!317429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50218 (= res!342822 (validMask!0 mask!3119))))

(assert (=> start!50218 e!317429))

(assert (=> start!50218 true))

(declare-fun array_inv!12447 (array!34671) Bool)

(assert (=> start!50218 (array_inv!12447 a!3118)))

(declare-fun b!549677 () Bool)

(declare-fun res!342817 () Bool)

(assert (=> b!549677 (=> (not res!342817) (not e!317429))))

(assert (=> b!549677 (= res!342817 (and (= (size!17015 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17015 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17015 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549678 () Bool)

(declare-fun res!342818 () Bool)

(assert (=> b!549678 (=> (not res!342818) (not e!317428))))

(declare-datatypes ((List!10731 0))(
  ( (Nil!10728) (Cons!10727 (h!11700 (_ BitVec 64)) (t!16959 List!10731)) )
))
(declare-fun arrayNoDuplicates!0 (array!34671 (_ BitVec 32) List!10731) Bool)

(assert (=> b!549678 (= res!342818 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10728))))

(declare-fun b!549679 () Bool)

(declare-fun res!342819 () Bool)

(assert (=> b!549679 (=> (not res!342819) (not e!317429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549679 (= res!342819 (validKeyInArray!0 (select (arr!16651 a!3118) j!142)))))

(declare-fun b!549680 () Bool)

(declare-fun res!342824 () Bool)

(assert (=> b!549680 (=> (not res!342824) (not e!317429))))

(assert (=> b!549680 (= res!342824 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50218 res!342822) b!549677))

(assert (= (and b!549677 res!342817) b!549679))

(assert (= (and b!549679 res!342819) b!549680))

(assert (= (and b!549680 res!342824) b!549676))

(assert (= (and b!549676 res!342823) b!549674))

(assert (= (and b!549674 res!342821) b!549675))

(assert (= (and b!549675 res!342820) b!549678))

(assert (= (and b!549678 res!342818) b!549673))

(declare-fun m!526581 () Bool)

(assert (=> b!549679 m!526581))

(assert (=> b!549679 m!526581))

(declare-fun m!526583 () Bool)

(assert (=> b!549679 m!526583))

(declare-fun m!526585 () Bool)

(assert (=> b!549678 m!526585))

(declare-fun m!526587 () Bool)

(assert (=> start!50218 m!526587))

(declare-fun m!526589 () Bool)

(assert (=> start!50218 m!526589))

(declare-fun m!526591 () Bool)

(assert (=> b!549675 m!526591))

(declare-fun m!526593 () Bool)

(assert (=> b!549674 m!526593))

(assert (=> b!549673 m!526581))

(declare-fun m!526595 () Bool)

(assert (=> b!549673 m!526595))

(assert (=> b!549673 m!526581))

(declare-fun m!526597 () Bool)

(assert (=> b!549673 m!526597))

(assert (=> b!549673 m!526597))

(declare-fun m!526599 () Bool)

(assert (=> b!549673 m!526599))

(declare-fun m!526601 () Bool)

(assert (=> b!549673 m!526601))

(assert (=> b!549673 m!526581))

(declare-fun m!526603 () Bool)

(assert (=> b!549673 m!526603))

(assert (=> b!549673 m!526597))

(declare-fun m!526605 () Bool)

(assert (=> b!549673 m!526605))

(declare-fun m!526607 () Bool)

(assert (=> b!549680 m!526607))

(declare-fun m!526609 () Bool)

(assert (=> b!549676 m!526609))

(check-sat (not b!549679) (not b!549680) (not b!549673) (not b!549674) (not b!549675) (not b!549678) (not start!50218) (not b!549676))
(check-sat)
