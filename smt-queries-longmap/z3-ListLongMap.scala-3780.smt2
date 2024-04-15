; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51722 () Bool)

(assert start!51722)

(declare-fun b!565732 () Bool)

(declare-fun res!356851 () Bool)

(declare-fun e!325612 () Bool)

(assert (=> b!565732 (=> (not res!356851) (not e!325612))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565732 (= res!356851 (validKeyInArray!0 k0!1914))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!565733 () Bool)

(declare-fun e!325614 () Bool)

(declare-datatypes ((array!35539 0))(
  ( (array!35540 (arr!17069 (Array (_ BitVec 32) (_ BitVec 64))) (size!17434 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35539)

(declare-datatypes ((SeekEntryResult!5515 0))(
  ( (MissingZero!5515 (index!24287 (_ BitVec 32))) (Found!5515 (index!24288 (_ BitVec 32))) (Intermediate!5515 (undefined!6327 Bool) (index!24289 (_ BitVec 32)) (x!53163 (_ BitVec 32))) (Undefined!5515) (MissingVacant!5515 (index!24290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35539 (_ BitVec 32)) SeekEntryResult!5515)

(assert (=> b!565733 (= e!325614 (= (seekEntryOrOpen!0 (select (arr!17069 a!3118) j!142) a!3118 mask!3119) (Found!5515 j!142)))))

(declare-fun b!565734 () Bool)

(declare-fun e!325611 () Bool)

(assert (=> b!565734 (= e!325611 (not true))))

(assert (=> b!565734 e!325614))

(declare-fun res!356849 () Bool)

(assert (=> b!565734 (=> (not res!356849) (not e!325614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35539 (_ BitVec 32)) Bool)

(assert (=> b!565734 (= res!356849 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17718 0))(
  ( (Unit!17719) )
))
(declare-fun lt!257767 () Unit!17718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17718)

(assert (=> b!565734 (= lt!257767 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565735 () Bool)

(declare-fun res!356846 () Bool)

(assert (=> b!565735 (=> (not res!356846) (not e!325611))))

(assert (=> b!565735 (= res!356846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565736 () Bool)

(assert (=> b!565736 (= e!325612 e!325611)))

(declare-fun res!356847 () Bool)

(assert (=> b!565736 (=> (not res!356847) (not e!325611))))

(declare-fun lt!257766 () SeekEntryResult!5515)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565736 (= res!356847 (or (= lt!257766 (MissingZero!5515 i!1132)) (= lt!257766 (MissingVacant!5515 i!1132))))))

(assert (=> b!565736 (= lt!257766 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565737 () Bool)

(declare-fun res!356844 () Bool)

(assert (=> b!565737 (=> (not res!356844) (not e!325612))))

(declare-fun arrayContainsKey!0 (array!35539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565737 (= res!356844 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565738 () Bool)

(declare-fun res!356852 () Bool)

(assert (=> b!565738 (=> (not res!356852) (not e!325611))))

(declare-datatypes ((List!11188 0))(
  ( (Nil!11185) (Cons!11184 (h!12190 (_ BitVec 64)) (t!17407 List!11188)) )
))
(declare-fun arrayNoDuplicates!0 (array!35539 (_ BitVec 32) List!11188) Bool)

(assert (=> b!565738 (= res!356852 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11185))))

(declare-fun b!565739 () Bool)

(declare-fun res!356850 () Bool)

(assert (=> b!565739 (=> (not res!356850) (not e!325612))))

(assert (=> b!565739 (= res!356850 (and (= (size!17434 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17434 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17434 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!356843 () Bool)

(assert (=> start!51722 (=> (not res!356843) (not e!325612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51722 (= res!356843 (validMask!0 mask!3119))))

(assert (=> start!51722 e!325612))

(assert (=> start!51722 true))

(declare-fun array_inv!12952 (array!35539) Bool)

(assert (=> start!51722 (array_inv!12952 a!3118)))

(declare-fun b!565740 () Bool)

(declare-fun res!356848 () Bool)

(assert (=> b!565740 (=> (not res!356848) (not e!325612))))

(assert (=> b!565740 (= res!356848 (validKeyInArray!0 (select (arr!17069 a!3118) j!142)))))

(declare-fun b!565741 () Bool)

(declare-fun res!356845 () Bool)

(assert (=> b!565741 (=> (not res!356845) (not e!325611))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35539 (_ BitVec 32)) SeekEntryResult!5515)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565741 (= res!356845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17069 a!3118) j!142) mask!3119) (select (arr!17069 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17069 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17069 a!3118) i!1132 k0!1914) j!142) (array!35540 (store (arr!17069 a!3118) i!1132 k0!1914) (size!17434 a!3118)) mask!3119)))))

(assert (= (and start!51722 res!356843) b!565739))

(assert (= (and b!565739 res!356850) b!565740))

(assert (= (and b!565740 res!356848) b!565732))

(assert (= (and b!565732 res!356851) b!565737))

(assert (= (and b!565737 res!356844) b!565736))

(assert (= (and b!565736 res!356847) b!565735))

(assert (= (and b!565735 res!356846) b!565738))

(assert (= (and b!565738 res!356852) b!565741))

(assert (= (and b!565741 res!356845) b!565734))

(assert (= (and b!565734 res!356849) b!565733))

(declare-fun m!543803 () Bool)

(assert (=> b!565741 m!543803))

(declare-fun m!543805 () Bool)

(assert (=> b!565741 m!543805))

(assert (=> b!565741 m!543803))

(declare-fun m!543807 () Bool)

(assert (=> b!565741 m!543807))

(declare-fun m!543809 () Bool)

(assert (=> b!565741 m!543809))

(assert (=> b!565741 m!543807))

(declare-fun m!543811 () Bool)

(assert (=> b!565741 m!543811))

(assert (=> b!565741 m!543805))

(assert (=> b!565741 m!543803))

(declare-fun m!543813 () Bool)

(assert (=> b!565741 m!543813))

(declare-fun m!543815 () Bool)

(assert (=> b!565741 m!543815))

(assert (=> b!565741 m!543807))

(assert (=> b!565741 m!543809))

(declare-fun m!543817 () Bool)

(assert (=> b!565735 m!543817))

(declare-fun m!543819 () Bool)

(assert (=> b!565737 m!543819))

(declare-fun m!543821 () Bool)

(assert (=> start!51722 m!543821))

(declare-fun m!543823 () Bool)

(assert (=> start!51722 m!543823))

(assert (=> b!565740 m!543803))

(assert (=> b!565740 m!543803))

(declare-fun m!543825 () Bool)

(assert (=> b!565740 m!543825))

(declare-fun m!543827 () Bool)

(assert (=> b!565734 m!543827))

(declare-fun m!543829 () Bool)

(assert (=> b!565734 m!543829))

(assert (=> b!565733 m!543803))

(assert (=> b!565733 m!543803))

(declare-fun m!543831 () Bool)

(assert (=> b!565733 m!543831))

(declare-fun m!543833 () Bool)

(assert (=> b!565732 m!543833))

(declare-fun m!543835 () Bool)

(assert (=> b!565736 m!543835))

(declare-fun m!543837 () Bool)

(assert (=> b!565738 m!543837))

(check-sat (not b!565733) (not start!51722) (not b!565736) (not b!565737) (not b!565738) (not b!565734) (not b!565732) (not b!565741) (not b!565740) (not b!565735))
(check-sat)
