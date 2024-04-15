; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52118 () Bool)

(assert start!52118)

(declare-fun b!568643 () Bool)

(declare-fun res!358809 () Bool)

(declare-fun e!327171 () Bool)

(assert (=> b!568643 (=> (not res!358809) (not e!327171))))

(declare-datatypes ((array!35650 0))(
  ( (array!35651 (arr!17117 (Array (_ BitVec 32) (_ BitVec 64))) (size!17482 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35650)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35650 (_ BitVec 32)) Bool)

(assert (=> b!568643 (= res!358809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!358811 () Bool)

(declare-fun e!327174 () Bool)

(assert (=> start!52118 (=> (not res!358811) (not e!327174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52118 (= res!358811 (validMask!0 mask!3119))))

(assert (=> start!52118 e!327174))

(assert (=> start!52118 true))

(declare-fun array_inv!13000 (array!35650) Bool)

(assert (=> start!52118 (array_inv!13000 a!3118)))

(declare-fun b!568644 () Bool)

(declare-fun res!358803 () Bool)

(assert (=> b!568644 (=> (not res!358803) (not e!327174))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568644 (= res!358803 (validKeyInArray!0 k0!1914))))

(declare-fun b!568645 () Bool)

(assert (=> b!568645 (= e!327174 e!327171)))

(declare-fun res!358810 () Bool)

(assert (=> b!568645 (=> (not res!358810) (not e!327171))))

(declare-datatypes ((SeekEntryResult!5563 0))(
  ( (MissingZero!5563 (index!24479 (_ BitVec 32))) (Found!5563 (index!24480 (_ BitVec 32))) (Intermediate!5563 (undefined!6375 Bool) (index!24481 (_ BitVec 32)) (x!53369 (_ BitVec 32))) (Undefined!5563) (MissingVacant!5563 (index!24482 (_ BitVec 32))) )
))
(declare-fun lt!258961 () SeekEntryResult!5563)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568645 (= res!358810 (or (= lt!258961 (MissingZero!5563 i!1132)) (= lt!258961 (MissingVacant!5563 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35650 (_ BitVec 32)) SeekEntryResult!5563)

(assert (=> b!568645 (= lt!258961 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568646 () Bool)

(declare-fun e!327172 () Bool)

(assert (=> b!568646 (= e!327171 e!327172)))

(declare-fun res!358806 () Bool)

(assert (=> b!568646 (=> (not res!358806) (not e!327172))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!258962 () SeekEntryResult!5563)

(declare-fun lt!258960 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35650 (_ BitVec 32)) SeekEntryResult!5563)

(assert (=> b!568646 (= res!358806 (= lt!258962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258960 (select (store (arr!17117 a!3118) i!1132 k0!1914) j!142) (array!35651 (store (arr!17117 a!3118) i!1132 k0!1914) (size!17482 a!3118)) mask!3119)))))

(declare-fun lt!258964 () (_ BitVec 32))

(assert (=> b!568646 (= lt!258962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258964 (select (arr!17117 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568646 (= lt!258960 (toIndex!0 (select (store (arr!17117 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568646 (= lt!258964 (toIndex!0 (select (arr!17117 a!3118) j!142) mask!3119))))

(declare-fun b!568647 () Bool)

(declare-fun res!358808 () Bool)

(assert (=> b!568647 (=> (not res!358808) (not e!327171))))

(declare-datatypes ((List!11236 0))(
  ( (Nil!11233) (Cons!11232 (h!12253 (_ BitVec 64)) (t!17455 List!11236)) )
))
(declare-fun arrayNoDuplicates!0 (array!35650 (_ BitVec 32) List!11236) Bool)

(assert (=> b!568647 (= res!358808 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11233))))

(declare-fun b!568648 () Bool)

(assert (=> b!568648 (= e!327172 (not true))))

(declare-fun lt!258963 () SeekEntryResult!5563)

(get-info :version)

(assert (=> b!568648 (and (= lt!258963 (Found!5563 j!142)) (or (undefined!6375 lt!258962) (not ((_ is Intermediate!5563) lt!258962)) (= (select (arr!17117 a!3118) (index!24481 lt!258962)) (select (arr!17117 a!3118) j!142)) (not (= (select (arr!17117 a!3118) (index!24481 lt!258962)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!258963 (MissingZero!5563 (index!24481 lt!258962)))))))

(assert (=> b!568648 (= lt!258963 (seekEntryOrOpen!0 (select (arr!17117 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568648 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17814 0))(
  ( (Unit!17815) )
))
(declare-fun lt!258959 () Unit!17814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17814)

(assert (=> b!568648 (= lt!258959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568649 () Bool)

(declare-fun res!358805 () Bool)

(assert (=> b!568649 (=> (not res!358805) (not e!327174))))

(assert (=> b!568649 (= res!358805 (validKeyInArray!0 (select (arr!17117 a!3118) j!142)))))

(declare-fun b!568650 () Bool)

(declare-fun res!358807 () Bool)

(assert (=> b!568650 (=> (not res!358807) (not e!327174))))

(declare-fun arrayContainsKey!0 (array!35650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568650 (= res!358807 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568651 () Bool)

(declare-fun res!358804 () Bool)

(assert (=> b!568651 (=> (not res!358804) (not e!327174))))

(assert (=> b!568651 (= res!358804 (and (= (size!17482 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17482 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17482 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52118 res!358811) b!568651))

(assert (= (and b!568651 res!358804) b!568649))

(assert (= (and b!568649 res!358805) b!568644))

(assert (= (and b!568644 res!358803) b!568650))

(assert (= (and b!568650 res!358807) b!568645))

(assert (= (and b!568645 res!358810) b!568643))

(assert (= (and b!568643 res!358809) b!568647))

(assert (= (and b!568647 res!358808) b!568646))

(assert (= (and b!568646 res!358806) b!568648))

(declare-fun m!546659 () Bool)

(assert (=> b!568646 m!546659))

(declare-fun m!546661 () Bool)

(assert (=> b!568646 m!546661))

(assert (=> b!568646 m!546659))

(declare-fun m!546663 () Bool)

(assert (=> b!568646 m!546663))

(declare-fun m!546665 () Bool)

(assert (=> b!568646 m!546665))

(assert (=> b!568646 m!546663))

(assert (=> b!568646 m!546659))

(declare-fun m!546667 () Bool)

(assert (=> b!568646 m!546667))

(declare-fun m!546669 () Bool)

(assert (=> b!568646 m!546669))

(assert (=> b!568646 m!546663))

(declare-fun m!546671 () Bool)

(assert (=> b!568646 m!546671))

(declare-fun m!546673 () Bool)

(assert (=> b!568643 m!546673))

(assert (=> b!568649 m!546659))

(assert (=> b!568649 m!546659))

(declare-fun m!546675 () Bool)

(assert (=> b!568649 m!546675))

(declare-fun m!546677 () Bool)

(assert (=> b!568644 m!546677))

(declare-fun m!546679 () Bool)

(assert (=> b!568647 m!546679))

(declare-fun m!546681 () Bool)

(assert (=> start!52118 m!546681))

(declare-fun m!546683 () Bool)

(assert (=> start!52118 m!546683))

(declare-fun m!546685 () Bool)

(assert (=> b!568645 m!546685))

(declare-fun m!546687 () Bool)

(assert (=> b!568650 m!546687))

(declare-fun m!546689 () Bool)

(assert (=> b!568648 m!546689))

(declare-fun m!546691 () Bool)

(assert (=> b!568648 m!546691))

(assert (=> b!568648 m!546659))

(declare-fun m!546693 () Bool)

(assert (=> b!568648 m!546693))

(declare-fun m!546695 () Bool)

(assert (=> b!568648 m!546695))

(assert (=> b!568648 m!546659))

(check-sat (not b!568647) (not b!568649) (not start!52118) (not b!568650) (not b!568646) (not b!568648) (not b!568645) (not b!568644) (not b!568643))
(check-sat)
