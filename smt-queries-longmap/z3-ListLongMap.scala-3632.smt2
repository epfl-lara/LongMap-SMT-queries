; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50108 () Bool)

(assert start!50108)

(declare-fun b!548640 () Bool)

(declare-fun e!316913 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!548640 (= e!316913 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!249724 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34615 0))(
  ( (array!34616 (arr!16625 (Array (_ BitVec 32) (_ BitVec 64))) (size!16990 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548640 (= lt!249724 (toIndex!0 (select (store (arr!16625 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun res!342018 () Bool)

(declare-fun e!316912 () Bool)

(assert (=> start!50108 (=> (not res!342018) (not e!316912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50108 (= res!342018 (validMask!0 mask!3119))))

(assert (=> start!50108 e!316912))

(assert (=> start!50108 true))

(declare-fun array_inv!12508 (array!34615) Bool)

(assert (=> start!50108 (array_inv!12508 a!3118)))

(declare-fun b!548641 () Bool)

(declare-fun res!342019 () Bool)

(assert (=> b!548641 (=> (not res!342019) (not e!316912))))

(assert (=> b!548641 (= res!342019 (and (= (size!16990 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16990 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16990 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548642 () Bool)

(declare-fun res!342015 () Bool)

(assert (=> b!548642 (=> (not res!342015) (not e!316912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548642 (= res!342015 (validKeyInArray!0 (select (arr!16625 a!3118) j!142)))))

(declare-fun b!548643 () Bool)

(declare-fun res!342016 () Bool)

(assert (=> b!548643 (=> (not res!342016) (not e!316913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34615 (_ BitVec 32)) Bool)

(assert (=> b!548643 (= res!342016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548644 () Bool)

(declare-fun res!342014 () Bool)

(assert (=> b!548644 (=> (not res!342014) (not e!316913))))

(declare-datatypes ((List!10744 0))(
  ( (Nil!10741) (Cons!10740 (h!11710 (_ BitVec 64)) (t!16963 List!10744)) )
))
(declare-fun arrayNoDuplicates!0 (array!34615 (_ BitVec 32) List!10744) Bool)

(assert (=> b!548644 (= res!342014 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10741))))

(declare-fun b!548645 () Bool)

(assert (=> b!548645 (= e!316912 e!316913)))

(declare-fun res!342017 () Bool)

(assert (=> b!548645 (=> (not res!342017) (not e!316913))))

(declare-datatypes ((SeekEntryResult!5071 0))(
  ( (MissingZero!5071 (index!22511 (_ BitVec 32))) (Found!5071 (index!22512 (_ BitVec 32))) (Intermediate!5071 (undefined!5883 Bool) (index!22513 (_ BitVec 32)) (x!51457 (_ BitVec 32))) (Undefined!5071) (MissingVacant!5071 (index!22514 (_ BitVec 32))) )
))
(declare-fun lt!249723 () SeekEntryResult!5071)

(assert (=> b!548645 (= res!342017 (or (= lt!249723 (MissingZero!5071 i!1132)) (= lt!249723 (MissingVacant!5071 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34615 (_ BitVec 32)) SeekEntryResult!5071)

(assert (=> b!548645 (= lt!249723 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548646 () Bool)

(declare-fun res!342020 () Bool)

(assert (=> b!548646 (=> (not res!342020) (not e!316912))))

(declare-fun arrayContainsKey!0 (array!34615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548646 (= res!342020 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548647 () Bool)

(declare-fun res!342013 () Bool)

(assert (=> b!548647 (=> (not res!342013) (not e!316912))))

(assert (=> b!548647 (= res!342013 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50108 res!342018) b!548641))

(assert (= (and b!548641 res!342019) b!548642))

(assert (= (and b!548642 res!342015) b!548647))

(assert (= (and b!548647 res!342013) b!548646))

(assert (= (and b!548646 res!342020) b!548645))

(assert (= (and b!548645 res!342017) b!548643))

(assert (= (and b!548643 res!342016) b!548644))

(assert (= (and b!548644 res!342014) b!548640))

(declare-fun m!525047 () Bool)

(assert (=> b!548645 m!525047))

(declare-fun m!525049 () Bool)

(assert (=> b!548640 m!525049))

(declare-fun m!525051 () Bool)

(assert (=> b!548640 m!525051))

(assert (=> b!548640 m!525051))

(declare-fun m!525053 () Bool)

(assert (=> b!548640 m!525053))

(declare-fun m!525055 () Bool)

(assert (=> b!548642 m!525055))

(assert (=> b!548642 m!525055))

(declare-fun m!525057 () Bool)

(assert (=> b!548642 m!525057))

(declare-fun m!525059 () Bool)

(assert (=> start!50108 m!525059))

(declare-fun m!525061 () Bool)

(assert (=> start!50108 m!525061))

(declare-fun m!525063 () Bool)

(assert (=> b!548647 m!525063))

(declare-fun m!525065 () Bool)

(assert (=> b!548643 m!525065))

(declare-fun m!525067 () Bool)

(assert (=> b!548646 m!525067))

(declare-fun m!525069 () Bool)

(assert (=> b!548644 m!525069))

(check-sat (not start!50108) (not b!548643) (not b!548646) (not b!548645) (not b!548644) (not b!548642) (not b!548647) (not b!548640))
(check-sat)
