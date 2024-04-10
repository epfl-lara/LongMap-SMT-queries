; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50062 () Bool)

(assert start!50062)

(declare-fun b!548566 () Bool)

(declare-fun res!341889 () Bool)

(declare-fun e!316906 () Bool)

(assert (=> b!548566 (=> (not res!341889) (not e!316906))))

(declare-datatypes ((array!34599 0))(
  ( (array!34600 (arr!16618 (Array (_ BitVec 32) (_ BitVec 64))) (size!16982 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34599)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548566 (= res!341889 (validKeyInArray!0 (select (arr!16618 a!3118) j!142)))))

(declare-fun b!548567 () Bool)

(declare-fun e!316908 () Bool)

(assert (=> b!548567 (= e!316906 e!316908)))

(declare-fun res!341892 () Bool)

(assert (=> b!548567 (=> (not res!341892) (not e!316908))))

(declare-datatypes ((SeekEntryResult!5067 0))(
  ( (MissingZero!5067 (index!22495 (_ BitVec 32))) (Found!5067 (index!22496 (_ BitVec 32))) (Intermediate!5067 (undefined!5879 Bool) (index!22497 (_ BitVec 32)) (x!51434 (_ BitVec 32))) (Undefined!5067) (MissingVacant!5067 (index!22498 (_ BitVec 32))) )
))
(declare-fun lt!249868 () SeekEntryResult!5067)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548567 (= res!341892 (or (= lt!249868 (MissingZero!5067 i!1132)) (= lt!249868 (MissingVacant!5067 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34599 (_ BitVec 32)) SeekEntryResult!5067)

(assert (=> b!548567 (= lt!249868 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548568 () Bool)

(assert (=> b!548568 (= e!316908 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!548569 () Bool)

(declare-fun res!341894 () Bool)

(assert (=> b!548569 (=> (not res!341894) (not e!316906))))

(declare-fun arrayContainsKey!0 (array!34599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548569 (= res!341894 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548570 () Bool)

(declare-fun res!341893 () Bool)

(assert (=> b!548570 (=> (not res!341893) (not e!316906))))

(assert (=> b!548570 (= res!341893 (and (= (size!16982 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16982 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16982 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548571 () Bool)

(declare-fun res!341887 () Bool)

(assert (=> b!548571 (=> (not res!341887) (not e!316906))))

(assert (=> b!548571 (= res!341887 (validKeyInArray!0 k0!1914))))

(declare-fun b!548572 () Bool)

(declare-fun res!341888 () Bool)

(assert (=> b!548572 (=> (not res!341888) (not e!316908))))

(declare-datatypes ((List!10698 0))(
  ( (Nil!10695) (Cons!10694 (h!11664 (_ BitVec 64)) (t!16926 List!10698)) )
))
(declare-fun arrayNoDuplicates!0 (array!34599 (_ BitVec 32) List!10698) Bool)

(assert (=> b!548572 (= res!341888 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10695))))

(declare-fun res!341890 () Bool)

(assert (=> start!50062 (=> (not res!341890) (not e!316906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50062 (= res!341890 (validMask!0 mask!3119))))

(assert (=> start!50062 e!316906))

(assert (=> start!50062 true))

(declare-fun array_inv!12414 (array!34599) Bool)

(assert (=> start!50062 (array_inv!12414 a!3118)))

(declare-fun b!548573 () Bool)

(declare-fun res!341891 () Bool)

(assert (=> b!548573 (=> (not res!341891) (not e!316908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34599 (_ BitVec 32)) Bool)

(assert (=> b!548573 (= res!341891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50062 res!341890) b!548570))

(assert (= (and b!548570 res!341893) b!548566))

(assert (= (and b!548566 res!341889) b!548571))

(assert (= (and b!548571 res!341887) b!548569))

(assert (= (and b!548569 res!341894) b!548567))

(assert (= (and b!548567 res!341892) b!548573))

(assert (= (and b!548573 res!341891) b!548572))

(assert (= (and b!548572 res!341888) b!548568))

(declare-fun m!525561 () Bool)

(assert (=> b!548573 m!525561))

(declare-fun m!525563 () Bool)

(assert (=> start!50062 m!525563))

(declare-fun m!525565 () Bool)

(assert (=> start!50062 m!525565))

(declare-fun m!525567 () Bool)

(assert (=> b!548566 m!525567))

(assert (=> b!548566 m!525567))

(declare-fun m!525569 () Bool)

(assert (=> b!548566 m!525569))

(declare-fun m!525571 () Bool)

(assert (=> b!548567 m!525571))

(declare-fun m!525573 () Bool)

(assert (=> b!548569 m!525573))

(declare-fun m!525575 () Bool)

(assert (=> b!548572 m!525575))

(declare-fun m!525577 () Bool)

(assert (=> b!548571 m!525577))

(check-sat (not b!548567) (not b!548572) (not start!50062) (not b!548573) (not b!548569) (not b!548571) (not b!548566))
(check-sat)
