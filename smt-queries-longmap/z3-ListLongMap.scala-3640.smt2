; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50204 () Bool)

(assert start!50204)

(declare-fun b!549378 () Bool)

(declare-fun res!342664 () Bool)

(declare-fun e!317247 () Bool)

(assert (=> b!549378 (=> (not res!342664) (not e!317247))))

(declare-datatypes ((array!34666 0))(
  ( (array!34667 (arr!16649 (Array (_ BitVec 32) (_ BitVec 64))) (size!17014 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34666)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549378 (= res!342664 (validKeyInArray!0 (select (arr!16649 a!3118) j!142)))))

(declare-fun b!549379 () Bool)

(declare-fun e!317246 () Bool)

(assert (=> b!549379 (= e!317246 false)))

(declare-datatypes ((SeekEntryResult!5095 0))(
  ( (MissingZero!5095 (index!22607 (_ BitVec 32))) (Found!5095 (index!22608 (_ BitVec 32))) (Intermediate!5095 (undefined!5907 Bool) (index!22609 (_ BitVec 32)) (x!51548 (_ BitVec 32))) (Undefined!5095) (MissingVacant!5095 (index!22610 (_ BitVec 32))) )
))
(declare-fun lt!250028 () SeekEntryResult!5095)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!250026 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34666 (_ BitVec 32)) SeekEntryResult!5095)

(assert (=> b!549379 (= lt!250028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250026 (select (store (arr!16649 a!3118) i!1132 k0!1914) j!142) (array!34667 (store (arr!16649 a!3118) i!1132 k0!1914) (size!17014 a!3118)) mask!3119))))

(declare-fun lt!250029 () (_ BitVec 32))

(declare-fun lt!250027 () SeekEntryResult!5095)

(assert (=> b!549379 (= lt!250027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250029 (select (arr!16649 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549379 (= lt!250026 (toIndex!0 (select (store (arr!16649 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549379 (= lt!250029 (toIndex!0 (select (arr!16649 a!3118) j!142) mask!3119))))

(declare-fun b!549380 () Bool)

(declare-fun res!342668 () Bool)

(assert (=> b!549380 (=> (not res!342668) (not e!317247))))

(declare-fun arrayContainsKey!0 (array!34666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549380 (= res!342668 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549381 () Bool)

(assert (=> b!549381 (= e!317247 e!317246)))

(declare-fun res!342669 () Bool)

(assert (=> b!549381 (=> (not res!342669) (not e!317246))))

(declare-fun lt!250030 () SeekEntryResult!5095)

(assert (=> b!549381 (= res!342669 (or (= lt!250030 (MissingZero!5095 i!1132)) (= lt!250030 (MissingVacant!5095 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34666 (_ BitVec 32)) SeekEntryResult!5095)

(assert (=> b!549381 (= lt!250030 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549382 () Bool)

(declare-fun res!342667 () Bool)

(assert (=> b!549382 (=> (not res!342667) (not e!317246))))

(declare-datatypes ((List!10768 0))(
  ( (Nil!10765) (Cons!10764 (h!11737 (_ BitVec 64)) (t!16987 List!10768)) )
))
(declare-fun arrayNoDuplicates!0 (array!34666 (_ BitVec 32) List!10768) Bool)

(assert (=> b!549382 (= res!342667 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10765))))

(declare-fun b!549384 () Bool)

(declare-fun res!342665 () Bool)

(assert (=> b!549384 (=> (not res!342665) (not e!317246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34666 (_ BitVec 32)) Bool)

(assert (=> b!549384 (= res!342665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549385 () Bool)

(declare-fun res!342671 () Bool)

(assert (=> b!549385 (=> (not res!342671) (not e!317247))))

(assert (=> b!549385 (= res!342671 (and (= (size!17014 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17014 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17014 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549383 () Bool)

(declare-fun res!342666 () Bool)

(assert (=> b!549383 (=> (not res!342666) (not e!317247))))

(assert (=> b!549383 (= res!342666 (validKeyInArray!0 k0!1914))))

(declare-fun res!342670 () Bool)

(assert (=> start!50204 (=> (not res!342670) (not e!317247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50204 (= res!342670 (validMask!0 mask!3119))))

(assert (=> start!50204 e!317247))

(assert (=> start!50204 true))

(declare-fun array_inv!12532 (array!34666) Bool)

(assert (=> start!50204 (array_inv!12532 a!3118)))

(assert (= (and start!50204 res!342670) b!549385))

(assert (= (and b!549385 res!342671) b!549378))

(assert (= (and b!549378 res!342664) b!549383))

(assert (= (and b!549383 res!342666) b!549380))

(assert (= (and b!549380 res!342668) b!549381))

(assert (= (and b!549381 res!342669) b!549384))

(assert (= (and b!549384 res!342665) b!549382))

(assert (= (and b!549382 res!342667) b!549379))

(declare-fun m!525779 () Bool)

(assert (=> b!549379 m!525779))

(declare-fun m!525781 () Bool)

(assert (=> b!549379 m!525781))

(declare-fun m!525783 () Bool)

(assert (=> b!549379 m!525783))

(declare-fun m!525785 () Bool)

(assert (=> b!549379 m!525785))

(assert (=> b!549379 m!525779))

(declare-fun m!525787 () Bool)

(assert (=> b!549379 m!525787))

(assert (=> b!549379 m!525779))

(assert (=> b!549379 m!525783))

(declare-fun m!525789 () Bool)

(assert (=> b!549379 m!525789))

(assert (=> b!549379 m!525783))

(declare-fun m!525791 () Bool)

(assert (=> b!549379 m!525791))

(declare-fun m!525793 () Bool)

(assert (=> b!549380 m!525793))

(declare-fun m!525795 () Bool)

(assert (=> b!549382 m!525795))

(declare-fun m!525797 () Bool)

(assert (=> b!549384 m!525797))

(declare-fun m!525799 () Bool)

(assert (=> b!549383 m!525799))

(declare-fun m!525801 () Bool)

(assert (=> start!50204 m!525801))

(declare-fun m!525803 () Bool)

(assert (=> start!50204 m!525803))

(declare-fun m!525805 () Bool)

(assert (=> b!549381 m!525805))

(assert (=> b!549378 m!525779))

(assert (=> b!549378 m!525779))

(declare-fun m!525807 () Bool)

(assert (=> b!549378 m!525807))

(check-sat (not b!549383) (not b!549379) (not b!549380) (not b!549384) (not b!549378) (not start!50204) (not b!549382) (not b!549381))
(check-sat)
