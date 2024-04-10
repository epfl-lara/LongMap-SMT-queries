; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50052 () Bool)

(assert start!50052)

(declare-fun b!548446 () Bool)

(declare-fun res!341768 () Bool)

(declare-fun e!316862 () Bool)

(assert (=> b!548446 (=> (not res!341768) (not e!316862))))

(declare-datatypes ((array!34589 0))(
  ( (array!34590 (arr!16613 (Array (_ BitVec 32) (_ BitVec 64))) (size!16977 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34589)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34589 (_ BitVec 32)) Bool)

(assert (=> b!548446 (= res!341768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548447 () Bool)

(declare-fun res!341770 () Bool)

(declare-fun e!316863 () Bool)

(assert (=> b!548447 (=> (not res!341770) (not e!316863))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548447 (= res!341770 (validKeyInArray!0 k!1914))))

(declare-fun b!548448 () Bool)

(declare-fun res!341774 () Bool)

(assert (=> b!548448 (=> (not res!341774) (not e!316863))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548448 (= res!341774 (and (= (size!16977 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16977 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16977 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!341769 () Bool)

(assert (=> start!50052 (=> (not res!341769) (not e!316863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50052 (= res!341769 (validMask!0 mask!3119))))

(assert (=> start!50052 e!316863))

(assert (=> start!50052 true))

(declare-fun array_inv!12409 (array!34589) Bool)

(assert (=> start!50052 (array_inv!12409 a!3118)))

(declare-fun b!548449 () Bool)

(declare-fun res!341772 () Bool)

(assert (=> b!548449 (=> (not res!341772) (not e!316862))))

(declare-datatypes ((List!10693 0))(
  ( (Nil!10690) (Cons!10689 (h!11659 (_ BitVec 64)) (t!16921 List!10693)) )
))
(declare-fun arrayNoDuplicates!0 (array!34589 (_ BitVec 32) List!10693) Bool)

(assert (=> b!548449 (= res!341772 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10690))))

(declare-fun b!548450 () Bool)

(declare-fun res!341771 () Bool)

(assert (=> b!548450 (=> (not res!341771) (not e!316863))))

(assert (=> b!548450 (= res!341771 (validKeyInArray!0 (select (arr!16613 a!3118) j!142)))))

(declare-fun b!548451 () Bool)

(declare-fun res!341767 () Bool)

(assert (=> b!548451 (=> (not res!341767) (not e!316863))))

(declare-fun arrayContainsKey!0 (array!34589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548451 (= res!341767 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548452 () Bool)

(assert (=> b!548452 (= e!316862 false)))

(declare-fun lt!249843 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548452 (= lt!249843 (toIndex!0 (select (arr!16613 a!3118) j!142) mask!3119))))

(declare-fun b!548453 () Bool)

(assert (=> b!548453 (= e!316863 e!316862)))

(declare-fun res!341773 () Bool)

(assert (=> b!548453 (=> (not res!341773) (not e!316862))))

(declare-datatypes ((SeekEntryResult!5062 0))(
  ( (MissingZero!5062 (index!22475 (_ BitVec 32))) (Found!5062 (index!22476 (_ BitVec 32))) (Intermediate!5062 (undefined!5874 Bool) (index!22477 (_ BitVec 32)) (x!51413 (_ BitVec 32))) (Undefined!5062) (MissingVacant!5062 (index!22478 (_ BitVec 32))) )
))
(declare-fun lt!249844 () SeekEntryResult!5062)

(assert (=> b!548453 (= res!341773 (or (= lt!249844 (MissingZero!5062 i!1132)) (= lt!249844 (MissingVacant!5062 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34589 (_ BitVec 32)) SeekEntryResult!5062)

(assert (=> b!548453 (= lt!249844 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50052 res!341769) b!548448))

(assert (= (and b!548448 res!341774) b!548450))

(assert (= (and b!548450 res!341771) b!548447))

(assert (= (and b!548447 res!341770) b!548451))

(assert (= (and b!548451 res!341767) b!548453))

(assert (= (and b!548453 res!341773) b!548446))

(assert (= (and b!548446 res!341768) b!548449))

(assert (= (and b!548449 res!341772) b!548452))

(declare-fun m!525463 () Bool)

(assert (=> b!548452 m!525463))

(assert (=> b!548452 m!525463))

(declare-fun m!525465 () Bool)

(assert (=> b!548452 m!525465))

(declare-fun m!525467 () Bool)

(assert (=> b!548453 m!525467))

(declare-fun m!525469 () Bool)

(assert (=> b!548447 m!525469))

(assert (=> b!548450 m!525463))

(assert (=> b!548450 m!525463))

(declare-fun m!525471 () Bool)

(assert (=> b!548450 m!525471))

(declare-fun m!525473 () Bool)

(assert (=> start!50052 m!525473))

(declare-fun m!525475 () Bool)

(assert (=> start!50052 m!525475))

(declare-fun m!525477 () Bool)

(assert (=> b!548446 m!525477))

(declare-fun m!525479 () Bool)

(assert (=> b!548451 m!525479))

(declare-fun m!525481 () Bool)

(assert (=> b!548449 m!525481))

(push 1)

(assert (not start!50052))

(assert (not b!548449))

(assert (not b!548453))

(assert (not b!548447))

