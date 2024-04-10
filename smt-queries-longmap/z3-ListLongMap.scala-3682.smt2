; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50710 () Bool)

(assert start!50710)

(declare-fun b!554577 () Bool)

(declare-fun res!346989 () Bool)

(declare-fun e!319755 () Bool)

(assert (=> b!554577 (=> (not res!346989) (not e!319755))))

(declare-datatypes ((array!34935 0))(
  ( (array!34936 (arr!16777 (Array (_ BitVec 32) (_ BitVec 64))) (size!17141 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34935)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34935 (_ BitVec 32)) Bool)

(assert (=> b!554577 (= res!346989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554578 () Bool)

(declare-fun res!346996 () Bool)

(declare-fun e!319753 () Bool)

(assert (=> b!554578 (=> (not res!346996) (not e!319753))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554578 (= res!346996 (and (= (size!17141 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17141 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17141 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554579 () Bool)

(declare-fun res!346992 () Bool)

(assert (=> b!554579 (=> (not res!346992) (not e!319753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554579 (= res!346992 (validKeyInArray!0 (select (arr!16777 a!3118) j!142)))))

(declare-fun res!346994 () Bool)

(assert (=> start!50710 (=> (not res!346994) (not e!319753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50710 (= res!346994 (validMask!0 mask!3119))))

(assert (=> start!50710 e!319753))

(assert (=> start!50710 true))

(declare-fun array_inv!12573 (array!34935) Bool)

(assert (=> start!50710 (array_inv!12573 a!3118)))

(declare-fun b!554580 () Bool)

(assert (=> b!554580 (= e!319753 e!319755)))

(declare-fun res!346995 () Bool)

(assert (=> b!554580 (=> (not res!346995) (not e!319755))))

(declare-datatypes ((SeekEntryResult!5226 0))(
  ( (MissingZero!5226 (index!23131 (_ BitVec 32))) (Found!5226 (index!23132 (_ BitVec 32))) (Intermediate!5226 (undefined!6038 Bool) (index!23133 (_ BitVec 32)) (x!52044 (_ BitVec 32))) (Undefined!5226) (MissingVacant!5226 (index!23134 (_ BitVec 32))) )
))
(declare-fun lt!251840 () SeekEntryResult!5226)

(assert (=> b!554580 (= res!346995 (or (= lt!251840 (MissingZero!5226 i!1132)) (= lt!251840 (MissingVacant!5226 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34935 (_ BitVec 32)) SeekEntryResult!5226)

(assert (=> b!554580 (= lt!251840 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554581 () Bool)

(declare-fun e!319754 () Bool)

(assert (=> b!554581 (= e!319754 (not true))))

(declare-fun lt!251842 () SeekEntryResult!5226)

(declare-fun lt!251843 () SeekEntryResult!5226)

(get-info :version)

(assert (=> b!554581 (and (= lt!251842 (Found!5226 j!142)) (or (undefined!6038 lt!251843) (not ((_ is Intermediate!5226) lt!251843)) (= (select (arr!16777 a!3118) (index!23133 lt!251843)) (select (arr!16777 a!3118) j!142)) (not (= (select (arr!16777 a!3118) (index!23133 lt!251843)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251842 (MissingZero!5226 (index!23133 lt!251843)))))))

(assert (=> b!554581 (= lt!251842 (seekEntryOrOpen!0 (select (arr!16777 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554581 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17226 0))(
  ( (Unit!17227) )
))
(declare-fun lt!251844 () Unit!17226)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17226)

(assert (=> b!554581 (= lt!251844 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554582 () Bool)

(declare-fun res!346997 () Bool)

(assert (=> b!554582 (=> (not res!346997) (not e!319753))))

(declare-fun arrayContainsKey!0 (array!34935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554582 (= res!346997 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554583 () Bool)

(declare-fun res!346990 () Bool)

(assert (=> b!554583 (=> (not res!346990) (not e!319755))))

(declare-datatypes ((List!10857 0))(
  ( (Nil!10854) (Cons!10853 (h!11838 (_ BitVec 64)) (t!17085 List!10857)) )
))
(declare-fun arrayNoDuplicates!0 (array!34935 (_ BitVec 32) List!10857) Bool)

(assert (=> b!554583 (= res!346990 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10854))))

(declare-fun b!554584 () Bool)

(declare-fun res!346993 () Bool)

(assert (=> b!554584 (=> (not res!346993) (not e!319753))))

(assert (=> b!554584 (= res!346993 (validKeyInArray!0 k0!1914))))

(declare-fun b!554585 () Bool)

(assert (=> b!554585 (= e!319755 e!319754)))

(declare-fun res!346991 () Bool)

(assert (=> b!554585 (=> (not res!346991) (not e!319754))))

(declare-fun lt!251841 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34935 (_ BitVec 32)) SeekEntryResult!5226)

(assert (=> b!554585 (= res!346991 (= lt!251843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251841 (select (store (arr!16777 a!3118) i!1132 k0!1914) j!142) (array!34936 (store (arr!16777 a!3118) i!1132 k0!1914) (size!17141 a!3118)) mask!3119)))))

(declare-fun lt!251845 () (_ BitVec 32))

(assert (=> b!554585 (= lt!251843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251845 (select (arr!16777 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554585 (= lt!251841 (toIndex!0 (select (store (arr!16777 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554585 (= lt!251845 (toIndex!0 (select (arr!16777 a!3118) j!142) mask!3119))))

(assert (= (and start!50710 res!346994) b!554578))

(assert (= (and b!554578 res!346996) b!554579))

(assert (= (and b!554579 res!346992) b!554584))

(assert (= (and b!554584 res!346993) b!554582))

(assert (= (and b!554582 res!346997) b!554580))

(assert (= (and b!554580 res!346995) b!554577))

(assert (= (and b!554577 res!346989) b!554583))

(assert (= (and b!554583 res!346990) b!554585))

(assert (= (and b!554585 res!346991) b!554581))

(declare-fun m!531911 () Bool)

(assert (=> b!554585 m!531911))

(declare-fun m!531913 () Bool)

(assert (=> b!554585 m!531913))

(assert (=> b!554585 m!531911))

(assert (=> b!554585 m!531911))

(declare-fun m!531915 () Bool)

(assert (=> b!554585 m!531915))

(declare-fun m!531917 () Bool)

(assert (=> b!554585 m!531917))

(declare-fun m!531919 () Bool)

(assert (=> b!554585 m!531919))

(declare-fun m!531921 () Bool)

(assert (=> b!554585 m!531921))

(assert (=> b!554585 m!531919))

(assert (=> b!554585 m!531919))

(declare-fun m!531923 () Bool)

(assert (=> b!554585 m!531923))

(declare-fun m!531925 () Bool)

(assert (=> b!554583 m!531925))

(declare-fun m!531927 () Bool)

(assert (=> b!554582 m!531927))

(declare-fun m!531929 () Bool)

(assert (=> start!50710 m!531929))

(declare-fun m!531931 () Bool)

(assert (=> start!50710 m!531931))

(declare-fun m!531933 () Bool)

(assert (=> b!554584 m!531933))

(declare-fun m!531935 () Bool)

(assert (=> b!554577 m!531935))

(declare-fun m!531937 () Bool)

(assert (=> b!554580 m!531937))

(assert (=> b!554581 m!531911))

(declare-fun m!531939 () Bool)

(assert (=> b!554581 m!531939))

(declare-fun m!531941 () Bool)

(assert (=> b!554581 m!531941))

(declare-fun m!531943 () Bool)

(assert (=> b!554581 m!531943))

(assert (=> b!554581 m!531911))

(declare-fun m!531945 () Bool)

(assert (=> b!554581 m!531945))

(assert (=> b!554579 m!531911))

(assert (=> b!554579 m!531911))

(declare-fun m!531947 () Bool)

(assert (=> b!554579 m!531947))

(check-sat (not b!554584) (not b!554581) (not b!554583) (not b!554579) (not start!50710) (not b!554577) (not b!554582) (not b!554585) (not b!554580))
(check-sat)
