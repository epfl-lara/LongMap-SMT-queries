; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50198 () Bool)

(assert start!50198)

(declare-fun b!549306 () Bool)

(declare-fun e!317218 () Bool)

(assert (=> b!549306 (= e!317218 false)))

(declare-fun lt!249981 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34660 0))(
  ( (array!34661 (arr!16646 (Array (_ BitVec 32) (_ BitVec 64))) (size!17011 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34660)

(declare-datatypes ((SeekEntryResult!5092 0))(
  ( (MissingZero!5092 (index!22595 (_ BitVec 32))) (Found!5092 (index!22596 (_ BitVec 32))) (Intermediate!5092 (undefined!5904 Bool) (index!22597 (_ BitVec 32)) (x!51537 (_ BitVec 32))) (Undefined!5092) (MissingVacant!5092 (index!22598 (_ BitVec 32))) )
))
(declare-fun lt!249984 () SeekEntryResult!5092)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34660 (_ BitVec 32)) SeekEntryResult!5092)

(assert (=> b!549306 (= lt!249984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!249981 (select (store (arr!16646 a!3118) i!1132 k0!1914) j!142) (array!34661 (store (arr!16646 a!3118) i!1132 k0!1914) (size!17011 a!3118)) mask!3119))))

(declare-fun lt!249985 () SeekEntryResult!5092)

(declare-fun lt!249982 () (_ BitVec 32))

(assert (=> b!549306 (= lt!249985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!249982 (select (arr!16646 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549306 (= lt!249981 (toIndex!0 (select (store (arr!16646 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549306 (= lt!249982 (toIndex!0 (select (arr!16646 a!3118) j!142) mask!3119))))

(declare-fun b!549307 () Bool)

(declare-fun res!342598 () Bool)

(declare-fun e!317219 () Bool)

(assert (=> b!549307 (=> (not res!342598) (not e!317219))))

(assert (=> b!549307 (= res!342598 (and (= (size!17011 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17011 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17011 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549309 () Bool)

(declare-fun res!342596 () Bool)

(assert (=> b!549309 (=> (not res!342596) (not e!317218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34660 (_ BitVec 32)) Bool)

(assert (=> b!549309 (= res!342596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549310 () Bool)

(assert (=> b!549310 (= e!317219 e!317218)))

(declare-fun res!342594 () Bool)

(assert (=> b!549310 (=> (not res!342594) (not e!317218))))

(declare-fun lt!249983 () SeekEntryResult!5092)

(assert (=> b!549310 (= res!342594 (or (= lt!249983 (MissingZero!5092 i!1132)) (= lt!249983 (MissingVacant!5092 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34660 (_ BitVec 32)) SeekEntryResult!5092)

(assert (=> b!549310 (= lt!249983 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549311 () Bool)

(declare-fun res!342592 () Bool)

(assert (=> b!549311 (=> (not res!342592) (not e!317219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549311 (= res!342592 (validKeyInArray!0 (select (arr!16646 a!3118) j!142)))))

(declare-fun b!549312 () Bool)

(declare-fun res!342599 () Bool)

(assert (=> b!549312 (=> (not res!342599) (not e!317219))))

(assert (=> b!549312 (= res!342599 (validKeyInArray!0 k0!1914))))

(declare-fun b!549313 () Bool)

(declare-fun res!342593 () Bool)

(assert (=> b!549313 (=> (not res!342593) (not e!317218))))

(declare-datatypes ((List!10765 0))(
  ( (Nil!10762) (Cons!10761 (h!11734 (_ BitVec 64)) (t!16984 List!10765)) )
))
(declare-fun arrayNoDuplicates!0 (array!34660 (_ BitVec 32) List!10765) Bool)

(assert (=> b!549313 (= res!342593 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10762))))

(declare-fun res!342597 () Bool)

(assert (=> start!50198 (=> (not res!342597) (not e!317219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50198 (= res!342597 (validMask!0 mask!3119))))

(assert (=> start!50198 e!317219))

(assert (=> start!50198 true))

(declare-fun array_inv!12529 (array!34660) Bool)

(assert (=> start!50198 (array_inv!12529 a!3118)))

(declare-fun b!549308 () Bool)

(declare-fun res!342595 () Bool)

(assert (=> b!549308 (=> (not res!342595) (not e!317219))))

(declare-fun arrayContainsKey!0 (array!34660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549308 (= res!342595 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50198 res!342597) b!549307))

(assert (= (and b!549307 res!342598) b!549311))

(assert (= (and b!549311 res!342592) b!549312))

(assert (= (and b!549312 res!342599) b!549308))

(assert (= (and b!549308 res!342595) b!549310))

(assert (= (and b!549310 res!342594) b!549309))

(assert (= (and b!549309 res!342596) b!549313))

(assert (= (and b!549313 res!342593) b!549306))

(declare-fun m!525689 () Bool)

(assert (=> b!549308 m!525689))

(declare-fun m!525691 () Bool)

(assert (=> b!549310 m!525691))

(declare-fun m!525693 () Bool)

(assert (=> b!549312 m!525693))

(declare-fun m!525695 () Bool)

(assert (=> b!549311 m!525695))

(assert (=> b!549311 m!525695))

(declare-fun m!525697 () Bool)

(assert (=> b!549311 m!525697))

(declare-fun m!525699 () Bool)

(assert (=> start!50198 m!525699))

(declare-fun m!525701 () Bool)

(assert (=> start!50198 m!525701))

(assert (=> b!549306 m!525695))

(declare-fun m!525703 () Bool)

(assert (=> b!549306 m!525703))

(assert (=> b!549306 m!525695))

(declare-fun m!525705 () Bool)

(assert (=> b!549306 m!525705))

(declare-fun m!525707 () Bool)

(assert (=> b!549306 m!525707))

(assert (=> b!549306 m!525705))

(declare-fun m!525709 () Bool)

(assert (=> b!549306 m!525709))

(assert (=> b!549306 m!525695))

(declare-fun m!525711 () Bool)

(assert (=> b!549306 m!525711))

(assert (=> b!549306 m!525705))

(declare-fun m!525713 () Bool)

(assert (=> b!549306 m!525713))

(declare-fun m!525715 () Bool)

(assert (=> b!549313 m!525715))

(declare-fun m!525717 () Bool)

(assert (=> b!549309 m!525717))

(check-sat (not b!549311) (not b!549306) (not b!549309) (not start!50198) (not b!549312) (not b!549310) (not b!549313) (not b!549308))
(check-sat)
