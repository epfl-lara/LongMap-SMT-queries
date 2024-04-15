; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51350 () Bool)

(assert start!51350)

(declare-datatypes ((SeekEntryResult!5359 0))(
  ( (MissingZero!5359 (index!23663 (_ BitVec 32))) (Found!5359 (index!23664 (_ BitVec 32))) (Intermediate!5359 (undefined!6171 Bool) (index!23665 (_ BitVec 32)) (x!52585 (_ BitVec 32))) (Undefined!5359) (MissingVacant!5359 (index!23666 (_ BitVec 32))) )
))
(declare-fun lt!254803 () SeekEntryResult!5359)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35224 0))(
  ( (array!35225 (arr!16913 (Array (_ BitVec 32) (_ BitVec 64))) (size!17278 (_ BitVec 32))) )
))
(declare-fun lt!254801 () array!35224)

(declare-fun e!322928 () Bool)

(declare-fun b!560479 () Bool)

(declare-fun lt!254802 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35224 (_ BitVec 32)) SeekEntryResult!5359)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35224 (_ BitVec 32)) SeekEntryResult!5359)

(assert (=> b!560479 (= e!322928 (= (seekEntryOrOpen!0 lt!254802 lt!254801 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52585 lt!254803) (index!23665 lt!254803) (index!23665 lt!254803) lt!254802 lt!254801 mask!3119)))))

(declare-fun b!560480 () Bool)

(declare-fun res!351785 () Bool)

(declare-fun e!322925 () Bool)

(assert (=> b!560480 (=> (not res!351785) (not e!322925))))

(declare-fun a!3118 () array!35224)

(declare-datatypes ((List!11032 0))(
  ( (Nil!11029) (Cons!11028 (h!12031 (_ BitVec 64)) (t!17251 List!11032)) )
))
(declare-fun arrayNoDuplicates!0 (array!35224 (_ BitVec 32) List!11032) Bool)

(assert (=> b!560480 (= res!351785 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11029))))

(declare-fun b!560481 () Bool)

(declare-fun e!322922 () Bool)

(assert (=> b!560481 (= e!322922 e!322925)))

(declare-fun res!351780 () Bool)

(assert (=> b!560481 (=> (not res!351780) (not e!322925))))

