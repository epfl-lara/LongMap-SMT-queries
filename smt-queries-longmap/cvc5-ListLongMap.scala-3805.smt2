; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52184 () Bool)

(assert start!52184)

(declare-fun b!569643 () Bool)

(declare-fun res!359663 () Bool)

(declare-fun e!327671 () Bool)

(assert (=> b!569643 (=> (not res!359663) (not e!327671))))

(declare-datatypes ((array!35707 0))(
  ( (array!35708 (arr!17145 (Array (_ BitVec 32) (_ BitVec 64))) (size!17509 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35707)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35707 (_ BitVec 32)) Bool)

(assert (=> b!569643 (= res!359663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!359668 () Bool)

(declare-fun e!327672 () Bool)

(assert (=> start!52184 (=> (not res!359668) (not e!327672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52184 (= res!359668 (validMask!0 mask!3119))))

(assert (=> start!52184 e!327672))

(assert (=> start!52184 true))

(declare-fun array_inv!12941 (array!35707) Bool)

(assert (=> start!52184 (array_inv!12941 a!3118)))

(declare-fun b!569644 () Bool)

(assert (=> b!569644 (= e!327672 e!327671)))

(declare-fun res!359665 () Bool)

(assert (=> b!569644 (=> (not res!359665) (not e!327671))))

(declare-datatypes ((SeekEntryResult!5594 0))(
  ( (MissingZero!5594 (index!24603 (_ BitVec 32))) (Found!5594 (index!24604 (_ BitVec 32))) (Intermediate!5594 (undefined!6406 Bool) (index!24605 (_ BitVec 32)) (x!53477 (_ BitVec 32))) (Undefined!5594) (MissingVacant!5594 (index!24606 (_ BitVec 32))) )
))
(declare-fun lt!259680 () SeekEntryResult!5594)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569644 (= res!359665 (or (= lt!259680 (MissingZero!5594 i!1132)) (= lt!259680 (MissingVacant!5594 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35707 (_ BitVec 32)) SeekEntryResult!5594)

(assert (=> b!569644 (= lt!259680 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569645 () Bool)

(declare-fun res!359667 () Bool)

(assert (=> b!569645 (=> (not res!359667) (not e!327672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569645 (= res!359667 (validKeyInArray!0 k!1914))))

(declare-fun b!569646 () Bool)

(declare-fun res!359661 () Bool)

(assert (=> b!569646 (=> (not res!359661) (not e!327671))))

(declare-datatypes ((List!11225 0))(
  ( (Nil!11222) (Cons!11221 (h!12242 (_ BitVec 64)) (t!17453 List!11225)) )
))
(declare-fun arrayNoDuplicates!0 (array!35707 (_ BitVec 32) List!11225) Bool)

(assert (=> b!569646 (= res!359661 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11222))))

(declare-fun b!569647 () Bool)

(declare-fun e!327670 () Bool)

(assert (=> b!569647 (= e!327671 e!327670)))

(declare-fun res!359662 () Bool)

(assert (=> b!569647 (=> (not res!359662) (not e!327670))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259683 () (_ BitVec 32))

(declare-fun lt!259681 () SeekEntryResult!5594)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35707 (_ BitVec 32)) SeekEntryResult!5594)

(assert (=> b!569647 (= res!359662 (= lt!259681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259683 (select (store (arr!17145 a!3118) i!1132 k!1914) j!142) (array!35708 (store (arr!17145 a!3118) i!1132 k!1914) (size!17509 a!3118)) mask!3119)))))

(declare-fun lt!259682 () (_ BitVec 32))

(assert (=> b!569647 (= lt!259681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259682 (select (arr!17145 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569647 (= lt!259683 (toIndex!0 (select (store (arr!17145 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569647 (= lt!259682 (toIndex!0 (select (arr!17145 a!3118) j!142) mask!3119))))

(declare-fun b!569648 () Bool)

(assert (=> b!569648 (= e!327670 (not true))))

(declare-fun lt!259679 () SeekEntryResult!5594)

(assert (=> b!569648 (and (= lt!259679 (Found!5594 j!142)) (or (undefined!6406 lt!259681) (not (is-Intermediate!5594 lt!259681)) (= (select (arr!17145 a!3118) (index!24605 lt!259681)) (select (arr!17145 a!3118) j!142)) (not (= (select (arr!17145 a!3118) (index!24605 lt!259681)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259679 (MissingZero!5594 (index!24605 lt!259681)))))))

(assert (=> b!569648 (= lt!259679 (seekEntryOrOpen!0 (select (arr!17145 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569648 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17890 0))(
  ( (Unit!17891) )
))
(declare-fun lt!259684 () Unit!17890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17890)

(assert (=> b!569648 (= lt!259684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569649 () Bool)

(declare-fun res!359669 () Bool)

(assert (=> b!569649 (=> (not res!359669) (not e!327672))))

(declare-fun arrayContainsKey!0 (array!35707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569649 (= res!359669 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569650 () Bool)

(declare-fun res!359664 () Bool)

(assert (=> b!569650 (=> (not res!359664) (not e!327672))))

(assert (=> b!569650 (= res!359664 (and (= (size!17509 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17509 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17509 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569651 () Bool)

(declare-fun res!359666 () Bool)

(assert (=> b!569651 (=> (not res!359666) (not e!327672))))

(assert (=> b!569651 (= res!359666 (validKeyInArray!0 (select (arr!17145 a!3118) j!142)))))

(assert (= (and start!52184 res!359668) b!569650))

(assert (= (and b!569650 res!359664) b!569651))

(assert (= (and b!569651 res!359666) b!569645))

(assert (= (and b!569645 res!359667) b!569649))

(assert (= (and b!569649 res!359669) b!569644))

(assert (= (and b!569644 res!359665) b!569643))

(assert (= (and b!569643 res!359663) b!569646))

(assert (= (and b!569646 res!359661) b!569647))

(assert (= (and b!569647 res!359662) b!569648))

(declare-fun m!548457 () Bool)

(assert (=> b!569646 m!548457))

(declare-fun m!548459 () Bool)

(assert (=> start!52184 m!548459))

(declare-fun m!548461 () Bool)

(assert (=> start!52184 m!548461))

(declare-fun m!548463 () Bool)

(assert (=> b!569647 m!548463))

(declare-fun m!548465 () Bool)

(assert (=> b!569647 m!548465))

(assert (=> b!569647 m!548463))

(declare-fun m!548467 () Bool)

(assert (=> b!569647 m!548467))

(assert (=> b!569647 m!548467))

(declare-fun m!548469 () Bool)

(assert (=> b!569647 m!548469))

(assert (=> b!569647 m!548463))

(declare-fun m!548471 () Bool)

(assert (=> b!569647 m!548471))

(declare-fun m!548473 () Bool)

(assert (=> b!569647 m!548473))

(assert (=> b!569647 m!548467))

(declare-fun m!548475 () Bool)

(assert (=> b!569647 m!548475))

(declare-fun m!548477 () Bool)

(assert (=> b!569649 m!548477))

(assert (=> b!569648 m!548463))

(declare-fun m!548479 () Bool)

(assert (=> b!569648 m!548479))

(declare-fun m!548481 () Bool)

(assert (=> b!569648 m!548481))

(declare-fun m!548483 () Bool)

(assert (=> b!569648 m!548483))

(assert (=> b!569648 m!548463))

(declare-fun m!548485 () Bool)

(assert (=> b!569648 m!548485))

(declare-fun m!548487 () Bool)

(assert (=> b!569645 m!548487))

(assert (=> b!569651 m!548463))

(assert (=> b!569651 m!548463))

(declare-fun m!548489 () Bool)

(assert (=> b!569651 m!548489))

(declare-fun m!548491 () Bool)

(assert (=> b!569643 m!548491))

(declare-fun m!548493 () Bool)

(assert (=> b!569644 m!548493))

(push 1)

