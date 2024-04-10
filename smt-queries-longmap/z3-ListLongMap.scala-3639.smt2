; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50212 () Bool)

(assert start!50212)

(declare-fun b!549601 () Bool)

(declare-fun e!317401 () Bool)

(declare-fun e!317402 () Bool)

(assert (=> b!549601 (= e!317401 e!317402)))

(declare-fun res!342750 () Bool)

(assert (=> b!549601 (=> (not res!342750) (not e!317402))))

(declare-datatypes ((SeekEntryResult!5097 0))(
  ( (MissingZero!5097 (index!22615 (_ BitVec 32))) (Found!5097 (index!22616 (_ BitVec 32))) (Intermediate!5097 (undefined!5909 Bool) (index!22617 (_ BitVec 32)) (x!51547 (_ BitVec 32))) (Undefined!5097) (MissingVacant!5097 (index!22618 (_ BitVec 32))) )
))
(declare-fun lt!250233 () SeekEntryResult!5097)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549601 (= res!342750 (or (= lt!250233 (MissingZero!5097 i!1132)) (= lt!250233 (MissingVacant!5097 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34665 0))(
  ( (array!34666 (arr!16648 (Array (_ BitVec 32) (_ BitVec 64))) (size!17012 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34665)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34665 (_ BitVec 32)) SeekEntryResult!5097)

(assert (=> b!549601 (= lt!250233 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549602 () Bool)

(declare-fun res!342749 () Bool)

(assert (=> b!549602 (=> (not res!342749) (not e!317401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549602 (= res!342749 (validKeyInArray!0 k0!1914))))

(declare-fun b!549603 () Bool)

(assert (=> b!549603 (= e!317402 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!250232 () (_ BitVec 32))

(declare-fun lt!250231 () SeekEntryResult!5097)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34665 (_ BitVec 32)) SeekEntryResult!5097)

(assert (=> b!549603 (= lt!250231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250232 (select (store (arr!16648 a!3118) i!1132 k0!1914) j!142) (array!34666 (store (arr!16648 a!3118) i!1132 k0!1914) (size!17012 a!3118)) mask!3119))))

(declare-fun lt!250234 () (_ BitVec 32))

(declare-fun lt!250230 () SeekEntryResult!5097)

(assert (=> b!549603 (= lt!250230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250234 (select (arr!16648 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549603 (= lt!250232 (toIndex!0 (select (store (arr!16648 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549603 (= lt!250234 (toIndex!0 (select (arr!16648 a!3118) j!142) mask!3119))))

(declare-fun b!549604 () Bool)

(declare-fun res!342746 () Bool)

(assert (=> b!549604 (=> (not res!342746) (not e!317401))))

(assert (=> b!549604 (= res!342746 (validKeyInArray!0 (select (arr!16648 a!3118) j!142)))))

(declare-fun b!549605 () Bool)

(declare-fun res!342752 () Bool)

(assert (=> b!549605 (=> (not res!342752) (not e!317402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34665 (_ BitVec 32)) Bool)

(assert (=> b!549605 (= res!342752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549606 () Bool)

(declare-fun res!342751 () Bool)

(assert (=> b!549606 (=> (not res!342751) (not e!317402))))

(declare-datatypes ((List!10728 0))(
  ( (Nil!10725) (Cons!10724 (h!11697 (_ BitVec 64)) (t!16956 List!10728)) )
))
(declare-fun arrayNoDuplicates!0 (array!34665 (_ BitVec 32) List!10728) Bool)

(assert (=> b!549606 (= res!342751 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10725))))

(declare-fun b!549607 () Bool)

(declare-fun res!342748 () Bool)

(assert (=> b!549607 (=> (not res!342748) (not e!317401))))

(assert (=> b!549607 (= res!342748 (and (= (size!17012 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17012 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17012 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549608 () Bool)

(declare-fun res!342747 () Bool)

(assert (=> b!549608 (=> (not res!342747) (not e!317401))))

(declare-fun arrayContainsKey!0 (array!34665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549608 (= res!342747 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!342745 () Bool)

(assert (=> start!50212 (=> (not res!342745) (not e!317401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50212 (= res!342745 (validMask!0 mask!3119))))

(assert (=> start!50212 e!317401))

(assert (=> start!50212 true))

(declare-fun array_inv!12444 (array!34665) Bool)

(assert (=> start!50212 (array_inv!12444 a!3118)))

(assert (= (and start!50212 res!342745) b!549607))

(assert (= (and b!549607 res!342748) b!549604))

(assert (= (and b!549604 res!342746) b!549602))

(assert (= (and b!549602 res!342749) b!549608))

(assert (= (and b!549608 res!342747) b!549601))

(assert (= (and b!549601 res!342750) b!549605))

(assert (= (and b!549605 res!342752) b!549606))

(assert (= (and b!549606 res!342751) b!549603))

(declare-fun m!526491 () Bool)

(assert (=> b!549602 m!526491))

(declare-fun m!526493 () Bool)

(assert (=> b!549601 m!526493))

(declare-fun m!526495 () Bool)

(assert (=> b!549604 m!526495))

(assert (=> b!549604 m!526495))

(declare-fun m!526497 () Bool)

(assert (=> b!549604 m!526497))

(assert (=> b!549603 m!526495))

(declare-fun m!526499 () Bool)

(assert (=> b!549603 m!526499))

(assert (=> b!549603 m!526495))

(assert (=> b!549603 m!526495))

(declare-fun m!526501 () Bool)

(assert (=> b!549603 m!526501))

(declare-fun m!526503 () Bool)

(assert (=> b!549603 m!526503))

(declare-fun m!526505 () Bool)

(assert (=> b!549603 m!526505))

(assert (=> b!549603 m!526503))

(declare-fun m!526507 () Bool)

(assert (=> b!549603 m!526507))

(assert (=> b!549603 m!526503))

(declare-fun m!526509 () Bool)

(assert (=> b!549603 m!526509))

(declare-fun m!526511 () Bool)

(assert (=> b!549608 m!526511))

(declare-fun m!526513 () Bool)

(assert (=> b!549605 m!526513))

(declare-fun m!526515 () Bool)

(assert (=> start!50212 m!526515))

(declare-fun m!526517 () Bool)

(assert (=> start!50212 m!526517))

(declare-fun m!526519 () Bool)

(assert (=> b!549606 m!526519))

(check-sat (not b!549602) (not b!549608) (not b!549601) (not b!549604) (not b!549603) (not start!50212) (not b!549606) (not b!549605))
(check-sat)
