; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52312 () Bool)

(assert start!52312)

(declare-fun b!570952 () Bool)

(declare-fun res!360741 () Bool)

(declare-fun e!328368 () Bool)

(assert (=> b!570952 (=> (not res!360741) (not e!328368))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35772 0))(
  ( (array!35773 (arr!17176 (Array (_ BitVec 32) (_ BitVec 64))) (size!17540 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35772)

(assert (=> b!570952 (= res!360741 (and (= (size!17540 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17540 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17540 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570953 () Bool)

(declare-fun e!328364 () Bool)

(declare-fun e!328363 () Bool)

(assert (=> b!570953 (= e!328364 e!328363)))

(declare-fun res!360742 () Bool)

(assert (=> b!570953 (=> (not res!360742) (not e!328363))))

(declare-datatypes ((SeekEntryResult!5625 0))(
  ( (MissingZero!5625 (index!24727 (_ BitVec 32))) (Found!5625 (index!24728 (_ BitVec 32))) (Intermediate!5625 (undefined!6437 Bool) (index!24729 (_ BitVec 32)) (x!53597 (_ BitVec 32))) (Undefined!5625) (MissingVacant!5625 (index!24730 (_ BitVec 32))) )
))
(declare-fun lt!260313 () SeekEntryResult!5625)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!260314 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35772 (_ BitVec 32)) SeekEntryResult!5625)

(assert (=> b!570953 (= res!360742 (= lt!260313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260314 (select (store (arr!17176 a!3118) i!1132 k0!1914) j!142) (array!35773 (store (arr!17176 a!3118) i!1132 k0!1914) (size!17540 a!3118)) mask!3119)))))

(declare-fun lt!260317 () (_ BitVec 32))

(assert (=> b!570953 (= lt!260313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260317 (select (arr!17176 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570953 (= lt!260314 (toIndex!0 (select (store (arr!17176 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570953 (= lt!260317 (toIndex!0 (select (arr!17176 a!3118) j!142) mask!3119))))

(declare-fun b!570954 () Bool)

(declare-fun res!360740 () Bool)

(assert (=> b!570954 (=> (not res!360740) (not e!328368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570954 (= res!360740 (validKeyInArray!0 k0!1914))))

(declare-fun b!570955 () Bool)

(declare-fun res!360734 () Bool)

(assert (=> b!570955 (=> (not res!360734) (not e!328368))))

(assert (=> b!570955 (= res!360734 (validKeyInArray!0 (select (arr!17176 a!3118) j!142)))))

(declare-fun b!570956 () Bool)

(assert (=> b!570956 (= e!328368 e!328364)))

(declare-fun res!360733 () Bool)

(assert (=> b!570956 (=> (not res!360733) (not e!328364))))

(declare-fun lt!260316 () SeekEntryResult!5625)

(assert (=> b!570956 (= res!360733 (or (= lt!260316 (MissingZero!5625 i!1132)) (= lt!260316 (MissingVacant!5625 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35772 (_ BitVec 32)) SeekEntryResult!5625)

(assert (=> b!570956 (= lt!260316 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570957 () Bool)

(assert (=> b!570957 (= e!328363 (not true))))

(declare-fun e!328367 () Bool)

(assert (=> b!570957 e!328367))

(declare-fun res!360738 () Bool)

(assert (=> b!570957 (=> (not res!360738) (not e!328367))))

(declare-fun lt!260312 () SeekEntryResult!5625)

(assert (=> b!570957 (= res!360738 (= lt!260312 (Found!5625 j!142)))))

(assert (=> b!570957 (= lt!260312 (seekEntryOrOpen!0 (select (arr!17176 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35772 (_ BitVec 32)) Bool)

(assert (=> b!570957 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17952 0))(
  ( (Unit!17953) )
))
(declare-fun lt!260315 () Unit!17952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17952)

(assert (=> b!570957 (= lt!260315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570958 () Bool)

(declare-fun res!360739 () Bool)

(assert (=> b!570958 (=> (not res!360739) (not e!328368))))

(declare-fun arrayContainsKey!0 (array!35772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570958 (= res!360739 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!360743 () Bool)

(assert (=> start!52312 (=> (not res!360743) (not e!328368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52312 (= res!360743 (validMask!0 mask!3119))))

(assert (=> start!52312 e!328368))

(assert (=> start!52312 true))

(declare-fun array_inv!12972 (array!35772) Bool)

(assert (=> start!52312 (array_inv!12972 a!3118)))

(declare-fun b!570959 () Bool)

(declare-fun res!360735 () Bool)

(assert (=> b!570959 (=> (not res!360735) (not e!328364))))

(declare-datatypes ((List!11256 0))(
  ( (Nil!11253) (Cons!11252 (h!12276 (_ BitVec 64)) (t!17484 List!11256)) )
))
(declare-fun arrayNoDuplicates!0 (array!35772 (_ BitVec 32) List!11256) Bool)

(assert (=> b!570959 (= res!360735 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11253))))

(declare-fun b!570960 () Bool)

(declare-fun e!328366 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35772 (_ BitVec 32)) SeekEntryResult!5625)

(assert (=> b!570960 (= e!328366 (= lt!260312 (seekKeyOrZeroReturnVacant!0 (x!53597 lt!260313) (index!24729 lt!260313) (index!24729 lt!260313) (select (arr!17176 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570961 () Bool)

(assert (=> b!570961 (= e!328367 e!328366)))

(declare-fun res!360737 () Bool)

(assert (=> b!570961 (=> res!360737 e!328366)))

(get-info :version)

(assert (=> b!570961 (= res!360737 (or (undefined!6437 lt!260313) (not ((_ is Intermediate!5625) lt!260313)) (= (select (arr!17176 a!3118) (index!24729 lt!260313)) (select (arr!17176 a!3118) j!142)) (= (select (arr!17176 a!3118) (index!24729 lt!260313)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570962 () Bool)

(declare-fun res!360736 () Bool)

(assert (=> b!570962 (=> (not res!360736) (not e!328364))))

(assert (=> b!570962 (= res!360736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52312 res!360743) b!570952))

(assert (= (and b!570952 res!360741) b!570955))

(assert (= (and b!570955 res!360734) b!570954))

(assert (= (and b!570954 res!360740) b!570958))

(assert (= (and b!570958 res!360739) b!570956))

(assert (= (and b!570956 res!360733) b!570962))

(assert (= (and b!570962 res!360736) b!570959))

(assert (= (and b!570959 res!360735) b!570953))

(assert (= (and b!570953 res!360742) b!570957))

(assert (= (and b!570957 res!360738) b!570961))

(assert (= (and b!570961 (not res!360737)) b!570960))

(declare-fun m!549889 () Bool)

(assert (=> b!570962 m!549889))

(declare-fun m!549891 () Bool)

(assert (=> b!570960 m!549891))

(assert (=> b!570960 m!549891))

(declare-fun m!549893 () Bool)

(assert (=> b!570960 m!549893))

(declare-fun m!549895 () Bool)

(assert (=> b!570959 m!549895))

(assert (=> b!570953 m!549891))

(declare-fun m!549897 () Bool)

(assert (=> b!570953 m!549897))

(assert (=> b!570953 m!549891))

(declare-fun m!549899 () Bool)

(assert (=> b!570953 m!549899))

(assert (=> b!570953 m!549891))

(declare-fun m!549901 () Bool)

(assert (=> b!570953 m!549901))

(declare-fun m!549903 () Bool)

(assert (=> b!570953 m!549903))

(assert (=> b!570953 m!549901))

(declare-fun m!549905 () Bool)

(assert (=> b!570953 m!549905))

(assert (=> b!570953 m!549901))

(declare-fun m!549907 () Bool)

(assert (=> b!570953 m!549907))

(declare-fun m!549909 () Bool)

(assert (=> b!570954 m!549909))

(declare-fun m!549911 () Bool)

(assert (=> b!570958 m!549911))

(assert (=> b!570957 m!549891))

(assert (=> b!570957 m!549891))

(declare-fun m!549913 () Bool)

(assert (=> b!570957 m!549913))

(declare-fun m!549915 () Bool)

(assert (=> b!570957 m!549915))

(declare-fun m!549917 () Bool)

(assert (=> b!570957 m!549917))

(declare-fun m!549919 () Bool)

(assert (=> b!570956 m!549919))

(assert (=> b!570955 m!549891))

(assert (=> b!570955 m!549891))

(declare-fun m!549921 () Bool)

(assert (=> b!570955 m!549921))

(declare-fun m!549923 () Bool)

(assert (=> b!570961 m!549923))

(assert (=> b!570961 m!549891))

(declare-fun m!549925 () Bool)

(assert (=> start!52312 m!549925))

(declare-fun m!549927 () Bool)

(assert (=> start!52312 m!549927))

(check-sat (not b!570962) (not b!570959) (not b!570953) (not b!570956) (not b!570957) (not b!570954) (not start!52312) (not b!570960) (not b!570958) (not b!570955))
(check-sat)
