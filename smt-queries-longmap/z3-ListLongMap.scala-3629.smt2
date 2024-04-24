; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50108 () Bool)

(assert start!50108)

(declare-fun b!548742 () Bool)

(declare-fun res!341960 () Bool)

(declare-fun e!317027 () Bool)

(assert (=> b!548742 (=> (not res!341960) (not e!317027))))

(declare-datatypes ((array!34591 0))(
  ( (array!34592 (arr!16612 (Array (_ BitVec 32) (_ BitVec 64))) (size!16976 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34591)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548742 (= res!341960 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548743 () Bool)

(declare-fun res!341958 () Bool)

(declare-fun e!317028 () Bool)

(assert (=> b!548743 (=> (not res!341958) (not e!317028))))

(declare-datatypes ((List!10599 0))(
  ( (Nil!10596) (Cons!10595 (h!11568 (_ BitVec 64)) (t!16819 List!10599)) )
))
(declare-fun arrayNoDuplicates!0 (array!34591 (_ BitVec 32) List!10599) Bool)

(assert (=> b!548743 (= res!341958 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10596))))

(declare-fun b!548744 () Bool)

(declare-fun res!341962 () Bool)

(assert (=> b!548744 (=> (not res!341962) (not e!317027))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!548744 (= res!341962 (and (= (size!16976 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16976 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16976 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548745 () Bool)

(declare-fun res!341965 () Bool)

(assert (=> b!548745 (=> (not res!341965) (not e!317027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548745 (= res!341965 (validKeyInArray!0 k0!1914))))

(declare-fun res!341959 () Bool)

(assert (=> start!50108 (=> (not res!341959) (not e!317027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50108 (= res!341959 (validMask!0 mask!3119))))

(assert (=> start!50108 e!317027))

(assert (=> start!50108 true))

(declare-fun array_inv!12471 (array!34591) Bool)

(assert (=> start!50108 (array_inv!12471 a!3118)))

(declare-fun b!548746 () Bool)

(declare-fun res!341961 () Bool)

(assert (=> b!548746 (=> (not res!341961) (not e!317028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34591 (_ BitVec 32)) Bool)

(assert (=> b!548746 (= res!341961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548747 () Bool)

(assert (=> b!548747 (= e!317028 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!548748 () Bool)

(declare-fun res!341964 () Bool)

(assert (=> b!548748 (=> (not res!341964) (not e!317027))))

(assert (=> b!548748 (= res!341964 (validKeyInArray!0 (select (arr!16612 a!3118) j!142)))))

(declare-fun b!548749 () Bool)

(assert (=> b!548749 (= e!317027 e!317028)))

(declare-fun res!341963 () Bool)

(assert (=> b!548749 (=> (not res!341963) (not e!317028))))

(declare-datatypes ((SeekEntryResult!5017 0))(
  ( (MissingZero!5017 (index!22295 (_ BitVec 32))) (Found!5017 (index!22296 (_ BitVec 32))) (Intermediate!5017 (undefined!5829 Bool) (index!22297 (_ BitVec 32)) (x!51387 (_ BitVec 32))) (Undefined!5017) (MissingVacant!5017 (index!22298 (_ BitVec 32))) )
))
(declare-fun lt!249976 () SeekEntryResult!5017)

(assert (=> b!548749 (= res!341963 (or (= lt!249976 (MissingZero!5017 i!1132)) (= lt!249976 (MissingVacant!5017 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34591 (_ BitVec 32)) SeekEntryResult!5017)

(assert (=> b!548749 (= lt!249976 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50108 res!341959) b!548744))

(assert (= (and b!548744 res!341962) b!548748))

(assert (= (and b!548748 res!341964) b!548745))

(assert (= (and b!548745 res!341965) b!548742))

(assert (= (and b!548742 res!341960) b!548749))

(assert (= (and b!548749 res!341963) b!548746))

(assert (= (and b!548746 res!341961) b!548743))

(assert (= (and b!548743 res!341958) b!548747))

(declare-fun m!525895 () Bool)

(assert (=> start!50108 m!525895))

(declare-fun m!525897 () Bool)

(assert (=> start!50108 m!525897))

(declare-fun m!525899 () Bool)

(assert (=> b!548749 m!525899))

(declare-fun m!525901 () Bool)

(assert (=> b!548743 m!525901))

(declare-fun m!525903 () Bool)

(assert (=> b!548748 m!525903))

(assert (=> b!548748 m!525903))

(declare-fun m!525905 () Bool)

(assert (=> b!548748 m!525905))

(declare-fun m!525907 () Bool)

(assert (=> b!548742 m!525907))

(declare-fun m!525909 () Bool)

(assert (=> b!548746 m!525909))

(declare-fun m!525911 () Bool)

(assert (=> b!548745 m!525911))

(check-sat (not b!548749) (not b!548745) (not b!548748) (not start!50108) (not b!548746) (not b!548742) (not b!548743))
(check-sat)
