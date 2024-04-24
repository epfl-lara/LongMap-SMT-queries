; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50096 () Bool)

(assert start!50096)

(declare-fun b!548598 () Bool)

(declare-fun e!316973 () Bool)

(assert (=> b!548598 (= e!316973 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!249943 () (_ BitVec 32))

(declare-datatypes ((array!34579 0))(
  ( (array!34580 (arr!16606 (Array (_ BitVec 32) (_ BitVec 64))) (size!16970 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34579)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548598 (= lt!249943 (toIndex!0 (select (arr!16606 a!3118) j!142) mask!3119))))

(declare-fun b!548599 () Bool)

(declare-fun res!341820 () Bool)

(declare-fun e!316972 () Bool)

(assert (=> b!548599 (=> (not res!341820) (not e!316972))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548599 (= res!341820 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!341817 () Bool)

(assert (=> start!50096 (=> (not res!341817) (not e!316972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50096 (= res!341817 (validMask!0 mask!3119))))

(assert (=> start!50096 e!316972))

(assert (=> start!50096 true))

(declare-fun array_inv!12465 (array!34579) Bool)

(assert (=> start!50096 (array_inv!12465 a!3118)))

(declare-fun b!548600 () Bool)

(declare-fun res!341815 () Bool)

(assert (=> b!548600 (=> (not res!341815) (not e!316973))))

(declare-datatypes ((List!10593 0))(
  ( (Nil!10590) (Cons!10589 (h!11562 (_ BitVec 64)) (t!16813 List!10593)) )
))
(declare-fun arrayNoDuplicates!0 (array!34579 (_ BitVec 32) List!10593) Bool)

(assert (=> b!548600 (= res!341815 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10590))))

(declare-fun b!548601 () Bool)

(declare-fun res!341814 () Bool)

(assert (=> b!548601 (=> (not res!341814) (not e!316972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548601 (= res!341814 (validKeyInArray!0 k0!1914))))

(declare-fun b!548602 () Bool)

(assert (=> b!548602 (= e!316972 e!316973)))

(declare-fun res!341818 () Bool)

(assert (=> b!548602 (=> (not res!341818) (not e!316973))))

(declare-datatypes ((SeekEntryResult!5011 0))(
  ( (MissingZero!5011 (index!22271 (_ BitVec 32))) (Found!5011 (index!22272 (_ BitVec 32))) (Intermediate!5011 (undefined!5823 Bool) (index!22273 (_ BitVec 32)) (x!51365 (_ BitVec 32))) (Undefined!5011) (MissingVacant!5011 (index!22274 (_ BitVec 32))) )
))
(declare-fun lt!249942 () SeekEntryResult!5011)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548602 (= res!341818 (or (= lt!249942 (MissingZero!5011 i!1132)) (= lt!249942 (MissingVacant!5011 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34579 (_ BitVec 32)) SeekEntryResult!5011)

(assert (=> b!548602 (= lt!249942 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548603 () Bool)

(declare-fun res!341816 () Bool)

(assert (=> b!548603 (=> (not res!341816) (not e!316973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34579 (_ BitVec 32)) Bool)

(assert (=> b!548603 (= res!341816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548604 () Bool)

(declare-fun res!341821 () Bool)

(assert (=> b!548604 (=> (not res!341821) (not e!316972))))

(assert (=> b!548604 (= res!341821 (and (= (size!16970 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16970 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16970 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548605 () Bool)

(declare-fun res!341819 () Bool)

(assert (=> b!548605 (=> (not res!341819) (not e!316972))))

(assert (=> b!548605 (= res!341819 (validKeyInArray!0 (select (arr!16606 a!3118) j!142)))))

(assert (= (and start!50096 res!341817) b!548604))

(assert (= (and b!548604 res!341821) b!548605))

(assert (= (and b!548605 res!341819) b!548601))

(assert (= (and b!548601 res!341814) b!548599))

(assert (= (and b!548599 res!341820) b!548602))

(assert (= (and b!548602 res!341818) b!548603))

(assert (= (and b!548603 res!341816) b!548600))

(assert (= (and b!548600 res!341815) b!548598))

(declare-fun m!525775 () Bool)

(assert (=> b!548598 m!525775))

(assert (=> b!548598 m!525775))

(declare-fun m!525777 () Bool)

(assert (=> b!548598 m!525777))

(declare-fun m!525779 () Bool)

(assert (=> b!548603 m!525779))

(declare-fun m!525781 () Bool)

(assert (=> b!548599 m!525781))

(assert (=> b!548605 m!525775))

(assert (=> b!548605 m!525775))

(declare-fun m!525783 () Bool)

(assert (=> b!548605 m!525783))

(declare-fun m!525785 () Bool)

(assert (=> start!50096 m!525785))

(declare-fun m!525787 () Bool)

(assert (=> start!50096 m!525787))

(declare-fun m!525789 () Bool)

(assert (=> b!548602 m!525789))

(declare-fun m!525791 () Bool)

(assert (=> b!548601 m!525791))

(declare-fun m!525793 () Bool)

(assert (=> b!548600 m!525793))

(check-sat (not b!548601) (not b!548602) (not start!50096) (not b!548600) (not b!548599) (not b!548598) (not b!548605) (not b!548603))
(check-sat)
