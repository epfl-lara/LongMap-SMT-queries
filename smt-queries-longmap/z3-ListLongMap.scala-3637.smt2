; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50186 () Bool)

(assert start!50186)

(declare-fun b!549162 () Bool)

(declare-fun res!342453 () Bool)

(declare-fun e!317166 () Bool)

(assert (=> b!549162 (=> (not res!342453) (not e!317166))))

(declare-datatypes ((array!34648 0))(
  ( (array!34649 (arr!16640 (Array (_ BitVec 32) (_ BitVec 64))) (size!17005 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34648)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549162 (= res!342453 (validKeyInArray!0 (select (arr!16640 a!3118) j!142)))))

(declare-fun b!549163 () Bool)

(declare-fun res!342448 () Bool)

(assert (=> b!549163 (=> (not res!342448) (not e!317166))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!549163 (= res!342448 (validKeyInArray!0 k0!1914))))

(declare-fun b!549164 () Bool)

(declare-fun res!342454 () Bool)

(declare-fun e!317165 () Bool)

(assert (=> b!549164 (=> (not res!342454) (not e!317165))))

(declare-datatypes ((List!10759 0))(
  ( (Nil!10756) (Cons!10755 (h!11728 (_ BitVec 64)) (t!16978 List!10759)) )
))
(declare-fun arrayNoDuplicates!0 (array!34648 (_ BitVec 32) List!10759) Bool)

(assert (=> b!549164 (= res!342454 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10756))))

(declare-fun b!549165 () Bool)

(declare-fun res!342455 () Bool)

(assert (=> b!549165 (=> (not res!342455) (not e!317165))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34648 (_ BitVec 32)) Bool)

(assert (=> b!549165 (= res!342455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549166 () Bool)

(assert (=> b!549166 (= e!317166 e!317165)))

(declare-fun res!342452 () Bool)

(assert (=> b!549166 (=> (not res!342452) (not e!317165))))

(declare-datatypes ((SeekEntryResult!5086 0))(
  ( (MissingZero!5086 (index!22571 (_ BitVec 32))) (Found!5086 (index!22572 (_ BitVec 32))) (Intermediate!5086 (undefined!5898 Bool) (index!22573 (_ BitVec 32)) (x!51515 (_ BitVec 32))) (Undefined!5086) (MissingVacant!5086 (index!22574 (_ BitVec 32))) )
))
(declare-fun lt!249893 () SeekEntryResult!5086)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549166 (= res!342452 (or (= lt!249893 (MissingZero!5086 i!1132)) (= lt!249893 (MissingVacant!5086 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34648 (_ BitVec 32)) SeekEntryResult!5086)

(assert (=> b!549166 (= lt!249893 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549167 () Bool)

(declare-fun res!342450 () Bool)

(assert (=> b!549167 (=> (not res!342450) (not e!317166))))

(declare-fun arrayContainsKey!0 (array!34648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549167 (= res!342450 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!342451 () Bool)

(assert (=> start!50186 (=> (not res!342451) (not e!317166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50186 (= res!342451 (validMask!0 mask!3119))))

(assert (=> start!50186 e!317166))

(assert (=> start!50186 true))

(declare-fun array_inv!12523 (array!34648) Bool)

(assert (=> start!50186 (array_inv!12523 a!3118)))

(declare-fun b!549168 () Bool)

(assert (=> b!549168 (= e!317165 false)))

(declare-fun lt!249891 () (_ BitVec 32))

(declare-fun lt!249895 () SeekEntryResult!5086)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34648 (_ BitVec 32)) SeekEntryResult!5086)

(assert (=> b!549168 (= lt!249895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!249891 (select (store (arr!16640 a!3118) i!1132 k0!1914) j!142) (array!34649 (store (arr!16640 a!3118) i!1132 k0!1914) (size!17005 a!3118)) mask!3119))))

(declare-fun lt!249894 () SeekEntryResult!5086)

(declare-fun lt!249892 () (_ BitVec 32))

(assert (=> b!549168 (= lt!249894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!249892 (select (arr!16640 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549168 (= lt!249891 (toIndex!0 (select (store (arr!16640 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549168 (= lt!249892 (toIndex!0 (select (arr!16640 a!3118) j!142) mask!3119))))

(declare-fun b!549169 () Bool)

(declare-fun res!342449 () Bool)

(assert (=> b!549169 (=> (not res!342449) (not e!317166))))

(assert (=> b!549169 (= res!342449 (and (= (size!17005 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17005 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17005 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50186 res!342451) b!549169))

(assert (= (and b!549169 res!342449) b!549162))

(assert (= (and b!549162 res!342453) b!549163))

(assert (= (and b!549163 res!342448) b!549167))

(assert (= (and b!549167 res!342450) b!549166))

(assert (= (and b!549166 res!342452) b!549165))

(assert (= (and b!549165 res!342455) b!549164))

(assert (= (and b!549164 res!342454) b!549168))

(declare-fun m!525509 () Bool)

(assert (=> b!549167 m!525509))

(declare-fun m!525511 () Bool)

(assert (=> b!549168 m!525511))

(declare-fun m!525513 () Bool)

(assert (=> b!549168 m!525513))

(assert (=> b!549168 m!525511))

(declare-fun m!525515 () Bool)

(assert (=> b!549168 m!525515))

(declare-fun m!525517 () Bool)

(assert (=> b!549168 m!525517))

(declare-fun m!525519 () Bool)

(assert (=> b!549168 m!525519))

(assert (=> b!549168 m!525517))

(declare-fun m!525521 () Bool)

(assert (=> b!549168 m!525521))

(assert (=> b!549168 m!525517))

(declare-fun m!525523 () Bool)

(assert (=> b!549168 m!525523))

(assert (=> b!549168 m!525511))

(declare-fun m!525525 () Bool)

(assert (=> start!50186 m!525525))

(declare-fun m!525527 () Bool)

(assert (=> start!50186 m!525527))

(assert (=> b!549162 m!525511))

(assert (=> b!549162 m!525511))

(declare-fun m!525529 () Bool)

(assert (=> b!549162 m!525529))

(declare-fun m!525531 () Bool)

(assert (=> b!549164 m!525531))

(declare-fun m!525533 () Bool)

(assert (=> b!549166 m!525533))

(declare-fun m!525535 () Bool)

(assert (=> b!549165 m!525535))

(declare-fun m!525537 () Bool)

(assert (=> b!549163 m!525537))

(check-sat (not b!549166) (not b!549165) (not start!50186) (not b!549162) (not b!549163) (not b!549168) (not b!549167) (not b!549164))
(check-sat)