(declare-fun lt!254799 () SeekEntryResult!5359)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560481 (= res!351780 (or (= lt!254799 (MissingZero!5359 i!1132)) (= lt!254799 (MissingVacant!5359 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!560481 (= lt!254799 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560482 () Bool)

(declare-fun e!322929 () Bool)

(assert (=> b!560482 (= e!322929 (not true))))

(declare-fun e!322923 () Bool)

(assert (=> b!560482 e!322923))

(declare-fun res!351781 () Bool)

(assert (=> b!560482 (=> (not res!351781) (not e!322923))))

(declare-fun lt!254804 () SeekEntryResult!5359)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560482 (= res!351781 (= lt!254804 (Found!5359 j!142)))))

(assert (=> b!560482 (= lt!254804 (seekEntryOrOpen!0 (select (arr!16913 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35224 (_ BitVec 32)) Bool)

(assert (=> b!560482 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17478 0))(
  ( (Unit!17479) )
))
(declare-fun lt!254800 () Unit!17478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17478)

(assert (=> b!560482 (= lt!254800 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560483 () Bool)

(declare-fun e!322924 () Bool)

(declare-fun e!322926 () Bool)

(assert (=> b!560483 (= e!322924 e!322926)))

(declare-fun res!351776 () Bool)

(assert (=> b!560483 (=> res!351776 e!322926)))

(declare-fun lt!254805 () (_ BitVec 64))

(assert (=> b!560483 (= res!351776 (or (= lt!254805 (select (arr!16913 a!3118) j!142)) (= lt!254805 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560483 (= lt!254805 (select (arr!16913 a!3118) (index!23665 lt!254803)))))

(declare-fun b!560484 () Bool)

(assert (=> b!560484 (= e!322926 e!322928)))

(declare-fun res!351778 () Bool)

(assert (=> b!560484 (=> (not res!351778) (not e!322928))))

(assert (=> b!560484 (= res!351778 (= lt!254804 (seekKeyOrZeroReturnVacant!0 (x!52585 lt!254803) (index!23665 lt!254803) (index!23665 lt!254803) (select (arr!16913 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!351775 () Bool)

(assert (=> start!51350 (=> (not res!351775) (not e!322922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51350 (= res!351775 (validMask!0 mask!3119))))

(assert (=> start!51350 e!322922))

(assert (=> start!51350 true))

(declare-fun array_inv!12796 (array!35224) Bool)

(assert (=> start!51350 (array_inv!12796 a!3118)))

(declare-fun b!560485 () Bool)

(declare-fun res!351774 () Bool)

(assert (=> b!560485 (=> (not res!351774) (not e!322922))))

(declare-fun arrayContainsKey!0 (array!35224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560485 (= res!351774 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560486 () Bool)

(assert (=> b!560486 (= e!322923 e!322924)))

(declare-fun res!351779 () Bool)

(assert (=> b!560486 (=> res!351779 e!322924)))

(get-info :version)

(assert (=> b!560486 (= res!351779 (or (undefined!6171 lt!254803) (not ((_ is Intermediate!5359) lt!254803))))))

(declare-fun b!560487 () Bool)

(declare-fun res!351783 () Bool)

(assert (=> b!560487 (=> (not res!351783) (not e!322922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560487 (= res!351783 (validKeyInArray!0 k0!1914))))

(declare-fun b!560488 () Bool)

(declare-fun res!351782 () Bool)

(assert (=> b!560488 (=> (not res!351782) (not e!322925))))

(assert (=> b!560488 (= res!351782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560489 () Bool)

(declare-fun res!351777 () Bool)

(assert (=> b!560489 (=> (not res!351777) (not e!322922))))

(assert (=> b!560489 (= res!351777 (validKeyInArray!0 (select (arr!16913 a!3118) j!142)))))

(declare-fun b!560490 () Bool)

(declare-fun res!351773 () Bool)

(assert (=> b!560490 (=> (not res!351773) (not e!322922))))

(assert (=> b!560490 (= res!351773 (and (= (size!17278 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17278 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17278 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560491 () Bool)

(assert (=> b!560491 (= e!322925 e!322929)))

(declare-fun res!351784 () Bool)

(assert (=> b!560491 (=> (not res!351784) (not e!322929))))

(declare-fun lt!254806 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35224 (_ BitVec 32)) SeekEntryResult!5359)

(assert (=> b!560491 (= res!351784 (= lt!254803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254806 lt!254802 lt!254801 mask!3119)))))

(declare-fun lt!254798 () (_ BitVec 32))

(assert (=> b!560491 (= lt!254803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254798 (select (arr!16913 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560491 (= lt!254806 (toIndex!0 lt!254802 mask!3119))))

(assert (=> b!560491 (= lt!254802 (select (store (arr!16913 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560491 (= lt!254798 (toIndex!0 (select (arr!16913 a!3118) j!142) mask!3119))))

(assert (=> b!560491 (= lt!254801 (array!35225 (store (arr!16913 a!3118) i!1132 k0!1914) (size!17278 a!3118)))))

(assert (= (and start!51350 res!351775) b!560490))

(assert (= (and b!560490 res!351773) b!560489))

(assert (= (and b!560489 res!351777) b!560487))

(assert (= (and b!560487 res!351783) b!560485))

(assert (= (and b!560485 res!351774) b!560481))

(assert (= (and b!560481 res!351780) b!560488))

(assert (= (and b!560488 res!351782) b!560480))

(assert (= (and b!560480 res!351785) b!560491))

(assert (= (and b!560491 res!351784) b!560482))

(assert (= (and b!560482 res!351781) b!560486))

(assert (= (and b!560486 (not res!351779)) b!560483))

(assert (= (and b!560483 (not res!351776)) b!560484))

(assert (= (and b!560484 res!351778) b!560479))

(declare-fun m!537785 () Bool)

(assert (=> b!560481 m!537785))

(declare-fun m!537787 () Bool)

(assert (=> b!560489 m!537787))

(assert (=> b!560489 m!537787))

(declare-fun m!537789 () Bool)

(assert (=> b!560489 m!537789))

(declare-fun m!537791 () Bool)

(assert (=> b!560487 m!537791))

(assert (=> b!560491 m!537787))

(declare-fun m!537793 () Bool)

(assert (=> b!560491 m!537793))

(assert (=> b!560491 m!537787))

(assert (=> b!560491 m!537787))

(declare-fun m!537795 () Bool)

(assert (=> b!560491 m!537795))

(declare-fun m!537797 () Bool)

(assert (=> b!560491 m!537797))

(declare-fun m!537799 () Bool)

(assert (=> b!560491 m!537799))

(declare-fun m!537801 () Bool)

(assert (=> b!560491 m!537801))

(declare-fun m!537803 () Bool)

(assert (=> b!560491 m!537803))

(declare-fun m!537805 () Bool)

(assert (=> b!560479 m!537805))

(declare-fun m!537807 () Bool)

(assert (=> b!560479 m!537807))

(declare-fun m!537809 () Bool)

(assert (=> start!51350 m!537809))

(declare-fun m!537811 () Bool)

(assert (=> start!51350 m!537811))

(assert (=> b!560484 m!537787))

(assert (=> b!560484 m!537787))

(declare-fun m!537813 () Bool)

(assert (=> b!560484 m!537813))

(assert (=> b!560483 m!537787))

(declare-fun m!537815 () Bool)

(assert (=> b!560483 m!537815))

(declare-fun m!537817 () Bool)

(assert (=> b!560488 m!537817))

(assert (=> b!560482 m!537787))

(assert (=> b!560482 m!537787))

(declare-fun m!537819 () Bool)

(assert (=> b!560482 m!537819))

(declare-fun m!537821 () Bool)

(assert (=> b!560482 m!537821))

(declare-fun m!537823 () Bool)

(assert (=> b!560482 m!537823))

(declare-fun m!537825 () Bool)

(assert (=> b!560485 m!537825))

(declare-fun m!537827 () Bool)

(assert (=> b!560480 m!537827))

(check-sat (not start!51350) (not b!560488) (not b!560489) (not b!560482) (not b!560487) (not b!560479) (not b!560480) (not b!560484) (not b!560491) (not b!560485) (not b!560481))
(check-sat)
